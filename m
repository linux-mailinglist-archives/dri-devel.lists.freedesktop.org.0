Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F86F99F9
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACAA10E221;
	Sun,  7 May 2023 16:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3E10E260
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-0002Mz-7o; Sun, 07 May 2023 18:26:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-001nEx-IM; Sun, 07 May 2023 18:26:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-002AiR-ST; Sun, 07 May 2023 18:26:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH 43/53] drm/sun4i: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:26:06 +0200
Message-Id: <20230507162616.1368908-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11829;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ohgJo94kyt0RNLgyTYuJgk8dygZHofC9LVsJ+owdWP0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EVIA+iAJjFctTP6iRXt+HqZODQc1IA+/107
 io8u7+9p7OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRFQAKCRCPgPtYfRL+
 TsuXB/0VJzDkq314OTfzK50tWqSEw9KhIhLeCN5n6klG4+sI4fYe83X3qlOZRu55FRfuI9oOeoS
 ypX8RNoDNrtGs5783x+tpUaMPF6xi1T34pjvBv3Zni3MXDN40BzoAQANs2CqZ906iw1BxdaCuTK
 /3pZW+caA28MDlhceZq0sGZH0uFq102nlo9gts68X0yaZIGJpEpI0zyT/r5IfWdy40knbQhArpl
 6HJ8zRC0Po+CD3EqcDxmSxm2g5cJ27+g5Nyk0gRJCOetCUakh+xL+gHN/6zwTwmg/Urvs0+HBp7
 LPpS0NG+vWOP6VLFtBzU6RrWYGV0W12BGcM2vPzn76e910vo
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the sun4i drm drivers from always returning zero in
the remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c  | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_drv.c      | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_frontend.c | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_tcon.c     | 6 ++----
 drivers/gpu/drm/sun4i/sun4i_tv.c       | 6 ++----
 drivers/gpu/drm/sun4i/sun6i_drc.c      | 6 ++----
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 6 ++----
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 6 ++----
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 6 ++----
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 6 ++----
 11 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 38070fc261f3..b70950137bf1 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -965,11 +965,9 @@ static int sun4i_backend_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun4i_backend_ops);
 }
 
-static int sun4i_backend_remove(struct platform_device *pdev)
+static void sun4i_backend_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun4i_backend_ops);
-
-	return 0;
 }
 
 static const struct sun4i_backend_quirks sun4i_backend_quirks = {
@@ -1028,7 +1026,7 @@ MODULE_DEVICE_TABLE(of, sun4i_backend_of_table);
 
 static struct platform_driver sun4i_backend_platform_driver = {
 	.probe		= sun4i_backend_probe,
-	.remove		= sun4i_backend_remove,
+	.remove_new	= sun4i_backend_remove,
 	.driver		= {
 		.name		= "sun4i-backend",
 		.of_match_table	= sun4i_backend_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index d6c741716167..1449b7ea66d3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -408,11 +408,9 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 		return 0;
 }
 
-static int sun4i_drv_remove(struct platform_device *pdev)
+static void sun4i_drv_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &sun4i_drv_master_ops);
-
-	return 0;
 }
 
 static const struct of_device_id sun4i_drv_of_table[] = {
@@ -438,7 +436,7 @@ MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
 
 static struct platform_driver sun4i_drv_platform_driver = {
 	.probe		= sun4i_drv_probe,
-	.remove		= sun4i_drv_remove,
+	.remove_new	= sun4i_drv_remove,
 	.driver		= {
 		.name		= "sun4i-drm",
 		.of_match_table	= sun4i_drv_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index 799ab7460ae5..3872c91a85c7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -634,11 +634,9 @@ static int sun4i_frontend_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun4i_frontend_ops);
 }
 
-static int sun4i_frontend_remove(struct platform_device *pdev)
+static void sun4i_frontend_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun4i_frontend_ops);
-
-	return 0;
 }
 
 static int sun4i_frontend_runtime_resume(struct device *dev)
@@ -719,7 +717,7 @@ MODULE_DEVICE_TABLE(of, sun4i_frontend_of_table);
 
 static struct platform_driver sun4i_frontend_driver = {
 	.probe		= sun4i_frontend_probe,
-	.remove		= sun4i_frontend_remove,
+	.remove_new	= sun4i_frontend_remove,
 	.driver		= {
 		.name		= "sun4i-frontend",
 		.of_match_table	= sun4i_frontend_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index c0df5e892fa7..c139e1262e03 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -693,11 +693,9 @@ static int sun4i_hdmi_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun4i_hdmi_ops);
 }
 
-static int sun4i_hdmi_remove(struct platform_device *pdev)
+static void sun4i_hdmi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun4i_hdmi_ops);
-
-	return 0;
 }
 
 static const struct of_device_id sun4i_hdmi_of_table[] = {
@@ -710,7 +708,7 @@ MODULE_DEVICE_TABLE(of, sun4i_hdmi_of_table);
 
 static struct platform_driver sun4i_hdmi_driver = {
 	.probe		= sun4i_hdmi_probe,
-	.remove		= sun4i_hdmi_remove,
+	.remove_new	= sun4i_hdmi_remove,
 	.driver		= {
 		.name		= "sun4i-hdmi",
 		.of_match_table	= sun4i_hdmi_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 523a6d787921..f0a3752878fe 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1336,11 +1336,9 @@ static int sun4i_tcon_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun4i_tcon_ops);
 }
 
-static int sun4i_tcon_remove(struct platform_device *pdev)
+static void sun4i_tcon_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun4i_tcon_ops);
-
-	return 0;
 }
 
 /* platform specific TCON muxing callbacks */
@@ -1575,7 +1573,7 @@ EXPORT_SYMBOL(sun4i_tcon_of_table);
 
 static struct platform_driver sun4i_tcon_platform_driver = {
 	.probe		= sun4i_tcon_probe,
-	.remove		= sun4i_tcon_remove,
+	.remove_new	= sun4i_tcon_remove,
 	.driver		= {
 		.name		= "sun4i-tcon",
 		.of_match_table	= sun4i_tcon_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 9625a00a48ba..ec65d9d59de7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -546,11 +546,9 @@ static int sun4i_tv_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun4i_tv_ops);
 }
 
-static int sun4i_tv_remove(struct platform_device *pdev)
+static void sun4i_tv_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun4i_tv_ops);
-
-	return 0;
 }
 
 static const struct of_device_id sun4i_tv_of_table[] = {
@@ -561,7 +559,7 @@ MODULE_DEVICE_TABLE(of, sun4i_tv_of_table);
 
 static struct platform_driver sun4i_tv_platform_driver = {
 	.probe		= sun4i_tv_probe,
-	.remove		= sun4i_tv_remove,
+	.remove_new	= sun4i_tv_remove,
 	.driver		= {
 		.name		= "sun4i-tve",
 		.of_match_table	= sun4i_tv_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
index 4fbe9a6b5182..0d342f43fa93 100644
--- a/drivers/gpu/drm/sun4i/sun6i_drc.c
+++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
@@ -95,11 +95,9 @@ static int sun6i_drc_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun6i_drc_ops);
 }
 
-static int sun6i_drc_remove(struct platform_device *pdev)
+static void sun6i_drc_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun6i_drc_ops);
-
-	return 0;
 }
 
 static const struct of_device_id sun6i_drc_of_table[] = {
@@ -114,7 +112,7 @@ MODULE_DEVICE_TABLE(of, sun6i_drc_of_table);
 
 static struct platform_driver sun6i_drc_platform_driver = {
 	.probe		= sun6i_drc_probe,
-	.remove		= sun6i_drc_remove,
+	.remove_new	= sun6i_drc_remove,
 	.driver		= {
 		.name		= "sun6i-drc",
 		.of_match_table	= sun6i_drc_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 760ff05eabf4..4abf4f102007 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1200,7 +1200,7 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun6i_dsi_remove(struct platform_device *pdev)
+static void sun6i_dsi_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
@@ -1211,8 +1211,6 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
 		clk_rate_exclusive_put(dsi->mod_clk);
 
 	regmap_mmio_detach_clk(dsi->regs);
-
-	return 0;
 }
 
 static const struct sun6i_dsi_variant sun6i_a31_mipi_dsi_variant = {
@@ -1246,7 +1244,7 @@ MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
 
 static struct platform_driver sun6i_dsi_platform_driver = {
 	.probe		= sun6i_dsi_probe,
-	.remove		= sun6i_dsi_remove,
+	.remove_new	= sun6i_dsi_remove,
 	.driver		= {
 		.name		= "sun6i-mipi-dsi",
 		.of_match_table	= sun6i_dsi_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 7cab4213a680..26dd8f0dde99 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -235,11 +235,9 @@ static int sun8i_dw_hdmi_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun8i_dw_hdmi_ops);
 }
 
-static int sun8i_dw_hdmi_remove(struct platform_device *pdev)
+static void sun8i_dw_hdmi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun8i_dw_hdmi_ops);
-
-	return 0;
 }
 
 static const struct sun8i_dw_hdmi_quirks sun8i_a83t_quirks = {
@@ -266,7 +264,7 @@ MODULE_DEVICE_TABLE(of, sun8i_dw_hdmi_dt_ids);
 
 static struct platform_driver sun8i_dw_hdmi_pltfm_driver = {
 	.probe  = sun8i_dw_hdmi_probe,
-	.remove = sun8i_dw_hdmi_remove,
+	.remove_new = sun8i_dw_hdmi_remove,
 	.driver = {
 		.name = "sun8i-dw-hdmi",
 		.of_match_table = sun8i_dw_hdmi_dt_ids,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index bafee05f6b24..e4a73ca08365 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -555,11 +555,9 @@ static int sun8i_mixer_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun8i_mixer_ops);
 }
 
-static int sun8i_mixer_remove(struct platform_device *pdev)
+static void sun8i_mixer_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun8i_mixer_ops);
-
-	return 0;
 }
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
@@ -711,7 +709,7 @@ MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
 
 static struct platform_driver sun8i_mixer_platform_driver = {
 	.probe		= sun8i_mixer_probe,
-	.remove		= sun8i_mixer_remove,
+	.remove_new	= sun8i_mixer_remove,
 	.driver		= {
 		.name		= "sun8i-mixer",
 		.of_match_table	= sun8i_mixer_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index da97682b6835..2e8dd7723e29 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -261,11 +261,9 @@ static int sun8i_tcon_top_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sun8i_tcon_top_ops);
 }
 
-static int sun8i_tcon_top_remove(struct platform_device *pdev)
+static void sun8i_tcon_top_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sun8i_tcon_top_ops);
-
-	return 0;
 }
 
 static const struct sun8i_tcon_top_quirks sun8i_r40_tcon_top_quirks = {
@@ -302,7 +300,7 @@ EXPORT_SYMBOL(sun8i_tcon_top_of_table);
 
 static struct platform_driver sun8i_tcon_top_platform_driver = {
 	.probe		= sun8i_tcon_top_probe,
-	.remove		= sun8i_tcon_top_remove,
+	.remove_new	= sun8i_tcon_top_remove,
 	.driver		= {
 		.name		= "sun8i-tcon-top",
 		.of_match_table	= sun8i_tcon_top_of_table,
-- 
2.39.2

