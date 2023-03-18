Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5206BFD9C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13E10E4B0;
	Sat, 18 Mar 2023 23:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF3910E044
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNm-00042X-Rs; Sun, 19 Mar 2023 00:54:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNm-0056Zu-7Q; Sun, 19 Mar 2023 00:54:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNl-005zU0-9Y; Sun, 19 Mar 2023 00:54:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 07/51] video: fbdev: cg14: Convert to platform remove callback
 returning void
Date: Sun, 19 Mar 2023 00:53:44 +0100
Message-Id: <20230318235428.272091-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=X0Npv7RIU0uA2nb6KinZ087YzI071OmR2xLaSkvunQ8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk6upk/EfhFiZUCshtqXI1vfmJ+gAefNWjFGW
 QwRzCKoPpaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOrgAKCRCPgPtYfRL+
 ThHDCAC2L8hfVXL+s7vGc1gG+mGRxwF9RkClxK2YQb+kcEuHim8TjWbIQ1F6doHpmvHYlbMGnNP
 DtUB7O+ZOKdJiZQJa1iYulaZOMgytliKY7EtCDtdKxJolZozJFlc+l634fW3WPWwX9mygwoLk+U
 8hQSUwtKTAoJfGIfGnUs4mGlavbD0BMyS0ImYuENWLTU+qZJUmSOdIw/aH5rejDcopX5uQta9iu
 TivFZo78T4PbcusFTwfAg4AUsJnrgu+R88BitvSAGCi6cYiczTxJOens64qt8yrTQxg0JOgB2lv
 Zt41Iq0V2tBCw5pjrfeX/vUl8oxbdyiTa8vrKHJOESZ83jNs
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
 drivers/video/fbdev/cg14.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
index 6a745eb46ca1..a028ede39c12 100644
--- a/drivers/video/fbdev/cg14.c
+++ b/drivers/video/fbdev/cg14.c
@@ -569,7 +569,7 @@ static int cg14_probe(struct platform_device *op)
 	return err;
 }
 
-static int cg14_remove(struct platform_device *op)
+static void cg14_remove(struct platform_device *op)
 {
 	struct fb_info *info = dev_get_drvdata(&op->dev);
 	struct cg14_par *par = info->par;
@@ -580,8 +580,6 @@ static int cg14_remove(struct platform_device *op)
 	cg14_unmap_regs(op, info, par);
 
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static const struct of_device_id cg14_match[] = {
@@ -598,7 +596,7 @@ static struct platform_driver cg14_driver = {
 		.of_match_table = cg14_match,
 	},
 	.probe		= cg14_probe,
-	.remove		= cg14_remove,
+	.remove_new	= cg14_remove,
 };
 
 static int __init cg14_init(void)
-- 
2.39.2

