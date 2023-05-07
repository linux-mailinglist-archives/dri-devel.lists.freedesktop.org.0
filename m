Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09FF6F99D7
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6E110E26F;
	Sun,  7 May 2023 16:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DE810E24E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-0001eB-SA; Sun, 07 May 2023 18:26:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDQ-001nBs-BV; Sun, 07 May 2023 18:26:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDP-002AgF-EW; Sun, 07 May 2023 18:26:27 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 10/53] drm/imx/imx8*: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:33 +0200
Message-Id: <20230507162616.1368908-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6662;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=w0wm/m6KTZ/aEkFpblu7iJD33wBFarzjpv7j5zgUhIU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9DuOHcOizatAVIXpr1t5mM+sZZZyf3JDwIs/
 +i1RtSHzSWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ7gAKCRCPgPtYfRL+
 TqViB/4nHOeM0WAbV5b+9g0kMT2d1sXER9zrZwyq248bBViu7pHty1Vkvmg7eU4Y27w1VjUgyxd
 khtSo9QlwrrewAxZPu5I+xr8hZyTi0vRz8kiTzU7mDOZNgw7byVA4CTfAmgPaoaJDc3a2sxcDJH
 Eju47hd1vWPsgol8pH/4WVzZkYO9B2S0Lu8ZFR/3cx/JanlLLaAnLBr8RPklu27eFP0fv3WM0ni
 PsI6vno4x5OVfWmdW0Fe10YkykUVsC0y2E+gCSicPFmHBN3IZFsvxLrXETdWvGXRjXWYKi1fGkH
 /wVSL7pbxxHiYSwBmP21NUnacjvEoRSqGf9yh7JY7Shrlurb
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the imx8 drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c         | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c        | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     | 6 ++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 6 ++----
 5 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
index 178af8d2d80b..386032a02599 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
@@ -532,7 +532,7 @@ static int imx8qm_ldb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8qm_ldb_remove(struct platform_device *pdev)
+static void imx8qm_ldb_remove(struct platform_device *pdev)
 {
 	struct imx8qm_ldb *imx8qm_ldb = platform_get_drvdata(pdev);
 	struct ldb *ldb = &imx8qm_ldb->base;
@@ -540,8 +540,6 @@ static int imx8qm_ldb_remove(struct platform_device *pdev)
 	ldb_remove_bridge_helper(ldb);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused imx8qm_ldb_runtime_suspend(struct device *dev)
@@ -573,7 +571,7 @@ MODULE_DEVICE_TABLE(of, imx8qm_ldb_dt_ids);
 
 static struct platform_driver imx8qm_ldb_driver = {
 	.probe	= imx8qm_ldb_probe,
-	.remove = imx8qm_ldb_remove,
+	.remove_new = imx8qm_ldb_remove,
 	.driver	= {
 		.pm = &imx8qm_ldb_pm_ops,
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
index 63948d5d20fd..c806576b1e22 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
@@ -667,7 +667,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8qxp_ldb_remove(struct platform_device *pdev)
+static void imx8qxp_ldb_remove(struct platform_device *pdev)
 {
 	struct imx8qxp_ldb *imx8qxp_ldb = platform_get_drvdata(pdev);
 	struct ldb *ldb = &imx8qxp_ldb->base;
@@ -675,8 +675,6 @@ static int imx8qxp_ldb_remove(struct platform_device *pdev)
 	ldb_remove_bridge_helper(ldb);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused imx8qxp_ldb_runtime_suspend(struct device *dev)
@@ -708,7 +706,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_ldb_dt_ids);
 
 static struct platform_driver imx8qxp_ldb_driver = {
 	.probe	= imx8qxp_ldb_probe,
-	.remove = imx8qxp_ldb_remove,
+	.remove_new = imx8qxp_ldb_remove,
 	.driver	= {
 		.pm = &imx8qxp_ldb_pm_ops,
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 503bd8db8afe..d0868a6ac6c9 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -357,7 +357,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
+static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
 {
 	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
 	struct imx8qxp_pc_channel *ch;
@@ -374,8 +374,6 @@ static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
@@ -435,7 +433,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
 
 static struct platform_driver imx8qxp_pc_bridge_driver = {
 	.probe	= imx8qxp_pc_bridge_probe,
-	.remove = imx8qxp_pc_bridge_remove,
+	.remove_new = imx8qxp_pc_bridge_remove,
 	.driver	= {
 		.pm = &imx8qxp_pc_pm_ops,
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 9e5f2b4dc2e5..25dc82a44ef4 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -398,13 +398,11 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
+static void imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
 {
 	struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&pl->bridge);
-
-	return 0;
 }
 
 static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {
@@ -416,7 +414,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
 
 static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
 	.probe	= imx8qxp_pixel_link_bridge_probe,
-	.remove = imx8qxp_pixel_link_bridge_remove,
+	.remove_new = imx8qxp_pixel_link_bridge_remove,
 	.driver	= {
 		.of_match_table = imx8qxp_pixel_link_dt_ids,
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index d0fec82f0cf8..4a886cb808ca 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -455,15 +455,13 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8qxp_pxl2dpi_bridge_remove(struct platform_device *pdev)
+static void imx8qxp_pxl2dpi_bridge_remove(struct platform_device *pdev)
 {
 	struct imx8qxp_pxl2dpi *p2d = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&p2d->bridge);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id imx8qxp_pxl2dpi_dt_ids[] = {
@@ -474,7 +472,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pxl2dpi_dt_ids);
 
 static struct platform_driver imx8qxp_pxl2dpi_bridge_driver = {
 	.probe	= imx8qxp_pxl2dpi_bridge_probe,
-	.remove = imx8qxp_pxl2dpi_bridge_remove,
+	.remove_new = imx8qxp_pxl2dpi_bridge_remove,
 	.driver	= {
 		.of_match_table = imx8qxp_pxl2dpi_dt_ids,
 		.name = DRIVER_NAME,
-- 
2.39.2

