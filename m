Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB697DF821
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3233D10E94B;
	Thu,  2 Nov 2023 16:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A656A10E93F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0J-00035f-0s; Thu, 02 Nov 2023 17:57:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-0067FD-Vp; Thu, 02 Nov 2023 17:57:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-00BjcH-Lz; Thu, 02 Nov 2023 17:57:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v3 08/16] drm/exynos: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:49 +0100
Message-ID: <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=15855;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=GyML+XxnWD67+O9LO4wNPbk+XPq3fIWtra9xxsfSsDY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TSbcFKb8P4Jd1Ewy/ITICWWVi9D/gL5OTon
 bOUKc6Gf1iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU0gAKCRCPgPtYfRL+
 TkZ5B/90tRGgpUzhwXbupiqqeX+FVzRA4VUtk/vKw4yvbKSPBTqrO3G0d+CE/sMIgIQgAYBFJS9
 S3pAXpZCOCOMMt0DQL8P+pRIXuSsHrWByswqj+SWucgPMfRgCpq81EAKNSzW91U/uFdXpHoKk8d
 P8cxfSOXdY+zn6hVlZ6q53zwNfN29NlhcpTAgIBECwT3EL0wEYWL7tC7bIsHcG0L1ULEhF5QC8s
 Fr7b56O1WwQruOGfuTS6O9VhAlMS66YnnmQsKF323RCbNvp+PRmdqIAkYmHF/NbSzl3VaYRsZBY
 t7SOviCqIrw2bFPVJMErYFBN/xteiYPKMqlS4pDhrNhzWvgU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert the exynos drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

drivers/gpu/drm/exynos/exynos_mixer.c :: Convert to platform remove callback returning void

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 6 ++----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 6 ++----
 drivers/gpu/drm/exynos/exynos_dp.c            | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 5 ++---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_mic.c       | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 6 ++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 6 ++----
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 6 ++----
 drivers/gpu/drm/exynos/exynos_mixer.c         | 6 ++----
 14 files changed, 28 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 4d986077738b..776f2f0b602d 100644
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
index 0156a5e94435..0d185c0564b9 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -765,7 +765,7 @@ static int decon_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int decon_remove(struct platform_device *pdev)
+static void decon_remove(struct platform_device *pdev)
 {
 	struct decon_context *ctx = dev_get_drvdata(&pdev->dev);
 
@@ -774,8 +774,6 @@ static int decon_remove(struct platform_device *pdev)
 	iounmap(ctx->regs);
 
 	component_del(&pdev->dev, &decon_component_ops);
-
-	return 0;
 }
 
 static int exynos7_decon_suspend(struct device *dev)
@@ -840,7 +838,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos7_decon_pm_ops, exynos7_decon_suspend,
 
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
index 8399256cb5c9..a6bff29fc254 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -344,15 +344,14 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
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
index 8dde7b1e9b35..a9f1c5c05894 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1277,13 +1277,11 @@ static int fimd_probe(struct platform_device *pdev)
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
@@ -1325,7 +1323,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos_fimd_pm_ops, exynos_fimd_suspend,
 
 struct platform_driver fimd_driver = {
 	.probe		= fimd_probe,
-	.remove		= fimd_remove,
+	.remove_new	= fimd_remove,
 	.driver		= {
 		.name	= "exynos4-fb",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 414e585ec7dd..f3138423612e 100644
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
index 34cdabc30b4f..6776d3e037c9 100644
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
index ffb327c5139e..5f7516655b08 100644
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
index f2b8b09a6b4e..392f721f13ab 100644
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
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index f5e1adfcaa51..00382f28748a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -462,7 +462,7 @@ static int vidi_probe(struct platform_device *pdev)
 	return component_add(dev, &vidi_component_ops);
 }
 
-static int vidi_remove(struct platform_device *pdev)
+static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
@@ -472,13 +472,11 @@ static int vidi_remove(struct platform_device *pdev)
 	}
 
 	component_del(&pdev->dev, &vidi_component_ops);
-
-	return 0;
 }
 
 struct platform_driver vidi_driver = {
 	.probe		= vidi_probe,
-	.remove		= vidi_remove,
+	.remove_new	= vidi_remove,
 	.driver		= {
 		.name	= "exynos-drm-vidi",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index f3aaa4ea3e68..6dfc8411ef84 100644
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
index b302392ff0d7..6822333fd0e6 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1258,13 +1258,11 @@ static int mixer_probe(struct platform_device *pdev)
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
@@ -1338,5 +1336,5 @@ struct platform_driver mixer_driver = {
 		.of_match_table = mixer_match_types,
 	},
 	.probe = mixer_probe,
-	.remove = mixer_remove,
+	.remove_new = mixer_remove,
 };
-- 
2.42.0

