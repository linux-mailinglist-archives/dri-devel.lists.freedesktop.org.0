Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6FC6F99EA
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D583110E2A0;
	Sun,  7 May 2023 16:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5B710E236
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-00026n-Q0; Sun, 07 May 2023 18:26:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDY-001nDl-LY; Sun, 07 May 2023 18:26:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDY-002Ahl-0j; Sun, 07 May 2023 18:26:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 32/53] drm/mxsfb: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:55 +0200
Message-Id: <20230507162616.1368908-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=kVWpcnc1XVC8DDLsTo5yftSMiQz91Aa5kylEjn1xYXU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EJ4dUC5JToc0Pvdg9XRW8whfE5GHP62ou8I
 zTYkxa57/iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRCQAKCRCPgPtYfRL+
 TgEcB/9lAfrvEA9r1DRL4PsYJdM9XsbMvAzN0f2Rfp3paPKFKdLMlBKT51RVFbySOGGhtIv9eno
 a5X1shKftTHwx2vnuGUB6S20FQdQrLTA12CBeHeO1S8yZfhITSqJ0K+b22YIWojGqCaBb/nPqHl
 rTec91AOApFyVvbrwT+cQeY6WZVuQr5aAsDJQfzXKBl8yWdfGm6jvgK5eVtX6K9Goy9QnaTNXha
 YYUwzSo0tdX9WCEJpSqDy2r7uzaNMVDIC5/5jNfpteBwIQyxuE4mBiir4hGOxwtdC5XzQUgWdDT
 ZtIZakRm476VY+/CA5u7J/PRPSiex6Bxc+wgf8XmmND61puB
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
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the mxsfb driver from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 6 ++----
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index cc2ceb301b96..748b023cfe83 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -232,7 +232,7 @@ static int lcdif_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int lcdif_remove(struct platform_device *pdev)
+static void lcdif_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
@@ -240,8 +240,6 @@ static int lcdif_remove(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(drm);
 	lcdif_unload(drm);
 	drm_dev_put(drm);
-
-	return 0;
 }
 
 static void lcdif_shutdown(struct platform_device *pdev)
@@ -309,7 +307,7 @@ static const struct dev_pm_ops lcdif_pm_ops = {
 
 static struct platform_driver lcdif_platform_driver = {
 	.probe		= lcdif_probe,
-	.remove		= lcdif_remove,
+	.remove_new	= lcdif_remove,
 	.shutdown	= lcdif_shutdown,
 	.driver	= {
 		.name		= "imx-lcdif",
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index b3ab86ad1b36..31f3696f82af 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -377,7 +377,7 @@ static int mxsfb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mxsfb_remove(struct platform_device *pdev)
+static void mxsfb_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
@@ -385,8 +385,6 @@ static int mxsfb_remove(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(drm);
 	mxsfb_unload(drm);
 	drm_dev_put(drm);
-
-	return 0;
 }
 
 static void mxsfb_shutdown(struct platform_device *pdev)
@@ -418,7 +416,7 @@ static const struct dev_pm_ops mxsfb_pm_ops = {
 
 static struct platform_driver mxsfb_platform_driver = {
 	.probe		= mxsfb_probe,
-	.remove		= mxsfb_remove,
+	.remove_new	= mxsfb_remove,
 	.shutdown	= mxsfb_shutdown,
 	.driver	= {
 		.name		= "mxsfb",
-- 
2.39.2

