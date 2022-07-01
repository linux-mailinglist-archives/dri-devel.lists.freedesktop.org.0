Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5B5629FC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 05:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5031010F490;
	Fri,  1 Jul 2022 03:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E129B10F457
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 03:58:57 +0000 (UTC)
X-UUID: 180f0af092a540b48c12432a02bccf0a-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:b7a238d5-287b-446f-9aec-fa6120162ef8, OB:10,
 L
 OB:30,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:90
X-CID-INFO: VERSION:1.1.7, REQID:b7a238d5-287b-446f-9aec-fa6120162ef8, OB:10,
 LOB
 :30,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:90
X-CID-META: VersionHash:87442a2, CLOUDID:d6804186-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:5fa2d257ca09,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 180f0af092a540b48c12432a02bccf0a-20220701
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1896174167; Fri, 01 Jul 2022 11:58:49 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 11:58:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 11:58:48 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Subject: [PATCH v15 14/16] drm/mediatek: dpi: add config to support direct
 connection to dpi panels
Date: Fri, 1 Jul 2022 11:58:43 +0800
Message-ID: <20220701035845.16458-15-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
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
 xinlei.lee@mediatek.com, liangxu.xu@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MediaTek dpi supports direct connection to dpi panels while dp_intf does not
support. Therefore, add a config "support_direct_pin" to control this.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0a604bf68b1b..a65b85c4c8d5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -124,6 +124,7 @@ struct mtk_dpi_yc_limit {
  * @is_ck_de_pol: Support CK/DE polarity.
  * @swap_input_support: Support input swap function.
  * @color_fmt_trans_support: Enable color format transfer.
+ * @support_direct_pin: IP supports direct connection to dpi panels.
  * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
  *		    (no shift).
  * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
@@ -141,6 +142,7 @@ struct mtk_dpi_conf {
 	bool is_ck_de_pol;
 	bool swap_input_support;
 	bool color_fmt_trans_support;
+	bool support_direct_pin;
 	u32 dimension_mask;
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
@@ -608,11 +610,13 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	mtk_dpi_config_channel_limit(dpi);
 	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
 	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
-	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 	mtk_dpi_config_color_format(dpi, dpi->color_format);
-	mtk_dpi_config_2n_h_fre(dpi);
-	mtk_dpi_dual_edge(dpi);
-	mtk_dpi_config_disable_edge(dpi);
+	if (dpi->conf->support_direct_pin) {
+		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
+		mtk_dpi_config_2n_h_fre(dpi);
+		mtk_dpi_dual_edge(dpi);
+		mtk_dpi_config_disable_edge(dpi);
+	}
 	mtk_dpi_sw_reset(dpi, false);
 
 	return 0;
@@ -870,6 +874,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
+	.support_direct_pin = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
@@ -886,6 +891,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
+	.support_direct_pin = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
@@ -901,6 +907,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
+	.support_direct_pin = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
@@ -916,6 +923,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
+	.support_direct_pin = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
-- 
2.18.0

