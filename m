Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E06E6F99E1
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1036110E298;
	Sun,  7 May 2023 16:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F2110E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-00029H-Uz; Sun, 07 May 2023 18:26:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-001nE2-OD; Sun, 07 May 2023 18:26:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-002Ai0-29; Sun, 07 May 2023 18:26:37 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 36/53] drm/panfrost: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:59 +0200
Message-Id: <20230507162616.1368908-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=eYWGh9UUGNbFrss+H8ko5zFeXRgPhPwqqImGCYXepXY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9ENjtziTLJRuQzp+mWoM+vdSqwBfQsHlqiwh
 VMpkYJtIl+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRDQAKCRCPgPtYfRL+
 Tu/FB/4sKccabqvQx1/s076FdnRyHvRH4pviSfj7KFsdQU43I+L0JXGt9gI54dxe1Ali0p/7KjT
 esmHUfqUB46GUs+aNwxtxfkvW5K/E1inqU2zcpgRZHIMdwPN/NDYE+exgx7+UTldqpAwCbIykb6
 UGbxWXJR0qdoNL25U2XHD5MPas02hh/XnhL7rKHfHZaih5Sec3vrQvFgF5xeR3jVUXqwu8cWX3f
 riAPhMT/M3TZLpaEx6vWYdUYd4bKDGixOBvEOC6LtGGX+9SeZmzN4vA0cQHnpr3cpD6yrt9bTAf
 L5G/hV/7t18O3W+sFG7VlwYqJqR18sm4nsz5MXUFx9F2KYHZ
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
Cc: kernel@pengutronix.de, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
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
 drivers/gpu/drm/panfrost/panfrost_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index abb0dadd8f63..adaacc8c39d7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -618,7 +618,7 @@ static int panfrost_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int panfrost_remove(struct platform_device *pdev)
+static void panfrost_remove(struct platform_device *pdev)
 {
 	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
 	struct drm_device *ddev = pfdev->ddev;
@@ -632,7 +632,6 @@ static int panfrost_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(pfdev->dev);
 
 	drm_dev_put(ddev);
-	return 0;
 }
 
 /*
@@ -687,7 +686,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
 
 static struct platform_driver panfrost_driver = {
 	.probe		= panfrost_probe,
-	.remove		= panfrost_remove,
+	.remove_new	= panfrost_remove,
 	.driver		= {
 		.name	= "panfrost",
 		.pm	= pm_ptr(&panfrost_pm_ops),
-- 
2.39.2

