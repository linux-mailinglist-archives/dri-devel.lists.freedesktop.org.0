Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFF6DA911
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 08:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FD810ECD0;
	Fri,  7 Apr 2023 06:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294A810E819
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 06:47:05 +0000 (UTC)
X-UUID: ff4d990ed50f11eda9a90f0bb45854f4-20230407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QZ37W9OSn/D1U5UFhTl3GS1/1Rs+rsZ86abCpxFX95M=; 
 b=W+7sCR7RHN0QSPFoId1OKO77tdoJXMTW6PeAbDPbIP0ahCHVg8jBJyPfu7G7iRNht/aXVmztqnLecCGCQ+ePpeRwHxqNzL72puYnVXa0aa91tDa5row4coUBGKjXAv6g9W2H+Yb7hD/9E247r0tjFTuXnJCNOi6J65J22dOf0Os=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:30eb857e-54f0-4ca4-ac87-f9cd0e26bfb4, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:120426c, CLOUDID:b77b9c2a-564d-42d9-9875-7c868ee415ec,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: ff4d990ed50f11eda9a90f0bb45854f4-20230407
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1673628554; Fri, 07 Apr 2023 14:47:00 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 14:46:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 14:46:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/5] drm/mediatek: Add casting before assign
Date: Fri, 7 Apr 2023 14:46:56 +0800
Message-ID: <20230407064657.12350-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
References: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add casting before assign to avoid the unintentional integer overflow
or unintended sign extension.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9b8f72ed12e4..537e83b95001 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -121,7 +121,7 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	int ret;
 
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	args->size = (unsigned long)args->pitch * args->height;
 
 	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
 	if (IS_ERR(mtk_gem))
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 31f9420aff6f..a1337f386bbf 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -140,7 +140,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_object *gem;
 	struct mtk_drm_gem_obj *mtk_gem;
-	unsigned int pitch, format;
+	unsigned int pitch, format, cpp;
 	u64 modifier;
 	dma_addr_t addr;
 	dma_addr_t hdr_addr = 0;
@@ -151,11 +151,12 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	addr = mtk_gem->dma_addr;
 	pitch = fb->pitches[0];
 	format = fb->format->format;
+	cpp = (unsigned int)fb->format->cpp[0];
 	modifier = fb->modifier;
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR) {
-		addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
-		addr += (new_state->src.y1 >> 16) * pitch;
+		addr += (dma_addr_t)(new_state->src.x1 >> 16) * cpp;
+		addr += (dma_addr_t)(new_state->src.y1 >> 16) * pitch;
 	} else {
 		int width_in_blocks = ALIGN(fb->width, AFBC_DATA_BLOCK_WIDTH)
 				      / AFBC_DATA_BLOCK_WIDTH;
@@ -167,17 +168,18 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 
 		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
 		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
-			AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
+			AFBC_DATA_BLOCK_HEIGHT * cpp;
 
 		hdr_size = ALIGN(hdr_pitch * height_in_blocks, AFBC_HEADER_ALIGNMENT);
 
-		hdr_addr = addr + hdr_pitch * y_offset_in_blocks +
-			   AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
+		hdr_addr = addr +
+			   (dma_addr_t)hdr_pitch * y_offset_in_blocks +
+			   (dma_addr_t)AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
 		/* The data plane is offset by 1 additional block. */
 		addr = addr + hdr_size +
-		       pitch * y_offset_in_blocks +
-		       AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
-		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
+		       (dma_addr_t)pitch * y_offset_in_blocks +
+		       (dma_addr_t)AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
+		       (dma_addr_t)cpp * (x_offset_in_blocks + 1);
 	}
 
 	mtk_plane_state->pending.enable = true;
-- 
2.18.0

