Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A206F99E9
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11B810E28C;
	Sun,  7 May 2023 16:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F329210E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-0001dT-S6; Sun, 07 May 2023 18:26:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDO-001nBO-T0; Sun, 07 May 2023 18:26:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDO-002Afw-3k; Sun, 07 May 2023 18:26:26 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 05/53] drm/aspeed: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:28 +0200
Message-Id: <20230507162616.1368908-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=sobAg6Eg+gKdbd2fhmmqrspNYTQq+HfT/x7kh1gXCMU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9DoTwxX8oa8uhAkh2uW1KmDaDlPlpXQIcPiU
 HjOchsc3OaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ6AAKCRCPgPtYfRL+
 TnArCACeESOC7nnTd6GZkV1m4vCElrTeUnG/+J0vzaHSVXYMMPvUSLcWL98/DXESfV+vRbZdVRS
 zLWmtQHmaXaPiRztaOaAx1LVNoQ5D24/XgF+iTThVs4sADR0YZ79NBzbnZfnAtk0+P8bTNKazie
 AtF8t0diQ9aPZD56n+98UE5m/gmQQTTGfanrDGLuVyNJvD1Q+pXLyD1MFgA5Q02c4vpspE2ZKeh
 xEd1f7SfPAfXnqtMgt5C4ZHB30L3y0UaQmP+N/CIqvTkcgE0I4NLDKJW/DdMXgJU1Vkzd8uq4Q7
 W3wi0msfUPb8OgLWiEIjkUwajRsqZzxdjDRVCEXR749mAUuO
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
Cc: Andrew Jeffery <andrew@aj.id.au>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
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

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index ecfb060d2557..d0089e7fbfae 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -351,20 +351,18 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int aspeed_gfx_remove(struct platform_device *pdev)
+static void aspeed_gfx_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
 	sysfs_remove_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
 	drm_dev_unregister(drm);
 	aspeed_gfx_unload(drm);
-
-	return 0;
 }
 
 static struct platform_driver aspeed_gfx_platform_driver = {
 	.probe		= aspeed_gfx_probe,
-	.remove		= aspeed_gfx_remove,
+	.remove_new	= aspeed_gfx_remove,
 	.driver = {
 		.name = "aspeed_gfx",
 		.of_match_table = aspeed_gfx_match,
-- 
2.39.2

