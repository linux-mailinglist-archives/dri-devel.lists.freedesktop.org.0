Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 862EB76B283
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD0B10E3C1;
	Tue,  1 Aug 2023 11:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C2810E3B8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:02:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-0006eq-HM; Tue, 01 Aug 2023 13:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9G-000MYd-PC; Tue, 01 Aug 2023 13:02:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9G-009bb5-3B; Tue, 01 Aug 2023 13:02:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 01/12] drm/armada: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:28 +0200
Message-Id: <20230801110239.831099-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=e6+jxejfK05rrkXCeE3vmw2B5tXoHFX6p5WlEJwaDMM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW0+eqIJ7GZAuSPMUifRigb2JN7Hoj/W5zTY
 K7p8FwbOgyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjltAAKCRCPgPtYfRL+
 Ti9gB/4mDAFXndo5v4osNJFjDPIg2glZvNtUdurDsyJMUjAAFTRZHZV66R0r1rAKEtR5m5uWm4t
 158doABaeV+r1jiauZDvkAw43SnDlbbA/9qzRJfGPK4Y2O6nrfpKaq0uMshA9ldx2iBJa+Bdsrs
 xrZ6Sp4FDSpzvPyC3LBazWP8CkVw8pqABTsvPgS3lzbGDPaJn/OLg6B05T4hFimAc7ydT5skb9X
 rqxIDVqfNXDpLgtn1TpxiRui6G1h5X1ilndZJc6afUIqG/PtiZQTovjq9pp5nj0CMLI7nBIX3IJ
 rUmsxWrFhAv8bHY1cEzlvYB054Br0lsnLOMuPcVUeWqNywOJ
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the armada drm drivers from always returning zero in
the remove callback to the void returning variant.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/armada/armada_crtc.c | 5 ++---
 drivers/gpu/drm/armada/armada_drv.c  | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index 15dd667aa2e7..52d2c942d3d2 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -1066,10 +1066,9 @@ static int armada_lcd_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &armada_lcd_ops);
 }
 
-static int armada_lcd_remove(struct platform_device *pdev)
+static void armada_lcd_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &armada_lcd_ops);
-	return 0;
 }
 
 static const struct of_device_id armada_lcd_of_match[] = {
@@ -1095,7 +1094,7 @@ MODULE_DEVICE_TABLE(platform, armada_lcd_platform_ids);
 
 struct platform_driver armada_lcd_platform_driver = {
 	.probe	= armada_lcd_probe,
-	.remove	= armada_lcd_remove,
+	.remove_new = armada_lcd_remove,
 	.driver = {
 		.name	= "armada-lcd",
 		.owner	=  THIS_MODULE,
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index e8d2fe955909..da3fc60d3cfa 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -224,10 +224,9 @@ static int armada_drm_probe(struct platform_device *pdev)
 					       match);
 }
 
-static int armada_drm_remove(struct platform_device *pdev)
+static void armada_drm_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &armada_master_ops);
-	return 0;
 }
 
 static const struct platform_device_id armada_drm_platform_ids[] = {
@@ -242,7 +241,7 @@ MODULE_DEVICE_TABLE(platform, armada_drm_platform_ids);
 
 static struct platform_driver armada_drm_platform_driver = {
 	.probe	= armada_drm_probe,
-	.remove	= armada_drm_remove,
+	.remove_new = armada_drm_remove,
 	.driver	= {
 		.name	= "armada-drm",
 	},
-- 
2.39.2

