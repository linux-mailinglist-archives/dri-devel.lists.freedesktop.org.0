Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG3zDSq/fGlVOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:24:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C92BB90C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2070310E9FC;
	Fri, 30 Jan 2026 14:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JBwYZDiN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5886A10E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 14:24:37 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-48071615686so16304955e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769783076; x=1770387876;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=27748GJnY6LQ5US9SZ5tQooCOHDDmElDfpB/MH1p8m8=;
 b=JBwYZDiNvHaRqTVp4goxTIOBQmtM5VVKeiSpPikDANs+SvlVQNzPkjVt6zJydKgFF1
 Bt0IQ4RZqybBa6/uoYJRodcvHeQH5fWJqa+ToXCZUWmgicywNslbjlrDSeIqzrLseHLs
 lINtMzMAtkQybDe3fNDW8Q6K0JD3XFR9NCI7j6uXNAMvn4UfXBoSDsA+Od4HMBRHpiuv
 8wnsb8f/n+m8FxkxzeqZ9U0JAGJ+jn7PgN6Nxgx3NM2l6VzMrdFnc0xrJ0kwQr5524VE
 DlDwbNOnDxGnljRu2CW4nZKJw3lrJWrVmtkW17epxtjbZG+3tYkzoSg9EG0OcONbnjYP
 2jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769783076; x=1770387876;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27748GJnY6LQ5US9SZ5tQooCOHDDmElDfpB/MH1p8m8=;
 b=wBDWF3ZijjmqUFr9toBk40CFQRrbq48BVLB0UjH7+YCbuxIF6pYdyDx+JQiFpR7z6+
 MNQwzmb8b1ke8Atle50FY7M/pMIE93gJhvEA75ku4O8pZcYtguXTT3N4m8esrj+nLlnn
 2ehEf7kpDhd3GVsJrEEZUYmDCll7J+nHdeCgLb8SWmuwyr1MKG7DNK7CwJv80So6dvZ6
 yinIqS/CKJOjogUVSdfB4/Hu+dBjSVrWpLVfIr6B6rT0VUWE06q1Eaw7e0jzAwspCQte
 2ChAlakZ+u4BOsaIGshNZBUf/7MwyBV2E22PK+0XpjGFSyqYF/73L5KjPeOvlDUkbtjO
 xyxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqNvyN4+o4hDO5K/x1SWXVCkkaVEUXnz5ftYa5Xn6HS1fkDEvSeYis4rc0JcFDddIWOl7o4dZuhv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX676Qzi3riuiUAVFLf3+78RqYKq1dphr4n92ZipWjsrlElWAT
 mmg7uOgD8kvWvS1Wn0brG0KeIvBliUWCeuHyU+GAYd5d8imOsYMmjTUhxVoabdirtCKPbYgwCQt
 6Xl4GzbgSwshD7Vh2aA==
X-Received: from wmop18.prod.google.com ([2002:a05:600c:4692:b0:477:a4d4:607a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d8c:b0:47b:deb9:15fb with SMTP id
 5b1f17b1804b1-482db4970e2mr39979535e9.33.1769783075895; 
 Fri, 30 Jan 2026 06:24:35 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:14 +0000
In-Reply-To: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=14341; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=jgzhuuggRvgfvFa+UYkqzqI+ERjQOxfIuIZZ+mOO67g=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8T2HejB1v/RawIRXHvsE/4tmAvzaeR/cz7h
 qqxkrd7s5uJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/EwAKCRAEWL7uWMY5
 Rnh9D/9SohCFHKBAzPMJGvZ4Eo7T9AfaGaSgl5/8DEs/8nQTZ5djjoRp6uiNarsYWm5viaqrcey
 Ubh33pzzSS9s0T/8VhoRTrCC4PTgflduQMLGsMzADpmkdXYcrC6BhLL/dtSWUu0bK7FBXN+zX6x
 YuHbNTl2CKG9zRs4q4/3m80L9F3vQyT52nRAH41pVAOqF2sx1iiXzoCU9YgUZ+/DyfOQnntKMzi
 yLLr9dnZabUvWkPSGw4aQO4vBkhrK7jYLmnf9po2zt/ZH+XGCm5mEXywBlRlnJksTfAMR8873uQ
 V+6hvQe9X4Q/FA/2v///K2TxZ3TGL/SmT69rR7u1VdZoS8+LFSgyRvzDAq8KJYB/TorPTAfFu+K
 gDW5xxwuP0gYc37aUfZrDQIi1RC5zd9rpmbmWjPmpeijz+BN2YxG8BOLfhvmibjpSU21oMVTVwI
 E52km3d3+W7l16T0ph2Z02M1BgpdYxUfFu8DNctYEp18EWNp/5JpH9QJY9j99v47/oGIyRfxClF
 1XoZNEsUrwQXWUIeuTH0wHKB//1PrM42szF88wvZs6+XbMK1OIi7xo/1bX5NOEyLchb0Jyjbc3w
 qUIZIPTKbjdw8hmXIoJsAnif9iQrXn0a8039KdaBrMO9LLD3j7GAaPYXqXR/uYf8DuRSes0FwBF
 qajHgyVfzhtiWiQ==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-5-8364d104ff40@google.com>
Subject: [PATCH v4 5/6] rust: gpuvm: add GpuVmCore::sm_unmap()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
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
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[asahilina.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,op.next:url,op.va:url]
X-Rspamd-Queue-Id: C3C92BB90C
X-Rspamd-Action: no action

Add the entrypoint for unmapping ranges in the GPUVM, and provide
callbacks and VA types for the implementation.

Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs    |  30 ++++-
 rust/kernel/drm/gpuvm/sm_ops.rs | 270 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     |   1 -
 rust/kernel/drm/gpuvm/vm_bo.rs  |   8 ++
 4 files changed, 304 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index c8c024ec47b0053d9941465858c0597f0dfd4950..fd4c662f84a4830515c2ddd18d5d503e4ee9fc8f 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -18,6 +18,7 @@
     bindings,
     drm,
     drm::gem::IntoGEMObject,
+    error::to_result,
     prelude::*,
     sync::aref::{
         ARef,
@@ -28,6 +29,7 @@
 
 use core::{
     cell::UnsafeCell,
+    marker::PhantomData,
     mem::{
         ManuallyDrop,
         MaybeUninit, //
@@ -43,12 +45,15 @@
     }, //
 };
 
-mod va;
-pub use self::va::*;
+mod sm_ops;
+pub use self::sm_ops::*;
 
 mod vm_bo;
 pub use self::vm_bo::*;
 
+mod va;
+pub use self::va::*;
+
 /// A DRM GPU VA manager.
 ///
 /// This object is refcounted, but the "core" is only accessible using a special unique handle. The
@@ -89,8 +94,8 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops {
             vm_bo_free: GpuVmBo::<T>::FREE_FN,
             vm_bo_validate: None,
             sm_step_map: None,
-            sm_step_unmap: None,
-            sm_step_remap: None,
+            sm_step_unmap: Some(Self::sm_step_unmap),
+            sm_step_remap: Some(Self::sm_step_remap),
         }
     }
 
@@ -239,6 +244,23 @@ pub trait DriverGpuVm: Sized {
 
     /// Data stored with each `struct drm_gpuvm_bo`.
     type VmBoData;
+
+    /// The private data passed to callbacks.
+    type SmContext<'ctx>;
+
+    /// Indicates that an existing mapping should be removed.
+    fn sm_step_unmap<'op, 'ctx>(
+        &mut self,
+        op: OpUnmap<'op, Self>,
+        context: &mut Self::SmContext<'ctx>,
+    ) -> Result<OpUnmapped<'op, Self>, Error>;
+
+    /// Indicates that an existing mapping should be split up.
+    fn sm_step_remap<'op, 'ctx>(
+        &mut self,
+        op: OpRemap<'op, Self>,
+        context: &mut Self::SmContext<'ctx>,
+    ) -> Result<OpRemapped<'op, Self>, Error>;
 }
 
 /// The core of the DRM GPU VA manager.
diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm_ops.rs
new file mode 100644
index 0000000000000000000000000000000000000000..3f345bce14a18ae88ce525629e3e5b76820e97a6
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/sm_ops.rs
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+use super::*;
+
+/// The actual data that gets threaded through the callbacks.
+struct SmData<'a, 'ctx, T: DriverGpuVm> {
+    gpuvm: &'a mut GpuVmCore<T>,
+    user_context: &'a mut T::SmContext<'ctx>,
+}
+
+/// Represents an `sm_step_unmap` operation that has not yet been completed.
+pub struct OpUnmap<'op, T: DriverGpuVm> {
+    op: &'op bindings::drm_gpuva_op_unmap,
+    // This ensures that 'op is invariant, so that `OpUnmap<'long, T>` does not
+    // coerce to `OpUnmap<'short, T>`. This ensures that the user can't return the
+    // wrong`OpUnmapped` value.
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+impl<'op, T: DriverGpuVm> OpUnmap<'op, T> {
+    /// Indicates whether this [`GpuVa`] is physically contiguous with the
+    /// original mapping request.
+    ///
+    /// Optionally, if `keep` is set, drivers may keep the actual page table
+    /// mappings for this `drm_gpuva`, adding the missing page table entries
+    /// only and update the `drm_gpuvm` accordingly.
+    pub fn keep(&self) -> bool {
+        self.op.keep
+    }
+
+    /// The range being unmapped.
+    pub fn va(&self) -> &GpuVa<T> {
+        // SAFETY: This is a valid va.
+        unsafe { GpuVa::<T>::from_raw(self.op.va) }
+    }
+
+    /// Remove the VA.
+    pub fn remove(self) -> (OpUnmapped<'op, T>, GpuVaRemoved<T>) {
+        // SAFETY: The op references a valid drm_gpuva in the GPUVM.
+        unsafe { bindings::drm_gpuva_unmap(self.op) };
+        // SAFETY: The va is no longer in the interval tree so we may unlink it.
+        unsafe { bindings::drm_gpuva_unlink_defer(self.op.va) };
+
+        // SAFETY: We just removed this va from the `GpuVm<T>`.
+        let va = unsafe { GpuVaRemoved::from_raw(self.op.va) };
+
+        (
+            OpUnmapped {
+                _invariant: self._invariant,
+            },
+            va,
+        )
+    }
+}
+
+/// Represents a completed [`OpUnmap`] operation.
+pub struct OpUnmapped<'op, T> {
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+/// Represents an `sm_step_remap` operation that has not yet been completed.
+pub struct OpRemap<'op, T: DriverGpuVm> {
+    op: &'op bindings::drm_gpuva_op_remap,
+    // This ensures that 'op is invariant, so that `OpRemap<'long, T>` does not
+    // coerce to `OpRemap<'short, T>`. This ensures that the user can't return the
+    // wrong`OpRemapped` value.
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+impl<'op, T: DriverGpuVm> OpRemap<'op, T> {
+    /// The preceding part of a split mapping.
+    #[inline]
+    pub fn prev(&self) -> Option<&OpRemapMapData> {
+        // SAFETY: We checked for null, so the pointer must be valid.
+        NonNull::new(self.op.prev).map(|ptr| unsafe { OpRemapMapData::from_raw(ptr) })
+    }
+
+    /// The subsequent part of a split mapping.
+    #[inline]
+    pub fn next(&self) -> Option<&OpRemapMapData> {
+        // SAFETY: We checked for null, so the pointer must be valid.
+        NonNull::new(self.op.next).map(|ptr| unsafe { OpRemapMapData::from_raw(ptr) })
+    }
+
+    /// Indicates whether the `drm_gpuva` being removed is physically contiguous with the original
+    /// mapping request.
+    ///
+    /// Optionally, if `keep` is set, drivers may keep the actual page table mappings for this
+    /// `drm_gpuva`, adding the missing page table entries only and update the `drm_gpuvm`
+    /// accordingly.
+    #[inline]
+    pub fn keep(&self) -> bool {
+        // SAFETY: The unmap pointer is always valid.
+        unsafe { (*self.op.unmap).keep }
+    }
+
+    /// The range being unmapped.
+    #[inline]
+    pub fn va_to_unmap(&self) -> &GpuVa<T> {
+        // SAFETY: This is a valid va.
+        unsafe { GpuVa::<T>::from_raw((*self.op.unmap).va) }
+    }
+
+    /// The [`drm_gem_object`](crate::gem::Object) whose VA is being remapped.
+    #[inline]
+    pub fn obj(&self) -> &T::Object {
+        self.va_to_unmap().obj()
+    }
+
+    /// The [`GpuVmBo`] that is being remapped.
+    #[inline]
+    pub fn vm_bo(&self) -> &GpuVmBo<T> {
+        self.va_to_unmap().vm_bo()
+    }
+
+    /// Update the GPUVM to perform the remapping.
+    pub fn remap(
+        self,
+        va_alloc: [GpuVaAlloc<T>; 2],
+        prev_data: impl PinInit<T::VaData>,
+        next_data: impl PinInit<T::VaData>,
+    ) -> (OpRemapped<'op, T>, OpRemapRet<T>) {
+        let [va1, va2] = va_alloc;
+
+        let mut unused_va = None;
+        let mut prev_ptr = ptr::null_mut();
+        let mut next_ptr = ptr::null_mut();
+        if self.prev().is_some() {
+            prev_ptr = va1.prepare(prev_data);
+        } else {
+            unused_va = Some(va1);
+        }
+        if self.next().is_some() {
+            next_ptr = va2.prepare(next_data);
+        } else {
+            unused_va = Some(va2);
+        }
+
+        // SAFETY: the pointers are non-null when required
+        unsafe { bindings::drm_gpuva_remap(prev_ptr, next_ptr, self.op) };
+
+        let gpuva_guard = self.vm_bo().lock_gpuva();
+        if !prev_ptr.is_null() {
+            // SAFETY: The prev_ptr is a valid drm_gpuva prepared for insertion. The vm_bo is still
+            // valid as the not-yet-unlinked gpuva holds a refcount on the vm_bo.
+            unsafe { bindings::drm_gpuva_link(prev_ptr, self.vm_bo().as_raw()) };
+        }
+        if !next_ptr.is_null() {
+            // SAFETY: The next_ptr is a valid drm_gpuva prepared for insertion. The vm_bo is still
+            // valid as the not-yet-unlinked gpuva holds a refcount on the vm_bo.
+            unsafe { bindings::drm_gpuva_link(next_ptr, self.vm_bo().as_raw()) };
+        }
+        drop(gpuva_guard);
+
+        // SAFETY: The va is no longer in the interval tree so we may unlink it.
+        unsafe { bindings::drm_gpuva_unlink_defer((*self.op.unmap).va) };
+
+        (
+            OpRemapped {
+                _invariant: self._invariant,
+            },
+            OpRemapRet {
+                // SAFETY: We just removed this va from the `GpuVm<T>`.
+                unmapped_va: unsafe { GpuVaRemoved::from_raw((*self.op.unmap).va) },
+                unused_va,
+            },
+        )
+    }
+}
+
+/// Part of an [`OpRemap`] that represents a new mapping.
+#[repr(transparent)]
+pub struct OpRemapMapData(bindings::drm_gpuva_op_map);
+
+impl OpRemapMapData {
+    /// # Safety
+    /// Must reference a valid `drm_gpuva_op_map` for duration of `'a`.
+    unsafe fn from_raw<'a>(ptr: NonNull<bindings::drm_gpuva_op_map>) -> &'a Self {
+        // SAFETY: ok per safety requirements
+        unsafe { ptr.cast().as_ref() }
+    }
+
+    /// The base address of the new mapping.
+    pub fn addr(&self) -> u64 {
+        self.0.va.addr
+    }
+
+    /// The length of the new mapping.
+    pub fn length(&self) -> u64 {
+        self.0.va.range
+    }
+
+    /// The offset within the [`drm_gem_object`](crate::gem::Object).
+    pub fn gem_offset(&self) -> u64 {
+        self.0.gem.offset
+    }
+}
+
+/// Struct containing objects removed or not used by [`OpRemap::remap`].
+pub struct OpRemapRet<T: DriverGpuVm> {
+    /// The `drm_gpuva` that was removed.
+    pub unmapped_va: GpuVaRemoved<T>,
+    /// If the remap did not split the region into two pieces, then the unused `drm_gpuva` is
+    /// returned here.
+    pub unused_va: Option<GpuVaAlloc<T>>,
+}
+
+/// Represents a completed [`OpRemap`] operation.
+pub struct OpRemapped<'op, T> {
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+impl<T: DriverGpuVm> GpuVmCore<T> {
+    /// Remove any mappings in the given region.
+    ///
+    /// Internally calls [`DriverGpuVm::sm_step_unmap`] for ranges entirely contained within the
+    /// given range, and [`DriverGpuVm::sm_step_remap`] for ranges that overlap with the range.
+    #[inline]
+    pub fn sm_unmap(&mut self, addr: u64, length: u64, context: &mut T::SmContext<'_>) -> Result {
+        let gpuvm = self.as_raw();
+        let mut p = SmData {
+            gpuvm: self,
+            user_context: context,
+        };
+        // SAFETY:
+        // * raw_request() creates a valid request.
+        // * The private data is valid to be interpreted as SmData.
+        to_result(unsafe { bindings::drm_gpuvm_sm_unmap(gpuvm, (&raw mut p).cast(), addr, length) })
+    }
+}
+
+impl<T: DriverGpuVm> GpuVm<T> {
+    /// # Safety
+    /// Must be called from `sm_unmap` with a pointer to `SmData`.
+    pub(super) unsafe extern "C" fn sm_step_unmap(
+        op: *mut bindings::drm_gpuva_op,
+        p: *mut c_void,
+    ) -> c_int {
+        // SAFETY: The caller provides a pointer to `SmData`.
+        let p = unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
+        let op = OpUnmap {
+            // SAFETY: sm_step_unmap is called with an unmap operation.
+            op: unsafe { &(*op).__bindgen_anon_1.unmap },
+            _invariant: PhantomData,
+        };
+        match p.gpuvm.data().sm_step_unmap(op, p.user_context) {
+            Ok(OpUnmapped { .. }) => 0,
+            Err(err) => err.to_errno(),
+        }
+    }
+
+    /// # Safety
+    /// Must be called from `sm_unmap` with a pointer to `SmData`.
+    pub(super) unsafe extern "C" fn sm_step_remap(
+        op: *mut bindings::drm_gpuva_op,
+        p: *mut c_void,
+    ) -> c_int {
+        // SAFETY: The caller provides a pointer to `SmData`.
+        let p = unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
+        let op = OpRemap {
+            // SAFETY: sm_step_remap is called with a remap operation.
+            op: unsafe { &(*op).__bindgen_anon_1.remap },
+            _invariant: PhantomData,
+        };
+        match p.gpuvm.data().sm_step_remap(op, p.user_context) {
+            Ok(OpRemapped { .. }) => 0,
+            Err(err) => err.to_errno(),
+        }
+    }
+}
diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
index c96796a6b2c8c7c4b5475324562968ca0f07fd09..a31122ff22282186a1d76d4bb085714f6465722b 100644
--- a/rust/kernel/drm/gpuvm/va.rs
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 
-#![expect(dead_code)]
 use super::*;
 
 /// Represents that a range of a GEM object is mapped in this [`GpuVm`] instance.
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index 272e1a83c2d5f43c42dbdd9e09f51394a1e855b6..e8570f321c107be44fe2e463c88e2760fa197dfa 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -100,6 +100,14 @@ pub fn obj(&self) -> &T::Object {
     pub fn data(&self) -> &T::VmBoData {
         &self.data
     }
+
+    pub(super) fn lock_gpuva(&self) -> crate::sync::MutexGuard<'_, ()> {
+        // SAFETY: The GEM object is valid.
+        let ptr = unsafe { &raw mut (*self.obj().as_raw()).gpuva.lock };
+        // SAFETY: The GEM object is valid, so the mutex is properly initialized.
+        let mutex = unsafe { crate::sync::Mutex::from_raw(ptr) };
+        mutex.lock()
+    }
 }
 
 /// A pre-allocated [`GpuVmBo`] object.

-- 
2.53.0.rc1.225.gd81095ad13-goog

