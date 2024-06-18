Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF0A90DFF6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE3D10E810;
	Tue, 18 Jun 2024 23:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XJU7pFiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4410E80B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5Dq1z2px+aRPeD/cZv0m9h+suHfEeiyXETJRsMzg14=;
 b=XJU7pFiECBrrmguebOWIdG7cwm4MCwizEJqNK4S9eaejnZE4sfNe8NxeYpNSuWFGuAxth/
 sFqJhy8PL9B4gqVpgAVL4NM5OriRc+ig3QH3rYZ4mWn1KktSZN25gpS4cMKnWaLRz430mX
 cFDYYgg9WDSesJ9XUnfPt9iR+A/GOJE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-w771qpi6NNq5-T93YA3vsA-1; Tue, 18 Jun 2024 19:33:55 -0400
X-MC-Unique: w771qpi6NNq5-T93YA3vsA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42196394b72so38990105e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753635; x=1719358435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R5Dq1z2px+aRPeD/cZv0m9h+suHfEeiyXETJRsMzg14=;
 b=eAMQ8+NGuc9ByP8jdAY4qgAZ6kgJ/4OBGcF0r37wxGIdfSMBaqET01AH4XGQhG020o
 ky1H0seV3H+8eTDlp6Us029JNXC03M16wM3QqXFevG7VzwChS57X4ixLQK1/X+myl26I
 9cp02NZVaZ2q8WYe/zoL7fBbAnCCKm36H2fMaGQ83kn9q0g5nnGoZ4vYVzhHOnAXMXEG
 ncaKTUIMtDBujxdmcE5bInVhsLt6dXp2TZOJNdbDV+6CjuCvlCIlI6q9FcLR5ENtOUyd
 jqAnL0V7YuIUV9QTKCXFMaIC3RporVS9WcDjHhh1hfqqFOCB43RAnp4GbYyfnLzWQVQh
 +7fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXke62rHJn78402wUblRMdqXsYm91hWWrpvxTaUuP+bFRMLKnQyKbXfRzhhiyZntGsfMQHj1Xsn7OMZNfnI47UxWYtyOx4H4PYazWWiFn+L
X-Gm-Message-State: AOJu0YyRu9lvrFRuCnlpdNKb1FBXGStIL9z3q5GvU+fC92sx5gPrsFvt
 I4v5+dueubz5VXbpvS21fzIbxzBOSxJF702QN/PdjcCDWWd8q6LZWt+Zz8r3JztMJ2FATKnabL+
 kRk/V7BPPP0uRvO/UyJ9aNm64HHUCmrhou/SAQSLMnuEUQgJ5KBq7ikmnPdsTJtDcWg==
X-Received: by 2002:a05:600c:1509:b0:423:b756:cdaf with SMTP id
 5b1f17b1804b1-42475184335mr4496045e9.23.1718753634666; 
 Tue, 18 Jun 2024 16:33:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7DFrDtl23v3+cqL/+gEOk2Z9UNK1uWE0jVahwUIBFUblEr3OBIPlLUqscQPdotpIKf7IZmA==
X-Received: by 2002:a05:600c:1509:b0:423:b756:cdaf with SMTP id
 5b1f17b1804b1-42475184335mr4495775e9.23.1718753634368; 
 Tue, 18 Jun 2024 16:33:54 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4246eb25af4sm49374715e9.4.2024.06.18.16.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:53 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 6/8] rust: drm: file: Add File abstraction
Date: Wed, 19 Jun 2024 01:31:42 +0200
Message-ID: <20240618233324.14217-7-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
References: <20240618233324.14217-1-dakr@redhat.com>
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
 rust/kernel/drm/device.rs       |   4 +-
 rust/kernel/drm/drv.rs          |   3 +
 rust/kernel/drm/file.rs         | 116 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 5 files changed, 123 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/drm/file.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1d12ee7d3c97..3f17961b4c3b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index c62516f79221..c6ed8d86700b 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -57,8 +57,8 @@ macro_rules! drm_legacy_fields {
 impl<T: drm::drv::Driver> Device<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
-        open: None, // TODO: File abstraction
-        postclose: None, // TODO: File abstraction
+        open: Some(drm::file::open_callback::<T::File>),
+        postclose: Some(drm::file::postclose_callback::<T::File>),
         lastclose: None,
         unload: None,
         release: Some(Self::release),
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index ebb79a8c90ee..895409f04664 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -139,6 +139,9 @@ pub trait Driver {
     /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
     type Object: AllocImpl;
 
+    /// The type used to represent a DRM File (client)
+    type File: drm::file::DriverFile;
+
     /// Driver metadata
     const INFO: DriverInfo;
 
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
new file mode 100644
index 000000000000..0b6366734c61
--- /dev/null
+++ b/rust/kernel/drm/file.rs
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM File objects.
+//!
+//! C header: [`include/linux/drm/drm_file.h`](srctree/include/linux/drm/drm_file.h)
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
+/// The open callback of a `struct drm_file`.
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
+/// The postclose callback of a `struct drm_file`.
+pub(super) unsafe extern "C" fn postclose_callback<T: DriverFile>(
+    _raw_dev: *mut bindings::drm_device,
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
+/// Generic trait to allow users that don't care about driver specifics to accept any `File<T>`.
+///
+/// # Safety
+///
+/// Must only be implemented for `File<T>` and return the pointer, following the normal invariants
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

