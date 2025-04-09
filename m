Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB7A825AA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8016110E895;
	Wed,  9 Apr 2025 13:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AALbTqyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BDC10E890
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744204397;
 bh=NEuXEAf0EoHvdi3tLgzyhmCbJUmfqZDU6pN1X9AaFMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AALbTqykzgOFJwXwrfudo7uMKkPLpsGgttDFYQ/SHqOVCdGLvIuMr+OiI0f3r7s3l
 cT4p7GxNdHYQ1+z57QywB+fSapcg2pUN8qIyEZ5nMwhbS6yl2rUUUWlBcp2h6jXVmW
 f1myxybJ6YqDKKos0Cg6YGg7TNBn3CnAj/ET46w3wSGG+CGdghGPZAs30hoZ0Ho2BB
 hJqa3pbv0LKe2+BGG3L+7ibaoDI2GVXnw1W3yylMmwIvBhwBVCnMPE0QC21SoJwvp9
 BjmmC0qUeyIx3JVSkgOHiCb8FbRQ9iReaBMg098MnjgoA1UkGauCZg4S1fC/ESO32U
 V3H25MdeUH0SQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C775917E0FC1;
 Wed,  9 Apr 2025 15:13:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, lewis.liao@mediatek.com, ives.chenjh@mediatek.com,
 tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: [PATCH v1 5/5] drm/mediatek: mtk_dpi: Rename output fmts array for
 MT8195 DP_INTF
Date: Wed,  9 Apr 2025 15:13:06 +0200
Message-ID: <20250409131306.108635-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
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

For the sake of increasing human readability and avoid possible
confusion between DPI and DP_INTF output formats (as the two are
ever so slightly different), rename the mt8195_output_fmts array
to mt8195_dp_intf_output_fmts.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 9de537a77493..0b7f91fb519f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1106,7 +1106,7 @@ static const u32 mt8195_dpi_output_fmts[] = {
 	MEDIA_BUS_FMT_YUV10_1X30,
 };
 
-static const u32 mt8195_output_fmts[] = {
+static const u32 mt8195_dp_intf_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_RGB888_2X12_LE,
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
@@ -1248,8 +1248,8 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.dpi_factor = dpi_factor_mt8195_dp_intf,
 	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8195_dp_intf),
 	.max_clock_khz = 600000,
-	.output_fmts = mt8195_output_fmts,
-	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
+	.output_fmts = mt8195_dp_intf_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8195_dp_intf_output_fmts),
 	.pixels_per_iter = 4,
 	.dimension_mask = DPINTF_HPW_MASK,
 	.hvsize_mask = DPINTF_HSIZE_MASK,
-- 
2.49.0

