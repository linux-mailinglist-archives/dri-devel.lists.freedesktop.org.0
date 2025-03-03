Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF8A4B9B3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D83C10E37C;
	Mon,  3 Mar 2025 08:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="h6OfuVNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51D110E37C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:45:58 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-43941ad86d4so18162225e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740991557; x=1741596357;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0DQHcaO0nvqPOcD0xXA6BfduaWtfQQJcuNoquBNRtQM=;
 b=h6OfuVNZcv6LdjPcqFomsBFswLiYt+CgkyTvrZsuGC7D7m8pVwrxt7G8P/fxChCZLF
 DFqweuH2IoWZ/MY4cjSWCj1ueyOLADmGgqffgD7H3xmEr+k05nH7YmPJ4b+BjG1xbIdQ
 sNh7A1pQPTzefJusL8NYgrSN6YpjWJT/8d7kcvXy4ZUK1Mkhwj5A2oQO1Q1QM6ujmiBw
 Y8yetRooUVoWc6AdZqtm8aayNmHR7J2Bs07yTV9pYdPLZ9d/q5E1Bj4KaFEIBIOuh2Kv
 DgA/iU4qpRHOkV3SOUXnxOR7yT+RKwilhmM2yt0yZV1xwqnysP9PNN6a+gGxXFnsxu2H
 2Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740991557; x=1741596357;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0DQHcaO0nvqPOcD0xXA6BfduaWtfQQJcuNoquBNRtQM=;
 b=Ca5hAfukHr9fYn10py4JSlWlppOx4QwJowkXGJOZ9TDyHDA7rVF8TWwaEJeiUU32Fb
 Qy3ZSXyJJk/ErEbxhjg2wkwj9SEBtgqNPNnOepOpbrb+41mVlO8vGe+1nNkjrTnSo8LL
 BnTL3hv98gT1vddopYdzLlhesf6rj+jyn2TWIQ3bv1wsxXw6pFGRfsPDBOfTTAQYopp7
 eZv55AEw0xBwnGPA1p672C7EY7bkKuzHVibZ89VbTz22XGpsQw0ylwV7/clCzDZDud4Z
 jfIForiHIF4YKNaD6ZI+LQeGPwenHVvJI1OIiTlHj2AsR53a56UgY2HWe2gXDwO60EWh
 nnEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS6WsymOLxlUTLihqH0t5WZSqWTbYpywwN2kQR16Mj9/VSkL6DfXOCbLkCGkLtXulRlHC6lqyd0SE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2g1Vz2YgSfDlb+a0ehvybfcu/rVD6onhrb1PtTvIBA8tbwMry
 IweXWmUiGwvW1lLm92Lze0vpQkUOMGf+JAJhUJ0JaFQdQ7kAjzfkvFvfkIfJA/8YSYVYdBFgGYz
 n5dQneK4MGfwG1Q==
X-Google-Smtp-Source: AGHT+IEbR3/WcyPiaNNIulZcuIWaKGsu5gY2WjUpjPLpgdJov23gFYjscM1b2KomiFKt1HIexbDsjk8ll3zgBPY=
X-Received: from wmbay26.prod.google.com
 ([2002:a05:600c:1e1a:b0:439:80fc:8bb2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c25:b0:439:5a37:8157 with SMTP id
 5b1f17b1804b1-43ba6774a03mr109919695e9.30.1740991557659; 
 Mon, 03 Mar 2025 00:45:57 -0800 (PST)
Date: Mon, 03 Mar 2025 08:45:16 +0000
In-Reply-To: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
Mime-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4809; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=h39madShj1asyLtbf2sfVdBNK2RyKkwe8T8CD9+EWUU=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxWw3pj1BuO7nm85LYW8CAGocu7fhqRw9nvE8r
 O7rU8v0FnuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8VsNwAKCRAEWL7uWMY5
 Ru5uEACnfnvDNKGTdfDWkGpV2cmEz+XPIKAv+OAav/nOsh2wf+SfXkLPHDH7ruxHfwIZIgBxSN0
 XNYeBV/QOAcBcfj7kCEnALSOYbYa68MODYU3lWLzoYQGcTKnIvgBpZcQNcIw6XoiTggnSfS4pRN
 twnRo0DybJXquoJRODCF7pPH1zuKCeDtLN4pEBmlSQz4JJr4lm9jHA2UxFUYxzGNmRBYpPxK3sA
 gzDGC1QnvX1VjNHlwTJV9otv6N0zCdO3zdQ/FW0byi7n9wxNs91XO1qcbwOraS/zqXnSJujthF9
 g/DF9vk9C9vtZYhOUPPUdeYjapB4wG9+h8TlKGembKDI4h7zk/XPUxfp6siqoMycq+lGTAEepNz
 +sT9UyQN+jUXepDM2K2FM4AA1cu3hMqJkfDZgI4x49hrXRmBJ1VGEt308d5DPco6Um7EQtheFGc
 0fNhGeafPpTduaf2Ebi+xrdhZQ2ZBTzGDxRFgRMTOFSANfmum5+BX4ZuThqe9scF5REbMHD65y0
 nvytaWAsv4lSnYIg9wMuWBKn+4uCuI1QWlTyjvLtl4aOcceJFpdKBShLjTO+8UvL6H9CqvjDm0y
 VQ0iys7hDYKZ+bk5RgqB3PZWRsc8fbJlsZUk8pdSqFSdC4ibbPV67kpPGD7QcElJrgJYkllt3no
 E+HSkBYCbHVjBeQ==
X-Mailer: b4 0.14.1
Message-ID: <20250303-export-macro-v3-5-41fbad85a27f@google.com>
Subject: [PATCH v3 5/5] panic_qr: use new #[export] macro
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
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona.vetter@ffwll.ch>
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

This validates at compile time that the signatures match what is in the
header file. It highlights one annoyance with the compile-time check,
which is that it can only be used with functions marked unsafe.

If the function is not unsafe, then this error is emitted:

error[E0308]: `if` and `else` have incompatible types
   --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
    |
986 | #[export]
    | --------- expected because of this
987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, found safe fn
    |
    = note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::bindings::drm_panic_qr_max_data_size}`
               found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_data_size}`

The signature declarations are moved to a header file so it can be
included in the Rust bindings helper, and the extern keyword is removed
as it is unnecessary.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_panic.c     |  5 -----
 drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
 include/drm/drm_panic.h         |  7 +++++++
 rust/bindings/bindings_helper.h |  5 +++++
 4 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index f128d345b16d..dee5301dd729 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -486,11 +486,6 @@ static void drm_panic_qr_exit(void)
 	stream.workspace = NULL;
 }
 
-extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
-
-extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
-				u8 *tmp, size_t tmp_size);
-
 static int drm_panic_get_qr_code_url(u8 **qr_image)
 {
 	struct kmsg_dump_iter iter;
diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index bcf248f69252..906943b02beb 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -27,7 +27,10 @@
 //! * <https://github.com/bjguillot/qr>
 
 use core::cmp;
-use kernel::str::CStr;
+use kernel::{
+    prelude::*,
+    str::CStr,
+};
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
 struct Version(usize);
@@ -929,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
 ///
 /// They must remain valid for the duration of the function call.
-#[no_mangle]
+#[export]
 pub unsafe extern "C" fn drm_panic_qr_generate(
     url: *const kernel::ffi::c_char,
     data: *mut u8,
@@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 /// * If `url_len` > 0, remove the 2 segments header/length and also count the
 ///   conversion to numeric segments.
 /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
-#[no_mangle]
-pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
+///
+/// # Safety
+///
+/// Always safe to call.
+#[export] // required to be unsafe due to this annotation
+pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
     #[expect(clippy::manual_range_contains)]
     if version < 1 || version > 40 {
         return 0;
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index f4e1fa9ae607..ff78d00c3da5 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags)
 
 #endif
 
+#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
+
+u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
+			 u8 *tmp, size_t tmp_size);
+#endif
+
 #endif /* __DRM_PANIC_H__ */
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 55354e4dec14..607e90a682ca 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -36,6 +36,11 @@
 #include <linux/workqueue.h>
 #include <trace/events/rust_sample.h>
 
+#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+// Used by #[export] in drivers/gpu/drm/drm_panic_qr.rs
+#include <drm/drm_panic.h>
+#endif
+
 /* `bindgen` gets confused at certain things. */
 const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
 const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;

-- 
2.48.1.711.g2feabab25a-goog

