;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zac Ioannidis"
      user-mail-address "zacoppotamus@gmail.com")

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
;;       doom-variable-pitch-font ( :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-moonlight)
(setq doom-font (font-spec :family "Source Code Pro for Powerline" :size 13))

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/"
      org-journal-file-type 'weekly
      org-journal-file-format "%Y-%m-%d.org"
      org-journal-enable-agenda-integration t
      org-archive-location (concat org-directory ".archive/%s::")
      org-log-done 'time
      org-roam-directory (concat org-directory "notes/")
      org-roam-graph-executable "/usr/local/bin/dot"
      org-roam-graph-viewer nil)


(after! org
  (require 'org-tempo))
;; (add-to-list 'org-agenda-files org-journal-dir)


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


(add-hook 'elisp-mode 'parinfer-mode-enable)
(add-hook 'js-mode-hook 'js2-minor-mode)

;; (defun my/use-prettier-if-in-node-modules ()
;;   "Use prettier-js-mode if prettier is found in this file's
;; project's node_modules. Use the prettier binary from this
;; project."
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (prettier (and root
;;                         (expand-file-name "node_modules/prettier/bin-prettier.js"
;;                                           root))))
;;     (when (and prettier (file-executable-p prettier))
;;       (setq prettier-js-command prettier)
;;       (prettier-js-mode))))

;; (when (require 'prettier-js nil t)
;;   (make-variable-buffer-local 'prettier-js-command)
;;   (add-hook 'js2-mode-hook #'my/use-prettier-if-in-node-modules))


(display-battery-mode 1)

;; Scroll one line at a time
;; From: https://www.emacswiki.org/emacs/SmoothScrolling
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; scroll just enough to make point/cursor visible when it goes past start or end of visible area in buffer
(setq scroll-conservatively 101)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (treemacs-resize-icons 12)
;; (treemacs-set-width 28)

;; Vanish title bars, etc.
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (toggle-frame-fullscreen)
