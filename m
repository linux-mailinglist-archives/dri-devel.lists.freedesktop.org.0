Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952FD7DF80C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7010E935;
	Thu,  2 Nov 2023 16:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFC710E935
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-00035A-SC; Thu, 02 Nov 2023 17:57:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0F-0067Ex-TJ; Thu, 02 Nov 2023 17:57:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0F-00Bjbx-KC; Thu, 02 Nov 2023 17:57:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 03/16] drm/armada: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:44 +0100
Message-ID: <20231102165640.3307820-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2741;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ARudui+iEE4LPWusl63pAZ5q3xNGuZN3+lpWFZljkcY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TM0P8HV1UEBEffdMKbW3y6XXKEaiHbz2ucN
 Jnb8cuX8L2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPUzAAKCRCPgPtYfRL+
 TqQoCACbLQEYjcVd6FWNAk69HgOwY78PV/BC+EHSbT6kRtD94rcWfQ0R6koVMzgRHWJsh4fs+DU
 vsc2YP/pv57AZrCq9DxJD45bpJGh4KwUkiR2DxWd6oEVYkENxOt2ghVatradvWlR5TcEtiHYcOf
 FmBir4GrQXSIv7/29xGxZ0T1wdIUQCZblqXnpCUXrlSb9MSEbvaEIDTPkcZ2KewWcCMdeMOwau5
 QFTx4NfJwaYmx6uXMnY3b39vpTikNeYk4pZfwRUiHF8Rns8tuduPvNgaOWxasm6rdDEN/LIFae0
 A8Vkq0bhMLJVy8bGhfAHrlioPSPtakjku8fjVTbulxTgMNhW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
index fa1c67598706..e51ecc4f7ef4 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -226,10 +226,9 @@ static int armada_drm_probe(struct platform_device *pdev)
 					       match);
 }
 
-static int armada_drm_remove(struct platform_device *pdev)
+static void armada_drm_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &armada_master_ops);
-	return 0;
 }
 
 static void armada_drm_shutdown(struct platform_device *pdev)
@@ -249,7 +248,7 @@ MODULE_DEVICE_TABLE(platform, armada_drm_platform_ids);
 
 static struct platform_driver armada_drm_platform_driver = {
 	.probe	= armada_drm_probe,
-	.remove	= armada_drm_remove,
+	.remove_new = armada_drm_remove,
 	.shutdown = armada_drm_shutdown,
 	.driver	= {
 		.name	= "armada-drm",
-- 
2.42.0

