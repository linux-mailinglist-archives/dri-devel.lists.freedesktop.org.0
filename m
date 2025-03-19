Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D527A6914B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716CD10E522;
	Wed, 19 Mar 2025 14:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="meYqF+M0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A07F10E521;
 Wed, 19 Mar 2025 14:55:15 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-224019ad9edso25522415ad.1; 
 Wed, 19 Mar 2025 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396114; x=1743000914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bhvfS8GBuYbMDi5JJolhJY8ynuK7HTOh4WtKTl/CI7U=;
 b=meYqF+M0V0wEPXuyrzSGaeGEZ9XmHNcdwgBbyCk7Uvgbg3ieDEOkNnFP3yhBLD2Gdl
 29CkNDjzvKxwPV1YQY7kAw6CvAKuIbPLQy7UCRhjE62+BteYS9vNr8K50wQLMRGzbQJJ
 JGXCoAFIyoV0+e5Gz5i+JKt3vw0T39g/tsPYk6wMAlsdGGmRRuzs2NyjsVMsf7r/UGU5
 +mm7DfE6nzJaf6vHyelwyXVC3LUKsgX6Wx0fSzFXpqEf33qbGjIrtbGeuI1BMnadaZhU
 /0G1JzjvSPk4SuKqrY0kKahZxBkTM2dsitwzhTDfISeWka8FeMKyoIqCkuVXMPmvcXps
 Sq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396114; x=1743000914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhvfS8GBuYbMDi5JJolhJY8ynuK7HTOh4WtKTl/CI7U=;
 b=gXbvIC11tnJoQgPfxw2Nf4TUKsRk0j4sg6Y6hLmQJG41QQBM1iHI8kjN3fx7Qi/26E
 41EajtFHVX8aVdU8qFpGeyB3sAv6XunHjrb+ySwTI0HxZD3FxZFKFypnYMZozGKfb6Oe
 W/eO5dft/lELfwWsYSexqZkS7/+TwdM/ZhirpVowh9UhIHnjHHmUJCXJcHrVL1OoM8F5
 kiJ29gUuo3KN2y/X4xoUrwaV2koH0Q4BVlFQ0lkaN/D21JHe1pwY/6s2WLYIh6Mzm/OL
 JKE9JEWXp8sbu3kF92rfyxj6fi1W6Wiapd4Wr3fJ0u9RghcBqBJpeeGT2yp2xaazcu+E
 BP3w==
X-Gm-Message-State: AOJu0YzUvWDCBFfr+Rp4m8AKJTTzAcLrjZrXx2PwWpjytwlKp+kFXU4O
 VcU27Ba1mHE1wN4I+cxjyHO1bB6Z3lW9ei0rpd/2kSXZzL2U834Sw5PEHw==
X-Gm-Gg: ASbGncu0RuN7Dx/sg8yH22hjpGF9b+WyjUQeDwGTVaDdRrDSza9hb86+2K4eeWZU1dW
 TaVg45tC77wPKCAlC9hGCYXkZ4Fn6NG2wjee1Qo6WqeiavUrXK3DyR9Ne3HIi9mZoB8DwM8Bq21
 JX0u8PouhKyTrp4S8PsSUGaJ7R2wqLjlpGccNxeuqBptKUsVrWaezhDh7aNfWNOprzkOt1BivST
 I8pa46IdIuMY8FinNPtxU7ecy/QaXQ9h7CqbXtj6CkgrXrZCFy/Z4rc/GfJY0zxBksCEPNPuHl0
 Stz7pKsqribK6rLSMC1lNnZdO2TIYvvPJa2z8u7F1UvpyPf+rrL3DO+5tClSyRE0eSRbO7b/m4H
 mOhDrPxGPKcPqdmH4HhPkfYrMmLSIxg==
X-Google-Smtp-Source: AGHT+IG93mEOJ7vyFmJWUO+X9klfHOEsy61lL3ILcm8ot6fLDQw2z3GznQ5JtZPrBnxWgQIfqSnNsg==
X-Received: by 2002:a17:903:22c4:b0:220:faa2:c911 with SMTP id
 d9443c01a7336-2264992ff63mr47153795ad.14.1742396114109; 
 Wed, 19 Mar 2025 07:55:14 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6ba6d69sm114832385ad.158.2025.03.19.07.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 08/34] drm/msm: Remove vram carveout support
Date: Wed, 19 Mar 2025 07:52:20 -0700
Message-ID: <20250319145425.51935-9-robdclark@gmail.com>
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

It is standing in the way of drm_gpuvm / VM_BIND support.  Not to
mention frequently broken and rarely tested.  And I think only needed
for a 10yr old not quite upstream SoC (msm8974).

Maybe we can add support back in later, but I'm doubtful.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |   6 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  13 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  13 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |   4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   1 -
 drivers/gpu/drm/msm/msm_drv.c              | 117 +-----------------
 drivers/gpu/drm/msm/msm_drv.h              |  11 --
 drivers/gpu/drm/msm/msm_gem.c              | 131 ++-------------------
 drivers/gpu/drm/msm/msm_gem.h              |   5 -
 drivers/gpu/drm/msm/msm_gem_submit.c       |   5 -
 10 files changed, 19 insertions(+), 287 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 5eb063ed0b46..db1aa281ce47 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -553,10 +553,8 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 
 	if (!gpu->vm) {
 		dev_err(dev->dev, "No memory protection without MMU\n");
-		if (!allow_vram_carveout) {
-			ret = -ENXIO;
-			goto fail;
-		}
+		ret = -ENXIO;
+		goto fail;
 	}
 
 	return gpu;
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 434e6ededf83..49ba1ce77144 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -582,18 +582,9 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	}
 
 	if (!gpu->vm) {
-		/* TODO we think it is possible to configure the GPU to
-		 * restrict access to VRAM carveout.  But the required
-		 * registers are unknown.  For now just bail out and
-		 * limp along with just modesetting.  If it turns out
-		 * to not be possible to restrict access, then we must
-		 * implement a cmdstream validator.
-		 */
 		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
-		if (!allow_vram_carveout) {
-			ret = -ENXIO;
-			goto fail;
-		}
+		ret = -ENXIO;
+		goto fail;
 	}
 
 	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 2c75debcfd84..4faf8570aec7 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -696,18 +696,9 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
 
 	if (!gpu->vm) {
-		/* TODO we think it is possible to configure the GPU to
-		 * restrict access to VRAM carveout.  But the required
-		 * registers are unknown.  For now just bail out and
-		 * limp along with just modesetting.  If it turns out
-		 * to not be possible to restrict access, then we must
-		 * implement a cmdstream validator.
-		 */
 		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
-		if (!allow_vram_carveout) {
-			ret = -ENXIO;
-			goto fail;
-		}
+		ret = -ENXIO;
+		goto fail;
 	}
 
 	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f4552b8c6767..6b0390c38bff 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -16,10 +16,6 @@ bool snapshot_debugbus = false;
 MODULE_PARM_DESC(snapshot_debugbus, "Include debugbus sections in GPU devcoredump (if not fused off)");
 module_param_named(snapshot_debugbus, snapshot_debugbus, bool, 0600);
 
-bool allow_vram_carveout = false;
-MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
-module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
-
 int enable_preemption = -1;
 MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
 module_param(enable_preemption, int, 0600);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index eaebcb108b5e..7dbe09817edc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -18,7 +18,6 @@
 #include "adreno_pm4.xml.h"
 
 extern bool snapshot_debugbus;
-extern bool allow_vram_carveout;
 
 enum {
 	ADRENO_FW_PM4 = 0,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 903abf3532e0..978f1d355b42 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -46,12 +46,6 @@
 #define MSM_VERSION_MINOR	12
 #define MSM_VERSION_PATCHLEVEL	0
 
-static void msm_deinit_vram(struct drm_device *ddev);
-
-static char *vram = "16m";
-MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
-module_param(vram, charp, 0);
-
 bool dumpstate;
 MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
 module_param(dumpstate, bool, 0600);
@@ -97,8 +91,6 @@ static int msm_drm_uninit(struct device *dev)
 	if (priv->kms)
 		msm_drm_kms_uninit(dev);
 
-	msm_deinit_vram(ddev);
-
 	component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
@@ -109,107 +101,6 @@ static int msm_drm_uninit(struct device *dev)
 	return 0;
 }
 
-bool msm_use_mmu(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-
-	/*
-	 * a2xx comes with its own MMU
-	 * On other platforms IOMMU can be declared specified either for the
-	 * MDP/DPU device or for its parent, MDSS device.
-	 */
-	return priv->is_a2xx ||
-		device_iommu_mapped(dev->dev) ||
-		device_iommu_mapped(dev->dev->parent);
-}
-
-static int msm_init_vram(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct device_node *node;
-	unsigned long size = 0;
-	int ret = 0;
-
-	/* In the device-tree world, we could have a 'memory-region'
-	 * phandle, which gives us a link to our "vram".  Allocating
-	 * is all nicely abstracted behind the dma api, but we need
-	 * to know the entire size to allocate it all in one go. There
-	 * are two cases:
-	 *  1) device with no IOMMU, in which case we need exclusive
-	 *     access to a VRAM carveout big enough for all gpu
-	 *     buffers
-	 *  2) device with IOMMU, but where the bootloader puts up
-	 *     a splash screen.  In this case, the VRAM carveout
-	 *     need only be large enough for fbdev fb.  But we need
-	 *     exclusive access to the buffer to avoid the kernel
-	 *     using those pages for other purposes (which appears
-	 *     as corruption on screen before we have a chance to
-	 *     load and do initial modeset)
-	 */
-
-	node = of_parse_phandle(dev->dev->of_node, "memory-region", 0);
-	if (node) {
-		struct resource r;
-		ret = of_address_to_resource(node, 0, &r);
-		of_node_put(node);
-		if (ret)
-			return ret;
-		size = r.end - r.start + 1;
-		DRM_INFO("using VRAM carveout: %lx@%pa\n", size, &r.start);
-
-		/* if we have no IOMMU, then we need to use carveout allocator.
-		 * Grab the entire DMA chunk carved out in early startup in
-		 * mach-msm:
-		 */
-	} else if (!msm_use_mmu(dev)) {
-		DRM_INFO("using %s VRAM carveout\n", vram);
-		size = memparse(vram, NULL);
-	}
-
-	if (size) {
-		unsigned long attrs = 0;
-		void *p;
-
-		priv->vram.size = size;
-
-		drm_mm_init(&priv->vram.mm, 0, (size >> PAGE_SHIFT) - 1);
-		spin_lock_init(&priv->vram.lock);
-
-		attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
-		attrs |= DMA_ATTR_WRITE_COMBINE;
-
-		/* note that for no-kernel-mapping, the vaddr returned
-		 * is bogus, but non-null if allocation succeeded:
-		 */
-		p = dma_alloc_attrs(dev->dev, size,
-				&priv->vram.paddr, GFP_KERNEL, attrs);
-		if (!p) {
-			DRM_DEV_ERROR(dev->dev, "failed to allocate VRAM\n");
-			priv->vram.paddr = 0;
-			return -ENOMEM;
-		}
-
-		DRM_DEV_INFO(dev->dev, "VRAM: %08x->%08x\n",
-				(uint32_t)priv->vram.paddr,
-				(uint32_t)(priv->vram.paddr + size));
-	}
-
-	return ret;
-}
-
-static void msm_deinit_vram(struct drm_device *ddev)
-{
-	struct msm_drm_private *priv = ddev->dev_private;
-	unsigned long attrs = DMA_ATTR_NO_KERNEL_MAPPING;
-
-	if (!priv->vram.paddr)
-		return;
-
-	drm_mm_takedown(&priv->vram.mm);
-	dma_free_attrs(ddev->dev, priv->vram.size, NULL, priv->vram.paddr,
-			attrs);
-}
-
 static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
@@ -256,16 +147,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 			goto err_destroy_wq;
 	}
 
-	ret = msm_init_vram(ddev);
-	if (ret)
-		goto err_destroy_wq;
-
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	/* Bind all our sub-components: */
 	ret = component_bind_all(dev, ddev);
 	if (ret)
-		goto err_deinit_vram;
+		goto err_destroy_wq;
 
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
@@ -302,8 +189,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	return ret;
 
-err_deinit_vram:
-	msm_deinit_vram(ddev);
 err_destroy_wq:
 	destroy_workqueue(priv->wq);
 err_put_dev:
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 0e675c9a7f83..ad509403f072 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -183,17 +183,6 @@ struct msm_drm_private {
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-	/* VRAM carveout, used when no IOMMU: */
-	struct {
-		unsigned long size;
-		dma_addr_t paddr;
-		/* NOTE: mm managed at the page level, size is in # of pages
-		 * and position mm_node->start is in # of pages:
-		 */
-		struct drm_mm mm;
-		spinlock_t lock; /* Protects drm_mm node allocation/removal */
-	} vram;
-
 	struct notifier_block vmap_notifier;
 	struct shrinker *shrinker;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 07a30d29248c..621fb4e17a2e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -17,24 +17,8 @@
 #include <trace/events/gpu_mem.h>
 
 #include "msm_drv.h"
-#include "msm_fence.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
-#include "msm_mmu.h"
-
-static dma_addr_t physaddr(struct drm_gem_object *obj)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
-	return (((dma_addr_t)msm_obj->vram_node->start) << PAGE_SHIFT) +
-			priv->vram.paddr;
-}
-
-static bool use_pages(struct drm_gem_object *obj)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	return !msm_obj->vram_node;
-}
 
 static int pgprot = 0;
 module_param(pgprot, int, 0600);
@@ -139,36 +123,6 @@ static void update_lru(struct drm_gem_object *obj)
 	mutex_unlock(&priv->lru.lock);
 }
 
-/* allocate pages from VRAM carveout, used when no IOMMU: */
-static struct page **get_pages_vram(struct drm_gem_object *obj, int npages)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
-	dma_addr_t paddr;
-	struct page **p;
-	int ret, i;
-
-	p = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
-	if (!p)
-		return ERR_PTR(-ENOMEM);
-
-	spin_lock(&priv->vram.lock);
-	ret = drm_mm_insert_node(&priv->vram.mm, msm_obj->vram_node, npages);
-	spin_unlock(&priv->vram.lock);
-	if (ret) {
-		kvfree(p);
-		return ERR_PTR(ret);
-	}
-
-	paddr = physaddr(obj);
-	for (i = 0; i < npages; i++) {
-		p[i] = pfn_to_page(__phys_to_pfn(paddr));
-		paddr += PAGE_SIZE;
-	}
-
-	return p;
-}
-
 static struct page **get_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
@@ -180,10 +134,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		struct page **p;
 		int npages = obj->size >> PAGE_SHIFT;
 
-		if (use_pages(obj))
-			p = drm_gem_get_pages(obj);
-		else
-			p = get_pages_vram(obj, npages);
+		p = drm_gem_get_pages(obj);
 
 		if (IS_ERR(p)) {
 			DRM_DEV_ERROR(dev->dev, "could not get pages: %ld\n",
@@ -216,18 +167,6 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	return msm_obj->pages;
 }
 
-static void put_pages_vram(struct drm_gem_object *obj)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
-
-	spin_lock(&priv->vram.lock);
-	drm_mm_remove_node(msm_obj->vram_node);
-	spin_unlock(&priv->vram.lock);
-
-	kvfree(msm_obj->pages);
-}
-
 static void put_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
@@ -248,10 +187,7 @@ static void put_pages(struct drm_gem_object *obj)
 
 		update_device_mem(obj->dev->dev_private, -obj->size);
 
-		if (use_pages(obj))
-			drm_gem_put_pages(obj, msm_obj->pages, true, false);
-		else
-			put_pages_vram(obj);
+		drm_gem_put_pages(obj, msm_obj->pages, true, false);
 
 		msm_obj->pages = NULL;
 		update_lru(obj);
@@ -1215,19 +1151,10 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj = NULL;
-	bool use_vram = false;
 	int ret;
 
 	size = PAGE_ALIGN(size);
 
-	if (!msm_use_mmu(dev))
-		use_vram = true;
-	else if ((flags & (MSM_BO_STOLEN | MSM_BO_SCANOUT)) && priv->vram.size)
-		use_vram = true;
-
-	if (GEM_WARN_ON(use_vram && !priv->vram.size))
-		return ERR_PTR(-EINVAL);
-
 	/* Disallow zero sized objects as they make the underlying
 	 * infrastructure grumpy
 	 */
@@ -1240,44 +1167,16 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 
 	msm_obj = to_msm_bo(obj);
 
-	if (use_vram) {
-		struct msm_gem_vma *vma;
-		struct page **pages;
-
-		drm_gem_private_object_init(dev, obj, size);
-
-		msm_gem_lock(obj);
-
-		vma = add_vma(obj, NULL);
-		msm_gem_unlock(obj);
-		if (IS_ERR(vma)) {
-			ret = PTR_ERR(vma);
-			goto fail;
-		}
-
-		to_msm_bo(obj)->vram_node = &vma->node;
-
-		msm_gem_lock(obj);
-		pages = get_pages(obj);
-		msm_gem_unlock(obj);
-		if (IS_ERR(pages)) {
-			ret = PTR_ERR(pages);
-			goto fail;
-		}
-
-		vma->iova = physaddr(obj);
-	} else {
-		ret = drm_gem_object_init(dev, obj, size);
-		if (ret)
-			goto fail;
-		/*
-		 * Our buffers are kept pinned, so allocating them from the
-		 * MOVABLE zone is a really bad idea, and conflicts with CMA.
-		 * See comments above new_inode() why this is required _and_
-		 * expected if you're going to pin these pages.
-		 */
-		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER);
-	}
+	ret = drm_gem_object_init(dev, obj, size);
+	if (ret)
+		goto fail;
+	/*
+	 * Our buffers are kept pinned, so allocating them from the
+	 * MOVABLE zone is a really bad idea, and conflicts with CMA.
+	 * See comments above new_inode() why this is required _and_
+	 * expected if you're going to pin these pages.
+	 */
+	mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER);
 
 	drm_gem_lru_move_tail(&priv->lru.unbacked, obj);
 
@@ -1305,12 +1204,6 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	uint32_t size;
 	int ret, npages;
 
-	/* if we don't have IOMMU, don't bother pretending we can import: */
-	if (!msm_use_mmu(dev)) {
-		DRM_DEV_ERROR(dev->dev, "cannot import without IOMMU\n");
-		return ERR_PTR(-EINVAL);
-	}
-
 	size = PAGE_ALIGN(dmabuf->size);
 
 	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d2f39a371373..c16b11182831 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -102,11 +102,6 @@ struct msm_gem_object {
 
 	struct list_head vmas;    /* list of msm_gem_vma */
 
-	/* For physically contiguous buffers.  Used when we don't have
-	 * an IOMMU.  Also used for stolen/splashscreen buffer.
-	 */
-	struct drm_mm_node *vram_node;
-
 	char name[32]; /* Identifier to print for the debugfs files */
 
 	/* userspace metadata backchannel */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 95da4714fffb..a186b7dfea35 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -659,11 +659,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (unlikely(!ctx->vm) && !capable(CAP_SYS_RAWIO)) {
-		DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
-		return -EPERM;
-	}
-
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
-- 
2.48.1

