Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064BA4B9B2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2DC10E37B;
	Mon,  3 Mar 2025 08:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="O6ZBdOmp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D905910E37A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:45:56 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-43ab456333aso35869955e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740991555; x=1741596355;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TlZATerwOi5j8gaqWad51my4T/CPZsM36wEeCkoHEk0=;
 b=O6ZBdOmpYvik1LmyjLhq/0o/1u/sZYJ3RrEN6sgi4Z0OEh92eN5x7T4jPFWBbzWKQB
 nJt7aQ5x5aCwNkHtjgUjvCi5USxMiAuNlu4lO8tKWejXFsGZLG+bm3QeiPIB6GU29yLe
 /WREUjZ9dgXJYOspSVAaMl8MZy4E83BXVSJCrEmL6x0n6AEYnGy94kNnShfP+jZGxeRn
 9z/8KtTFYrMIGypgn6jOv9CqX14LeUArWxwKkrMTbib1I175KIpOvq7KCbTVQd09eYMn
 S03u7kzoezuOKEzXaA4sTAMTTeinhqpv6ifFhYSw5S5VGMRiIWFtBlZdFDsImT77Si5L
 RPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740991555; x=1741596355;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TlZATerwOi5j8gaqWad51my4T/CPZsM36wEeCkoHEk0=;
 b=eRq6IjUYQl7XpjNxp/1R4cCM4q1iuR9PND+D0nVUNSuwZBYGW+qROac2kS/+HGeUcR
 YMb8XXQHUpwYUfB9CiD/IAfpRinr2XuNqVH/8bgkBBp7jh4gLLPgBBDy2sInen6WL6Jm
 TKT/Zfqv/2vMV55mml27DpRgHz0Pngw2FOoY2YFEySk8sI9m5irYK5lPqoVWLAGdb2lV
 JRLGYrkL31UZ4C7V/cUQ3Qy3M4yZvZ626S59ZG414c2FogRVEE2fd81/8PUDnLDLaLmN
 sBUCQey953NxdkS9IwxZ/ElJLUgDY4kn4bigFbzrywX5Uzep7KOYssCZ2Who5Cnj1BiR
 VGxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7LtG23SS3CJlshcwfu38/7nKuA7pfMzMkCMD306BDzM9LWAP5ofQFlkpBuf8ycw25Xb8m45lM7FQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBWFpWc32FNJv5On+BEMIs0ooXdVy95r6jHV8u2oRv8gYh4OVY
 hRWL3yWs+oVqHtG2RVfoF3F8iZMf8zHiRf7ynbZ5lDK7EdQEqkMUMIhh9vUD6txgfoNaoJlU+t4
 vX06pvg2aJ1O+KA==
X-Google-Smtp-Source: AGHT+IF/OlL6SSDUrA711Q70XX+2KHCrfpkEqlIN+HJZdKgaK09VyIf3il1gLPXIbqk4NQNUA9/BHyQB6JirT4I=
X-Received: from wmbhc11.prod.google.com
 ([2002:a05:600c:870b:b0:43b:6943:f013])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154f:b0:43b:b933:33e4 with SMTP id
 5b1f17b1804b1-43bb9333572mr39999305e9.15.1740991555606; 
 Mon, 03 Mar 2025 00:45:55 -0800 (PST)
Date: Mon, 03 Mar 2025 08:45:15 +0000
In-Reply-To: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
Mime-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=27rIJnpKMgqp3S9uOE1r8d3kMA+evBJFEj9qZVD/zkk=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxWw2Tay53acZ34Qn0eFiLPW+Lb9vqKq4R/vG+
 fx9bpMrWpmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8VsNgAKCRAEWL7uWMY5
 RnTbD/9YsPVC7+afuFs+98V5aJHhzrUsrsUFek7EYVLlN7anvgFXZxC5zDoVi/nKouxeYNlUrkc
 nfExRYI0ZxQ54u4GfOXQlinasxJJwgXnwcymxJNwO4mg0St1dJaIgInwn4tvjtASj5I9aEOwcXE
 u45D6rRKGtyWOJkwGSh76n3mNuwWSLejj6TrTQeItBP2dK1djpNdyvqjWE1NT6bijf79nFgDOCG
 b5rQ/f253UATffkklrsB+DVFQ2C3Qwke3eDB9sZsNNlOUzX2FPFxuUhc/g0iMsp74jbh+mPLauc
 MDp6YC0mvqDWt9VykZdmjb9WhvgOQxktmuMMmszdOBgpu2Q1zJ0yXZ7bEqtwPgLzGS2e3RfUvII
 QSGkt4/jG/5vCO7daJ6gnQJrOHdK6oh5SvbjPLOhOnDqo6ZiQ94EBhmdnc9lZXFFLLixX57HALS
 hxF+9lS0IGeqfadsMhaBnBU2iKF7M5zcIv2GP4xS93UMUuDLv9zXn6jR8tdAxHnRVPwlzvb3LQ2
 kljkwSsO+yYAsFZogs2EyYIs3myE57AmrK5QsztGscSBm0GmYx75alc7vCq2XKeDsVVa3Ysmn4G
 22cKUJot+xuuQtxOslAt3ovEaDbED+emWSenu2ChOBo+AvJ6KAl2UMB5JzN3ejJFsF7d3X4oQJz
 dmH/R6fzrwpBmvg==
X-Mailer: b4 0.14.1
Message-ID: <20250303-export-macro-v3-4-41fbad85a27f@google.com>
Subject: [PATCH v3 4/5] print: use new #[export] macro for rust_fmt_argument
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

This moves the rust_fmt_argument function over to use the new #[export]
macro, which will verify at compile-time that the function signature
matches what is in the header file.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
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

