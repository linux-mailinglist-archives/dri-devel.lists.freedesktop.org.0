Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D92AB7230
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B632E10E6AD;
	Wed, 14 May 2025 17:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fAVoGDRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9610E6A9;
 Wed, 14 May 2025 17:03:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so104108b3a.3; 
 Wed, 14 May 2025 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747242225; x=1747847025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
 b=fAVoGDRlxxIchuQDpwwQkWEVPJhmU25kJdsz+RIxMpuIv5xlFOhMa+qh84DGFHNs7w
 dutbh8/EsjzCxxiwnyJ91b7BLmK20LVZFIbbvnaBnEdO2UbpuP/G8WSz4P0i2davwgA9
 yiKa7icEYAAIYElT+surJ85tNY/sSwb6gjKGMaTET1Vlm+aIo5g0dRClJWM6w4xIAiPy
 gNpy6UADS5TGaJkhSdYoXKXzlXEYytbg/P7d5FdmD66f17SThmZvHp27g4+r0lSuym15
 WQJ/79cYwkIT6BtGPeJCnIDYwn2ggCYXG+C3pZiUZABddIkgfxFKqLdS55AZsnYCdUfO
 lS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747242225; x=1747847025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
 b=ffIJra98P19Ub6m76gB5T/E1bFJvLQslnbfUydD0bUvCPgOJkS4dZVE/Fk10EE8iV2
 wdwGLZizONzjk1bE9OSuRKaCBX+qfWWxXFS+I8ZQAvBXI84WE2dq2FlSbtXl/OLHyeWi
 CqlzCtKhTwMv5Hx+fJ+GAyZt2AKH9kmvvGfVhV/CxEVb5Gx1AawNdMoDnwP4sZhrD+1T
 TypQ7MCW063dPWAX70Db7090wKM3jcIMKbtqsfgT+vk//OoXkiEh2ajvIt8QnghaA5Ob
 /hCPhYQeyXjCc0adzU3UywSUB81BYqbTny8YZRCz0DiQZkrYqedEcm9+7rl6KmJOBePW
 M15w==
X-Gm-Message-State: AOJu0Ywdvy+fm/o7ZcgCOiy76sFqDbKJKFLSJrl/QHygZ12J4eBQpljo
 dLgOsiLx3E0oC7q+3iU2mOQKXx77y9Fw7wLJSyJ2qzrveOvzUV+It9FrQA==
X-Gm-Gg: ASbGnctYrrNuP/3H57b4sAbPLOh8F84GXUxikfqmZAPcdXWENflk98AwmLbHGlZhTFX
 GEWaOWcu18YKqRvlcdwpB6L1JOjojssHRdS3uGaiFeMIET3sVZJcpt9B7WfeqA4VLlkctwrKymz
 4KItZgbCnx01pjzC1VSxzXJvg6sM5DCOVfb7uGnB6zzOJJYulQCuGwTu1FPQHF08UPgZQvlQYj/
 johtR0HV9U+M/tH/9AhK1OHTS116cvPIT5rAKNsy8iFWHK430LWZV3zGMtdtk9jbWPqmHO5Ikup
 BNkEt4N3FEQNtPyuA4sIOPi1wIomfc87o6yVOFxJ3e4a86WmkYzkZ+domkPNbmXP/fH6ZVnysmu
 obz71LulBju/wh9QwWOnNzMbIlw==
X-Google-Smtp-Source: AGHT+IGfKsH/YJoljsqYatcFXJhDCdbv9YL+0dsBSHBH6NvuU5sSC3Rj1HW5LCWbfSjAfbE4fmoZFw==
X-Received: by 2002:a17:903:4b4f:b0:223:4537:65b1 with SMTP id
 d9443c01a7336-231981a27f4mr68873495ad.36.1747242225161; 
 Wed, 14 May 2025 10:03:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc7742d13sm102034515ad.90.2025.05.14.10.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:03:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 10/40] drm/msm: Collapse vma allocation and initialization
Date: Wed, 14 May 2025 09:59:09 -0700
Message-ID: <20250514170118.40555-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.49.0

