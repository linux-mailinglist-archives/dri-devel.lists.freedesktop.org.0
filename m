Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A409E80A5
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4E410E28D;
	Sat,  7 Dec 2024 16:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b2uaQnGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF3910E0F7;
 Sat,  7 Dec 2024 16:17:42 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7258cf297d4so3000272b3a.2; 
 Sat, 07 Dec 2024 08:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588261; x=1734193061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fbt9U5IgsSbwA9VRGE91iCi6TIhVfHwSfrspWG1tcv4=;
 b=b2uaQnGctwfdChfER6DGiwkqW/tOGFUnWXqfvirrA/G+y2JRxOW66VbtLc3rQQeZSg
 He9tAQOppja2Du27tO+vJC8Se15ZFuxMCOhCAJLP5Up7DW0GWB2sVw8YSH30bxyMHLAj
 ctvxXxfhakUZw+32N6G/sR7hTnEaaSkBvpnzsA9+Lgp3fCW34yEqMeXHT4C41kSzBlrT
 FKe3GwImil8JJv33g6IhsjixckR3ZF+CobzvgXrfPmvZa8hrKXiQMzND+EOXn0G48wdW
 gmmQUyJdVU4DjSaD5KkNCSHY6/wfPpsJKRB/zd5zApkGQvrMnI0oKsr0uDGjmLxq9j00
 FhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588261; x=1734193061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fbt9U5IgsSbwA9VRGE91iCi6TIhVfHwSfrspWG1tcv4=;
 b=fNP/mI5awYiOso1ibxdTqeT9AtRh70djHcFvg1MjWEbjdUpzoFlCoPl2aKQENyy+6X
 K8Q2sxEwF4zTZHKyvXUanPfmTC0teDywtSFwsS1pqLMxBzBslDxy3nEgXKMzhfgbVOYV
 t8TTeyToTOmKQf9/RuU30OsjKtzeuFjEfcWqu+bCd5Xajctl6WWYHSTOhyvbM4Xzqcwf
 zP6w+2Yqi1+CJEOetmvTSc4DXIC6uALZ7v5QadXIoBpcNzrlwAKSRhVmeDYTxJmDphnd
 yShuTNyoo5iuCHe2ecXpKiK2ABF72oWE7d8yX4svmboc4QWKkaEKJv38WR1B7TuF8gfr
 rAnA==
X-Gm-Message-State: AOJu0Yzrg7YnWHJk2bHYRMxkIoCvMDcGWK48J54kOMLieeotUhXE1vlc
 Mr1KDsMWjW+/iWIK7KNgHkENh6fh7t6qyDMCdYjBQy8u+D+HjOnkr0w0bw==
X-Gm-Gg: ASbGncsQtbweInmAZedvSl70S5BLZeb2fQHpVazZPX9MbC+QEcqwezvNsR/eL3Gvdao
 QX4IkwPRaCEIpugm/XcGGEZxQzEz3FYCWHJnvcc66M4frXWWKHlA1WQAPhTn6ioXWWwNU4gzpe6
 PZoEdFvqRF97Bu7zOMN2YKsPI6/Nl4iP0JlUCwEHk+dWD4e/B3+L8mP7QNh4AkxwgKIIgGSqyRe
 8vz58C3Dv1bRbRub7RN4Gw6fKx5ahB/v1VQ6j3XlnhfoERdvrPbm3myxjxGhpPW8KnpkBvjP7tc
 dFjlO9VW3dtE
X-Google-Smtp-Source: AGHT+IEkq87YpOqKaKvYpaUN2bxoTuDpzP4uW9mDjz3oJZGljk6KJFgmugZGVuaQH46DPH6ygaz5Xg==
X-Received: by 2002:a05:6a00:c8b:b0:725:1951:79fd with SMTP id
 d2e1a72fcca58-725b81c2c72mr8908329b3a.26.1733588260672; 
 Sat, 07 Dec 2024 08:17:40 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725da7e0181sm852674b3a.134.2024.12.07.08.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:40 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC 07/24] drm/msm: Remove vram carveout support
Date: Sat,  7 Dec 2024 08:15:07 -0800
Message-ID: <20241207161651.410556-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_drv.c        | 117 +-----------------------
 drivers/gpu/drm/msm/msm_drv.h        |  11 ---
 drivers/gpu/drm/msm/msm_gem.c        | 131 +++------------------------
 drivers/gpu/drm/msm/msm_gem.h        |   5 -
 drivers/gpu/drm/msm/msm_gem_submit.c |   5 -
 5 files changed, 13 insertions(+), 256 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 88cd1ed59d48..a5a95a53d2c8 100644
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
 
 //	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
@@ -302,8 +189,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	return ret;
 
-err_deinit_vram:
-	msm_deinit_vram(ddev);
 err_destroy_wq:
 	destroy_workqueue(priv->wq);
 err_put_dev:
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ce1ef981a309..20a0f8f23490 100644
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
index c29367239283..f42bfa70502a 100644
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
 
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
@@ -135,36 +119,6 @@ static void update_lru(struct drm_gem_object *obj)
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
@@ -176,10 +130,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		struct page **p;
 		int npages = obj->size >> PAGE_SHIFT;
 
-		if (use_pages(obj))
-			p = drm_gem_get_pages(obj);
-		else
-			p = get_pages_vram(obj, npages);
+		p = drm_gem_get_pages(obj);
 
 		if (IS_ERR(p)) {
 			DRM_DEV_ERROR(dev->dev, "could not get pages: %ld\n",
@@ -212,18 +163,6 @@ static struct page **get_pages(struct drm_gem_object *obj)
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
@@ -244,10 +183,7 @@ static void put_pages(struct drm_gem_object *obj)
 
 		update_device_mem(obj->dev->dev_private, -obj->size);
 
-		if (use_pages(obj))
-			drm_gem_put_pages(obj, msm_obj->pages, true, false);
-		else
-			put_pages_vram(obj);
+		drm_gem_put_pages(obj, msm_obj->pages, true, false);
 
 		msm_obj->pages = NULL;
 		update_lru(obj);
@@ -1207,19 +1143,10 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
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
@@ -1232,44 +1159,16 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 
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
 
@@ -1297,12 +1196,6 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
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
index 30a281aa1353..235ad4be7fd0 100644
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
2.47.1

