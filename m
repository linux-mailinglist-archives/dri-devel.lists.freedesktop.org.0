Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE646BFDDF
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A5410E4F0;
	Sat, 18 Mar 2023 23:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE4910E4A8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNp-00049i-JX; Sun, 19 Mar 2023 00:54:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNo-0056b1-Tb; Sun, 19 Mar 2023 00:54:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNo-005zUz-8a; Sun, 19 Mar 2023 00:54:44 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 22/51] video: fbdev: hitfb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:53:59 +0100
Message-Id: <20230318235428.272091-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=B1BEIthHKkUU2FohTtSpJ1Cp74UkEuBDnvaDm3hAXWk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk6/M1yTePdIx3RkjpiYVyoZO8FOvG9Ppl4cr
 W9mYOHNWgWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOvwAKCRCPgPtYfRL+
 TmGhB/9K0MoABZSO2oV/TZgaQmhf1aQsI4Mrkslg+46xpZyyVzGYT2DelA6e6eqKvAdh66wG9Q1
 wNLlYyYj3g+0M7m94TthWrnbGP8vjhF2tYsUKH+FQplqDk97H6Kdu9n+ew426+lsJzxEwbKxO3e
 Qv/QbEQGpuzNDeHMnlcqjj4i/vsKB0klG+WFYcRzDOLNE83G3bacBjHhsZw8KbO9o5gEDP9MWIl
 m6SBClAURz/1TfCAJjSEkIwEIkJVYrIQAQMOq7oQjs1y1BD1Ab6NM2fOcqqnMLh9QUJNSLSyjJg
 MX8il/k6fdEsUVhz+iMR9KI0dV/1S/ciFmKiq39NbDk7JvfS
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
 drivers/video/fbdev/hitfb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index bbb0f1d953cc..3033f5056976 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -415,15 +415,13 @@ static int hitfb_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int hitfb_remove(struct platform_device *dev)
+static void hitfb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
 
 	unregister_framebuffer(info);
 	fb_dealloc_cmap(&info->cmap);
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static int hitfb_suspend(struct device *dev)
@@ -460,7 +458,7 @@ static const struct dev_pm_ops hitfb_dev_pm_ops = {
 
 static struct platform_driver hitfb_driver = {
 	.probe		= hitfb_probe,
-	.remove		= hitfb_remove,
+	.remove_new	= hitfb_remove,
 	.driver		= {
 		.name	= "hitfb",
 		.pm	= &hitfb_dev_pm_ops,
-- 
2.39.2

