Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D92A6BFDD3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E253910E4E9;
	Sat, 18 Mar 2023 23:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215DA10E044
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNp-00048o-5q; Sun, 19 Mar 2023 00:54:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNo-0056al-CU; Sun, 19 Mar 2023 00:54:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNn-005zUo-M4; Sun, 19 Mar 2023 00:54:43 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 19/51] video: fbdev: grvga: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:53:56 +0100
Message-Id: <20230318235428.272091-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=w3PbzBb6n2nqBuV8qZCtoHtBJv59krNA/XZ/KJwDO5o=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk68IZzDWqm6ttd7b9/mkNOCsDB+EdeM2L5v5
 MKeZTADV12JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOvAAKCRCPgPtYfRL+
 TmGtB/0VA/sthxPkFudCxTwFIwGFs6hZ7ntBJzqtUyhX7UoYNQsX9+pJelo10q1gneCkD9IRP0G
 nRD8FhduwIi2qi+GhojDJA2TophuuKYDYWcPVzaqrdfBQeibNyT5ipM1xGA8DZyAJEUnMCRBu2e
 svj3Jqgd4diQWg/VNx7pATkiQ9gibi+6TrGRDiymjJv12Frok9kRbPSC4CgR18/0HuGUAj3QPWu
 q9Ed06xLJtnEnaBtP+QQcbclO+g+toGkFnO7pMT39AZhdQ3R8vnPkoazAtITRmu/MqnbNA4HN1e
 pfukF3gHEepnFtqYkCI/kpwBWXx5SMeCg1NijYroKmOAOoC3
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
 drivers/video/fbdev/grvga.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 24818b276241..9aa15be29ea9 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -504,7 +504,7 @@ static int grvga_probe(struct platform_device *dev)
 	return retval;
 }
 
-static int grvga_remove(struct platform_device *device)
+static void grvga_remove(struct platform_device *device)
 {
 	struct fb_info *info = dev_get_drvdata(&device->dev);
 	struct grvga_par *par;
@@ -524,8 +524,6 @@ static int grvga_remove(struct platform_device *device)
 
 		framebuffer_release(info);
 	}
-
-	return 0;
 }
 
 static struct of_device_id svgactrl_of_match[] = {
@@ -545,7 +543,7 @@ static struct platform_driver grvga_driver = {
 		.of_match_table = svgactrl_of_match,
 	},
 	.probe		= grvga_probe,
-	.remove		= grvga_remove,
+	.remove_new	= grvga_remove,
 };
 
 module_platform_driver(grvga_driver);
-- 
2.39.2

