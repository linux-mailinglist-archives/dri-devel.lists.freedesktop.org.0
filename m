Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F0D6F99F6
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EE010E2B8;
	Sun,  7 May 2023 16:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B86310E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-0002Mf-0o; Sun, 07 May 2023 18:26:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-001nEp-9F; Sun, 07 May 2023 18:26:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-002Aie-JK; Sun, 07 May 2023 18:26:39 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 46/53] drm/tidss: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:26:09 +0200
Message-Id: <20230507162616.1368908-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ANtzq8/9UZCNsbM/IixKvj1bO4fEdw+5f3XsndyCFpk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EaAL0rDPIg0dHrT08sSCrCNpSJxIxKsO4TU
 TC3Lsz1PpGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRGgAKCRCPgPtYfRL+
 TknQCACGiI4h0d+Cz1zbRoCsNjEDkjYUnJIZoeS+Y2qvDjDZK3oF/5LLQHIiJwXPX62ix2OSIRz
 zvIPICLoAo0pVFF5ihdNByco+M29AS1h4Xmc3lCAglCzuesBvK3y3xH1Xz7asTnx2uSo5uKF/P9
 jZqZJJixne9aZJ98QiMGMfEOwraWtuhMBdnLXgGS8tWek8rlzWpQUrtjjgYwXjuJXqsyI/eGEL+
 kiV48F3lDGasCwFYW4E0dErV9HhAC+mWiqw3MKo/wsXLWpAleOjFplrgcLOS0Huupx6BtM3QdDz
 e7BLVUNCw8BKTtrA1rnaxBKjaa/zklsU6k23G7kVk5IiCiXw
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
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
 drivers/gpu/drm/tidss/tidss_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 2dac8727d2f4..13177d58c8f9 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -197,7 +197,7 @@ static int tidss_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tidss_remove(struct platform_device *pdev)
+static void tidss_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tidss_device *tidss = platform_get_drvdata(pdev);
@@ -221,8 +221,6 @@ static int tidss_remove(struct platform_device *pdev)
 	dispc_remove(tidss);
 
 	dev_dbg(dev, "%s done\n", __func__);
-
-	return 0;
 }
 
 static void tidss_shutdown(struct platform_device *pdev)
@@ -241,7 +239,7 @@ MODULE_DEVICE_TABLE(of, tidss_of_table);
 
 static struct platform_driver tidss_platform_driver = {
 	.probe		= tidss_probe,
-	.remove		= tidss_remove,
+	.remove_new	= tidss_remove,
 	.shutdown	= tidss_shutdown,
 	.driver		= {
 		.name	= "tidss",
-- 
2.39.2

