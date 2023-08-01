Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B3F76B285
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A3810E3B8;
	Tue,  1 Aug 2023 11:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D2F10E3B8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:02:48 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-0006et-HM; Tue, 01 Aug 2023 13:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9H-000MYo-92; Tue, 01 Aug 2023 13:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9G-009bbB-Iu; Tue, 01 Aug 2023 13:02:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 03/12] drm/imx/dcss: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:30 +0200
Message-Id: <20230801110239.831099-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BZidcBKSd2ijbj/nbjOcmWzNwzUJOCE1Cp5633XAJv0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW3i4JmG18OS0lfn5jCU63b1aNkP0mw7apvE
 BJ3+NChQ8qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjltwAKCRCPgPtYfRL+
 To83B/9/qDabOlJac5i/Fmd0JtapI7S7gD+oNBuLW6g0IGJZ6Pyavf1dCTciKE/dWYtQr87JrgX
 OqrN1mq3M4mZDU59xSAngDVXRefZpyN7SxLOjLrHk1raKUCDi4nlEg4LCQ5q9ZSxaf0BzEydpam
 zkhav2rC5VfS6gwy5pY4klG2vQTAGLduNWK+3SExAep//vKdR9tDADpzwfdhQNOCiaxEz1ZPUq3
 /1x07eoM6TS7Egg59VmBkE4GJz4qSbgHz1QwwknWDJ//HFtUGFYjq9IqM8HCwKz4O0OdV01wiBv
 9Oxlz9Qy+/FFouqmqUIvOQbY49WPlhgNwNFiLB1jj2TF8hUZ
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
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
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
index c68b0d93ae9e..4354f50ff0b6 100644
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
 
 static struct dcss_type_data dcss_types[] = {
@@ -113,7 +111,7 @@ MODULE_DEVICE_TABLE(of, dcss_of_match);
 
 static struct platform_driver dcss_platform_driver = {
 	.probe	= dcss_drv_platform_probe,
-	.remove	= dcss_drv_platform_remove,
+	.remove_new = dcss_drv_platform_remove,
 	.driver	= {
 		.name = "imx-dcss",
 		.of_match_table	= dcss_of_match,
-- 
2.39.2

