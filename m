Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F796BFDA5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CCA10E4A7;
	Sat, 18 Mar 2023 23:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0A310E4A7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNr-0004F7-Mi; Sun, 19 Mar 2023 00:54:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNr-0056bn-1O; Sun, 19 Mar 2023 00:54:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNq-005zVe-CQ; Sun, 19 Mar 2023 00:54:46 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 32/51] video: fbdev: platinumfb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:09 +0100
Message-Id: <20230318235428.272091-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=xFs5j5oNwR8r6LB6Q6rIPEbRd/V5idvpJaUsiVGpD20=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk7PI//j29r32MMag4edxndVYtM7Hlw86Sj8d
 clfODFJg8OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOzwAKCRCPgPtYfRL+
 Tj3kCACI9XpnWB+SkLfh7/eIl+cd6D7d19iIDK2U0c5VX2QkilyhYly50TMF4aCHIu1T7H3rvXN
 BapztLINn9j7cOPe7IzOZ5Mp4oqGT9x36UY2FXZeXKxgvscvlK7NiKLXyk5mza6upXBvqBrMGbj
 Fz/fAv3yjGGcXse5kdQND68PIaxoApVN/fAXjp9eJu11SSnajbksLYq1+IQrYfRqQ4kGSaR8j4c
 BsaR1oBlVWz2xCkfJs6xOJhOqM8R3t3nM6SYMkTg17Y9wrmOZNC3WNmU7hTUhzVf7svd8KJqG5q
 XN6+idxn+hnzm7/dwkOW6y0oGuwHwMFgHUmHkWqAvAT/Qw7g
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
 drivers/video/fbdev/platinumfb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index 5b9e26ea6449..82f019f0a0d6 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -636,7 +636,7 @@ static int platinumfb_probe(struct platform_device* odev)
 	return rc;
 }
 
-static int platinumfb_remove(struct platform_device* odev)
+static void platinumfb_remove(struct platform_device* odev)
 {
 	struct fb_info		*info = dev_get_drvdata(&odev->dev);
 	struct fb_info_platinum	*pinfo = info->par;
@@ -654,8 +654,6 @@ static int platinumfb_remove(struct platform_device* odev)
 	release_mem_region(pinfo->cmap_regs_phys, 0x1000);
 
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static struct of_device_id platinumfb_match[] = 
@@ -673,7 +671,7 @@ static struct platform_driver platinum_driver =
 		.of_match_table = platinumfb_match,
 	},
 	.probe		= platinumfb_probe,
-	.remove		= platinumfb_remove,
+	.remove_new	= platinumfb_remove,
 };
 
 static int __init platinumfb_init(void)
-- 
2.39.2

