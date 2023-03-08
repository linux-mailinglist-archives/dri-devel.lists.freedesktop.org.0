Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF856AFFEF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 08:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4F510E591;
	Wed,  8 Mar 2023 07:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349610E58B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 07:39:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOu-0007Od-6B; Wed, 08 Mar 2023 08:39:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOt-002fIO-HS; Wed, 08 Mar 2023 08:39:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOs-003EMB-Oe; Wed, 08 Mar 2023 08:39:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH 06/13] backlight: led_bl: Convert to platform remove callback
 returning void
Date: Wed,  8 Mar 2023 08:39:38 +0100
Message-Id: <20230308073945.2336302-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=mB88i139m4RUVwy9p8TF1hvkW5x2blrC0HYBE1vjxsA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDukwdRCFYgrAJSPEamSwdc8npPPXpi/YBvrO
 0aDSJt/p6qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7pAAKCRDB/BR4rcrs
 CYfWB/9zBwgW1eBdvUy/pGFMxGZwwjcSprqMPBMaGJXMPq6F4SLlpKhUECHUOYlLNVdvCrK+YL+
 txcGvSRvIoHFZEW31l6tXPTmEP9kSijJUJ4ZOf6lriODniztppuBL5Qv6L6QdpyL1A7sj+U2Sxl
 UKbDwq0nUxhrJht8O+H+zvkiK03JlLX1nV8pE9T6eera4U7KAfZ6Z+/fi8w6AR5pmBdLb/G+PWz
 XzxGb5MKnByffJ4De36PtfcNSuihP/nKgbtGB1iB0zKU4xMLt9NV1n9KLiruqtGxgn6yee1sliC
 NYZZZC6+nzJ2B9vE1s05BnVIB4epcf5bTUiFgezyLQuc2VhO
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/backlight/led_bl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index f54d256e2d54..a1b6a2ad73a0 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -217,7 +217,7 @@ static int led_bl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int led_bl_remove(struct platform_device *pdev)
+static void led_bl_remove(struct platform_device *pdev)
 {
 	struct led_bl_data *priv = platform_get_drvdata(pdev);
 	struct backlight_device *bl = priv->bl_dev;
@@ -228,8 +228,6 @@ static int led_bl_remove(struct platform_device *pdev)
 	led_bl_power_off(priv);
 	for (i = 0; i < priv->nb_leds; i++)
 		led_sysfs_enable(priv->leds[i]);
-
-	return 0;
 }
 
 static const struct of_device_id led_bl_of_match[] = {
@@ -245,7 +243,7 @@ static struct platform_driver led_bl_driver = {
 		.of_match_table	= of_match_ptr(led_bl_of_match),
 	},
 	.probe		= led_bl_probe,
-	.remove		= led_bl_remove,
+	.remove_new	= led_bl_remove,
 };
 
 module_platform_driver(led_bl_driver);
-- 
2.39.1

