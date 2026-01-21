Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADUFFjS5cGmWZQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:32:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080D356070
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5930510E75C;
	Wed, 21 Jan 2026 11:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v6hY01R3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DB510E1D0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 11:31:58 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b86fd61e3b4so668165366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768995117; x=1769599917;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=byZUHYbnD2FmVZ/gZogcTNsh5E8bfWqnPKh+s4Vmwt8=;
 b=v6hY01R3T2bj3dbMUwyMwN44fWVL8yMF8+rPi4+VJVBmCGW+ojlE6lPGxTqZ1Uob1d
 hMzp1QLEPGOgafhnnX9EU5qojniOZrb31tfkOvFcTulS3tfCGviUV6hOHzbcv20qPwDW
 bWVoGfiQ0avAI11LhuaqqoeeZG6dGPYpM6bmWf68fBU2Te8Ze5gdU2xP2PhbxMaRS1PR
 H9DIFUKs804fuq07kttR60egBE5A0mOnuC4GFXF9iV1DStaFGpPTuW7DPV7jGVcN8MOQ
 HoW7169INRgg0POQ5S9Mn+pFwdEG/4lyrr2Kxu3JEyIMm8lFsziNSeYdmw7lv0GrzUcG
 g+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768995117; x=1769599917;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=byZUHYbnD2FmVZ/gZogcTNsh5E8bfWqnPKh+s4Vmwt8=;
 b=Yr+NeC/QVK1WAfMQwfXFb4VNm1vQB2rCURESJsnSYk90Haxf4OVH6RitKlO2h0/KW4
 hJwYO/6msfRNeaavmepxoOsEpgyK+otkDD29cU8cnCPilCiuGhS5u/rytq8VecJxM03M
 xeZC6X2WAw9dtMl9kBqL3GW1HVEeZelRmwaidtKMdvrVKZiUvj7rKEgk3Q9NfwGkVjd+
 CRLjgiOl6gBFF1ax6EX47fyyiPc35Myx07yMM7X6zA0LLDjyeIOcx2gd6ZHkufh1o1hp
 HjWjFqJPH+jLwwa+d2cqEYQkt5ocrulH+uVEOYuTallvXpqjAeTI1etdVzyINWPjEn3c
 BmHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9vrCyTjB7hrLzpuXw4kKHz/yaMQ5BmUKz0nwzFOktYuD9Gi0QYZ6ZehvyYvKXBAZgUhkOnL8T1Uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEJBR6hlT+urX6RikdXOR7lbhmCMAqkBEJXQmd/+HO+17mjQPN
 U1eYOKOz5bk08uk2jIZC1hQJgbjywOepw9+rtUDCCyte1PzzPbRA2hfA1tkG7kydH330IIa4G21
 teq9kI69zW0RbHikHhA==
X-Received: from edbdd11.prod.google.com
 ([2002:a05:6402:312b:b0:64b:3f32:3786])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6e94:b0:b87:b87:cdb7 with SMTP id
 a640c23a62f3a-b8796bb8150mr1416704566b.64.1768995117333; 
 Wed, 21 Jan 2026 03:31:57 -0800 (PST)
Date: Wed, 21 Jan 2026 11:31:19 +0000
In-Reply-To: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=12444; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=vC3+05kWBzpETYWstiU3G/6khCsB+5+BSNGaApB13E4=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpcLkeY/nC9ZSN2Gx/9Wqo+rhNRfyujfDk6sqU1
 4zTWUsEvkmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXC5HgAKCRAEWL7uWMY5
 RrsSD/98ZQrAREUlwb6bADb0Qq7wWc1HRyEh6cfIy4SBiTTBOfiZV3NQSB7U8E1uHK8IxD3V63O
 bVFxHBWm9vqHOwgR4J6bOX8xnZtPhnKryncQ9T/+4TkCLEcdbVa1SXONUcGdYBF8teWiTAmhv14
 wRhQpd6T4MVzn849dcKRPKXPvZ1iT+SVCcQG7mGQgyHEG8ODy1wytogfXFimu3WOWBlrFKHzSKB
 GdAJ8aGPS0dJ9Bjx+6XvVyVfExP/OdUN75iAtMdlTZM18FSVK1mmCrbKi7D4uF2vVoJBwHyKvOO
 J6hLhrFvOGpXkcwVj3Ad44vJ1ELJuqoIhIbnzvet2qoWpR0Roo4BJKvx0zFJxgVJh9LkYxZBnwz
 jnwXMgQRdcdRc8FPFgnvcHETtBzZE/gjL9r01QQ8u6CWDczHCQhBqYZD+72Qt+pHLjAZcvoAu5R
 z4jGqin3HBpNOBxLuqCwSVyAwhh7lF47aThBi/Z6/hlAy2XbE2NBKQBUo264QPtTJVp/gAp/OiN
 5djuBmd+A88sbu3vvTtkEquYh1jxWXsuckpMzU0LqrcigA7gfaIQUZOBG+bBFTr3vVgk+UefYNG
 lrBREXzHW22ixWIUI0/0Mc3mQbHDgCLHTT09atS0hYaoK1Kqylz//zGRw8/UNdR1ovZSSYfiRFU
 onO6tV5El5h4Zcg==
X-Mailer: b4 0.14.2
Message-ID: <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
Subject: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 080D356070
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This provides a mechanism to create (or look up) VMBO instances, which
represent the mapping between GPUVM and GEM objects.

The GpuVmBoResident<T> type can be considered like ARef<GpuVm<T>>,
except that no way to increment the refcount is provided.

The GpuVmBoAlloc<T> type is more akin to a pre-allocated GpuVm<T>, so
it's not really a GpuVm<T> yet. Its destructor could call
drm_gpuvm_bo_destroy_not_in_lists(), but as the type is currently
private and never called anywhere, this perf optimization does not need
to happen now.

Pre-allocating and obtaining the gpuvm_bo object is exposed as a single
step. This could theoretically be a problem if one wanted to call
drm_gpuvm_bo_obtain_prealloc() during the fence signalling critical
path, but that's not a possibility because:

1. Adding the BO to the extobj list requires the resv lock, so it cannot
   happen during the fence signalling critical path.
2. obtain() requires that the BO is not in the extobj list, so obtain()
   must be called before adding the BO to the extobj list.

Thus, drm_gpuvm_bo_obtain_prealloc() cannot be called during the fence
signalling critical path. (For extobjs at least.)

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs   |  32 +++++-
 rust/kernel/drm/gpuvm/vm_bo.rs | 219 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 248 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 81b5e767885d8258c44086444b153c91961ffabc..cb576a7ffa07bc108704e008b7f87de52a837930 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -25,13 +25,20 @@
 
 use core::{
     cell::UnsafeCell,
+    mem::ManuallyDrop,
     ops::{
         Deref,
         Range, //
     },
-    ptr::NonNull, //
+    ptr::{
+        self,
+        NonNull, //
+    }, //
 };
 
+mod vm_bo;
+pub use self::vm_bo::*;
+
 /// A DRM GPU VA manager.
 ///
 /// This object is refcounted, but the "core" is only accessible using a special unique handle. The
@@ -68,8 +75,8 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops {
             vm_free: Some(Self::vm_free),
             op_alloc: None,
             op_free: None,
-            vm_bo_alloc: None,
-            vm_bo_free: None,
+            vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
+            vm_bo_free: GpuVmBo::<T>::FREE_FN,
             vm_bo_validate: None,
             sm_step_map: None,
             sm_step_unmap: None,
@@ -166,6 +173,16 @@ pub fn va_range(&self) -> Range<u64> {
         Range { start, end }
     }
 
+    /// Get or create the [`GpuVmBo`] for this gem object.
+    #[inline]
+    pub fn obtain(
+        &self,
+        obj: &T::Object,
+        data: impl PinInit<T::VmBoData>,
+    ) -> Result<GpuVmBoResident<T>, AllocError> {
+        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
+    }
+
     /// Clean up buffer objects that are no longer used.
     #[inline]
     pub fn deferred_cleanup(&self) {
@@ -191,6 +208,12 @@ pub fn is_extobj(&self, obj: &T::Object) -> bool {
         // SAFETY: By type invariants we can free it when refcount hits zero.
         drop(unsafe { KBox::from_raw(me) })
     }
+
+    #[inline]
+    fn raw_resv_lock(&self) -> *mut bindings::dma_resv {
+        // SAFETY: `r_obj` is immutable and valid for duration of GPUVM.
+        unsafe { (*(*self.as_raw()).r_obj).resv }
+    }
 }
 
 /// The manager for a GPUVM.
@@ -200,6 +223,9 @@ pub trait DriverGpuVm: Sized {
 
     /// The kind of GEM object stored in this GPUVM.
     type Object: IntoGEMObject;
+
+    /// Data stored with each `struct drm_gpuvm_bo`.
+    type VmBoData;
 }
 
 /// The core of the DRM GPU VA manager.
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
new file mode 100644
index 0000000000000000000000000000000000000000..310fa569b5bd43f0f872ff859b3624377b93d651
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+use super::*;
+
+/// Represents that a given GEM object has at least one mapping on this [`GpuVm`] instance.
+///
+/// Does not assume that GEM lock is held.
+#[repr(C)]
+#[pin_data]
+pub struct GpuVmBo<T: DriverGpuVm> {
+    #[pin]
+    inner: Opaque<bindings::drm_gpuvm_bo>,
+    #[pin]
+    data: T::VmBoData,
+}
+
+impl<T: DriverGpuVm> GpuVmBo<T> {
+    pub(super) const ALLOC_FN: Option<unsafe extern "C" fn() -> *mut bindings::drm_gpuvm_bo> = {
+        use core::alloc::Layout;
+        let base = Layout::new::<bindings::drm_gpuvm_bo>();
+        let rust = Layout::new::<Self>();
+        assert!(base.size() <= rust.size());
+        if base.size() != rust.size() || base.align() != rust.align() {
+            Some(Self::vm_bo_alloc)
+        } else {
+            // This causes GPUVM to allocate a `GpuVmBo<T>` with `kzalloc(sizeof(drm_gpuvm_bo))`.
+            None
+        }
+    };
+
+    pub(super) const FREE_FN: Option<unsafe extern "C" fn(*mut bindings::drm_gpuvm_bo)> = {
+        if core::mem::needs_drop::<Self>() {
+            Some(Self::vm_bo_free)
+        } else {
+            // This causes GPUVM to free a `GpuVmBo<T>` with `kfree`.
+            None
+        }
+    };
+
+    /// Custom function for allocating a `drm_gpuvm_bo`.
+    ///
+    /// # Safety
+    ///
+    /// Always safe to call.
+    // Unsafe to match function pointer type in C struct.
+    unsafe extern "C" fn vm_bo_alloc() -> *mut bindings::drm_gpuvm_bo {
+        KBox::<Self>::new_uninit(GFP_KERNEL | __GFP_ZERO)
+            .map(KBox::into_raw)
+            .unwrap_or(ptr::null_mut())
+            .cast()
+    }
+
+    /// Custom function for freeing a `drm_gpuvm_bo`.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must have been allocated with [`GpuVmBo::ALLOC_FN`], and must not be used after
+    /// this call.
+    unsafe extern "C" fn vm_bo_free(ptr: *mut bindings::drm_gpuvm_bo) {
+        // SAFETY:
+        // * The ptr was allocated from kmalloc with the layout of `GpuVmBo<T>`.
+        // * `ptr->inner` has no destructor.
+        // * `ptr->data` contains a valid `T::VmBoData` that we can drop.
+        drop(unsafe { KBox::<Self>::from_raw(ptr.cast()) });
+    }
+
+    /// Access this [`GpuVmBo`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`, the pointer must reference a valid `drm_gpuvm_bo` associated with
+    /// a [`GpuVm<T>`].
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &'a Self {
+        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns a raw pointer to underlying C value.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
+        self.inner.get()
+    }
+
+    /// The [`GpuVm`] that this GEM object is mapped in.
+    #[inline]
+    pub fn gpuvm(&self) -> &GpuVm<T> {
+        // SAFETY: The `obj` pointer is guaranteed to be valid.
+        unsafe { GpuVm::<T>::from_raw((*self.inner.get()).vm) }
+    }
+
+    /// The [`drm_gem_object`](crate::gem::Object) for these mappings.
+    #[inline]
+    pub fn obj(&self) -> &T::Object {
+        // SAFETY: The `obj` pointer is guaranteed to be valid.
+        unsafe { <T::Object as IntoGEMObject>::from_raw((*self.inner.get()).obj) }
+    }
+
+    /// The driver data with this buffer object.
+    #[inline]
+    pub fn data(&self) -> &T::VmBoData {
+        &self.data
+    }
+}
+
+/// A pre-allocated [`GpuVmBo`] object.
+///
+/// # Invariants
+///
+/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData`, has a refcount of one, and is
+/// absent from any gem, extobj, or evict lists.
+pub(super) struct GpuVmBoAlloc<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
+
+impl<T: DriverGpuVm> GpuVmBoAlloc<T> {
+    /// Create a new pre-allocated [`GpuVmBo`].
+    ///
+    /// It's intentional that the initializer is infallible because `drm_gpuvm_bo_put` will call
+    /// drop on the data, so we don't have a way to free it when the data is missing.
+    #[inline]
+    pub(super) fn new(
+        gpuvm: &GpuVm<T>,
+        gem: &T::Object,
+        value: impl PinInit<T::VmBoData>,
+    ) -> Result<GpuVmBoAlloc<T>, AllocError> {
+        // CAST: `GpuVmBoAlloc::vm_bo_alloc` ensures that this memory was allocated with the layout
+        // of `GpuVmBo<T>`. The type is repr(C), so `container_of` is not required.
+        // SAFETY: The provided gpuvm and gem ptrs are valid for the duration of this call.
+        let raw_ptr = unsafe {
+            bindings::drm_gpuvm_bo_create(gpuvm.as_raw(), gem.as_raw()).cast::<GpuVmBo<T>>()
+        };
+        let ptr = NonNull::new(raw_ptr).ok_or(AllocError)?;
+        // SAFETY: `ptr->data` is a valid pinned location.
+        let Ok(()) = unsafe { value.__pinned_init(&raw mut (*raw_ptr).data) };
+        // INVARIANTS: We just created the vm_bo so it's absent from lists, and the data is valid
+        // as we just initialized it.
+        Ok(GpuVmBoAlloc(ptr))
+    }
+
+    /// Returns a raw pointer to underlying C value.
+    #[inline]
+    pub(super) fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
+        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
+        unsafe { (*self.0.as_ptr()).inner.get() }
+    }
+
+    /// Look up whether there is an existing [`GpuVmBo`] for this gem object.
+    #[inline]
+    pub(super) fn obtain(self) -> GpuVmBoResident<T> {
+        let me = ManuallyDrop::new(self);
+        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
+        let ptr = unsafe { bindings::drm_gpuvm_bo_obtain_prealloc(me.as_raw()) };
+
+        // If the vm_bo does not already exist, ensure that it's in the extobj list.
+        if ptr::eq(ptr, me.as_raw()) && me.gpuvm().is_extobj(me.obj()) {
+            let resv_lock = me.gpuvm().raw_resv_lock();
+            // SAFETY: The GPUVM is still alive, so its resv lock is too.
+            unsafe { bindings::dma_resv_lock(resv_lock, ptr::null_mut()) };
+            // SAFETY: We hold the GPUVMs resv lock.
+            unsafe { bindings::drm_gpuvm_bo_extobj_add(ptr) };
+            // SAFETY: We took the lock, so we can unlock it.
+            unsafe { bindings::dma_resv_unlock(resv_lock) };
+        }
+
+        // INVARIANTS: Valid `drm_gpuvm_bo` in the GEM list.
+        // SAFETY: `drm_gpuvm_bo_obtain_prealloc` always returns a non-null ptr
+        GpuVmBoResident(unsafe { NonNull::new_unchecked(ptr.cast()) })
+    }
+}
+
+impl<T: DriverGpuVm> Deref for GpuVmBoAlloc<T> {
+    type Target = GpuVmBo<T>;
+    #[inline]
+    fn deref(&self) -> &GpuVmBo<T> {
+        // SAFETY: By the type invariants we may deref while `Self` exists.
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
+    #[inline]
+    fn drop(&mut self) {
+        // TODO: Call drm_gpuvm_bo_destroy_not_in_lists() directly.
+        // SAFETY: It's safe to perform a deferred put in any context.
+        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
+    }
+}
+
+/// A [`GpuVmBo`] object in the GEM list.
+///
+/// # Invariants
+///
+/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
+pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
+
+impl<T: DriverGpuVm> GpuVmBoResident<T> {
+    /// Returns a raw pointer to underlying C value.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
+        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
+        unsafe { (*self.0.as_ptr()).inner.get() }
+    }
+}
+
+impl<T: DriverGpuVm> Deref for GpuVmBoResident<T> {
+    type Target = GpuVmBo<T>;
+    #[inline]
+    fn deref(&self) -> &GpuVmBo<T> {
+        // SAFETY: By the type invariants we may deref while `Self` exists.
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: DriverGpuVm> Drop for GpuVmBoResident<T> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: It's safe to perform a deferred put in any context.
+        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
+    }
+}

-- 
2.52.0.457.g6b5491de43-goog

