Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652996BFDCE
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6F910E4DD;
	Sat, 18 Mar 2023 23:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E613A10E4B5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNw-0004Rb-F2; Sun, 19 Mar 2023 00:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-0056d6-JK; Sun, 19 Mar 2023 00:54:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNt-005zWh-MT; Sun, 19 Mar 2023 00:54:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 48/51] video: fbdev: vt8500lcdfb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:25 +0100
Message-Id: <20230318235428.272091-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=2FdpVHFGu+rqUO3b3048pcZ9lVd42tPkiAFw8A7/TEY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8a6GzzepW0HGR7t+ZcYoIgmJFdz1TRptOmf
 +dUuutk0gKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPGgAKCRCPgPtYfRL+
 TmYRCAC4/CTu/Eo/pubXMwIqK9nbi7HpjXF5gvvh8z+eXZyClvg1KV3Uodl+4KI/OxMfRq32jNx
 daz0+qo8QhcmhsnwKq4vrwhUq68aW+0YLVX2vfdx1Rj+UQ6xwXbpD96mu8LHmUpFbLK2gUKzN1g
 mURmXyWpxORkQnIhLPow4g70IhI02JknOEAU4/zCQObLof7mCx3EOPGd1cn7+Kvf8G2xhIuMzm/
 oEwnBXEPbnPppbi0JVEjyfMCFXRe1c2fnen6IVy+BxFYOxRWUSuR59jhKoDDtNUNzxL7Ixzh91p
 iJrxRavc6OvJwqz2uSD6+/tiD7u/++auyzXoINLyAWILzuJ8
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
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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
 drivers/video/fbdev/vt8500lcdfb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index c61476247ba8..31d4e85b220c 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -439,7 +439,7 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vt8500lcd_remove(struct platform_device *pdev)
+static void vt8500lcd_remove(struct platform_device *pdev)
 {
 	struct vt8500lcd_info *fbi = platform_get_drvdata(pdev);
 	struct resource *res;
@@ -462,8 +462,6 @@ static int vt8500lcd_remove(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	release_mem_region(res->start, resource_size(res));
-
-	return 0;
 }
 
 static const struct of_device_id via_dt_ids[] = {
@@ -473,7 +471,7 @@ static const struct of_device_id via_dt_ids[] = {
 
 static struct platform_driver vt8500lcd_driver = {
 	.probe		= vt8500lcd_probe,
-	.remove		= vt8500lcd_remove,
+	.remove_new	= vt8500lcd_remove,
 	.driver		= {
 		.name	= "vt8500-lcd",
 		.of_match_table = of_match_ptr(via_dt_ids),
-- 
2.39.2

