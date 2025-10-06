Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFCBBDF4F
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 14:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B4810E33F;
	Mon,  6 Oct 2025 12:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hl2l0hkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7606B10E33F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 12:06:08 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-62f9cfb8075so6228785a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759752367; x=1760357167;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=88/GVCOwGrJaXsPiHV0MJaVKEsUV1kDvOWaWrmyPql4=;
 b=hl2l0hkRyTq0jZb6MPCwjrDgbspSHnCrCYs6gx9i8LxRO4o+jt4PK+UCeUEnTL7baa
 GhYZ7vg8D7kFqmGRZpnFV9spIx4ZDEtkR6DTOaTSaXLpCQsNzxs0ObeZbAPcpayCETNP
 LmKkwNkoo0ZdZzH8gxBLndezqm92zU6z3JWQIXVaVyajIeLqK455+eNysK9ksK+Jrtcc
 oidnye8UhByYnBjKr2jGq6FuAr1FQnRmuvdP299sYNHdezuWlnbIKSXLpvB8PopFpNkS
 rilZ45o1kdiefnDmR/oPO+t6xZSj3ZkckYXNblBGG04VSHF6JisSJHGZZPM/bXCp9lW7
 ZpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759752367; x=1760357167;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=88/GVCOwGrJaXsPiHV0MJaVKEsUV1kDvOWaWrmyPql4=;
 b=IQ4Eoit6XsQeqE0Zc2VUIwmmjRNicpQ196Wxu1pgH7AC90NR6uYjJhtsF+bQ+IWYJ9
 XMBJQNJwAUavzphhblV35PLGE0Qj3DGSEfzhJwq0oO9B+kaBd2TZdsO1hOBACXvVXvo3
 zj/hYOO+WFwmU+uBj+mzqSaxrqrOgquck359s5q6PgoaHNpmhmVsDIBXtwKQxx/XJGji
 1CH/O/1QYg8XyrFaHPBFYa/YoifqBStNLPH7yAUavS06AG+aL5xQwbFUncJ1Hx12jLqN
 iwzl21+DFt3gUoD1XwXuKW911wpbvRyVCnpakWT7vJPz7SmedxyZSG/UH6cPDJ6U1+AT
 6pvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGcNxwdDB9TUaKK3RgPfc0VmHHVprrQTXFWoawW0v9MLHHeAk1eIm9UYJ5elRHTbXuZP5LtwO2jFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK6kZDVsa8nS0K6b3Aqlc5mRZeQ+ZOWdgnsOlnWn7GP4CpK5JK
 MgPuzQ6qBC4id/Gh+e1RlyHLScULOKx5dwf7eR+lvlSrrwG+vVdlAT77znFHferdooAN0i2uhG8
 GEOJP126gXWv/LjW5ew==
X-Google-Smtp-Source: AGHT+IEVtzOmpDZonTPDFSLDjD2OMEpMVRRnNG9ai+escEyR/UOCTpe+yoY+uyWbjhCS51BYNx+FsLHoZ7JAe98=
X-Received: from edxw20.prod.google.com ([2002:a05:6402:714:b0:62f:d279:8fa2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13ca:b0:637:98d4:9678 with SMTP id
 4fb4d7f45d1cf-63939c29899mr12989769a12.33.1759752366757; 
 Mon, 06 Oct 2025 05:06:06 -0700 (PDT)
Date: Mon, 06 Oct 2025 12:05:56 +0000
In-Reply-To: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
Mime-Version: 1.0
References: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8799; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=fLBbUzzVR04IANknkBv0gUTVHrkfoRq49eaOBHXUDOY=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo47CqWGz7KkKJv8KoR3fjei4AbP+M/rlLhMyEa
 2hMiAWrabyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaOOwqgAKCRAEWL7uWMY5
 Rtz3D/9Z2sn2zPYrxAWg0zkhWXBNDSj3SaiDvl2nN0M03GuCdapo/DhHylU8ZnhwwnwIVTXd4VA
 NgebGV/nzoSwkHQWqvneNmAv9YFRJyU/2MJI5wdjoUx7wVNprjr30XjBBQFsLwT4SZaUzCJXfjC
 E50O11YBPN+P1QtCAU6jJ7+nR0uvmkpF7td5EMVfS49klOiJXHv1e2YlEphp6HyxYvv+DZXLzU9
 pqC+xcp3xsx7Q5FWC1ZHp6Ie9i77oDXPtHCEvCXgAGlC1eG7N1uViHk2tOIzswGgBeGTTcbQDWK
 ohBLp4Q013CoK00l0jxZcECHX/LHO5VV3y8gQK3+tpqUaMbBjaCSGPfcY5P4DCWCDKXQRoarq1E
 QL/7/ancGzJwU97QWeps/scG95EsWmbs5S7jwpR+nfP80kcYu6UXM90LU0L3IOWpLJt3o7WD8PR
 NYWTB/+IhdE1qBO9rnKoYUzhWMGDrI6M4rnOJOBsDERx7nikJYFyurtfTtCvNFjuAEcco6nlqej
 ZwSoGxp4jHMf44IVTOVK3MO9aM+vPuOr8eKYg9Ag2uEY7homx9isN2S9BZ/t4/guy8Y73tfCZeJ
 Y6eWB5FjggfWHJodiek3dXxg+QZjUQILur8P778czNpYROzzqYyASyJUMdZdY2piJkta05sXJFK
 1V8/CLBdixGPBPg==
X-Mailer: b4 0.14.2
Message-ID: <20251006-vmbo-defer-v4-2-30cbd2c05adb@google.com>
Subject: [PATCH v4 2/2] panthor: use drm_gpuva_unlink_defer()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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

Instead of manually deferring cleanup of vm_bos, use the new GPUVM
infrastructure for doing so.

To avoid manual management of vm_bo refcounts, the panthor_vma_link()
and panthor_vma_unlink() methods are changed to get and put a vm_bo
refcount on the vm_bo. This simplifies the code a lot. I preserved the
behavior where panthor_gpuva_sm_step_map() drops the refcount right away
rather than letting panthor_vm_cleanup_op_ctx() do it later.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 110 ++++++----------------------------
 1 file changed, 19 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e3789d17c5a87fc8de3bc86764b804bc..9f5f4ddf291024121f3fd5644f2fdeba354fa67c 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -181,20 +181,6 @@ struct panthor_vm_op_ctx {
 		u64 range;
 	} va;
 
-	/**
-	 * @returned_vmas: List of panthor_vma objects returned after a VM operation.
-	 *
-	 * For unmap operations, this will contain all VMAs that were covered by the
-	 * specified VA range.
-	 *
-	 * For map operations, this will contain all VMAs that previously mapped to
-	 * the specified VA range.
-	 *
-	 * Those VMAs, and the resources they point to will be released as part of
-	 * the op_ctx cleanup operation.
-	 */
-	struct list_head returned_vmas;
-
 	/** @map: Fields specific to a map operation. */
 	struct {
 		/** @map.vm_bo: Buffer object to map. */
@@ -1081,47 +1067,18 @@ void panthor_vm_free_va(struct panthor_vm *vm, struct drm_mm_node *va_node)
 	mutex_unlock(&vm->mm_lock);
 }
 
-static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
+static void panthor_vm_bo_free(struct drm_gpuvm_bo *vm_bo)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
-	struct drm_gpuvm *vm = vm_bo->vm;
-	bool unpin;
-
-	/* We must retain the GEM before calling drm_gpuvm_bo_put(),
-	 * otherwise the mutex might be destroyed while we hold it.
-	 * Same goes for the VM, since we take the VM resv lock.
-	 */
-	drm_gem_object_get(&bo->base.base);
-	drm_gpuvm_get(vm);
-
-	/* We take the resv lock to protect against concurrent accesses to the
-	 * gpuvm evicted/extobj lists that are modified in
-	 * drm_gpuvm_bo_destroy(), which is called if drm_gpuvm_bo_put()
-	 * releases sthe last vm_bo reference.
-	 * We take the BO GPUVA list lock to protect the vm_bo removal from the
-	 * GEM vm_bo list.
-	 */
-	dma_resv_lock(drm_gpuvm_resv(vm), NULL);
-	mutex_lock(&bo->base.base.gpuva.lock);
-	unpin = drm_gpuvm_bo_put(vm_bo);
-	mutex_unlock(&bo->base.base.gpuva.lock);
-	dma_resv_unlock(drm_gpuvm_resv(vm));
 
-	/* If the vm_bo object was destroyed, release the pin reference that
-	 * was hold by this object.
-	 */
-	if (unpin && !drm_gem_is_imported(&bo->base.base))
+	if (!drm_gem_is_imported(&bo->base.base))
 		drm_gem_shmem_unpin(&bo->base);
-
-	drm_gpuvm_put(vm);
-	drm_gem_object_put(&bo->base.base);
+	kfree(vm_bo);
 }
 
 static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 				      struct panthor_vm *vm)
 {
-	struct panthor_vma *vma, *tmp_vma;
-
 	u32 remaining_pt_count = op_ctx->rsvd_page_tables.count -
 				 op_ctx->rsvd_page_tables.ptr;
 
@@ -1134,16 +1091,12 @@ static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	kfree(op_ctx->rsvd_page_tables.pages);
 
 	if (op_ctx->map.vm_bo)
-		panthor_vm_bo_put(op_ctx->map.vm_bo);
+		drm_gpuvm_bo_put_deferred(op_ctx->map.vm_bo);
 
 	for (u32 i = 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++)
 		kfree(op_ctx->preallocated_vmas[i]);
 
-	list_for_each_entry_safe(vma, tmp_vma, &op_ctx->returned_vmas, node) {
-		list_del(&vma->node);
-		panthor_vm_bo_put(vma->base.vm_bo);
-		kfree(vma);
-	}
+	drm_gpuvm_bo_deferred_cleanup(&vm->base);
 }
 
 static struct panthor_vma *
@@ -1232,7 +1185,6 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		return -EINVAL;
 
 	memset(op_ctx, 0, sizeof(*op_ctx));
-	INIT_LIST_HEAD(&op_ctx->returned_vmas);
 	op_ctx->flags = flags;
 	op_ctx->va.range = size;
 	op_ctx->va.addr = va;
@@ -1243,7 +1195,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 
 	if (!drm_gem_is_imported(&bo->base.base)) {
 		/* Pre-reserve the BO pages, so the map operation doesn't have to
-		 * allocate.
+		 * allocate. This pin is dropped in panthor_vm_bo_free(), so
+		 * once we have successfully called drm_gpuvm_bo_create(),
+		 * GPUVM will take care of dropping the pin for us.
 		 */
 		ret = drm_gem_shmem_pin(&bo->base);
 		if (ret)
@@ -1282,16 +1236,6 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	mutex_unlock(&bo->base.base.gpuva.lock);
 	dma_resv_unlock(panthor_vm_resv(vm));
 
-	/* If the a vm_bo for this <VM,BO> combination exists, it already
-	 * retains a pin ref, and we can release the one we took earlier.
-	 *
-	 * If our pre-allocated vm_bo is picked, it now retains the pin ref,
-	 * which will be released in panthor_vm_bo_put().
-	 */
-	if (preallocated_vm_bo != op_ctx->map.vm_bo &&
-	    !drm_gem_is_imported(&bo->base.base))
-		drm_gem_shmem_unpin(&bo->base);
-
 	op_ctx->map.bo_offset = offset;
 
 	/* L1, L2 and L3 page tables.
@@ -1339,7 +1283,6 @@ static int panthor_vm_prepare_unmap_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	int ret;
 
 	memset(op_ctx, 0, sizeof(*op_ctx));
-	INIT_LIST_HEAD(&op_ctx->returned_vmas);
 	op_ctx->va.range = size;
 	op_ctx->va.addr = va;
 	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP;
@@ -1387,7 +1330,6 @@ static void panthor_vm_prepare_sync_only_op_ctx(struct panthor_vm_op_ctx *op_ctx
 						struct panthor_vm *vm)
 {
 	memset(op_ctx, 0, sizeof(*op_ctx));
-	INIT_LIST_HEAD(&op_ctx->returned_vmas);
 	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_SYNC_ONLY;
 }
 
@@ -2033,26 +1975,13 @@ static void panthor_vma_link(struct panthor_vm *vm,
 
 	mutex_lock(&bo->base.base.gpuva.lock);
 	drm_gpuva_link(&vma->base, vm_bo);
-	drm_WARN_ON(&vm->ptdev->base, drm_gpuvm_bo_put(vm_bo));
 	mutex_unlock(&bo->base.base.gpuva.lock);
 }
 
-static void panthor_vma_unlink(struct panthor_vm *vm,
-			       struct panthor_vma *vma)
+static void panthor_vma_unlink(struct panthor_vma *vma)
 {
-	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
-	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_get(vma->base.vm_bo);
-
-	mutex_lock(&bo->base.base.gpuva.lock);
-	drm_gpuva_unlink(&vma->base);
-	mutex_unlock(&bo->base.base.gpuva.lock);
-
-	/* drm_gpuva_unlink() release the vm_bo, but we manually retained it
-	 * when entering this function, so we can implement deferred VMA
-	 * destruction. Re-assign it here.
-	 */
-	vma->base.vm_bo = vm_bo;
-	list_add_tail(&vma->node, &vm->op_ctx->returned_vmas);
+	drm_gpuva_unlink_defer(&vma->base);
+	kfree(vma);
 }
 
 static void panthor_vma_init(struct panthor_vma *vma, u32 flags)
@@ -2084,12 +2013,12 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 	if (ret)
 		return ret;
 
-	/* Ref owned by the mapping now, clear the obj field so we don't release the
-	 * pinning/obj ref behind GPUVA's back.
-	 */
 	drm_gpuva_map(&vm->base, &vma->base, &op->map);
 	panthor_vma_link(vm, vma, op_ctx->map.vm_bo);
+
+	drm_gpuvm_bo_put_deferred(op_ctx->map.vm_bo);
 	op_ctx->map.vm_bo = NULL;
+
 	return 0;
 }
 
@@ -2128,16 +2057,14 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 		 * owned by the old mapping which will be released when this
 		 * mapping is destroyed, we need to grab a ref here.
 		 */
-		panthor_vma_link(vm, prev_vma,
-				 drm_gpuvm_bo_get(op->remap.unmap->va->vm_bo));
+		panthor_vma_link(vm, prev_vma, op->remap.unmap->va->vm_bo);
 	}
 
 	if (next_vma) {
-		panthor_vma_link(vm, next_vma,
-				 drm_gpuvm_bo_get(op->remap.unmap->va->vm_bo));
+		panthor_vma_link(vm, next_vma, op->remap.unmap->va->vm_bo);
 	}
 
-	panthor_vma_unlink(vm, unmap_vma);
+	panthor_vma_unlink(unmap_vma);
 	return 0;
 }
 
@@ -2154,12 +2081,13 @@ static int panthor_gpuva_sm_step_unmap(struct drm_gpuva_op *op,
 		return ret;
 
 	drm_gpuva_unmap(&op->unmap);
-	panthor_vma_unlink(vm, unmap_vma);
+	panthor_vma_unlink(unmap_vma);
 	return 0;
 }
 
 static const struct drm_gpuvm_ops panthor_gpuvm_ops = {
 	.vm_free = panthor_vm_free,
+	.vm_bo_free = panthor_vm_bo_free,
 	.sm_step_map = panthor_gpuva_sm_step_map,
 	.sm_step_remap = panthor_gpuva_sm_step_remap,
 	.sm_step_unmap = panthor_gpuva_sm_step_unmap,

-- 
2.51.0.618.g983fd99d29-goog

