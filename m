Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGGVITm5cGmWZQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:32:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2226D5607E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F5010E1D0;
	Wed, 21 Jan 2026 11:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2idk6Vod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108110E1D0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 11:32:06 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso46493905e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 03:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768995125; x=1769599925;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ADHnj9pTGTbd43O9T51NFX85JNRLR0rvNZITUD0GxdM=;
 b=2idk6VodNl0aXFpoKtHMTm0gv4uQp6QGiuQn5aHSiJiwdvIGjDXEBLYlsshdGFR9e6
 uSo3QWqhrsz8G+L+Nv5HHW8USdfYM4zhp54qK+XQQDJNwCsGOoTr04iFkoqZkv0jaX0s
 +37Mshn6gmV5hGW36uGSRxK/r7qyBu6MFyUhCCY6YfxwF4tVkudB5GGkc13Bslrslkd/
 JA+cRughmGQkNnTsKFJECWr74Ifr6hUK/XUOydyPzMI5O0qWp6WPfa9jox51ZhpaaZ09
 5r1rthONYtTtV79X7O/yzBKKmFA8Ti5nqfjTdDT/CeidzRIkMdeTyPFRBqkEGnE2NYZd
 ZSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768995125; x=1769599925;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ADHnj9pTGTbd43O9T51NFX85JNRLR0rvNZITUD0GxdM=;
 b=hhPJM1pCI2hKK8oMCOJkIbkmIn2tQRE90HLp1ErKOZY4EDFRDkuNzN87yOJ4c00YWS
 qFA1c+3uTyJTi4p4pFuJt0ux+XLh/t4GP1pmV/9uAIXe6raQvgUrjYAXDTjvyaXlLJCp
 bdY5GwCCgG5eQx8r1DePnhypmIfqB7M6Q4SC38jGNoBRQ/oXNBfw+Rj2nGGOgfaqqQMJ
 wknoqjYlldbgGnt0IS0HUl8qB/SJGBBr+VxIJFs3r50BuAQu53bOYvCvcMUUJ586ACKt
 vtCGxY+dk4nPuQmLFK83U9RdCgBJxB+BvjjMm8rsNDCEZQ0lzirkS9D7+K8WwB+rBfFs
 eD3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0x5QnB/v07NyZQtg34OP0BQwafyTA4FK1TuVBLuB/ZNYWzoUq7b2uA3C0bs89mO0WsnMwcESWYF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywoakmi32vcJAogxq2Y3wfVgDx7KHKsaGR/+MnBr8GBnh1zdnc2
 QLRPnmzqeUTH77ja3sKslsGq40wjuPxAgiL0WvaIrRDxuXKquM+b3oWUN4AaOsVL9OwiqeNuNzF
 esaK1ih2ae/1/L2HsLQ==
X-Received: from wmbhb6.prod.google.com ([2002:a05:600c:8686:b0:475:dadb:c8f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d14:b0:477:73cc:82c2 with SMTP id
 5b1f17b1804b1-4803e7a4051mr69580645e9.9.1768995125342; 
 Wed, 21 Jan 2026 03:32:05 -0800 (PST)
Date: Wed, 21 Jan 2026 11:31:22 +0000
In-Reply-To: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9517; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=puxOKvWZSmMilkgdnuRja+EvIpEfKakk94O5pIyZrME=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpcLkezgTn6a3N4qhkQEjM7d2JXqI0C+4VoWJDj
 kUFK5DuqY6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXC5HgAKCRAEWL7uWMY5
 RlLXD/9c5Be8fBOxYmcDNrxEJd5yQFMEUqjllsfSNRz1dvTepH1SiaSzi7glFTAdjp5An2S5to8
 WhLUFtBdx0mZ/+NCKYDrUemcCJAQlKU/PQqnxyxUt6enja6LaLEJFM4iQ48jnmy6g4DrWyYjT8W
 WggqmFpNwL6y9QUQd8oRaTWTbUJ1m8Ij1yZxX945p87X1qTDvHOKy93sX5F2hVwtbbEpvUhkI6y
 ZOVUfZd1siQc2Qmlp26VbdZiGOtEqHWIzCl7zY/Fm/7mhMbh1WfQSfOO7LirdOQy9RbKwJpCvWB
 YdZLjD2FlvFbt3niguznRhBm3X+/xNIBki3nyOumowMvKCv3M9w6zYPjzphkbOKFQOzPDLN9kUT
 xXo+6eyPa7IWdPSyFCyBenLiPaHTaBBXaZc1K/NLOTn4xvQBMEibtH832F05Oq8WsH7GuMF/lCt
 Q9fgNg4bEtONTzB8XZncoG1Es2DolQQgoDsc8TlwMHuXs3x6cKwITDBYrSk++P9N5dCCbcRYZhZ
 /9kYoeiK2TNx24QP4O98/OrqEK6dcqrEjajqu5UAmGoTuXeSKc1JbfDXCr42ttyGhpa+ORAj+sa
 w0wQQfG2ZrvyVhWXSUD7l6PwFreHEK1it3mwvOqYvgvgek6no/VjxXnw0LJVOunmhCdBj+OBKT9
 6dJQszz7C6VtFrA==
X-Mailer: b4 0.14.2
Message-ID: <20260121-gpuvm-rust-v3-6-dd95c04aec35@google.com>
Subject: [PATCH v3 6/6] rust: gpuvm: add GpuVmCore::sm_map()
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,asahilina.net:email]
X-Rspamd-Queue-Id: 2226D5607E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Finally also add the operation for creating new mappings. Mapping
operations need extra data in the context since they involve a vm_bo
coming from the outside.

Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs    |   9 ++-
 rust/kernel/drm/gpuvm/sm_ops.rs | 154 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 157 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 165a25666ccc3d62e59b73483d4eedff044423e9..557c0d629eec912a97fc4ef18495d5bf0807db0a 100644
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
index 3c29d10d63f0b0a1976c714a86d486948ba81a15..5f3c5d3918147a6962e5658443c343835baa10b8 100644
--- a/rust/kernel/drm/gpuvm/sm_ops.rs
+++ b/rust/kernel/drm/gpuvm/sm_ops.rs
@@ -8,6 +8,100 @@ struct SmData<'a, 'ctx, T: DriverGpuVm> {
     user_context: &'a mut T::SmContext<'ctx>,
 }
 
+#[repr(C)]
+struct SmMapData<'a, 'ctx, T: DriverGpuVm> {
+    sm_data: SmData<'a, 'ctx, T>,
+    vm_bo: GpuVmBoResident<T>,
+}
+
+/// The argument for [`GpuVmCore::sm_map`].
+pub struct OpMapRequest<'a, 'ctx, T: DriverGpuVm> {
+    /// Address in GPU virtual address space.
+    pub addr: u64,
+    /// Length of mapping to create.
+    pub range: u64,
+    /// Offset in GEM object.
+    pub offset: u64,
+    /// The GEM object to map.
+    pub vm_bo: GpuVmBoResident<T>,
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
+                    offset: self.offset,
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
+    _invariant: PhantomData<*mut &'op mut T>,
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
@@ -205,6 +299,30 @@ pub struct OpRemapped<'op, T> {
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
@@ -218,19 +336,45 @@ pub fn sm_unmap(&mut self, addr: u64, length: u64, context: &mut T::SmContext<'_
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
@@ -244,12 +388,12 @@ impl<T: DriverGpuVm> GpuVm<T> {
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
2.52.0.457.g6b5491de43-goog

