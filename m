Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18BAFEACD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096CC10E7F1;
	Wed,  9 Jul 2025 13:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="W6dlfryg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F310E7F1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:53:42 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-ae0aec611beso373002966b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 06:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752069220; x=1752674020;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PjMR0rkfLib4KOAwr7EUr2rSkaUKKqk5NcFEo0YbN/w=;
 b=W6dlfrygMtI/bRJ8bEVv/VOZgNsxFnKjTDrSdt+CoTDCSJ3MHlrNYllbacmy0hqavd
 bXI80FbQiMDXqe/+cgCpoCbpLy73IdPOz6I/5R40/50lVoLrbCpUroP6XeqQkTrzSkKP
 wzdZJANS7qa0s7acfpZUOIs1lbdcQ6Nwm+5vUyEbwzURbZDHrAfRTDZWBg+B7MZWslO8
 LGT1gfBe55oRv4K26cVTI0qf1RMAOS7a/vZHPkjYfM2zpfKeCs6b9N1L83hY8Pr/7+ya
 I8c+h20my2wyFSOJswCbWHS5PY4kB3sCaJv/eI19TijSeFgq5ECy3oTFpDiCTvcBpc8T
 Uk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752069220; x=1752674020;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PjMR0rkfLib4KOAwr7EUr2rSkaUKKqk5NcFEo0YbN/w=;
 b=hvQpitGOfEO3t64+NMxvSQHDJSVzp9tE4860Lq0Vbnfs4zkbEDwJFBHkvf7pjwFXl9
 TASM/AOkB/6+ec6L/OcFZRMGXcP0CClbON4BFK1ntUkghjq/kvenr2MzPBh/AS2GOvVE
 1Yl5NIcJ3o5sW55j6uO2lImmFPYQDJ73XCFiyeB3Sazor0WCysCkmjvHLTu14zryZIPY
 k0sPWkzDPgM4GAsI7I94qFzmEPob1UB9y6HrccIOEzABYdsTl5mmv+yYg+tkL0U9HDiT
 THPZ1SuiFxx5/1VZkcGpihrhFa8iT5kqlfEKrlfT1j59NtAmRJ+Z77MmAHUWOkBKeJxw
 vLkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7rsMskMFRZSCz5dUkchhgq7p1AsHJba5qCYmgSNFG6DPzaZYkUKkhQ+E1AmzJSUPt14RTdRCDfP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUQtsdmq5Brc0aMmvDRHa+yuJ4t84cakyGEO2P6CX0atD/Mqg3
 ZwLvfy5jzIqjlbK8kBZYTsDewusbOBimp2QRV083jpheFzc2AXApidw8GDpEvbOOwLbvn8RV0o3
 8Xx64a0PcJfkBHXOmNA==
X-Google-Smtp-Source: AGHT+IHZ3nBXn4N+Z/Az/MiLRCZM7g2v/tIjPHAsSbmJjozLE+XeV0YAsnIKDu0plnzQocXtSqnZLEtbNnWHtEI=
X-Received: from ejbgz19.prod.google.com ([2002:a17:906:f2d3:b0:ae3:5be2:d994])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d09:b0:ae4:107f:dba2 with SMTP id
 a640c23a62f3a-ae6cf5bb9eemr254498366b.13.1752069220513; 
 Wed, 09 Jul 2025 06:53:40 -0700 (PDT)
Date: Wed, 09 Jul 2025 13:53:36 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF90bmgC/x2MQQqAMAwEvyI5G0gtRfQr4qE2UXOp0oII4t8NH
 meZnQeqFJUKY/NAkUurHtnAtQ2kPeZNUNkYOuoC9TQgm5QEY8UiK/pAvATvemYH9jlt1PvvTfP
 7frzFDO5fAAAA
X-Change-Id: 20250709-device-as-ref-350db5317dd1
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=15349; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=klo7c5tt7NekeywtmvFjoxiWI5wByU3xZSRM1fO02/0=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBobnRjFzxphfhr1oQAtBDE3uhqImpX6deYUUCMw
 bw2msuQsTOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaG50YwAKCRAEWL7uWMY5
 Ri/ZD/49Qg8p0AqQvWJc5hIrQoxfp0DPvLgQRASaSQqQL16JfVwqYkiJWmLXNhoEFnHtEDKy36h
 NTLiqgIpvoiKHrNOPidWGRsAQ4FCu5cXTR6lviorTPTn3RfLbysnaob1l++famJhRvq60yP/m6H
 1cXbZBAHGnBhXR+jJ4AOo7t2PlJlk7HC4P/HZQXxHYUEzTPVYH9M5keesYpG1CTDlUqvIkZ6nkY
 QyvqZhqE9RB2RmSQl00WjKpbXo3vp5QwMHnxu9T6mQw5ZPkDoy8GCoAOwNSbj7G1AzvSdW9EP0I
 39B2vWyiFGsSH4qsyN18O8xQGkDasyrRXzhYBbgSD9GB3jKVqXgmj32NOKp2dN4tj2d5MS+bNep
 8bjjLiDhTtdAALZD+QdKL/mMDiccN+/ELyrixhzy1RvnTcNgRVZJUd8/rWypxcCYr05TGuEwKZY
 DhZ1z8Bx/5pcZ8V2zK49YE0M0qvesNVvHL+16Gxpftcj1Mcvkru+9UTWuLw0At+P8iVyzfX4w7Z
 t7red/rmRstR9VXshFXZBxso7fs7O5TYji8Ij+d7+fBQmT4l8UQuOl1gFEIkULwFJWRFSzsl67R
 RSmZozJtG/Zfyq275ra9gOzIQaE5XaAnmhGrwmGzQ3SevDvqxgn2ZZBbcR1k2zu8r9E1tCPgeQc
 totRF3oE0IsOnrQ==
X-Mailer: b4 0.14.2
Message-ID: <20250709-device-as-ref-v1-1-ebf7059ffa9c@google.com>
Subject: [PATCH] drm: rust: rename Device::as_ref() to Device::from_raw()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 "=?utf-8?q?Krzysztof_Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
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

The prefix as_* should not be used for a constructor. Constructors
usually use the prefix from_* instead.

Some prior art in the stdlib: Box::from_raw, CString::from_raw,
Rc::from_raw, Arc::from_raw, Waker::from_raw, File::from_raw_fd.

There is also prior art in the kernel crate: cpufreq::Policy::from_raw,
fs::File::from_raw_file, Kuid::from_raw, ARef::from_raw,
SeqFile::from_raw, VmaNew::from_raw, Io::from_raw.

Link: https://lore.kernel.org/r/aCZYcs6Aj-cz81qs@pollux
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/auxiliary.rs   |  2 +-
 rust/kernel/cpu.rs         |  2 +-
 rust/kernel/device.rs      |  6 +++---
 rust/kernel/drm/device.rs  |  4 ++--
 rust/kernel/drm/file.rs    |  8 ++++----
 rust/kernel/drm/gem/mod.rs | 16 ++++++++--------
 rust/kernel/drm/ioctl.rs   |  4 ++--
 rust/kernel/faux.rs        |  2 +-
 rust/kernel/miscdevice.rs  |  2 +-
 rust/kernel/net/phy.rs     |  2 +-
 rust/kernel/pci.rs         |  2 +-
 rust/kernel/platform.rs    |  2 +-
 12 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index d2cfe1eeefb6054a97fefd6e499772c3fc4c443e..a4ac00990a441f6f92ec6e6bdbd7699d2777da00 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -276,7 +276,7 @@ fn as_ref(&self) -> &device::Device<Ctx> {
         let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
 
         // SAFETY: `dev` points to a valid `struct device`.
-        unsafe { device::Device::as_ref(dev) }
+        unsafe { device::Device::from_raw(dev) }
     }
 }
 
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index b75403b0eb5614e5652e6cad9341ae217edbe5bb..5de730c8d81722873ba2349a1c9c4d6c17701134 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -147,5 +147,5 @@ pub unsafe fn from_cpu(cpu: CpuId) -> Result<&'static Device> {
 
     // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
     // a `struct device` and is never freed by the C code.
-    Ok(unsafe { Device::as_ref(ptr) })
+    Ok(unsafe { Device::from_raw(ptr) })
 }
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index dea06b79ecb536cee4d2b90c21b74658658417c7..f70d768351204d7f49c6bebbf27ee26f4d11cdfa 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -57,7 +57,7 @@ impl Device {
     /// While not officially documented, this should be the case for any `struct device`.
     pub unsafe fn get_device(ptr: *mut bindings::device) -> ARef<Self> {
         // SAFETY: By the safety requirements ptr is valid
-        unsafe { Self::as_ref(ptr) }.into()
+        unsafe { Self::from_raw(ptr) }.into()
     }
 }
 
@@ -82,7 +82,7 @@ pub(crate) fn parent(&self) -> Option<&Self> {
             // - Since `parent` is not NULL, it must be a valid pointer to a `struct device`.
             // - `parent` is valid for the lifetime of `self`, since a `struct device` holds a
             //   reference count of its parent.
-            Some(unsafe { Self::as_ref(parent) })
+            Some(unsafe { Self::from_raw(parent) })
         }
     }
 
@@ -94,7 +94,7 @@ pub(crate) fn parent(&self) -> Option<&Self> {
     /// i.e. it must be ensured that the reference count of the C `struct device` `ptr` points to
     /// can't drop to zero, for the duration of this function call and the entire duration when the
     /// returned reference exists.
-    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::device) -> &'a Self {
         // SAFETY: Guaranteed by the safety requirements of the function.
         unsafe { &*ptr.cast() }
     }
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ead64b93325189f481d9b37c3c6eae..d4906675c8d59f838a15388d1dad6b2960696ebb 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -154,7 +154,7 @@ unsafe fn from_drm_device(ptr: *const bindings::drm_device) -> *mut Self {
     /// Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
     /// embedded in `Self`.
     #[doc(hidden)]
-    pub unsafe fn as_ref<'a>(ptr: *const bindings::drm_device) -> &'a Self {
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::drm_device) -> &'a Self {
         // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
         // `struct drm_device` embedded in `Self`.
         let ptr = unsafe { Self::from_drm_device(ptr) };
@@ -190,7 +190,7 @@ impl<T: drm::Driver> AsRef<device::Device> for Device<T> {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
         // which is guaranteed by the type invariant.
-        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
     }
 }
 
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index b9527705e5514f00ed5a9c459f3c4161daf5b61d..e8789c9110d654df2561a88a53bc6b1cfa709fdd 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -32,7 +32,7 @@ impl<T: DriverFile> File<T> {
     /// # Safety
     ///
     /// `raw_file` must be a valid pointer to an open `struct drm_file`, opened through `T::open`.
-    pub unsafe fn as_ref<'a>(ptr: *mut bindings::drm_file) -> &'a File<T> {
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_file) -> &'a File<T> {
         // SAFETY: `raw_file` is valid by the safety requirements of this function.
         unsafe { &*ptr.cast() }
     }
@@ -61,10 +61,10 @@ pub(crate) extern "C" fn open_callback(
         // SAFETY: A callback from `struct drm_driver::open` guarantees that
         // - `raw_dev` is valid pointer to a `struct drm_device`,
         // - the corresponding `struct drm_device` has been registered.
-        let drm = unsafe { drm::Device::as_ref(raw_dev) };
+        let drm = unsafe { drm::Device::from_raw(raw_dev) };
 
         // SAFETY: `raw_file` is a valid pointer to a `struct drm_file`.
-        let file = unsafe { File::<T>::as_ref(raw_file) };
+        let file = unsafe { File::<T>::from_raw(raw_file) };
 
         let inner = match T::open(drm) {
             Err(e) => {
@@ -89,7 +89,7 @@ pub(crate) extern "C" fn postclose_callback(
         raw_file: *mut bindings::drm_file,
     ) {
         // SAFETY: This reference won't escape this function
-        let file = unsafe { File::<T>::as_ref(raw_file) };
+        let file = unsafe { File::<T>::from_raw(raw_file) };
 
         // SAFETY: `file.driver_priv` has been created in `open_callback` through `KBox::into_raw`.
         let _ = unsafe { KBox::from_raw(file.driver_priv()) };
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 4cd69fa84318c3ff2cec57949e9bab05559a3c2f..a24c9a2fc201b69cc31b76282a68aec188aaac73 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -51,7 +51,7 @@ pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
     /// - `self_ptr` must be a valid pointer to `Self`.
     /// - The caller promises that holding the immutable reference returned by this function does
     ///   not violate rust's data aliasing rules and remains valid throughout the lifetime of `'a`.
-    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self;
+    unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self;
 }
 
 // SAFETY: All gem objects are refcounted.
@@ -86,12 +86,12 @@ extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
 ) -> core::ffi::c_int {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
     let file = unsafe {
-        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
+        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::from_raw(raw_file)
     };
     // SAFETY: `open_callback` is specified in the AllocOps structure for `Object<T>`, ensuring that
     // `raw_obj` is indeed contained within a `Object<T>`.
     let obj = unsafe {
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
+        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::from_raw(raw_obj)
     };
 
     match T::open(obj, file) {
@@ -106,12 +106,12 @@ extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
 ) {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
     let file = unsafe {
-        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
+        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::from_raw(raw_file)
     };
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
     let obj = unsafe {
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
+        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::from_raw(raw_obj)
     };
 
     T::close(obj, file);
@@ -124,7 +124,7 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object {
         self.obj.get()
     }
 
-    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
+    unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
         let self_ptr: *mut Opaque<bindings::drm_gem_object> = self_ptr.cast();
 
         // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the safety contract of this
@@ -170,9 +170,9 @@ fn lookup_handle(
         // - A `drm::Driver` can only have a single `File` implementation.
         // - `file` uses the same `drm::Driver` as `Self`.
         // - Therefore, we're guaranteed that `ptr` must be a gem object embedded within `Self`.
-        // - And we check if the pointer is null befoe calling as_ref(), ensuring that `ptr` is a
+        // - And we check if the pointer is null befoe calling from_raw(), ensuring that `ptr` is a
         //   valid pointer to an initialized `Self`.
-        let obj = unsafe { Self::as_ref(ptr) };
+        let obj = unsafe { Self::from_raw(ptr) };
 
         // SAFETY:
         // - We take ownership of the reference of `drm_gem_object_lookup()`.
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 445639404fb7fe2cf3276890b1236f611ded9f3f..fdec01c371687c79d660457bd2bd6e09b2400d35 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -134,7 +134,7 @@ macro_rules! declare_drm_ioctls {
                             // FIXME: Currently there is nothing enforcing that the types of the
                             // dev/file match the current driver these ioctls are being declared
                             // for, and it's not clear how to enforce this within the type system.
-                            let dev = $crate::drm::device::Device::as_ref(raw_dev);
+                            let dev = $crate::drm::device::Device::from_raw(raw_dev);
                             // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
@@ -142,7 +142,7 @@ macro_rules! declare_drm_ioctls {
                                 &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
                             };
                             // SAFETY: This is just the DRM file structure
-                            let file = unsafe { $crate::drm::File::as_ref(raw_file) };
+                            let file = unsafe { $crate::drm::File::from_raw(raw_file) };
 
                             match $func(dev, data, file) {
                                 Err(e) => e.to_errno(),
diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 8a50fcd4c9bbba1f894a09080446ca3173571b03..7a906099993f1bf8c8caf6ab64f920faf81cafb4 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -54,7 +54,7 @@ impl AsRef<device::Device> for Registration {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
         // a valid initialized `device`.
-        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
+        unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
     }
 }
 
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 939278bc7b03489a647b697012e09223871c90cd..a6dc11935ee3fe495640e06509d86f89bd201ca1 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -92,7 +92,7 @@ pub fn device(&self) -> &Device {
         // function tells the borrow-checker that the `&Device` reference must not outlive the
         // `&MiscDeviceRegistration<T>` used to obtain it, so the last use of the reference must be
         // before the underlying `struct miscdevice` is destroyed.
-        unsafe { Device::as_ref((*self.as_raw()).this_device) }
+        unsafe { Device::from_raw((*self.as_raw()).this_device) }
     }
 }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 32ea43ece6465a7e09c9d2332ca83c4bc27b7104..bd43a726f7d398278dae2546fca702fa70c68cf0 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -285,7 +285,7 @@ impl AsRef<kernel::device::Device> for Device {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
-        unsafe { kernel::device::Device::as_ref(addr_of_mut!((*phydev).mdio.dev)) }
+        unsafe { kernel::device::Device::from_raw(addr_of_mut!((*phydev).mdio.dev)) }
     }
 }
 
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 8435f8132e38129ccc3495e7c4d3237fcaa97ad9..d620902219d78191d744df6a8970c0a99dbd47da 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -454,7 +454,7 @@ fn as_ref(&self) -> &device::Device<Ctx> {
         let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
 
         // SAFETY: `dev` points to a valid `struct device`.
-        unsafe { device::Device::as_ref(dev) }
+        unsafe { device::Device::from_raw(dev) }
     }
 }
 
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 5b21fa517e55348582622ec10471918919502959..76e09429cdc275354b3ce84da5e74f7b97660430 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -215,7 +215,7 @@ fn as_ref(&self) -> &device::Device<Ctx> {
         let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
 
         // SAFETY: `dev` points to a valid `struct device`.
-        unsafe { device::Device::as_ref(dev) }
+        unsafe { device::Device::from_raw(dev) }
     }
 }
 

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250709-device-as-ref-350db5317dd1

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

