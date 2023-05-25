Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AAD710B81
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8964810E6B1;
	Thu, 25 May 2023 11:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CF910E6B1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 11:53:08 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D2B096605873;
 Thu, 25 May 2023 12:53:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685015586;
 bh=MoBImu80zRJLNrIylFPj8ddmA5b0Asfo7LRys0h84Do=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UVBEcI9ahUXaJXN448On565H6zdBKU95wp/y1ZvBKINEPWuCIw+kg+z6GCt5V3zsl
 7oze6tsHLIb/sMuUJLy180HiOLrwB0GvlXFPvyWQKQ5SaGSsMVmv0+X+LLJEmOqMys
 aMzHW+qyeJ9oIpea7t6W9MZYUu8WzQ8xIpr1u0JPy6BVHCy8uRN3d1eQ7WFljI8EpK
 atAjfwUy8AuS1XsidThCn9LY8d34ybReXeGDsLWOcFcPazUrlKMhIvgqn5pQS/cn0f
 l7/ClU6K++2TUGjJXOvRcQ0PXl/h6GONldIhGAuHeuElqHoe3mEhGqrqsQkc6goowo
 N0f69sdpw2ThQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 3/3] phy: mediatek: mipi-dsi: Compress of_device_id match
 entries
Date: Thu, 25 May 2023 13:52:58 +0200
Message-Id: <20230525115258.90091-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
References: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
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
Cc: kishon@kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, vkoul@kernel.org, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All of the entries do fit in a maximum of 82 columns, which is
acceptable. While at it, also remove the useless comma on the
last entry and add the usual sentinel comment.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 4e75c34c819b..065ea626093a 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -180,13 +180,10 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mtk_mipi_tx_match[] = {
-	{ .compatible = "mediatek,mt2701-mipi-tx",
-	  .data = &mt2701_mipitx_data },
-	{ .compatible = "mediatek,mt8173-mipi-tx",
-	  .data = &mt8173_mipitx_data },
-	{ .compatible = "mediatek,mt8183-mipi-tx",
-	  .data = &mt8183_mipitx_data },
-	{ },
+	{ .compatible = "mediatek,mt2701-mipi-tx", .data = &mt2701_mipitx_data },
+	{ .compatible = "mediatek,mt8173-mipi-tx", .data = &mt8173_mipitx_data },
+	{ .compatible = "mediatek,mt8183-mipi-tx", .data = &mt8183_mipitx_data },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
 
-- 
2.40.1

