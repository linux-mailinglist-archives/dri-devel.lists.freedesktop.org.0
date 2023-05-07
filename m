Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DDC6F99F5
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2316910E2B0;
	Sun,  7 May 2023 16:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD64710E236
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDT-0001lX-Bq; Sun, 07 May 2023 18:26:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-001nCW-Ni; Sun, 07 May 2023 18:26:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDR-002Agm-SY; Sun, 07 May 2023 18:26:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH 18/53] drm/exynos: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:41 +0200
Message-Id: <20230507162616.1368908-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14943;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=48T/hZEMBFXQAHiD2tnn9j2cQ68jelXTorg6bfIYt/w=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9D4b3MgJ8vJ304kuGToZkcRLVsuYl2yMW3g4
 iyMVjUzKbCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ+AAKCRCPgPtYfRL+
 TgYnB/94s8OBAIZSNFYoWHvDf+jnTnRTHjVB4LfRTiwTaA9gT6LhYNCJ2Db1kmNWUjrzigFgCKS
 kjgwxJKTOFz8ysvieRxIpyJfYWsnA3Jsz6bR0d3LhHQAQYewOmN22UZrA3RxxNbWwuR9mHxGBp/
 EGY1pr9bm8Dx6b2bgSfxSFDVXSrQaI5rPAlzyUtKXnVZnQsiHKboRxJt5LFvX5n+/Jw4AeQaBvR
 kpQuxjywsxpDBKLiqW5vxWmT6+0A/I9e+JPVxyCmioSohd0xQRnRP2odYVaFOSkRPK9HonIwHab
 Vw3SXcSctf8kRi7RDeOOXVUBr5vT9RiSMFFOsuBKwVQysPVK
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
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the exynos drm drivers from always returning zero in
the remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 6 ++----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 6 ++----
 drivers/gpu/drm/exynos/exynos_dp.c            | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 5 ++---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_mic.c       | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 6 ++----
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 6 ++----
 drivers/gpu/drm/exynos/exynos_mixer.c         | 6 ++----
 14 files changed, 28 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 2867b39fa35e..dd63418a9fd2 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -862,18 +862,16 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int exynos5433_decon_remove(struct platform_device *pdev)
+static void exynos5433_decon_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &decon_component_ops);
-
-	return 0;
 }
 
 struct platform_driver exynos5433_decon_driver = {
 	.probe		= exynos5433_decon_probe,
-	.remove		= exynos5433_decon_remove,
+	.remove_new	= exynos5433_decon_remove,
 	.driver		= {
 		.name	= "exynos5433-decon",
 		.pm	= pm_ptr(&exynos5433_decon_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 3126f735dedc..6fca23e04285 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -766,7 +766,7 @@ static int decon_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int decon_remove(struct platform_device *pdev)
+static void decon_remove(struct platform_device *pdev)
 {
 	struct decon_context *ctx = dev_get_drvdata(&pdev->dev);
 
@@ -775,8 +775,6 @@ static int decon_remove(struct platform_device *pdev)
 	iounmap(ctx->regs);
 
 	component_del(&pdev->dev, &decon_component_ops);
-
-	return 0;
 }
 
 static int exynos7_decon_suspend(struct device *dev)
@@ -841,7 +839,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos7_decon_pm_ops, exynos7_decon_suspend,
 
 struct platform_driver decon_driver = {
 	.probe		= decon_probe,
-	.remove		= decon_remove,
+	.remove_new	= decon_remove,
 	.driver		= {
 		.name	= "exynos-decon",
 		.pm	= pm_ptr(&exynos7_decon_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 3404ec1367fb..ca31bad6c576 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -250,14 +250,12 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &exynos_dp_ops);
 }
 
-static int exynos_dp_remove(struct platform_device *pdev)
+static void exynos_dp_remove(struct platform_device *pdev)
 {
 	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &exynos_dp_ops);
 	analogix_dp_remove(dp->adp);
-
-	return 0;
 }
 
 static int exynos_dp_suspend(struct device *dev)
@@ -285,7 +283,7 @@ MODULE_DEVICE_TABLE(of, exynos_dp_match);
 
 struct platform_driver dp_driver = {
 	.probe		= exynos_dp_probe,
-	.remove		= exynos_dp_remove,
+	.remove_new	= exynos_dp_remove,
 	.driver		= {
 		.name	= "exynos-dp",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 16c539657f73..67f2e68d6e3a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -354,15 +354,14 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 					       match);
 }
 
-static int exynos_drm_platform_remove(struct platform_device *pdev)
+static void exynos_drm_platform_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &exynos_drm_ops);
-	return 0;
 }
 
 static struct platform_driver exynos_drm_platform_driver = {
 	.probe	= exynos_drm_platform_probe,
-	.remove	= exynos_drm_platform_remove,
+	.remove_new = exynos_drm_platform_remove,
 	.driver	= {
 		.name	= "exynos-drm",
 		.pm	= &exynos_drm_pm_ops,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 06d6513ddaae..96aa98945f18 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1744,13 +1744,11 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int exynos_dsi_remove(struct platform_device *pdev)
+static void exynos_dsi_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
-
-	return 0;
 }
 
 static int __maybe_unused exynos_dsi_suspend(struct device *dev)
@@ -1825,7 +1823,7 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
 
 struct platform_driver dsi_driver = {
 	.probe = exynos_dsi_probe,
-	.remove = exynos_dsi_remove,
+	.remove_new = exynos_dsi_remove,
 	.driver = {
 		   .name = "exynos-dsi",
 		   .owner = THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 8de2714599fc..e81a576de398 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1367,7 +1367,7 @@ static int fimc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fimc_remove(struct platform_device *pdev)
+static void fimc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fimc_context *ctx = get_fimc_context(dev);
@@ -1377,8 +1377,6 @@ static int fimc_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 
 	fimc_put_clocks(ctx);
-
-	return 0;
 }
 
 static int fimc_runtime_suspend(struct device *dev)
@@ -1410,7 +1408,7 @@ MODULE_DEVICE_TABLE(of, fimc_of_match);
 
 struct platform_driver fimc_driver = {
 	.probe		= fimc_probe,
-	.remove		= fimc_remove,
+	.remove_new	= fimc_remove,
 	.driver		= {
 		.of_match_table = fimc_of_match,
 		.name	= "exynos-drm-fimc",
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 7f4a0be03dd1..cab64bc2b332 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1278,13 +1278,11 @@ static int fimd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fimd_remove(struct platform_device *pdev)
+static void fimd_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &fimd_component_ops);
-
-	return 0;
 }
 
 static int exynos_fimd_suspend(struct device *dev)
@@ -1326,7 +1324,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos_fimd_pm_ops, exynos_fimd_suspend,
 
 struct platform_driver fimd_driver = {
 	.probe		= fimd_probe,
-	.remove		= fimd_remove,
+	.remove_new	= fimd_remove,
 	.driver		= {
 		.name	= "exynos4-fb",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index ec784e58da5c..1f327b06645c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1530,7 +1530,7 @@ static int g2d_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int g2d_remove(struct platform_device *pdev)
+static void g2d_remove(struct platform_device *pdev)
 {
 	struct g2d_data *g2d = platform_get_drvdata(pdev);
 
@@ -1545,8 +1545,6 @@ static int g2d_remove(struct platform_device *pdev)
 	g2d_fini_cmdlist(g2d);
 	destroy_workqueue(g2d->g2d_workq);
 	kmem_cache_destroy(g2d->runqueue_slab);
-
-	return 0;
 }
 
 static int g2d_suspend(struct device *dev)
@@ -1609,7 +1607,7 @@ MODULE_DEVICE_TABLE(of, exynos_g2d_match);
 
 struct platform_driver g2d_driver = {
 	.probe		= g2d_probe,
-	.remove		= g2d_remove,
+	.remove_new	= g2d_remove,
 	.driver		= {
 		.name	= "exynos-drm-g2d",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 964dceb28c1e..f9cf4461036c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1308,15 +1308,13 @@ static int gsc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int gsc_remove(struct platform_device *pdev)
+static void gsc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
 	component_del(dev, &gsc_component_ops);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-
-	return 0;
 }
 
 static int __maybe_unused gsc_runtime_suspend(struct device *dev)
@@ -1421,7 +1419,7 @@ MODULE_DEVICE_TABLE(of, exynos_drm_gsc_of_match);
 
 struct platform_driver gsc_driver = {
 	.probe		= gsc_probe,
-	.remove		= gsc_remove,
+	.remove_new	= gsc_remove,
 	.driver		= {
 		.name	= "exynos-drm-gsc",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 17bab5b1663f..e2920960180f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -442,7 +442,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int exynos_mic_remove(struct platform_device *pdev)
+static void exynos_mic_remove(struct platform_device *pdev)
 {
 	struct exynos_mic *mic = platform_get_drvdata(pdev);
 
@@ -450,8 +450,6 @@ static int exynos_mic_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	drm_bridge_remove(&mic->bridge);
-
-	return 0;
 }
 
 static const struct of_device_id exynos_mic_of_match[] = {
@@ -462,7 +460,7 @@ MODULE_DEVICE_TABLE(of, exynos_mic_of_match);
 
 struct platform_driver mic_driver = {
 	.probe		= exynos_mic_probe,
-	.remove		= exynos_mic_remove,
+	.remove_new	= exynos_mic_remove,
 	.driver		= {
 		.name	= "exynos-mic",
 		.pm	= pm_ptr(&exynos_mic_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 8706f377c349..797424a5d83b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -329,15 +329,13 @@ static int rotator_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rotator_remove(struct platform_device *pdev)
+static void rotator_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
 	component_del(dev, &rotator_component_ops);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-
-	return 0;
 }
 
 static int rotator_runtime_suspend(struct device *dev)
@@ -453,7 +451,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(rotator_pm_ops, rotator_runtime_suspend,
 
 struct platform_driver rotator_driver = {
 	.probe		= rotator_probe,
-	.remove		= rotator_remove,
+	.remove_new	= rotator_remove,
 	.driver		= {
 		.name	= "exynos-rotator",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 20608e9780ce..b5cbb864c0c8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -539,15 +539,13 @@ static int scaler_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int scaler_remove(struct platform_device *pdev)
+static void scaler_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
 	component_del(dev, &scaler_component_ops);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-
-	return 0;
 }
 
 static int clk_disable_unprepare_wrapper(struct clk *clk)
@@ -721,7 +719,7 @@ MODULE_DEVICE_TABLE(of, exynos_scaler_match);
 
 struct platform_driver scaler_driver = {
 	.probe		= scaler_probe,
-	.remove		= scaler_remove,
+	.remove_new	= scaler_remove,
 	.driver		= {
 		.name	= "exynos-scaler",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b7c11bdce2c8..b03cc88f873b 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2067,7 +2067,7 @@ static int hdmi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int hdmi_remove(struct platform_device *pdev)
+static void hdmi_remove(struct platform_device *pdev)
 {
 	struct hdmi_context *hdata = platform_get_drvdata(pdev);
 
@@ -2090,8 +2090,6 @@ static int hdmi_remove(struct platform_device *pdev)
 	put_device(&hdata->ddc_adpt->dev);
 
 	mutex_destroy(&hdata->mutex);
-
-	return 0;
 }
 
 static int __maybe_unused exynos_hdmi_suspend(struct device *dev)
@@ -2123,7 +2121,7 @@ static const struct dev_pm_ops exynos_hdmi_pm_ops = {
 
 struct platform_driver hdmi_driver = {
 	.probe		= hdmi_probe,
-	.remove		= hdmi_remove,
+	.remove_new	= hdmi_remove,
 	.driver		= {
 		.name	= "exynos-hdmi",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 8d333db813b7..9aaf62c85cff 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1259,13 +1259,11 @@ static int mixer_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mixer_remove(struct platform_device *pdev)
+static void mixer_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &mixer_component_ops);
-
-	return 0;
 }
 
 static int __maybe_unused exynos_mixer_suspend(struct device *dev)
@@ -1339,5 +1337,5 @@ struct platform_driver mixer_driver = {
 		.of_match_table = mixer_match_types,
 	},
 	.probe = mixer_probe,
-	.remove = mixer_remove,
+	.remove_new = mixer_remove,
 };
-- 
2.39.2

