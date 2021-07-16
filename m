Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A633CB2F4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 09:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BD36E91A;
	Fri, 16 Jul 2021 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3709F6E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:06:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i94so10856947wri.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 00:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0PoHTgY84iRoRPoOy8xCgnp81vFTLFv1p+2rr+7ZVY=;
 b=J27ngRTgTJwkjyVHiiSl+0CcyemV6u8tqBN/P/DVycQoCfYgwNhSQoWW+Pt6adjdry
 PvT9+l6q/3iNkF7qhj6KPlBRvBSYshsQtQpa5V3+wrl3dQKsfbBSi/LH2RKaO6oRXtzA
 QfP+gdRTOGfx8+bomNcCnx8kQgMxrUhl4+e9IihtqIoewLzdzMFCbmpXV4R3nxMSaTIm
 O9TVUfJRSPOxzltV88YeVEcgRAvhgt3LjVJz/DbkqtlpI3+Jcj0QReX65IbNQ5jo3IDZ
 d5H+AWP6SUNrOLShB1OPjr0fb7l4YdcEIzbwRappx48XbSGIRooQG1nJX1v1yuRxaNIy
 GKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0PoHTgY84iRoRPoOy8xCgnp81vFTLFv1p+2rr+7ZVY=;
 b=j89uErl7ybL/VNCLSroQQsnX7Kgt7HTvA3YakOYmBGee21RLK7DFzKvA29WfL5VTst
 ltAY9smcJagaOO7bjA1cneYeWWRFBbxOZtJitQEIRAQlJZ8QyBlD0c2zLXzaf4Hvtbsa
 mSg3Vz4I0qR2Jag2mWrF5jqbA+H3vrus+Up2HFT8jg9Y8yP0TyQJq1pptwFdYtuGQZnJ
 eBJqwEIKBJsPUWkSOyIzgZEjzksHlG/+6prvgYT66pW5rzayRrDkxPTh7V1GDQVDqLdJ
 PpJUTwVPB614ol0wUCW/+YV3nvK9H+fB07fd0mhEaHxnLZEk02l1B+PGv77g0sHClb4S
 hemQ==
X-Gm-Message-State: AOAM532gnd7I64kkKBlgwpRRvZdR/8LxVqtbWKRF+/XrRNFYLo+pZXT7
 Lm9N82OuiXtuS0oCu3OpNyQ=
X-Google-Smtp-Source: ABdhPJzJAeshG5IRKQg9Bvvde+tqiLbqvGzc3m92IPtn4nnhwAhZv5QtPmyq1EgktS/7HzU/A+/b+Q==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr10597553wrr.92.1626419208841; 
 Fri, 16 Jul 2021 00:06:48 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:2fac:d5d6:ea74:5e3c])
 by smtp.gmail.com with ESMTPSA id n18sm8607790wrt.89.2021.07.16.00.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 00:06:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Felix.Kuehling@amd.com
Subject: [PATCH] drm/ttm: revert "Fix COW check"
Date: Fri, 16 Jul 2021 09:06:47 +0200
Message-Id: <20210716070647.1274-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 85fd4a8a84316166640102676a356755ddec80e0.

Daniel pointed out that even PROT_READ can cause a BUG_ON() with this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 +--
 drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 +--
 drivers/gpu/drm/radeon/radeon_gem.c      |  3 +--
 drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +-------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 -
 include/drm/ttm/ttm_bo_api.h             |  4 ----
 6 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 0d65c9d2144e..9cf4beaf646c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -79,8 +79,7 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
 	.fault = amdgpu_gem_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access,
-	.mprotect = ttm_bo_vm_mprotect
+	.access = ttm_bo_vm_access
 };
 
 static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 164ea564bb7a..5b27845075a1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -70,8 +70,7 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
 	.fault = nouveau_ttm_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access,
-	.mprotect = ttm_bo_vm_mprotect
+	.access = ttm_bo_vm_access
 };
 
 void
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index c19ad07eb7b5..458f92a70887 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -77,8 +77,7 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
 	.fault = radeon_gem_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access,
-	.mprotect = ttm_bo_vm_mprotect
+	.access = ttm_bo_vm_access
 };
 
 static void radeon_gem_object_free(struct drm_gem_object *gobj)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index fb325bad5db6..f56be5bc0861 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -542,29 +542,17 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(ttm_bo_vm_access);
 
-int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
-		       unsigned long end, unsigned long newflags)
-{
-	/* Enforce no COW since would have really strange behavior with it. */
-	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
-		return -EINVAL;
-
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_vm_mprotect);
-
 static const struct vm_operations_struct ttm_bo_vm_ops = {
 	.fault = ttm_bo_vm_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
 	.access = ttm_bo_vm_access,
-	.mprotect = ttm_bo_vm_mprotect,
 };
 
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 {
 	/* Enforce no COW since would have really strange behavior with it. */
-	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
+	if (is_cow_mapping(vma->vm_flags))
 		return -EINVAL;
 
 	ttm_bo_get(bo);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index e4bf7dc99320..e6b1f98ec99f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -61,7 +61,6 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 		.fault = vmw_bo_vm_fault,
 		.open = ttm_bo_vm_open,
 		.close = ttm_bo_vm_close,
-		.mprotect = ttm_bo_vm_mprotect,
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 		.huge_fault = vmw_bo_vm_huge_fault,
 #endif
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 40eb95875355..f681bbdbc698 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -605,10 +605,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
 
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
-
-int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
-		       unsigned long end, unsigned long newflags);
-
 bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
 
 vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
-- 
2.25.1

