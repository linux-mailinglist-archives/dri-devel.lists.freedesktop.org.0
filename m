Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEB6AFFF0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 08:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC72B10E595;
	Wed,  8 Mar 2023 07:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C44910E58F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 07:39:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOv-0007SR-GN; Wed, 08 Mar 2023 08:39:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOu-002fIt-Su; Wed, 08 Mar 2023 08:39:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOu-003EMc-6y; Wed, 08 Mar 2023 08:39:52 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH 13/13] backlight: sky81452-backlight: Convert to platform
 remove callback returning void
Date: Wed,  8 Mar 2023 08:39:45 +0100
Message-Id: <20230308073945.2336302-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=nP16iRVVJTEg330zsch84/eml3UDjdUU03j+kGidrxg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDu767ILrvgu/qtSmP5+jEWIY3SRBadP0St/e
 AWGMFIO3cCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7uwAKCRDB/BR4rcrs
 CUO0B/4vyTs14lkFv+P1S4S4EkAgbN3MO/jsl33MKtdmPrWMdkfAshObhEf+wXjgExR+2kzjeAl
 U4gu3cfd5Xvnjeo/mIUq90dVKa++q5jdVyzIngj/Ys34AKeG6T26Jgh8LFrVhKcCqUuRsHismaz
 aNWITfVlrwmBGrXNj4VBSiM4P6tJEVfIQfmwBu2gb47JVn0CfDuHiivL5PekRojnSdf3B2Ug13q
 r++h/VxJXR1jBqqWU213OLxNRrTJP7ut501z1+dg6bkUK989zoLd+EbNPIjtVQCwgn1+yGqSaqR
 5Q20/UghlHasttZfATZMmcx2v+DjiuLUul1MJo8z63RUrvgg
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
 drivers/video/backlight/sky81452-backlight.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 0172438c38ce..eb18c6eb0ff0 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -311,7 +311,7 @@ static int sky81452_bl_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sky81452_bl_remove(struct platform_device *pdev)
+static void sky81452_bl_remove(struct platform_device *pdev)
 {
 	const struct sky81452_bl_platform_data *pdata =
 						dev_get_platdata(&pdev->dev);
@@ -325,8 +325,6 @@ static int sky81452_bl_remove(struct platform_device *pdev)
 
 	if (pdata->gpiod_enable)
 		gpiod_set_value_cansleep(pdata->gpiod_enable, 0);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -343,7 +341,7 @@ static struct platform_driver sky81452_bl_driver = {
 		.of_match_table = of_match_ptr(sky81452_bl_of_match),
 	},
 	.probe = sky81452_bl_probe,
-	.remove = sky81452_bl_remove,
+	.remove_new = sky81452_bl_remove,
 };
 
 module_platform_driver(sky81452_bl_driver);
-- 
2.39.1

