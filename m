Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE876B28A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B1110E3D5;
	Tue,  1 Aug 2023 11:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66D10E3BF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:02:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9J-0006g7-Ca; Tue, 01 Aug 2023 13:02:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-000MZC-LS; Tue, 01 Aug 2023 13:02:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9H-009bbR-Fv; Tue, 01 Aug 2023 13:02:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 07/12] drm/mediatek: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:34 +0200
Message-Id: <20230801110239.831099-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=16183;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7qIu1bYvzC6fI8c3HUA/QPQpK23WhyOMK1caiZDNKiY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW8M42JP8Pr1cd8tMnDC/Aps7svEUTSg+tgW
 ErOw/hM+KiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjlvAAKCRCPgPtYfRL+
 TtaaB/4w1a8Q8x25uylKl2nk3SL8/E21yj7iNwl6wLtftDDf45daRs5X+onL7ibO3j/8E0MyM0k
 KXtU8NUIMYaXUj3G1JZYYghSI8aAi6/a9BVJ2IE9QmNvn1pcYBcEFleOijLblrv+siodMURLFWL
 m/w9A8QetP6+QkcYxwpoD3sGEAAwkKlrssA0gOjmrS+xS+C/F6ctoQzMluOHH62Jceafv4K48vL
 /RKJfp277soP90E2EoxBLaGvq5L7zYBp09e+kBpbDB71d0OLbtSkqzwdqFzv5TMH2RA1H/L2r62
 9dK2v7HaINGqqCktfsZN820H92qGq/7B1dnD9X7nMZvRK0Fg
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, linux-arm-kernel@lists.infradead.org,
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

Trivially convert the mediatek drm drivers from always returning zero in
the remove callback to the void returning variant.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/mediatek/mtk_cec.c        | 5 ++---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dp.c         | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 6 ++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 6 ++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 5 ++---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c   | 5 ++---
 15 files changed, 30 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index b640bc0559e7..f47f417d8ba6 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -235,13 +235,12 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_cec_remove(struct platform_device *pdev)
+static void mtk_cec_remove(struct platform_device *pdev)
 {
 	struct mtk_cec *cec = platform_get_drvdata(pdev);
 
 	mtk_cec_htplg_irq_disable(cec);
 	clk_disable_unprepare(cec->clk);
-	return 0;
 }
 
 static const struct of_device_id mtk_cec_of_ids[] = {
@@ -252,7 +251,7 @@ MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
 
 struct platform_driver mtk_cec_driver = {
 	.probe = mtk_cec_probe,
-	.remove = mtk_cec_remove,
+	.remove_new = mtk_cec_remove,
 	.driver = {
 		.name = "mediatek-cec",
 		.of_match_table = mtk_cec_of_ids,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index cdbec79474d1..136b1328e459 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -139,11 +139,9 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_aal_remove(struct platform_device *pdev)
+static void mtk_disp_aal_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_aal_component_ops);
-
-	return 0;
 }
 
 static const struct mtk_disp_aal_data mt8173_aal_driver_data = {
@@ -160,7 +158,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
 
 struct platform_driver mtk_disp_aal_driver = {
 	.probe		= mtk_disp_aal_probe,
-	.remove		= mtk_disp_aal_remove,
+	.remove_new	= mtk_disp_aal_remove,
 	.driver		= {
 		.name	= "mediatek-disp-aal",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 7c5e04ee5b9f..bd859008eff9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -194,11 +194,9 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_ccorr_remove(struct platform_device *pdev)
+static void mtk_disp_ccorr_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_ccorr_component_ops);
-
-	return 0;
 }
 
 static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
@@ -220,7 +218,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
 
 struct platform_driver mtk_disp_ccorr_driver = {
 	.probe		= mtk_disp_ccorr_probe,
-	.remove		= mtk_disp_ccorr_remove,
+	.remove_new	= mtk_disp_ccorr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ccorr",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 0b9b4b06d19c..78ea99f1444f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -131,11 +131,9 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_color_remove(struct platform_device *pdev)
+static void mtk_disp_color_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_color_component_ops);
-
-	return 0;
 }
 
 static const struct mtk_disp_color_data mt2701_color_driver_data = {
@@ -163,7 +161,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_color_driver_dt_match);
 
 struct platform_driver mtk_disp_color_driver = {
 	.probe		= mtk_disp_color_probe,
-	.remove		= mtk_disp_color_remove,
+	.remove_new	= mtk_disp_color_remove,
 	.driver		= {
 		.name	= "mediatek-disp-color",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 7746dceadb20..673f9a5738f2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -182,11 +182,9 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_gamma_remove(struct platform_device *pdev)
+static void mtk_disp_gamma_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_gamma_component_ops);
-
-	return 0;
 }
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
@@ -208,7 +206,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
 
 struct platform_driver mtk_disp_gamma_driver = {
 	.probe		= mtk_disp_gamma_probe,
-	.remove		= mtk_disp_gamma_remove,
+	.remove_new	= mtk_disp_gamma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-gamma",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index bea8a0d8040a..e525a6b9e5b0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -294,11 +294,9 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_merge_remove(struct platform_device *pdev)
+static void mtk_disp_merge_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_merge_component_ops);
-
-	return 0;
 }
 
 static const struct of_device_id mtk_disp_merge_driver_dt_match[] = {
@@ -310,7 +308,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_merge_driver_dt_match);
 
 struct platform_driver mtk_disp_merge_driver = {
 	.probe = mtk_disp_merge_probe,
-	.remove = mtk_disp_merge_remove,
+	.remove_new = mtk_disp_merge_remove,
 	.driver = {
 		.name = "mediatek-disp-merge",
 		.owner = THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 73320a7425cd..2bffe4245466 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -561,12 +561,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_ovl_remove(struct platform_device *pdev)
+static void mtk_disp_ovl_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
@@ -658,7 +656,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
 
 struct platform_driver mtk_disp_ovl_driver = {
 	.probe		= mtk_disp_ovl_probe,
-	.remove		= mtk_disp_ovl_remove,
+	.remove_new	= mtk_disp_ovl_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index a12c05786d28..faa907f2f443 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -379,13 +379,11 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_rdma_remove(struct platform_device *pdev)
+static void mtk_disp_rdma_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct mtk_disp_rdma_data mt2701_rdma_driver_data = {
@@ -427,7 +425,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
 
 struct platform_driver mtk_disp_rdma_driver = {
 	.probe		= mtk_disp_rdma_probe,
-	.remove		= mtk_disp_rdma_remove,
+	.remove_new	= mtk_disp_rdma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-rdma",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 64eee77452c0..4dbc5be156f4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2574,7 +2574,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_dp_remove(struct platform_device *pdev)
+static void mtk_dp_remove(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
 
@@ -2585,8 +2585,6 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	platform_device_unregister(mtk_dp->phy_dev);
 	if (mtk_dp->audio_pdev)
 		platform_device_unregister(mtk_dp->audio_pdev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2645,7 +2643,7 @@ MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
 
 static struct platform_driver mtk_dp_driver = {
 	.probe = mtk_dp_probe,
-	.remove = mtk_dp_remove,
+	.remove_new = mtk_dp_remove,
 	.driver = {
 		.name = "mediatek-drm-dp",
 		.of_match_table = mtk_dp_of_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 28bdb1f427ff..0ef722c24150 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1101,14 +1101,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_dpi_remove(struct platform_device *pdev)
+static void mtk_dpi_remove(struct platform_device *pdev)
 {
 	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
 	drm_bridge_remove(&dpi->bridge);
-
-	return 0;
 }
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
@@ -1139,7 +1137,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
 struct platform_driver mtk_dpi_driver = {
 	.probe = mtk_dpi_probe,
-	.remove = mtk_dpi_remove,
+	.remove_new = mtk_dpi_remove,
 	.driver = {
 		.name = "mediatek-dpi",
 		.of_match_table = mtk_dpi_of_ids,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 961715dd5b11..d16cc8219105 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -907,7 +907,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_drm_remove(struct platform_device *pdev)
+static void mtk_drm_remove(struct platform_device *pdev)
 {
 	struct mtk_drm_private *private = platform_get_drvdata(pdev);
 	int i;
@@ -917,8 +917,6 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
-
-	return 0;
 }
 
 static int mtk_drm_sys_prepare(struct device *dev)
@@ -951,7 +949,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
-	.remove	= mtk_drm_remove,
+	.remove_new = mtk_drm_remove,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..d8bfc2cce54d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1178,14 +1178,12 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_dsi_remove(struct platform_device *pdev)
+static void mtk_dsi_remove(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
 
 	mtk_output_dsi_disable(dsi);
 	mipi_dsi_host_unregister(&dsi->host);
-
-	return 0;
 }
 
 static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
@@ -1223,7 +1221,7 @@ MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
 
 struct platform_driver mtk_dsi_driver = {
 	.probe = mtk_dsi_probe,
-	.remove = mtk_dsi_remove,
+	.remove_new = mtk_dsi_remove,
 	.driver = {
 		.name = "mtk-dsi",
 		.of_match_table = mtk_dsi_of_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..86133bf16326 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1746,13 +1746,12 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_drm_hdmi_remove(struct platform_device *pdev)
+static void mtk_drm_hdmi_remove(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&hdmi->bridge);
 	mtk_hdmi_clk_disable_audio(hdmi);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1806,7 +1805,7 @@ MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
 
 static struct platform_driver mtk_hdmi_driver = {
 	.probe = mtk_drm_hdmi_probe,
-	.remove = mtk_drm_hdmi_remove,
+	.remove_new = mtk_drm_hdmi_remove,
 	.driver = {
 		.name = "mediatek-drm-hdmi",
 		.of_match_table = mtk_drm_hdmi_of_ids,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 4d39ea0a05ca..d675c954befe 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -324,14 +324,12 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_hdmi_ddc_remove(struct platform_device *pdev)
+static void mtk_hdmi_ddc_remove(struct platform_device *pdev)
 {
 	struct mtk_hdmi_ddc *ddc = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&ddc->adap);
 	clk_disable_unprepare(ddc->clk);
-
-	return 0;
 }
 
 static const struct of_device_id mtk_hdmi_ddc_match[] = {
@@ -342,7 +340,7 @@ MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_match);
 
 struct platform_driver mtk_hdmi_ddc_driver = {
 	.probe = mtk_hdmi_ddc_probe,
-	.remove = mtk_hdmi_ddc_remove,
+	.remove_new = mtk_hdmi_ddc_remove,
 	.driver = {
 		.name = "mediatek-hdmi-ddc",
 		.of_match_table = mtk_hdmi_ddc_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index 4806bdd4b8fa..c3adaeefd551 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -314,11 +314,10 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_mdp_rdma_remove(struct platform_device *pdev)
+static void mtk_mdp_rdma_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_mdp_rdma_component_ops);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static const struct of_device_id mtk_mdp_rdma_driver_dt_match[] = {
@@ -329,7 +328,7 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_rdma_driver_dt_match);
 
 struct platform_driver mtk_mdp_rdma_driver = {
 	.probe = mtk_mdp_rdma_probe,
-	.remove = mtk_mdp_rdma_remove,
+	.remove_new = mtk_mdp_rdma_remove,
 	.driver = {
 		.name = "mediatek-mdp-rdma",
 		.owner = THIS_MODULE,
-- 
2.39.2

