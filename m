Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA6B4FD54
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A160810E73C;
	Tue,  9 Sep 2025 13:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="N8REvh5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F2510E23F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:36:39 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b04145e8615so417928866b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757424998; x=1758029798;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=MmbSiSnFwTIoU/JLu47n8SFv5vhZb2klpFQfcVoTQdo=;
 b=N8REvh5exrh3BU9mx6EgKKzNFMkOXnDZ6YKH6gopLJ8Rdvj24I3JKrnhnlRH5VaU+1
 Dq6q4XyYUjgeYUzo57xpZuC4ypS4sUbvkbdrZ52l6g9yntuVLwZzNZcqVINv5X4gQWae
 BSUypLsKt9z9Y5l08xgoAJKb9UvFVYhUEHDdptu3iHaAZQchVZSbdUaNjxh5z+sJXRtv
 YWZjhjNRH47JF6gzbI43b1aIV+R6eoCx4RbbTpp+ohI0jFpitpUK8w/hRyc+P14BkGJB
 WNTox5FPRh+0G1qGt/qtFla1H0sQO2WjicDd9ACRuiG6XulacM+1Bw0t2f+3EzU0ja85
 rTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757424998; x=1758029798;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MmbSiSnFwTIoU/JLu47n8SFv5vhZb2klpFQfcVoTQdo=;
 b=AVx0PdUyFDhKSVR9nsR8q89VDPCiI+ZL1H29ScWLuFO9Bid75PZD68SOAKtjW43aal
 4FYIzRyXAxQLOeFikHS3O1Y5chgi2kJppXRMMLPzSqIuKUOYcJXsEL5PgADLh3BWo+XX
 wS51JFGPDPZWX4RwJoS0qmfyADgzvE1JOd800Frolu7WVxBmF4O1zvIsGMqhObDbJZI9
 WOr31b4n/boR1TBzzQhLFkKSB4Ci1qu1YvzhxP7mG4sgnBYKBcLWnpSd7rZyh4sC+eGk
 Kg5UFZ1NeqrlaLnYK5wC1KqekPdYePqPO60l2C05/9jrqh0zmPkzZ695sxCKE5gEjKU/
 jXvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWul3PQrQMFVzIQT83qTZJXHvPg0lq0r2WeI8amQ0zBQU38MdviyRgnMiHvDVNhZTsdoZBQmW1ViVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX6M0hLeeuG6E7RqYQi+rtS7+yAMMoL1qKzHDAlyMZdjEenQ6D
 fVQioDzCXRYEgaRIzdVAJxJJZH9iPW52+mG3oLaLJEK/sOKFtOa7h05hFoeG1L1DF5DbzFr48QT
 HqQsObuZKmQEa6Wn3sw==
X-Google-Smtp-Source: AGHT+IFAFV8+5PF+ACjxRZtS035sPxF/aJB68T82HGLHJTP0jManXfiLAOmflSk4J9V4JiFGh4CY21p9NhaMWQs=
X-Received: from ejcwb15.prod.google.com ([2002:a17:907:d50f:b0:b04:b988:644c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7e97:b0:b04:590a:a5b5 with SMTP id
 a640c23a62f3a-b04b1480b35mr1159064666b.24.1757424998120; 
 Tue, 09 Sep 2025 06:36:38 -0700 (PDT)
Date: Tue, 09 Sep 2025 13:36:23 +0000
In-Reply-To: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
Mime-Version: 1.0
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9052; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=/Lhwto5s1ginBRFK1K461SpzI0kY9fIX6onz0SIu1pA=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBowC1iqBKdGP913iBnrFCBvAIMxLF+7dvDJhtb2
 Vee9/V2NAaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaMAtYgAKCRAEWL7uWMY5
 RkphD/wP6DfltzHI35xh9b46K2Va3My+E/65DQgQrsGjn8TnLx0MNvKWfTFhCKUJ7Yf4s3xNI0o
 hgqT3PsMCIjk1bvG3r1c2MH3ghPLrHKTbrVBDkcwj9eV6jRKHv8c+jr4JrjyISA+mezUEnzuVqX
 FUXuV6d+SplJlxzYudj2Q/Yfv36GLy4IAw+AVCv5hNGiSPbxaLVZ2JEJqlNcEoQJBoxmX9mCK8Z
 /HFEKGc8/ZlANMl9QAZQ6pYi5Z9hAxaU1bzVJRJGSYVRsa+YfaeSKvUdwRZNFwMmLsjGoE0c2mt
 tXqsqlBD/qdD6DXHqBfVNWcliItpZ17a4Podaojbn6djlv+QgbQ9DduO+JJPpbnU1UNHa2RxRpI
 vHRxQQcs4v0T1EGB7jmR49iqmmi9TjmbKRNJee2YZhpPcIY9wgj8fO09urMOKUACbizl3kVZAsO
 l9BBQ9ARwKox0AljkS9YJ2kwMFbydO8ZwyalgvYEoIO/UhOIxBel9uaolFWzuzo6F+f22ylS0TT
 8QnI2rh92RwoqgqC+t8nJBM848s95+SW/wfhV2iaOJYm34TJKrfejU8e+RsnGOHXCQnX/B/G5xc
 HpfFNrYDrxIMpzlQ9c/0s6jj4Aoks5WfgPVGDJsz/MOQ28iF0ucIYXRdKEfagqIRcvX7BbKzRy/
 6PXqXitUFAi/Elg==
X-Mailer: b4 0.14.2
Message-ID: <20250909-vmbo-defer-v2-2-9835d7349089@google.com>
Subject: [PATCH v2 2/2] panthor: use drm_gpuva_unlink_defer()
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 113 ++++++----------------------------
 1 file changed, 19 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e3789d17c5a87fc8de3bc86764b804bc..fd9ed88a4259e5fb88e5acffcf6d8a658cc7115d 100644
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
+		 * once we call drm_gpuvm_bo_create(), GPUVM will take care of
+		 * dropping the pin for us.
 		 */
 		ret = drm_gem_shmem_pin(&bo->base);
 		if (ret)
@@ -1263,9 +1217,6 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 
 	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
 	if (!preallocated_vm_bo) {
-		if (!drm_gem_is_imported(&bo->base.base))
-			drm_gem_shmem_unpin(&bo->base);
-
 		ret = -ENOMEM;
 		goto err_cleanup;
 	}
@@ -1282,16 +1233,6 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
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
@@ -1339,7 +1280,6 @@ static int panthor_vm_prepare_unmap_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	int ret;
 
 	memset(op_ctx, 0, sizeof(*op_ctx));
-	INIT_LIST_HEAD(&op_ctx->returned_vmas);
 	op_ctx->va.range = size;
 	op_ctx->va.addr = va;
 	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP;
@@ -1387,7 +1327,6 @@ static void panthor_vm_prepare_sync_only_op_ctx(struct panthor_vm_op_ctx *op_ctx
 						struct panthor_vm *vm)
 {
 	memset(op_ctx, 0, sizeof(*op_ctx));
-	INIT_LIST_HEAD(&op_ctx->returned_vmas);
 	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_SYNC_ONLY;
 }
 
@@ -2033,26 +1972,13 @@ static void panthor_vma_link(struct panthor_vm *vm,
 
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
@@ -2084,12 +2010,12 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
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
 
@@ -2128,16 +2054,14 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
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
 
@@ -2154,12 +2078,13 @@ static int panthor_gpuva_sm_step_unmap(struct drm_gpuva_op *op,
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
2.51.0.384.g4c02a37b29-goog

