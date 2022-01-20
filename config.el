;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "xyyuhans"
      user-mail-address "xyyuhans@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/home/xyyuhans/SynologyDrive/documents/orgmode")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; config

;; disable exit promet
;; https://github.com/hlissner/doom-emacs/issues/2688
(setq confirm-kill-emacs nil)

;; auto revert
(global-auto-revert-mode t)

;; auto save mode
(setq auto-save-visited-interval 60)
(auto-save-visited-mode)

(use-package! cnfonts
  :config
  (cnfonts-mode 1))

(use-package! org-wild-notifier
  :custom
  (org-wild-notifier-alert-time '(0))
  (org-wild-notifier-keyword-whitelist nil)
  :config
  (org-wild-notifier-mode)
  (setq alert-default-style 'libnotify))

(use-package! org-noter
  :custom
  (org-noter-doc-split-fraction '(0.65 . 0.5))
  :config
  (setq-default org-noter-separate-notes-from-heading nil))

(use-package! nov
  :custom
  ;; copy text without truncate
  (nov-text-width t)
  :config
  ;; open epub in this mode
  ;; https://depp.brause.cc/nov.el/
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package! pdf-tools
  :config
  (setq-default pdf-view-display-size 'fit-width))

(use-package! org-anki
  :config
  (customize-set-variable 'org-anki-default-deck "new"))

(use-package! org-journal
  :config
  (setq org-journal-time-prefix "** TODO "))

(use-package! org-super-agenda
  :config
  (org-super-agenda-mode)
  ;; https://github.com/alphapapa/org-super-agenda/issues/187
  (setq org-super-agenda-groups
        `(
          (:name "本日"
           :time-grid t
           :scheduled today
           :deadline (before ,(org-read-date nil nil "+2d"))
           :order 0
           )
          (:auto-category t)
          )))

(use-package! org-agenda
  :after org
  :config
  (setq org-agenda-span 'day)
  (setq org-agenda-start-day nil)
  (setq org-agenda-files '("/home/xyyuhans/SynologyDrive/documents/orgmode" "/home/xyyuhans/SynologyDrive/documents/orgmode/routine"))
  (setq org-todo-repeat-to-state "LOOP"))
