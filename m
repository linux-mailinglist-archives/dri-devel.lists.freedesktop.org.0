Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDD5A4860D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ADB10EB47;
	Thu, 27 Feb 2025 17:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="p1UF61cR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1BD10EB43
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:02:50 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4398ed35b10so6518725e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740675769; x=1741280569;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8s0UWUw+NP4XU/nMlgmR6Pxopak35wQY5LWhcc4hBQ8=;
 b=p1UF61cRBURE0H1pnfcnVmsS/wpEZcXHPBCLpbc3vPUjw7L3UgmbPwODLtEk4ZEGd9
 DRIGjSY12CaFeFQ0pqhyv3Pff14d98aAV+gELcxz4lrhDRPLmPeJ6/vke7x+g3Lb9jn1
 2K9UIdlX+2QBI7SNdy6GTsx1Sv4xDRMPxGRXueby90SxP9RybKaaejExzGcAXgieD5Bt
 avgdeM9/qbswZGtP/NP0HORj2ufWFw+IutvMRpH2lTQnSq64wY8Rm+QGFhxarQW4MhIw
 UOQUTWHJscG1nN9fHPbwjZlsvgz8yxOYHo0It9nih37LHpSCryJ8YyyYTnPkzfd5m/d3
 nilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675769; x=1741280569;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8s0UWUw+NP4XU/nMlgmR6Pxopak35wQY5LWhcc4hBQ8=;
 b=l2vNPgjstGvG2RQPNkRs77qjUzt7HDocHA/bcbw9wcTocY7koX9PqqOvyXl7CAFP6H
 UXlyPnxNziUX5PAOIpOQssmxQQNiDofzMdZrosXrv56Q4yIiyP7dEeAAmhP4hUMGHfHY
 Npmchki0zp+2/HvN3/VXJjEpeuLp73YSLRI53gaZVgrt34P3Rgw03UxZ3XBB+SjSTqxa
 U86dXWL3sBiTWGNMdAi8e+SqYLAvS+vqvXStcQjk5GbBllx99/AU2KVeaO6NWN5PA2W4
 l+fdpkxQdkKiAsYEuYyFDJ2wXyh2D9W4k6+6BwgJHXsVdxrnRMIWwYzkVgrJKhSWUnSA
 BcuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkR4L5t1UwG/P7gZ3YeWl4NdTppFKWi07DkqB3Uf7A7+iN101gIYvO80qXvdJUVH2ex2QL1y9AcsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKeoxh918mX79yGaGxVTZ+OB1dsXDlmJVYg1dY90V5hRqtOwNV
 Ie/IVpxGIKbboDe3OKbc3aK91drk4USRunhNB0AAn3JWh4FIhsjdYKTR0e7F5bhJreFf6gcUyfp
 SDI2QNlfELDRYMw==
X-Google-Smtp-Source: AGHT+IF2Xw7X7IQT2rkcDypOfKFxDqjIrX2qnVlYKcqy8xjIfF21Kp4rgbVw3IFZsGDwNrVp+GAGk1g3IkDcgqA=
X-Received: from wmrn38.prod.google.com ([2002:a05:600c:5026:b0:439:5529:c5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4683:b0:439:8523:36cc with SMTP id
 5b1f17b1804b1-43ab07ab212mr130473315e9.11.1740675766999; 
 Thu, 27 Feb 2025 09:02:46 -0800 (PST)
Date: Thu, 27 Feb 2025 17:02:02 +0000
In-Reply-To: <20250227-export-macro-v1-0-948775fc37aa@google.com>
Mime-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4336; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=S/CadH3DvJMHRT4OjtgeHq3HpKEISiEOD3rbSMx9ntQ=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwJqrjNOcllCa9cciW+U2KURIxpkWZ2ke2YQw2
 eOs1U8wRVqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8CaqwAKCRAEWL7uWMY5
 RrfjEACiQeNf/FN/WO6ae595R5V8X8mlq6tDi2z14jscIkTR6tdD4hB/GYZ8LqguvjmV66eWRr8
 hp365vPCtX8J6i8ip1k1500a0m1MOrFZMdSLEm1OOEQZR1mAK5COY9B8dNWwPGOuiNCWFHxZJgm
 pXdbJCX+hCjLoXE8ffYnDdesNFpiF2PykKFcT3rq5pt3fkgVsztN1UVf/70455og0U2lVlkuA8m
 +jEslSYIm150xzTKA/ZP7cNbG4AxiME4FE8MMHX2PWY/NH46PHbhQK44+wiMmzBjqrrWxRHzll/
 Chfyy+ijKbNNsosJmTFxd0UtSV3Ev4HHtt89WUVb40vynVnOeNcIWdDU5T2m5Fjfc+Coz6XLl78
 789yncBz0QE4U1IPfMl39G29+j+6O6djWyjsjiFjP0rWjXEAbm0cXxBgTAf5PMttLGfeWugmBXK
 0i7HI5yY79+iaoyLnrd34l2JGXq7h3PQXTg2fp+BAWUHAN59/PEU6vof9qH2hvyjYY0UF3wtHwn
 +lSCpiVyZGe+hh7xnb8T0+bQhen5styxzN+f3ogFnvWojl3D/FcZbTpc0yVz3OeiFrjEyQ04F9p
 s9YMfmxo31ssqCcXPJm4toHCJ2NVRtdsUusbsQjLc2uzIeCIDUUkTQ+ZQNDhaKV/9+XAm/PJiad
 fl3aahhNhEiEwig==
X-Mailer: b4 0.14.1
Message-ID: <20250227-export-macro-v1-4-948775fc37aa@google.com>
Subject: [PATCH 4/4] panic_qr: use new #[export] macro
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_panic.c     |  5 -----
 drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
 include/drm/drm_panic.h         |  7 +++++++
 rust/bindings/bindings_helper.h |  4 ++++
 4 files changed, 22 insertions(+), 9 deletions(-)

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
index bcf248f69252..d055655aa0cd 100644
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
+#[export]
+pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
     #[expect(clippy::manual_range_contains)]
     if version < 1 || version > 40 {
         return 0;
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index f4e1fa9ae607..2a1536e0229a 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags)
 
 #endif
 
+#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
+
+extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
+				u8 *tmp, size_t tmp_size);
+#endif
+
 #endif /* __DRM_PANIC_H__ */
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 55354e4dec14..5345aa93fb8a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -36,6 +36,10 @@
 #include <linux/workqueue.h>
 #include <trace/events/rust_sample.h>
 
+#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+#include <drm/drm_panic.h>
+#endif
+
 /* `bindgen` gets confused at certain things. */
 const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
 const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;

-- 
2.48.1.658.g4767266eb4-goog

