Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 558756F99C6
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E60510E245;
	Sun,  7 May 2023 16:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED7910E221
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-0001kG-Se; Sun, 07 May 2023 18:26:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-001nCQ-8m; Sun, 07 May 2023 18:26:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDR-002Agi-JH; Sun, 07 May 2023 18:26:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 17/53] drm/etnaviv: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:40 +0200
Message-Id: <20230507162616.1368908-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=LGWRACpyXOQNyHkdacYcXEPxMrPtXUYIVDimy4ZnAMQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9D3ZE3TDbK2iwkNWfrp21JRUdMH1kusifiOC
 jAwa5djrkyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ9wAKCRCPgPtYfRL+
 TsjvB/0XKCq+uqfNqVwAyaJu6A7dx1wg2qP4JIBqXmfaZIDE4bHAx4/AQhCQ8tnuCk1EpmhUqJ9
 WBKpUDwjngWZwNXgZK7/v5a3Crw7xPrlveTcO5tn0TdMRayRQBK61X+kOApUW35ac1kGdzQ62Z1
 WN70Qb+HxLaygixS01cGi/g3R1RKadhnm6tDoyqmOajRayudFS1z7JczjUI/zlLYt+3vGu3SAxR
 BGQZhV75HNfXTkZ1MfdIA5GRKjPUbCtyw+lHIi2r6J75UwaAanf3igJtsywb4sGQNXwlKxZfEq/
 WMW6TpyAIYnJukja9x/lL058Y3p8V2323bhDehZhTKqRHzsC
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the etnaviv drm driver from always returning zero in
the remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 ++----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 31a7f59ccb49..071254653cf3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -641,16 +641,14 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
 }
 
-static int etnaviv_pdev_remove(struct platform_device *pdev)
+static void etnaviv_pdev_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &etnaviv_master_ops);
-
-	return 0;
 }
 
 static struct platform_driver etnaviv_platform_driver = {
 	.probe      = etnaviv_pdev_probe,
-	.remove     = etnaviv_pdev_remove,
+	.remove_new = etnaviv_pdev_remove,
 	.driver     = {
 		.name   = "etnaviv",
 	},
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index de8c9894967c..52ab18a30b85 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1892,11 +1892,10 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
+static void etnaviv_gpu_platform_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &gpu_ops);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int etnaviv_gpu_rpm_suspend(struct device *dev)
@@ -1954,6 +1953,6 @@ struct platform_driver etnaviv_gpu_driver = {
 		.of_match_table = etnaviv_gpu_match,
 	},
 	.probe = etnaviv_gpu_platform_probe,
-	.remove = etnaviv_gpu_platform_remove,
+	.remove_new = etnaviv_gpu_platform_remove,
 	.id_table = gpu_ids,
 };
-- 
2.39.2

