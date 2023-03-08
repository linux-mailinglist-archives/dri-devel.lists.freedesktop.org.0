Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E336AFFEE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 08:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7903710E590;
	Wed,  8 Mar 2023 07:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CE910E58B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 07:39:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOt-0007OJ-Ae; Wed, 08 Mar 2023 08:39:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOs-002fI3-BQ; Wed, 08 Mar 2023 08:39:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOr-003ELt-KY; Wed, 08 Mar 2023 08:39:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH 01/13] backlight: aat2870_bl: Convert to platform remove
 callback returning void
Date: Wed,  8 Mar 2023 08:39:33 +0100
Message-Id: <20230308073945.2336302-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=9QEgxpV82DH1pdtLpGjKFmgW5TxIcpKnZ0ll1WHKIBM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDuUkmPTYCr3iLSQBTUOXu9/NJg7Iwz/VIzVA
 5HtzMhF/VKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7lAAKCRDB/BR4rcrs
 CTX/CACKZCYO7sCszOVzwEgymnA2+NOimfnFTVLibTsRkEDadGshnC9MWY9OfpOTtQB7QB2VtLa
 +W9nGX20t5S/Y9Hr4T+ufq0dvj+ZTVVyk5uudxNowQ0T/+XlUw/jTkSxpZ9SYfcdbpf3Nvt5UDk
 Gf0eoWMX7l8zs8uJyLcDXJ6NhHI5nVHpWLmpzb3uFh4UT27EkZcMgKTZCuza4gMrxr7TShnCb6r
 PXjjbCvXOZJM583PqUSZFlPLfa2vwlO5+LOsiak2n1hdUL1zG85J7pscSt1WEpE5d8m9FrB1uQJ
 pS18Wkt+5CYTM97pzVwE68CQiqZj7vObwP4Zs3i9/x8gfsEH
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/backlight/aat2870_bl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 1cbb303e9c88..81fde3abb92c 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -178,7 +178,7 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int aat2870_bl_remove(struct platform_device *pdev)
+static void aat2870_bl_remove(struct platform_device *pdev)
 {
 	struct aat2870_bl_driver_data *aat2870_bl = platform_get_drvdata(pdev);
 	struct backlight_device *bd = aat2870_bl->bd;
@@ -186,8 +186,6 @@ static int aat2870_bl_remove(struct platform_device *pdev)
 	bd->props.power = FB_BLANK_POWERDOWN;
 	bd->props.brightness = 0;
 	backlight_update_status(bd);
-
-	return 0;
 }
 
 static struct platform_driver aat2870_bl_driver = {
@@ -195,7 +193,7 @@ static struct platform_driver aat2870_bl_driver = {
 		.name	= "aat2870-backlight",
 	},
 	.probe		= aat2870_bl_probe,
-	.remove		= aat2870_bl_remove,
+	.remove_new	= aat2870_bl_remove,
 };
 
 static int __init aat2870_bl_init(void)
-- 
2.39.1

