Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD96F99DA
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690BC10E274;
	Sun,  7 May 2023 16:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D572610E252
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-0002AI-VN; Sun, 07 May 2023 18:26:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-001nEB-Vq; Sun, 07 May 2023 18:26:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-002Ai4-AI; Sun, 07 May 2023 18:26:37 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 37/53] drm/rcar-du: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:26:00 +0200
Message-Id: <20230507162616.1368908-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6961;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=1xeEpSdtJz+J9reRuG7HPCKs28vfLaAiZKwwuTgpxz4=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpTwi3z+e25nMGV2pdyanJrY+Ff9oKuesuSmlRKcJlPDJ
 Sd8MnTsZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiDiwcDKsP3ysuq/Rd/n9+
 uNzeN5EtcVVBBlHLj6Yyrs+02HftiUWHnx73k+r8Jp1ltsHf65YG72HU5Ss2kCu/IvSgKidZvKf
 OYo/lFta7YvpKeRt6Jn7yuCLQVXD9dUPuxfDV99azLs8s7ozJ1tkmdDR9yZZ1V1+fzvllHDTtvE
 KwyhmH+uORBWLbpx1W75p5W+288suH/HM+VuyffOGnYf26BmHL1+6nI71/l30JYWVmcHjx8YZbk
 GLXPZVTlxNkM3/vutwmcmOxo/icv79frv239FR0lQVfE+umMuVtxasceSRntU8paDrqs9nh35Tu
 x1X+7MaPjXdVihwpaDR1W9ZvkmRwY5oSq+4cF/3Fmgr9AA==
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
Cc: linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the rcar-du drm driver from always returning zero in
the remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/rcar-du/rcar_cmm.c       | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.c    | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c   | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_lvds.c      | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c  | 6 ++----
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c | 6 ++----
 6 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
index e2a67dda4658..26a2f5ad8ee5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
@@ -187,11 +187,9 @@ static int rcar_cmm_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rcar_cmm_remove(struct platform_device *pdev)
+static void rcar_cmm_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id rcar_cmm_of_table[] = {
@@ -203,7 +201,7 @@ MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
 
 static struct platform_driver rcar_cmm_platform_driver = {
 	.probe		= rcar_cmm_probe,
-	.remove		= rcar_cmm_remove,
+	.remove_new	= rcar_cmm_remove,
 	.driver		= {
 		.name	= "rcar-cmm",
 		.of_match_table = rcar_cmm_of_table,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index b9a94c5260e9..4a6bf50b5c49 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -685,7 +685,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(rcar_du_pm_ops,
  * Platform driver
  */
 
-static int rcar_du_remove(struct platform_device *pdev)
+static void rcar_du_remove(struct platform_device *pdev)
 {
 	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
 	struct drm_device *ddev = &rcdu->ddev;
@@ -694,8 +694,6 @@ static int rcar_du_remove(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(ddev);
 
 	drm_kms_helper_poll_fini(ddev);
-
-	return 0;
 }
 
 static void rcar_du_shutdown(struct platform_device *pdev)
@@ -776,7 +774,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 
 static struct platform_driver rcar_du_platform_driver = {
 	.probe		= rcar_du_probe,
-	.remove		= rcar_du_remove,
+	.remove_new	= rcar_du_remove,
 	.shutdown	= rcar_du_shutdown,
 	.driver		= {
 		.name	= "rcar-du",
diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 18ed14911b98..119d69d20b23 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -93,13 +93,11 @@ static int rcar_dw_hdmi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rcar_dw_hdmi_remove(struct platform_device *pdev)
+static void rcar_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
 
 	dw_hdmi_remove(hdmi);
-
-	return 0;
 }
 
 static const struct of_device_id rcar_dw_hdmi_of_table[] = {
@@ -110,7 +108,7 @@ MODULE_DEVICE_TABLE(of, rcar_dw_hdmi_of_table);
 
 static struct platform_driver rcar_dw_hdmi_platform_driver = {
 	.probe		= rcar_dw_hdmi_probe,
-	.remove		= rcar_dw_hdmi_remove,
+	.remove_new	= rcar_dw_hdmi_remove,
 	.driver		= {
 		.name	= "rcar-dw-hdmi",
 		.of_match_table = rcar_dw_hdmi_of_table,
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 260ea5d8624e..86d2ac204568 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -890,15 +890,13 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rcar_lvds_remove(struct platform_device *pdev)
+static void rcar_lvds_remove(struct platform_device *pdev)
 {
 	struct rcar_lvds *lvds = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&lvds->bridge);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct rcar_lvds_device_info rcar_lvds_gen2_info = {
@@ -994,7 +992,7 @@ static const struct dev_pm_ops rcar_lvds_pm_ops = {
 
 static struct platform_driver rcar_lvds_platform_driver = {
 	.probe		= rcar_lvds_probe,
-	.remove		= rcar_lvds_remove,
+	.remove_new	= rcar_lvds_remove,
 	.driver		= {
 		.name	= "rcar-lvds",
 		.pm	= &rcar_lvds_pm_ops,
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index e10e4d4b89a2..305123a671c6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -1044,13 +1044,11 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rcar_mipi_dsi_remove(struct platform_device *pdev)
+static void rcar_mipi_dsi_remove(struct platform_device *pdev)
 {
 	struct rcar_mipi_dsi *dsi = platform_get_drvdata(pdev);
 
 	mipi_dsi_host_unregister(&dsi->host);
-
-	return 0;
 }
 
 static const struct rcar_mipi_dsi_device_info v3u_data = {
@@ -1093,7 +1091,7 @@ MODULE_DEVICE_TABLE(of, rcar_mipi_dsi_of_table);
 
 static struct platform_driver rcar_mipi_dsi_platform_driver = {
 	.probe          = rcar_mipi_dsi_probe,
-	.remove         = rcar_mipi_dsi_remove,
+	.remove_new     = rcar_mipi_dsi_remove,
 	.driver         = {
 		.name   = "rcar-mipi-dsi",
 		.of_match_table = rcar_mipi_dsi_of_table,
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
index aa95b85a2964..a97fc4c5d1c8 100644
--- a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
@@ -782,14 +782,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rzg2l_mipi_dsi_remove(struct platform_device *pdev)
+static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 {
 	struct rzg2l_mipi_dsi *dsi = platform_get_drvdata(pdev);
 
 	mipi_dsi_host_unregister(&dsi->host);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
@@ -801,7 +799,7 @@ MODULE_DEVICE_TABLE(of, rzg2l_mipi_dsi_of_table);
 
 static struct platform_driver rzg2l_mipi_dsi_platform_driver = {
 	.probe	= rzg2l_mipi_dsi_probe,
-	.remove	= rzg2l_mipi_dsi_remove,
+	.remove_new = rzg2l_mipi_dsi_remove,
 	.driver	= {
 		.name = "rzg2l-mipi-dsi",
 		.pm = &rzg2l_mipi_pm_ops,
-- 
2.39.2

