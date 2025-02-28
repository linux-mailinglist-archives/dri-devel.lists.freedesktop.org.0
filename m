Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A1A49996
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463C810EC88;
	Fri, 28 Feb 2025 12:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="36IVy9jQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA74C10E2A8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:40:15 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-43ba50406fbso12847505e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740746414; x=1741351214;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=G+5gHFsUk/zR3QwRdy/hSALMqHlURbjWQTJYZwElRBw=;
 b=36IVy9jQOidMvxIECBVdsqTaB+9G0K6MFFNLjMB93xLFnCOf/Bh8/TPOepdUpya+Vv
 kt+ajBWuMKnVjFPPYdZsSU7Gyl/lcBPRZQZZbuwp0Qdhh1BVfFt12g0dEVlWOFkxwEHR
 yugCPYZpeGr2+SxQFdpJ2PUXPMLC/y2zAgL2aNJp78r1QNa06CuSeXsklFPRFxuxdNgj
 xkR/855MJ91QiXMyxPsQZa+ZDy1RPdvlY6ctDETVyZCYUsj0bQ2aNsV0D3G14N7jCX2e
 HeVmSijcsMxj9VLi0QU2/KunA0epoxD4o5c9WgSj+710ThpxKeM8UEr2D4Ff952hfC+V
 nMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740746414; x=1741351214;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G+5gHFsUk/zR3QwRdy/hSALMqHlURbjWQTJYZwElRBw=;
 b=O0YkGI/p8WHARyWvSacC28YS1y6IRIlGxtLiQEZwzs3E/0rMfLUsxdTwmusEx7rl3s
 RFn6VaQ+xDeQTariUV4tPM1qOC9I3O86JUQK8tQFIKoqbP+P+zWE59pY0yjkW+8SWZ7j
 mnn27F2JGBkWv9NmzM9bveT/bLLPGgL9Lvc6TqwS6h9tKzP5bAmwrg/0TO5c1i4urQj3
 CgkCmd/SY7ZOp2TJFOVjXIzc/u15t4MzzzrIn+fyWdq+YImVosFonBpOO2HWElQoEMSn
 mfBL9PsQMmWY506pAdLqsRz0ea8RZV6yrBNZroKsuUcWZrMX5Rcxl5JkN8gmk69VZigI
 UEiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXPDbj9t9PCFfeiT5DBurY7QSeRNYw+V+jC2Y0cCvIAyxqxZpQ/FeUSAYobbn9e6SuqguOD+shs5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr2xT+u5yaYTIxWQpxVZWzctxaLWWClptmJakfmRAEpubLhPj6
 2VydPvidgQGBMY0uGNn6/KmX4R64HmJ3f2/ZaYwCw1wjWuiMgqMtp0sQwFphGz7ztrOWG1VbE15
 dYucq5DlC/c5h6A==
X-Google-Smtp-Source: AGHT+IHbIphIQcEXilOr7Ntw6WaNAr5phX1XmvUcyGqxwt+X3Cd6rOdQsMiRHilLofVXJl6ZHWfjzIcpQ0HSDVU=
X-Received: from wmcn18-n1.prod.google.com
 ([2002:a05:600c:c0d2:10b0:436:fdb2:fa5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3507:b0:439:3d5c:8c19 with SMTP id
 5b1f17b1804b1-43ba674c911mr25914985e9.24.1740746414470; 
 Fri, 28 Feb 2025 04:40:14 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:33 +0000
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
Mime-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=r7jgVsiiJzFKABmvsoHtJDihUf1aN5aOfGCQnlUXLR8=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwa6iZBH4LXAf1My/2Bb4bMU2tOy+URmQaqy+I
 0YgolPCIOyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8GuogAKCRAEWL7uWMY5
 RntsEAC4uGdMp+3gOxWauz1JDyiZzR/Atujxvqo0jIjAoxK2HzkZY9QWUrC7RzFUKejI9Kba7dK
 6I3yW8hwYThfVdITfDRhoegt/cJ4p/rBCktrQ/bDhIz0Gtg8Je8371Rg+tfgNJW15cdXD4eWKBf
 UUPBZLV/CtFQyCyhALtXPzhVfZrWxTqko8eE5bZP7rDrNZcPCUqqdGmYDLf2uyuSUkeW/L139bb
 DZqLXQ8oIjoGwuT6lvqTCQtZiBc9csEB0JKTywoJAO96QK8BmySRWsEBoBsBeoL5wUWrfk3Vd9b
 SSMMVT8XIJqKL/DxtvnppRQWiXZbdRaTaNVmh4hFbeOKPp9W2mbYaLlkXBqX/rRrYoOBE1jYoD7
 n6MAIRSn4PoKhXOjfHr2ZqZFlEqrVpbZ33bzuIFnXnA0kzjTyO5QCwUIXghkuHdS6FjHa+yaAtV
 M2OIf2DAn0roOnGvIAu8HKCa/RY2fc7oItuhyF727kP4bWhnRUpm+0vi4O5Sdveq0W77yQgQS2B
 hqWpZba4ARnFFAT0uSS+CpMVdFPYwqhpREFLcw7qXmfVWTUYcjEMYxnrHoHf7qqtOhKE4Vc3QSS
 aCIyd8EwbEPwOybRVuVFiJMrTqtMEI+50Fm7LZ5wFZLOOevDJSvKQbuJlzgVE+zHoTuJxhz0ijN
 QgT9cliZsSNsMag==
X-Mailer: b4 0.14.1
Message-ID: <20250228-export-macro-v2-4-569cc7e8926c@google.com>
Subject: [PATCH v2 4/5] print: use new #[export] macro for rust_fmt_argument
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

This moves the rust_fmt_argument function over to use the new #[export]
macro, which will verify at compile-time that the function signature
matches what is in the header file.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
I'm not sure which header file to put this in. Any advice?
---
 include/linux/sprintf.h | 3 +++
 lib/vsprintf.c          | 3 ---
 rust/kernel/print.rs    | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
index 33dcbec71925..029ad83efd74 100644
--- a/include/linux/sprintf.h
+++ b/include/linux/sprintf.h
@@ -24,4 +24,7 @@ __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
 extern bool no_hash_pointers;
 int no_hash_pointers_enable(char *str);
 
+/* Used for Rust formatting ('%pA'). */
+char *rust_fmt_argument(char *buf, char *end, const void *ptr);
+
 #endif	/* _LINUX_KERNEL_SPRINTF_H */
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a8ac4c4fffcf..1da61c3e011f 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2284,9 +2284,6 @@ int __init no_hash_pointers_enable(char *str)
 }
 early_param("no_hash_pointers", no_hash_pointers_enable);
 
-/* Used for Rust formatting ('%pA'). */
-char *rust_fmt_argument(char *buf, char *end, const void *ptr);
-
 /*
  * Show a '%p' thing.  A kernel extension is that the '%p' is followed
  * by an extra set of alphanumeric characters that are extended format
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 61ee36c5e5f5..cf4714242e14 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -8,13 +8,14 @@
 
 use crate::{
     ffi::{c_char, c_void},
+    prelude::*,
     str::RawFormatter,
 };
 use core::fmt;
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]
-#[no_mangle]
+#[export]
 unsafe extern "C" fn rust_fmt_argument(
     buf: *mut c_char,
     end: *mut c_char,

-- 
2.48.1.711.g2feabab25a-goog

