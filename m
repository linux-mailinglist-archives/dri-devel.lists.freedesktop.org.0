Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C86BFDC2
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7C710E4CB;
	Sat, 18 Mar 2023 23:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903F010E4A7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-0004If-OY; Sun, 19 Mar 2023 00:54:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNt-0056cb-8D; Sun, 19 Mar 2023 00:54:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNs-005zWM-K7; Sun, 19 Mar 2023 00:54:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michal Januszewski <spock@gentoo.org>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 43/51] video: fbdev: uvesafb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:20 +0100
Message-Id: <20230318235428.272091-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=/fLFBzkAaiu0PzIJRtRRRm4J+lexLWPrvq9b01Yxx3o=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8EiUoCpB0Hk/noFZqh1RHH0S7OVUdSeiiVp
 wgfb0ILEHOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPBAAKCRCPgPtYfRL+
 Tr4KCACNZxyp+iUfljCFWIG58bReqp/R87DarrTQM20pIS2a+ntHKPXK33fJCuaHlyBXjHurkV6
 Hrurzw+6Knw8bwoL0hFJa23UVfByx/DRlPCz1ciyhkKyI9fJtjKog6WZa99ooTgGfXKo1EljQHn
 imPu4GtDEuCVjy9ns+7i27FGDTZbLVFDzuu9y0iQaQl9vduvC4eieLlZoH0HfpE+8Vi8Oxce8It
 qGJAYFJLIodgQWp3OGXLmm2+shDewQXvtmWTYiMRP1XvCM6kdUufro7iFyiyOUwc+TNI6As3Myr
 X0zDRwfMpwlKX7l+FZvFUYujIVrhG1QH4rwQ4J6qr37Fo3jQ
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
 drivers/video/fbdev/uvesafb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index f09f483c219b..78d85dae8ec8 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1774,7 +1774,7 @@ static int uvesafb_probe(struct platform_device *dev)
 	return err;
 }
 
-static int uvesafb_remove(struct platform_device *dev)
+static void uvesafb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
 	struct uvesafb_par *par = info->par;
@@ -1793,13 +1793,11 @@ static int uvesafb_remove(struct platform_device *dev)
 	kfree(par->vbe_state_saved);
 
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static struct platform_driver uvesafb_driver = {
 	.probe  = uvesafb_probe,
-	.remove = uvesafb_remove,
+	.remove_new = uvesafb_remove,
 	.driver = {
 		.name = "uvesafb",
 	},
-- 
2.39.2

