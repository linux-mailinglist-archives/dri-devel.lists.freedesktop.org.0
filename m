Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14476E4E6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 11:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFE210E0E9;
	Thu,  3 Aug 2023 09:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FC810E0E9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 09:48:52 +0000 (UTC)
X-UUID: f20af70c31e211eeb20a276fd37b9834-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2XaqHkbdPTknMNt7SVcGHj6FvZkYSNPTMPFGrbuNJ24=; 
 b=J0PYu39FkyvOnb8N/L62XHLGVaZSZke0wXYe/IVlkWHmYp9FE4f8Yt8SDRBFVvsfnMF2OBonEw+A7Qhi5Nd29NWp7ubSI8fTwGWd5V5R3Vk9ueBLaTvoIQrzG3wfTLsz72h6CaoD5jznojayeDQDbY6pxtKbIt+b2Keks2gA64A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:8013715c-2054-47f4-8130-5a464f5a6d70, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:1fcc6f8, CLOUDID:28b9a4d2-cd77-4e67-bbfd-aa4eaace762f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f20af70c31e211eeb20a276fd37b9834-20230803
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 424369562; Thu, 03 Aug 2023 17:48:48 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 17:48:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 17:48:47 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3] drm/mediatek: fix uninitialized symbol
Date: Thu, 3 Aug 2023 17:48:43 +0800
Message-ID: <20230803094843.4439-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Cc: singo.chang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, "Nancy
 . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fix Smatch static checker warning
  -Fix uninitialized symbol comp_pdev in mtk_ddp_comp_init.

Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
v3: fix reviewer comment in v2
v2: add Fixes tag
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index f114da4d36a9..771f4e173353 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -563,14 +563,15 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	/* Not all drm components have a DTS device node, such as ovl_adaptor,
 	 * which is the drm bring up sub driver
 	 */
-	if (node) {
-		comp_pdev = of_find_device_by_node(node);
-		if (!comp_pdev) {
-			DRM_INFO("Waiting for device %s\n", node->full_name);
-			return -EPROBE_DEFER;
-		}
-		comp->dev = &comp_pdev->dev;
+	if (!node)
+		return 0;
+
+	comp_pdev = of_find_device_by_node(node);
+	if (!comp_pdev) {
+		DRM_INFO("Waiting for device %s\n", node->full_name);
+		return -EPROBE_DEFER;
 	}
+	comp->dev = &comp_pdev->dev;
 
 	if (type == MTK_DISP_AAL ||
 	    type == MTK_DISP_BLS ||
@@ -580,7 +581,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_MERGE ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
-	    type == MTK_DISP_OVL_ADAPTOR ||
 	    type == MTK_DISP_PWM ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DPI ||
-- 
2.18.0

