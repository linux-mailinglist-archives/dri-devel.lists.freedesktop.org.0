Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564E6F99C9
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E19C10E222;
	Sun,  7 May 2023 16:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15A310E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDV-0001qk-Ln; Sun, 07 May 2023 18:26:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDU-001nCx-4W; Sun, 07 May 2023 18:26:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDT-002Ah6-Cy; Sun, 07 May 2023 18:26:31 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 23/53] drm/ingenic: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:46 +0200
Message-Id: <20230507162616.1368908-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=oqJ82rDPbejoSeR+k9lYVin9WuUFH7/jrOhYfGPtgEQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9D+00uZSnldPeVBZqM9VkFLDoFMFwx0/LK01
 k+o/x6VZruJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ/gAKCRCPgPtYfRL+
 TlOTCACKbM3+tb64WfqgKHt1ysDj82pxM6KwiSjsKq8vRDMZ0KMIlF93UPgj4ISSw+F3n03KBZn
 VvyaaQAqtEt+JYbzJ1EL0R0kZHyA7Zc2uSO+pWOx2JjiMR0gB71eKOQtwOLBi+x9i1hZqXtqfn7
 fsA8fObKAvqDCGGEAgVddRoXOGfH4PcyFwGn90qwTtrFxEmmsE8fJOSUJEjE8DQ+fkzPmqTSHz2
 eQQgbx7bzwo/gmMCpbkYBnBw6x+RyH/dh47sAo2wvpj2E2+oE9PrmeV0PgVmjwbKlZjac7CalWg
 WV/kFAGN8x6jsA45x9MqrCxAS9j6UG/o9CMOPBmOd+dt2jVl
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
Cc: kernel@pengutronix.de, linux-mips@vger.kernel.org,
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

Trivially convert the ingenic drm drivers from always returning zero in
the remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 6 ++----
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5ec75e9ba499..4a22b7465080 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1449,7 +1449,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	return component_master_add_with_match(dev, &ingenic_master_ops, match);
 }
 
-static int ingenic_drm_remove(struct platform_device *pdev)
+static void ingenic_drm_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
@@ -1457,8 +1457,6 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 		ingenic_drm_unbind(dev);
 	else
 		component_master_del(dev, &ingenic_master_ops);
-
-	return 0;
 }
 
 static int ingenic_drm_suspend(struct device *dev)
@@ -1611,7 +1609,7 @@ static struct platform_driver ingenic_drm_driver = {
 		.of_match_table = of_match_ptr(ingenic_drm_of_match),
 	},
 	.probe = ingenic_drm_probe,
-	.remove = ingenic_drm_remove,
+	.remove_new = ingenic_drm_remove,
 };
 
 static int ingenic_drm_init(void)
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 7a43505011a5..fc0d8512d217 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -922,10 +922,9 @@ static int ingenic_ipu_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &ingenic_ipu_ops);
 }
 
-static int ingenic_ipu_remove(struct platform_device *pdev)
+static void ingenic_ipu_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &ingenic_ipu_ops);
-	return 0;
 }
 
 static const u32 jz4725b_ipu_formats[] = {
@@ -992,7 +991,7 @@ static struct platform_driver ingenic_ipu_driver = {
 		.of_match_table = ingenic_ipu_of_match,
 	},
 	.probe = ingenic_ipu_probe,
-	.remove = ingenic_ipu_remove,
+	.remove_new = ingenic_ipu_remove,
 };
 
 struct platform_driver *ingenic_ipu_driver_ptr = &ingenic_ipu_driver;
-- 
2.39.2

