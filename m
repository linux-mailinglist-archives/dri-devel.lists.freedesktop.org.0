Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 503CD79A54F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1106410E128;
	Mon, 11 Sep 2023 08:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EC810E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 07:42:51 +0000 (UTC)
X-UUID: cd0561e2507611ee8051498923ad61e6-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fMa+ZJkDK3SkLwNybXA2bvBzPNfy+o5FInSRByphMB8=; 
 b=Djji97XwBsdoT6yECCEw+io5e7NoxgoLTCeH1ooh3OXE2m1C5Hy813Ne5YMexMwRsbgibbG1WnKS8kjRCGh1uS30W8pvbBBAsxaDgmccRVpQA0zY4jWcWA9Khx/JMiA5iRBxw3JsQMwi5HF1mIAEZMC8ii8CkAmcg8PemJKymAg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:bf162218-f85c-41f0-9987-6b59ed387bed, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:19a7e1c2-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd0561e2507611ee8051498923ad61e6-20230911
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 208520391; Mon, 11 Sep 2023 15:42:47 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 15:42:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 15:42:45 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH v6 13/20] drm/mediatek: Sort OVL adaptor components
Date: Mon, 11 Sep 2023 15:42:26 +0800
Message-ID: <20230911074233.31556-14-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230911074233.31556-1-shawn.sung@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.653600-8.000000
X-TMASE-MatchedRID: JT/cmNKTZHFiWV0DQ85LUkOLK43kW8U2rokbkfZgmroKogmGusPLb+Lk
 d6T+0Za3CPnYMmIYXkeiMK8QHx5jXEaWGOeKmQYQEhGH3CRdKUV9LQinZ4QefPcjNeVeWlqY+gt
 Hj7OwNO38o7Ys1NK4YyVSQmh/f0m6Iku//zydgwun7bQ6MQfhbq37g4bL9W/X
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.653600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 078F6C017C6D57601C53212D49E98A02215F7AC571507314E9CF32657DEAFB452000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 11 Sep 2023 08:04:25 +0000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, "Jason-JH
 . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sort OVL adaptor components' names in alphabetical order.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 4a5fab5ea51f..72758e41b1e6 100644
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

@@ -62,12 +62,13 @@ struct mtk_disp_ovl_adaptor {
 };

 static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
+	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
 	[OVL_ADAPTOR_TYPE_MDP_RDMA]	= "vdo1-rdma",
 	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
-	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
 };

 static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
+	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
 	[OVL_ADAPTOR_MDP_RDMA0]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 0 },
 	[OVL_ADAPTOR_MDP_RDMA1]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 1 },
 	[OVL_ADAPTOR_MDP_RDMA2]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 2 },
@@ -80,7 +81,6 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
 	[OVL_ADAPTOR_MERGE1]	= { OVL_ADAPTOR_TYPE_MERGE, 2 },
 	[OVL_ADAPTOR_MERGE2]	= { OVL_ADAPTOR_TYPE_MERGE, 3 },
 	[OVL_ADAPTOR_MERGE3]	= { OVL_ADAPTOR_TYPE_MERGE, 4 },
-	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
 };

 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -314,6 +314,7 @@ size_t mtk_ovl_adaptor_get_num_formats(struct device *dev)

 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
 {
+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
@@ -326,11 +327,11 @@ void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE2);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE3);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE4);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
 }

 void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
 {
+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
@@ -343,11 +344,11 @@ void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE2);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE3);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE4);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
 }

 void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsigned int next)
 {
+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
@@ -355,11 +356,11 @@ void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsig
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
@@ -367,7 +368,6 @@ void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev, un
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
-	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 }

 static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
--
2.18.0

