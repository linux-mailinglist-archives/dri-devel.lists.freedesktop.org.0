Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC153545E
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 22:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2875610E63B;
	Thu, 26 May 2022 20:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EBC10E63B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 20:25:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuK3R-0005xB-FN; Thu, 26 May 2022 22:25:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuK3R-004jym-A5; Thu, 26 May 2022 22:25:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuK3P-00CKS5-6U; Thu, 26 May 2022 22:25:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i2c/sil164: Drop no-op remove function
Date: Thu, 26 May 2022 22:25:38 +0200
Message-Id: <20220526202538.1723142-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082; h=from:subject;
 bh=AalkoFhu+sD6rLHEVkNGceIGaZKmOQWXNgObvJQ2SRA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBij+I+YTS0mP/a5KMW1rE7Ye9zmZCzU61SCs9T8ecA
 axlfq6iJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYo/iPgAKCRDB/BR4rcrsCWm4B/
 4gUpws2HxldyfMKZYb/4TWaJF1XtUk0UxRForBps0rsFYcsMWhHNrcpm+XQXj86RnZfKIT5rjPvn0U
 KIyQWd9ARiUKSc1iEtqNiQn/9BvVWuGMOSWiMfxwnsK6Tfw2ilBEZixnu26GEZhs4iM4o/Ci6iGdtd
 Do5cvtIHi2n6RctIdgCLcdW7ExOf4c8QjgCdTQFcqFkZwgAVWQHVVnTv5mi3kp6CzuRKdd98KKoHRh
 +bZnHaQ/dykTiXuOIv76wYDW7hAqX6ok2u68VdWNrk6+97nwBABTrs0mlvh3zgW4eei1flMdYpPplv
 tSqZbiukKDA7aRODJrSw2XnkMGRAxz
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A remove callback that just returns 0 is equivalent to no callback at all
as can be seen in i2c_device_remove(). So simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/i2c/sil164_drv.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
index 741886b54419..1bc0b5de4499 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/i2c/sil164_drv.c
@@ -370,12 +370,6 @@ sil164_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	return 0;
 }
 
-static int
-sil164_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static struct i2c_client *
 sil164_detect_slave(struct i2c_client *client)
 {
@@ -427,7 +421,6 @@ MODULE_DEVICE_TABLE(i2c, sil164_ids);
 static struct drm_i2c_encoder_driver sil164_driver = {
 	.i2c_driver = {
 		.probe = sil164_probe,
-		.remove = sil164_remove,
 		.driver = {
 			.name = "sil164",
 		},

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1

