Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB00812773
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 06:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003A810E8DE;
	Thu, 14 Dec 2023 05:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6F410E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 05:58:59 +0000 (UTC)
X-UUID: dbaffcca9a4511eeba30773df0976c77-20231214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/yYgQiczFMpD8DsL+mzzDtOl5UWeuWut/sjQrSzr1Mk=; 
 b=E1JqRRltPfsbBn6tqOvqxS1o8DIerlEfKOxWouWtgFYmX8yk1NcaVdKYwTobmuAtD3X3HnmOp/x3KpEUnEK6wEA8BNKVqscZIza25YerkonXnjnxFoe0E+ht2MnaVeF5Xphm0fd5IEQIfV920FEPrZbl8o045ZWRr83N4+jcw6g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:fa23a66d-1dfb-4c66-865d-45b313724e12, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:c3fc2e61-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dbaffcca9a4511eeba30773df0976c77-20231214
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 359669615; Thu, 14 Dec 2023 13:58:52 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Dec 2023 13:58:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Dec 2023 13:58:50 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
Subject: [PATCH v12 16/23] drm/mediatek: Sort OVL adaptor components
Date: Thu, 14 Dec 2023 13:58:40 +0800
Message-ID: <20231214055847.4936-17-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231214055847.4936-1-shawn.sung@mediatek.com>
References: <20231214055847.4936-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.633600-8.000000
X-TMASE-MatchedRID: 5Qnv9kTQNcml84HKYQ35vJJAa1C/+FcuEbxKVXd70tXfUZT83lbkELEw
 JWI3UXVeT/ci3LQKeFGkV7miV6Ja8bUN8Yzp1vtfngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSq
 bxBgG0w5E8rSfDOWT2RMHgouRtGVbTnwj5hUCtikB86aGUFdBr5bhOnJ+8/oSsXaT2tNlqw08A1
 QAXq/03DKXuQGHT4giS1Ju9fOXZhx5lSmbrC6fdtr/To2FgNrjDLMIOOVTHz12N6Rg5qIpOg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.633600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6260211755336ED92CF40E3BA0C8F7C268554E7A25B83276A49AB86A1DB19F4C2000:8
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

Sort OVL adaptor components' names in alphabetical order.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 65c5153bdcd8..30f2475d1c0b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -27,13 +27,14 @@
 #define MTK_OVL_ADAPTOR_LAYER_NUM 4
 
 enum mtk_ovl_adaptor_comp_type {
-	OVL_ADAPTOR_TYPE_MDP_RDMA = 0,
-	OVL_ADAPTOR_TYPE_MERGE,
 	OVL_ADAPTOR_TYPE_ETHDR,
+	OVL_ADAPTOR_TYPE_MDP_RDMA,
+	OVL_ADAPTOR_TYPE_MERGE,
 	OVL_ADAPTOR_TYPE_NUM,
 };
 
 enum mtk_ovl_adaptor_comp_id {
+	OVL_ADAPTOR_ETHDR0,
 	OVL_ADAPTOR_MDP_RDMA0,
 	OVL_ADAPTOR_MDP_RDMA1,
 	OVL_ADAPTOR_MDP_RDMA2,
@@ -46,7 +47,6 @@ enum mtk_ovl_adaptor_comp_id {
 	OVL_ADAPTOR_MERGE1,
 	OVL_ADAPTOR_MERGE2,
 	OVL_ADAPTOR_MERGE3,
-	OVL_ADAPTOR_ETHDR0,
 	OVL_ADAPTOR_ID_MAX
 };
 
@@ -64,9 +64,9 @@ struct mtk_disp_ovl_adaptor {
 };
 
 static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
+	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
 	[OVL_ADAPTOR_TYPE_MDP_RDMA]	= "vdo1-rdma",
 	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
-	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
 };
 
 static const struct mtk_ddp_comp_funcs ethdr = {
@@ -89,6 +89,7 @@ static const struct mtk_ddp_comp_funcs rdma = {
 };
 
 static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
+	[OVL_ADAPTOR_ETHDR0] = { OVL_ADAPTOR_TYPE_ETHDR, DDP_COMPONENT_ETHDR_MIXER, 0, &ethdr },
 	[OVL_ADAPTOR_MDP_RDMA0] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA0, 0, &rdma },
 	[OVL_ADAPTOR_MDP_RDMA1] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA1, 1, &rdma },
 	[OVL_ADAPTOR_MDP_RDMA2] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA2, 2, &rdma },
@@ -101,7 +102,6 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
 	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2, &merge },
 	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3, &merge },
 	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4, &merge },
-	[OVL_ADAPTOR_ETHDR0] = { OVL_ADAPTOR_TYPE_ETHDR, DDP_COMPONENT_ETHDR_MIXER, 0, &ethdr },
 };
 
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -399,6 +399,7 @@ void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
 
 void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsigned int next)
 {
+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
@@ -406,11 +407,11 @@ void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsig
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
-	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 }
 
 void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev, unsigned int next)
 {
+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
@@ -418,7 +419,6 @@ void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev, un
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
-	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 }
 
 static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
-- 
2.18.0

