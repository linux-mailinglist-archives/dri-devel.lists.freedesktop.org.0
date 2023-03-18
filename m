Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C796BFDE0
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A7510E4F5;
	Sat, 18 Mar 2023 23:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFF610E4B5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:55:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNw-0004Eo-40; Sun, 19 Mar 2023 00:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNq-0056bh-R5; Sun, 19 Mar 2023 00:54:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNp-005zVW-VN; Sun, 19 Mar 2023 00:54:45 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Yu Zhe <yuzhe@nfschina.com>, Xu Panda <xu.panda@zte.com.cn>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 30/51] video: fbdev: omapfb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:07 +0100
Message-Id: <20230318235428.272091-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11405;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=EDo1aKr//a6fSQeLgJmtFuaS5zNte07XgYOIvfwCNuE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7If3DWRwK0CgL/5etvBVaf95/C4zJtGKLr5
 c4+YmguNRCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOyAAKCRCPgPtYfRL+
 Tin+B/9zMPO7MOHCK7GgHr1I396v1t6o2mfmOsIBQkwZdfGNwI/TNKQyYtQk+4Q3SzVyR4Hh7JM
 hX5nL7E7GXHr89gR0Dqq4+kqHuiqXklN5I7kAUoVwIM86+euJevzMqnT0e3zGct97OcN9UZqaNM
 QoJYWQn9K+rTuzrJyeb13dKNoYTjFXfahDu5rxovjGrciqpTD+ZH7kSK7TsPhQEf8ECHJJOp6Om
 3LTfB3Pp0DltlBy1VF0UyNNMDVfMJq8I2wC15wdjv+FAUTWQL5/KCFzlst9lZe4pWxxxfKm7eMM
 ToTjIvJOVBlprWjuHg2dfWKg8VjvDWcpAkObAXw2iU2mKJaN
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
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
 drivers/video/fbdev/omap/omapfb_main.c         | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/core.c    | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c   | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c     | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c     | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dss.c     | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c   | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c   | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c     | 5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/venc.c    | 5 ++---
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 6 ++----
 11 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 1f3df2055ff0..764058f40341 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1793,7 +1793,7 @@ void omapfb_register_panel(struct lcd_panel *panel)
 EXPORT_SYMBOL_GPL(omapfb_register_panel);
 
 /* Called when the device is being detached from the driver */
-static int omapfb_remove(struct platform_device *pdev)
+static void omapfb_remove(struct platform_device *pdev)
 {
 	struct omapfb_device *fbdev = platform_get_drvdata(pdev);
 	enum omapfb_state saved_state = fbdev->state;
@@ -1805,8 +1805,6 @@ static int omapfb_remove(struct platform_device *pdev)
 
 	platform_device_unregister(&omapdss_device);
 	fbdev->dssdev = NULL;
-
-	return 0;
 }
 
 /* PM suspend */
@@ -1831,7 +1829,7 @@ static int omapfb_resume(struct platform_device *pdev)
 
 static struct platform_driver omapfb_driver = {
 	.probe		= omapfb_probe,
-	.remove		= omapfb_remove,
+	.remove_new	= omapfb_remove,
 	.suspend	= omapfb_suspend,
 	.resume		= omapfb_resume,
 	.driver		= {
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/core.c b/drivers/video/fbdev/omap2/omapfb/dss/core.c
index 37858be8be83..5fbd8885bad8 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/core.c
@@ -171,13 +171,11 @@ static int __init omap_dss_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int omap_dss_remove(struct platform_device *pdev)
+static void omap_dss_remove(struct platform_device *pdev)
 {
 	unregister_pm_notifier(&omap_dss_pm_notif_block);
 
 	dss_uninitialize_debugfs();
-
-	return 0;
 }
 
 static void omap_dss_shutdown(struct platform_device *pdev)
@@ -187,7 +185,7 @@ static void omap_dss_shutdown(struct platform_device *pdev)
 }
 
 static struct platform_driver omap_dss_driver = {
-	.remove         = omap_dss_remove,
+	.remove_new     = omap_dss_remove,
 	.shutdown	= omap_dss_shutdown,
 	.driver         = {
 		.name   = "omapdss",
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 92fb6b7e1f68..21fef9db90d2 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -4017,10 +4017,9 @@ static int dispc_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &dispc_component_ops);
 }
 
-static int dispc_remove(struct platform_device *pdev)
+static void dispc_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &dispc_component_ops);
-	return 0;
 }
 
 static int dispc_runtime_suspend(struct device *dev)
@@ -4073,7 +4072,7 @@ static const struct of_device_id dispc_of_match[] = {
 
 static struct platform_driver omap_dispchw_driver = {
 	.probe		= dispc_probe,
-	.remove         = dispc_remove,
+	.remove_new     = dispc_remove,
 	.driver         = {
 		.name   = "omapdss_dispc",
 		.pm	= &dispc_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 99ce6e955a46..7c1b7d89389a 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -810,15 +810,14 @@ static int dpi_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &dpi_component_ops);
 }
 
-static int dpi_remove(struct platform_device *pdev)
+static void dpi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &dpi_component_ops);
-	return 0;
 }
 
 static struct platform_driver omap_dpi_driver = {
 	.probe		= dpi_probe,
-	.remove		= dpi_remove,
+	.remove_new	= dpi_remove,
 	.driver         = {
 		.name   = "omapdss_dpi",
 		.suppress_bind_attrs = true,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index 7cddb7b8ae34..b7eb17a16ec4 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -5495,10 +5495,9 @@ static int dsi_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &dsi_component_ops);
 }
 
-static int dsi_remove(struct platform_device *pdev)
+static void dsi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &dsi_component_ops);
-	return 0;
 }
 
 static int dsi_runtime_suspend(struct device *dev)
@@ -5565,7 +5564,7 @@ static const struct of_device_id dsi_of_match[] = {
 
 static struct platform_driver omap_dsihw_driver = {
 	.probe		= dsi_probe,
-	.remove		= dsi_remove,
+	.remove_new	= dsi_remove,
 	.driver         = {
 		.name   = "omapdss_dsi",
 		.pm	= &dsi_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index 335e0af4eec1..d814e4baa4b3 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -1224,10 +1224,9 @@ static int dss_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int dss_remove(struct platform_device *pdev)
+static void dss_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &dss_component_ops);
-	return 0;
 }
 
 static int dss_runtime_suspend(struct device *dev)
@@ -1279,7 +1278,7 @@ MODULE_DEVICE_TABLE(of, dss_of_match);
 
 static struct platform_driver omap_dsshw_driver = {
 	.probe		= dss_probe,
-	.remove		= dss_remove,
+	.remove_new	= dss_remove,
 	.driver         = {
 		.name   = "omapdss_dss",
 		.pm	= &dss_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 0f39612e002e..f05b4e35a842 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -756,10 +756,9 @@ static int hdmi4_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &hdmi4_component_ops);
 }
 
-static int hdmi4_remove(struct platform_device *pdev)
+static void hdmi4_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &hdmi4_component_ops);
-	return 0;
 }
 
 static int hdmi_runtime_suspend(struct device *dev)
@@ -792,7 +791,7 @@ static const struct of_device_id hdmi_of_match[] = {
 
 static struct platform_driver omapdss_hdmihw_driver = {
 	.probe		= hdmi4_probe,
-	.remove		= hdmi4_remove,
+	.remove_new	= hdmi4_remove,
 	.driver         = {
 		.name   = "omapdss_hdmi",
 		.pm	= &hdmi_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index bfccc2cb917a..03292945b1d4 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -797,10 +797,9 @@ static int hdmi5_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &hdmi5_component_ops);
 }
 
-static int hdmi5_remove(struct platform_device *pdev)
+static void hdmi5_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &hdmi5_component_ops);
-	return 0;
 }
 
 static int hdmi_runtime_suspend(struct device *dev)
@@ -834,7 +833,7 @@ static const struct of_device_id hdmi_of_match[] = {
 
 static struct platform_driver omapdss_hdmihw_driver = {
 	.probe		= hdmi5_probe,
-	.remove		= hdmi5_remove,
+	.remove_new	= hdmi5_remove,
 	.driver         = {
 		.name   = "omapdss_hdmi5",
 		.pm	= &hdmi_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index 002f07f5480f..d527931b2b16 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -375,15 +375,14 @@ static int sdi_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sdi_component_ops);
 }
 
-static int sdi_remove(struct platform_device *pdev)
+static void sdi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sdi_component_ops);
-	return 0;
 }
 
 static struct platform_driver omap_sdi_driver = {
 	.probe		= sdi_probe,
-	.remove         = sdi_remove,
+	.remove_new     = sdi_remove,
 	.driver         = {
 		.name   = "omapdss_sdi",
 		.suppress_bind_attrs = true,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index 78a7309d25dd..c9d40e28a06f 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -880,10 +880,9 @@ static int venc_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &venc_component_ops);
 }
 
-static int venc_remove(struct platform_device *pdev)
+static void venc_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &venc_component_ops);
-	return 0;
 }
 
 static int venc_runtime_suspend(struct device *dev)
@@ -922,7 +921,7 @@ static const struct of_device_id venc_of_match[] = {
 
 static struct platform_driver omap_venchw_driver = {
 	.probe		= venc_probe,
-	.remove		= venc_remove,
+	.remove_new	= venc_remove,
 	.driver         = {
 		.name   = "omapdss_venc",
 		.pm	= &venc_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index 5ccddcfce722..c0538069eb48 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -2599,7 +2599,7 @@ static int omapfb_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int omapfb_remove(struct platform_device *pdev)
+static void omapfb_remove(struct platform_device *pdev)
 {
 	struct omapfb2_device *fbdev = platform_get_drvdata(pdev);
 
@@ -2610,13 +2610,11 @@ static int omapfb_remove(struct platform_device *pdev)
 	omapfb_free_resources(fbdev);
 
 	omapdss_compat_uninit();
-
-	return 0;
 }
 
 static struct platform_driver omapfb_driver = {
 	.probe		= omapfb_probe,
-	.remove         = omapfb_remove,
+	.remove_new     = omapfb_remove,
 	.driver         = {
 		.name   = "omapfb",
 	},
-- 
2.39.2

