Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5352CFE0
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF15D11B334;
	Thu, 19 May 2022 09:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1D411B32E;
 Thu, 19 May 2022 09:55:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id i40so6317663eda.7;
 Thu, 19 May 2022 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r7VxVBvOC94cVM2gquLnP1BAr+qI3xEHGhn2yzw1qu8=;
 b=qnhrNYAAuw+tLbxFLnmBSlAaFMW/7kcHttQ4UAlijZlPcW25yuav2SLuxBHE+QCimQ
 3NTWhX7swi2U4EBvrmmkueTSorVjbLBP0WtN366YDJXlbIPGk+D2/H8C0Ib7t55S7APk
 qSgj6j5WCMvo2LAihXO8Vm0UtSITm0571JsFzxXak4nQJR8ftjxh5r8DHDTpQz8PIBfh
 /7eoXlhMFnZLfxGi1dr8Eghs2x2rHasuj3sQCE5xB+m412l8qC/c5uiqATAe22sK8lJV
 ACG9w+T4XRXi6FBh+gW+09DS8dBfytGRL8nTQSC3ffVOGYPUuGwdnjkWkiV4Pe9s79Mh
 BhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r7VxVBvOC94cVM2gquLnP1BAr+qI3xEHGhn2yzw1qu8=;
 b=bA7MOK6mRKsrB+Q5Z0iG23ylfFyfa9V9s9TAfBipm5ScKV/YIuTUUV74t2kxMOXwap
 /WNxlEGboCpW7bWdzF6/O/Oq62MEt0Y9KJPXgl9QX5wjktU+kD8+hjAU6dE699DeRJ6r
 9cRGuUd+qZVNpjl1sXs8zuyE/QlvdzPletxSGF9YUJaBijubw5068K+9TupfSJo1PCy8
 3pUKSsR1G+PGHe1MFh9cEJjKez7vtG+GmSxYMTG+0mOUFfbBkteoRO08BL3lm+xKW3Y8
 T/XbSjC8BDIuQrD97PMizKJ6nzp3mar87wLph4wVAk7ImX2chw4wzHFo/k+41qhFiA2g
 M3Ug==
X-Gm-Message-State: AOAM533w/fkfzkzW3Q0ycJGaqcH/ngrV9IX7uGFdfNSVWa55OHhof0xN
 d5iBH3tqZBn2JBAx6TazJGijlvc0wdU=
X-Google-Smtp-Source: ABdhPJxQso22PBTYmRRkA892GOrnHiK2opNPh8eqRGcpRuQSAYt91ZDQMub073PbVP9Aikcy1Cutzw==
X-Received: by 2002:a05:6402:f09:b0:42a:be2f:ceeb with SMTP id
 i9-20020a0564020f0900b0042abe2fceebmr4436820eda.110.1652954115682; 
 Thu, 19 May 2022 02:55:15 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/11] drm/ttm: drop ttm_bo_init
Date: Thu, 19 May 2022 11:55:02 +0200
Message-Id: <20220519095508.115203-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: matthew.william.auld@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 26 ---------------------
 include/drm/ttm/ttm_bo_api.h | 44 ------------------------------------
 2 files changed, 70 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 296af2b89951..e652055b5175 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -985,32 +985,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_init_reserved);
 
-int ttm_bo_init(struct ttm_device *bdev,
-		struct ttm_buffer_object *bo,
-		size_t size,
-		enum ttm_bo_type type,
-		struct ttm_placement *placement,
-		uint32_t page_alignment,
-		bool interruptible,
-		struct sg_table *sg,
-		struct dma_resv *resv,
-		void (*destroy) (struct ttm_buffer_object *))
-{
-	struct ttm_operation_ctx ctx = { interruptible, false };
-	int ret;
-
-	ret = ttm_bo_init_reserved(bdev, bo, size, type, placement,
-				   page_alignment, &ctx, sg, resv, destroy);
-	if (ret)
-		return ret;
-
-	if (!resv)
-		ttm_bo_unreserve(bo);
-
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_init);
-
 /*
  * buffer object vm functions.
  */
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 2d524f8b0802..29384e2cb704 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -361,50 +361,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *));
 
-/**
- * ttm_bo_init
- *
- * @bdev: Pointer to a ttm_device struct.
- * @bo: Pointer to a ttm_buffer_object to be initialized.
- * @size: Requested size of buffer object.
- * @type: Requested type of buffer object.
- * @placement: Initial placement for buffer object.
- * @page_alignment: Data alignment in pages.
- * @interruptible: If needing to sleep to wait for GPU resources,
- * sleep interruptible.
- * pinned in physical memory. If this behaviour is not desired, this member
- * holds a pointer to a persistent shmem object. Typically, this would
- * point to the shmem object backing a GEM object if TTM is used to back a
- * GEM user interface.
- * @sg: Scatter-gather table.
- * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
- * @destroy: Destroy function. Use NULL for kfree().
- *
- * This function initializes a pre-allocated struct ttm_buffer_object.
- * As this object may be part of a larger structure, this function,
- * together with the @destroy function,
- * enables driver-specific objects derived from a ttm_buffer_object.
- *
- * On successful return, the caller owns an object kref to @bo. The kref and
- * list_kref are usually set to 1, but note that in some situations, other
- * tasks may already be holding references to @bo as well.
- *
- * If a failure occurs, the function will call the @destroy function, or
- * kfree() if @destroy is NULL. Thus, after a failure, dereferencing @bo is
- * illegal and will likely cause memory corruption.
- *
- * Returns
- * -ENOMEM: Out of memory.
- * -EINVAL: Invalid placement flags.
- * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
- */
-int ttm_bo_init(struct ttm_device *bdev, struct ttm_buffer_object *bo,
-		size_t size, enum ttm_bo_type type,
-		struct ttm_placement *placement,
-		uint32_t page_alignment, bool interrubtible,
-		struct sg_table *sg, struct dma_resv *resv,
-		void (*destroy) (struct ttm_buffer_object *));
-
 /**
  * ttm_kmap_obj_virtual
  *
-- 
2.25.1

