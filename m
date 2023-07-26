Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B956762FA1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7808010E18A;
	Wed, 26 Jul 2023 08:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEFC10E18A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:23:00 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B99F1660711D;
 Wed, 26 Jul 2023 09:22:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690359779;
 bh=7S4BmWWUvw/WhRBHq0ubcEQhqplrJYEMp5mtO/yukgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eB4ffQornmdszsZQH07HZXx/UkjdjOtxtEKNJnQP0A2s85zmD8fCDh3mTffaAjSIe
 Dtjk8FTcs22EcQWu+G2JDwXOZDa6JBo+dSSkJKek5CHKDAo5G+NRJVW+B6rlgkcN8f
 ofqtFnJllXPMf9yJkKrU3vFqfc5IwHI+C3tQUZlN2PGccdnsIJYu8X1s75oe+PSdiZ
 rmZ3sqrVdFVdue02VMy47Ml6jj5UwM3KLeBF1gcUGJHXpCQe1PxZc1xm7eoMR5+umr
 A17OhzSnfA7zLX5y0RpHG6FQxCdPxTjJpbf9Ap1nGqUyHM5zMrrasODGTe6Binl3iM
 A8kJslQqULGZw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 6/6] drm/mediatek: mtk_dpi: Compress struct of_device_id
 entries
Date: Wed, 26 Jul 2023 10:22:45 +0200
Message-ID: <20230726082245.550929-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
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
Cc: fshao@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reduce line count by compressing the entries of struct of_device_id;
while at it, also add the usual /* sentinel */ comment to the last
entry.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a6fa26301a58..cc55dbb909ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1090,28 +1090,14 @@ static void mtk_dpi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-dpi",
-	  .data = &mt2701_conf,
-	},
-	{ .compatible = "mediatek,mt8173-dpi",
-	  .data = &mt8173_conf,
-	},
-	{ .compatible = "mediatek,mt8183-dpi",
-	  .data = &mt8183_conf,
-	},
-	{ .compatible = "mediatek,mt8186-dpi",
-	  .data = &mt8186_conf,
-	},
-	{ .compatible = "mediatek,mt8188-dp-intf",
-	  .data = &mt8188_dpintf_conf,
-	},
-	{ .compatible = "mediatek,mt8192-dpi",
-	  .data = &mt8192_conf,
-	},
-	{ .compatible = "mediatek,mt8195-dp-intf",
-	  .data = &mt8195_dpintf_conf,
-	},
-	{ },
+	{ .compatible = "mediatek,mt2701-dpi", .data = &mt2701_conf },
+	{ .compatible = "mediatek,mt8173-dpi", .data = &mt8173_conf },
+	{ .compatible = "mediatek,mt8183-dpi", .data = &mt8183_conf },
+	{ .compatible = "mediatek,mt8186-dpi", .data = &mt8186_conf },
+	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8188_dpintf_conf },
+	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
+	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
-- 
2.41.0

