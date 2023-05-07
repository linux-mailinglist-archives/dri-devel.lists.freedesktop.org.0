Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F426F99E6
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95C410E299;
	Sun,  7 May 2023 16:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7482510E236
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDX-00021A-Ho; Sun, 07 May 2023 18:26:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDW-001nDS-66; Sun, 07 May 2023 18:26:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDV-002AhY-JH; Sun, 07 May 2023 18:26:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 29/53] drm/mediatek: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:52 +0200
Message-Id: <20230507162616.1368908-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=15058;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=rjK4uqKpKtvyFN1hjCYEzxh7lQT7NdbIECimi9ktnlI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EFUtRSr3jD2XOoi09eDV+eAimjzrwwrZbQA
 A8LfF+GCImJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRBQAKCRCPgPtYfRL+
 TpVdCACr5TBdbHaiTvzj5X0aVb6r4Ja4Gszz+DhRa75Lwfrv8xhHp4ytHvTBkPrwSj92iIeWVxA
 ayLcsumtdFJKppVTiq6Mw5pWFD0GU0+OQ1Uf6iWk/PdyooHFVtI1h0dbwdcH/MSAVPzGhxUpVh/
 2eRGnPNcaFHeC8V+zGcmjGcLkDqDTyUdrs0IRgO/rl+fY4jcqahS4Y3ryA15CpXnJxpU2Jd02Cc
 uj9HjTy+aYrkJWrY7cHCvowMFkP0f30tTGE+YEGy3JIqE8v/qV+yNCcpoK4njy5XH2z8NoX4H/S
 507P4RITLvChYk0oXD4NwqvbAnN77rSALyMF6VzBdNfPZqSn
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
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

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
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
 14 files changed, 28 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 434e8a9ce8ab..cbd9b4becc43 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -140,11 +140,9 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
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
@@ -161,7 +159,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
 
 struct platform_driver mtk_disp_aal_driver = {
 	.probe		= mtk_disp_aal_probe,
-	.remove		= mtk_disp_aal_remove,
+	.remove_new	= mtk_disp_aal_remove,
 	.driver		= {
 		.name	= "mediatek-disp-aal",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 1773379b2439..fa6dbc4e9c35 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -195,11 +195,9 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
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
@@ -221,7 +219,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
 
 struct platform_driver mtk_disp_ccorr_driver = {
 	.probe		= mtk_disp_ccorr_probe,
-	.remove		= mtk_disp_ccorr_remove,
+	.remove_new	= mtk_disp_ccorr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ccorr",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index cac9206079e7..78e44e6befd6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -132,11 +132,9 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
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
@@ -164,7 +162,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_color_driver_dt_match);
 
 struct platform_driver mtk_disp_color_driver = {
 	.probe		= mtk_disp_color_probe,
-	.remove		= mtk_disp_color_remove,
+	.remove_new	= mtk_disp_color_remove,
 	.driver		= {
 		.name	= "mediatek-disp-color",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c844942603f7..c5237f4eb7fe 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -183,11 +183,9 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
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
@@ -209,7 +207,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
 
 struct platform_driver mtk_disp_gamma_driver = {
 	.probe		= mtk_disp_gamma_probe,
-	.remove		= mtk_disp_gamma_remove,
+	.remove_new	= mtk_disp_gamma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-gamma",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 6428b6203ffe..fd14a59bc951 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -295,11 +295,9 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
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
@@ -311,7 +309,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_merge_driver_dt_match);
 
 struct platform_driver mtk_disp_merge_driver = {
 	.probe = mtk_disp_merge_probe,
-	.remove = mtk_disp_merge_remove,
+	.remove_new = mtk_disp_merge_remove,
 	.driver = {
 		.name = "mediatek-disp-merge",
 		.owner = THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 9d8c986700ee..f90ad9bce028 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -483,12 +483,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
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
@@ -565,7 +563,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
 
 struct platform_driver mtk_disp_ovl_driver = {
 	.probe		= mtk_disp_ovl_probe,
-	.remove		= mtk_disp_ovl_remove,
+	.remove_new	= mtk_disp_ovl_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index a5a0c3bac35d..49149d67bb0e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -350,13 +350,11 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
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
@@ -390,7 +388,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
 
 struct platform_driver mtk_disp_rdma_driver = {
 	.probe		= mtk_disp_rdma_probe,
-	.remove		= mtk_disp_rdma_remove,
+	.remove_new	= mtk_disp_rdma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-rdma",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1f94fcc144d3..6352ee412045 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2575,7 +2575,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_dp_remove(struct platform_device *pdev)
+static void mtk_dp_remove(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
 
@@ -2586,8 +2586,6 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	platform_device_unregister(mtk_dp->phy_dev);
 	if (mtk_dp->audio_pdev)
 		platform_device_unregister(mtk_dp->audio_pdev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2646,7 +2644,7 @@ MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
 
 static struct platform_driver mtk_dp_driver = {
 	.probe = mtk_dp_probe,
-	.remove = mtk_dp_remove,
+	.remove_new = mtk_dp_remove,
 	.driver = {
 		.name = "mediatek-drm-dp",
 		.of_match_table = mtk_dp_of_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 948a53f1f4b3..ed3cbb202b7a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1102,14 +1102,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
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
@@ -1140,7 +1138,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
 struct platform_driver mtk_dpi_driver = {
 	.probe = mtk_dpi_probe,
-	.remove = mtk_dpi_remove,
+	.remove_new = mtk_dpi_remove,
 	.driver = {
 		.name = "mediatek-dpi",
 		.of_match_table = mtk_dpi_of_ids,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a13b36ac03a1..b951ad494f7d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -826,7 +826,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_drm_remove(struct platform_device *pdev)
+static void mtk_drm_remove(struct platform_device *pdev)
 {
 	struct mtk_drm_private *private = platform_get_drvdata(pdev);
 	int i;
@@ -836,8 +836,6 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
-
-	return 0;
 }
 
 static int mtk_drm_sys_prepare(struct device *dev)
@@ -866,7 +864,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 
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
index 2fc9214ffa82..63d3d5ba31f1 100644
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
index eecfa98ff52e..11bb6ca8cc8f 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -291,11 +291,10 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
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
@@ -306,7 +305,7 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_rdma_driver_dt_match);
 
 struct platform_driver mtk_mdp_rdma_driver = {
 	.probe = mtk_mdp_rdma_probe,
-	.remove = mtk_mdp_rdma_remove,
+	.remove_new = mtk_mdp_rdma_remove,
 	.driver = {
 		.name = "mediatek-mdp-rdma",
 		.owner = THIS_MODULE,
-- 
2.39.2

