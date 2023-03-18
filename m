Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED36BFDC3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F12610E4CD;
	Sat, 18 Mar 2023 23:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB3810E4B9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNw-0004TX-R9; Sun, 19 Mar 2023 00:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-0056dE-Vf; Sun, 19 Mar 2023 00:54:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-005zWt-9i; Sun, 19 Mar 2023 00:54:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
	Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 51/51] video: fbdev: xilinxfb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:28 +0100
Message-Id: <20230318235428.272091-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Dl/6zgd8+L0yBXWOI+uig7Ijl6aILn0Iyon1WoU7m5A=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8jmzU9uwGzi8BtpTJLCRViAD6Y6SqBed1m0
 PQ8htw9t0iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPIwAKCRCPgPtYfRL+
 TqKZB/4/AKNbmiQPwz/0Ml98yLh4xd+PER5MPql4CSnmrWdhvK46emp3l3AfwrmOs3W5TXTl3SP
 lmBsCXxmxtgCrR01JSDqGQFQEYTXUTJsByIEt/5zqnq1lN3qqAozpxSNeLrk70uRD0fl3F4AhHe
 04YCxXZi8+xe/DFkqAdOuod7dxLfm+4GK5PPjQjeawmVi4Wu0ImnTEtobgkj2hpGvB3lAPeAzf2
 Ol68lVT6Q8bBNKozMIM6bpMY9S7BMKk8TCNiXusdgRElYYBsbLjGP7hXAFMQ5TYN19Myaqr3rN3
 Moaa2Fcthi6G/ahdDdFVAqlmjLTW1steAOejFyfHLaBmGtAw
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
Cc: kernel@pengutronix.de, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
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
 drivers/video/fbdev/xilinxfb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 1ac83900a21c..90c2939971a2 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -476,11 +476,9 @@ static int xilinxfb_of_probe(struct platform_device *pdev)
 	return xilinxfb_assign(pdev, drvdata, &pdata);
 }
 
-static int xilinxfb_of_remove(struct platform_device *op)
+static void xilinxfb_of_remove(struct platform_device *op)
 {
 	xilinxfb_release(&op->dev);
-
-	return 0;
 }
 
 /* Match table for of_platform binding */
@@ -496,7 +494,7 @@ MODULE_DEVICE_TABLE(of, xilinxfb_of_match);
 
 static struct platform_driver xilinxfb_of_driver = {
 	.probe = xilinxfb_of_probe,
-	.remove = xilinxfb_of_remove,
+	.remove_new = xilinxfb_of_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = xilinxfb_of_match,
-- 
2.39.2

