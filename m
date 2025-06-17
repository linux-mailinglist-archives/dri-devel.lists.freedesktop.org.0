Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA1ADCD83
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 15:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DB610E6A8;
	Tue, 17 Jun 2025 13:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tDGhBuKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D47710E6A8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 13:37:05 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3a4f7ebfd00so2641343f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750167423; x=1750772223;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WdkCvOjgjBWvaH3RbGAWvWYYMnuHBQbG69wwVzqGWxM=;
 b=tDGhBuKG5mxxRgtntNw2vifp0k8JZlasdq3FmNxOLzkkbEzNDon0VGIshAqWJ/9kz7
 oiFyPpbVwvi0M2yM4VMaaWBeZvzaXmhHzsVLFIs7kS7H7C/lDOPDRh/pcoWlD8KhL4yj
 UZVU5x4ND6hZ/PZHMKyUAQHbn9jW1mrDPfYlj1c/IagInHPuUt744IBtMuJSMbvtyYBQ
 MvbTRFnxkWxN53Caz9y6hhJjYoUkmbROCN8L9tRr1QA7m1wlorbJoTDwAi4DQz2UAYNR
 F1Gf8rFQ2pwcdjTwBySn0fjOYs8gONd30x+mEsLLAc5knLtITD1Uu9xY4LwbLUdZQOlA
 1v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750167423; x=1750772223;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WdkCvOjgjBWvaH3RbGAWvWYYMnuHBQbG69wwVzqGWxM=;
 b=ZhnyhutVfqsjAPFSJU+yiZK33+hF8czeL1US1nZq+knVajXb5uPu3RoOZcYOVCRVMV
 V6ctvodHoagSH4v8GDJ4kskRUJD90Y7zY74rojszVJufuYtxQFBnnrE7TgknrxJC/Uyx
 /T/gK4hHVFKTCg5QM/ISEupgdpzS5aC/2QiNVXj2JQpJqwuiXJYkLOJeBm84UAi28TfT
 HP0ZLslz2gTB0TjXVKjRPs+92Nm/UqhQHZy1Ahsz9eSdef7qZPqDxKNbJZfOiLR0fcQn
 8e7zBGM5Tsw6jhav32EPYvVVagKuGetu9S+UxZsSQI2AR3bHk/Quh9bk6mczGlmehRA2
 Ei3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9a3pHG/bGYBv5gxCcBfaBtR4B+NI0JJOeB22iRj/ZTyIGs31x6l637GYyrolA3OtW1bw6mi5cD/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/DgKh9enJJpmiGbhGcrXp2hkk4BCMij+3m9yYspj0C/NURq//
 hOz//57sGcQufYrR7YCTltJHZq1G3nVjijHmDH5y9MKfcn8q5byrEOY7xoul02XgUHEGUF9oqcz
 WPZdhk7A+eFnTkkn96Q==
X-Google-Smtp-Source: AGHT+IEMDhH4okw8GTdgXodniHiT1koUzx1rDCj34eR+Q+7V5b9vWvUIpnrHd+p/WctosGmoTJbrw24dGRNMPG4=
X-Received: from wro29.prod.google.com ([2002:a05:6000:41dd:b0:3a4:f715:9b07])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2308:b0:3a4:f939:b53 with SMTP id
 ffacd0b85a97d-3a5723a3ae0mr10356845f8f.38.1750167423450; 
 Tue, 17 Jun 2025 06:37:03 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:36:47 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG5vUWgC/x3MSQqAMAxA0atI1ga04IBXERexppqFVlMcQHp3i
 8u3+P+FwCocoMteUL4kiN8SyjwDu9A2M8qUDKYwVVGXDfqdjpPRqV9R6Uay1diyqx2RgVTtyk6
 e/9gPMX7i1WcCYQAAAA==
X-Change-Id: 20250617-opaque-from-raw-ac5b8ef6faa2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4237; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=M3gQu6VPxrPFYf8hu7y10DRHvlJJ2ovwL/u8xE0ildM=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoUW94PXoLr5TGi3Dy4xbq6vyhDItPxc58t6abl
 RFPIjla48yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFFveAAKCRAEWL7uWMY5
 RgkBD/9dtOU3K/e3NpjSkdYgne2dJ5ngj094WXloMO7B+XZLRGjdpTmKKGAgSfpFfiG/YL89edV
 59g5YxUGu8fApwVw5qTDBE8tGxaxWsAgOwLmN/amy4f8E45bVtXZ/uj77RzSzdvUAx5lFiSjQQr
 v4tlYPjS7nAnBCcNxJyMxKnTHhDzyq0KfQ/S/L82lBxtfCWiWvcmIIeGfRdf1ZU3x81lNaNZc6E
 Bx1dD3v8wdtFyxuP7cuXrjwSH4UOGqDAf0BEABjtk7+jSWi4xMoME6lncXyT0P7w1RDn/NinMRE
 H0NCpX9yDIKwcrXPqTZp8n34n54IAKvilLvaY9xymUqaInHKY7o2A1lCZN+IgiiCzspKLp8i06U
 DkhN23Y8yb7HxEMLiErq+Hx0FUpeJkGpgRgSF7xztEKONVgJnXyOjVBbUnsorfG7oU14O1W1zZA
 OBCTzDXDYItGjj3Ubnlo8JI74S6riRjzX7CYTlqlEK+TbRSRxleNscIySYDAOmOYOTdg7UkYTcN
 bqYekjnuB0ebsMw7huMgOI1SB40/y52VstObeaNtzMVSGE9bolmgbzcWyw1tG/+qOUUhAXsZW+9
 d3uDLoV1/kC/C50jbD7sm2UUoSpB3VmXecpL6kRdWvvt8R3ug01X9E+MZK3e9KMTiT8qFBl6rJ0
 I2x0aVTi8mZ4Y/g==
X-Mailer: b4 0.14.2
Message-ID: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
Subject: [PATCH] rust: types: add Opaque::from_raw
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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

Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
`container_of!`") we have enforced that the field pointer passed to
container_of! must match the declared field. This caused mismatches when
using a pointer to bindings::x for fields of type Opaque<bindings::x>.

This situation encourages the user to simply pass field.cast() to the
container_of! macro, but this is not great because you might
accidentally pass a *mut bindings::y when the field type is
Opaque<bindings::x>, which would be wrong.

To help catch this kind of mistake, add a new Opaque::from_raw that
wraps a raw pointer in Opaque without changing the inner type.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/device.rs  | 4 +---
 rust/kernel/drm/gem/mod.rs | 4 +---
 rust/kernel/lib.rs         | 7 +++++++
 rust/kernel/types.rs       | 5 +++++
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ead64b93325189f481d9b37c3c6eae..763c825d53aaba4f874361b785587b2c5129d49a 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -135,11 +135,9 @@ pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
     ///
     /// `ptr` must be a valid pointer to a `struct device` embedded in `Self`.
     unsafe fn from_drm_device(ptr: *const bindings::drm_device) -> *mut Self {
-        let ptr: *const Opaque<bindings::drm_device> = ptr.cast();
-
         // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
         // `struct drm_device` embedded in `Self`.
-        unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
+        unsafe { crate::container_of!(Opaque::from_raw(ptr), Self, dev) }.cast_mut()
     }
 
     /// Not intended to be called externally, except via declare_drm_ioctls!()
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 4cd69fa84318c3ff2cec57949e9bab05559a3c2f..5b80c248761bb39914a63ad7947aa8d3779054ef 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -125,11 +125,9 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object {
     }
 
     unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
-        let self_ptr: *mut Opaque<bindings::drm_gem_object> = self_ptr.cast();
-
         // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the safety contract of this
         // function
-        unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
+        unsafe { &*crate::container_of!(Opaque::from_raw(self_ptr), Object<T>, obj) }
     }
 }
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..d2402d42b8776c9399a7dfdbe7bd61de7ef8dba3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -204,6 +204,13 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 
 /// Produces a pointer to an object from a pointer to one of its fields.
 ///
+/// If you encounter a type mismatch due to the [`Opaque`] type, then use [`Opaque::raw_get`] or
+/// [`Opaque::from_raw`] to resolve the mismatch.
+///
+/// [`Opaque`]: crate::types::Opaque
+/// [`Opaque::raw_get`]: crate::types::Opaque::raw_get
+/// [`Opaque::from_raw`]: crate::types::Opaque::from_raw
+///
 /// # Safety
 ///
 /// The pointer passed to this macro, and the pointer returned by this macro, must both be in
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..a79295500b3c812326cea8a9d339a8545a7f457d 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -413,6 +413,11 @@ pub const fn get(&self) -> *mut T {
     pub const fn raw_get(this: *const Self) -> *mut T {
         UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
     }
+
+    /// The opposite operation of [`Opaque::raw_get`].
+    pub const fn from_raw(this: *const T) -> *const Self {
+        this.cast()
+    }
 }
 
 /// Types that are _always_ reference counted.

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-opaque-from-raw-ac5b8ef6faa2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

