Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E5758F8E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D68310E410;
	Wed, 19 Jul 2023 07:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D02510E40E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:51:12 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BB3976607070;
 Wed, 19 Jul 2023 08:51:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689753071;
 bh=njEiJKpcfz3CxTzbe9ovf4JbHnWi0lISeut4u5WR9b0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fNGCuNJzIqoBu7pmMvPVIs77YXhD/FXlxhrJydbQ4hyD8m0M86QcpWEx2cfnse0a9
 sud3E5UINvYro4eEFEcOh8XHg+g04JqM5GsvbA6a3oZUu5dJjTaE89Cjx22kI6S0u6
 NG3qBjQhDB3sH6pcs1/kNUV2mybd+ncj2AIAmnHMEyODk8g95X+/F1vNlNxK8zOSTy
 G+hhSF03G8OuY5WmdQl0S4hZVs+ib57XJrIXtGxecIqg4s44/TGgKb7CwwOaLFBzIr
 iaA6Cb2TJy+p75pWR48Tb6DTVcfOAPZ6LGnDxObn0Gt95qdrxt9uMf7RoCDNEJShDq
 5Z+D5k63RbexA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 6/6] drm/mediatek: mtk_dpi: Compress struct of_device_id
 entries
Date: Wed, 19 Jul 2023 09:50:56 +0200
Message-Id: <20230719075056.72178-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
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
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 244340df7468..ad1be4f9150c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1091,28 +1091,14 @@ static void mtk_dpi_remove(struct platform_device *pdev)
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
2.40.1

