Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCD7659886
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 14:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535CD10E0A9;
	Fri, 30 Dec 2022 13:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA3610E0A0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 13:00:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pBEzx-0003hZ-U2; Fri, 30 Dec 2022 14:00:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pBEzv-002iAH-Md; Fri, 30 Dec 2022 14:00:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pBEzv-008yuH-0u; Fri, 30 Dec 2022 14:00:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] drm/imx/dcss: Drop if blocks with always false condition
Date: Fri, 30 Dec 2022 14:00:24 +0100
Message-Id: <20221230130025.240776-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=k9CZ8SMp5oUYf87AtZCi35cIAxoHgGqu3bV/6kmjLzY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjruDiY34a3DtPmhxtH6qxp3/cjY0vStnsnbhk4QYw
 7gU0jPuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY67g4gAKCRDB/BR4rcrsCQjpB/
 42fNJ2Sd3CBH7MBQpHFWRVIIWai1LsdrQ51N14ZrV0FProSS6gY4SDRHae9+as8NkLNrW/2XliXknq
 XZ5I3EjOHzxf1aNEGP43NdfPG+ndEdpsIl+DNVyp/7FB8DRQNthL9n/YWh4nnw13jwa2hqx2jE7fdH
 V5gm6Sj0z0LgspDikh8TvNkjcyNrA4oMyd6lJNz7O30TVM0p3xybgbTsHmrU05NVj5UOIoIi8SCxCx
 fsqeiElY9JOOg89mAt2/U5W8rEnhxOK0mbeJtSIkCnVu3Z3owzRH9lxu6IqrTtMFpeglKfzYWaQRZ+
 +mzvDXLNgeBzcGl4rzS6waX8Z5yfLJ
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

dcss_drv_platform_remove() is only called for a device after
dcss_drv_platform_probe() returned 0. In that case dev_set_drvdata() was
called with a non-NULL value and so dev_get_drvdata() won't return NULL.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imx/dcss/dcss-drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 1c70f70247f6..5c88eecf2ce0 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -85,9 +85,6 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
 {
 	struct dcss_drv *mdrv = dev_get_drvdata(&pdev->dev);
 
-	if (!mdrv)
-		return 0;
-
 	dcss_kms_detach(mdrv->kms);
 	dcss_dev_destroy(mdrv->dcss);
 
-- 
2.38.1

