Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B521EA48606
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F096710EB41;
	Thu, 27 Feb 2025 17:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uIZ5Becu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB95510EB41
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:02:41 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-439a5c4dfb2so6046855e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740675760; x=1741280560;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uyTw/awpQ2b8W4zrJVV8H3S2MlbDfUjPlgXrev/cyno=;
 b=uIZ5BecuP/WqOEWvs/mzlRgMbYKo0vCrFKMDz9FOVN3bzrH+c07wb+hIf/Xd2/JaA6
 fdNj9GaNn2pTHvuqH5h+i6HSlfGnx/eBCRCeLyGsCBTS6YcxhMtAKWUvECidjffhqRYJ
 PNwdVOahDqQsroAKZV3+SSM5T6E+7iYPdGHJEASSb2TU7cypw2/zZSIk2cSJ3qgLSFR6
 RXZvjVFbxsMFmDzY3NdWj/hXm6sBI8EaJB3uB06g3Pwr5NxLcufEYom3Dh6Z08j53YR1
 gD/X7sancnAI1MbD6WxeDkst9k43kZvmo+/FfSyvRgJKyXaoTroLQKboB6ITCWvyfy2C
 Uzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675760; x=1741280560;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uyTw/awpQ2b8W4zrJVV8H3S2MlbDfUjPlgXrev/cyno=;
 b=raH44L+Enkn2KGpgAGQsAlHk7Tpsa1F6dZSSEHtP2EbuHnx/omsJMzO4eGpa8nlRPW
 nQ2eu63mxmeJPFNFwn6n1/Stipoi2FXjVwoZRO9ZBqytKotro+BMDCrKlDak7/qD7i0D
 X8kcVLTJ2xDIckWbfIwNDpgEW6Q+xvvkYcecCwGoe+xWX9DEdF2bNlo4jvlJfr+YiNgG
 N0q47LCERRGWgyRubtoEHUsJPs0oDUmsfR3Rvus0JrbAI8h9VFDTo4hl9TKOF2yROuHx
 q08FSVSmwpg5OupEySvcBFg8vp29E9TV211BuIDYD8kGPxUUuj/U0DuSiGjOR+jn8+TP
 Z1NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0pf8qN2curBkqdWjYhudVna6JXPu7Qi+39bY5F8pdKNt1d81IPtan4RBUwSTMMPAvamLiBJ10JGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY2Bmbag0KMlDIkj6rSpbyORT8P+m5cWJqaffrJA3bL3AlRm4y
 gsqqxBY6TGxJGYjOO1J7AqRd4lD2p/5BQ9k2Tn3xnzjTFqYLy70ybx9j0avl/w1/xMH18Y8BphH
 eZ5SHlnoxqUuO1Q==
X-Google-Smtp-Source: AGHT+IETYd45wqLlFSGYfA2r23+tMfJyS7mFkY2/XSj51L1vJ2+M6lbfKeR3YEjy5LaJ4YSnfFn0fdn05icFoqY=
X-Received: from wmbez4.prod.google.com ([2002:a05:600c:83c4:b0:439:8ada:836c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0d:b0:439:98ca:e3a4 with SMTP id
 5b1f17b1804b1-43ab90169d5mr68313845e9.19.1740675760403; 
 Thu, 27 Feb 2025 09:02:40 -0800 (PST)
Date: Thu, 27 Feb 2025 17:01:59 +0000
In-Reply-To: <20250227-export-macro-v1-0-948775fc37aa@google.com>
Mime-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=DX4aj6g1+3gi1MzmclI/m0bUFCVi048l6tZnNSfBMrY=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwJqpf2Qi8QLFv2OSIJifmJDT7I63pnqPsJGib
 8/RB4+fSH+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8CaqQAKCRAEWL7uWMY5
 Rud9D/9PV7zhQlnXuqvTuDYGJ1Hq8bZynWlH6JAsl8T6q78NM8tFf5f6hi8fs8YgHDZK0PJiCHC
 WFUgxUIf4kpzyTV/hwu4KMggH5sRMnfmNFzQJEFjtB0AZZ99shzceswR+Yl3R6TDvrpPwZhOvBT
 s70bBkW9mkmsR9TLjEzaNDIWkjRUNcQ30JvAlTV1Vqn1Cx4b2q44eSW0Xi5aiwIgSEoroVHbOkL
 rYLzkF7iB+HEQ5C2POOf0D9IJVunNMhgVfr6d5BavKOsvsBU4JacOybGeg7N8VxFkHuMjwZrnN8
 Pu6NZWIaCE895cyrJIV+31NFb0HUZveAlqUsDaPFcqRXmqr9ZcAv1PllPbVFFDNtmtcJIiEg2Uy
 rKoO3uzNVjtvZev2qj3Sh8/C7xiR7uG53F1Vbgd+o36WLOG9yZ9ZwVu9LBTVMvbMk2ZPkyi+qgA
 LrrdvpoXtFSGM0Um9Dt+segnzH+EaQW0JLjKaEWUKHVOQFmj0hmKrBEj5QS4XMw2I7tVr4OtbTz
 fbrNsz2bIYOgwq6R8lakVGZt8txCmiAUYVuAkaJIjNnVLMNOyONgwYN8wNIA+IZ4jN6pOQhIjGv
 L/DlXoYP5ctDsboWl+CIK9STl/jyLn06rIexpwkPOed5fEIGAPcZQKEMKh7b0GxYFZLYR5gWkaK
 n/NrKkkl0ayaLTg==
X-Mailer: b4 0.14.1
Message-ID: <20250227-export-macro-v1-1-948775fc37aa@google.com>
Subject: [PATCH 1/4] rust: fix signature of rust_fmt_argument
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without this change, the rest of this series will emit the following
error message:

error[E0308]: `if` and `else` have incompatible types
  --> <linux>/rust/kernel/print.rs:22:22
   |
21 | #[export]
   | --------- expected because of this
22 | unsafe extern "C" fn rust_fmt_argument(
   |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
   |
   = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
              found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`

The error may be different depending on the architecture.

Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 lib/vsprintf.c       | 2 +-
 rust/kernel/print.rs | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319292..a8ac4c4fffcf 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2285,7 +2285,7 @@ int __init no_hash_pointers_enable(char *str)
 early_param("no_hash_pointers", no_hash_pointers_enable);
 
 /* Used for Rust formatting ('%pA'). */
-char *rust_fmt_argument(char *buf, char *end, void *ptr);
+char *rust_fmt_argument(char *buf, char *end, const void *ptr);
 
 /*
  * Show a '%p' thing.  A kernel extension is that the '%p' is followed
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index b19ee490be58..8551631dedf1 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -6,13 +6,13 @@
 //!
 //! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
 
-use core::{
+use core::fmt;
+
+use crate::{
     ffi::{c_char, c_void},
-    fmt,
+    str::RawFormatter,
 };
 
-use crate::str::RawFormatter;
-
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]
 #[no_mangle]

-- 
2.48.1.658.g4767266eb4-goog

