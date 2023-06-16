Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CFB7328FD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 09:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8414C10E0B0;
	Fri, 16 Jun 2023 07:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7DB10E0B0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 07:36:45 +0000 (UTC)
X-UUID: 887ea5080c1811ee9cb5633481061a41-20230616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NxnEBQwkRhC30OSvz13RBHmSVv8KkGyGLWkMchMmH/w=; 
 b=SOYW/bamjr8uqTSv4bDXayg7TfHRJOfM5TXJjwkHYVMpDPMWI2wfRMwY01FPma3YjwLOC5ZMk6rIlq5SITijpc6pkWzKeVhjpz+pkYnqOq4N0Pxv2WU+EshCiBgWdoT5u2MLPX7WA9X+Mi/zHZN5uPxtr+/oQUdqIhDDVCKa+7o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:d98d734b-e290-4a66-86ae-e8d63f1c6bab, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.26, REQID:d98d734b-e290-4a66-86ae-e8d63f1c6bab, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:cb9a4e1, CLOUDID:553bd23e-7aa7-41f3-a6bd-0433bee822f3,
 B
 ulkID:230616153641FV2FJW8E,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|38,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_ASC,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: 887ea5080c1811ee9cb5633481061a41-20230616
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1037265942; Fri, 16 Jun 2023 15:36:40 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Jun 2023 15:36:39 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Jun 2023 15:36:38 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Subject: [PATCH v2,2/3] drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
Date: Fri, 16 Jun 2023 15:36:58 +0800
Message-ID: <20230616073659.26536-3-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616073659.26536-1-shuijing.li@mediatek.com>
References: <20230616073659.26536-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the compatible because there are different definitions for cmdq
register bit control in mt8188.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c     | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6dcb4ba2466c..0070894d0148 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -764,6 +764,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8186-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8188-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..500a3054282d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1208,6 +1208,12 @@ static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
 	.has_size_ctl = true,
 };
 
+static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
+	.reg_cmdq_off = 0xd00,
+	.has_shadow_ctl = true,
+	.has_size_ctl = true,
+};
+
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = &mt2701_dsi_driver_data },
@@ -1217,6 +1223,8 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	  .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi",
 	  .data = &mt8186_dsi_driver_data },
+	{ .compatible = "mediatek,mt8188-dsi",
+	  .data = &mt8188_dsi_driver_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
-- 
2.40.1

