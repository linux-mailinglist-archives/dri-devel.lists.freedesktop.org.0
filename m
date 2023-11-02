Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14557DF81B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1062510E14A;
	Thu,  2 Nov 2023 16:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7E210E943
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-00035j-1m; Thu, 02 Nov 2023 17:57:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-0067FH-6o; Thu, 02 Nov 2023 17:57:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-00BjcL-TI; Thu, 02 Nov 2023 17:57:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v3 09/16] drm/imx/dcss: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:50 +0100
Message-ID: <20231102165640.3307820-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1923;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=V4czH1CCfpArAwZxoffdkWg5DNofprAYfQq5E9cZxGI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TTvvHEs3VZnBciHp4/mgzFMCAQGjPbTH78L
 PPlaD7Nr5CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU0wAKCRCPgPtYfRL+
 ThZYCAC5TQDmeszIQuYo7weeluJZVWn8egjC4k5FLvJvdj8+cHeWqF0iwyC9+HORtjjrhLZGgpK
 aHxYBLq+t43OYBfjaevylp36xkuEN1e52wHnnLeB9dXGuliCEYqeoH1gXg3yrEBjKzFSuMNpkIQ
 WoaxBaUlas9nI2d+NmYhkguudBiIy9+gEV3xz60QVMIw3XHss5u1yhifS1wYdXxq0maUY/yHcru
 oT4X/vqI+LkGuoBMuelRbJcnA+BRLAtsjx5nWW6qSFvM2HJPse49C2NwjkKwK5VLIVwEU8MVW1O
 XnMQcNwpnpVgqBMTrK2hHcV4NDTRezSF4nN3y0e9nXf8YY1n
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imx/dcss/dcss-drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index b61cec0cc79d..ad5f29ea8f6a 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -80,7 +80,7 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int dcss_drv_platform_remove(struct platform_device *pdev)
+static void dcss_drv_platform_remove(struct platform_device *pdev)
 {
 	struct dcss_drv *mdrv = dev_get_drvdata(&pdev->dev);
 
@@ -88,8 +88,6 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
 	dcss_dev_destroy(mdrv->dcss);
 
 	kfree(mdrv);
-
-	return 0;
 }
 
 static void dcss_drv_platform_shutdown(struct platform_device *pdev)
@@ -120,7 +118,7 @@ MODULE_DEVICE_TABLE(of, dcss_of_match);
 
 static struct platform_driver dcss_platform_driver = {
 	.probe	= dcss_drv_platform_probe,
-	.remove	= dcss_drv_platform_remove,
+	.remove_new = dcss_drv_platform_remove,
 	.shutdown = dcss_drv_platform_shutdown,
 	.driver	= {
 		.name = "imx-dcss",
-- 
2.42.0

