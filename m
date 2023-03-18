Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9746BFDB7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD8110E4BF;
	Sat, 18 Mar 2023 23:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A9B10E4B3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNv-0004Oi-QK; Sun, 19 Mar 2023 00:54:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-0056cw-4o; Sun, 19 Mar 2023 00:54:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNt-005zWU-4L; Sun, 19 Mar 2023 00:54:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 45/51] video: fbdev: vfb: Convert to platform remove callback
 returning void
Date: Sun, 19 Mar 2023 00:54:22 +0100
Message-Id: <20230318235428.272091-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=J3g2K4GMb81lpfP0l/rZbwcFlTXYkFbJI8iSz7+fgko=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8QQQyh90Gn9MCfsNvSK2H/urQWL0MtmPpl9
 Qu3fEKUsIuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPEAAKCRCPgPtYfRL+
 TpbZB/4hMYWp7j35SdnRXPioguUdSxW7csS8ccr2l/XryI5c9EQldOebbYsWJkt7hTLIegnBdcN
 yCw+8axg3P8FhztvGuaZJKvHr9D4tEu86qSEqAwxoTWmnhTlFMencFte3EVl01m4TgoypckM48S
 0GehJHcSiXrZKCp7ixP4ckk7ltRKz7rP6TdV54QmwZOcXH4nVTVD4cJwKVpnXzDRHzmJ443yp1p
 OO7nWXd92pobHR18aPZvTTcLHjeynI9e0ri1KKVEbwhlv0OaVXGyC67NL0Mq6f7cdGjwLFCFaHm
 Z4dXMf2Oji3UJxgm9HFWiP5TEtjJ8x3wM+lg6zFnQrEQCpRV
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
 drivers/video/fbdev/vfb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index 95d3c59867d0..1a2514d564fc 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -479,7 +479,7 @@ static int vfb_probe(struct platform_device *dev)
 	return retval;
 }
 
-static int vfb_remove(struct platform_device *dev)
+static void vfb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
 
@@ -489,12 +489,11 @@ static int vfb_remove(struct platform_device *dev)
 		fb_dealloc_cmap(&info->cmap);
 		framebuffer_release(info);
 	}
-	return 0;
 }
 
 static struct platform_driver vfb_driver = {
 	.probe	= vfb_probe,
-	.remove = vfb_remove,
+	.remove_new = vfb_remove,
 	.driver = {
 		.name	= "vfb",
 	},
-- 
2.39.2

