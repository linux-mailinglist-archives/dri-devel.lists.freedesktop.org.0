Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4056BFDB3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5002C10E4C8;
	Sat, 18 Mar 2023 23:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2740C10E044
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNr-0004FO-VP; Sun, 19 Mar 2023 00:54:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNr-0056bv-Bq; Sun, 19 Mar 2023 00:54:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNq-005zVh-Iy; Sun, 19 Mar 2023 00:54:46 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 33/51] video: fbdev: pxa168fb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:10 +0100
Message-Id: <20230318235428.272091-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=vtff1YefPu16NIx7dfVejF36q3zG5SnLBInX8ldImOs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7RiHQCL/mfO4Uhk1pOkAIxroI93+mC9yGuy
 SjBmF+Qet+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZO0QAKCRCPgPtYfRL+
 Tm/dCACSmTtjFVNGYLu1dxuifhRFrfB7RHjDelFsTf20alfmilPv5NMOEW0RZsoByVMSAIstNF4
 1HwMhnDY2wc2mqMWMoXSj5sGLpxj0jmRJC1eg+xTFywtykNB+d9HCiyIvg9Tb2t3yEkZGAkJWPX
 1uftjc+DeDu+/E/BJK1eGIVNGyYAXz12QyEdQe5HYKcHafICzBwlTLvbNnatDhRx84AXCgyf4/C
 QuqBT2dQQM1fo0rBA+bdLTMw6X34da+PoZhqL+QQg2MRSUXdqf3gZ/R7l+XjJGEhLaGpz3+yeJg
 YYtdzCcHYTsG9lDquN+GDJclNnagJaQhBQozyLEnSY4jK5cA
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
 drivers/video/fbdev/pxa168fb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index d5d0bbd39213..79f338463092 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -765,14 +765,14 @@ static int pxa168fb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pxa168fb_remove(struct platform_device *pdev)
+static void pxa168fb_remove(struct platform_device *pdev)
 {
 	struct pxa168fb_info *fbi = platform_get_drvdata(pdev);
 	struct fb_info *info;
 	unsigned int data;
 
 	if (!fbi)
-		return 0;
+		return;
 
 	/* disable DMA transfer */
 	data = readl(fbi->reg_base + LCD_SPU_DMA_CTRL0);
@@ -794,8 +794,6 @@ static int pxa168fb_remove(struct platform_device *pdev)
 	clk_disable_unprepare(fbi->clk);
 
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static struct platform_driver pxa168fb_driver = {
@@ -803,7 +801,7 @@ static struct platform_driver pxa168fb_driver = {
 		.name	= "pxa168-fb",
 	},
 	.probe		= pxa168fb_probe,
-	.remove		= pxa168fb_remove,
+	.remove_new	= pxa168fb_remove,
 };
 
 module_platform_driver(pxa168fb_driver);
-- 
2.39.2

