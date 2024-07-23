Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1308B93A071
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 14:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4D310E5A1;
	Tue, 23 Jul 2024 12:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="btDet3W+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF3210E5A6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so27687795e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737078; x=1722341878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+N9i4doNhAcVvF/B2O0V8BPwngZd2fz/q4Q6R1iaXZY=;
 b=btDet3W+GuMr9lQHC5vt9Fc+YFATPqLMdehOeB004SSYepKAS54b9zjn0xv15l+bMZ
 YWVeto/2RxrkLW2GH67LD2pEQvluPvXlIB6SLkuPvByKZVhyDFnbw/GsWIc45EE4B1g/
 JvecqQvPIvyY2GoFli5OLHfWDJMrXBKP6/fokaXzj0MlbHIF0S+UG7D3EID6LKi/Wz4z
 elmSCWLruktwsKabnyX2eaR7Ux+pW+8f0wh59+IcEEW8V39jfuFvHyw8SH3g9Sw3f++5
 ZmH59d2CKhqkSul371TCdrj7LIDoPVo3cPDSbf3M3fYqojOBTTHTWcmTN6o8u+hWPZ4b
 jh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737078; x=1722341878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+N9i4doNhAcVvF/B2O0V8BPwngZd2fz/q4Q6R1iaXZY=;
 b=C0MEqxRA/KyftlUijHpg9ho5PZbmh+ugsH9wTFWWhrr1J67kMrrY2CWl1PzGlW+EpT
 pRQojnDtxMYwXAPcPbtprlrRoFRf4IEdGYumoOG5h4/IgDo2RMGLxUxLD/9QAlus5/Ue
 7ENcoRZcr9Vrap/AZ0i91lnUXaUT6xJEp/BKyh4peCQtSsRJ76BaB+SkabuM6cmf/C9k
 tUnhZ8aYf01CHihxOXAEbJKBhpzCASN/3Jj8nhFp7YUcj1/gBfioKvD3vGREUqmBN0qt
 6ORb+B/x3cAl5/alWVehfIQwq0eCp+U0/MIH1+JAikCQGRVl8+KOVJ7NvsV8ySQsepSk
 OiVg==
X-Gm-Message-State: AOJu0YwWxvJ1WHzM+ys+ie5bEW1LvgOgfBhbZIkS9nxjRg//x3htAF32
 E9OXSDdGS6ANTUujfrUJ+BoDpxoI0NjZSxGQnru0ZzYHbNQp6qrG
X-Google-Smtp-Source: AGHT+IFpWwPUW5MDi4dWc/4CF4F+jcBcfyPm8tgfpuP5l71v7Gc9nuRtV1Og1nchNaYQwdMYSleFXg==
X-Received: by 2002:a05:600c:5129:b0:424:7871:2e9e with SMTP id
 5b1f17b1804b1-427ef32e627mr13158605e9.6.1721737077545; 
 Tue, 23 Jul 2024 05:17:57 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1540:9700:699c:86ac:5633:2a7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm138119595e9.44.2024.07.23.05.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:17:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/ttm: use GEM references for VM mappings
Date: Tue, 23 Jul 2024 14:17:49 +0200
Message-Id: <20240723121750.2086-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723121750.2086-1-christian.koenig@amd.com>
References: <20240723121750.2086-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of a TTM reference grab a GEM reference whenever necessary for a
VM mapping.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 4212b8c91dd4..3f283b3433f8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -58,13 +58,13 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
 			return VM_FAULT_RETRY;
 
-		ttm_bo_get(bo);
+		drm_gem_object_get(&bo->base);
 		mmap_read_unlock(vmf->vma->vm_mm);
 		(void)dma_resv_wait_timeout(bo->base.resv,
 					    DMA_RESV_USAGE_KERNEL, true,
 					    MAX_SCHEDULE_TIMEOUT);
 		dma_resv_unlock(bo->base.resv);
-		ttm_bo_put(bo);
+		drm_gem_object_put(&bo->base);
 		return VM_FAULT_RETRY;
 	}
 
@@ -130,12 +130,12 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 		 */
 		if (fault_flag_allow_retry_first(vmf->flags)) {
 			if (!(vmf->flags & FAULT_FLAG_RETRY_NOWAIT)) {
-				ttm_bo_get(bo);
+				drm_gem_object_get(&bo->base);
 				mmap_read_unlock(vmf->vma->vm_mm);
 				if (!dma_resv_lock_interruptible(bo->base.resv,
 								 NULL))
 					dma_resv_unlock(bo->base.resv);
-				ttm_bo_put(bo);
+				drm_gem_object_put(&bo->base);
 			}
 
 			return VM_FAULT_RETRY;
@@ -353,7 +353,7 @@ void ttm_bo_vm_open(struct vm_area_struct *vma)
 
 	WARN_ON(bo->bdev->dev_mapping != vma->vm_file->f_mapping);
 
-	ttm_bo_get(bo);
+	drm_gem_object_get(&bo->base);
 }
 EXPORT_SYMBOL(ttm_bo_vm_open);
 
@@ -361,7 +361,7 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
 {
 	struct ttm_buffer_object *bo = vma->vm_private_data;
 
-	ttm_bo_put(bo);
+	drm_gem_object_put(&bo->base);
 	vma->vm_private_data = NULL;
 }
 EXPORT_SYMBOL(ttm_bo_vm_close);
@@ -462,7 +462,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 	if (is_cow_mapping(vma->vm_flags))
 		return -EINVAL;
 
-	ttm_bo_get(bo);
+	drm_gem_object_get(&bo->base);
 
 	/*
 	 * Drivers may want to override the vm_ops field. Otherwise we
-- 
2.34.1

