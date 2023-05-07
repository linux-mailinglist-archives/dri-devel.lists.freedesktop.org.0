Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28286F99E7
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D61010E270;
	Sun,  7 May 2023 16:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443BA10E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDf-0002RV-3j; Sun, 07 May 2023 18:26:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDe-001nFV-Cw; Sun, 07 May 2023 18:26:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-002Aj3-O7; Sun, 07 May 2023 18:26:41 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 52/53] drm/vc4: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:26:15 +0200
Message-Id: <20230507162616.1368908-53-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8630;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=nfrfwqYQjIm1czb9ptBsTxPEmdWlCN2i4J/5GgZbvJw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EheAE6OUCeSKp98EdfGdLhk3UXQ/pBU6myd
 JoDWPh6vQqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRIQAKCRCPgPtYfRL+
 Tio+CACAj74kEXLdn9At3/ysMSkqlaBX37C2Ax3Dg1CM2QkJlwCk7+zfqdhWgu2oQfdfVPj4lcY
 3xY1P6o0sfbLDgG3FZKOq6tgPHMBRN95BDkKwsC3Xcp7lxLXipoTcVbdX6IoEjcS1Pb8/TivLQB
 C5c0A4iRnjxYmDPGLCUCq02EUchUQ3A6pkSF9rofYWncfpIqoGAMXLGY13iRpdGRnrTjmrwN/RV
 RK4fiVGiDNdhf1sQHMAIdL+InV02foyC9m6lGI4q7PhwnVkmDQTgaS3J2I+0UyqsoM2r9WaEBXg
 G1wjFlgLRO93YbxbDSdcvkN+ZzlyGQ82q3tuAAjtyX0XHplU
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

Trivially convert the vc4 drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 5 ++---
 drivers/gpu/drm/vc4/vc4_dpi.c  | 5 ++---
 drivers/gpu/drm/vc4/vc4_drv.c  | 6 ++----
 drivers/gpu/drm/vc4/vc4_dsi.c  | 6 ++----
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 drivers/gpu/drm/vc4/vc4_hvs.c  | 5 ++---
 drivers/gpu/drm/vc4/vc4_txp.c  | 5 ++---
 drivers/gpu/drm/vc4/vc4_v3d.c  | 5 ++---
 drivers/gpu/drm/vc4/vc4_vec.c  | 5 ++---
 9 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bef9d45ef1df..7610e841ef3c 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1450,15 +1450,14 @@ static int vc4_crtc_dev_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &vc4_crtc_ops);
 }
 
-static int vc4_crtc_dev_remove(struct platform_device *pdev)
+static void vc4_crtc_dev_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vc4_crtc_ops);
-	return 0;
 }
 
 struct platform_driver vc4_crtc_driver = {
 	.probe = vc4_crtc_dev_probe,
-	.remove = vc4_crtc_dev_remove,
+	.remove_new = vc4_crtc_dev_remove,
 	.driver = {
 		.name = "vc4_crtc",
 		.of_match_table = vc4_crtc_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index f518d6e59ed6..e67856ae9d75 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -391,15 +391,14 @@ static int vc4_dpi_dev_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &vc4_dpi_ops);
 }
 
-static int vc4_dpi_dev_remove(struct platform_device *pdev)
+static void vc4_dpi_dev_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vc4_dpi_ops);
-	return 0;
 }
 
 struct platform_driver vc4_dpi_driver = {
 	.probe = vc4_dpi_dev_probe,
-	.remove = vc4_dpi_dev_remove,
+	.remove_new = vc4_dpi_dev_remove,
 	.driver = {
 		.name = "vc4_dpi",
 		.of_match_table = vc4_dpi_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 0ccaee57fe9a..cee41e318bf9 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -439,11 +439,9 @@ static int vc4_platform_drm_probe(struct platform_device *pdev)
 	return component_master_add_with_match(dev, &vc4_drm_ops, match);
 }
 
-static int vc4_platform_drm_remove(struct platform_device *pdev)
+static void vc4_platform_drm_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &vc4_drm_ops);
-
-	return 0;
 }
 
 static const struct of_device_id vc4_of_match[] = {
@@ -456,7 +454,7 @@ MODULE_DEVICE_TABLE(of, vc4_of_match);
 
 static struct platform_driver vc4_platform_driver = {
 	.probe		= vc4_platform_drm_probe,
-	.remove		= vc4_platform_drm_remove,
+	.remove_new	= vc4_platform_drm_remove,
 	.driver		= {
 		.name	= "vc4-drm",
 		.of_match_table = vc4_of_match,
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index a5c075f802e4..839d7d682842 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1830,20 +1830,18 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int vc4_dsi_dev_remove(struct platform_device *pdev)
+static void vc4_dsi_dev_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 	vc4_dsi_put(dsi);
-
-	return 0;
 }
 
 struct platform_driver vc4_dsi_driver = {
 	.probe = vc4_dsi_dev_probe,
-	.remove = vc4_dsi_dev_remove,
+	.remove_new = vc4_dsi_dev_remove,
 	.driver = {
 		.name = "vc4_dsi",
 		.of_match_table = vc4_dsi_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ea22c9bf223a..0c4aef532521 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3561,10 +3561,9 @@ static int vc4_hdmi_dev_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &vc4_hdmi_ops);
 }
 
-static int vc4_hdmi_dev_remove(struct platform_device *pdev)
+static void vc4_hdmi_dev_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vc4_hdmi_ops);
-	return 0;
 }
 
 static const struct vc4_hdmi_variant bcm2835_variant = {
@@ -3660,7 +3659,7 @@ static const struct dev_pm_ops vc4_hdmi_pm_ops = {
 
 struct platform_driver vc4_hdmi_driver = {
 	.probe = vc4_hdmi_dev_probe,
-	.remove = vc4_hdmi_dev_remove,
+	.remove_new = vc4_hdmi_dev_remove,
 	.driver = {
 		.name = "vc4_hdmi",
 		.of_match_table = vc4_hdmi_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4da66ef96783..04af672caacb 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1061,10 +1061,9 @@ static int vc4_hvs_dev_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &vc4_hvs_ops);
 }
 
-static int vc4_hvs_dev_remove(struct platform_device *pdev)
+static void vc4_hvs_dev_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vc4_hvs_ops);
-	return 0;
 }
 
 static const struct of_device_id vc4_hvs_dt_match[] = {
@@ -1075,7 +1074,7 @@ static const struct of_device_id vc4_hvs_dt_match[] = {
 
 struct platform_driver vc4_hvs_driver = {
 	.probe = vc4_hvs_dev_probe,
-	.remove = vc4_hvs_dev_remove,
+	.remove_new = vc4_hvs_dev_remove,
 	.driver = {
 		.name = "vc4_hvs",
 		.of_match_table = vc4_hvs_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ef5cab2a3aa9..8152c8325c13 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -577,10 +577,9 @@ static int vc4_txp_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &vc4_txp_ops);
 }
 
-static int vc4_txp_remove(struct platform_device *pdev)
+static void vc4_txp_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vc4_txp_ops);
-	return 0;
 }
 
 static const struct of_device_id vc4_txp_dt_match[] = {
@@ -590,7 +589,7 @@ static const struct of_device_id vc4_txp_dt_match[] = {
 
 struct platform_driver vc4_txp_driver = {
 	.probe = vc4_txp_probe,
-	.remove = vc4_txp_remove,
+	.remove_new = vc4_txp_remove,
 	.driver = {
 		.name = "vc4_txp",
 		.of_match_table = vc4_txp_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 29a664c8bf44..04ac7805e6d5 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -532,10 +532,9 @@ static int vc4_v3d_dev_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &vc4_v3d_ops);
 }
 
-static int vc4_v3d_dev_remove(struct platform_device *pdev)
+static void vc4_v3d_dev_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vc4_v3d_ops);
-	return 0;
 }
 
 const struct of_device_id vc4_v3d_dt_match[] = {
@@ -547,7 +546,7 @@ const struct of_device_id vc4_v3d_dt_match[] = {
 
 struct platform_driver vc4_v3d_driver = {
 	.probe = vc4_v3d_dev_probe,
-	.remove = vc4_v3d_dev_remove,
+	.remove_new = vc4_v3d_dev_remove,
 	.driver = {
 		.name = "vc4_v3d",
 		.of_match_table = vc4_v3d_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a3782d05cd66..0bbda1872881 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -818,15 +818,14 @@ static int vc4_vec_dev_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &vc4_vec_ops);
 }
 
-static int vc4_vec_dev_remove(struct platform_device *pdev)
+static void vc4_vec_dev_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &vc4_vec_ops);
-	return 0;
 }
 
 struct platform_driver vc4_vec_driver = {
 	.probe = vc4_vec_dev_probe,
-	.remove = vc4_vec_dev_remove,
+	.remove_new = vc4_vec_dev_remove,
 	.driver = {
 		.name = "vc4_vec",
 		.of_match_table = vc4_vec_dt_match,
-- 
2.39.2

