Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366AF6BFDBE
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9004F10E4CF;
	Sat, 18 Mar 2023 23:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF49310E4B5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:55:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-00047f-7s; Sun, 19 Mar 2023 00:54:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNo-0056ae-22; Sun, 19 Mar 2023 00:54:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNn-005zUe-9g; Sun, 19 Mar 2023 00:54:43 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH 17/51] video: fbdev: gbefb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:53:54 +0100
Message-Id: <20230318235428.272091-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=2EBDPNo81BiYaZ42TqYb77RVHgFF+RT7fEuw4w0Dq8I=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk65BM89XHpJGCVfoPMJ590nRpFRGpNM/SXg0
 LsLMGoQV9SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOuQAKCRCPgPtYfRL+
 TlEXCACWA4DoQEtef7fsNcI1rsdMmtezGreCAcpqC9llneaYFDBECsNisCuILSa0E6xfk3hxxyp
 JfheByPN5y1StGPN1vZb34P5SFyAYb7mWHVNy1m+Sf8/BZUGtkiyfpBbFtcZHPBYXfUtRsddx8f
 gKUo5sfLz3lhPhBTSxu0OSzMyZCyzhX+IA9jI9YwtQJuW/SbbSJ+9oVjFrZK8iE8qxpua1yMGuY
 yNFikHHKqhZJswW8XnQ/FXJlJTdHaaYKA7ev3E74Ufx7euk3+3belMuCNgJFc3B896PSi4Zuxzd
 x2OT5U5LrvScM+x/w6D4LLDpr6In6FfTCYAh9akylDCWlKL4
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
 drivers/video/fbdev/gbefb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 000b4aa44241..3f141e21b7e0 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1233,7 +1233,7 @@ static int gbefb_probe(struct platform_device *p_dev)
 	return ret;
 }
 
-static int gbefb_remove(struct platform_device* p_dev)
+static void gbefb_remove(struct platform_device* p_dev)
 {
 	struct fb_info *info = platform_get_drvdata(p_dev);
 	struct gbefb_par *par = info->par;
@@ -1243,13 +1243,11 @@ static int gbefb_remove(struct platform_device* p_dev)
 	arch_phys_wc_del(par->wc_cookie);
 	release_mem_region(GBE_BASE, sizeof(struct sgi_gbe));
 	framebuffer_release(info);
-
-	return 0;
 }
 
 static struct platform_driver gbefb_driver = {
 	.probe = gbefb_probe,
-	.remove = gbefb_remove,
+	.remove_new = gbefb_remove,
 	.driver	= {
 		.name = "gbefb",
 		.dev_groups	= gbefb_groups,
-- 
2.39.2

