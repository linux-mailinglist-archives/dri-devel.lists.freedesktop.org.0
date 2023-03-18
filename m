Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A8F6BFDD0
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35910E4DF;
	Sat, 18 Mar 2023 23:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C5110E4B1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNt-0004H7-3T; Sun, 19 Mar 2023 00:54:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNs-0056cK-El; Sun, 19 Mar 2023 00:54:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNr-005zW2-K5; Sun, 19 Mar 2023 00:54:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 38/51] video: fbdev: sh7760fb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:15 +0100
Message-Id: <20230318235428.272091-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=XznMwAdgwwk+HnRVAZt9IgzfQjXJQ2pDe2f7YYLAumY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7qUqUstzWfc26Xmtt+3hAjCmUp0ta8LtRb9
 WV5iaCLUDaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZO6gAKCRCPgPtYfRL+
 TiR3B/wKrldHvDlKHRwCTsPLTLqcG9kTUxwbVIs8v0unagjU7VW/oxcCMb24dhkGmQjAYusWgqt
 JEvkyyv1QAJgzRlF+pKNLRi3cXaH4ku0NTlr8u2UY90u8UnGotnjYU2QthgfXZCrdefgWKvOzmY
 t7xBVJ3r8CUGSQlSw/94XYoUQmQXhwpju4tISK4ZUQe9B5q+WEQMPytq+iY8JfD1+QTKh2nE1Zl
 TkV+84HJl7f85oPNYCCKWVjWzwqIHjbKqCO3Ij8oR1HTdA09UROgCcp45hrFexAMmc99YNks3zM
 gsJd+wTpdhvPmzqLKdKc4A6TA8MNpul+3n+IOHrMvsXRPUKi
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
 drivers/video/fbdev/sh7760fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sh7760fb.c b/drivers/video/fbdev/sh7760fb.c
index 5978a8921232..768011bdb430 100644
--- a/drivers/video/fbdev/sh7760fb.c
+++ b/drivers/video/fbdev/sh7760fb.c
@@ -554,7 +554,7 @@ static int sh7760fb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sh7760fb_remove(struct platform_device *dev)
+static void sh7760fb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
 	struct sh7760fb_par *par = info->par;
@@ -568,8 +568,6 @@ static int sh7760fb_remove(struct platform_device *dev)
 	iounmap(par->base);
 	release_mem_region(par->ioarea->start, resource_size(par->ioarea));
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static struct platform_driver sh7760_lcdc_driver = {
@@ -577,7 +575,7 @@ static struct platform_driver sh7760_lcdc_driver = {
 		   .name = "sh7760-lcdc",
 		   },
 	.probe = sh7760fb_probe,
-	.remove = sh7760fb_remove,
+	.remove_new = sh7760fb_remove,
 };
 
 module_platform_driver(sh7760_lcdc_driver);
-- 
2.39.2

