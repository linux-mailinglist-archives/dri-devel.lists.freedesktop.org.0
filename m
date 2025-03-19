Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E04A69180
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF4A10E539;
	Wed, 19 Mar 2025 14:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mJVBt2Cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8247510E52A;
 Wed, 19 Mar 2025 14:55:53 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-226185948ffso71238465ad.0; 
 Wed, 19 Mar 2025 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396153; x=1743000953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtskW6rdhWE0A0tJOFKFCUzMYzKfmRFhzl7PyUes/t4=;
 b=mJVBt2Cg67m7MHxdG94pZC1gKhxPtvR89NkxedzWCyWKybhdkS/tPOql0z2ow0C9IR
 9IoyYsKmv2SxUVxZm9wVA/hlFz4PA5ycUW6ayqhm3awxcoF3Fs0ShmSD4t39gdKy0o7E
 bCFmZ7sqdNkm/y1D3BM07FMD67iXbi2Qi0pr6dYDRLqo6ovCW6/I6I0BZjZMvB7E18cA
 bmnWqIWHS0srZXYJJJ0CAG0Qrt2Hin6ggwD/2xwDdlHe1eB5fQl15UDsDHFFayWYKHwc
 +YCInt6owUolVjtY+sNfHkFSsEx7dJn6lm8VM5yxyfEEVGgh/dbtaXKBOsTVWghVLVan
 PN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396153; x=1743000953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtskW6rdhWE0A0tJOFKFCUzMYzKfmRFhzl7PyUes/t4=;
 b=iA/d96kw8DD7CVY9AUkqjrf1aqDDmzeLOxQAWWWXFbAr7kex1WzF3oNI1lL7QEuT0T
 yWEV3YI/g18iUHKBky9ZypxTEeAaBof6NUPE+A8xGcIYx2ZVzO+9rhM//jicP1jxhmnh
 YGKuZpmDl5rM6Tm7INFy31PWBHyuSC03WkRMGR3AOh7FCfrsN5HOQc9taBU1tVdOnEXL
 ByuzFpya5k4Z/FeycGNTxhO1WR44xYn4NiRXu2nqlq8C8g9CxTCOb3XURUb4KrCDX/Ba
 B3PL6z1G9BJU6YU/N6Pn5OukBwKnvMNHFStl6sjYaVPuso+bRT2QGl4YDUYjbTcGC3Fl
 yvGg==
X-Gm-Message-State: AOJu0Yzm+Roww2L2GaTcKthxZyg7jdEZ6g3Z5Vza9wDT+gOEr7kGFsx2
 tykLWlux1x+FsM4snTuns8TQqi9CJLXA9an3Rt85c/kdQx8CHGpqAZcORw==
X-Gm-Gg: ASbGncvfRijazVKOn+k0d/9yatExCgTQ7L4dbqPugfMI+BnqrcX3ZB+aCDKrd6FoJR9
 YN2zD5PxEh26hqfNVduNGAdNfL1WGY7qhlE3bUQuB58uxRHyI5RSEz29cYvITAkJpOb3x6bMoUK
 smol/QJqmrpL4c/tZfIiaNPdDDdqPXjNw3gmwXVshKJ6afGoXh4+yzpyPxfXAzXgdnA/TRaZ+9y
 /y3x3grdkI9QM+oAC+JphZfdLA8V6djHp2ji+f7918ZgjyZUM237j8ClNoAzNYC8uTDWTh1W8SW
 fDxzDGdXY+zwuFAj68jBG/ONpMlsIyxKvpZb1kB1jP+9qnodUUci/sZ4rIGxBG1f5KM8CFZNJBs
 rhpkBlkn/1jQcocIAR3I5yX/WZGAyWw==
X-Google-Smtp-Source: AGHT+IG6wCp6TlA5EcFXQS2zFAxUCtLNnEc3uD8oXoV+1DTRNZ9SvFOcNery9DY95MRlGiEtjpK1Aw==
X-Received: by 2002:a17:902:d4c7:b0:21f:522b:690f with SMTP id
 d9443c01a7336-22649a57d5emr44840415ad.46.1742396152544; 
 Wed, 19 Mar 2025 07:55:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbe4c5sm115221445ad.192.2025.03.19.07.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 24/34] drm/msm: Split msm_gem_vma_new()
Date: Wed, 19 Mar 2025 07:52:36 -0700
Message-ID: <20250319145425.51935-25-robdclark@gmail.com>
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

Split memory allocation from vma initialization.  Async vm-bind happens
in the fence signalling path, so it will need to use pre-allocated
memory.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 67 ++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index baa5c6a0ff22..7d40b151aa95 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -71,40 +71,54 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	return ret;
 }
 
-/* Close an iova.  Warn if it is still in use */
-void msm_gem_vma_close(struct drm_gpuva *vma)
+static void __vma_close(struct drm_gpuva *vma)
 {
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
 	GEM_WARN_ON(msm_vma->mapped);
+	GEM_WARN_ON(!mutex_is_locked(&vm->vm_lock));
 
 	spin_lock(&vm->mm_lock);
 	if (vma->va.addr && vm->managed)
 		drm_mm_remove_node(&msm_vma->node);
 	spin_unlock(&vm->mm_lock);
 
-	dma_resv_lock(drm_gpuvm_resv(vma->vm), NULL);
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(vma);
 	drm_gpuva_unlink(vma);
-	mutex_unlock(&vm->vm_lock);
-	dma_resv_unlock(drm_gpuvm_resv(vma->vm));
 
 	kfree(vma);
 }
 
-/* Create a new vma and allocate an iova for it */
-struct drm_gpuva *
-msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
-		u64 offset, u64 range_start, u64 range_end)
+/* Close an iova.  Warn if it is still in use */
+void msm_gem_vma_close(struct drm_gpuva *vma)
+{
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
+
+	/*
+	 * Only used in legacy (kernel managed) VM, if userspace is managing
+	 * the VM, the legacy paths should be disallowed:
+	 */
+	GEM_WARN_ON(!vm->managed);
+
+	dma_resv_lock(drm_gpuvm_resv(vma->vm), NULL);
+	mutex_lock(&vm->vm_lock);
+	__vma_close(vma);
+	mutex_unlock(&vm->vm_lock);
+	dma_resv_unlock(drm_gpuvm_resv(vma->vm));
+}
+
+static struct drm_gpuva *
+__vma_init(struct msm_gem_vma *vma, struct drm_gpuvm *_vm,
+	   struct drm_gem_object *obj, u64 offset,
+	   u64 range_start, u64 range_end)
 {
 	struct msm_gem_vm *vm = to_msm_vm(_vm);
 	struct drm_gpuvm_bo *vm_bo;
-	struct msm_gem_vma *vma;
 	int ret;
 
-	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+	GEM_WARN_ON(!mutex_is_locked(&vm->vm_lock));
+
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
@@ -128,9 +142,7 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
 
-	mutex_lock(&vm->vm_lock);
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
-	mutex_unlock(&vm->vm_lock);
 	if (ret)
 		goto err_free_range;
 
@@ -140,17 +152,13 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 		goto err_va_remove;
 	}
 
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_link(&vma->base, vm_bo);
-	mutex_unlock(&vm->vm_lock);
 	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
 	return &vma->base;
 
 err_va_remove:
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(&vma->base);
-	mutex_unlock(&vm->vm_lock);
 err_free_range:
 	if (vm->managed)
 		drm_mm_remove_node(&vma->node);
@@ -159,6 +167,29 @@ msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 	return ERR_PTR(ret);
 }
 
+/* Create a new vma and allocate an iova for it */
+struct drm_gpuva *
+msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
+		u64 offset, u64 range_start, u64 range_end)
+{
+	struct msm_gem_vm *vm = to_msm_vm(_vm);
+	struct msm_gem_vma *vma;
+
+	/*
+	 * Only used in legacy (kernel managed) VM, if userspace is managing
+	 * the VM, the legacy paths should be disallowed:
+	 */
+	GEM_WARN_ON(!vm->managed);
+
+	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+
+	mutex_lock(&vm->vm_lock);
+	__vma_init(vma, _vm, obj, offset, range_start, range_end);
+	mutex_unlock(&vm->vm_lock);
+
+	return &vma->base;
+}
+
 static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 };
-- 
2.48.1

