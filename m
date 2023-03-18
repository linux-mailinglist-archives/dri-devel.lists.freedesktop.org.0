Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7C6BFDCD
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590F210E4D6;
	Sat, 18 Mar 2023 23:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36BC10E4CB
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:54:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNv-0004Nz-Ku; Sun, 19 Mar 2023 00:54:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNu-0056cs-21; Sun, 19 Mar 2023 00:54:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNt-005zWY-AG; Sun, 19 Mar 2023 00:54:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zeng Heng <zengheng4@huawei.com>
Subject: [PATCH 46/51] video: fbdev: vga16fb: Convert to platform remove
 callback returning void
Date: Sun, 19 Mar 2023 00:54:23 +0100
Message-Id: <20230318235428.272091-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=NDWxNtLKMb/W8u1lA3dwx7HDkHYJMkkrIqsYtk5LsZY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk8TwTYWAQDSge5HLioHHeUgw5G+y5GXn9L5p
 NCKuV4jHaGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZPEwAKCRCPgPtYfRL+
 TnUtB/9X/QYz3TTEv633i5lVt7G56CXma7eu1gRY/irjZk5VAoOdmynjbP5bsxzJFOKAqaPjmAZ
 /a2V2Y9ra5Qc9b6AA2gjAbQuxLtrrV21BcFlO4SuXAKtAS6nTsvYVdKEu6yW2POIt26ROOiuYKz
 IzCYRtvc+t9wtqMsTy2RLlJuuC+JWCJZ5h3D/mUZFNre0qW0On6IhvU6TRfjZ6ax0tJzKPgKjIM
 Okgch3eGoTcbBYbpgnbKRK9Iv8hG9vdY+bsqJ9fBxXxHpWul4Wgd99ql/gk0luli2X71M8hUSe5
 WjjY7MGJxfMwiwHGlERNNsjvg/IxpcGzvuIbOLOHPlVpcOk3
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
 drivers/video/fbdev/vga16fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 1a8ffdb2be26..34d00347ad58 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1401,14 +1401,12 @@ static int vga16fb_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int vga16fb_remove(struct platform_device *dev)
+static void vga16fb_remove(struct platform_device *dev)
 {
 	struct fb_info *info = platform_get_drvdata(dev);
 
 	if (info)
 		unregister_framebuffer(info);
-
-	return 0;
 }
 
 static const struct platform_device_id vga16fb_driver_id_table[] = {
@@ -1420,7 +1418,7 @@ MODULE_DEVICE_TABLE(platform, vga16fb_driver_id_table);
 
 static struct platform_driver vga16fb_driver = {
 	.probe = vga16fb_probe,
-	.remove = vga16fb_remove,
+	.remove_new = vga16fb_remove,
 	.driver = {
 		.name = "vga16fb",
 	},
-- 
2.39.2

