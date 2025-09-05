Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2EB4575C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 14:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6BD10EB95;
	Fri,  5 Sep 2025 12:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1pvENmBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA45010EB94
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 12:11:39 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3e5190bcba1so1178f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757074298; x=1757679098;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=rlxAeSfJx82pksd3I0ixRoBKWGI7viD6A795f500XFc=;
 b=1pvENmBohtA3p0LlnFRLjDxqUApBiyFu6VzXJ9OlbEAU1OVbY0H6qH1bupKjJVpdW+
 tJZwIRvetTmj110h14dwQNSa8LojYcd2+X1DbQB6b6WmmZaBrgaJ9lVAPVZFH2lOp9if
 ipRzys+lSZtPBDqBv7WUhRyRU981dW1exUh4/PN1U27nQ8hkDOK6CEo5KdZR+99rpqqT
 G001vLneHgMFXP2dgwhxmNjQkzR+W86fMTnNxFSeISffnksRvgs6FK9Kj+O3O01FyGHD
 B3G3g66v+UxFXb26AJc4T//YsRD9k0s7JlOonajYGKxqdQYHmmh/UpyjQDZveetf6MHj
 F5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757074298; x=1757679098;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rlxAeSfJx82pksd3I0ixRoBKWGI7viD6A795f500XFc=;
 b=YCz5aRYcakuihDaM3NcHms60M+7ulE7T9M/oNTuDt2tJILalkjrIZdWPKmmHTttJUP
 syf+yl0n/QUbKEwAtwmk6PVyJrmSzDLHLihYMrUJGEmjTHHG80cqAj6U3Usz5odLdSSR
 W2Ck4O9ywpYR7FDMB4Bf4+pgCXYQoinxHlRxLlvNQyxkXnyqyCEzbFj+vKVni1H9RH6h
 uo1CYrt/icZPKJHqB0shBhiYJ5hVq2TrKUG+sue1Tci6kA+jTv1d/c0Qrdaa5yVDRlir
 p+lscPzc3S1wlLYq0e4puVdKhrGoMUICygQqz3Xz5KQ66UUkfXJ0yIs+gZXbHu18d+C/
 OZUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf9W9a+MtLqa3opvQ/q4ybh8QnEL5KCCDCctaZSycZjr/+Pk0aEOEBR2pKw1xG6NhSZrASWFtCcWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzHz+/ftTYHpDeBppwegZx155NUZkbQdJ80jRNBPYdwwjaXzUx
 KzaxKUB05OKg6/9nCuOk8tmHTTu7sdseZQvxtb64pZLz/kOl6B+6+eh8Uv8OaJKLH5Om/2igATd
 zBndwAfHvrA0ga/+lIQ==
X-Google-Smtp-Source: AGHT+IG8jYGvzO4xJ5XE6YjDlUyoq7XkUoX06psrVfvh6sWFTCcB4r+O6TwY74/lyIP1l3hTEjNDm+Em6qNSRZg=
X-Received: from wrml12.prod.google.com ([2002:adf:e58c:0:b0:3d5:28fd:8822])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2008:b0:3e4:e4e:343c with SMTP id
 ffacd0b85a97d-3e40e4e3a79mr1309181f8f.31.1757074298331; 
 Fri, 05 Sep 2025 05:11:38 -0700 (PDT)
Date: Fri, 05 Sep 2025 12:11:29 +0000
In-Reply-To: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
Mime-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9037; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=s2GWvmQHUwyjohU1GP99f3t5sldgnhLD+nr53UBS7jk=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoutN24be3/jGNmEoz+LMXQuVQHZUNhQi1vI/sM
 vYnnqGZy56JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaLrTdgAKCRAEWL7uWMY5
 RnFLD/4rxL4E5zD6NMkjopiwv+rIBm+fmYOSzbi9ShMG5wEXGT4QaQJ+TE+y3VvWuCZOh3JDa+C
 /QgvOypoW/eu9nRIWFJBqv4IOHI95WV5lkqr7IA0UGuXUY/Zg/Gcy0wWj4xWigAZa6jw/mpNToU
 +W8LpBpz8qYuUzY/bpjDLndzUDrym7j18IZ8b/zayd8x2Il+/Zjdal4o0CH0UXH/avk+5Fsiiz+
 JtLFl8SSJEzVtweaL7x06H7+/yIN5ReqckjUv4ivszj6THkoi/iyCyBOtHu/sFkTY7+gVAS24Ak
 Jv2cOSuEdMOiJ88XgijiMFOfnw3WWW+ZiiT3Akk+lMiohEPanm7/pcJezQhDIljbkljNTewf7Ny
 vaQhnVKdAkqr4wh0eXJkAdj9E7JAK0UpyuZ7JpcjGSygEsPS5wVM7gGnWfOWd54RIQqIB5Tybua
 ZTshg2aOXcrpt8Fac24t45e00wSuhFCK3W6WMfu88bXG0IlJF2mhKNiUrxQ+IwEJekwKQHvhqLo
 uRmIvBykWbMPCn6fsX2w2CdtN5lYHA4xy1uzcv66t3kBpbDeJQ57/U3EGrZOQGOUj+Rl8EOTjYH
 tsSLFgPM+0nsr+KOl8x8hfwbfYVKw71Ou6ywZvfBIfFwFD6AyMMvCqv7To3iHeu82gUkEZ3NYS+
 ywfT3BM2QDRI5Yg==
X-Mailer: b4 0.14.2
Message-ID: <20250905-vmbo-defer-v1-2-7ae1a382b674@google.com>
Subject: [PATCH 2/2] panthor: use drm_gpuva_unlink_defer()
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
 drivers/gpu/drm/panthor/panthor_mmu.c | 112 ++++++----------------------------
 1 file changed, 18 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e3789d17c5a87fc8de3bc86764b804bc..4922da0b106aec2bdf657ce4c596acb9c63797ce 100644
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
 
@@ -2033,26 +1972,12 @@ static void panthor_vma_link(struct panthor_vm *vm,
 
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
 }
 
 static void panthor_vma_init(struct panthor_vma *vma, u32 flags)
@@ -2084,12 +2009,12 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
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
 
@@ -2128,16 +2053,14 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
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
 
@@ -2154,12 +2077,13 @@ static int panthor_gpuva_sm_step_unmap(struct drm_gpuva_op *op,
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
2.51.0.355.g5224444f11-goog

