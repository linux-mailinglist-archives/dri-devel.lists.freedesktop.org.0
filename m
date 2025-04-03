Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C5AA7AB52
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BB810EB22;
	Thu,  3 Apr 2025 19:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pz7ykuaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0594C10EB21
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 19:19:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5BCC644BD8;
 Thu,  3 Apr 2025 19:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624F6C4CEE3;
 Thu,  3 Apr 2025 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707983;
 bh=zLt46B+AAlaR8pdBsVrhqeLOt1AMrXsIi5Wbr+Extjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pz7ykuaD1P1a+68DQDgJ4mvrpsHm8sD+yeGXrpxKEzn/XOvcaJtPQjUANjXABWYLv
 fD8OjDGXrC4j9DSPkbMni2wrqOyoCLYnUgdcDoNumwpfWE4StEFfpo1MNu6OB5eSQ+
 Nz92dBm9A/WLmY8SfMlL+jP1H2dJ5weBwUzhwjjdklXZRlLl/r5t7519a946rH7ktQ
 QViNgAKjI1TnGnsNittgPP+Ghtqas2Eb5jEFn/VNtPaMbzR6ZLIQ1v2iZLoqhH24H+
 jpnfrPpHGDg/j6ypZU/4GL5lEn9CmoKhcgcC5TkOJqV+SrvH6lsszAyW9DW8wbG1jr
 HzdkQ+t/vRpMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Sasha Levin <sashal@kernel.org>, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 13/20] drm/mediatek: mtk_dpi: Move the input_2p_en
 bit to platform data
Date: Thu,  3 Apr 2025 15:19:06 -0400
Message-Id: <20250403191913.2681831-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191913.2681831-1-sashal@kernel.org>
References: <20250403191913.2681831-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.132
Content-Transfer-Encoding: 8bit
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit c90876a695dd83e76680b88b40067275a5982811 ]

In preparation for adding support for MT8195's HDMI reserved DPI
instance, move the input_2p_en bit for DP_INTF to platform data.

While at it, remove the input_2pixel member from platform data as
having this bit implies that the 2pixel feature must be enabled.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20250217154836.108895-7-angelogioacchino.delregno@collabora.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 1f5d39a4077cd..cab4b3451187d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -125,14 +125,14 @@ struct mtk_dpi_yc_limit {
  * @is_ck_de_pol: Support CK/DE polarity.
  * @swap_input_support: Support input swap function.
  * @support_direct_pin: IP supports direct connection to dpi panels.
- * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so enable this
- *		  config to enable this feature.
  * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
  *		    (no shift).
  * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
  * @channel_swap_shift: Shift value of channel swap.
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
+ * @input_2p_en_bit: Enable bit for input two pixel per round feature.
+ *		     If present, implies that the feature must be enabled.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
  */
 struct mtk_dpi_conf {
@@ -145,12 +145,12 @@ struct mtk_dpi_conf {
 	bool is_ck_de_pol;
 	bool swap_input_support;
 	bool support_direct_pin;
-	bool input_2pixel;
 	u32 dimension_mask;
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
+	u32 input_2p_en_bit;
 	u32 pixels_per_iter;
 };
 
@@ -602,9 +602,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 		mtk_dpi_dual_edge(dpi);
 		mtk_dpi_config_disable_edge(dpi);
 	}
-	if (dpi->conf->input_2pixel) {
-		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
-			     DPINTF_INPUT_2P_EN);
+	if (dpi->conf->input_2p_en_bit) {
+		mtk_dpi_mask(dpi, DPI_CON, dpi->conf->input_2p_en_bit,
+			     dpi->conf->input_2p_en_bit);
 	}
 	mtk_dpi_sw_reset(dpi, false);
 
@@ -952,12 +952,12 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.output_fmts = mt8195_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
 	.pixels_per_iter = 4,
-	.input_2pixel = true,
 	.dimension_mask = DPINTF_HPW_MASK,
 	.hvsize_mask = DPINTF_HSIZE_MASK,
 	.channel_swap_shift = DPINTF_CH_SWAP,
 	.yuv422_en_bit = DPINTF_YUV422_EN,
 	.csc_enable_bit = DPINTF_CSC_ENABLE,
+	.input_2p_en_bit = DPINTF_INPUT_2P_EN,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.39.5

