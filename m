Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3355310C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 13:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219CA10FA33;
	Tue, 21 Jun 2022 11:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8688910E3E5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:37:41 +0000 (UTC)
X-UUID: fb7111985ac9477e9d46e304947d2ae6-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:5ff5ad3f-8a59-4001-a62b-0b13f2f7d8da, OB:10,
 L
 OB:20,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:100
X-CID-INFO: VERSION:1.1.6, REQID:5ff5ad3f-8a59-4001-a62b-0b13f2f7d8da, OB:10,
 LOB
 :20,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:100
X-CID-META: VersionHash:b14ad71, CLOUDID:a223a62d-1756-4fa3-be7f-474a6e4be921,
 C
 OID:efe3ace09479,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: fb7111985ac9477e9d46e304947d2ae6-20220621
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 827396421; Tue, 21 Jun 2022 19:37:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 21 Jun 2022 19:37:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 21 Jun 2022 19:37:34 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Subject: [PATCH v13 07/14] drm/mediatek: dpi: move hvsize_mask to SoC config
Date: Tue, 21 Jun 2022 19:37:25 +0800
Message-ID: <20220621113732.11595-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guillaume Ranquet <granquet@baylibre.com>

Add flexibility by moving the hvsize mask to SoC specific config.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 2cc6f1339024..e1aa62f0e763 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -130,6 +130,7 @@ struct mtk_dpi_yc_limit {
  * @swap_input_support: Support input swap function.
  * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
  *		    (no shift).
+ * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -141,6 +142,7 @@ struct mtk_dpi_conf {
 	bool is_ck_de_pol;
 	bool swap_input_support;
 	u32 dimension_mask;
+	u32 hvsize_mask;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -254,8 +256,10 @@ static void mtk_dpi_config_interface(struct mtk_dpi *dpi, bool inter)
 
 static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
 {
-	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
-	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
+	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
+		     dpi->conf->hvsize_mask << HSIZE);
+	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
+		     dpi->conf->hvsize_mask << VSIZE);
 }
 
 static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
@@ -836,6 +840,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
@@ -848,6 +853,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
@@ -859,6 +865,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 };
 
 static const struct mtk_dpi_conf mt8192_conf = {
@@ -870,6 +877,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.18.0

