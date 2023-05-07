Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB06F99DE
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3058010E272;
	Sun,  7 May 2023 16:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C675310E256
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-00028p-P2; Sun, 07 May 2023 18:26:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-001nDw-H8; Sun, 07 May 2023 18:26:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDY-002Ahx-Qw; Sun, 07 May 2023 18:26:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 35/53] drm/panel: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:58 +0200
Message-Id: <20230507162616.1368908-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4992;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7wKuglqWDRf8mf03U4PA6L5Miu2HCuP60h54DaSdXGg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EMkIzA53AZ0B0ztasLGnim4SkRSRT2mlign
 B9DKrFbqDOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRDAAKCRCPgPtYfRL+
 Tsm3CAC1PmMSahwFR7aJ4+niaHAv5MErMOBeB7DU/vnfYC+rVihmfVYaQ9Fd+h+PRXTIsJB827f
 CFuCzbKwsDo70hcasub2P6RJeS2v5J+BQEHSaJW4J5VwHo2OXkoiQNcBsnCkbVAvQ39AyqdoSvm
 YQCu3YWFGtVvfJxS57ou+Hqwp0Ou/haKdRLSEBbcXsfbf0NyEjHmYNYMaWJq48Vt7IbdyvXpagR
 asr6/pnNnHY7/IkXt0HQ8mDUoxYHeLOuEUzKPeFe3KOtZHqGHPl1X+4+9JIwgPAzOTstwqLy7gB
 D50S0wCquNePnFo3ZI8MlLVeypegadc5Sw4fwQtdJvlUnEYN
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
Cc: Sam Ravnborg <sam@ravnborg.org>, kernel@pengutronix.de,
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

Trivially convert the drm panel drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-lvds.c              | 6 ++----
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c     | 6 ++----
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c | 6 ++----
 drivers/gpu/drm/panel/panel-simple.c            | 6 ++----
 4 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index de8758c30e6e..b47c3a679be0 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -228,15 +228,13 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int panel_lvds_remove(struct platform_device *pdev)
+static void panel_lvds_remove(struct platform_device *pdev)
 {
 	struct panel_lvds *lvds = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&lvds->panel);
 
 	drm_panel_disable(&lvds->panel);
-
-	return 0;
 }
 
 static const struct of_device_id panel_lvds_of_table[] = {
@@ -248,7 +246,7 @@ MODULE_DEVICE_TABLE(of, panel_lvds_of_table);
 
 static struct platform_driver panel_lvds_driver = {
 	.probe		= panel_lvds_probe,
-	.remove		= panel_lvds_remove,
+	.remove_new	= panel_lvds_remove,
 	.driver		= {
 		.name	= "panel-lvds",
 		.of_match_table = panel_lvds_of_table,
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 76160e5d43bd..5c3d9f7fc358 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -266,14 +266,12 @@ static int seiko_panel_probe(struct device *dev,
 	return 0;
 }
 
-static int seiko_panel_remove(struct platform_device *pdev)
+static void seiko_panel_remove(struct platform_device *pdev)
 {
 	struct seiko_panel *panel = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&panel->base);
 	drm_panel_disable(&panel->base);
-
-	return 0;
 }
 
 static void seiko_panel_shutdown(struct platform_device *pdev)
@@ -335,7 +333,7 @@ static struct platform_driver seiko_panel_platform_driver = {
 		.of_match_table = platform_of_match,
 	},
 	.probe = seiko_panel_platform_probe,
-	.remove = seiko_panel_remove,
+	.remove_new = seiko_panel_remove,
 	.shutdown = seiko_panel_shutdown,
 };
 module_platform_driver(seiko_panel_platform_driver);
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
index a07d0f6c3e69..76bd9e810827 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
@@ -189,15 +189,13 @@ static int ls037v7dw01_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ls037v7dw01_remove(struct platform_device *pdev)
+static void ls037v7dw01_remove(struct platform_device *pdev)
 {
 	struct ls037v7dw01_panel *lcd = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&lcd->panel);
 	drm_panel_disable(&lcd->panel);
 	drm_panel_unprepare(&lcd->panel);
-
-	return 0;
 }
 
 static const struct of_device_id ls037v7dw01_of_match[] = {
@@ -209,7 +207,7 @@ MODULE_DEVICE_TABLE(of, ls037v7dw01_of_match);
 
 static struct platform_driver ls037v7dw01_driver = {
 	.probe		= ls037v7dw01_probe,
-	.remove		= ls037v7dw01_remove,
+	.remove_new	= ls037v7dw01_remove,
 	.driver		= {
 		.name = "panel-sharp-ls037v7dw01",
 		.of_match_table = ls037v7dw01_of_match,
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..1274eb95cf86 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4335,11 +4335,9 @@ static int panel_simple_platform_probe(struct platform_device *pdev)
 	return panel_simple_probe(&pdev->dev, id->data);
 }
 
-static int panel_simple_platform_remove(struct platform_device *pdev)
+static void panel_simple_platform_remove(struct platform_device *pdev)
 {
 	panel_simple_remove(&pdev->dev);
-
-	return 0;
 }
 
 static void panel_simple_platform_shutdown(struct platform_device *pdev)
@@ -4360,7 +4358,7 @@ static struct platform_driver panel_simple_platform_driver = {
 		.pm = &panel_simple_pm_ops,
 	},
 	.probe = panel_simple_platform_probe,
-	.remove = panel_simple_platform_remove,
+	.remove_new = panel_simple_platform_remove,
 	.shutdown = panel_simple_platform_shutdown,
 };
 
-- 
2.39.2

