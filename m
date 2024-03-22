Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921348864AF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 02:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8713311231C;
	Fri, 22 Mar 2024 01:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="INRXJfRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840A410FA67
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 01:28:19 +0000 (UTC)
X-UUID: 727f04f0e7eb11ee935d6952f98a51a9-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=85zG1qADj2+PeXUngB89OUIHW4WMQF1BST/UA49IDzQ=; 
 b=INRXJfRyviaPyu+ZRVu4JcQ9dIF4+faMhApOpGLANlr9BseajqFM2xQ/HWV8M21oG3i77un8oQx6rKVv/5Iq3QaDtXjbIlxu/jjYzXPKn8J9UzxyYW7WBEcvJ1sOdhAmvP8dugVZ5Rsy3EJosaaYmcnKBSH/ggyF9qUagrRSV8I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:74a4f2d2-441c-4360-9b3b-84b3cff16ed0, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:11184a85-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 727f04f0e7eb11ee935d6952f98a51a9-20240322
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 125205864; Fri, 22 Mar 2024 09:28:11 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 09:28:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 09:28:10 +0800
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
Subject: [PATCH v4 05/14] drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
Date: Fri, 22 Mar 2024 09:27:59 +0800
Message-ID: <20240322012808.26234-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322012808.26234-1-shawn.sung@mediatek.com>
References: <20240322012808.26234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.357600-8.000000
X-TMASE-MatchedRID: qR7vNmAOzjO4pD9RIlWSGjl/LoO+pjoA1cuIRwt/4Miaecho1pk4scbK
 +pu0ZYwRgaTV+OEAOBbnftxNodBrx9m0JHSAKf2wA9lly13c/gHt/okBLaEo+EdmDSBYfnJRWc2
 47K5p+pr3GaV8VXGJV8/waCk3L8d/L0W1btd8e56eAiCmPx4NwGmRqNBHmBve38LauI2fxt4qtq
 5d3cxkNUw65OcFb/QovhpqfDyLvY02XOWw623G3Ag0xexL31C5Aofc2t4ycLDAvpLE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.357600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E9A44EBA050DFB9B17BCA32670C3A5B53F5CEDFB898087CC66CE5D005E7D4A682000:8
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

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>
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

