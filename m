Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62D3AE6AE9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 17:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E2010E5DA;
	Tue, 24 Jun 2025 15:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2KAxvVln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D398B10E5DA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:28:14 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4532514dee8so4944445e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750778893; x=1751383693;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=268YGudOLyzzoA4+F9RG1rGF98DFDgP0BD2ClWynzVY=;
 b=2KAxvVlnS2uSHZNg2lCRsZne6OmsgVEntkfuknwXz6i0mk1GFqFdrQU2z/uNTvv+FC
 p4e874BYxNz0Tp3goedkj+QwxfKNy+Vh8eWnNW+X+HruIQira8facHp1MRSO4VSIUduq
 Rpt3icmT+6KUfao/6/fJmCBGilce0fu2EG6hLMj1pbyqS2QboNcNHR2/kXjUAD7Z7Zlf
 o/K1hl7JIb2RYoiMEy9Kwj52EONhgJRZ8ZxZ/rnTDr2qLDfcPe7IIQ6ZTp4rGf052mnN
 CSFuy7NKU9DKI/Wn5kUhLretPpgMxpz7Ew3pQYzmrnb9pmipN0u1aGCEkGbOD7LyVn4Z
 8Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750778893; x=1751383693;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=268YGudOLyzzoA4+F9RG1rGF98DFDgP0BD2ClWynzVY=;
 b=EEe3apXQWxxrPxUIef0KVYprf8xyVXNYK7yD0ffOD1j43hFE3tE8tmwjoZK/jb1la8
 PT1qSQCc80t6HPHTwI2CVyTX0AyUXKeY2c7RWZq4/p0kiBGrMG2HIXEYt5tt5w6Cov5B
 wRuQst8HM2vFr51mCa678T4Gil/5bB5BUs29Iz0HJ3Tx0lJkfnQc0c9WUgw/de/zGhyY
 5tpF+vI61IPwLer/lccCWEPTfOW2hDRBSjEz4ayIsakRqMznc+Y40Buxl71qypaRQjnu
 0pWT3EtA7IMSnyFKgsK3NLsOMn4ICX5o5AeSdgKsixnOv3oF0CPPzkPc81MTHBWEKYRC
 Shmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOVPNCyy7YAptWC6mmmIsFptqreOKM2fJ8S/UDB7sy22sRoAn6DCc7M6IviK29tE4Cjc0V8Rfaz28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGAi3UvMgerZrVBuwiV8h8OXR+jsQgQg4HrqBzqOdwrUhwqJHR
 GWqpxohtqPOfyyNBz6AN2VR8J6grP+eVFYflOClliv64KeSbFUkg5GoKxJYNyTiDqrgIxiIgVaL
 Qj5imeZijQiwtZlTGHA==
X-Google-Smtp-Source: AGHT+IFRghdo+WYPgOzlG89g2MwJ0GNK8NS58YpS9ZrVk3kDSULxLxHjWMq12+4IBf8MTm6C9hKbVV0h3QJmhgk=
X-Received: from wmqb16.prod.google.com ([2002:a05:600c:4e10:b0:442:f482:bba5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468b:b0:442:f98e:f37 with SMTP id
 5b1f17b1804b1-453658ba2e3mr152984835e9.21.1750778893234; 
 Tue, 24 Jun 2025 08:28:13 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:27:55 +0000
In-Reply-To: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
Mime-Version: 1.0
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4181; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=UKHD3G4rOgDMdX6aaHCQ5ty9+jr+2OmN4FyKUXHUJ7o=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoWsQI3fRyJmSfbo5uoJ7SjbdkZKEsYCZTdbQdR
 YPphOlK6AuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFrECAAKCRAEWL7uWMY5
 RkmfD/4v+apEcxlclEj9RjgLcqodC11eQ8VtxGUU8tBr9QuZmGmMpy+RHyT60OgnsVVRtmI1XoN
 NioPnTrHaMWYVTv7kKo+w50Gf9WnV3bJov4+sQZl5e3CyCXzHyoNfhiY+sabhDQS8rIkL6Gq6VZ
 mZChFqzDKCOJF8M8tq4Flzh4MUg19LH2h8Upha4CNf6sMOX1oItiCiOQBk/mLs7R8vsU6xcxqdA
 oXClVKOEzUcEj5n+OXxRSV92FPS0AVxbSIGUn4DABRMoFIgLYEqGNME6lxbe8sjGcqVziyJx0l7
 V2xOmYcdCPg2e4h93ck0TzMJzvFx4tj7qonYvfqP/RHXIdhxv27md85HjckuLIeSgmUr8QOSw1m
 bLNyEzazsCU1O4CPwTs8QpJ01DoVUwWgRCxPWRLgM2Cft6riSHMD1J0Iduww+MJ14/D1f7aDVPl
 shM6sHL6GPi+y5RtaAD3NVnDTGSf0hZHiDC+1Eb0P7RCwElzWSPswuRKNJ5vORP3T5uMl5AFXSi
 hLiNDbfHAPClVJAghwblMiI+xV1YEU7igUCd78Gdre/HDrzEdaBWEwDA75waefxDqp++djRWw8p
 OUb18XDQXs7RUbbpW7Bts05YF60VjXcaGjpFE6p7ZTq5kxe+AbSJUzk4qmEzWsROomMRmLeLutu
 +ont2Zp5Oo3ZwnA==
X-Mailer: b4 0.14.2
Message-ID: <20250624-opaque-from-raw-v2-1-e4da40bdc59c@google.com>
Subject: [PATCH v2 1/2] rust: types: add Opaque::cast_from
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

To help catch this kind of mistake, add a new Opaque::cast_from that
wraps a raw pointer in Opaque without changing the inner type. Also
update the docs to reflect this as well as some existing users.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/device.rs  | 4 +---
 rust/kernel/drm/gem/mod.rs | 4 +---
 rust/kernel/lib.rs         | 7 +++++++
 rust/kernel/types.rs       | 5 +++++
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ead64b93325189f481d9b37c3c6eae..5731746eaea63296f418e34892e05c9960c45a90 100644
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
+        unsafe { crate::container_of!(Opaque::cast_from(ptr), Self, dev) }.cast_mut()
     }
 
     /// Not intended to be called externally, except via declare_drm_ioctls!()
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 4cd69fa84318c3ff2cec57949e9bab05559a3c2f..6f914ae0a5aade12a50eb15a029362d4d636bf76 100644
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
+        unsafe { &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T>, obj) }
     }
 }
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..529ce907499679997415cbaa6a97ac3939587a11 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -204,6 +204,13 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 
 /// Produces a pointer to an object from a pointer to one of its fields.
 ///
+/// If you encounter a type mismatch due to the [`Opaque`] type, then use [`Opaque::raw_get`] or
+/// [`Opaque::cast_from`] to resolve the mismatch.
+///
+/// [`Opaque`]: crate::types::Opaque
+/// [`Opaque::raw_get`]: crate::types::Opaque::raw_get
+/// [`Opaque::cast_from`]: crate::types::Opaque::cast_from
+///
 /// # Safety
 ///
 /// The pointer passed to this macro, and the pointer returned by this macro, must both be in
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..82e0c6fa5646dfd2aea52c8fe9ada769ad427e50 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -413,6 +413,11 @@ pub const fn get(&self) -> *mut T {
     pub const fn raw_get(this: *const Self) -> *mut T {
         UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
     }
+
+    /// The opposite operation of [`Opaque::raw_get`].
+    pub const fn cast_from(this: *const T) -> *const Self {
+        this.cast()
+    }
 }
 
 /// Types that are _always_ reference counted.

-- 
2.50.0.714.g196bf9f422-goog

