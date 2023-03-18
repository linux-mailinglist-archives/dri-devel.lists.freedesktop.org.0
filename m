Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C866BFDC0
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4DD10E4BD;
	Sat, 18 Mar 2023 23:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B467910E044
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNm-00042M-NY; Sun, 19 Mar 2023 00:54:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNm-0056Zq-2p; Sun, 19 Mar 2023 00:54:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNl-005zU3-FR; Sun, 19 Mar 2023 00:54:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 08/51] video: fbdev: cg3: Convert to platform remove callback
 returning void
Date: Sun, 19 Mar 2023 00:53:45 +0100
Message-Id: <20230318235428.272091-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=5Sbma9BIO4OFhcgdG7SVgulX/iZKtvsUKh5UHCWLaYs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk6vwI32IkU1Rs+rgfK1arKQw4otCvcOwDxKJ
 MpCIim/4ZyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOrwAKCRCPgPtYfRL+
 TsrwB/0fggol6EYx1gi6WpqJuKXRU2Laf24VpOPz0FSghMz3/Vqt8l1e18eu/boGss6heMRaZdK
 0ZfKAyz3cVK9VdcRZT6H7h6hYGzC7NDgdaoP1ugIJv5PJudKLY3WYjl1zkDnZScN4qB7ulrAJiT
 ySzv/mPxhlsW50VWahrGbPKz39HxS8SR+PMKw5sQZz8DttoXLZ12sg/grQCUMuLJaddv5X1sMS8
 2pdfmwUVgSyeNOqT6dADHJGcVgWxBCfepmEJHqS57+sUB7KH/v57074ytZ7933FrLn7xsWM3KDO
 Hvb1KacM5F3U3eC3cPw0GaA2IrXuEHS+7P9CLMbUUu4zf5h5
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
 drivers/video/fbdev/cg3.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index bdcc3f6ab666..77956934e00a 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -434,7 +434,7 @@ static int cg3_probe(struct platform_device *op)
 	return err;
 }
 
-static int cg3_remove(struct platform_device *op)
+static void cg3_remove(struct platform_device *op)
 {
 	struct fb_info *info = dev_get_drvdata(&op->dev);
 	struct cg3_par *par = info->par;
@@ -446,8 +446,6 @@ static int cg3_remove(struct platform_device *op)
 	of_iounmap(&op->resource[0], info->screen_base, info->fix.smem_len);
 
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static const struct of_device_id cg3_match[] = {
@@ -467,7 +465,7 @@ static struct platform_driver cg3_driver = {
 		.of_match_table = cg3_match,
 	},
 	.probe		= cg3_probe,
-	.remove		= cg3_remove,
+	.remove_new	= cg3_remove,
 };
 
 static int __init cg3_init(void)
-- 
2.39.2

