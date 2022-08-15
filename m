Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFEA592A83
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 10:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAD9B247A;
	Mon, 15 Aug 2022 08:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09F5AFB5E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 08:02:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oNV3h-0001xA-4b; Mon, 15 Aug 2022 10:02:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oNV3d-003sP0-Kn; Mon, 15 Aug 2022 10:02:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oNV3f-00BoQl-5S; Mon, 15 Aug 2022 10:02:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 1/6] drm/i2c/sil164: Drop no-op remove function
Date: Mon, 15 Aug 2022 10:02:25 +0200
Message-Id: <20220815080230.37408-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=3mH+Pfn2yhZ6mw2Objn19k5vu3rCFYAMQYl9q6ZMsJI=;
 b=owEBbAGT/pANAwAKAcH8FHityuwJAcsmYgBi+f187poqvxpUYi8P/230KIv0pd18lzbW6AvuvB+U
 CQ/EQGmJATIEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYvn9fAAKCRDB/BR4rcrsCSKuB/
 j3CUa5IQdH1k7H0Ja0JHtL6jq++c0roApwA2B6zMntEZX1Y/TOMQP4Mjr1ujfwqETG0Wnb2QRH84EX
 mJIY6+Qc3olTA0eVMuPUeDbDUOT/Fh/8m1RFROngrERS//Germs+yPIvVc688DAQN6xLBncJLGHtCa
 q9HNINViQoW/ByjsizMahJIJL9tJ2mQug4+wHLLCSND8pkAYGXSajARvnnqx6mB26wzxJIVh2I4slv
 3SQcdI/gcTCKqFgSz16yPSFs15qpP+oMMtTu/dYcvcHTkH4MPUjzkuDtHg4JGjpw9KAB5okhScRh20
 0IK3hoWg37YyFRyquDMF/pgQDZ4/E=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de
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
-- 
2.36.1

