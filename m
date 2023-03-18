Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9BF6BFDD4
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D3410E4E1;
	Sat, 18 Mar 2023 23:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE7610E4A7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNp-00045J-Um; Sun, 19 Mar 2023 00:54:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNn-0056aP-Cp; Sun, 19 Mar 2023 00:54:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNm-005zUR-LQ; Sun, 19 Mar 2023 00:54:42 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
	Gaosheng Cui <cuigaosheng1@huawei.com>
Subject: [PATCH 14/51] video: fbdev: ep93xx-fb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:53:51 +0100
Message-Id: <20230318235428.272091-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=FSWnvts299BKHZI7up4omJvQR3NHtI0HbWVYCbBSojM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk622CfaGoZVNlhC9mGcoliHjKXqSMpdBQrXi
 L8HdzQxjdOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOtgAKCRCPgPtYfRL+
 Tp7fB/9/bKaj2OKFsPDnQQ1exQ3XxOr4ZCK+aysV2YKXV6W2PtR46vaRC3QKFxh+IfO804bhrH0
 Kx9BUohwJNSxMWWE1sBWwa5wADHxbfPVDFHHamRFCIcrKdwXaTMHEAkex/R3z/8ptAnPr4JMgFZ
 ARvZBsu/VQrUpSIFRAxMEYB/lgPdoIb9+DUgqex01LQwx/HK+BDgSsWFalGqe7cn9RigyaekYtU
 mYOVSilOoGM3qXEeiBPjHh/ONT847M2N0TK35ZJvDYyQ1pryaxw4Xksyl8JAIpNz0zcN9RV45yJ
 A2cG2hwi4kTBv8J+PHvvzKneYyYhyw/WEbe0GM9nWCw9+EDd
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
 drivers/video/fbdev/ep93xx-fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 305f1587bd89..94fe52928be2 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -573,7 +573,7 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int ep93xxfb_remove(struct platform_device *pdev)
+static void ep93xxfb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 	struct ep93xx_fbi *fbi = info->par;
@@ -587,13 +587,11 @@ static int ep93xxfb_remove(struct platform_device *pdev)
 		fbi->mach_info->teardown(pdev);
 
 	kfree(info);
-
-	return 0;
 }
 
 static struct platform_driver ep93xxfb_driver = {
 	.probe		= ep93xxfb_probe,
-	.remove		= ep93xxfb_remove,
+	.remove_new	= ep93xxfb_remove,
 	.driver = {
 		.name	= "ep93xx-fb",
 	},
-- 
2.39.2

