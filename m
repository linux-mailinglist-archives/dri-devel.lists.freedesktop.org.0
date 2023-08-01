Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005F76B28C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065F110E3D7;
	Tue,  1 Aug 2023 11:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6399F10E3D7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:02:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9K-0006gH-TO; Tue, 01 Aug 2023 13:02:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9J-000MZM-0H; Tue, 01 Aug 2023 13:02:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-009bbd-42; Tue, 01 Aug 2023 13:02:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Danilo Krummrich <dakr@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 10/12] drm/shmobile: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:37 +0200
Message-Id: <20230801110239.831099-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=38wK71pHzyUNLZJVrlPbNiBFUQJSsh1YxlN1rkEvk50=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW//Jyhlw9aGFg+lkzVtZBl9kFEwEcFwP1ZF
 CbuLNQyisiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjlvwAKCRCPgPtYfRL+
 TiwJB/9AFbP54FU5mc10d2jhvc3gLoIbmkStGzYQ5B11jwDeDDS/riDTsCYa4wxpttmC+5tZxqx
 R9MYpIAr82QV0m7eDiusfGRpjD1SCfj9D593EiRQd/mLvK/9fxq00qF9bVqXtAb9MbacCiyjf+H
 +Hxu33eUumUFJcwEXgaF3XN3SUqrkGTzjmDmgFXKIqWlj2a/Fvgml+lRyxLNsiV7WWfIbgVsk42
 ra8IT9qfJ2MsCXiZ/OQfhvUx1f4NaJb0HIxh4wGHIDuIHhhScjoi0TGLLz587JhP44qar9v9n4q
 JQrn9tXl2cWc709FR1PbGgPwpZT+kzDXHKpifDnUw9yMCZAn
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
Cc: linux-renesas-soc@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 30493ce87419..e5db4e0095ba 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -172,7 +172,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
  * Platform driver
  */
 
-static int shmob_drm_remove(struct platform_device *pdev)
+static void shmob_drm_remove(struct platform_device *pdev)
 {
 	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
 	struct drm_device *ddev = sdev->ddev;
@@ -181,8 +181,6 @@ static int shmob_drm_remove(struct platform_device *pdev)
 	drm_kms_helper_poll_fini(ddev);
 	free_irq(sdev->irq, ddev);
 	drm_dev_put(ddev);
-
-	return 0;
 }
 
 static int shmob_drm_probe(struct platform_device *pdev)
@@ -288,7 +286,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
-	.remove		= shmob_drm_remove,
+	.remove_new	= shmob_drm_remove,
 	.driver		= {
 		.name	= "shmob-drm",
 		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
-- 
2.39.2

