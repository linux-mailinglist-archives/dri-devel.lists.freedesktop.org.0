Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED1812771
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 06:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFFA10E8DD;
	Thu, 14 Dec 2023 05:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087F910E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 05:58:58 +0000 (UTC)
X-UUID: dbd022209a4511eea5db2bebc7c28f94-20231214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8S2d21cmO3xaci7wXze3lXR/Y1B6d9S0oT9RnOxcLo8=; 
 b=dslwdWuq2/Wi721aLL/hVsToIIUakO5ny7iRZpyxaUXQRfWqevVjZsuB9mrSGMyc3fN4l5b749aTwG83spaBNyzqxVVqxx3YhelCZiraIxQb6vMPDwr9it8Suy/f1ZBUFVjgN9S3KkBCnrIETqboSKGw9UZ4LAcRYcG997PTtew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:085d0847-98dd-4d33-aef2-b75dde4f86e2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:65bfa7fd-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dbd022209a4511eea5db2bebc7c28f94-20231214
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1263582547; Thu, 14 Dec 2023 13:58:52 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Dec 2023 13:58:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Dec 2023 13:58:51 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
Subject: [PATCH v12 17/23] drm/mediatek: Refine device table of OVL adaptor
Date: Thu, 14 Dec 2023 13:58:41 +0800
Message-ID: <20231214055847.4936-18-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231214055847.4936-1-shawn.sung@mediatek.com>
References: <20231214055847.4936-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.635000-8.000000
X-TMASE-MatchedRID: j34N8PQvhP8eszLHPCQb9B+WEMjoO9WWCt59Uh3p/NVcKZwALwMGs0fp
 kQx2u0Ks+qmOSYkzMxknOAFYLaUTjQDNPxu11HXj4pdq9sdj8LV9LQinZ4QefPcjNeVeWlqY+gt
 Hj7OwNO1YDuIRWpqxhlN2D/LzWZyyhp22LCZ7ETnRPgiaEFLtWkFM85dtOQqm9Q4GUjgpNXoJdg
 PAp93UyTJYyXpvkuIMBxzwRVqK+uz2GgKEOOpZ4XZrUbEZipAEiWT09mQz7szw9kH8zAy44SIdu
 k5Jkjd3wL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.635000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 952E2208B14AFADEEBEF7866C3BF6348F5FAD09736BB2B83F6A687F297CF69C72000:8
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, xinlei lee <xinlei.lee@mediatek.com>,
 "Roy-CW .
 Yeh" <roy-cw.yeh@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Nathan Lu <nathan.lu@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 Moudy Ho <moudy.ho@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Adjust indentation to align with other files
- Sort device table in alphabetical order
- Add sentinel to device table

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 30f2475d1c0b..92eeb1005ec3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -437,17 +437,10 @@ static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
 }
 
 static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
-	{
-		.compatible = "mediatek,mt8195-vdo1-rdma",
-		.data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA,
-	}, {
-		.compatible = "mediatek,mt8195-disp-merge",
-		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
-	}, {
-		.compatible = "mediatek,mt8195-disp-ethdr",
-		.data = (void *)OVL_ADAPTOR_TYPE_ETHDR,
-	},
-	{},
+	{ .compatible = "mediatek,mt8195-disp-ethdr", .data = (void *)OVL_ADAPTOR_TYPE_ETHDR },
+	{ .compatible = "mediatek,mt8195-disp-merge", .data = (void *)OVL_ADAPTOR_TYPE_MERGE },
+	{ .compatible = "mediatek,mt8195-vdo1-rdma", .data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA },
+	{ /* sentinel */ }
 };
 
 static int compare_of(struct device *dev, void *data)
-- 
2.18.0

