Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C216BFD98
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ED010E4A8;
	Sat, 18 Mar 2023 23:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B9D10E044
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNl-00041f-S0; Sun, 19 Mar 2023 00:54:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNl-0056ZU-6P; Sun, 19 Mar 2023 00:54:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNk-005zTk-HK; Sun, 19 Mar 2023 00:54:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
	Yihao Han <hanyihao@vivo.com>
Subject: [PATCH 03/51] video: fbdev: au1100fb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:53:40 +0100
Message-Id: <20230318235428.272091-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZeRUp9iq5eSAosiqXZU37Mo+K1kfkuJKRH1GA53X+Kc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk6ptVxK7/W0lh9UQPshBtNRz4P4SiXQ15mdK
 tOjBYKIhKKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOqQAKCRCPgPtYfRL+
 Tq95B/sES7Yc4ueVz4bgjKtbhssNqor7Pti7Qm2Yj0q/TFt0DJfQpBm2Lnob2ZouxLTjMUQ6bfy
 68UWIKd+DgEG+fHHNzAY11qL/w4Am4LKcMb+tsPuYMZIVo1rG2SATkziuwvYuWXiUeSrdQZHJJ5
 bBUn1tMBPVc8Eg+i2XtfXENKA7BkFkovY+8rEFKVGlyijWWArNxWEL/eHdpclz47PhSffaDcvOR
 397eH9cbXQy1x6zy6PJ2Aev+EWNaK2Hyzimr2C8tfTo1J+0rI1RIdTkMknOqyJXCupjct1JBX7W
 0DQhBNcj59Pf8+8vEtQx0TDwp3LlCD05F63RxUw9nQ7GF44Q
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
 drivers/video/fbdev/au1100fb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index cd27e3b81bb8..cb317398e71a 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -520,7 +520,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	return -ENODEV;
 }
 
-int au1100fb_drv_remove(struct platform_device *dev)
+void au1100fb_drv_remove(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev = NULL;
 
@@ -540,8 +540,6 @@ int au1100fb_drv_remove(struct platform_device *dev)
 		clk_disable_unprepare(fbdev->lcdclk);
 		clk_put(fbdev->lcdclk);
 	}
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -590,8 +588,8 @@ static struct platform_driver au1100fb_driver = {
 		.name		= "au1100-lcd",
 	},
 	.probe		= au1100fb_drv_probe,
-        .remove		= au1100fb_drv_remove,
-	.suspend	= au1100fb_drv_suspend,
+        .remove_new	= au1100fb_drv_remove,
+        .suspend	= au1100fb_drv_suspend,
         .resume		= au1100fb_drv_resume,
 };
 module_platform_driver(au1100fb_driver);
-- 
2.39.2

