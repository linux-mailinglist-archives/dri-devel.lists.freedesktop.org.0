Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163AF6F99E8
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F18010E286;
	Sun,  7 May 2023 16:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02E510E252
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-0002EL-LU; Sun, 07 May 2023 18:26:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-001nEI-LJ; Sun, 07 May 2023 18:26:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-002Ai8-L0; Sun, 07 May 2023 18:26:37 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 38/53] drm/rockchip: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:26:01 +0200
Message-Id: <20230507162616.1368908-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10868;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7YWiMjNlK5vigZPcUWUUm2Oq70Hr+k8aHUpg1rjBFaM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EQU2HqP7At6tRbkqdOxhRGTrLTJ+xp0h3hH
 WdrVmBKgpmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfREAAKCRCPgPtYfRL+
 TgADB/0YHhn4oP4pb53aHbFIGLYMQZiKFen+8KTGvr3n/OskqyCPbn+UM8dODo8+O6XmEA6EAon
 0yPVLXQhBqNE2myO8Vsd4gcE1fAMnsgCPEMkwT1Ln9IuF+lAwRaDPMXRFjIhT3x//mGjVgPYu0L
 l6J+nwck5tGLwp4LO4d+MsnGFPydu0HiV8d+Od1d2tCEyoQYpBS05nKdXw8PajSuebRdclKOxfK
 X+ec9WwKLmW0rTMrQX6i0xZHGOfmKUd9BLAcM/MasKFJHz9WonvXZs6/zLZiDLQg4VTRny9FYb7
 cJ8HMwrejj+vNat2uRrTKasOD0KDh3AlW0lcl6PFD+LhE1Qb
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
Cc: kernel@pengutronix.de, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert rockchip drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 6 ++----
 drivers/gpu/drm/rockchip/cdn-dp-core.c          | 6 ++----
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 ++----
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c     | 6 ++----
 drivers/gpu/drm/rockchip/inno_hdmi.c            | 6 ++----
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 6 ++----
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 6 ++----
 drivers/gpu/drm/rockchip/rockchip_lvds.c        | 6 ++----
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c    | 6 ++----
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c     | 6 ++----
 10 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index ad2d3ae7e621..c497382fdb9b 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -419,14 +419,12 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rockchip_dp_remove(struct platform_device *pdev)
+static void rockchip_dp_remove(struct platform_device *pdev)
 {
 	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &rockchip_dp_component_ops);
 	analogix_dp_remove(dp->adp);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -481,7 +479,7 @@ MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
 
 struct platform_driver rockchip_dp_driver = {
 	.probe = rockchip_dp_probe,
-	.remove = rockchip_dp_remove,
+	.remove_new = rockchip_dp_remove,
 	.driver = {
 		   .name = "rockchip-dp",
 		   .pm = &rockchip_dp_pm_ops,
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 8526dda91931..8a55950c208f 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1223,15 +1223,13 @@ static int cdn_dp_probe(struct platform_device *pdev)
 	return component_add(dev, &cdn_dp_component_ops);
 }
 
-static int cdn_dp_remove(struct platform_device *pdev)
+static void cdn_dp_remove(struct platform_device *pdev)
 {
 	struct cdn_dp_device *dp = platform_get_drvdata(pdev);
 
 	platform_device_unregister(dp->audio_pdev);
 	cdn_dp_suspend(dp->dev);
 	component_del(&pdev->dev, &cdn_dp_component_ops);
-
-	return 0;
 }
 
 static void cdn_dp_shutdown(struct platform_device *pdev)
@@ -1248,7 +1246,7 @@ static const struct dev_pm_ops cdn_dp_pm_ops = {
 
 struct platform_driver cdn_dp_driver = {
 	.probe = cdn_dp_probe,
-	.remove = cdn_dp_remove,
+	.remove_new = cdn_dp_remove,
 	.shutdown = cdn_dp_shutdown,
 	.driver = {
 		   .name = "cdn-dp",
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 7901c3babc8c..375572103fd9 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1468,13 +1468,11 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int dw_mipi_dsi_rockchip_remove(struct platform_device *pdev)
+static void dw_mipi_dsi_rockchip_remove(struct platform_device *pdev)
 {
 	struct dw_mipi_dsi_rockchip *dsi = platform_get_drvdata(pdev);
 
 	dw_mipi_dsi_remove(dsi->dmd);
-
-	return 0;
 }
 
 static const struct rockchip_dw_dsi_chip_data px30_chip_data[] = {
@@ -1676,7 +1674,7 @@ MODULE_DEVICE_TABLE(of, dw_mipi_dsi_rockchip_dt_ids);
 
 struct platform_driver dw_mipi_dsi_rockchip_driver = {
 	.probe		= dw_mipi_dsi_rockchip_probe,
-	.remove		= dw_mipi_dsi_rockchip_remove,
+	.remove_new	= dw_mipi_dsi_rockchip_remove,
 	.driver		= {
 		.of_match_table = dw_mipi_dsi_rockchip_dt_ids,
 		.pm	= &dw_mipi_dsi_rockchip_pm_ops,
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 2f4b8f64cbad..8c4011d4ca61 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -656,11 +656,9 @@ static int dw_hdmi_rockchip_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &dw_hdmi_rockchip_ops);
 }
 
-static int dw_hdmi_rockchip_remove(struct platform_device *pdev)
+static void dw_hdmi_rockchip_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &dw_hdmi_rockchip_ops);
-
-	return 0;
 }
 
 static int __maybe_unused dw_hdmi_rockchip_resume(struct device *dev)
@@ -678,7 +676,7 @@ static const struct dev_pm_ops dw_hdmi_rockchip_pm = {
 
 struct platform_driver dw_hdmi_rockchip_pltfm_driver = {
 	.probe  = dw_hdmi_rockchip_probe,
-	.remove = dw_hdmi_rockchip_remove,
+	.remove_new = dw_hdmi_rockchip_remove,
 	.driver = {
 		.name = "dwhdmi-rockchip",
 		.pm = &dw_hdmi_rockchip_pm,
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f51774866f41..6a63952a6c84 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -919,11 +919,9 @@ static int inno_hdmi_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &inno_hdmi_ops);
 }
 
-static int inno_hdmi_remove(struct platform_device *pdev)
+static void inno_hdmi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &inno_hdmi_ops);
-
-	return 0;
 }
 
 static const struct of_device_id inno_hdmi_dt_ids[] = {
@@ -935,7 +933,7 @@ MODULE_DEVICE_TABLE(of, inno_hdmi_dt_ids);
 
 struct platform_driver inno_hdmi_driver = {
 	.probe  = inno_hdmi_probe,
-	.remove = inno_hdmi_remove,
+	.remove_new = inno_hdmi_remove,
 	.driver = {
 		.name = "innohdmi-rockchip",
 		.of_match_table = inno_hdmi_dt_ids,
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 90145ad96984..5e6ac27ea155 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -858,11 +858,9 @@ static int rk3066_hdmi_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &rk3066_hdmi_ops);
 }
 
-static int rk3066_hdmi_remove(struct platform_device *pdev)
+static void rk3066_hdmi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &rk3066_hdmi_ops);
-
-	return 0;
 }
 
 static const struct of_device_id rk3066_hdmi_dt_ids[] = {
@@ -873,7 +871,7 @@ MODULE_DEVICE_TABLE(of, rk3066_hdmi_dt_ids);
 
 struct platform_driver rk3066_hdmi_driver = {
 	.probe  = rk3066_hdmi_probe,
-	.remove = rk3066_hdmi_remove,
+	.remove_new = rk3066_hdmi_remove,
 	.driver = {
 		.name = "rockchip-rk3066-hdmi",
 		.of_match_table = rk3066_hdmi_dt_ids,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 6e0788d14c10..dedee7a0cd68 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -450,13 +450,11 @@ static int rockchip_drm_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rockchip_drm_platform_remove(struct platform_device *pdev)
+static void rockchip_drm_platform_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &rockchip_drm_ops);
 
 	rockchip_drm_match_remove(&pdev->dev);
-
-	return 0;
 }
 
 static void rockchip_drm_platform_shutdown(struct platform_device *pdev)
@@ -475,7 +473,7 @@ MODULE_DEVICE_TABLE(of, rockchip_drm_dt_ids);
 
 static struct platform_driver rockchip_drm_platform_driver = {
 	.probe = rockchip_drm_platform_probe,
-	.remove = rockchip_drm_platform_remove,
+	.remove_new = rockchip_drm_platform_remove,
 	.shutdown = rockchip_drm_platform_shutdown,
 	.driver = {
 		.name = "rockchip-drm",
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 68f6ebb33460..582859387792 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -739,19 +739,17 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rockchip_lvds_remove(struct platform_device *pdev)
+static void rockchip_lvds_remove(struct platform_device *pdev)
 {
 	struct rockchip_lvds *lvds = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &rockchip_lvds_component_ops);
 	clk_unprepare(lvds->pclk);
-
-	return 0;
 }
 
 struct platform_driver rockchip_lvds_driver = {
 	.probe = rockchip_lvds_probe,
-	.remove = rockchip_lvds_remove,
+	.remove_new = rockchip_lvds_remove,
 	.driver = {
 		   .name = "rockchip-lvds",
 		   .of_match_table = of_match_ptr(rockchip_lvds_dt_ids),
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 9d30aa73b542..62b573f282a7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -264,16 +264,14 @@ static int vop2_probe(struct platform_device *pdev)
 	return component_add(dev, &vop2_component_ops);
 }
 
-static int vop2_remove(struct platform_device *pdev)
+static void vop2_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vop2_component_ops);
-
-	return 0;
 }
 
 struct platform_driver vop2_platform_driver = {
 	.probe = vop2_probe,
-	.remove = vop2_remove,
+	.remove_new = vop2_remove,
 	.driver = {
 		.name = "rockchip-vop2",
 		.of_match_table = of_match_ptr(vop2_dt_match),
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 014f99e8928e..3e31e8e4e0fd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -1145,16 +1145,14 @@ static int vop_probe(struct platform_device *pdev)
 	return component_add(dev, &vop_component_ops);
 }
 
-static int vop_remove(struct platform_device *pdev)
+static void vop_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vop_component_ops);
-
-	return 0;
 }
 
 struct platform_driver vop_platform_driver = {
 	.probe = vop_probe,
-	.remove = vop_remove,
+	.remove_new = vop_remove,
 	.driver = {
 		.name = "rockchip-vop",
 		.of_match_table = vop_driver_dt_match,
-- 
2.39.2

