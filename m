Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC558CA143
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 19:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4E110E521;
	Mon, 20 May 2024 17:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WttHfd28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDE510E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5P5B+YM/OjD534xio0dIE5yHPWEzGnlxEKEl3OyNZXU=;
 b=WttHfd28pSJKc0k2PDRhK4G13cTpmaZ5jDlGzYaPa7DnD5w8cjh1YJcEG/XCVITkjrIn6I
 e1xiAHXj9IMfXdYo7TW9IYd3nHlgBnsgPYkDvJQEW8JJimZF6YeflqZ3iv6oc/KdcOD9nt
 9tVjw20FcfAUByBKM7TeHIKaDADBNLg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-sWFyZRiHN9i3x92bEEF_3Q-1; Mon, 20 May 2024 13:24:30 -0400
X-MC-Unique: sWFyZRiHN9i3x92bEEF_3Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-41fda32e6c0so58631285e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225869; x=1716830669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5P5B+YM/OjD534xio0dIE5yHPWEzGnlxEKEl3OyNZXU=;
 b=YKoi19nCmyjzqQ2q36C9EnVLpaVpUsfGTnwdcBej0wD06wo6e1IO6JXzNB0FFmyd8/
 2PjyZnCgYNJNWb5AQmbjBgGzFD7cdHCgOuIfmyUFjtzyNrwdSQrUqGYwihF7aje7yj9L
 9wY0LZjEXR2GyjDKWBUFsKian0KE08BRe1z9LwvxuKtVphkdjbKGizdC+8Hd5mcOnKhK
 ZI+nC/+/Rrp1/ybVSemPatn1jdgZfDJYiHhdLMKf3C7qEmG1B/9pprPAL6cwEZ9ga/lb
 Xk0y3vSpDrnjttLfyL1/W19TZtFspxs5nEGV44AvQsUjxFAZbtF3DwdN4IVlQDqPpJ2C
 a+Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKGUGuf/fkuaf5HBZHDAy2I+ammLR8/HbgjRgQVYwDyeEB+URkEeen0PJdZWkQvgInttGZc4u/8YXj/p3xL6ZoQOW0ia7VINyKDRh3igPy
X-Gm-Message-State: AOJu0Yz4ILLoccpu8od0z/urvsV7OSzNtm4/u82aGrk+bOSPlq5QeHM2
 iYIRYv6UDFmczZpv7jEOwT9tKLfKtjeMWYLkyRbv1H3sqKCaCdRYN85F9OtbtDbm2RS9idRNFBN
 kNpWWTyvoDjcKt7bEMnu3C/UWg80odI3sWtHav3+YESV/fxU6mwRxX+6ZpB2PU6AY9g==
X-Received: by 2002:a05:600c:5101:b0:419:f4d6:463b with SMTP id
 5b1f17b1804b1-420e1a301f8mr50659845e9.14.1716225869684; 
 Mon, 20 May 2024 10:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD66DGPVTzcTg/uKLOomBnDurKshNpwlQP73J4t42qg3pUB6/sWqwv/uKUk7zNux5Kw2TyTw==
X-Received: by 2002:a05:600c:5101:b0:419:f4d6:463b with SMTP id
 5b1f17b1804b1-420e1a301f8mr50659645e9.14.1716225869295; 
 Mon, 20 May 2024 10:24:29 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce24cdsm431781365e9.15.2024.05.20.10.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:24:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 5/8] rust: drm: file: Add File abstraction
Date: Mon, 20 May 2024 19:24:17 +0200
Message-ID: <20240520172422.181763-2-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

From: Asahi Lina <lina@asahilina.net>

A DRM File is the DRM counterpart to a kernel file structure,
representing an open DRM file descriptor. Add a Rust abstraction to
allow drivers to implement their own File types that implement the
DriverFile trait.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/drv.rs          |   7 +-
 rust/kernel/drm/file.rs         | 113 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 4 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/drm/file.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 831fbfe03a47..c591811ccb67 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index 5dd8f3f8df7c..c5a63663ea21 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -131,6 +131,9 @@ pub trait Driver {
     /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
     type Object: AllocImpl;
 
+    /// The type used to represent a DRM File (client)
+    type File: drm::file::DriverFile;
+
     /// Driver metadata
     const INFO: DriverInfo;
 
@@ -200,8 +203,8 @@ macro_rules! drm_device_register {
 impl<T: Driver> Registration<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
-        open: None, // TODO: File abstraction
-        postclose: None, // TODO: File abstraction
+        open: Some(drm::file::open_callback::<T::File>),
+        postclose: Some(drm::file::postclose_callback::<T::File>),
         lastclose: None,
         unload: None,
         release: None,
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
new file mode 100644
index 000000000000..a25b8c61f4ee
--- /dev/null
+++ b/rust/kernel/drm/file.rs
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM File objects.
+//!
+//! C header: [`include/linux/drm/drm_file.h`](../../../../include/linux/drm/drm_file.h)
+
+use crate::{bindings, drm, error::Result};
+use alloc::boxed::Box;
+use core::marker::PhantomData;
+use core::pin::Pin;
+
+/// Trait that must be implemented by DRM drivers to represent a DRM File (a client instance).
+pub trait DriverFile {
+    /// The parent `Driver` implementation for this `DriverFile`.
+    type Driver: drm::drv::Driver;
+
+    /// Open a new file (called when a client opens the DRM device).
+    fn open(device: &drm::device::Device<Self::Driver>) -> Result<Pin<Box<Self>>>;
+}
+
+/// An open DRM File.
+///
+/// # Invariants
+/// `raw` is a valid pointer to a `drm_file` struct.
+#[repr(transparent)]
+pub struct File<T: DriverFile> {
+    raw: *mut bindings::drm_file,
+    _p: PhantomData<T>,
+}
+
+pub(super) unsafe extern "C" fn open_callback<T: DriverFile>(
+    raw_dev: *mut bindings::drm_device,
+    raw_file: *mut bindings::drm_file,
+) -> core::ffi::c_int {
+    let drm = unsafe { drm::device::Device::borrow(raw_dev) };
+    // SAFETY: This reference won't escape this function
+    let file = unsafe { &mut *raw_file };
+
+    let inner = match T::open(drm) {
+        Err(e) => {
+            return e.to_errno();
+        }
+        Ok(i) => i,
+    };
+
+    // SAFETY: This pointer is treated as pinned, and the Drop guarantee is upheld below.
+    file.driver_priv = Box::into_raw(unsafe { Pin::into_inner_unchecked(inner) }) as *mut _;
+
+    0
+}
+
+pub(super) unsafe extern "C" fn postclose_callback<T: DriverFile>(
+    _dev: *mut bindings::drm_device,
+    raw_file: *mut bindings::drm_file,
+) {
+    // SAFETY: This reference won't escape this function
+    let file = unsafe { &*raw_file };
+
+    // Drop the DriverFile
+    unsafe {
+        let _ = Box::from_raw(file.driver_priv as *mut T);
+    };
+}
+
+impl<T: DriverFile> File<T> {
+    // Not intended to be called externally, except via declare_drm_ioctls!()
+    #[doc(hidden)]
+    pub unsafe fn from_raw(raw_file: *mut bindings::drm_file) -> File<T> {
+        File {
+            raw: raw_file,
+            _p: PhantomData,
+        }
+    }
+
+    #[allow(dead_code)]
+    /// Return the raw pointer to the underlying `drm_file`.
+    pub(super) fn raw(&self) -> *const bindings::drm_file {
+        self.raw
+    }
+
+    /// Return an immutable reference to the raw `drm_file` structure.
+    pub(super) fn file(&self) -> &bindings::drm_file {
+        unsafe { &*self.raw }
+    }
+
+    /// Return a pinned reference to the driver file structure.
+    pub fn inner(&self) -> Pin<&T> {
+        unsafe { Pin::new_unchecked(&*(self.file().driver_priv as *const T)) }
+    }
+}
+
+impl<T: DriverFile> crate::private::Sealed for File<T> {}
+
+/// Generic trait to allow users that don't care about driver specifics to accept any File<T>.
+///
+/// # Safety
+/// Must only be implemented for File<T> and return the pointer, following the normal invariants
+/// of that type.
+pub unsafe trait GenericFile: crate::private::Sealed {
+    /// Returns the raw const pointer to the `struct drm_file`
+    fn raw(&self) -> *const bindings::drm_file;
+    /// Returns the raw mut pointer to the `struct drm_file`
+    fn raw_mut(&mut self) -> *mut bindings::drm_file;
+}
+
+unsafe impl<T: DriverFile> GenericFile for File<T> {
+    fn raw(&self) -> *const bindings::drm_file {
+        self.raw
+    }
+    fn raw_mut(&mut self) -> *mut bindings::drm_file {
+        self.raw
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 69376b3c6db9..a767942d0b52 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -4,4 +4,5 @@
 
 pub mod device;
 pub mod drv;
+pub mod file;
 pub mod ioctl;
-- 
2.45.1

