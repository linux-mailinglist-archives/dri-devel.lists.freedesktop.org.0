Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941098809B5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 03:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1379710FACE;
	Wed, 20 Mar 2024 02:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="eKnUODcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F5610E2FA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 02:42:34 +0000 (UTC)
X-UUID: 7c5b436ee66311eeb8927bc1f75efef4-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+Y7pDLy2z70oqV69Qv4vjpLNsRfJ8vJYpMU0Qdno7FQ=; 
 b=eKnUODcVsoR3TpfC3IP11bfThoG9xpiTOvAryUWJGfSBsL3zmfwTduB7kYEMourqhFI+H/YQ5/kn2QaaLTDVe4WVgO2MxH/dTIJ2/STyKLmN6x8jPKs5yceYTITHYFwl4YQ3QHQVI6/hHhzb48xxb/ER8NyEG7EdGWFQ5jc7/uQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:f76d76c1-a820-4bdd-97e1-257da3b2e5bb, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:894e1800-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7c5b436ee66311eeb8927bc1f75efef4-20240320
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2076849067; Wed, 20 Mar 2024 10:42:25 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 10:42:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 10:42:24 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v3 04/14] drm/mediatek: Rename "mtk_drm_gem" to "mtk_gem"
Date: Wed, 20 Mar 2024 10:42:12 +0800
Message-ID: <20240320024222.14234-5-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320024222.14234-1-shawn.sung@mediatek.com>
References: <20240320024222.14234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename all "mtk_drm_gem" to "mtk_gem":
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  8 +--
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   | 63 ++++++++++++------------
 drivers/gpu/drm/mediatek/mtk_drm_gem.h   | 23 +++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c |  2 +-
 4 files changed, 47 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c46773569b3c9..81e8aa65abd6d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -576,8 +576,8 @@ DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
  * We need to override this because the device used to import the memory is
  * not dev->dev, as drm_gem_prime_import() expects.
  */
-static struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
-						       struct dma_buf *dma_buf)
+static struct drm_gem_object *mtk_gem_prime_import(struct drm_device *dev,
+						   struct dma_buf *dma_buf)
 {
 	struct mtk_drm_private *private = dev->dev_private;

@@ -587,9 +587,9 @@ static struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
 static const struct drm_driver mtk_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,

-	.dumb_create = mtk_drm_gem_dumb_create,
+	.dumb_create = mtk_gem_dumb_create,

-	.gem_prime_import = mtk_drm_gem_prime_import,
+	.gem_prime_import = mtk_gem_prime_import,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
 	.fops = &mtk_drm_fops,

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 4f2e3feabc0f8..445fd8a8b8988 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -14,26 +14,26 @@
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"

-static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
+static int mtk_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);

 static const struct vm_operations_struct vm_ops = {
 	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
 };

-static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
-	.free = mtk_drm_gem_free_object,
+static const struct drm_gem_object_funcs mtk_gem_object_funcs = {
+	.free = mtk_gem_free_object,
 	.get_sg_table = mtk_gem_prime_get_sg_table,
-	.vmap = mtk_drm_gem_prime_vmap,
-	.vunmap = mtk_drm_gem_prime_vunmap,
-	.mmap = mtk_drm_gem_object_mmap,
+	.vmap = mtk_gem_prime_vmap,
+	.vunmap = mtk_gem_prime_vunmap,
+	.mmap = mtk_gem_object_mmap,
 	.vm_ops = &vm_ops,
 };

-static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
-						unsigned long size)
+static struct mtk_gem_obj *mtk_gem_init(struct drm_device *dev,
+					unsigned long size)
 {
-	struct mtk_drm_gem_obj *mtk_gem_obj;
+	struct mtk_gem_obj *mtk_gem_obj;
 	int ret;

 	size = round_up(size, PAGE_SIZE);
@@ -42,7 +42,7 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 	if (!mtk_gem_obj)
 		return ERR_PTR(-ENOMEM);

-	mtk_gem_obj->base.funcs = &mtk_drm_gem_object_funcs;
+	mtk_gem_obj->base.funcs = &mtk_gem_object_funcs;

 	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
 	if (ret < 0) {
@@ -54,15 +54,15 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 	return mtk_gem_obj;
 }

-struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
-					   size_t size, bool alloc_kmap)
+struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev,
+				   size_t size, bool alloc_kmap)
 {
 	struct mtk_drm_private *priv = dev->dev_private;
-	struct mtk_drm_gem_obj *mtk_gem;
+	struct mtk_gem_obj *mtk_gem;
 	struct drm_gem_object *obj;
 	int ret;

-	mtk_gem = mtk_drm_gem_init(dev, size);
+	mtk_gem = mtk_gem_init(dev, size);
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);

@@ -97,9 +97,9 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
 	return ERR_PTR(ret);
 }

-void mtk_drm_gem_free_object(struct drm_gem_object *obj)
+void mtk_gem_free_object(struct drm_gem_object *obj)
 {
-	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
+	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct mtk_drm_private *priv = obj->dev->dev_private;

 	if (mtk_gem->sg)
@@ -114,10 +114,10 @@ void mtk_drm_gem_free_object(struct drm_gem_object *obj)
 	kfree(mtk_gem);
 }

-int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
-			    struct drm_mode_create_dumb *args)
+int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
+			struct drm_mode_create_dumb *args)
 {
-	struct mtk_drm_gem_obj *mtk_gem;
+	struct mtk_gem_obj *mtk_gem;
 	int ret;

 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
@@ -130,7 +130,7 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	args->size = args->pitch;
 	args->size *= args->height;

-	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
+	mtk_gem = mtk_gem_create(dev, args->size, false);
 	if (IS_ERR(mtk_gem))
 		return PTR_ERR(mtk_gem);

@@ -148,16 +148,16 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	return 0;

 err_handle_create:
-	mtk_drm_gem_free_object(&mtk_gem->base);
+	mtk_gem_free_object(&mtk_gem->base);
 	return ret;
 }

-static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
-				   struct vm_area_struct *vma)
+static int mtk_gem_object_mmap(struct drm_gem_object *obj,
+			       struct vm_area_struct *vma)

 {
 	int ret;
-	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
+	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct mtk_drm_private *priv = obj->dev->dev_private;

 	/*
@@ -188,7 +188,7 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
  */
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
-	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
+	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct mtk_drm_private *priv = obj->dev->dev_private;
 	struct sg_table *sgt;
 	int ret;
@@ -212,7 +212,7 @@ struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
 struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg)
 {
-	struct mtk_drm_gem_obj *mtk_gem;
+	struct mtk_gem_obj *mtk_gem;

 	/* check if the entries in the sg_table are contiguous */
 	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
@@ -220,7 +220,7 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 	}

-	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
+	mtk_gem = mtk_gem_init(dev, attach->dmabuf->size);
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);

@@ -230,9 +230,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 	return &mtk_gem->base;
 }

-int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+int mtk_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
-	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
+	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct sg_table *sgt = NULL;
 	unsigned int npages;

@@ -270,10 +270,9 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	return 0;
 }

-void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
-			      struct iosys_map *map)
+void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
-	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
+	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	void *vaddr = map->vaddr;

 	if (!mtk_gem->pages)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
index 78f23b07a02e2..66e5f154f6980 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015 MediaTek Inc.
  */

-#ifndef _MTK_DRM_GEM_H_
-#define _MTK_DRM_GEM_H_
+#ifndef _MTK_GEM_H_
+#define _MTK_GEM_H_

 #include <drm/drm_gem.h>

@@ -22,7 +22,7 @@
  * P.S. this object would be transferred to user as kms_bo.handle so
  *	user can access the buffer through kms_bo.handle.
  */
-struct mtk_drm_gem_obj {
+struct mtk_gem_obj {
 	struct drm_gem_object	base;
 	void			*cookie;
 	void			*kvaddr;
@@ -32,18 +32,17 @@ struct mtk_drm_gem_obj {
 	struct page		**pages;
 };

-#define to_mtk_gem_obj(x)	container_of(x, struct mtk_drm_gem_obj, base)
+#define to_mtk_gem_obj(x) container_of(x, struct mtk_gem_obj, base)

-void mtk_drm_gem_free_object(struct drm_gem_object *gem);
-struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev, size_t size,
-					   bool alloc_kmap);
-int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
-			    struct drm_mode_create_dumb *args);
+void mtk_gem_free_object(struct drm_gem_object *gem);
+struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev, size_t size,
+				   bool alloc_kmap);
+int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
+			struct drm_mode_create_dumb *args);
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg);
-int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
-void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
-			      struct iosys_map *map);
+int mtk_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
+void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);

 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 43137c46fc148..db63a32c407e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -135,7 +135,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 {
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_object *gem;
-	struct mtk_drm_gem_obj *mtk_gem;
+	struct mtk_gem_obj *mtk_gem;
 	unsigned int pitch, format;
 	u64 modifier;
 	dma_addr_t addr;
--
2.18.0

