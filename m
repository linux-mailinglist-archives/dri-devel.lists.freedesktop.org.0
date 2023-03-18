Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B8D6BFDCA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D79310E4D5;
	Sat, 18 Mar 2023 23:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA9710E4B5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:55:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-0004G2-Tv; Sun, 19 Mar 2023 00:54:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNr-0056c1-IR; Sun, 19 Mar 2023 00:54:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNq-005zVp-Va; Sun, 19 Mar 2023 00:54:46 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "wangkailong@jari.cn" <wangkailong@jari.cn>, Wang Qing <wangqing@vivo.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 35/51] video: fbdev: pxafb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:12 +0100
Message-Id: <20230318235428.272091-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ToKPvkcSVf7gwcqVnlkd+MPP/Yk+TeDi0dFi139xI6U=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhhQxvxsMbdG9e5gmVZmvC7oTXjC/IPDFhgPR8dcPHsn/p
 pXMnrahk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFN4eIUgImo/2b/K3jx9YrlXfE7Dri3
 lD6sKtzXdaYh9Y931Oail4Im/kf3zWGWD7kU2e4Y2XGJ4eblx0FvAg4zreewF93uUX/zR9bldd/
 3tultFr/ZL7OnbuItlpjiu7rHlHe8fKAevmFipZBFQ5eGpbzBgQbOYuP02P365edMvZteb/NJmX
 f9yb1eC4aUvpuMm9gML3g72Predd/cURL3QWbrLKMMFr17WknBEccU5eMfzFWcavwhNmTX+e7d5
 pZ5z19/3hcxuWf/1qRrh1gni3reNpM3qK1jENfW4PiY/nSJhpXof6clly4dO5N19bQAy3PTIztX
 vJ4YU3h9g0eZib3kuwb1uxfe2kYHy910KlM3ene5Tt0RAA==
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
 drivers/video/fbdev/pxafb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index c46ed78298ae..2a8b1dea3a67 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2396,13 +2396,13 @@ static int pxafb_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int pxafb_remove(struct platform_device *dev)
+static void pxafb_remove(struct platform_device *dev)
 {
 	struct pxafb_info *fbi = platform_get_drvdata(dev);
 	struct fb_info *info;
 
 	if (!fbi)
-		return 0;
+		return;
 
 	info = &fbi->fb;
 
@@ -2418,8 +2418,6 @@ static int pxafb_remove(struct platform_device *dev)
 
 	dma_free_coherent(&dev->dev, fbi->dma_buff_size, fbi->dma_buff,
 			  fbi->dma_buff_phys);
-
-	return 0;
 }
 
 static const struct of_device_id pxafb_of_dev_id[] = {
@@ -2432,7 +2430,7 @@ MODULE_DEVICE_TABLE(of, pxafb_of_dev_id);
 
 static struct platform_driver pxafb_driver = {
 	.probe		= pxafb_probe,
-	.remove 	= pxafb_remove,
+	.remove_new 	= pxafb_remove,
 	.driver		= {
 		.name	= "pxa2xx-fb",
 		.of_match_table = pxafb_of_dev_id,
-- 
2.39.2

