Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA8A8287C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79DC10E91D;
	Wed,  9 Apr 2025 14:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="edSoNJgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF4710E924
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 14:47:37 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-47692b9d059so34572591cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744210057; x=1744814857; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zdDH+qr7UBoA/lgIB3GeZraE2OIbymXMH9TLc56aCLg=;
 b=edSoNJgB3Ru2YC61e4AukPi6aXWo0FAxhDve0ksEr/J9vEkpbuFOSoCOnjlqgRjXEu
 sr1wtrhNCDcVAR9VgzdnFN40CkwlQpEEuZpu/a58T7tIi4A/RDGfM3XLJ2ngu+eSO3kR
 DExnks1Z5PO6aRn+Jv1+QTQQJxUn7GImEWzojFvLRqmcykbYU+ySaL0mdOep3e8f3PI+
 6JniOE3wEs1BSF+Mu84cYM+V61QJVi5zcVj4SGckLEMQvjhwCssSOuiVxLPnNqM6D43k
 yGT0TFNKJKLs5B5HLa92S62hlSzyezq22ARsvftiZwHw0MpxIO4yHs8g58Vogyb83y9B
 oYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744210057; x=1744814857;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdDH+qr7UBoA/lgIB3GeZraE2OIbymXMH9TLc56aCLg=;
 b=o/K27JQ89Od96yRi4eMp8hS3TvMoDlIpK8qVy4jn9yAnbkZJ1FTbB38c7fRpW5tmEH
 NwMxP0516j9hnsdawficIIMueHHhr0vabmsRFwGwFr+6qywsz502dG1kIsSuVRGfcM75
 6kYTqEw7q92OCETBIWXx/ZDwf282AM99ATXpu6zxT2VRi6GyE1MNjKREKFegl7j7XSDr
 64XzlYKoK9RA5dvMgkw1YqX7sNC43oJtraR+T7mAoMsU05tXDe/TARaT2AMMHiEoeGHs
 weI05aEo3h9gMNgcuhCtAdbQHlOd+/RDe/BjT0TEusv3Q3PTHKNpQ3Rn2bu8M3LHun8E
 kgSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGNuvw0YGKVbpVyXTvmesOgsJXUFxvTd9TDVS1Xx9aTrChlrhP3uPdeTDCyfxr+uFbGLeUXsCF0NM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy67OPuX2cMfTMdIIVMF3fUcjoyftPlHSeirw7gP3vGNFGS+tFO
 qAPPB7XdxO+BMukh/CA178TVjp4ylZykAGB32ae2QjjMNxq6TSHB
X-Gm-Gg: ASbGncvw0xf5g7A46ULc76v9COntc/0AqpfR19crl3fpkXWIuesMeer1sGHdqr2hNE0
 zdXGmlhuyOKX93qjILf+xCBXXd5Jzotr6LfcBsxzsu0t1WBotyxwmOaTLOe4h1EiwjXiMeYgFv7
 2Rsed74T3Zk3m6HYE0vxlWRraCmPwGmj7OHuuZmisCtFDOkAgZ3jHXm1wc+6f6GV/JmYrtX2O3l
 r1TKZgZGCJFQy4Z3b7pEJDxwQqoIH9I3x268Tp3e7RbWGVl7EOePyll3Koe9xF+CCGGa6JcEVfa
 ZG1aK9WpSuRnFxEZtUTriMSGU8ovfrnY8m08jQBFFo0ltsRzTC47OvwHfuz37NEFTcObTYVoVlk
 27IsGSGnL/Hq4tTFm6qUip0xTEOGXWHw6qsHcDseu9LYrAOMbSJ9+SEQ=
X-Google-Smtp-Source: AGHT+IFr7umJxKzgzhGh/oy0Dih4g5haX41vEbYRI8F+ERkJbmGl9jimDDp7gEjubuafDokQiSZEmA==
X-Received: by 2002:ac8:7d4c:0:b0:476:8cad:72d7 with SMTP id
 d75a77b69052e-4796007888bmr32351221cf.8.1744210056456; 
 Wed, 09 Apr 2025 07:47:36 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:3298]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47964eb9a8fsm8024461cf.49.2025.04.09.07.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 07:47:35 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Apr 2025 10:47:23 -0400
Subject: [PATCH v8 6/6] rust: enable `clippy::ref_as_ptr` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-ptr-as-ptr-v8-6-3738061534ef@gmail.com>
References: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
In-Reply-To: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:

> Using `as` casts may result in silently changing mutability or type.

While this doesn't eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize.  It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                 |  1 +
 rust/bindings/lib.rs     |  1 +
 rust/kernel/device_id.rs |  3 ++-
 rust/kernel/fs/file.rs   |  3 ++-
 rust/kernel/str.rs       |  6 ++++--
 rust/kernel/uaccess.rs   | 10 ++++------
 rust/uapi/lib.rs         |  1 +
 7 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index eb5a942241a2..2a16e02f26db 100644
--- a/Makefile
+++ b/Makefile
@@ -485,6 +485,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::no_mangle_with_rust_abi \
 			    -Wclippy::ptr_as_ptr \
 			    -Wclippy::ptr_cast_constness \
+			    -Wclippy::ref_as_ptr \
 			    -Wclippy::undocumented_unsafe_blocks \
 			    -Wclippy::unnecessary_safety_comment \
 			    -Wclippy::unnecessary_safety_doc \
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index b105a0d899cc..2b69016070c6 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -27,6 +27,7 @@
 #[allow(dead_code)]
 #[allow(clippy::cast_lossless)]
 #[allow(clippy::ptr_as_ptr)]
+#[allow(clippy::ref_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 mod bindings_raw {
     // Manual definition for blocklisted types.
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index 4063f09d76d9..37cc03d1df4c 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
     fn as_ptr(&self) -> *const T::RawType {
         // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
         // to access the sentinel.
-        (self as *const Self).cast()
+        let this: *const Self = self;
+        this.cast()
     }
 
     fn id(&self, index: usize) -> &T::RawType {
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 791f493ada10..559a4bfa123f 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -359,12 +359,13 @@ impl core::ops::Deref for File {
     type Target = LocalFile;
     #[inline]
     fn deref(&self) -> &LocalFile {
+        let this: *const Self = self;
         // SAFETY: The caller provides a `&File`, and since it is a reference, it must point at a
         // valid file for the desired duration.
         //
         // By the type invariants, there are no `fdget_pos` calls that did not take the
         // `f_pos_lock` mutex.
-        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) }
+        unsafe { LocalFile::from_raw_file(this.cast()) }
     }
 }
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 40034f77fc2f..75b4a18c67c4 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -28,8 +28,9 @@ pub const fn is_empty(&self) -> bool {
     /// Creates a [`BStr`] from a `[u8]`.
     #[inline]
     pub const fn from_bytes(bytes: &[u8]) -> &Self {
+        let bytes: *const [u8] = bytes;
         // SAFETY: `BStr` is transparent to `[u8]`.
-        unsafe { &*(bytes as *const [u8] as *const BStr) }
+        unsafe { &*(bytes as *const BStr) }
     }
 
     /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`].
@@ -289,8 +290,9 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
     /// `NUL` byte (or the string will be truncated).
     #[inline]
     pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
+        let bytes: *mut [u8] = bytes;
         // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
-        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
+        unsafe { &mut *(bytes as *mut CStr) }
     }
 
     /// Returns a C pointer to the string.
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e..7a6fc78fc314 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -240,9 +240,10 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
     /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
     /// bounds of this [`UserSliceReader`]. This call may modify `out` even if it returns an error.
     pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
+        let out: *mut [u8] = out;
         // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
         // `out`.
-        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
+        let out = unsafe { &mut *(out as *mut [MaybeUninit<u8>]) };
         self.read_raw(out)
     }
 
@@ -348,6 +349,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         if len > self.length {
             return Err(EFAULT);
         }
+        let value: *const T = value;
         // SAFETY: The reference points to a value of type `T`, so it is valid for reading
         // `size_of::<T>()` bytes.
         //
@@ -355,11 +357,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         // kernel pointer. This mirrors the logic on the C side that skips the check when the length
         // is a compile-time constant.
         let res = unsafe {
-            bindings::_copy_to_user(
-                self.ptr as *mut c_void,
-                (value as *const T).cast::<c_void>(),
-                len,
-            )
+            bindings::_copy_to_user(self.ptr as *mut c_void, value.cast::<c_void>(), len)
         };
         if res != 0 {
             return Err(EFAULT);
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index d5dab4dfabec..6230ba48201d 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -16,6 +16,7 @@
     clippy::all,
     clippy::cast_lossless,
     clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
     clippy::undocumented_unsafe_blocks,
     dead_code,
     missing_docs,

-- 
2.49.0

