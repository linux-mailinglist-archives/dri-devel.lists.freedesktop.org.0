Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD56A4860A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B2910EB46;
	Thu, 27 Feb 2025 17:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="06s7lNKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022F410EB43
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:02:45 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-438da39bb69so8444165e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740675764; x=1741280564;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=M18jgxT7tnSkTmh7oE3ekKDBcrX1GdNxU2BvtBQtbPI=;
 b=06s7lNKqmEJIzqm1oq5gwRRM9tqte9wrKkX5AIlr1mpTMx2hDbHWLcFJaE/ldtp/D2
 f3NXustLThbD69GIvxCrXA+RexgbYIQEcoZLfgZuvNlfTdwki/CvzJ54p0Q1EiHGtThI
 hgekYU0t8+1gb/GmcDLrDsDHQnYDfVOkK6UD5MgFHPQGt2MCbwUQHYXQO2fRHRwbG+SU
 KWnEk9GjHCDKqetN0mGbDrQPY7w88ERF8aPHRIaF4Jqf85mr0QzisqakNUimPhQD3zza
 fpdfWk3Ciw3jY6wg7+T3qnmvjlmPyN+FF1lB5VXvHkKWW5686pv24p81eHXnfjOtvqRc
 K/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675764; x=1741280564;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M18jgxT7tnSkTmh7oE3ekKDBcrX1GdNxU2BvtBQtbPI=;
 b=HNsHLMlYh0oBxUMXIdptPg3WqYg7g9wx9WtQDGtopmYIVw/+N1Ta2TYrBkhfocMU7O
 UiE2QFgflx5yhd4n3DdiGrVO1LY8sL69buNPcfTBOlw+SGrWRm/10tmQ6WTAt9U8gROJ
 TCSWgHZlciLxRRBEcg0Fj8I7lIAK+wnKacjQeOxf6RwV3UUryr8peW5zHaLSLcq6fQC2
 zoS5GGNp83zmidM8SXePBnOzzMUdGLD9L6x3t7dP8byrBRcosXIxHc3m1x66NrAD1+1c
 k7nFlUFRamRcnhtA+2OK7xXuiqU7CAC/nO/VumKgbhImH1CVGDK0Uu6kfPYv+2Gi67aN
 H6Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEvmG9ezMKAqL7GfLpYxYa4y9ZgpMsUovYzwziD2Vm7ddVjzcp7pgSObwfaYoyudH/i3zEHBpvkJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoJwwsCqsjfkoXYmW9PV1LfzjaXjmCuochMDLFFaFUtRUE8Bcn
 98I1yL2UuBvzPg9eOFzBsoav5lWojQq5UPvNmydFJmjp5yD9BCTC3lwx9BqQhXrJmI7ujZujeoO
 FN0GmZwUl6PvgRg==
X-Google-Smtp-Source: AGHT+IEphO8gIim2bcuv5Bf2tpO1swqJw4dD5lYIsIGMeeIuuhCWaHMPHVVzXCRHdiC8IK5JFxCh3QT+3OEKqQQ=
X-Received: from wmbfm10.prod.google.com ([2002:a05:600c:c0a:b0:439:81e4:9ca6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3548:b0:439:8a44:1e68 with SMTP id
 5b1f17b1804b1-43ab9046de3mr67646995e9.28.1740675764506; 
 Thu, 27 Feb 2025 09:02:44 -0800 (PST)
Date: Thu, 27 Feb 2025 17:02:01 +0000
In-Reply-To: <20250227-export-macro-v1-0-948775fc37aa@google.com>
Mime-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=WejprDMEIQUzDrArt2ooNXimTyl9N7VACCV0VzTpMyE=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwJqrX4yD0aRuTAEvksdQv/JdAcIIRxq40i3kE
 kyNPKhnnO+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8CaqwAKCRAEWL7uWMY5
 Rk+KD/9OHexlQDh/sjs/LljOilHmTVeqSEG+2/0LGuddjP7sVfDu0w7erVLX6648VhTWE6haCcF
 g4TShRiclyduAp0aO10vRk7Fkji2A9jrcO72I3XNaxERPg1evCBCdGpki/jZA+LVOC+Y52cp4Ed
 r7MLCXFZoBEvRB0uakhQZ0rVRlrm2Ivy87OTSFGmeig7jSUesYHNKZJ5r9Lh5afiGZ6DhEO0qsj
 syioBHPS3ebev2YwjRE1u/1DVQVVhtL2bnRCAm58Du0vf+jhgjksMixBOF0P7anJPaRrigNfbiB
 zLWFdzGj6Xz11k0tRWq1ZaZDXhIdbvHCrc/tTTS1aOVGiQ562ZNG9FpcqOlEalFV31KqM+8B0CL
 AxNwRCvIei+OO6ipfX3C7QcnxTl+VbVzoYhC7w0Sp72ZaCxMjrZ9tZ3Fk+nO56aer0joyjrN5ks
 HI7mJCi3lBW1xybgGuW33YLefNVF9sCndati539VaHz8dKk4mLsa7DI+MCPumLONmhRj5Gs4IAg
 0FkpT84g2ZjvDeLh5LaBnU6ZFed8h6UbYUZ9LkkUSbTLK2hpa2Y/GDG94Wz7tTM43AoMquWx9rz
 WlqcnzFE2KNyq0k2D1qvj7RTz0EDRgv6g72CM1XnEzdORX88UCGzAtljJqx8QR6nMqMKuGPkDL4
 rZjpIYrju99OoRw==
X-Mailer: b4 0.14.1
Message-ID: <20250227-export-macro-v1-3-948775fc37aa@google.com>
Subject: [PATCH 3/4] print: use new #[export] macro for rust_fmt_argument
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
index 8551631dedf1..e1a5ff3f34a9 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -10,12 +10,13 @@
 
 use crate::{
     ffi::{c_char, c_void},
+    prelude::*,
     str::RawFormatter,
 };
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]
-#[no_mangle]
+#[export]
 unsafe extern "C" fn rust_fmt_argument(
     buf: *mut c_char,
     end: *mut c_char,

-- 
2.48.1.658.g4767266eb4-goog

