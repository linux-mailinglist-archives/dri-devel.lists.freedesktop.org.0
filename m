Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28D97E379B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD0A10E4EF;
	Tue,  7 Nov 2023 09:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6FF10E4DC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 09:20:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG3-0000Pv-LY; Tue, 07 Nov 2023 10:20:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG3-007FmS-6E; Tue, 07 Nov 2023 10:20:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r0IG2-00ENX6-T8; Tue, 07 Nov 2023 10:20:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 15/22] fb: omapfb/dpi: Convert to platform remove callback
 returning void
Date: Tue,  7 Nov 2023 10:17:56 +0100
Message-ID: <20231107091740.3924258-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=jYaCQ2mrNANsPJgdXd2mtY81seo0PiSk6aculhgGasw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgDFBqz/NIP0TbjAlLZ9pRA6QTPhGT9OyF1Ye
 lCN9hOPA4WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAxQAKCRCPgPtYfRL+
 TkSkB/wKAnobpP2ToSnFUaNRDw0u2oBXnCHlUopN7OA7PNvxH4gT75xsy3IY1YJ09guYjydFykR
 pMhYa59OhsHPse7x8iCSf9nhAsnEVL36X0cElqaCTvK1KidynUIhUByv4OK84As5PswzT6bDF2h
 Oy8PK7UYhMMtvLNGTRS0Gyd05seMQuqnd2NE5yJVWL/dbruWTqyXwf96y5Y7qMVUu6TaDu7GDWL
 uXqDN2+1F9KGlzmi0TimPJlgnZ6Y+ioIz7f6MRN/ljm0yveib4iRNetIn/+Lw5oppOOBAsvzCMK
 V2tTzytN0eQuy4RsU6CCfh85t+P3TkNr+ArwxW9ovoaZszF+
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
Cc: kernel@pengutronix.de, linux-omap@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
index aa6faa5ba158..937f9091274f 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
@@ -211,7 +211,7 @@ static int panel_dpi_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int panel_dpi_remove(struct platform_device *pdev)
+static void panel_dpi_remove(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
@@ -223,8 +223,6 @@ static int panel_dpi_remove(struct platform_device *pdev)
 	panel_dpi_disconnect(dssdev);
 
 	omap_dss_put_device(in);
-
-	return 0;
 }
 
 static const struct of_device_id panel_dpi_of_match[] = {
@@ -236,7 +234,7 @@ MODULE_DEVICE_TABLE(of, panel_dpi_of_match);
 
 static struct platform_driver panel_dpi_driver = {
 	.probe = panel_dpi_probe,
-	.remove = panel_dpi_remove,
+	.remove_new = panel_dpi_remove,
 	.driver = {
 		.name = "panel-dpi",
 		.of_match_table = panel_dpi_of_match,
-- 
2.42.0

