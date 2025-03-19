Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D6A69183
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6B10E53B;
	Wed, 19 Mar 2025 14:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L4lHAbzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1893510E534;
 Wed, 19 Mar 2025 14:56:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-223a7065ff8so52518965ad.0; 
 Wed, 19 Mar 2025 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396160; x=1743000960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzrclKqnSLuC6igPSGd4oKUZVxjgZgQQ21kYeu+qNAw=;
 b=L4lHAbzjpONTPmqczTEfqIsm3MCl0NCwftrKExBWHpn5geuqDjKHc0uXv9uMMF9WpI
 zmJiSvCUvNYovg6nzHE2ue+Wi0w0tjlqaSPQM260ZXz/NKHEieLe2OwbMrT+1xXtEf+B
 mpPHX0miNpzd6MEm4SvDN7PEMldTcoP30083UWj8UoALSoFJB+xJhD0Ajrd8xMZ0fe12
 KCx0HLKChm7IxXVqzHd2zDPSdibcpyBgPMp0NIAvyDRptPQux8sFL2pN5jSjV1rPJBxi
 H3y8D7lhnzzV0w1/vkiAYb6fXoJ90cYwg8l0yVV59mDkPkPA53eCpwT1AhodBpHog2Y/
 tYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396160; x=1743000960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lzrclKqnSLuC6igPSGd4oKUZVxjgZgQQ21kYeu+qNAw=;
 b=PRRa7tUIeVX1Rp86lGQ6uEXW09UzjjVEmZagCujL/kFgQBn4juro9S/NrLBzxN7k3k
 I8LDpnkJidCSpmQtNOpuYo0Z/yLYMoB8g+lxRJt2EEaqizNf27tB5pYQE70ZqTjT94EU
 6BBiNDZY0AmRzzzCuxd06yhCIwql3saf4Vl5+7eOrFw5IjGl1DoJUwhpyXt0QhOeLZ1C
 PxLOIbPDhxsF/pz9joMNimLzeNscA66yb8kffszeb/Tddjg5AdErAeKg6DLVEIFDDzbJ
 qzRxhLeSi9/dsIpMjraJQZBaKIXZU2RwORrUvZHCsBErpVmIVIusTAz+Fyjd7zfQhs9+
 k5jA==
X-Gm-Message-State: AOJu0Yxo476wqg5NvE+2XI+yl5NP8o75Ygk3/Togiq5NgHNkmie6bqwV
 LstpnJtzyUINFhz0ghvyzivFF2YgE26N1mAUs4mcj/Czi4jM+U3v/R8AZA==
X-Gm-Gg: ASbGnctUgTFh2rqUek6VmiKDE3vTrstny5CyRMEYkWWto8gSjN7hSKv4dUbS/OarSb8
 +uCuKAJSnKtR4cf4oQAIRHFYTdchm+XrNxqNUoNq33W3kh4GwCU7fFYs19au36i8I+t8GSmzk4K
 aIBEX59v49B/KQwDGg1TB2WlUj2Tfg+WLh5dd37QL0zLHES+mPR4mkeVbwhMr9fhY+w9diw9Ov1
 b7RIUdf7EOXZII6HLugC1bR9KDbM3d4mbbPELEIccAf/Z3RGSyndVjsOP3osgRbIAOrE8mfP6hb
 oXQXXMQsTP/z557t1ELhbydv4AgAWZTHn6cX1SCIeffUayovixQc1Mvscz34MQMHXk9GiUlMiva
 Zxp4bxCfJxSK/s868SX9bgerQ/niMlA==
X-Google-Smtp-Source: AGHT+IHdDL0qktvi0766ilD4DZ91nDGI11VuBNzb7WvAPu6gZEBkKU3yNLQGg0sf610Nty8FPhSWEQ==
X-Received: by 2002:a17:902:e952:b0:223:5379:5e4e with SMTP id
 d9443c01a7336-2264981dc4dmr63164075ad.10.1742396160120; 
 Wed, 19 Mar 2025 07:56:00 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6ba6a13sm115019115ad.118.2025.03.19.07.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 28/34] drm/msm: Wire up gpuvm ops
Date: Wed, 19 Mar 2025 07:52:40 -0700
Message-ID: <20250319145425.51935-29-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

Hook up the map/remap/unmap ops to apply MAP/UNMAP operations.  The
MAP/UNMAP operations are split up by drm_gpuvm into a series of map/
remap/unmap ops, for example an UNMAP operation which spans multiple
vmas will get split up into a sequence of unmap (and possibly remap)
ops which each apply to a single vma.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h     |  12 ++
 drivers/gpu/drm/msm/msm_gem_vma.c | 329 ++++++++++++++++++++++++++++--
 2 files changed, 320 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 117f0e35e628..7f6315a66751 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,16 @@ struct msm_gem_vm {
 	/** @vm_lock: protects gpuvm insert/remove/traverse */
 	struct mutex vm_lock;
 
+	/**
+	 * @op_lock:
+	 *
+	 * Serializes VM operations.  Typically operations are serialized
+	 * by virtue of running on the VM_BIND queue, but in the cleanup
+	 * path (or if multiple VM_BIND queues) the @op_lock provides the
+	 * needed serialization.
+	 */
+	struct mutex op_lock;
+
 	/** @mmu: The mmu object which manages the pgtables */
 	struct msm_mmu *mmu;
 
@@ -121,6 +131,8 @@ void msm_vma_job_cleanup(struct msm_gem_submit *submit);
 
 struct msm_fence_context;
 
+#define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
+
 /**
  * struct msm_gem_vma - a VMA mapping
  *
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 554ec93456a0..09d4746248c2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,8 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -20,18 +22,29 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+msm_gem_vma_unmap_range(struct drm_gpuva *vma, uint64_t unmap_start, uint64_t unmap_range)
+{
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
+
+	vm_dbg("%p:%p: %016llx %016llx", vma->vm, vma, unmap_start, unmap_start + unmap_range);
+
+	if (vma->gem.obj)
+		msm_gem_assert_locked(vma->gem.obj);
+
+	vm->mmu->funcs->unmap(vm->mmu, unmap_start, unmap_range);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	msm_gem_vma_unmap_range(vma, vma->va.addr, vma->va.range);
 
 	msm_vma->mapped = false;
 }
@@ -52,6 +65,11 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 
 	msm_vma->mapped = true;
 
+	vm_dbg("%p: %016llx %016llx", vma, vma->va.addr, vma->va.range);
+
+	if (vma->gem.obj)
+		msm_gem_assert_locked(vma->gem.obj);
+
 	/*
 	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
@@ -79,10 +97,11 @@ static void __vma_close(struct drm_gpuva *vma)
 	GEM_WARN_ON(msm_vma->mapped);
 	GEM_WARN_ON(!mutex_is_locked(&vm->vm_lock));
 
-	spin_lock(&vm->mm_lock);
-	if (vma->va.addr && vm->managed)
+	if (vma->va.addr && vm->managed) {
+		spin_lock(&vm->mm_lock);
 		drm_mm_remove_node(&msm_vma->node);
-	spin_unlock(&vm->mm_lock);
+		spin_unlock(&vm->mm_lock);
+	}
 
 	drm_gpuva_remove(vma);
 	drm_gpuva_unlink(vma);
@@ -101,11 +120,9 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 	 */
 	GEM_WARN_ON(!vm->managed);
 
-	dma_resv_lock(drm_gpuvm_resv(vma->vm), NULL);
 	mutex_lock(&vm->vm_lock);
 	__vma_close(vma);
 	mutex_unlock(&vm->vm_lock);
-	dma_resv_unlock(drm_gpuvm_resv(vma->vm));
 }
 
 static struct drm_gpuva *
@@ -124,6 +141,7 @@ __vma_init(struct msm_gem_vma *vma, struct drm_gpuvm *_vm,
 
 	if (vm->managed) {
 		BUG_ON(offset != 0);
+		BUG_ON(!obj);  /* NULL mappings not valid for kernel managed VM */
 		spin_lock(&vm->mm_lock);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
@@ -137,7 +155,8 @@ __vma_init(struct msm_gem_vma *vma, struct drm_gpuvm *_vm,
 		range_end   = range_start + obj->size;
 	}
 
-	GEM_WARN_ON((range_end - range_start) > obj->size);
+	if (obj)
+		GEM_WARN_ON((range_end - range_start) > obj->size);
 
 	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
@@ -146,6 +165,9 @@ __vma_init(struct msm_gem_vma *vma, struct drm_gpuvm *_vm,
 	if (ret)
 		goto err_free_range;
 
+	if (!obj)
+		return &vma->base;
+
 	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
 	if (IS_ERR(vm_bo)) {
 		ret = PTR_ERR(vm_bo);
@@ -190,39 +212,289 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 	return &vma->base;
 }
 
+static int
+msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = vm_bo->obj;
+	struct drm_gpuva *vma;
+	int ret;
+
+	msm_gem_assert_locked(obj);
+
+	drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+		ret = msm_gem_pin_vma_locked(obj, vma);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+struct op_arg {
+	unsigned flags;
+	struct drm_gpuvm *vm;
+	struct msm_gem_submit *submit;
+};
+
+static struct drm_gpuva *
+vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
+{
+	struct msm_gem_vma *vma;
+
+	if (WARN_ON(list_empty(&arg->submit->preallocated_vmas)))
+		return NULL;
+
+	vma = list_first_entry(&arg->submit->preallocated_vmas,
+			       struct msm_gem_vma, base.rb.entry);
+
+	list_del(&vma->base.rb.entry);
+
+	return __vma_init(vma, arg->vm, op->gem.obj, op->gem.offset,
+			  op->va.addr, op->va.addr + op->va.range);
+}
+
+static int
+msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
+{
+	struct drm_gem_object *obj = op->map.gem.obj;
+	struct drm_gpuva *vma;
+	struct sg_table *sgt;
+	unsigned prot;
+
+	vma = vma_from_op(arg, &op->map);
+
+	vm_dbg("%p:%p: %016llx %016llx", vma->vm, vma, vma->va.addr, vma->va.range);
+
+	if (obj) {
+		sgt = to_msm_bo(obj)->sgt;
+		prot = msm_gem_prot(obj);
+	} else {
+		sgt = NULL;
+		prot = IOMMU_READ | IOMMU_WRITE;
+	}
+
+	if (WARN_ON(IS_ERR(vma)))
+		return PTR_ERR(vma);
+
+	vma->flags = ((struct op_arg *)arg)->flags;
+
+	return msm_gem_vma_map(vma, prot, sgt);
+}
+
+static int
+msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
+{
+	struct drm_gpuvm *vm = ((struct op_arg *)arg)->vm;
+	struct drm_gpuva *orig_vma = op->remap.unmap->va;
+	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
+	uint64_t unmap_start, unmap_range;
+	unsigned flags;
+
+	vm_dbg("orig_vma: %p:%p: %016llx %016llx", vm, orig_vma, orig_vma->va.addr, orig_vma->va.range);
+
+	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
+
+	msm_gem_vma_unmap_range(op->remap.unmap->va, unmap_start, unmap_range);
+
+	/*
+	 * Part of this GEM obj is still mapped, but we're going to kill the
+	 * existing VMA and replace it with one or two new ones (ie. two if)
+	 * the unmapped range is in the middle of the existing (unmap) VMA.
+	 * So just set the state to unmapped:
+	 */
+	to_msm_vma(orig_vma)->mapped = false;
+
+	/*
+	 * The prev_vma and/or next_vma are replacing the unmapped vma, and
+	 * therefore should preserve it's flags:
+	 */
+	flags = orig_vma->flags;
+
+	__vma_close(orig_vma);
+
+	if (op->remap.prev) {
+		prev_vma = vma_from_op(arg, op->remap.prev);
+		if (WARN_ON(IS_ERR(prev_vma)))
+			return PTR_ERR(prev_vma);
+
+		vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
+		to_msm_vma(prev_vma)->mapped = true;
+		prev_vma->flags = flags;
+	}
+
+	if (op->remap.next) {
+		next_vma = vma_from_op(arg, op->remap.next);
+		if (WARN_ON(IS_ERR(next_vma)))
+			return PTR_ERR(next_vma);
+
+		vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
+		to_msm_vma(next_vma)->mapped = true;
+		next_vma->flags = flags;
+	}
+
+	return 0;
+}
+
+static int
+msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_gpuva *vma = op->unmap.va;
+
+	vm_dbg("%p:%p: %016llx %016llx", vma->vm, vma, vma->va.addr, vma->va.range);
+
+	msm_gem_vma_unmap(vma);
+	__vma_close(vma);
+
+	return 0;
+}
+
 static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
+	.vm_bo_validate = msm_gem_vm_bo_validate,
+	.sm_step_map = msm_gem_vm_sm_step_map,
+	.sm_step_remap = msm_gem_vm_sm_step_remap,
+	.sm_step_unmap = msm_gem_vm_sm_step_unmap,
 };
 
+static void
+cond_lock(struct drm_gem_object *obj)
+{
+	if (!obj)
+		return;
+
+	/*
+	 * Hold a ref while we have the obj locked, so drm_gpuvm doesn't
+	 * manage to drop the last ref to the obj while it is locked:
+	 */
+	drm_gem_object_get(obj);
+	msm_gem_lock(obj);
+}
+
+static void
+cond_unlock(struct drm_gem_object *obj)
+{
+	if (!obj)
+		return;
+
+	msm_gem_unlock(obj);
+	/* Drop the ref obtained in cond_lock(): */
+	drm_gem_object_put(obj);
+}
+
+static int
+run_bo_unmap(struct op_arg *arg, u64 req_addr, u64 req_range)
+{
+	struct drm_gpuva *vma, *next;
+	struct drm_gpuvm *vm = arg->vm;
+	int ret;
+	u64 req_end = req_addr + req_range;
+
+	GEM_WARN_ON(!mutex_is_locked(&to_msm_vm(vm)->op_lock));
+
+	/*
+	 * There are two locks at play when it comes to inserting/
+	 * removing objs into a VM.  There is vm->vm_lock and the
+	 * obj resv lock.  Because there are N objs and M VMs, and
+	 * an obj can be attached to an arbitrary # of VMs, the only
+	 * alternative is a single global lock.
+	 *
+	 * With two locks at play, there are two possible orderings
+	 * of locking:
+	 *
+	 * 1) locking obj first, and then vm_lock.  The problem with
+	 *    this ordering is that OP_UNMAP can be touching an
+	 *    arbitrary # of VMAs, with their own objs.  So we have
+	 *    no way to know which objs to lock without traversing
+	 *    the VM.  Which requires vm_lock!
+	 *
+	 * 2) vm_lock first, and then obj lock.  The problem with this
+	 *    ordering is that non-VM_BIND (ie. kernel managed VM)
+	 *    userspace relies on implicit VMA teardown when a BO is
+	 *    freed.  Which means there are paths where we need to
+	 *    traverse the obj's gpuva list to find the VM(s).  Which
+	 *    requires the obj lock!
+	 *
+	 * To resolve this we rely on the fact that, with a VM_BIND
+	 * userspace the legacy paths are disallowed.  And all paths
+	 * which modify the VM also hold op_lock.  So we can savely
+	 * reach into the VM to find the first object to lock.  But
+	 * it means having to bypass drm_gpuvm_sm_unmap(), and pull
+	 * out the impacted VMAs ourself.
+	 *
+	 * (The other option would be to use drm_gpuvm_sm_unmap_ops_create(),
+	 * but that requires memory allocation.. which we can't do
+	 * here.)
+	 */
+	drm_gpuvm_for_each_va_range_safe(vma, next, vm, req_addr, req_end) {
+		struct drm_gem_object *obj = vma->gem.obj;
+
+		cond_lock(obj);
+		mutex_lock(&to_msm_vm(vm)->vm_lock);
+
+		ret = drm_gpuvm_sm_unmap_va(vma, arg,
+					    vma->va.addr,
+					    vma->va.range);
+
+		mutex_unlock(&to_msm_vm(vm)->vm_lock);
+		cond_unlock(obj);
+
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static int
 run_bo_op(struct msm_gem_submit *submit, const struct msm_gem_submit_bo *bo)
 {
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+	struct op_arg arg = {
+		.vm = submit->vm,
+		.submit = submit,
+	};
 	unsigned op = bo->flags & MSM_SUBMIT_BO_OP_MASK;
+	int ret;
 
-	switch (op) {
-	case MSM_SUBMIT_BO_OP_MAP:
-	case MSM_SUBMIT_BO_OP_MAP_NULL:
-		return drm_gpuvm_sm_map(submit->vm, submit->vm, bo->iova,
-					bo->range, bo->obj, bo->bo_offset);
-		break;
-	case MSM_SUBMIT_BO_OP_UNMAP:
-		return drm_gpuvm_sm_unmap(submit->vm, submit->vm, bo->iova,
-					  bo->bo_offset);
+	if (op == MSM_SUBMIT_BO_OP_UNMAP) {
+		vm_dbg("UNMAP: %p: %016llx %016llx", vm, bo->iova, bo->range);
+		ret = run_bo_unmap(&arg, bo->iova, bo->range);
+	} else {
+		if ((op == MSM_SUBMIT_BO_OP_MAP) &&
+		    (bo->flags & MSM_SUBMIT_BO_DUMP))
+			arg.flags |= MSM_VMA_DUMP;
+
+		cond_lock(bo->obj);
+		mutex_lock(&vm->vm_lock);
+
+		vm_dbg("MAP: %p: %016llx %016llx", vm, bo->iova, bo->range);
+		ret = drm_gpuvm_sm_map(submit->vm, &arg,
+				       bo->iova, bo->range,
+				       bo->obj, bo->bo_offset);
+
+		mutex_unlock(&vm->vm_lock);
+		cond_unlock(bo->obj);
 	}
 
-	return -EINVAL;
+	return ret;
 }
 
 static struct dma_fence *
 msm_vma_job_run(struct drm_sched_job *job)
 {
 	struct msm_gem_submit *submit = to_msm_submit(job);
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+	int ret = 0;
+
+	vm_dbg("");
+
+	mutex_lock(&vm->op_lock);
+	vm->mmu->prealloc = &submit->prealloc;
 
 	for (unsigned i = 0; i < submit->nr_bos; i++) {
 		int ret = run_bo_op(submit, &submit->bos[i]);
 		if (ret) {
 			to_msm_vm(submit->vm)->unusable = true;
-			return ERR_PTR(ret);
 		}
 	}
 
@@ -240,8 +512,11 @@ msm_vma_job_run(struct drm_sched_job *job)
 		msm_gem_unlock(obj);
 	}
 
+	vm->mmu->prealloc = NULL;
+	mutex_unlock(&vm->op_lock);
+
 	/* VM_BIND ops are synchronous, so no fence to wait on: */
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static void
@@ -404,6 +679,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	spin_lock_init(&vm->mm_lock);
 	mutex_init(&vm->vm_lock);
+	mutex_init(&vm->op_lock);
 
 	vm->mmu = mmu;
 	vm->managed = managed;
@@ -433,6 +709,9 @@ void
 msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 {
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
+	struct op_arg arg = {
+		.vm = gpuvm,
+	};
 
 	/*
 	 * For kernel managed VMs, the VMAs are torn down when the handle is
@@ -444,4 +723,12 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
 	drm_sched_stop(&vm->sched, NULL);
 	drm_sched_fini(&vm->sched);
+
+	/* Serialize against vm scheduler thread: */
+	mutex_lock(&vm->op_lock);
+
+	/* Tear down any remaining mappings: */
+	run_bo_unmap(&arg, gpuvm->mm_start, gpuvm->mm_range);
+
+	mutex_unlock(&vm->op_lock);
 }
-- 
2.48.1

