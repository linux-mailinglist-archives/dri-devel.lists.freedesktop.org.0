Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205326F99EE
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB66410E2AB;
	Sun,  7 May 2023 16:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A553E10E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDe-0002Pf-C3; Sun, 07 May 2023 18:26:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-001nFH-Lh; Sun, 07 May 2023 18:26:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-002Aiv-U3; Sun, 07 May 2023 18:26:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 50/53] drm/tve200: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:26:13 +0200
Message-Id: <20230507162616.1368908-51-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=vGjJBvcivbnBp25/14A4nQLu3+v6C3xFZKaEa1GpKhE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EevaQMVw1ArLbyv9Hud2+I17hSIG+Pk4NJ/
 KvrD7vksOOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRHgAKCRCPgPtYfRL+
 TvYOB/9mtUnY/c3yAncAydaqELq/kF9B/P3JROZohg+pYObecw+2k7xtzKL+3ojmJR8NvNvp8Be
 CceWdgt6MxzgLRtKEXgF5K6vLAEuRVmDb1mkurL3MX6ECJFkjAlbWVKcQy4MtXe2bZHaTsQo3Od
 PLRP4mb2/dpiImkuxHuLVVtLD0tv2j1OWkgjl6gjU3F+pL/pWxYplW94vgBbdqUh/7WL2Kx+PFW
 gXL6hxSx9eQjbdm5V1dM4Z/kMaobxNJRiMz2sdmCUTWAcE16C9nfiGnIvxAPI0eRHnzQukK7b0r
 3YRXeibsrOucma4wJDW9EIw/5uhpul754Tkf4H/xF69fawcz
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
 drivers/gpu/drm/tve200/tve200_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 0d05c386d303..0d98939d7aed 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -238,7 +238,7 @@ static int tve200_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tve200_remove(struct platform_device *pdev)
+static void tve200_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 	struct tve200_drm_dev_private *priv = drm->dev_private;
@@ -249,8 +249,6 @@ static int tve200_remove(struct platform_device *pdev)
 	drm_mode_config_cleanup(drm);
 	clk_disable_unprepare(priv->pclk);
 	drm_dev_put(drm);
-
-	return 0;
 }
 
 static const struct of_device_id tve200_of_match[] = {
@@ -266,7 +264,7 @@ static struct platform_driver tve200_driver = {
 		.of_match_table = of_match_ptr(tve200_of_match),
 	},
 	.probe = tve200_probe,
-	.remove = tve200_remove,
+	.remove_new = tve200_remove,
 };
 drm_module_platform_driver(tve200_driver);
 
-- 
2.39.2

