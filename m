Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BC6F99CE
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5658510E256;
	Sun,  7 May 2023 16:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4785410E23B
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-000261-JT; Sun, 07 May 2023 18:26:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDY-001nDd-7W; Sun, 07 May 2023 18:26:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDX-002Ahf-Es; Sun, 07 May 2023 18:26:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 30/53] drm/meson: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:53 +0200
Message-Id: <20230507162616.1368908-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=IZ1twIv1uwI4nJItBoYCOFI4DD6dXrwGi4YZz9Kqntg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EGtCz+Z+paG2IRQDn3Y9px5icvZXFwIT9C2
 Zv/052ExLCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRBgAKCRCPgPtYfRL+
 TuTsCACDzyIP6EDyD1EIHbH5PLni2fmWs+TgQvYA/thWExLjGojBx7/CxfpjLhVJV9KLBYT+zJV
 VbJvmjvqyLuanVmMp14qIrP6iobjyMNL7w2no5r3Du8juur9Z9lFss96NcQN6cSrKBxgwr4aLUy
 Vw2rAhKbAuK60JWGJ8VtJZNhE9HS9VYnrtIxzGL2aiNBktPB8GF0xrXpbxBbsXx0d2vsYptnhqQ
 DXeyqxuvUqcCkBIUDAV6R+rPuKYD+xgRPQn5q2QjapWLDDaokJtbRA300lmFSsFwEe56Ml6hVkD
 9bOmchl+Fil/PWoRaZUTGnuEm8uQbGH3wjdh3xOuh3QTtdJx
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert meson drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/meson/meson_drv.c     | 6 ++----
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 7caf937c3c90..edaaf9ce5b1a 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -500,11 +500,9 @@ static int meson_drv_probe(struct platform_device *pdev)
 	return 0;
 };
 
-static int meson_drv_remove(struct platform_device *pdev)
+static void meson_drv_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &meson_drv_master_ops);
-
-	return 0;
 }
 
 static struct meson_drm_match_data meson_drm_gxbb_data = {
@@ -544,7 +542,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
 
 static struct platform_driver meson_drm_platform_driver = {
 	.probe      = meson_drv_probe,
-	.remove     = meson_drv_remove,
+	.remove_new = meson_drv_remove,
 	.shutdown   = meson_drv_shutdown,
 	.driver     = {
 		.name	= "meson-drm",
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 3d046878ce6c..411219d53b14 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -852,11 +852,9 @@ static int meson_dw_hdmi_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &meson_dw_hdmi_ops);
 }
 
-static int meson_dw_hdmi_remove(struct platform_device *pdev)
+static void meson_dw_hdmi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &meson_dw_hdmi_ops);
-
-	return 0;
 }
 
 static const struct dev_pm_ops meson_dw_hdmi_pm_ops = {
@@ -879,7 +877,7 @@ MODULE_DEVICE_TABLE(of, meson_dw_hdmi_of_table);
 
 static struct platform_driver meson_dw_hdmi_platform_driver = {
 	.probe		= meson_dw_hdmi_probe,
-	.remove		= meson_dw_hdmi_remove,
+	.remove_new	= meson_dw_hdmi_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= meson_dw_hdmi_of_table,
-- 
2.39.2

