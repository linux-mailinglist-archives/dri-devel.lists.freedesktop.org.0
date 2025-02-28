Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2ADA49993
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E9F10EC8D;
	Fri, 28 Feb 2025 12:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SkLdAA40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5047210EC91
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:40:09 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-38f3bac2944so975159f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740746408; x=1741351208;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7pofL3PjyOttZbsi+AAPKYxkRFtjnFNjm+r6OKyU3Jc=;
 b=SkLdAA40S81OLjTzIMjMEJxvKl7Y93VzRR76im1+uU37QlDya/K5Y6P2Uokq1/Kszk
 VJZ8SEd8ycgq3Cv7TKp73ygJ/HpJGKwqpSzZMZieTOWhH0zUgzowqz38fLbv+1z/4+1Q
 dCCtn7XVpbyeaj8wfSuaBJv6KkdT7jXgYg25TGSkQgQz0iyPzMv5ozExW4AVDd0xVINr
 2Mktp4T9+kmQ3b6f11BAaYT9JwoijTO0hW0vh59UrZRYCe3YMnB8WMm4FsT9xCcyABfJ
 fB1fjYR6X+0fAbrcluFcQCeFgjZh01KH891uG/U0M1m5X4uMp0AfY492DvUDelKUFrTS
 ktxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740746408; x=1741351208;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7pofL3PjyOttZbsi+AAPKYxkRFtjnFNjm+r6OKyU3Jc=;
 b=Je8MOPT9Hs9uhuRskUpkf9MHH0QFjezdKQUA7QYPQUxoq2vDhKz1QbT8vslK4f5Xzt
 qOiYY2Qftex6tyQ6sDSqlRovf0LwzbffxvXAmRXJ77VBKYGthRdYZaGA/vXqD60nM9W0
 M1BAWmmViZkOH2MqltqYjBbJhY7Yu0626k7NKIp1HE1+2qiSIxtvkjO38Pg1+wFy3G18
 T4CsVl/Ggodkn1Ev2/by+wbGe67HGn28WEEvxJlDvq5ZZfTTTgwhKxDrGfqftp/ULaMl
 maDMls8TUq1vkjmd4k2PNFuzkI1knjvqc6VJZsSOp9PJvhMV+P5QFh3MtOzxRmwdK+y7
 7vbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/AFf4iu8MDpY2dy+/EkG9yXHsj3wBmuPdys28WSBIsb2pMdmaNbD4zjB4QfyIbRjeIgnrRsmXRIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLuvJT9nhI73NtQG9vfc9Dme+S3/TNF55Fm/j45SW2N9fRRK4W
 l5RiZ3x3E85sxO2oqQzlhXPypSL0DkifgyviYVz7XFK167s3VF+volOzTvtxjItJdghQ1VrYgfe
 Bx1EuJLoI/z6CRA==
X-Google-Smtp-Source: AGHT+IEB4CLEaJ+qcbV7KVAUJWH8lLFxAEU0yznQEm575/JtfTpZwy4AyFvnI6lctCz2coNH3yp6bCwEPD/9KY0=
X-Received: from wmbgx24.prod.google.com
 ([2002:a05:600c:8598:b0:439:4366:35c2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c8:0:b0:38f:452f:9fa9 with SMTP id
 ffacd0b85a97d-390ec7c999fmr2855371f8f.2.1740746407926; 
 Fri, 28 Feb 2025 04:40:07 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:30 +0000
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
Mime-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2129; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=ZcOD6O+e4opbd5kCSvi62otmJFeNmwXLjRXcW+if/rs=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwa6gD60PImwfkkxa2KFpiXq9/w2BWpeDHAYuF
 HY9+9v6Jo6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8GuoAAKCRAEWL7uWMY5
 RlA/D/4xOjjAKDHvotub7uSZH7J7bXp09wrMC83XiONmJ8ooDIBNM40VRIhnD9fsRBHxwRlyWJ2
 Kwti5p3Z3nl4+yLiulPukfaUxTp/Rb3vmImVzX+bcZj4my8iKDQzyA36aQssqbbtH1noQHBC+pG
 Lk4eSHE+kem98SXqPQ6mM+++r5oFHZp7XmddA4VFXjm/RNWheJCcVxddh4pIZaFR0gkCzgKjaoM
 F6ebM3hEUH3i4mk3LT+89cVLV6pUlQ0YeFPIpDmLySdH6qOzv7RPYzVc7D5opfVFo2OkzvUJqah
 eeWLqrufXB1afblwaqI3xSx40Hde+wthgNEmd+wHFJTCM45s+KJNs9q885dspBKBRJSk9qH1qJM
 GM3BDXno6f4+/IlcpjoDqhJxZJiaqLhn6UKP1JRg+YNjvxvmtbaE9zquS5W/zJkF7mr4OvHYzT4
 JTQs3MmMxVtWLjEIpqFUz1sbZFuW1u7QTDUE2xVEtjdupnXBP+dP+geMGIOMK2kHtQOV86Ez2IQ
 OTdEASyuSSy95MldW9457o32AKMWM4/K1TZUlf3XITFOlxrXHn2dzoo6DNZDHS2RejEWdc6kYIU
 UK+N55oBRhryIBOLjNK8l9oNxn+vZ23Bi+oiULFoeSfygjizwNEEZQlxlAhrzXdN3SAlL6I5xNe
 KMISLLVgrNS99XA==
X-Mailer: b4 0.14.1
Message-ID: <20250228-export-macro-v2-1-569cc7e8926c@google.com>
Subject: [PATCH v2 1/5] rust: fix signature of rust_fmt_argument
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

To fix this, change the void pointer argument to use a const pointer,
and change the imports to use crate::ffi instead of core::ffi for
integer types.

Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
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

