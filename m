Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F5F76B286
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1287810E3D1;
	Tue,  1 Aug 2023 11:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E748910E3D1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:02:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9J-0006fw-FB; Tue, 01 Aug 2023 13:02:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-000MZ8-IA; Tue, 01 Aug 2023 13:02:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9H-009bbY-Tg; Tue, 01 Aug 2023 13:02:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 09/12] drm/nouveau: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:36 +0200
Message-Id: <20230801110239.831099-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=RhFT9/c+gtNi5UR59dmoLfvCKt6Y4L4WX0uelf0vaF0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW+StYSbg3XWvyhBK1kYv6cX+g10tQx2Le4e
 kQYKWJ2XfyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjlvgAKCRCPgPtYfRL+
 TvMTB/9hClXLQ9nBSjRexGNFe99QI8cxdNCdon5icqhH9FOZ/yNHlexRyJL7tbp72zdIWn7im0g
 tGD6Mgx1Nq17H5LobbobAUtvKWG7hlrI7JvF5adP7XG222j1dhbbwXWfHgOP6Wwi5ksrpRkUTDz
 1NJJE4vCQztkkpqtWCv7AWOrZvI8XBIdEw3eY5IdmHBWjoQWsLOUbFDDUSRUbVOmA4sicbdPEzr
 6scsAzmzOFQOGt8Zz1WU6M5CFaTY+6SIp1UeYaLD7Rfohu+lUOph6OP7ExTKSOY7BHHYye+zPoT
 EEAUpYsGeHxktrIyoRNziz2O0r+2AeI3gML8Np1p6Alb+TZb
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
Cc: nouveau@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/nouveau/nouveau_platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 23cd43a7fd19..bf2dc7567ea4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -43,11 +43,10 @@ static int nouveau_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int nouveau_platform_remove(struct platform_device *pdev)
+static void nouveau_platform_remove(struct platform_device *pdev)
 {
 	struct drm_device *dev = platform_get_drvdata(pdev);
 	nouveau_drm_device_remove(dev);
-	return 0;
 }
 
 #if IS_ENABLED(CONFIG_OF)
@@ -93,5 +92,5 @@ struct platform_driver nouveau_platform_driver = {
 		.of_match_table = of_match_ptr(nouveau_platform_match),
 	},
 	.probe = nouveau_platform_probe,
-	.remove = nouveau_platform_remove,
+	.remove_new = nouveau_platform_remove,
 };
-- 
2.39.2

