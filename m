Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1FD7E741B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 23:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B53C10E92E;
	Thu,  9 Nov 2023 22:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82CC10E92A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 22:02:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1D6D-0004Vh-Ci; Thu, 09 Nov 2023 23:02:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1D6C-007sDN-PL; Thu, 09 Nov 2023 23:02:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1D6C-00GL6T-Fz; Thu, 09 Nov 2023 23:02:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] fb: amifb: Convert to platform remove callback returning
 void
Date: Thu,  9 Nov 2023 23:01:54 +0100
Message-ID: <20231109220151.10654-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
References: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1815;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=6bXWS5gn6OJA1KGVvRKfaj80DSIzXCKfa2H4BgXc5AA=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhlTfsItvJdovTTW+t0Hq7dMghphKjbhv653LprhIduadj
 T7z793pTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmYurKwbC5Wy1q+uT7fybc
 O3TShS1cdP+c9+vfXF+qvWfuRSfPiswT+g4ez14JZxikL7sj5XklNaMnPWSqtgj7zr1yC8Obf1T
 +4ylwrjr09v6t5uvdUVIl9xtt+JpOa7CbsVfN037afyDDb7ZXe0Qox2zjw1oHJMTt/v1YI8+x+X
 NWSj0f8zUTr4wOpksnnbq4t1uzN6ss5jW4u+DrrbAXvAc8FwUmy+b2cJfVGCT4LS8NrIra0Rd4X
 k+E8Vj7HYntJ/iuK79fGFSQyMxQrRwSN6HstmOD0MN5nLc1/C/3F/SYxHiaHJq+1p0xfPenEAdh
 5Zn8uhn1VzKZftWyXpi1Xd5FqZ+LI1xadk9A66NzR74DAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Atul Raut <rauji.raut@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/amifb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index 4a1bc693cebd..305f396c764c 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3752,7 +3752,7 @@ static int __init amifb_probe(struct platform_device *pdev)
 }
 
 
-static int __exit amifb_remove(struct platform_device *pdev)
+static void __exit amifb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
@@ -3765,7 +3765,6 @@ static int __exit amifb_remove(struct platform_device *pdev)
 	chipfree();
 	framebuffer_release(info);
 	amifb_video_off();
-	return 0;
 }
 
 /*
@@ -3775,7 +3774,7 @@ static int __exit amifb_remove(struct platform_device *pdev)
  * triggers a section mismatch warning.
  */
 static struct platform_driver amifb_driver __refdata = {
-	.remove = __exit_p(amifb_remove),
+	.remove_new = __exit_p(amifb_remove),
 	.driver   = {
 		.name	= "amiga-video",
 	},
-- 
2.42.0

