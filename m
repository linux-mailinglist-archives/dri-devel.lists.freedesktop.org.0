Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B67CA49998
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1D310E2A8;
	Fri, 28 Feb 2025 12:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nuWgw24C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFCA10EC8E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:40:17 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4399c32efb4so14004775e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740746416; x=1741351216;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bKdCOruHgStYFRjw1OWEfRvPiQaLPkJaqZbPvH06xZY=;
 b=nuWgw24CHfTGVcAYgc1FGlJnYAnRGp4IclUSxGgLCo4QOsteHkoGJm0wruCGpeeIfK
 BGFaqn6186E2KxWWIFwG0NcqZuyrD7c5Klt9O7nHG3qWJmCHpEe4JI+aOFK3YNEiBzA1
 /tYtmZ4MC1SpMUHJtqPCloaaad5k/ClJ0ghNIJlaFYRnrALkiIuCobsJAAU2vSe3h0NB
 Pw3KwnIR2QqCsL2FAF/MVSLqDduwkxfrHHIiAre4sN1F33q/a8z9LcA7QC03iuCpCRna
 kxzJOvmPWYgSdg9O5+LFMYTCan1kUlKx9eTCT7ROel2+3hJwWBKjEQTrYJRyqZxYYUxt
 RLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740746416; x=1741351216;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKdCOruHgStYFRjw1OWEfRvPiQaLPkJaqZbPvH06xZY=;
 b=GoHu8K+Wn0883omqKLzv6oQG0IpEIaf3tsR0s4cG8Ov9YvhYcQBn4w/ym+JDFXGtD+
 boGxtokCG1rw40Cq/z+uYPndKp43dum+E+zd/LBX5s4qKSHh5MKStT2J7mT5UDyUYlNj
 hjAMX+ySoYoBdUnnafD4uyhI1WE/Mi9IlFy7Lr7cjxhfSdS8RKx9DCDVENFm0hJ8PZQ+
 tj+1YENz3zQ03JoUanM8fT9i99/kR+bi/pgcR85tIOayxd2nZoArsA3ntNK/U2O/T47n
 v983apDo+C72FtntFWYjE0W/OxklyjS2S0KwhTP0FRWFJWVzVIEu/2D5sB3y/9C2v508
 Nniw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSdfPtnNIZugKYbShhmXQFE6o808W5APR/ffyJCBW2UvCyYO8KZJdJLow2F1GGa20eWLGuW3sZKOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxnt7TWC7At0mdXv0FpW879pueYmwLOSE0vaGJpl+Wv9GM71Ibq
 IuuFXd/34s8OO5mfXHYHlueqHKl3UdgHrhhVP9RQ6Hk+orbvTfghihSwjPDIjSpczYJm9pWd2o5
 T+Z1tprlu2K53Nw==
X-Google-Smtp-Source: AGHT+IGAooNngUR6F5E/Jf8s4LC0YsqlsbQHIiPJaRDR2Z8JjTKZ1EiRXmYu1cG1inA9uIBqBtJ1Q5wUohwQEBs=
X-Received: from wmqa13.prod.google.com ([2002:a05:600c:348d:b0:439:64f9:d801])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400a:b0:38f:23c4:208c with SMTP id
 ffacd0b85a97d-390e18c8b0amr5646269f8f.18.1740746416493; 
 Fri, 28 Feb 2025 04:40:16 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:34 +0000
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
Mime-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4391; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=lzB/op9EvTIfS1pnVWB0B3izr6Rw961OsgJ28NlS2cw=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwa6i0KzBrUws4mz1R1VW1D9TxSn72HLiqHpJR
 ZCRZT3AF3mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8GuogAKCRAEWL7uWMY5
 Rn+wD/0RyHzL949Lt17UGWI6WZmlRtRFdhXsWk8dwmUL3pTAjhMNHcSkL+/UnC0ieyheuZIskCq
 Zj9whzeOEdqIAvKuTybm4nrO3wlr9Ub2HqLOXnjVhG0pLJEgzOgI2+b849oWrWVTwA3oUXTvIaI
 LdWL4ZpXcv8ExvLxawdGYmKPshMkVytyRdqa8U77ea3ermzIeryGAJAIfOH7Lepic7ytK5s091O
 LgMpB/ONmXPnUtZ5hTfBt7670ADKL9u6TY8st/doIQDRtzQhlOl+rp6JRUrbQ83YhNnqhYV0rKq
 cPE3iYpkevaMaz178BE9yJBSyyGDmZGi3zGNUkcNvQuteKV5LvDdt5LkHeP6vq8chtkIRLI4v2u
 jbPpfgQ9TevWf6P7qjX+zLT2OPcujpJeQYL8i87KzswA2CLporYAycPNjeXGnAO0swAzTnkIupR
 pUIZx0cHok7eIB+aQMKbmTJ+ll4sQj5svV60Fh7+t0bsn27VvbBYh6gkGj4pSwrYUMPos4/4wmx
 5qg8JPiN08hqo8Mwmvc56mROWbHnfhQ8+M8cgZLe0qg0p8HKJSahax6nqP+stenJuVsT0LxqDDy
 nH2pF0Q1rTPc2kSGHG/HXCeY2yrEhabXztuHQLggzlkGHSNZxp3L+8dk8d1eNSs/A7XhAjVsc1j
 FplYmT7vKagKAaw==
X-Mailer: b4 0.14.1
Message-ID: <20250228-export-macro-v2-5-569cc7e8926c@google.com>
Subject: [PATCH v2 5/5] panic_qr: use new #[export] macro
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

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
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
2.48.1.711.g2feabab25a-goog

