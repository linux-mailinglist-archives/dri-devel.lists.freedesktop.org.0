Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDFwDzG/fGlVOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:24:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF4BB91A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E8310EA02;
	Fri, 30 Jan 2026 14:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GzrmHEfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6699810E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 14:24:39 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4804157a3c9so27713295e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769783078; x=1770387878;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wyrtNzxygY0xuisDnGfl0mQkqGyjjT25fNVtDfZ2la0=;
 b=GzrmHEfqLZbERMCfIUVPanaZpFbtsxkU0r+5S3cbr9Z1/13D8m3aoYAxB5St6/Cc8V
 7sTve2pwR8JgdUojLAz78OLBsYt94XT287baZDlxU8nRJib4cbjShcTTN6nZcC2Hn5tG
 jMPq4Db7QGMIGq2+UiU6rL5UL9Qd00/4wq6ZE/RJmvzX/pYfGo6TriFkNOrEPiknKx4J
 bBW43THi106FUnVlcpIk2tM7Ji3Udd8UzMIkyTlvQBRO6wK/gbXp2Xd0kX9fN4xL3KC+
 A5IPFk30u076Mpx6ZB/JtzcRNq7l22e+007aQn6HdW8ecZKHiDQVESaDg3UXW9xnQBra
 HR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769783078; x=1770387878;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wyrtNzxygY0xuisDnGfl0mQkqGyjjT25fNVtDfZ2la0=;
 b=kcB0E9q9mh+uXpCJon32X0t9ylkQxR0gFEOpsGxtDMSd2hph8wjvpUxzfDSH7hzTOk
 pJjD5S7Mc3LnFpdQHABkQLGNa/waE0hFbeREiFA5VZBiZsgopfXv/U7kEecwJPKMacXH
 Ec+GN3t2OXragjP2ij5kSqnMo1u4biqXwqCmqN6WeVTPtXKwztVKIgg2L8QLd5mCkThu
 umvYuslNhnbo32MVwsOb7EnqpKTx0QAB9zFCopUrwnFi0P0NFputauDIUZR9yrYg3R7F
 6JrxDXamK3Kpedl6LkMZLvgGc2ks7Bd1vIBY5RyyFtchjx916QtHW2kU3eMoZGqbWbzB
 jzAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj0dSWTlHtxMbijQv0IHj5YydBpmw4LSvvI5hKX8XTzqmAUtKTrF6hUZp/MvtTUgADt+smW/Sfsg0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi+pJ55EdV/PWolDd6i+N7WQ22FgevbChtBM5+eVLyiTciEAWe
 LYuohK3WwoJEAsONufTY7JRAcoGECkWMyqys8D8N7VEhlbfAr6OVajgvG+nxkQUfBylUYo2nCji
 X93Rz1Ytgic0+NxGsrQ==
X-Received: from wmi5.prod.google.com ([2002:a05:600c:205:b0:477:a43b:b532])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f16:b0:480:1d16:2538 with SMTP id
 5b1f17b1804b1-482db493999mr45696685e9.23.1769783078083; 
 Fri, 30 Jan 2026 06:24:38 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:15 +0000
In-Reply-To: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9806; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=OocxZt4c/n9d8K9jPoS6cMKUoromwSnEs6v794Vpv6Q=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8TNpDBJAXz4MdOGdrah1kFDKuqNiYZ8JDv4
 wOSBWdUsAyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/EwAKCRAEWL7uWMY5
 Rqn4D/9uCpt6PkFti3PDllr1YBzn1GDezaPhq6OfTs2nn/w/MF34t4O/isAOjNNTtWlHUOJlddK
 xKSSKTuSZH87IJ7G3kodJHZHxcTPYK4cbxylXVxbYynQDEo+qatfIrdX7ZMr0RJ4SEU3ylg9vC0
 dRxoVCwZxIV7n4EWzUJU9+J9tn34y+AgiACY7a5KpwukIbMLmptbV18IR7vpUAhC78zmYILpKXK
 r4NdWP1YXZfF1pNZbnvm61LPEY8x6Peeumo5QJElfWcmjwAsCud6TkG7n6GslLXSFDmSsQ6qoDG
 7+e2NG7pdV4ueQAc/ORi9Vmm4RvD7oeizk0My9Qi19uxoFiSGXzv3l2NaIAcE5axRL3Sxk/NyJz
 lFaNisYsxk10HxLQ79AfNWUnQhpy5mttheTTYEpfqVzj1vsUus6tfcZE+Ud+kedyWUXurVyK5DB
 cM3T3dCr3C2+yzcIwe/0DugPPONTRazWMgLr1nr/puZ0DqCtvYof6nAWpQkdl2Gv8+xih0D9lsh
 xJ7QN6NOgArGBQaKsjgtOt3Bd2bMiEcwEf2couvAHG3qakc+O2/9Dgjs3UorszFmM317ZfOPj6r
 fIxErZfYRlBAkC3I++e/k17Yx4ldwIYD1uogdjp0pd/I19vQ4dqAElVh9nvD2k6GAPsFZhYDa9n
 qGRIT7lw0MvFI1Q==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-6-8364d104ff40@google.com>
Subject: [PATCH v4 6/6] rust: gpuvm: add GpuVmCore::sm_map()
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
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[asahilina.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DBDF4BB91A
X-Rspamd-Action: no action

Finally also add the operation for creating new mappings. Mapping
operations need extra data in the context since they involve a vm_bo
coming from the outside.

Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs    |   9 ++-
 rust/kernel/drm/gpuvm/sm_ops.rs | 157 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 160 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index fd4c662f84a4830515c2ddd18d5d503e4ee9fc8f..20e512842dfc6f2bd461cd3d22361ef8bff2f204 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -93,7 +93,7 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops {
             vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
             vm_bo_free: GpuVmBo::<T>::FREE_FN,
             vm_bo_validate: None,
-            sm_step_map: None,
+            sm_step_map: Some(Self::sm_step_map),
             sm_step_unmap: Some(Self::sm_step_unmap),
             sm_step_remap: Some(Self::sm_step_remap),
         }
@@ -248,6 +248,13 @@ pub trait DriverGpuVm: Sized {
     /// The private data passed to callbacks.
     type SmContext<'ctx>;
 
+    /// Indicates that a new mapping should be created.
+    fn sm_step_map<'op, 'ctx>(
+        &mut self,
+        op: OpMap<'op, Self>,
+        context: &mut Self::SmContext<'ctx>,
+    ) -> Result<OpMapped<'op, Self>, Error>;
+
     /// Indicates that an existing mapping should be removed.
     fn sm_step_unmap<'op, 'ctx>(
         &mut self,
diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm_ops.rs
index 3f345bce14a18ae88ce525629e3e5b76820e97a6..6ad741364b1856b3863b118a1d5581c54bb98ea9 100644
--- a/rust/kernel/drm/gpuvm/sm_ops.rs
+++ b/rust/kernel/drm/gpuvm/sm_ops.rs
@@ -8,6 +8,103 @@ struct SmData<'a, 'ctx, T: DriverGpuVm> {
     user_context: &'a mut T::SmContext<'ctx>,
 }
 
+#[repr(C)]
+struct SmMapData<'a, 'ctx, T: DriverGpuVm> {
+    sm_data: SmData<'a, 'ctx, T>,
+    vm_bo: GpuVmBoRegistered<T>,
+}
+
+/// The argument for [`GpuVmCore::sm_map`].
+pub struct OpMapRequest<'a, 'ctx, T: DriverGpuVm> {
+    /// Address in GPU virtual address space.
+    pub addr: u64,
+    /// Length of mapping to create.
+    pub range: u64,
+    /// Offset in GEM object.
+    pub gem_offset: u64,
+    /// The GEM object to map.
+    pub vm_bo: GpuVmBoRegistered<T>,
+    /// The user-provided context type.
+    pub context: &'a mut T::SmContext<'ctx>,
+}
+
+impl<'a, 'ctx, T: DriverGpuVm> OpMapRequest<'a, 'ctx, T> {
+    fn raw_request(&self) -> bindings::drm_gpuvm_map_req {
+        bindings::drm_gpuvm_map_req {
+            map: bindings::drm_gpuva_op_map {
+                va: bindings::drm_gpuva_op_map__bindgen_ty_1 {
+                    addr: self.addr,
+                    range: self.range,
+                },
+                gem: bindings::drm_gpuva_op_map__bindgen_ty_2 {
+                    offset: self.gem_offset,
+                    obj: self.vm_bo.obj().as_raw(),
+                },
+            },
+        }
+    }
+}
+
+/// Represents an `sm_step_map` operation that has not yet been completed.
+pub struct OpMap<'op, T: DriverGpuVm> {
+    op: &'op bindings::drm_gpuva_op_map,
+    // Since these abstractions are designed for immediate mode, the VM BO needs to be
+    // pre-allocated, so we always have it available when we reach this point.
+    vm_bo: &'op GpuVmBo<T>,
+    // This ensures that 'op is invariant, so that `OpMap<'long, T>` does not
+    // coerce to `OpMap<'short, T>`. This ensures that the user can't return
+    // the wrong `OpMapped` value.
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+impl<'op, T: DriverGpuVm> OpMap<'op, T> {
+    /// The base address of the new mapping.
+    pub fn addr(&self) -> u64 {
+        self.op.va.addr
+    }
+
+    /// The length of the new mapping.
+    pub fn length(&self) -> u64 {
+        self.op.va.range
+    }
+
+    /// The offset within the [`drm_gem_object`](crate::gem::Object).
+    pub fn gem_offset(&self) -> u64 {
+        self.op.gem.offset
+    }
+
+    /// The [`drm_gem_object`](crate::gem::Object) to map.
+    pub fn obj(&self) -> &T::Object {
+        // SAFETY: The `obj` pointer is guaranteed to be valid.
+        unsafe { <T::Object as IntoGEMObject>::from_raw(self.op.gem.obj) }
+    }
+
+    /// The [`GpuVmBo`] that the new VA will be associated with.
+    pub fn vm_bo(&self) -> &GpuVmBo<T> {
+        self.vm_bo
+    }
+
+    /// Use the pre-allocated VA to carry out this map operation.
+    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl PinInit<T::VaData>) -> OpMapped<'op, T> {
+        let va = va.prepare(va_data);
+        // SAFETY: By the type invariants we may access the interval tree.
+        unsafe { bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), va, self.op) };
+
+        let _gpuva_guard = self.vm_bo().lock_gpuva();
+        // SAFETY: The va is prepared for insertion, and we hold the GEM lock.
+        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
+
+        OpMapped {
+            _invariant: self._invariant,
+        }
+    }
+}
+
+/// Represents a completed [`OpMap`] operation.
+pub struct OpMapped<'op, T> {
+    _invariant: PhantomData<*mut &'op mut T>,
+}
+
 /// Represents an `sm_step_unmap` operation that has not yet been completed.
 pub struct OpUnmap<'op, T: DriverGpuVm> {
     op: &'op bindings::drm_gpuva_op_unmap,
@@ -211,6 +308,30 @@ pub struct OpRemapped<'op, T> {
 }
 
 impl<T: DriverGpuVm> GpuVmCore<T> {
+    /// Create a mapping, removing or remapping anything that overlaps.
+    ///
+    /// Internally calls the [`DriverGpuVm`] callbacks similar to [`Self::sm_unmap`], except that
+    /// the [`DriverGpuVm::sm_step_map`] is called once to create the requested mapping.
+    #[inline]
+    pub fn sm_map(&mut self, req: OpMapRequest<'_, '_, T>) -> Result {
+        let gpuvm = self.as_raw();
+        let raw_req = req.raw_request();
+        let mut p = SmMapData {
+            sm_data: SmData {
+                gpuvm: self,
+                user_context: req.context,
+            },
+            vm_bo: req.vm_bo,
+        };
+        // SAFETY:
+        // * raw_request() creates a valid request.
+        // * The private data is valid to be interpreted as both SmData and SmMapData since the
+        //   first field of SmMapData is SmData.
+        to_result(unsafe {
+            bindings::drm_gpuvm_sm_map(gpuvm, (&raw mut p).cast(), &raw const raw_req)
+        })
+    }
+
     /// Remove any mappings in the given region.
     ///
     /// Internally calls [`DriverGpuVm::sm_step_unmap`] for ranges entirely contained within the
@@ -224,19 +345,45 @@ pub fn sm_unmap(&mut self, addr: u64, length: u64, context: &mut T::SmContext<'_
         };
         // SAFETY:
         // * raw_request() creates a valid request.
-        // * The private data is valid to be interpreted as SmData.
+        // * The private data is a valid SmData.
         to_result(unsafe { bindings::drm_gpuvm_sm_unmap(gpuvm, (&raw mut p).cast(), addr, length) })
     }
 }
 
 impl<T: DriverGpuVm> GpuVm<T> {
     /// # Safety
-    /// Must be called from `sm_unmap` with a pointer to `SmData`.
+    /// Must be called from `sm_map` with a pointer to `SmMapData`.
+    pub(super) unsafe extern "C" fn sm_step_map(
+        op: *mut bindings::drm_gpuva_op,
+        p: *mut c_void,
+    ) -> c_int {
+        // SAFETY: If we reach `sm_step_map` then we were called from `sm_map` which always passes
+        // an `SmMapData` as private data.
+        let p = unsafe { &mut *p.cast::<SmMapData<'_, '_, T>>() };
+        let op = OpMap {
+            // SAFETY: sm_step_map is called with a map operation.
+            op: unsafe { &(*op).__bindgen_anon_1.map },
+            vm_bo: &p.vm_bo,
+            _invariant: PhantomData,
+        };
+        match p
+            .sm_data
+            .gpuvm
+            .data()
+            .sm_step_map(op, p.sm_data.user_context)
+        {
+            Ok(OpMapped { .. }) => 0,
+            Err(err) => err.to_errno(),
+        }
+    }
+
+    /// # Safety
+    /// Must be called from `sm_map` or `sm_unmap` with a pointer to `SmMapData` or `SmData`.
     pub(super) unsafe extern "C" fn sm_step_unmap(
         op: *mut bindings::drm_gpuva_op,
         p: *mut c_void,
     ) -> c_int {
-        // SAFETY: The caller provides a pointer to `SmData`.
+        // SAFETY: The caller provides a pointer that can be treated as `SmData`.
         let p = unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
         let op = OpUnmap {
             // SAFETY: sm_step_unmap is called with an unmap operation.
@@ -250,12 +397,12 @@ impl<T: DriverGpuVm> GpuVm<T> {
     }
 
     /// # Safety
-    /// Must be called from `sm_unmap` with a pointer to `SmData`.
+    /// Must be called from `sm_map` or `sm_unmap` with a pointer to `SmMapData` or `SmData`.
     pub(super) unsafe extern "C" fn sm_step_remap(
         op: *mut bindings::drm_gpuva_op,
         p: *mut c_void,
     ) -> c_int {
-        // SAFETY: The caller provides a pointer to `SmData`.
+        // SAFETY: The caller provides a pointer that can be treated as `SmData`.
         let p = unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
         let op = OpRemap {
             // SAFETY: sm_step_remap is called with a remap operation.

-- 
2.53.0.rc1.225.gd81095ad13-goog

