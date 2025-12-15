Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9269CBC043
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 21:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58D010E036;
	Sun, 14 Dec 2025 20:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dppDmq23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B8610E036
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 20:59:19 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7bb3092e4d7so2937783b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 12:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765745959; x=1766350759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kf8/6K2teDNVpRcuyX4Rd2wH3CZRe6Wcte8AE2g3GNQ=;
 b=dppDmq23nIS+zVigzn4i58GS929nNLCbAKzeBwJGeOZetbIothl5BPSCY2qlumjqhQ
 IeYKrXrqskpvy/TgGG+yBvp3RKWnaBmMOcp6qNOf3++TJKeuVm4i3e7fXJ5kyCx+K9Nd
 HTkog0UgwXKkjMvw4hnB887kxCN9rSGPa7gRlVxmRQJlq+Wcpgi2rMGNvsDDF5mDRx8h
 BFt/TgvU4u3Ioxdq+uBvRhPFDN3shf60BRfjkCjkgoox5BBSk4LEknsZxu5AsTf/7gln
 LId4UA+qzZDYin957LfsbkMjCY71/DxWKLtjTnO+BTARgE4EmjqH2RttN3q0No6j+wcP
 mGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765745959; x=1766350759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kf8/6K2teDNVpRcuyX4Rd2wH3CZRe6Wcte8AE2g3GNQ=;
 b=WFEvjAX89FOBDliZIs4Ma+YW+vZxVC6Jmj9yxBr/1VvAuaOWU6PVt5JbGWYvn3Q/Tn
 AhCTyHnbNoGwCbn59/yyNPtDPrCNzHjMzXM7bmKRUcBKZrMqi2MaqbDZCEnOZB/yexQW
 Mf06hbn9H8yeo0ErjleFassF7xV+lu8b7L5DZelPqwdmSG3nYmFTJpNNFxdZAtYFKo8N
 sLpetjjr9pQBMvyZ4LCIbka1obFyF2Yh+Z9doxT0o0ChkCAhPnuLVuqwx/cOCqiNjZ+N
 2jTGV1fCTv1tOXqu4wQyYg45k74JfLE0So/m9GtOlF0dYFKJwpXALVPl7VAGQsiuyIX5
 ltuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiDleTtmK/fFLxxZaPFAMtmGyQ4LRT9/txClZnybdeePZ1utBz8F18xxXfIeIXzo49j4Y3nOqkh5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbdBb9xOf+sSVFWJrI8Tn/U4mj7j1/TOacIM/YPsh8RsNrbpk9
 Kx1/Jr3qU/91ElozAXF5kq0MIU0VKkiTy+EoOYpO4kZHww5fW1pEzKWR
X-Gm-Gg: AY/fxX6bwCIJXdjLsQ6Nm28TIwLCIuVw3WcozBVww3lpxTMDiKJyjb9WN/ww2ahTsM4
 TsUgGEvsUC4vl64oLbnrWdGS8ZUnnOn+kEOWiCajapE9zS9oRsc7tJp2+7IaRaQc9Dq2vUjzgj9
 IHmsYPpmFeAHD93XGP2JJnT9toqiwcOvnIsm/Lyn1NwVkEigxryEF53lHJtLP459zyJXfUYt1My
 53ZyeNU0Sch62WNLA1CToepwKXEryqhlY+dFoADwXllb3YKYbky1YlAieQyMwfW3K/h3GxJXtjw
 py6kl8fDxZ0Taxb6ZmwL0mzrYv5KXvmCbysAkcgTVN5Ie2xD/6Gw+40L37X8k95pQcsA2WoN2pH
 2SPIAvRM+qFNCk1EkbcWaZaJAwDOhP4VzJs0Z/BTLIaoB8Zi8zXMHPWs+PYytjDEaynIfx2Glfv
 lP6X9tA593D/14zxT/Fr4=
X-Google-Smtp-Source: AGHT+IHF24o2Ly7Mr/lxjtc1FrISspaWeGMsZpBG3wLNV1EITlc6cCBdDneNg0BsjDKnEHLcA8k40Q==
X-Received: by 2002:a05:6a21:33a9:b0:363:b976:8f79 with SMTP id
 adf61e73a8af0-369b6aa5600mr9846654637.43.1765745958939; 
 Sun, 14 Dec 2025 12:59:18 -0800 (PST)
Received: from LilGuy ([2409:40c2:105b:dc88:1107:395c:23c0:2b1b])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-c0c2589d4f7sm10584880a12.3.2025.12.14.12.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 12:59:18 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] drm/msm: Replace custom dumb_map_offset with generic helper
Date: Mon, 15 Dec 2025 02:28:50 +0000
Message-ID: <20251215022850.12358-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
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

The msm driver implements a custom dumb_map_offset callback. This
implementation acquires the msm_gem_lock, but the underlying
drm_gem_create_mmap_offset() function is already thread-safe regarding
the VMA offset manager (it acquires the mgr->vm_lock internally).

Switching to the generic drm_gem_dumb_map_offset() helper provides
several benefits:
1. Removes the unnecessary locking overhead (locking leftovers).
2. Adds a missing check to reject mapping of imported objects, which is
   invalid for dumb buffers.
3. Allows for the removal of the msm_gem_dumb_map_offset() wrapper and
   the msm_gem_mmap_offset() helper function.

The logic from msm_gem_mmap_offset() has been inlined into
msm_ioctl_gem_info() to maintain functionality without the separate
helper.

This addresses the TODO:
"Documentation/gpu/todo.rst: Remove custom dumb_map_offset implementations"

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---

 Compile-tested only.

 drivers/gpu/drm/msm/msm_drv.c |  8 +++---
 drivers/gpu/drm/msm/msm_gem.c | 49 -----------------------------------
 drivers/gpu/drm/msm/msm_gem.h |  3 ---
 3 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100..bf20550c5814 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -588,7 +588,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,

 	switch (args->info) {
 	case MSM_INFO_GET_OFFSET:
-		args->value = msm_gem_mmap_offset(obj);
+		ret = drm_gem_create_mmap_offset(obj);
+		if (ret == 0)
+		    args->value = drm_vma_node_offset_addr(&obj->vma_node);
 		break;
 	case MSM_INFO_GET_IOVA:
 		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
@@ -836,7 +838,7 @@ static const struct drm_driver msm_driver = {
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.dumb_map_offset    = drm_gem_dumb_map_offset,
 	.gem_prime_import   = msm_gem_prime_import,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
@@ -859,7 +861,7 @@ static const struct drm_driver msm_kms_driver = {
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.dumb_map_offset    = drm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 017411a0bf45..da74f1413f94 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -375,34 +375,6 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	return ret;
 }

-/** get mmap offset */
-static uint64_t mmap_offset(struct drm_gem_object *obj)
-{
-	struct drm_device *dev = obj->dev;
-	int ret;
-
-	msm_gem_assert_locked(obj);
-
-	/* Make it mmapable */
-	ret = drm_gem_create_mmap_offset(obj);
-
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not allocate mmap offset\n");
-		return 0;
-	}
-
-	return drm_vma_node_offset_addr(&obj->vma_node);
-}
-
-uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
-{
-	uint64_t offset;
-
-	msm_gem_lock(obj);
-	offset = mmap_offset(obj);
-	msm_gem_unlock(obj);
-	return offset;
-}

 static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
 				    struct drm_gpuvm *vm)
@@ -730,27 +702,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
 }

-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset)
-{
-	struct drm_gem_object *obj;
-	int ret = 0;
-
-	/* GEM does all our handle to object mapping */
-	obj = drm_gem_object_lookup(file, handle);
-	if (obj == NULL) {
-		ret = -ENOENT;
-		goto fail;
-	}
-
-	*offset = msm_gem_mmap_offset(obj);
-
-	drm_gem_object_put(obj);
-
-fail:
-	return ret;
-}
-
 static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a4cf31853c50..92ada1d69250 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -262,7 +262,6 @@ struct msm_gem_object {
 void msm_gem_vma_get(struct drm_gem_object *obj);
 void msm_gem_vma_put(struct drm_gem_object *obj);

-uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
@@ -285,8 +284,6 @@ struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset);
 void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
--
2.52.0

