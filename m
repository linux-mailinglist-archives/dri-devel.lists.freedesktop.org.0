Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417A6F99F0
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1814F10E2A7;
	Sun,  7 May 2023 16:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C87A10E270
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-00028k-2e; Sun, 07 May 2023 18:26:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-001nDu-F5; Sun, 07 May 2023 18:26:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDY-002Aht-J6; Sun, 07 May 2023 18:26:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Guo Zhengkui <guozhengkui@vivo.com>, Yuan Can <yuancan@huawei.com>,
 Arnd Bergmann <arnd@arndb.de>, Liang He <windhl@126.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 34/53] drm/omap: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:25:57 +0200
Message-Id: <20230507162616.1368908-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8986;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=iKD7AZeIUKma0IlZ3ROG9taQaa2zMRkbsZ3oUXVMYfk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EL8dtwabTFSktKTSKIM2JkHduexezDHxykY
 LsTEu3079eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRCwAKCRCPgPtYfRL+
 TrkJB/4jQ1NQMD2pf64J0xwMh/q0rEmYMfJHpJLK4Q48qqIlU1lCafV/f4rn/tf5ie8KOTJb3Pj
 DvOatXSSboxGSBIffniDZJK0tuj6bNUzZQFyTSyxiqfT0Amydt1lmaB3vNPreGcyuiCiqIUf7at
 edBX2CF3iTJpvA1Jb8Rbm92L947z81TzMCKDs/ra+s+hhxU75TtL2SSlH8anU3Iw4ZDSAddb/i0
 iHRZMADENeyN5023xShxJWjtTabrMhZRvy1UEoWQnMAJg5XbOmFG5Slk2Xjtpl1ZcAq2oR9G82X
 +2/TacWZwp2mFHiVbGWmtqF3Xr8mAQI3eX1NvlNEsdQlbDeW
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the omap drm driver from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c      | 5 ++---
 drivers/gpu/drm/omapdrm/dss/dsi.c        | 6 ++----
 drivers/gpu/drm/omapdrm/dss/dss.c        | 6 ++----
 drivers/gpu/drm/omapdrm/dss/hdmi4.c      | 5 ++---
 drivers/gpu/drm/omapdrm/dss/hdmi5.c      | 5 ++---
 drivers/gpu/drm/omapdrm/dss/venc.c       | 5 ++---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 9 +++------
 drivers/gpu/drm/omapdrm/omap_drv.c       | 6 ++----
 8 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index aacad5045e95..c26aab4939fa 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4858,10 +4858,9 @@ static int dispc_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &dispc_component_ops);
 }
 
-static int dispc_remove(struct platform_device *pdev)
+static void dispc_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &dispc_component_ops);
-	return 0;
 }
 
 static __maybe_unused int dispc_runtime_suspend(struct device *dev)
@@ -4913,7 +4912,7 @@ static const struct dev_pm_ops dispc_pm_ops = {
 
 struct platform_driver omap_dispchw_driver = {
 	.probe		= dispc_probe,
-	.remove         = dispc_remove,
+	.remove_new     = dispc_remove,
 	.driver         = {
 		.name   = "omapdss_dispc",
 		.pm	= &dispc_pm_ops,
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 4c1084eb0175..ea63c64d3a1a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5044,7 +5044,7 @@ static int dsi_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int dsi_remove(struct platform_device *pdev)
+static void dsi_remove(struct platform_device *pdev)
 {
 	struct dsi_data *dsi = platform_get_drvdata(pdev);
 
@@ -5060,8 +5060,6 @@ static int dsi_remove(struct platform_device *pdev)
 		regulator_disable(dsi->vdds_dsi_reg);
 		dsi->vdds_dsi_enabled = false;
 	}
-
-	return 0;
 }
 
 static __maybe_unused int dsi_runtime_suspend(struct device *dev)
@@ -5095,7 +5093,7 @@ static const struct dev_pm_ops dsi_pm_ops = {
 
 struct platform_driver omap_dsihw_driver = {
 	.probe		= dsi_probe,
-	.remove		= dsi_remove,
+	.remove_new	= dsi_remove,
 	.driver         = {
 		.name   = "omapdss_dsi",
 		.pm	= &dsi_pm_ops,
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index c4febb861910..02955f976845 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1532,7 +1532,7 @@ static int dss_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int dss_remove(struct platform_device *pdev)
+static void dss_remove(struct platform_device *pdev)
 {
 	struct dss_device *dss = platform_get_drvdata(pdev);
 
@@ -1557,8 +1557,6 @@ static int dss_remove(struct platform_device *pdev)
 	dss_put_clocks(dss);
 
 	kfree(dss);
-
-	return 0;
 }
 
 static void dss_shutdown(struct platform_device *pdev)
@@ -1607,7 +1605,7 @@ static const struct dev_pm_ops dss_pm_ops = {
 
 struct platform_driver omap_dsshw_driver = {
 	.probe		= dss_probe,
-	.remove		= dss_remove,
+	.remove_new	= dss_remove,
 	.shutdown	= dss_shutdown,
 	.driver         = {
 		.name   = "omapdss_dss",
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a8a75dc24751..a26b77d99d52 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -824,7 +824,7 @@ static int hdmi4_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int hdmi4_remove(struct platform_device *pdev)
+static void hdmi4_remove(struct platform_device *pdev)
 {
 	struct omap_hdmi *hdmi = platform_get_drvdata(pdev);
 
@@ -835,7 +835,6 @@ static int hdmi4_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	kfree(hdmi);
-	return 0;
 }
 
 static const struct of_device_id hdmi_of_match[] = {
@@ -845,7 +844,7 @@ static const struct of_device_id hdmi_of_match[] = {
 
 struct platform_driver omapdss_hdmi4hw_driver = {
 	.probe		= hdmi4_probe,
-	.remove		= hdmi4_remove,
+	.remove_new	= hdmi4_remove,
 	.driver         = {
 		.name   = "omapdss_hdmi",
 		.of_match_table = hdmi_of_match,
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 868712cd8a3a..e6611c683857 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -798,7 +798,7 @@ static int hdmi5_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int hdmi5_remove(struct platform_device *pdev)
+static void hdmi5_remove(struct platform_device *pdev)
 {
 	struct omap_hdmi *hdmi = platform_get_drvdata(pdev);
 
@@ -809,7 +809,6 @@ static int hdmi5_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	kfree(hdmi);
-	return 0;
 }
 
 static const struct of_device_id hdmi_of_match[] = {
@@ -820,7 +819,7 @@ static const struct of_device_id hdmi_of_match[] = {
 
 struct platform_driver omapdss_hdmi5hw_driver = {
 	.probe		= hdmi5_probe,
-	.remove		= hdmi5_remove,
+	.remove_new	= hdmi5_remove,
 	.driver         = {
 		.name   = "omapdss_hdmi5",
 		.of_match_table = hdmi_of_match,
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 4480b69ab5a7..f163d52a7c7d 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -865,7 +865,7 @@ static int venc_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int venc_remove(struct platform_device *pdev)
+static void venc_remove(struct platform_device *pdev)
 {
 	struct venc_device *venc = platform_get_drvdata(pdev);
 
@@ -876,7 +876,6 @@ static int venc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	kfree(venc);
-	return 0;
 }
 
 static __maybe_unused int venc_runtime_suspend(struct device *dev)
@@ -913,7 +912,7 @@ static const struct of_device_id venc_of_match[] = {
 
 struct platform_driver omap_venchw_driver = {
 	.probe		= venc_probe,
-	.remove		= venc_remove,
+	.remove_new	= venc_remove,
 	.driver         = {
 		.name   = "omapdss_venc",
 		.pm	= &venc_pm_ops,
diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 61a27dd7392e..9753c1e1f994 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -723,7 +723,7 @@ bool dmm_is_available(void)
 	return omap_dmm ? true : false;
 }
 
-static int omap_dmm_remove(struct platform_device *dev)
+static void omap_dmm_remove(struct platform_device *dev)
 {
 	struct tiler_block *block, *_block;
 	int i;
@@ -763,8 +763,6 @@ static int omap_dmm_remove(struct platform_device *dev)
 		kfree(omap_dmm);
 		omap_dmm = NULL;
 	}
-
-	return 0;
 }
 
 static int omap_dmm_probe(struct platform_device *dev)
@@ -982,8 +980,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 	return 0;
 
 fail:
-	if (omap_dmm_remove(dev))
-		dev_err(&dev->dev, "cleanup failed\n");
+	omap_dmm_remove(dev);
 	return ret;
 }
 
@@ -1213,7 +1210,7 @@ static const struct of_device_id dmm_of_match[] = {
 
 struct platform_driver omap_dmm_driver = {
 	.probe = omap_dmm_probe,
-	.remove = omap_dmm_remove,
+	.remove_new = omap_dmm_remove,
 	.driver = {
 		.owner = THIS_MODULE,
 		.name = DMM_DRIVER_NAME,
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 699ed814e021..fcab66fbcfbf 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -826,14 +826,12 @@ static int pdev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pdev_remove(struct platform_device *pdev)
+static void pdev_remove(struct platform_device *pdev)
 {
 	struct omap_drm_private *priv = platform_get_drvdata(pdev);
 
 	omapdrm_cleanup(priv);
 	kfree(priv);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -864,7 +862,7 @@ static struct platform_driver pdev = {
 		.pm = &omapdrm_pm_ops,
 	},
 	.probe = pdev_probe,
-	.remove = pdev_remove,
+	.remove_new = pdev_remove,
 };
 
 static struct platform_driver * const drivers[] = {
-- 
2.39.2

