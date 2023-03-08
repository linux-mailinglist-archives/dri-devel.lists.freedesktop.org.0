Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8A6AFFF5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 08:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D991F10E594;
	Wed,  8 Mar 2023 07:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F57010E58B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 07:39:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOu-0007Qy-PT; Wed, 08 Mar 2023 08:39:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOu-002fIa-1L; Wed, 08 Mar 2023 08:39:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZoOt-003EMJ-5y; Wed, 08 Mar 2023 08:39:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH 08/13] backlight: lp8788_bl: Convert to platform remove
 callback returning void
Date: Wed,  8 Mar 2023 08:39:40 +0100
Message-Id: <20230308073945.2336302-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=eZI2qgwe+z8FxS6pbJzftF3JfolPn27Am+dAm+EqCn4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDurfYrDtgJfwBic1T4d+VfIM8TB6g012i0x+
 Je7+gATV6yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7qwAKCRDB/BR4rcrs
 CZZ0B/0QhsnRPRM0EqgHnN2TxIbhgVISwtWaMPMoi2eqmn+RMBDOiGiTRcIN7cLgdllOuf/oizt
 pG50D8bVhyHyfyjJVKSnT+JNeEWCWfiC9U0hEuw+L8Okat1sr6vEXaFWtoK4sV9hI5lIX7nwYco
 /NqQUHbz35SJG2zM97u1SLneo/Ix5Vg3LfD94EwNLD8IU/2Y61M6JLwKBldlMMlCPnlLiibxzix
 0kvQvebJZmNRHiFT0OuH9pCVQ2plhZsfdSLpPfXsLwFlBUsNZ3FpHY4Pm8oro/VL/E9nHdwBEJX
 vdOT8yFWO6eXaRF1/OoYntrPb5jEgJlo+rJsUGwzYEB3SRKk
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
 drivers/video/backlight/lp8788_bl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index ba42f3fe0c73..d1a14b0db265 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -298,7 +298,7 @@ static int lp8788_backlight_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int lp8788_backlight_remove(struct platform_device *pdev)
+static void lp8788_backlight_remove(struct platform_device *pdev)
 {
 	struct lp8788_bl *bl = platform_get_drvdata(pdev);
 	struct backlight_device *bl_dev = bl->bl_dev;
@@ -307,13 +307,11 @@ static int lp8788_backlight_remove(struct platform_device *pdev)
 	backlight_update_status(bl_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &lp8788_attr_group);
 	lp8788_backlight_unregister(bl);
-
-	return 0;
 }
 
 static struct platform_driver lp8788_bl_driver = {
 	.probe = lp8788_backlight_probe,
-	.remove = lp8788_backlight_remove,
+	.remove_new = lp8788_backlight_remove,
 	.driver = {
 		.name = LP8788_DEV_BACKLIGHT,
 	},
-- 
2.39.1

