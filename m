Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA42A4B9AF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339FE10E367;
	Mon,  3 Mar 2025 08:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mbhdAvfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843E610E367
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:45:50 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-43ba50406fbso28470335e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740991549; x=1741596349;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Uszf9jNzimaGC7A+MjcMbFfOoksGjtwuorOL4my3lD8=;
 b=mbhdAvfseQVtVaRYw4eAFHXiV8Y1KC6t6ic/e8QfPanVV46tk/RHfPq2jc/9Gzj04h
 6F+utpfwaudPFQYPPgMFbuMzHM1Dm7PpXh2Gs/on0w/biNznfKoinjc0g2Y8so6Khooc
 jbCFyPzQ4oGPj38iaw4mExqebjajQxT73NxRxDordsHxhZ8w5J67D7p/m+6lI5QWoWwq
 tTNzLEUDQfWxQ+8PiqgxbdMcj4HrxX3Kyc9kGhlgLJ4+yICm5eSdQ1Lj+VJTGrLbWmVV
 Sb8UcfES+Kdgt6f2Li5Tp6mtzDPbIFzpwpiFGzcc1GQTPNICqV6K/IZYuRsIK18COhhA
 wTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740991549; x=1741596349;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uszf9jNzimaGC7A+MjcMbFfOoksGjtwuorOL4my3lD8=;
 b=asq1HQVrysMsLvXDoKWk9tDrL9L9KlyCcC8nMSW/BIDVGhEotbCG4cVL5nFMSijvgq
 kViPdGA3kNH95UifJq3t4dGXgYl2INlBJ/LpBdILNwhNeN2rTjXDi45X9XBu7AAdcm/n
 bSatHsFP+KZc+1/1MenbInUL6CmuzXSHd8iRHFuwmdc4QzaUK+MxNXxRZwx3FUiRmHRd
 x+266ToHzE5yVuuQ5lISUQ7tk1UfmxyEMinmzo7Wd5vx0hLu/u1GR5xIi+XRsv7rh1e5
 orazm5EpBhEMwGBcl6JgXFi140+dqINbYjjy5Ajd54a5OU1nZQ00+WddIRGoJyf7w9eH
 E9vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJiYloId+Bu/s8hWxSdGSLJvZXJVD6D8LU0OzLZN+n9+Szlf2+oFkycH1ZgO3nMiFAZA4gWD7vNKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpd2Orxv01TpvgDdgTHcZlurKd7+WXuZRrT099vi/xtF8RAy+c
 JT4dXdFUf1H/diWRa4gkuBY9ZswePQV4Rqg2oxUNBGEsVi7z2Ff/qSEto1onEuJUFDKKBXp2wC8
 V9yyWNynm+yRmWg==
X-Google-Smtp-Source: AGHT+IECCbQDp007YY5H9TzV4VTf2BNZ8iJKkXWl3w/rGfL/ku4+FSGRABIL2DQ9M+TCDMAM8FaLElccEauucog=
X-Received: from wmpz20.prod.google.com ([2002:a05:600c:a14:b0:439:80fc:8bce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ca8:b0:439:9424:1b70 with SMTP id
 5b1f17b1804b1-43ba675caafmr134644415e9.30.1740991549163; 
 Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Date: Mon, 03 Mar 2025 08:45:12 +0000
In-Reply-To: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
Mime-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=rXOlJP2KwbZg6HLcbrBJs+P0GV/Go4oAq5PQVguOe0Q=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxWw0XCXyKCpx73jSQ2riTrt89M1w4DSLnlZ1+
 Cb235TozJGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8VsNAAKCRAEWL7uWMY5
 RgRRD/9PrC+8ReqGY3MVcspxlBxm4PzYImTmwadXxvv6K8NDFtqSgszoxEfNsDJXIFFzYRHYa+N
 mJdl98HU7r6JRSNL6VV/+oRKhnoHhYbIAna1gFnE/RYTvvWwyUeyO/3CFv7nowjzYM2AnjxOWtM
 OOmg43zFRY6b/s1XnuR8F/qR30rygGjeSdK7pbE+PygOwoeoXMLh7Yr/UQ0him2uoJXBP0F/4Jt
 NhUEJHPhJV2Uts4nr2e42HpL35fnn8SH+eaBo+nrTG3wXgOEK3ItExaFsD8x6eYCRN9tONisJjH
 xBz+9+5gzepyskX2bOZ0ZhqRPhCSdiZBHxPdJAqs30uzVl7n2MQW5GzBrqu06sCxQ3iY4km60MC
 QkK3CQsguGeSvbMPuYpoIKd+Ld7jxqM27Pe8XJHI2H+nVz+/C5Ps7rZriN2QV4HCqc93vLTtGpB
 bfT33fQo4J5G/ediSmFwtU9NbUEyDlI3/LNY8azVt58TysT3PPWfLU/jtyifkjgDeFs1Tzwlv58
 AoTz7LeIRR8/ZK/Y4q/Nq9NF8+vnZf9gm4eXxu81s7bnfqXUiKc/+UoLzwpoBElajRnbah8+nQ/
 6A9eT6t+gCWE1hGbbP3vLG1gJgVICGT/4nZEhu8Ujark/AVtP1xoIh0B/sjLHEAQDPC8Rc5IGkh
 NtML/q9eIA2gOFg==
X-Mailer: b4 0.14.1
Message-ID: <20250303-export-macro-v3-1-41fbad85a27f@google.com>
Subject: [PATCH v3 1/5] rust: fix signature of rust_fmt_argument
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
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alice Ryhl <aliceryhl@google.com>
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

To fix this, change the void pointer argument to use a const pointer,
and change the imports to use crate::ffi instead of core::ffi for
integer types.

Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 lib/vsprintf.c       | 2 +-
 rust/kernel/print.rs | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

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
index b19ee490be58..61ee36c5e5f5 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -6,12 +6,11 @@
 //!
 //! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
 
-use core::{
+use crate::{
     ffi::{c_char, c_void},
-    fmt,
+    str::RawFormatter,
 };
-
-use crate::str::RawFormatter;
+use core::fmt;
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]

-- 
2.48.1.711.g2feabab25a-goog

