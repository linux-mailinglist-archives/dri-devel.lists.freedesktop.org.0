Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCDD6F99CF
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264D710E25F;
	Sun,  7 May 2023 16:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5BB10E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-0001dy-S7; Sun, 07 May 2023 18:26:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDP-001nBd-Te; Sun, 07 May 2023 18:26:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDO-002Afz-Bb; Sun, 07 May 2023 18:26:26 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 06/53] drm/atmel-hlcdc: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:29 +0200
Message-Id: <20230507162616.1368908-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7ujUAumCLtbl6IzTAzsgkmHDHidTx/e4bRhs71MEbvE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9DqywKY1tTDHN5DaO+Gz51KbNZu8Dd1OKPli
 jnO0dgRhZmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ6gAKCRCPgPtYfRL+
 TvvcB/wJG/rRk0TBYsOHv1FtJX6l/rSj79MIQqTrXMuGyIYqLMQqOVMT/PROXND30oZrnTJems/
 z8FQlqd9wNjmrcrP2PuJ2zKx3T2bNlCZOrquQSU5IsqMo79OjgifiG7B8Umsb/LkkYlYHC+zNPm
 WHcmHnDh77nDI20yo3mO0Srbd4+BxOQO8VdRnB3ijzyEJ8vph02ifDziukq8tFryh3TsEl1eG6Z
 4tUeQmQvgeY0I8B4qRh1hkd0ag0EKcmhOqJpLa/0yadrQf1ZxKzZZ14A+2r/bXLUSfgjg6DL274
 f3obpws+7ZuhsfCddIfbZ97TkF727RBEW+jbJzcj3K4c0EL+
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
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 4e806b06d35d..e3960cd11a6b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -773,15 +773,13 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int atmel_hlcdc_dc_drm_remove(struct platform_device *pdev)
+static void atmel_hlcdc_dc_drm_remove(struct platform_device *pdev)
 {
 	struct drm_device *ddev = platform_get_drvdata(pdev);
 
 	drm_dev_unregister(ddev);
 	atmel_hlcdc_dc_unload(ddev);
 	drm_dev_put(ddev);
-
-	return 0;
 }
 
 static int atmel_hlcdc_dc_drm_suspend(struct device *dev)
@@ -826,7 +824,7 @@ static const struct of_device_id atmel_hlcdc_dc_of_match[] = {
 
 static struct platform_driver atmel_hlcdc_dc_platform_driver = {
 	.probe	= atmel_hlcdc_dc_drm_probe,
-	.remove	= atmel_hlcdc_dc_drm_remove,
+	.remove_new = atmel_hlcdc_dc_drm_remove,
 	.driver	= {
 		.name	= "atmel-hlcdc-display-controller",
 		.pm	= pm_sleep_ptr(&atmel_hlcdc_dc_drm_pm_ops),
-- 
2.39.2

