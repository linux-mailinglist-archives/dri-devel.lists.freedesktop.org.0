Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B486BFDCF
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE5A10E4DA;
	Sat, 18 Mar 2023 23:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BD910E4A7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNt-0004Ie-SC; Sun, 19 Mar 2023 00:54:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNt-0056ca-75; Sun, 19 Mar 2023 00:54:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNs-005zWF-8K; Sun, 19 Mar 2023 00:54:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>
Subject: [PATCH 41/51] video: fbdev: sm501fb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:18 +0100
Message-Id: <20230318235428.272091-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=pDC/vxi7M1WVeJfw3LTq5g2jhyRxYY/G5blZT2oqmX8=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhhQxv79y5syMy5wkpDy5/SbLRulwpW04NWeTzc6/hv4u9
 5aYFzh3MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRXTrs/0ynBstZPLH4bRkx
 ydC6JytxMidPpaNY24rs/MSpX+ds1kndN/eL8nNuW9FJ6g2WySqpv9t+2S2Jdlz2POPpj2uMLE7
 pjVEbzj4rPb1tqcoluV2xy1gfa21TWnb/mUT74oxt/1xaEyU5O6r1HNmXJMcn7jxQe7BoQcbXN7
 HWcz48mRF4hX9vYyFXyufAh4vPn7V7Jplm9T4kkaHVdNd5u4gs39AfP83ObuOZXSEXNP1YstZ/T
 QffJ+5XzI7cOVnL12B3tDL91RFhX/OruxLCxP/f22osxqToqVJ1YHbWIn3uydtO2ydvzLe+fqRP
 43z+Io+gNPczFrH7N7OafdaX/r2pc6Vn/DNxRsmrer1TAA==
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
 drivers/video/fbdev/sm501fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index f743bfbde2a6..9a95c21203ce 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -2045,7 +2045,7 @@ static int sm501fb_probe(struct platform_device *pdev)
 /*
  *  Cleanup
  */
-static int sm501fb_remove(struct platform_device *pdev)
+static void sm501fb_remove(struct platform_device *pdev)
 {
 	struct sm501fb_info *info = platform_get_drvdata(pdev);
 	struct fb_info	   *fbinfo_crt = info->fb[0];
@@ -2064,8 +2064,6 @@ static int sm501fb_remove(struct platform_device *pdev)
 
 	framebuffer_release(fbinfo_pnl);
 	framebuffer_release(fbinfo_crt);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -2209,7 +2207,7 @@ static int sm501fb_resume(struct platform_device *pdev)
 
 static struct platform_driver sm501fb_driver = {
 	.probe		= sm501fb_probe,
-	.remove		= sm501fb_remove,
+	.remove_new	= sm501fb_remove,
 	.suspend	= sm501fb_suspend,
 	.resume		= sm501fb_resume,
 	.driver		= {
-- 
2.39.2

