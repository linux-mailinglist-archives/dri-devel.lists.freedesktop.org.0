Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A086CA9FB01
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12E10EA3E;
	Mon, 28 Apr 2025 20:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XYPNWm05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299D710EA39;
 Mon, 28 Apr 2025 20:57:09 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-227a8cdd241so72969355ad.3; 
 Mon, 28 Apr 2025 13:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873828; x=1746478628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SqmyuVNo5HYOb0Wr0JWF4hj8S+fL2iJ4KyYxwJoZYFs=;
 b=XYPNWm05PfurSUDHl+tiRdAdZHWhzPkkdDsqbhCUmqb7C97Z/MWmSsgEQ6UKLy7bke
 4zFs3jMDX/1IsN+LENtENMucBKh/cUbfVERWDiLyT+wOk4Q4rts1FGTy9rO58d4qtHFp
 98ESgPYGD6k5W5IcOEcsZPNxJDvi6jpR4h0mIqf0VnQLygS10+DALSjefcPLAKjVm7H/
 t1Q7Uc/usoQQKSYmxhjM49rx0kq0SkNGiIYq7dS281YDxFfeduY2mlRjtVSEQuBmAXU/
 WF2d9YtgTGyupFuSOsoliO4T3rFI00PpveBMvagGKm9D2LdhQYxSFVdTNGmsj85D/7ON
 AOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873828; x=1746478628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SqmyuVNo5HYOb0Wr0JWF4hj8S+fL2iJ4KyYxwJoZYFs=;
 b=kR/OOaQMEhu/2cueXKUZW9tm036d7dC6UZ8ANSKGa7DDs0yPk8VtVxRFcH/FL9jIJ0
 jiiQQrA+PDR2ZoOQWWtOCdBk/pxWZbWCKJOcMx8p+trvX2l1cfNDtaRwesqPtEyhOZQs
 pEiP27DX2cQD5z3vj0XqDQHNejlRX9rI7yfcuM0GHyo8rYKtTc5eCQYhip5YyumpLivV
 1Z666qsGJfhE+46qwUkOgnded31GalLddhaCf/U8Dc1JnqJVoKXgTip0Uq86TzWDUfaf
 r3GxVxlI44kk5aGgMkpfZoXiBodMqIxWhJSmPDAWFvy+Gwwdk2xYir/UWQapMKuLehFV
 ZJ2g==
X-Gm-Message-State: AOJu0YwLR2GGEMbT32XnksZxxEYK8QwCr/4f24Dh0i7ZIG0YgSdct3sz
 Yu61B458j6ligq18I/7Vdmwuod9z9ClwdqHjy36RmCLkgJ+oSCVJv+rqkw==
X-Gm-Gg: ASbGncsY2lXo71DrgPwiqyXIxVdJPfQxX3Zy6IQrmsk45ltLOj15ILm7XC44cJH210W
 b8Ma69OOyDuk2gDqMGGgf5e1GpFLgojIpySebJLOmZ6HT63datJmZwEUBKIZCpStO3hhN+kfiny
 hM9srrhHCBJZjb5FPVXgoigkMJTME+2O7oygs9QgjtkUPV19Z25sPidBPhPIxSmYq7IH/yXggWo
 6RbbBF04edG0bBg37xqo3oe/2hbrXzOuzbwbOOorfaT6eBTNSk3XfnJ6pb71gUAdwZtvagde4UI
 UxTSeeismAlZrsRFG0bt/gTe2m0HjSYASDjSMI8JiVyO7EJQodQDkjfltCpU+oO2L3m9PD8LEka
 +ZdZGwh9JzGlDrVQmQ3UUGRY7EQ==
X-Google-Smtp-Source: AGHT+IEd/mqLf483WsbsRepNvxNn6sOrp+gTBTFy9uyBDKVk028gIEtIjgQTDYtIM8ef1YZIiKLPXQ==
X-Received: by 2002:a17:902:e844:b0:223:f408:c3dc with SMTP id
 d9443c01a7336-22de6f7f703mr6378365ad.9.1745873828067; 
 Mon, 28 Apr 2025 13:57:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f76f45bcsm7704980a12.13.2025.04.28.13.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 11/33] drm/msm: drm_gpuvm conversion
Date: Mon, 28 Apr 2025 13:54:18 -0700
Message-ID: <20250428205619.227835-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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

Now that we've realigned deletion and allocation, switch over to using
drm_gpuvm/drm_gpuva.  This allows us to support multiple VMAs per BO per
VM, to allow mapping different parts of a single BO at different virtual
addresses, which is a key requirement for sparse/VM_BIND.

This prepares us for using drm_gpuvm to translate a batch of MAP/
MAP_NULL/UNMAP operations from userspace into a sequence of map/remap/
unmap steps for updating the page tables.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/Kconfig              |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    |   3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  |   7 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |   5 +-
 drivers/gpu/drm/msm/msm_drv.c            |   1 +
 drivers/gpu/drm/msm/msm_gem.c            | 142 ++++++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h            |  89 +++++++++++---
 drivers/gpu/drm/msm/msm_gem_submit.c     |   2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c        | 139 +++++++++++++++-------
 drivers/gpu/drm/msm/msm_kms.c            |   4 +-
 12 files changed, 270 insertions(+), 134 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 974bc7c0ea76..4af7e896c1d4 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -21,6 +21,7 @@ config DRM_MSM
 	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
+	select DRM_GPUVM
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_BRIDGE
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 095bae92e3e8..889480aa13ba 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -472,8 +472,7 @@ a2xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
 	struct msm_gem_vm *vm;
 
-	vm = msm_gem_vm_create(mmu, "gpu", SZ_16M,
-		0xfff * SZ_64K);
+	vm = msm_gem_vm_create(gpu->dev, mmu, "gpu", SZ_16M, 0xfff * SZ_64K, true);
 
 	if (IS_ERR(vm) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4c459ae25cba..259a589a827d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1311,7 +1311,7 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 	return 0;
 }
 
-static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
+static int a6xx_gmu_memory_probe(struct drm_device *drm, struct a6xx_gmu *gmu)
 {
 	struct msm_mmu *mmu;
 
@@ -1321,7 +1321,7 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 	if (IS_ERR(mmu))
 		return PTR_ERR(mmu);
 
-	gmu->vm = msm_gem_vm_create(mmu, "gmu", 0x0, 0x80000000);
+	gmu->vm = msm_gem_vm_create(drm, mmu, "gmu", 0x0, 0x80000000, true);
 	if (IS_ERR(gmu->vm))
 		return PTR_ERR(gmu->vm);
 
@@ -1940,7 +1940,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
-	ret = a6xx_gmu_memory_probe(gmu);
+	ret = a6xx_gmu_memory_probe(adreno_gpu->base.dev, gmu);
 	if (ret)
 		goto err_put_device;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c119493c13aa..0a50ec5ce506 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2271,9 +2271,8 @@ a6xx_create_private_vm(struct msm_gpu *gpu)
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
-	return msm_gem_vm_create(mmu,
-		"gpu", ADRENO_VM_START,
-		adreno_private_vm_size(gpu));
+	return msm_gem_vm_create(gpu->dev, mmu, "gpu", ADRENO_VM_START,
+				 adreno_private_vm_size(gpu), true);
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index a2e39283360f..e1ce0c5bca17 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -226,7 +226,8 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	start = max_t(u64, SZ_16M, geometry->aperture_start);
 	size = geometry->aperture_end - start + 1;
 
-	vm = msm_gem_vm_create(mmu, "gpu", start & GENMASK_ULL(48, 0), size);
+	vm = msm_gem_vm_create(gpu->dev, mmu, "gpu", start & GENMASK_ULL(48, 0),
+			       size, true);
 
 	if (IS_ERR(vm) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
@@ -418,12 +419,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_VA_START:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->va_start;
+		*value = ctx->vm->base.mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->va_size;
+		*value = ctx->vm->base.mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 94fbc20b2fbd..d5b5628bee24 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -451,8 +451,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 				"contig buffers for scanout\n");
 		vm = NULL;
 	} else {
-		vm  = msm_gem_vm_create(mmu,
-			"mdp4", 0x1000, 0x100000000 - 0x1000);
+		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
+					0x1000, 0x100000000 - 0x1000,
+					true);
 
 		if (IS_ERR(vm)) {
 			if (!IS_ERR(mmu))
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 978f1d355b42..6ef29bc48bb0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -776,6 +776,7 @@ static const struct file_operations fops = {
 
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
+				DRIVER_GEM_GPUVA |
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 50b866dcf439..523e6dd3ad06 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -47,9 +47,32 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
+	struct msm_context *ctx = file->driver_priv;
+
 	update_ctx_mem(file, -obj->size);
+
+	/*
+	 * If VM isn't created yet, nothing to cleanup.  And in fact calling
+	 * put_iova_spaces() with vm=NULL would be bad, in that it will tear-
+	 * down the mappings of shared buffers in other contexts.
+	 */
+	if (!ctx->vm)
+		return;
+
+	/*
+	 * TODO we might need to kick this to a queue to avoid blocking
+	 * in CLOSE ioctl
+	 */
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
+			      msecs_to_jiffies(1000));
+
+	msm_gem_lock(obj);
+	put_iova_spaces(obj, &ctx->vm->base, true);
+	msm_gem_unlock(obj);
 }
 
 /*
@@ -171,6 +194,13 @@ static void put_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	/*
+	 * Skip gpuvm in the object free path to avoid a WARN_ON() splat.
+	 * See explaination in msm_gem_assert_locked()
+	 */
+	if (kref_read(&obj->refcount))
+		drm_gpuvm_bo_gem_evict(obj, true);
+
 	if (msm_obj->pages) {
 		if (msm_obj->sgt) {
 			/* For non-cached buffers, ensure the new
@@ -338,16 +368,25 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 }
 
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
+				      struct msm_gem_vm *vm)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct drm_gpuvm_bo *vm_bo;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
-		if (vma->vm == vm)
-			return vma;
+	drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+		struct drm_gpuva *vma;
+
+		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+			if (vma->vm == &vm->base) {
+				/* lookup_vma() should only be used in paths
+				 * with at most one vma per vm
+				 */
+				GEM_WARN_ON(!list_is_singular(&vm_bo->list.gpuva));
+
+				return to_msm_vma(vma);
+			}
+		}
 	}
 
 	return NULL;
@@ -360,33 +399,29 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma, *tmp;
+	struct drm_gpuvm_bo *vm_bo, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		if (vma->vm) {
-			msm_gem_vma_purge(vma);
-			if (close)
-				msm_gem_vma_close(vma);
-		}
-	}
-}
+	drm_gem_for_each_gpuvm_bo_safe (vm_bo, tmp, obj) {
+		struct drm_gpuva *vma, *vmatmp;
 
-/* Called with msm_obj locked */
-static void
-put_iova_vmas(struct drm_gem_object *obj)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma, *tmp;
+		if (vm && vm_bo->vm != vm)
+			continue;
 
-	msm_gem_assert_locked(obj);
+		drm_gpuvm_bo_get(vm_bo);
 
-	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		msm_gem_vma_close(vma);
+		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
+			struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+
+			msm_gem_vma_purge(msm_vma);
+			if (close)
+				msm_gem_vma_close(msm_vma);
+		}
+
+		drm_gpuvm_bo_put(vm_bo);
 	}
 }
 
@@ -394,7 +429,6 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -403,12 +437,9 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 
 	if (!vma) {
 		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
-		if (IS_ERR(vma))
-			return vma;
-		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
-		GEM_WARN_ON(vma->iova < range_start);
-		GEM_WARN_ON((vma->iova + obj->size) > range_end);
+		GEM_WARN_ON(vma->base.va.addr < range_start);
+		GEM_WARN_ON((vma->base.va.addr + obj->size) > range_end);
 	}
 
 	return vma;
@@ -492,7 +523,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	ret = msm_gem_pin_vma_locked(obj, vma);
 	if (!ret) {
-		*iova = vma->iova;
+		*iova = vma->base.va.addr;
 		pin_obj_locked(obj);
 	}
 
@@ -538,7 +569,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
-		*iova = vma->iova;
+		*iova = vma->base.va.addr;
 	}
 	msm_gem_unlock(obj);
 
@@ -579,7 +610,7 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 		vma = get_vma_locked(obj, vm, iova, iova + obj->size);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);
-		} else if (GEM_WARN_ON(vma->iova != iova)) {
+		} else if (GEM_WARN_ON(vma->base.va.addr != iova)) {
 			clear_iova(obj, vm);
 			ret = -EBUSY;
 		}
@@ -763,7 +794,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, false);
+	put_iova_spaces(obj, NULL, false);
 
 	msm_gem_vunmap(obj);
 
@@ -771,8 +802,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 
 	put_pages(obj);
 
-	put_iova_vmas(obj);
-
 	mutex_lock(&priv->lru.lock);
 	/* A one-way transition: */
 	msm_obj->madv = __MSM_MADV_PURGED;
@@ -803,7 +832,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, false);
+	put_iova_spaces(obj, NULL, false);
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -869,7 +898,6 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
@@ -912,14 +940,17 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 
 	seq_printf(m, " %08zu %9s %-32s\n", obj->size, madv, msm_obj->name);
 
-	if (!list_empty(&msm_obj->vmas)) {
+	if (!list_empty(&obj->gpuva.list)) {
+		struct drm_gpuvm_bo *vm_bo;
 
 		seq_puts(m, "      vmas:");
 
-		list_for_each_entry(vma, &msm_obj->vmas, list) {
-			const char *name, *comm;
-			if (vma->vm) {
-				struct msm_gem_vm *vm = vma->vm;
+		drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+			struct drm_gpuva *vma;
+
+			drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+				const char *name, *comm;
+				struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 				struct task_struct *task =
 					get_pid_task(vm->pid, PIDTYPE_PID);
 				if (task) {
@@ -928,15 +959,14 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 				} else {
 					comm = NULL;
 				}
-				name = vm->name;
-			} else {
-				name = comm = NULL;
+				name = vm->base.name;
+
+				seq_printf(m, " [%s%s%s: vm=%p, %08llx,%smapped]",
+					   name, comm ? ":" : "", comm ? comm : "",
+					   vma->vm, vma->va.addr,
+					   to_msm_vma(vma)->mapped ? "" : "un");
+				kfree(comm);
 			}
-			seq_printf(m, " [%s%s%s: vm=%p, %08llx,%s]",
-				name, comm ? ":" : "", comm ? comm : "",
-				vma->vm, vma->iova,
-				vma->mapped ? "mapped" : "unmapped");
-			kfree(comm);
 		}
 
 		seq_puts(m, "\n");
@@ -982,7 +1012,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	list_del(&msm_obj->node);
 	mutex_unlock(&priv->obj_lock);
 
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, NULL, true);
 
 	if (obj->import_attach) {
 		GEM_WARN_ON(msm_obj->vaddr);
@@ -992,13 +1022,10 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		 */
 		kvfree(msm_obj->pages);
 
-		put_iova_vmas(obj);
-
 		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
 		msm_gem_vunmap(obj);
 		put_pages(obj);
-		put_iova_vmas(obj);
 	}
 
 	drm_gem_object_release(obj);
@@ -1104,7 +1131,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
 	INIT_LIST_HEAD(&msm_obj->node);
-	INIT_LIST_HEAD(&msm_obj->vmas);
 
 	*obj = &msm_obj->base;
 	(*obj)->funcs = &msm_gem_object_funcs;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9bd78642671c..f7f7e7910754 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -10,6 +10,7 @@
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
 #include "drm/drm_exec.h"
+#include "drm/drm_gpuvm.h"
 #include "drm/gpu_scheduler.h"
 #include "msm_drv.h"
 
@@ -22,30 +23,67 @@
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
 #define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
+/**
+ * struct msm_gem_vm - VM object
+ *
+ * A VM object representing a GPU (or display or GMU or ...) virtual address
+ * space.
+ *
+ * In the case of GPU, if per-process address spaces are supported, the address
+ * space is split into two VMs, which map to TTBR0 and TTBR1 in the SMMU.  TTBR0
+ * is used for userspace objects, and is unique per msm_context/drm_file, while
+ * TTBR1 is the same for all processes.  (The kernel controlled ringbuffer and
+ * a few other kernel controlled buffers live in TTBR1.)
+ *
+ * The GPU TTBR0 vm can be managed by userspace or by the kernel, depending on
+ * whether userspace supports VM_BIND.  All other vm's are managed by the kernel.
+ * (Managed by kernel means the kernel is responsible for VA allocation.)
+ *
+ * Note that because VM_BIND allows a given BO to be mapped multiple times in
+ * a VM, and therefore have multiple VMA's in a VM, there is an extra object
+ * provided by drm_gpuvm infrastructure.. the drm_gpuvm_bo, which is not
+ * embedded in any larger driver structure.  The GEM object holds a list of
+ * drm_gpuvm_bo, which in turn holds a list of msm_gem_vma.  A linked vma
+ * holds a reference to the vm_bo, and drops it when the vma is unlinked.
+ * So we just need to call drm_gpuvm_bo_obtain() to return a ref to an
+ * existing vm_bo, or create a new one.  Once the vma is linked, the ref
+ * to the vm_bo can be dropped (since the vma is holding one).
+ */
 struct msm_gem_vm {
-	const char *name;
-	/* NOTE: mm managed at the page level, size is in # of pages
-	 * and position mm_node->start is in # of pages:
+	/** @base: Inherit from drm_gpuvm. */
+	struct drm_gpuvm base;
+
+	/**
+	 * @mm: Memory management for kernel managed VA allocations
+	 *
+	 * Only used for kernel managed VMs, unused for user managed VMs.
+	 *
+	 * Protected by @mm_lock.
 	 */
 	struct drm_mm mm;
-	spinlock_t lock; /* Protects drm_mm node allocation/removal */
+
+	/** @mm_lock: protects @mm node allocation/removal */
+	struct spinlock mm_lock;
+
+	/** @vm_lock: protects gpuvm insert/remove/traverse */
+	struct mutex vm_lock;
+
+	/** @mmu: The mmu object which manages the pgtables */
 	struct msm_mmu *mmu;
-	struct kref kref;
 
-	/* For address spaces associated with a specific process, this
+	/**
+	 * @pid: For address spaces associated with a specific process, this
 	 * will be non-NULL:
 	 */
 	struct pid *pid;
 
-	/* @faults: the number of GPU hangs associated with this address space */
+	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
-	/** @va_start: lowest possible address to allocate */
-	uint64_t va_start;
-
-	/** @va_size: the size of the address space (in bytes) */
-	uint64_t va_size;
+	/** @managed: is this a kernel managed VM? */
+	bool managed;
 };
+#define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
 struct msm_gem_vm *
 msm_gem_vm_get(struct msm_gem_vm *vm);
@@ -53,18 +91,33 @@ msm_gem_vm_get(struct msm_gem_vm *vm);
 void msm_gem_vm_put(struct msm_gem_vm *vm);
 
 struct msm_gem_vm *
-msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
-		u64 va_start, u64 size);
+msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
+		  u64 va_start, u64 va_size, bool managed);
 
 struct msm_fence_context;
 
+#define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
+
+/**
+ * struct msm_gem_vma - a VMA mapping
+ *
+ * Represents a combination of a GEM object plus a VM.
+ */
 struct msm_gem_vma {
+	/** @base: inherit from drm_gpuva */
+	struct drm_gpuva base;
+
+	/**
+	 * @node: mm node for VA allocation
+	 *
+	 * Only used by kernel managed VMs
+	 */
 	struct drm_mm_node node;
-	uint64_t iova;
-	struct msm_gem_vm *vm;
-	struct list_head list;    /* node in msm_gem_object::vmas */
+
+	/** @mapped: Is this VMA mapped? */
 	bool mapped;
 };
+#define to_msm_vma(x) container_of(x, struct msm_gem_vma, base)
 
 struct msm_gem_vma *
 msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
@@ -100,8 +153,6 @@ struct msm_gem_object {
 	struct sg_table *sgt;
 	void *vaddr;
 
-	struct list_head vmas;    /* list of msm_gem_vma */
-
 	char name[32]; /* Identifier to print for the debugfs files */
 
 	/* userspace metadata backchannel */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a186b7dfea35..e8a670566147 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -312,7 +312,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		submit->bos[i].iova = vma->iova;
+		submit->bos[i].iova = vma->base.va.addr;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index ca29e81d79d2..a8c98490edaa 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -5,14 +5,13 @@
  */
 
 #include "msm_drv.h"
-#include "msm_fence.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
 static void
-msm_gem_vm_destroy(struct kref *kref)
+msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
-	struct msm_gem_vm *vm = container_of(kref, struct msm_gem_vm, kref);
+	struct msm_gem_vm *vm = container_of(gpuvm, struct msm_gem_vm, base);
 
 	drm_mm_takedown(&vm->mm);
 	if (vm->mmu)
@@ -25,14 +24,14 @@ msm_gem_vm_destroy(struct kref *kref)
 void msm_gem_vm_put(struct msm_gem_vm *vm)
 {
 	if (vm)
-		kref_put(&vm->kref, msm_gem_vm_destroy);
+		drm_gpuvm_put(&vm->base);
 }
 
 struct msm_gem_vm *
 msm_gem_vm_get(struct msm_gem_vm *vm)
 {
 	if (!IS_ERR_OR_NULL(vm))
-		kref_get(&vm->kref);
+		drm_gpuvm_get(&vm->base);
 
 	return vm;
 }
@@ -40,14 +39,14 @@ msm_gem_vm_get(struct msm_gem_vm *vm)
 /* Actually unmap memory for the vma */
 void msm_gem_vma_purge(struct msm_gem_vma *vma)
 {
-	struct msm_gem_vm *vm = vma->vm;
-	unsigned size = vma->node.size;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
+	unsigned size = vma->base.va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->iova, size);
+	vm->mmu->funcs->unmap(vm->mmu, vma->base.va.addr, size);
 
 	vma->mapped = false;
 }
@@ -57,10 +56,10 @@ int
 msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 		struct sg_table *sgt, int size)
 {
-	struct msm_gem_vm *vm = vma->vm;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
 	int ret;
 
-	if (GEM_WARN_ON(!vma->iova))
+	if (GEM_WARN_ON(!vma->base.va.addr))
 		return -EINVAL;
 
 	if (vma->mapped)
@@ -68,9 +67,6 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 
 	vma->mapped = true;
 
-	if (!vm)
-		return 0;
-
 	/*
 	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
@@ -80,7 +76,7 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->iova, sgt, size, prot);
+	ret = vm->mmu->funcs->map(vm->mmu, vma->base.va.addr, sgt, size, prot);
 
 	if (ret) {
 		vma->mapped = false;
@@ -92,19 +88,20 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 /* Close an iova.  Warn if it is still in use */
 void msm_gem_vma_close(struct msm_gem_vma *vma)
 {
-	struct msm_gem_vm *vm = vma->vm;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
 
 	GEM_WARN_ON(vma->mapped);
 
-	spin_lock(&vm->lock);
-	if (vma->iova)
+	spin_lock(&vm->mm_lock);
+	if (vma->base.va.addr)
 		drm_mm_remove_node(&vma->node);
-	spin_unlock(&vm->lock);
+	spin_unlock(&vm->mm_lock);
 
-	vma->iova = 0;
-	list_del(&vma->list);
+	mutex_lock(&vm->vm_lock);
+	drm_gpuva_remove(&vma->base);
+	drm_gpuva_unlink(&vma->base);
+	mutex_unlock(&vm->vm_lock);
 
-	msm_gem_vm_put(vm);
 	kfree(vma);
 }
 
@@ -113,6 +110,7 @@ struct msm_gem_vma *
 msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end)
 {
+	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
 	int ret;
 
@@ -120,36 +118,82 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
-	vma->vm = vm;
+	if (vm->managed) {
+		spin_lock(&vm->mm_lock);
+		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
+						obj->size, PAGE_SIZE, 0,
+						range_start, range_end, 0);
+		spin_unlock(&vm->mm_lock);
 
-	spin_lock(&vm->lock);
-	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  obj->size, PAGE_SIZE, 0,
-					  range_start, range_end, 0);
-	spin_unlock(&vm->lock);
+		if (ret)
+			goto err_free_vma;
 
-	if (ret)
-		goto err_free_vma;
+		range_start = vma->node.start;
+		range_end   = range_start + obj->size;
+	}
 
-	vma->iova = vma->node.start;
+	GEM_WARN_ON((range_end - range_start) > obj->size);
+
+	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
 	vma->mapped = false;
 
-	INIT_LIST_HEAD(&vma->list);
+	mutex_lock(&vm->vm_lock);
+	ret = drm_gpuva_insert(&vm->base, &vma->base);
+	mutex_unlock(&vm->vm_lock);
+	if (ret)
+		goto err_free_range;
 
-	kref_get(&vm->kref);
+	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
+	if (IS_ERR(vm_bo)) {
+		ret = PTR_ERR(vm_bo);
+		goto err_va_remove;
+	}
+
+	mutex_lock(&vm->vm_lock);
+	drm_gpuva_link(&vma->base, vm_bo);
+	mutex_unlock(&vm->vm_lock);
+	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
 	return vma;
 
+err_va_remove:
+	mutex_lock(&vm->vm_lock);
+	drm_gpuva_remove(&vma->base);
+	mutex_unlock(&vm->vm_lock);
+err_free_range:
+	if (vm->managed)
+		drm_mm_remove_node(&vma->node);
 err_free_vma:
 	kfree(vma);
 	return ERR_PTR(ret);
 }
 
+static const struct drm_gpuvm_ops msm_gpuvm_ops = {
+	.vm_free = msm_gem_vm_free,
+};
+
+/**
+ * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
+ * @drm: the drm device
+ * @mmu: the backing MMU objects handling mapping/unmapping
+ * @name: the name of the VM
+ * @va_start: the start offset of the VA space
+ * @va_size: the size of the VA space
+ * @managed: is it a kernel managed VM?
+ *
+ * In a kernel managed VM, the kernel handles address allocation, and only
+ * synchronous operations are supported.  In a user managed VM, userspace
+ * handles virtual address allocation, and both async and sync operations
+ * are supported.
+ */
 struct msm_gem_vm *
-msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
-		u64 va_start, u64 size)
+msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
+		  u64 va_start, u64 va_size, bool managed)
 {
+	enum drm_gpuvm_flags flags = managed ? DRM_GPUVM_VA_WEAK_REF : 0;
 	struct msm_gem_vm *vm;
+	struct drm_gem_object *dummy_gem;
+	int ret = 0;
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
@@ -158,15 +202,28 @@ msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
 	if (!vm)
 		return ERR_PTR(-ENOMEM);
 
-	spin_lock_init(&vm->lock);
-	vm->name = name;
-	vm->mmu = mmu;
-	vm->va_start = va_start;
-	vm->va_size  = size;
+	dummy_gem = drm_gpuvm_resv_object_alloc(drm);
+	if (!dummy_gem) {
+		ret = -ENOMEM;
+		goto err_free_vm;
+	}
+
+	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
+		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
+	drm_gem_object_put(dummy_gem);
+
+	spin_lock_init(&vm->mm_lock);
+	mutex_init(&vm->vm_lock);
 
-	drm_mm_init(&vm->mm, va_start, size);
+	vm->mmu = mmu;
+	vm->managed = managed;
 
-	kref_init(&vm->kref);
+	drm_mm_init(&vm->mm, va_start, va_size);
 
 	return vm;
+
+err_free_vm:
+	kfree(vm);
+	return ERR_PTR(ret);
+
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 88504c4b842f..6458bd82a0cd 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -204,8 +204,8 @@ struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
 		return NULL;
 	}
 
-	vm = msm_gem_vm_create(mmu, "mdp_kms",
-		0x1000, 0x100000000 - 0x1000);
+	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",
+			       0x1000, 0x100000000 - 0x1000, true);
 	if (IS_ERR(vm)) {
 		dev_err(mdp_dev, "vm create, error %pe\n", vm);
 		mmu->funcs->destroy(mmu);
-- 
2.49.0

