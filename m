Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC006BFDD6
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C962810E4E6;
	Sat, 18 Mar 2023 23:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E29810E4A7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNr-0004EY-7d; Sun, 19 Mar 2023 00:54:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNq-0056bc-Ii; Sun, 19 Mar 2023 00:54:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNp-005zVS-ND; Sun, 19 Mar 2023 00:54:45 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 29/51] video: fbdev: offb: Convert to platform remove callback
 returning void
Date: Sun, 19 Mar 2023 00:54:06 +0100
Message-Id: <20230318235428.272091-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=lM7DJP3rqO/O01i5ldb/xVqYOdKBmxyQQSGfKw8fSgI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7HbDG7Kr2qUU0J+qizBK+pgPQ7KcH2TsMhp
 osbez4uY/+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOxwAKCRCPgPtYfRL+
 TrnuB/9MnlaJ4CugSGFM5+KI4NSWMpbbM1hGCK6nwSZq2iHg5Wz+mrvUX5z75U3AF5MHUoLgsV6
 7nadWePX8NRqxoRFtMgYqyXbYWIg6fH4FqEY/XIU6BN5gYrJioGJ2P6dHIWVv1bNQDyxlDsoUH3
 owpoYXQTk4D2J//pfyEA5Ap7fbGHEDjOEWEJWzO5hU4hqLOForp54j/dLWrXR/gW3q3vv3Bh+dY
 xApG0gkLEv0o4ZYJ8sejtKbLaCPZ6xrRlE0xoLbZMji09u8M4Sv+nMUTydU739H8F3whNcdN0ru
 pdjYCCC6SrBtUNtNs0Xgg6qPz4LIIMQANjkpXKCf+J7jJEXK
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
 drivers/video/fbdev/offb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index f7ad6bc9d02d..b18d8c851918 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -658,14 +658,12 @@ static void offb_init_nodriver(struct platform_device *parent, struct device_nod
 	}
 }
 
-static int offb_remove(struct platform_device *pdev)
+static void offb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
 	if (info)
 		unregister_framebuffer(info);
-
-	return 0;
 }
 
 static int offb_probe_bootx_noscreen(struct platform_device *pdev)
@@ -680,7 +678,7 @@ static struct platform_driver offb_driver_bootx_noscreen = {
 		.name = "bootx-noscreen",
 	},
 	.probe = offb_probe_bootx_noscreen,
-	.remove = offb_remove,
+	.remove_new = offb_remove,
 };
 
 static int offb_probe_display(struct platform_device *pdev)
@@ -702,7 +700,7 @@ static struct platform_driver offb_driver_display = {
 		.of_match_table = offb_of_match_display,
 	},
 	.probe = offb_probe_display,
-	.remove = offb_remove,
+	.remove_new = offb_remove,
 };
 
 static int __init offb_init(void)
-- 
2.39.2

