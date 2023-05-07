Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778536F99E2
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC1010E26B;
	Sun,  7 May 2023 16:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D7B10E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDe-0002R0-Oe; Sun, 07 May 2023 18:26:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDe-001nFR-1f; Sun, 07 May 2023 18:26:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-002Aj0-5B; Sun, 07 May 2023 18:26:41 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 51/53] drm/v3d: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:26:14 +0200
Message-Id: <20230507162616.1368908-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=rMBHnjxgwGUtU5HMMbHtzInmZ9Ibbm8DlkCjpcN9FwI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9Eg+twY47vhfug3B3L4Uu0QfWL4oYUFj/xj2
 w29bzIfT/GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRIAAKCRCPgPtYfRL+
 Tq1sB/40PEdwHUmzI5Vn5wd/ByMgnSULZZuMRp7n0/pacZgvFdtLBRqulrNbNHHnWYX7kOBzOgL
 bc8kawFD8uVk9URZ27uR4Pf5lF23m1NxSWU+kfIcRodB8B2H5xBTQN/BEHydxPjvcujegrXYh5u
 CCabJVAPJMqIQC06ghWQaPyh5D2Ry+lsCnasF4swFgQjgVS8/bhOmvKp1y//NQP3a70O/l66Od0
 NlDpGGlqSnOlPjl1Q2KF1CGa+2lE6yTFankdoAgRtn5A9UFjnnfjyKfwXYgcuaDnh4odokxR2Ll
 vjmaHBSJWVqQdkHPC2iIapPAQn3cdeedCkfi5xugcuiuLhMh
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
 drivers/gpu/drm/v3d/v3d_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 478f1f0f60de..71f9fdde24b4 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -295,7 +295,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int v3d_platform_drm_remove(struct platform_device *pdev)
+static void v3d_platform_drm_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 	struct v3d_dev *v3d = to_v3d_dev(drm);
@@ -306,13 +306,11 @@ static int v3d_platform_drm_remove(struct platform_device *pdev)
 
 	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
 		    v3d->mmu_scratch_paddr);
-
-	return 0;
 }
 
 static struct platform_driver v3d_platform_driver = {
 	.probe		= v3d_platform_drm_probe,
-	.remove		= v3d_platform_drm_remove,
+	.remove_new	= v3d_platform_drm_remove,
 	.driver		= {
 		.name	= "v3d",
 		.of_match_table = v3d_of_match,
-- 
2.39.2

