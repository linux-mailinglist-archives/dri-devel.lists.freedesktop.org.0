Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F486F99F1
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FB510E2AA;
	Sun,  7 May 2023 16:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C953810E264
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-0002Hp-6J; Sun, 07 May 2023 18:26:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-001nEc-C5; Sun, 07 May 2023 18:26:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-002AiN-KO; Sun, 07 May 2023 18:26:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 42/53] drm/stm: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:26:05 +0200
Message-Id: <20230507162616.1368908-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2934;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=VBjQWjzqZ0JTQET5hvmN/Q6/iuJELmv5j/ynukd6X4A=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EUK4Twf4RYXDa6P3NRl5LAxP6p01blYfQj+
 sfuV37RNpuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRFAAKCRCPgPtYfRL+
 Tn5BCACZXxqbkSEj64X4IO9Jl4UE5Fwcqo46zCGQPooOmtsJPnvHOMD2vrTWcdt89WbWa7HPyGW
 p68wJigwr8LgliEAG8bFBav809Ur+2IYDYVpkPTywsKw5waM0XrYaMLY2F1vodQugTwLttTS5Q9
 NaXjOLbW5Hwxl7bjMEUkL79vmwX9GFQino3lvHJbJTNuRGj1Eir7GJWRvzNUJKyA3EmXZirKoS4
 wQ47mFT617Y0LGi9fBYVJ7mRBGqo58eItCT6BRznJjnP6K88oRjUBE5Mzq8oNPv3DRhGwj+L5jF
 9UwZ78x5QLVJ/VyxkuH6gcIlEVoNR80JhOcG5RX5cfRr76aW
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
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the stm drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/stm/drv.c             | 6 ++----
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 50410bd99dfe..be91b375a4d5 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -213,7 +213,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int stm_drm_platform_remove(struct platform_device *pdev)
+static void stm_drm_platform_remove(struct platform_device *pdev)
 {
 	struct drm_device *ddev = platform_get_drvdata(pdev);
 
@@ -222,8 +222,6 @@ static int stm_drm_platform_remove(struct platform_device *pdev)
 	drm_dev_unregister(ddev);
 	drv_unload(ddev);
 	drm_dev_put(ddev);
-
-	return 0;
 }
 
 static const struct of_device_id drv_dt_ids[] = {
@@ -234,7 +232,7 @@ MODULE_DEVICE_TABLE(of, drv_dt_ids);
 
 static struct platform_driver stm_drm_platform_driver = {
 	.probe = stm_drm_platform_probe,
-	.remove = stm_drm_platform_remove,
+	.remove_new = stm_drm_platform_remove,
 	.driver = {
 		.name = "stm32-display",
 		.of_match_table = drv_dt_ids,
diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 89897d5f5c72..a7c349404a7a 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -537,15 +537,13 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dw_mipi_dsi_stm_remove(struct platform_device *pdev)
+static void dw_mipi_dsi_stm_remove(struct platform_device *pdev)
 {
 	struct dw_mipi_dsi_stm *dsi = platform_get_drvdata(pdev);
 
 	dw_mipi_dsi_remove(dsi->dsi);
 	clk_disable_unprepare(dsi->pllref_clk);
 	regulator_disable(dsi->vdd_supply);
-
-	return 0;
 }
 
 static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
@@ -590,7 +588,7 @@ static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
 
 static struct platform_driver dw_mipi_dsi_stm_driver = {
 	.probe		= dw_mipi_dsi_stm_probe,
-	.remove		= dw_mipi_dsi_stm_remove,
+	.remove_new	= dw_mipi_dsi_stm_remove,
 	.driver		= {
 		.of_match_table = dw_mipi_dsi_stm_dt_ids,
 		.name	= "stm32-display-dsi",
-- 
2.39.2

