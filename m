Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480688868E6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADDF10F150;
	Fri, 22 Mar 2024 09:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PTbt29aA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E50410EF03
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:12:42 +0000 (UTC)
X-UUID: 52659102e82c11eeb8927bc1f75efef4-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IxfoSJRgtLM7Y9Q8+5O2pEW6twqTFjA7H0y0agURdlM=; 
 b=PTbt29aAjclZnqm2MvdSf0ACTqLT2U2zJ/dKAuQKDFsSEO/batrRzX3PScEs3c/jUBstBHAl4yj/uS6/ys6w9TsH/lS40af2OSiQablSghYj0qwh/IXsE2HL6PyGI3QzM0dvrS1kdliMD+O9JM8xWOaEf8yWisgkQPTmYbZa5ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:77b5a9d6-b80e-4ba5-a8cf-529000a40c47, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:101bcf81-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 52659102e82c11eeb8927bc1f75efef4-20240322
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 135413291; Fri, 22 Mar 2024 17:12:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:12:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:12:34 +0800
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
Subject: [PATCH v5 05/14] drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
Date: Fri, 22 Mar 2024 17:12:23 +0800
Message-ID: <20240322091232.26387-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322091232.26387-1-shawn.sung@mediatek.com>
References: <20240322091232.26387-1-shawn.sung@mediatek.com>
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

Rename all "mtk_drm_hdmi" to "mtk_hdmi":
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 86133bf16326b..d2876da1b43a7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1687,7 +1687,7 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	return 0;
 }
 
-static int mtk_drm_hdmi_probe(struct platform_device *pdev)
+static int mtk_hdmi_probe(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi;
 	struct device *dev = &pdev->dev;
@@ -1746,7 +1746,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void mtk_drm_hdmi_remove(struct platform_device *pdev)
+static void mtk_hdmi_remove(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
 
@@ -1790,7 +1790,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
 	.cea_modes_only = true,
 };
 
-static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
+static const struct of_device_id mtk_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi",
 	  .data = &mtk_hdmi_conf_mt2701,
 	},
@@ -1801,14 +1801,14 @@ static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
+MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
 
 static struct platform_driver mtk_hdmi_driver = {
-	.probe = mtk_drm_hdmi_probe,
-	.remove_new = mtk_drm_hdmi_remove,
+	.probe = mtk_hdmi_probe,
+	.remove_new = mtk_hdmi_remove,
 	.driver = {
 		.name = "mediatek-drm-hdmi",
-		.of_match_table = mtk_drm_hdmi_of_ids,
+		.of_match_table = mtk_hdmi_of_ids,
 		.pm = &mtk_hdmi_pm_ops,
 	},
 };
-- 
2.18.0

