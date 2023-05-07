Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424ED6F99EF
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F1410E2AE;
	Sun,  7 May 2023 16:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347B10E270
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:27:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDU-0001mJ-H8; Sun, 07 May 2023 18:26:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDT-001nCj-AH; Sun, 07 May 2023 18:26:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-002Agv-Ce; Sun, 07 May 2023 18:26:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH 20/53] drm/hisilicon: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:43 +0200
Message-Id: <20230507162616.1368908-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=G2D/zW973Dz0Uv4IgMR8LfVcWS2oJpaIAvmMNkWr2FU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9D7nNQrWnX6ghtuLmlpCU8NEubvwcyw6+HeB
 1OfHdilkr6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ+wAKCRCPgPtYfRL+
 TjgTCACBDOvWtOKod1nXllG0ATxBH5QhvA9M4VbBvQv+FbEFQzfTDet4lNI+qYutnABFK0YxSvb
 AKckQfTuRaM2fTzTxKTkVujpSkyZv1PekIZJjdQhQSPWppjQn+1a2wdwtD2YTr3CM/57OjrYQMe
 PAE1IGpeakO5PB3WOobwPL4ZPv+HLHAuvGYBSJ98dJ1tAlnYgqHNiClBcBOl3UNZR2lGJ6M9/vN
 l4JDq9sBCl+gweyueAJ5IeKO0PCsytstWkS9etjpGiC86V3LTAllEpqD0d6zuiMEOgTVeFg7QZn
 UCRE7byI0uFSwXd9/4v/nYOsd2jvdo2hjmBnk1wSBZdQRv/H
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
Cc: dri-devel@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, John Stultz <jstultz@google.com>,
 kernel@pengutronix.de, Yongqin Liu <yongqin.liu@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the hisilicon drm drivers from always returning zero
in the remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    | 6 ++----
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index d9978b79828c..566de4658719 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -874,14 +874,12 @@ static int dsi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int dsi_remove(struct platform_device *pdev)
+static void dsi_remove(struct platform_device *pdev)
 {
 	struct dsi_data *data = platform_get_drvdata(pdev);
 	struct dw_dsi *dsi = &data->dsi;
 
 	mipi_dsi_host_unregister(&dsi->host);
-
-	return 0;
 }
 
 static const struct of_device_id dsi_of_match[] = {
@@ -892,7 +890,7 @@ MODULE_DEVICE_TABLE(of, dsi_of_match);
 
 static struct platform_driver dsi_driver = {
 	.probe = dsi_probe,
-	.remove = dsi_remove,
+	.remove_new = dsi_remove,
 	.driver = {
 		.name = "dw-dsi",
 		.of_match_table = dsi_of_match,
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 9c5d49bf40c9..bc2948500311 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -279,10 +279,9 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	return component_master_add_with_match(dev, &kirin_drm_ops, match);
 }
 
-static int kirin_drm_platform_remove(struct platform_device *pdev)
+static void kirin_drm_platform_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &kirin_drm_ops);
-	return 0;
 }
 
 static const struct of_device_id kirin_drm_dt_ids[] = {
@@ -295,7 +294,7 @@ MODULE_DEVICE_TABLE(of, kirin_drm_dt_ids);
 
 static struct platform_driver kirin_drm_platform_driver = {
 	.probe = kirin_drm_platform_probe,
-	.remove = kirin_drm_platform_remove,
+	.remove_new = kirin_drm_platform_remove,
 	.driver = {
 		.name = "kirin-drm",
 		.of_match_table = kirin_drm_dt_ids,
-- 
2.39.2

