Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2396F99CD
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577E510E252;
	Sun,  7 May 2023 16:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECCA10E222
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDX-0001zk-4L; Sun, 07 May 2023 18:26:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDV-001nDG-MD; Sun, 07 May 2023 18:26:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDV-002AhQ-2P; Sun, 07 May 2023 18:26:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 27/53] drm/mcde: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:25:50 +0200
Message-Id: <20230507162616.1368908-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=glMqUiPXRKhwzmEGMHZYlIT1zk+1agyjZyutvvTSAVI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EDiw6RSRoAQS4Oy8Ou8jEyPh/7AYPwk12ZG
 MmdeYe0fd6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRAwAKCRCPgPtYfRL+
 Tj2BCACF5c6XZZEqhdkMfsHD44d8Fu3ah9J2f+rTXs3jXNat5loGDsmntb0BU013t4H6vzE9qz/
 Xis8V4mCNNlzR4a7M/1EXlJZPIaVc8zw0dj2jIzd+Gh6iJ6o+URcreBWj3q2LtJ2GLoADW1R3/N
 EYU7/8bJxy8y7uaSnz7SGAtMveOQ+rUQu8bAtsQTzxV3DMsgfpi99sWzb3EsR04yCaUWGeLGZmM
 cQSh2/0NVioFF+mEHf/Dh1Ra42PGJnZta4cVf8RlPe+FnACGZc7miVc1VjAlOMC4NvFmTy+8AXX
 Ofiz6ijUkGEDX46e4GAEh5wu+LjfLfm5Zy5vE4Tl0iMxeAUG
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

Trivially convert the mcde drm driver from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 6 ++----
 drivers/gpu/drm/mcde/mcde_dsi.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 4aedb050d2a5..458672d0fb7a 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -448,7 +448,7 @@ static int mcde_probe(struct platform_device *pdev)
 
 }
 
-static int mcde_remove(struct platform_device *pdev)
+static void mcde_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 	struct mcde *mcde = to_mcde(drm);
@@ -457,8 +457,6 @@ static int mcde_remove(struct platform_device *pdev)
 	clk_disable_unprepare(mcde->mcde_clk);
 	regulator_disable(mcde->vana);
 	regulator_disable(mcde->epod);
-
-	return 0;
 }
 
 static const struct of_device_id mcde_of_match[] = {
@@ -474,7 +472,7 @@ static struct platform_driver mcde_driver = {
 		.of_match_table = of_match_ptr(mcde_of_match),
 	},
 	.probe = mcde_probe,
-	.remove = mcde_remove,
+	.remove_new = mcde_remove,
 };
 
 static struct platform_driver *const component_drivers[] = {
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 9f9ac8699310..db82b38600b2 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1208,14 +1208,12 @@ static int mcde_dsi_probe(struct platform_device *pdev)
 	return component_add(dev, &mcde_dsi_component_ops);
 }
 
-static int mcde_dsi_remove(struct platform_device *pdev)
+static void mcde_dsi_remove(struct platform_device *pdev)
 {
 	struct mcde_dsi *d = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &mcde_dsi_component_ops);
 	mipi_dsi_host_unregister(&d->dsi_host);
-
-	return 0;
 }
 
 static const struct of_device_id mcde_dsi_of_match[] = {
@@ -1231,5 +1229,5 @@ struct platform_driver mcde_dsi_driver = {
 		.of_match_table = of_match_ptr(mcde_dsi_of_match),
 	},
 	.probe = mcde_dsi_probe,
-	.remove = mcde_dsi_remove,
+	.remove_new = mcde_dsi_remove,
 };
-- 
2.39.2

