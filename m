Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B635139D2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 18:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A7D10E760;
	Thu, 28 Apr 2022 16:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5FE10E79A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 16:28:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nk70K-0001Y2-F4; Thu, 28 Apr 2022 18:28:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nk70I-005mui-Sr; Thu, 28 Apr 2022 18:28:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nk70G-006F09-GD; Thu, 28 Apr 2022 18:28:28 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/bridge: tfp410: Make tfp410_fini() return void
Date: Thu, 28 Apr 2022 18:28:03 +0200
Message-Id: <20220428162803.185275-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; h=from:subject;
 bh=LqKEfNPMZFMzdcty2G0GRBdBuQ1jVztWwrSQlUu4Nno=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiasCOMgeuA64uhk13zYlWdLVCCuxhYATo16BEJaE4
 P77IMYGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYmrAjgAKCRDB/BR4rcrsCUINCA
 CR29j5bTT9ubxj9twZzU6bSTQV7esTAPhLhTSrogUV3NDH6spZl5SVCUSBfCeh8u6KMiqJMbsWsagX
 gA5FUqqt4s9pWoyC5lPOOZ0TiancJs/Qq3I7veCybFZMJ8KC7k6e7eqLGM0ovutZX2gJIa+gKnUpZr
 gcXw2MZyDeN1nLV8CZsngob6JUW+Wlp0xLZ1RF83is7LiO9vQaANdpDEbRWcKXfph6CXbVZqouMgiY
 s7K9V2NC92s3jgnO/GHIrSFnVPGhBVuYnWLb8DqyY+gKHgHLZWSU9UL3+JItHSqiCsd0ZVIhK7SL6x
 W8kcTc5hFDoETThCGcTKnCJhXMZ6Cu
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tfp410_fini() always returns zero. Make it return no value which makes it
easier to see in the callers that there is no error to handle.

Also the return value of i2c and platform driver remove callbacks is
ignored anyway. This prepares making i2c and platform remove callbacks
return void, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index ba3fa2a9b8a4..756b3e6e776b 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -341,13 +341,11 @@ static int tfp410_init(struct device *dev, bool i2c)
 	return 0;
 }
 
-static int tfp410_fini(struct device *dev)
+static void tfp410_fini(struct device *dev)
 {
 	struct tfp410 *dvi = dev_get_drvdata(dev);
 
 	drm_bridge_remove(&dvi->bridge);
-
-	return 0;
 }
 
 static int tfp410_probe(struct platform_device *pdev)
@@ -357,7 +355,9 @@ static int tfp410_probe(struct platform_device *pdev)
 
 static int tfp410_remove(struct platform_device *pdev)
 {
-	return tfp410_fini(&pdev->dev);
+	tfp410_fini(&pdev->dev);
+
+	return 0;
 }
 
 static const struct of_device_id tfp410_match[] = {
@@ -394,7 +394,9 @@ static int tfp410_i2c_probe(struct i2c_client *client,
 
 static int tfp410_i2c_remove(struct i2c_client *client)
 {
-	return tfp410_fini(&client->dev);
+	tfp410_fini(&client->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id tfp410_i2c_ids[] = {

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

