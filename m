Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2433E855CEB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 09:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5A410E305;
	Thu, 15 Feb 2024 08:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WbHtbgpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D6510E1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707987209;
 bh=2kYcQ73m5VVQx0p8fzsV+YSRRDCiNyzlRkXbM24wCGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WbHtbgpFJWFjURzyiWBYTuYd1nJqdFtctwVM3Q5+TK6PjXKFZNn3IItKPOxpx2u2D
 HcxZVuLWZCl+PFx+tGk5X8E0UKa6lHm25sWsDDSjAEX80CM+b0lx70vdIXEicB1hzt
 CtrA0f6NBDj4oabmDbvSSZzB2wVoBo3VklJjsmcIhYeGPen1kxt9HMn6m8w2azFQ5O
 +znL/bmTFIc6e+BJ1vOFje1sGKRsk7Wy6VilW1bz+h6l0rfCNOT3sA4PK1GdWoHdfF
 e7c6GqSONJLguwcmZpHEHAXy0j73hRkQitVpqqLpfDhiYYfc/CuwU/wamNevLpWJ8I
 edtzAtpR4lfsg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B8B4037820B6;
 Thu, 15 Feb 2024 08:53:28 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v6 8/9] drm/mediatek: dsi: Compress of_device_id entries and
 add sentinel
Date: Thu, 15 Feb 2024 09:53:15 +0100
Message-ID: <20240215085316.56835-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
References: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
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

All entries fit in 82 columns, which is acceptable: compress all of
the mtk_dsi_of_match[] entries to a single line for each.

While at it, also add the usual sentinel comment to the last entry.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 195ff4dfc3a3..b644505de98a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1204,17 +1204,12 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
-	{ .compatible = "mediatek,mt2701-dsi",
-	  .data = &mt2701_dsi_driver_data },
-	{ .compatible = "mediatek,mt8173-dsi",
-	  .data = &mt8173_dsi_driver_data },
-	{ .compatible = "mediatek,mt8183-dsi",
-	  .data = &mt8183_dsi_driver_data },
-	{ .compatible = "mediatek,mt8186-dsi",
-	  .data = &mt8186_dsi_driver_data },
-	{ .compatible = "mediatek,mt8188-dsi",
-	  .data = &mt8188_dsi_driver_data },
-	{ },
+	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
+	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
+	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
+	{ .compatible = "mediatek,mt8188-dsi", .data = &mt8188_dsi_driver_data },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
 
-- 
2.43.0

