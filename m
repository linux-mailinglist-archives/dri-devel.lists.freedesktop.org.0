Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1976BFDD7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAE410E4E7;
	Sat, 18 Mar 2023 23:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A476710E4BD
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:55:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNw-0004ID-Cz; Sun, 19 Mar 2023 00:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNs-0056cV-Vp; Sun, 19 Mar 2023 00:54:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNr-005zW6-Pl; Sun, 19 Mar 2023 00:54:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 39/51] video: fbdev: sh_mobile_lcdcfb: Convert to platform
 remove callback returning void
Date: Sun, 19 Mar 2023 00:54:16 +0100
Message-Id: <20230318235428.272091-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Uk8zrXZDmXbzyStZ+kshHTWd8FUKrWiM95JoTdmi+3w=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7wBBp/HH8fg17lt1aisI/hsfE5tcfPKhfc4
 T3o+1XlrRuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZO8AAKCRCPgPtYfRL+
 TpdVB/95m2SaljzaQ78AbBFywolqhGgc3kJolLHJRtqdzcIAZQIzFoKxddpWb2ZxUrodDTm9jwv
 SKfFtQtQDttaGJAkq1OyRdbjAvbyzZcqOxM1SglGE2rt9tXt9jN0JslGj+EEdKzq5L/0Ot0vIPF
 511xBTFfoyhXvluU9G1Ypid999/jQknMiiObBNGJkL4j4EPWAXu3KpWUuXXOHNZieXYdNUj704f
 y4QwAj+dPKFDVcnf2pjLEJ3eRKDI/OmIrM3tkmux6fAykLIHqbDt7QZ0u+hRTXusDcdab1hbqOi
 LDrKNkHoOBb1Y0via0CpZRjN0lG9KdQRGoPqil7vAlhzmL8f
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
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index ad9323ed8e2e..093f035d1246 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -2249,7 +2249,7 @@ static const struct fb_videomode default_720p = {
 	.sync = FB_SYNC_VERT_HIGH_ACT | FB_SYNC_HOR_HIGH_ACT,
 };
 
-static int sh_mobile_lcdc_remove(struct platform_device *pdev)
+static void sh_mobile_lcdc_remove(struct platform_device *pdev)
 {
 	struct sh_mobile_lcdc_priv *priv = platform_get_drvdata(pdev);
 	unsigned int i;
@@ -2305,7 +2305,6 @@ static int sh_mobile_lcdc_remove(struct platform_device *pdev)
 	if (priv->irq)
 		free_irq(priv->irq, priv);
 	kfree(priv);
-	return 0;
 }
 
 static int sh_mobile_lcdc_check_interface(struct sh_mobile_lcdc_chan *ch)
@@ -2656,7 +2655,7 @@ static struct platform_driver sh_mobile_lcdc_driver = {
 		.pm		= &sh_mobile_lcdc_dev_pm_ops,
 	},
 	.probe		= sh_mobile_lcdc_probe,
-	.remove		= sh_mobile_lcdc_remove,
+	.remove_new	= sh_mobile_lcdc_remove,
 };
 
 module_platform_driver(sh_mobile_lcdc_driver);
-- 
2.39.2

