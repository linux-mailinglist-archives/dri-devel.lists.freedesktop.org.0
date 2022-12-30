Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D26D659885
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 14:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FCC10E0A0;
	Fri, 30 Dec 2022 13:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B21C10E0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 13:00:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pBEzx-0003hf-U3; Fri, 30 Dec 2022 14:00:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pBEzv-002iAK-UW; Fri, 30 Dec 2022 14:00:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pBEzv-008yuK-7L; Fri, 30 Dec 2022 14:00:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] drm/imx/dcss: Don't call dev_set_drvdata(..., NULL);
Date: Fri, 30 Dec 2022 14:00:25 +0100
Message-Id: <20221230130025.240776-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230130025.240776-1-u.kleine-koenig@pengutronix.de>
References: <20221230130025.240776-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Cs4KGPiYFYgIZyKt/nx8GodVULZMPuw69HZP9IsIkuE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjruDmleiL1piYoJYyTAhmNGKEQ/0wKqCDEJ0ZlhE3
 nTDGnLOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY67g5gAKCRDB/BR4rcrsCYX/B/
 96tc1S5llztJyt4nUYkSGYQDBS0PepaelRSeclILjuWsQlTFteBXBXXHQkiXC0iURr2Gshkp1QxUml
 H7UJfKzZfWUjKqk1KQImEXfPJKHJ+16ubyDJxIMkTNd3CihjmpVw+iUNzinI1QPT9sW0wahu0LMwlK
 wyaoEwly6LrCf4w7ykHm05EUcygNzKZULd6bhBK/WAb7QWjVcYeeChoPrtuKl2BsSkBaFeaiKF8vAh
 jvj85I49uutAFTGc8lASVD5527iMVxPc4b9oMcmqpIkBdUtepe5cCUeDvpMt9OP/0OnQtV1UIaTREp
 iB6lYPxqeiLSMMPePwWZwpHfGdCgQb
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
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver core takes care about removing driver data, so this can be
dropped from the driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imx/dcss/dcss-drv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 5c88eecf2ce0..3d5402193a11 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -74,8 +74,6 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 dcss_shutoff:
 	dcss_dev_destroy(mdrv->dcss);
 
-	dev_set_drvdata(dev, NULL);
-
 err:
 	kfree(mdrv);
 	return err;
@@ -88,8 +86,6 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
 	dcss_kms_detach(mdrv->kms);
 	dcss_dev_destroy(mdrv->dcss);
 
-	dev_set_drvdata(&pdev->dev, NULL);
-
 	kfree(mdrv);
 
 	return 0;
-- 
2.38.1

