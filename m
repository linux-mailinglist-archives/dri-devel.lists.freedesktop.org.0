Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C16BFDD2
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B1810E4E0;
	Sat, 18 Mar 2023 23:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEEE10E08D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNn-00043M-G0; Sun, 19 Mar 2023 00:54:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNm-0056a9-Rh; Sun, 19 Mar 2023 00:54:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNm-005zUF-2J; Sun, 19 Mar 2023 00:54:42 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 11/51] video: fbdev: cobalt_lcdfb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:53:48 +0100
Message-Id: <20230318235428.272091-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=rnmRhYfricsdlIAqsZA0BgXgWKqHQwL7eWXv372yAL0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk6yakv+5kEMEpEnVXP6MlJtE8TWfIUkBWRT7
 wS6LQ8g/RSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOsgAKCRCPgPtYfRL+
 TiZmB/9QvSkR0jAEgRig1Ybd7NBiUJUef3Fz9JYVFKRir70DpEfa4uC9kdi4X02U/GY7RkDzmiB
 JzpcNrb1NyuBWVJf8leGgCWo/wUr5r/k9XTEFD2DNZUhNxgW/li7N+PuQNe1kpaegtykUi/ubz0
 Zwmyc+xgjurz6RLmQqamAndQ+TkV7aatuXyG2KYBu7xDm4Ylf73FFTtLkkn/PyZPk6HaR/hxsl/
 CcAb6iy9ivGMRuW1KFKICyYB6KrifjkGsNZm4pRXz1KyQBrMVanPjSS7ysqUHWCV1gQjepWSnkt
 KNnMzFDognC8uTl3Uyww8cYBSKovIKpT+hMzSzyRvYXT3G8y
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
 drivers/video/fbdev/cobalt_lcdfb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/cobalt_lcdfb.c b/drivers/video/fbdev/cobalt_lcdfb.c
index 5f8b6324d2e8..feeace079425 100644
--- a/drivers/video/fbdev/cobalt_lcdfb.c
+++ b/drivers/video/fbdev/cobalt_lcdfb.c
@@ -324,7 +324,7 @@ static int cobalt_lcdfb_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int cobalt_lcdfb_remove(struct platform_device *dev)
+static void cobalt_lcdfb_remove(struct platform_device *dev)
 {
 	struct fb_info *info;
 
@@ -333,13 +333,11 @@ static int cobalt_lcdfb_remove(struct platform_device *dev)
 		unregister_framebuffer(info);
 		framebuffer_release(info);
 	}
-
-	return 0;
 }
 
 static struct platform_driver cobalt_lcdfb_driver = {
 	.probe	= cobalt_lcdfb_probe,
-	.remove	= cobalt_lcdfb_remove,
+	.remove_new = cobalt_lcdfb_remove,
 	.driver	= {
 		.name	= "cobalt-lcd",
 	},
-- 
2.39.2

