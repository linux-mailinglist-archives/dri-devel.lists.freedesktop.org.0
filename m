Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1916990DFFA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2103810E805;
	Tue, 18 Jun 2024 23:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DmcwQ7XN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5810E81A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rX17Ynp5kjTABr7Arpco1GyGC6qaf7qHT4D9XChbblc=;
 b=DmcwQ7XNBXZLlqCs2EUpgLB2j34HvLRSbpYpCFXjHVQFnK7mpyYmCW8sFxiynqJ0MnYJRa
 X7t8Y/yolFRDBQbVq0KuVONKosmcTej9IA1F6kO8HfUfZy7LjeSH6/6a3U7dk3xsNWMcYA
 tEmJHT0XA+KdwPS1ew7qZxyFKIznFho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-hPT1L74IPMC-oEUTX0nQfw-1; Tue, 18 Jun 2024 19:34:00 -0400
X-MC-Unique: hPT1L74IPMC-oEUTX0nQfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4217a6a00d8so39338585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753639; x=1719358439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rX17Ynp5kjTABr7Arpco1GyGC6qaf7qHT4D9XChbblc=;
 b=tNXfmT0rxob4Sh5YGPciTbPJQpRLCij8ij9K7EhFqBhTv60F8d+JfzsQOhgXQxxJ/3
 ub5ruv826Klv/NMtBFM9BVA4jeRsPQYt9VBmQ3r8yoEO29yL0N2d1wFhq5TPt6qP6VtR
 e+6P0At6Gh/ai1vZGHI6kF+AT0j8ZI0keliYvMegOgJ41ctyQGeI6Na47lUQ9vpHOeKH
 cKt3vy8eKXrrei29+H5aJEqytVu6DriIP7aP9YFOl3v/a8ye0wu2TABczAbhWlK7iheK
 YmB9La1DCrXmh8i0LmOXeEtBvZWzRh2kcoBy35Z1W+o9MH78yGwGLEU4Gjuagnz4WLX7
 q3cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsqsUtjAWhvvNMCFXV/RcEtTVt10PltukbT1VL6YbqkoB6n4xFowON2ZRIAIMZjh1undyMwW9a8jX/3yBMOLhYGFgiirYjzWCok7w5JyWJ
X-Gm-Message-State: AOJu0YzUaVOalisMfAHVgH9kjtjx9Z9VQiWthvWsSRMv/p9Tvv1NDB6X
 nKFEs/wnXDEkSalpWMGU8f4Soqsqx+VTzkvF59oox13PaFFVAz+OvlTR9V6YZ8RuUmhY6w9kbyO
 o511mEO+Jl8gdP0ybaRzjVdiYmSzBOV5Ddq1fJUxf08TF2eVHGpq75NTLAiK8txb6Ew==
X-Received: by 2002:a05:600c:47cf:b0:423:b63e:74d1 with SMTP id
 5b1f17b1804b1-42475296a85mr4688795e9.29.1718753638960; 
 Tue, 18 Jun 2024 16:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOa7woJJzq8BR2gVnLTKiZG/T/seFOpSGmvPhaqEP1bNK/u8mmko3Sekw3yuKSLjz27NLLkA==
X-Received: by 2002:a05:600c:47cf:b0:423:b63e:74d1 with SMTP id
 5b1f17b1804b1-42475296a85mr4688685e9.29.1718753638430; 
 Tue, 18 Jun 2024 16:33:58 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f61277fesm206880965e9.21.2024.06.18.16.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:57 -0700 (PDT)
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
Subject: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
Date: Wed, 19 Jun 2024 01:31:43 +0200
Message-ID: <20240618233324.14217-8-dakr@redhat.com>
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

The DRM GEM subsystem is the DRM memory management subsystem used by
most modern drivers. Add a Rust abstraction to allow Rust DRM driver
implementations to use it.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Co-developed-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |  23 ++
 rust/kernel/drm/device.rs       |   4 +-
 rust/kernel/drm/drv.rs          |   2 +-
 rust/kernel/drm/gem/mod.rs      | 409 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 6 files changed, 438 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/drm/gem/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3f17961b4c3b..e4ffc47da5ec 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -9,6 +9,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index c7f90b457af5..5d138eb53fc6 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -20,6 +20,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_gem.h>
 #include <kunit/test-bug.h>
 #include <linux/bug.h>
 #include <linux/build_bug.h>
@@ -311,6 +312,28 @@ u64 rust_helper_pci_resource_len(struct pci_dev *pdev, int barnr)
 	return pci_resource_len(pdev, barnr);
 }
 
+#ifdef CONFIG_DRM
+
+void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
+{
+	drm_gem_object_get(obj);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_object_get);
+
+void rust_helper_drm_gem_object_put(struct drm_gem_object *obj)
+{
+	drm_gem_object_put(obj);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_gem_object_put);
+
+__u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
+{
+	return drm_vma_node_offset_addr(node);
+}
+EXPORT_SYMBOL_GPL(rust_helper_drm_vma_node_offset_addr);
+
+#endif
+
 /*
  * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
  * use it in contexts where Rust expects a `usize` like slice (array) indices.
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index c6ed8d86700b..2b687033caa2 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -84,9 +84,11 @@ impl<T: drm::drv::Driver> Device<T> {
         driver_features: T::FEATURES,
         ioctls: T::IOCTLS.as_ptr(),
         num_ioctls: T::IOCTLS.len() as i32,
-        fops: core::ptr::null_mut() as _,
+        fops: &Self::GEM_FOPS as _,
     };
 
+    const GEM_FOPS: bindings::file_operations = drm::gem::create_fops();
+
     /// Create a new `drm::device::Device` for a `drm::drv::Driver`.
     pub fn new(dev: &device::Device, data: T::Data) -> Result<ARef<Self>> {
         // SAFETY: `dev` is valid by its type invarants; `VTABLE`, as a `const` is pinned to the
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index 895409f04664..0cf3fb1cea53 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -118,7 +118,7 @@ pub struct AllocOps {
 }
 
 /// Trait for memory manager implementations. Implemented internally.
-pub trait AllocImpl: Sealed {
+pub trait AllocImpl: Sealed + drm::gem::IntoGEMObject {
     /// The C callback operations for this memory manager.
     const ALLOC_OPS: AllocOps;
 }
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
new file mode 100644
index 000000000000..b5208fdf66c2
--- /dev/null
+++ b/rust/kernel/drm/gem/mod.rs
@@ -0,0 +1,409 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM GEM API
+//!
+//! C header: [`include/linux/drm/drm_gem.h`](srctree/include/linux/drm/drm_gem.h)
+
+use alloc::boxed::Box;
+
+use crate::{
+    alloc::flags::*,
+    bindings,
+    drm::{device, drv, file},
+    error::{to_result, Result},
+    prelude::*,
+};
+use core::{marker::PhantomPinned, mem, ops::Deref, ops::DerefMut};
+
+/// GEM object functions, which must be implemented by drivers.
+pub trait BaseDriverObject<T: BaseObject>: Sync + Send + Sized {
+    /// Create a new driver data object for a GEM object of a given size.
+    fn new(dev: &device::Device<T::Driver>, size: usize) -> impl PinInit<Self, Error>;
+
+    /// Open a new handle to an existing object, associated with a File.
+    fn open(
+        _obj: &<<T as IntoGEMObject>::Driver as drv::Driver>::Object,
+        _file: &file::File<<<T as IntoGEMObject>::Driver as drv::Driver>::File>,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// Close a handle to an existing object, associated with a File.
+    fn close(
+        _obj: &<<T as IntoGEMObject>::Driver as drv::Driver>::Object,
+        _file: &file::File<<<T as IntoGEMObject>::Driver as drv::Driver>::File>,
+    ) {
+    }
+}
+
+/// Trait that represents a GEM object subtype
+pub trait IntoGEMObject: Sized + crate::private::Sealed {
+    /// Owning driver for this type
+    type Driver: drv::Driver;
+
+    /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
+    /// this owning object is valid.
+    fn gem_obj(&self) -> &bindings::drm_gem_object;
+
+    /// Converts a pointer to a `drm_gem_object` into a pointer to this type.
+    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self;
+}
+
+/// Trait which must be implemented by drivers using base GEM objects.
+pub trait DriverObject: BaseDriverObject<Object<Self>> {
+    /// Parent `Driver` for this object.
+    type Driver: drv::Driver;
+}
+
+unsafe extern "C" fn free_callback<T: DriverObject>(obj: *mut bindings::drm_gem_object) {
+    // SAFETY: All of our objects are Object<T>.
+    let this = unsafe { crate::container_of!(obj, Object<T>, obj) } as *mut Object<T>;
+
+    // SAFETY: The pointer we got has to be valid
+    unsafe { bindings::drm_gem_object_release(obj) };
+
+    // SAFETY: All of our objects are allocated via Box<>, and we're in the
+    // free callback which guarantees this object has zero remaining references,
+    // so we can drop it
+    unsafe {
+        let _ = Box::from_raw(this);
+    };
+}
+
+unsafe extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
+    raw_obj: *mut bindings::drm_gem_object,
+    raw_file: *mut bindings::drm_file,
+) -> core::ffi::c_int {
+    // SAFETY: The pointer we got has to be valid.
+    let file = unsafe {
+        file::File::<<<U as IntoGEMObject>::Driver as drv::Driver>::File>::from_raw(raw_file)
+    };
+    let obj =
+        <<<U as IntoGEMObject>::Driver as drv::Driver>::Object as IntoGEMObject>::from_gem_obj(
+            raw_obj,
+        );
+
+    // SAFETY: from_gem_obj() returns a valid pointer as long as the type is
+    // correct and the raw_obj we got is valid.
+    match T::open(unsafe { &*obj }, &file) {
+        Err(e) => e.to_errno(),
+        Ok(()) => 0,
+    }
+}
+
+unsafe extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
+    raw_obj: *mut bindings::drm_gem_object,
+    raw_file: *mut bindings::drm_file,
+) {
+    // SAFETY: The pointer we got has to be valid.
+    let file = unsafe {
+        file::File::<<<U as IntoGEMObject>::Driver as drv::Driver>::File>::from_raw(raw_file)
+    };
+    let obj =
+        <<<U as IntoGEMObject>::Driver as drv::Driver>::Object as IntoGEMObject>::from_gem_obj(
+            raw_obj,
+        );
+
+    // SAFETY: from_gem_obj() returns a valid pointer as long as the type is
+    // correct and the raw_obj we got is valid.
+    T::close(unsafe { &*obj }, &file);
+}
+
+impl<T: DriverObject> IntoGEMObject for Object<T> {
+    type Driver = T::Driver;
+
+    fn gem_obj(&self) -> &bindings::drm_gem_object {
+        &self.obj
+    }
+
+    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Object<T> {
+        unsafe { crate::container_of!(obj, Object<T>, obj) as *mut Object<T> }
+    }
+}
+
+/// Base operations shared by all GEM object classes
+pub trait BaseObject: IntoGEMObject {
+    /// Returns the size of the object in bytes.
+    fn size(&self) -> usize {
+        self.gem_obj().size
+    }
+
+    /// Creates a new reference to the object.
+    fn reference(&self) -> ObjectRef<Self> {
+        // SAFETY: Having a reference to an Object implies holding a GEM reference
+        unsafe {
+            bindings::drm_gem_object_get(self.gem_obj() as *const _ as *mut _);
+        }
+        ObjectRef {
+            ptr: self as *const _,
+        }
+    }
+
+    /// Creates a new handle for the object associated with a given `File`
+    /// (or returns an existing one).
+    fn create_handle(
+        &self,
+        file: &file::File<<<Self as IntoGEMObject>::Driver as drv::Driver>::File>,
+    ) -> Result<u32> {
+        let mut handle: u32 = 0;
+        // SAFETY: The arguments are all valid per the type invariants.
+        to_result(unsafe {
+            bindings::drm_gem_handle_create(
+                file.raw() as *mut _,
+                self.gem_obj() as *const _ as *mut _,
+                &mut handle,
+            )
+        })?;
+        Ok(handle)
+    }
+
+    /// Looks up an object by its handle for a given `File`.
+    fn lookup_handle(
+        file: &file::File<<<Self as IntoGEMObject>::Driver as drv::Driver>::File>,
+        handle: u32,
+    ) -> Result<ObjectRef<Self>> {
+        // SAFETY: The arguments are all valid per the type invariants.
+        let ptr = unsafe { bindings::drm_gem_object_lookup(file.raw() as *mut _, handle) };
+
+        if ptr.is_null() {
+            Err(ENOENT)
+        } else {
+            Ok(ObjectRef {
+                ptr: ptr as *const _,
+            })
+        }
+    }
+
+    /// Creates an mmap offset to map the object from userspace.
+    fn create_mmap_offset(&self) -> Result<u64> {
+        // SAFETY: The arguments are valid per the type invariant.
+        to_result(unsafe {
+            bindings::drm_gem_create_mmap_offset(self.gem_obj() as *const _ as *mut _)
+        })?;
+        Ok(unsafe {
+            bindings::drm_vma_node_offset_addr(&self.gem_obj().vma_node as *const _ as *mut _)
+        })
+    }
+}
+
+impl<T: IntoGEMObject> BaseObject for T {}
+
+/// A base GEM object.
+#[repr(C)]
+#[pin_data]
+pub struct Object<T: DriverObject> {
+    obj: bindings::drm_gem_object,
+    // The DRM core ensures the Device exists as long as its objects exist, so we don't need to
+    // manage the reference count here.
+    dev: *const bindings::drm_device,
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+// SAFETY: This struct is safe to zero-initialize
+unsafe impl init::Zeroable for bindings::drm_gem_object {}
+
+impl<T: DriverObject> Object<T> {
+    /// The size of this object's structure.
+    pub const SIZE: usize = mem::size_of::<Self>();
+
+    const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
+        free: Some(free_callback::<T>),
+        open: Some(open_callback::<T, Object<T>>),
+        close: Some(close_callback::<T, Object<T>>),
+        print_info: None,
+        export: None,
+        pin: None,
+        unpin: None,
+        get_sg_table: None,
+        vmap: None,
+        vunmap: None,
+        mmap: None,
+        status: None,
+        vm_ops: core::ptr::null_mut(),
+        evict: None,
+        rss: None,
+    };
+
+    /// Create a new GEM object.
+    pub fn new(dev: &device::Device<T::Driver>, size: usize) -> Result<Pin<UniqueObjectRef<Self>>> {
+        let obj: Pin<Box<Self>> = Box::pin_init(
+            try_pin_init!(Self {
+                // SAFETY: This struct is expected to be zero-initialized
+                obj: bindings::drm_gem_object {
+                    funcs: &Self::OBJECT_FUNCS,
+                    ..Default::default()
+                },
+                inner <- T::new(dev, size),
+                // SAFETY: The drm subsystem guarantees that the drm_device will live as long as
+                // the GEM object lives, so we can conjure a reference out of thin air.
+                dev: dev.as_raw(),
+                _p: PhantomPinned
+            }),
+            GFP_KERNEL,
+        )?;
+
+        to_result(unsafe {
+            bindings::drm_gem_object_init(dev.as_raw(), &obj.obj as *const _ as *mut _, size)
+        })?;
+
+        // SAFETY: We never move out of self
+        let obj_ref = unsafe {
+            Pin::new_unchecked(UniqueObjectRef {
+                // SAFETY: We never move out of the Box
+                ptr: Box::leak(Pin::into_inner_unchecked(obj)),
+                _p: PhantomPinned,
+            })
+        };
+
+        Ok(obj_ref)
+    }
+
+    /// Returns the `Device` that owns this GEM object.
+    pub fn dev(&self) -> &device::Device<T::Driver> {
+        // SAFETY: The drm subsystem guarantees that the drm_device will live as long as
+        // the GEM object lives, so we can just borrow from the raw pointer.
+        unsafe { device::Device::borrow(self.dev) }
+    }
+}
+
+impl<T: DriverObject> crate::private::Sealed for Object<T> {}
+
+impl<T: DriverObject> Deref for Object<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverObject> DerefMut for Object<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.inner
+    }
+}
+
+impl<T: DriverObject> drv::AllocImpl for Object<T> {
+    const ALLOC_OPS: drv::AllocOps = drv::AllocOps {
+        gem_create_object: None,
+        prime_handle_to_fd: None,
+        prime_fd_to_handle: None,
+        gem_prime_import: None,
+        gem_prime_import_sg_table: None,
+        dumb_create: None,
+        dumb_map_offset: None,
+    };
+}
+
+/// A reference-counted shared reference to a base GEM object.
+pub struct ObjectRef<T: IntoGEMObject> {
+    // Invariant: the pointer is valid and initialized, and this ObjectRef owns a reference to it.
+    ptr: *const T,
+}
+
+impl<T: IntoGEMObject> ObjectRef<T> {
+    /// Downgrade this reference to a shared reference.
+    pub fn from_pinned_unique(pin: Pin<UniqueObjectRef<T>>) -> Self {
+        // SAFETY: A (shared) `ObjectRef` doesn't need to be pinned, since it doesn't allow us to
+        // optain a mutable reference.
+        let uq = unsafe { Pin::into_inner_unchecked(pin) };
+
+        uq.into_ref()
+    }
+}
+
+/// SAFETY: GEM object references are safe to share between threads.
+unsafe impl<T: IntoGEMObject> Send for ObjectRef<T> {}
+unsafe impl<T: IntoGEMObject> Sync for ObjectRef<T> {}
+
+impl<T: IntoGEMObject> Clone for ObjectRef<T> {
+    fn clone(&self) -> Self {
+        self.reference()
+    }
+}
+
+impl<T: IntoGEMObject> Drop for ObjectRef<T> {
+    fn drop(&mut self) {
+        // SAFETY: Having an ObjectRef implies holding a GEM reference.
+        // The free callback will take care of deallocation.
+        unsafe {
+            bindings::drm_gem_object_put((*self.ptr).gem_obj() as *const _ as *mut _);
+        }
+    }
+}
+
+impl<T: IntoGEMObject> Deref for ObjectRef<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The pointer is valid per the invariant
+        unsafe { &*self.ptr }
+    }
+}
+
+/// A unique reference to a base GEM object.
+pub struct UniqueObjectRef<T: IntoGEMObject> {
+    // Invariant: the pointer is valid and initialized, and this ObjectRef owns the only reference
+    // to it.
+    ptr: *mut T,
+    _p: PhantomPinned,
+}
+
+impl<T: IntoGEMObject> UniqueObjectRef<T> {
+    /// Downgrade this reference to a shared reference.
+    pub fn into_ref(self) -> ObjectRef<T> {
+        let ptr = self.ptr as *const _;
+        core::mem::forget(self);
+
+        ObjectRef { ptr }
+    }
+}
+
+impl<T: IntoGEMObject> Drop for UniqueObjectRef<T> {
+    fn drop(&mut self) {
+        // SAFETY: Having a UniqueObjectRef implies holding a GEM
+        // reference. The free callback will take care of deallocation.
+        unsafe {
+            bindings::drm_gem_object_put((*self.ptr).gem_obj() as *const _ as *mut _);
+        }
+    }
+}
+
+impl<T: IntoGEMObject> Deref for UniqueObjectRef<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The pointer is valid per the invariant
+        unsafe { &*self.ptr }
+    }
+}
+
+impl<T: IntoGEMObject> DerefMut for UniqueObjectRef<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: The pointer is valid per the invariant
+        unsafe { &mut *self.ptr }
+    }
+}
+
+pub(super) const fn create_fops() -> bindings::file_operations {
+    // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
+    // zeroed.
+    let mut fops: bindings::file_operations = unsafe { core::mem::zeroed() };
+
+    fops.owner = core::ptr::null_mut();
+    fops.open = Some(bindings::drm_open);
+    fops.release = Some(bindings::drm_release);
+    fops.unlocked_ioctl = Some(bindings::drm_ioctl);
+    #[cfg(CONFIG_COMPAT)]
+    {
+        fops.compat_ioctl = Some(bindings::drm_compat_ioctl);
+    }
+    fops.poll = Some(bindings::drm_poll);
+    fops.read = Some(bindings::drm_read);
+    fops.llseek = Some(bindings::noop_llseek);
+    fops.mmap = Some(bindings::drm_gem_mmap);
+
+    fops
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index a767942d0b52..c44760a1332f 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -5,4 +5,5 @@
 pub mod device;
 pub mod drv;
 pub mod file;
+pub mod gem;
 pub mod ioctl;
-- 
2.45.1

