Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A26BFDC7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4012810E4D3;
	Sat, 18 Mar 2023 23:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2B110E4A8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNm-00042A-QG; Sun, 19 Mar 2023 00:54:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNl-0056Zk-Rl; Sun, 19 Mar 2023 00:54:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNk-005zTs-U9; Sun, 19 Mar 2023 00:54:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/51] video: fbdev: broadsheetfb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:53:42 +0100
Message-Id: <20230318235428.272091-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=VgwZokMV1vu+3tlRHHL/flQpGrx/iRGlfVD7lGhT1RU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk6s49ZQXYq/Xq+8IfpiK7tIGUo+73fjRJPv8
 W92nea4HxOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOrAAKCRCPgPtYfRL+
 Tjw/B/0UYkquKvFjfHEJZxhFlDnXF2qQv4FRjCzd25MyLPbzU3/Y2ENtDFzOz059sRqJ3oQZc0h
 MpJIPaMiHNqRWzJPViL0chSlgYj2NZqIgZVd7sNlgteKomIkDk+pi3zn6C7+94CC2rCM9u5hNcJ
 QWkTHvWJWNFhz7rGHT2OCTP1Btw/PiidtFPcCg9nVUKhB5zKpmc7h6n6M2PYPt58Ixw0XysjzME
 IDTXAmDJT7arXBSSbgCCRTjxrThsRY7JPR5fq0mF/uSfIQs3wpPqFEGPdmO/j7FEupFigrp2KdB
 pESQqGoYVYYbxTOXl8BHIk61x/bmKyhpptyWMuq9HTqPiOG3
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
 drivers/video/fbdev/broadsheetfb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index 55e62dd96f9b..b518cacbf7cd 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1193,7 +1193,7 @@ static int broadsheetfb_probe(struct platform_device *dev)
 
 }
 
-static int broadsheetfb_remove(struct platform_device *dev)
+static void broadsheetfb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
 
@@ -1209,12 +1209,11 @@ static int broadsheetfb_remove(struct platform_device *dev)
 		module_put(par->board->owner);
 		framebuffer_release(info);
 	}
-	return 0;
 }
 
 static struct platform_driver broadsheetfb_driver = {
 	.probe	= broadsheetfb_probe,
-	.remove = broadsheetfb_remove,
+	.remove_new = broadsheetfb_remove,
 	.driver	= {
 		.name	= "broadsheetfb",
 	},
-- 
2.39.2

