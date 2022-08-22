Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381A59BA0F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 09:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A139A7F9;
	Mon, 22 Aug 2022 07:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F17697ACB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 03:33:34 +0000 (UTC)
X-UUID: 01e0c3cbe4b5473d83e80ca29c423c83-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=D/KhD930ivkhssWQuYiLC7xkUq58KTNjSrLVUE3svu0=; 
 b=jP6N0FyPKsC0/S3/Q+RMWY70Fnmn8oE4Z19lqMy7TrMCj/h5FDULZKM0tIWDmQ4Say14Mnu1xvuVgK/quxZjqUd23b8BJIWmcZUISCXm+VdOKGmc+Mi163ZNyCJYh4DEalgLDWMgDTFc/QhSSljr8Mi43a58jfCMl00u3P3lRgE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:378e71c3-8ba6-4848-948c-722787ad9570, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18, CLOUDID:0f5fe067-a9d9-4672-a3c8-12721739a220,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 01e0c3cbe4b5473d83e80ca29c423c83-20220822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1999010131; Mon, 22 Aug 2022 11:33:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 11:33:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 22 Aug 2022 11:33:26 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v1 4/4] drm/mediatek: add mediatek-drm of vdosys0 support for
 mt8188
Date: Mon, 22 Aug 2022 11:32:13 +0800
Message-ID: <20220822033213.15769-5-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220822033213.15769-1-nathan.lu@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 22 Aug 2022 07:10:42 +0000
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
Cc: Nathan Lu <nathan.lu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 wsd_upstream@mediatek.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 amy zhang <Amy.Zhang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Lu <nathan.lu@mediatek.com>

add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.

Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d72263c8a621..260514006093 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -178,6 +178,18 @@ static const unsigned int mt8186_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const unsigned int mt8188_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DP_INTF0,
+};
+
 static const unsigned int mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
@@ -323,6 +335,20 @@ static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
 	},
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
+	.io_start = 0x1c01d000,
+	.main_path = mt8188_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
+	.mmsys_dev_num = 1,
+};
+
+static const struct mtk_mmsys_match_data mt8188_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8188_vdosys0_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -376,6 +402,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8183_mmsys_match_data},
 	{ .compatible = "mediatek,mt8186-mmsys",
 	  .data = &mt8186_mmsys_match_data},
+	{ .compatible = "mediatek,mt8188-mmsys",
+	  .data = &mt8188_mmsys_match_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_match_data},
 	{ .compatible = "mediatek,mt8195-mmsys",
@@ -734,6 +762,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8186-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8188-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
-- 
2.18.0

