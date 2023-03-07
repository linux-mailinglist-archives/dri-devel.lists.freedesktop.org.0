Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C06ADE2D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 12:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458F010E11F;
	Tue,  7 Mar 2023 11:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E183710E11F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 11:59:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyJ-0006TP-A5; Tue, 07 Mar 2023 12:59:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyG-002TEq-KL; Tue, 07 Mar 2023 12:59:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyF-002yj7-KN; Tue, 07 Mar 2023 12:59:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 08/31] phy: mediatek: phy-mtk-mipi-dsi: Convert to platform
 remove callback returning void
Date: Tue,  7 Mar 2023 12:58:37 +0100
Message-Id: <20230307115900.2293120-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OaSKTY4uqDyE/b4P9Kpjn5LpWgMlD/CRSWsvB/MD7Nw=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkByacJQfciNykwOUJrVNhGA5Nxd2zTC7TCkwZQ
 4c8QctKW9SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmnAAKCRDB/BR4rcrs
 CSVVCACQo1k2/vqezM/4H1xRWVHIdvVsDLdfoHThYAyWII3ivZoIokEktT25evY1Znhmyu0nuhw
 uwLCJgEkYRjZszqxZQhA/fe0I12lZhSesE7LbSnIY6KrtAhkkah6WX3dIe3h0jo9a9NQyn/X9qy
 vJ84H9UfFtjkQPehl4G/LD5yKO/fq1BBmA4KUM1bIx5HZ0qE4dDZvyf4BbOT1sk1nHEuF9ZquKk
 m22ixqZB+EqEelFK8wKKBX+IPTa9hVnLK7xXNqVPizdhQNnQR/7zEvsPmtowJNhcfz7PjY2DQz+
 b55i6avd4ukF7PdeLPGi92kGTgKYoqzzcOB1rqVzV1uu6BF0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index cf9c386385bb..526c05a4af5e 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -180,10 +180,9 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 				   mipi_tx->pll);
 }
 
-static int mtk_mipi_tx_remove(struct platform_device *pdev)
+static void mtk_mipi_tx_remove(struct platform_device *pdev)
 {
 	of_clk_del_provider(pdev->dev.of_node);
-	return 0;
 }
 
 static const struct of_device_id mtk_mipi_tx_match[] = {
@@ -199,7 +198,7 @@ MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
 
 static struct platform_driver mtk_mipi_tx_driver = {
 	.probe = mtk_mipi_tx_probe,
-	.remove = mtk_mipi_tx_remove,
+	.remove_new = mtk_mipi_tx_remove,
 	.driver = {
 		.name = "mediatek-mipi-tx",
 		.of_match_table = mtk_mipi_tx_match,
-- 
2.39.1

