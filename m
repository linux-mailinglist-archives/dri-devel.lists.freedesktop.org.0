Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9806F99F8
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC9D10E2BF;
	Sun,  7 May 2023 16:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9193B10E264
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-0002Fl-PR; Sun, 07 May 2023 18:26:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-001nEL-T1; Sun, 07 May 2023 18:26:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-002AiH-3x; Sun, 07 May 2023 18:26:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Deepak R Varma <drv@mailo.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 40/53] drm/sprd: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:26:03 +0200
Message-Id: <20230507162616.1368908-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3321;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=pLT5lhpzuLs2ns17GxqjNNB42OX6O1EnE5ZdVE9uWmY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9ES5ib2B4rPB3eAl9BcHNzV7SSjrJ+G8kWH+
 yYzWh6eOdWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfREgAKCRCPgPtYfRL+
 TuErB/45VErk1eYEiSjrOaTUtSpwieyM8IffvHiyYrA2yq7enBe5dyeNRAByRDopbDPgtka+w+1
 nl2USM4+MIPIj/FW9RbDBAgpBL9VQ8XZ7OKQWdyX0naRLkJqsh7ywM1ZV5W746CBkuMg+t32Tz6
 NPX23YvYTPT9A3Z/ro/zgqpH4hG+/UQnzKDkA5UmZDFakEZ4iCF2M7qqHcyyhvAvNP8bUZv/PmN
 J8dz93YfsbWRRqmqwyNY8OJNWkuxrCmiRuYYx4Hsq8ZAG4QAFHV7j1X0+a5EVKJy/J7Adgprw4B
 grKiS7Genh95AHz8wI1HrZjlsAo+lIE728fbSPmCGNJZtrCD
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

Trivially convert the sprd drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 6 ++----
 drivers/gpu/drm/sprd/sprd_drm.c | 5 ++---
 drivers/gpu/drm/sprd/sprd_dsi.c | 6 ++----
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index b96fc6837b0d..3b19b9788a29 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -861,16 +861,14 @@ static int sprd_dpu_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &dpu_component_ops);
 }
 
-static int sprd_dpu_remove(struct platform_device *pdev)
+static void sprd_dpu_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &dpu_component_ops);
-
-	return 0;
 }
 
 struct platform_driver sprd_dpu_driver = {
 	.probe = sprd_dpu_probe,
-	.remove = sprd_dpu_remove,
+	.remove_new = sprd_dpu_remove,
 	.driver = {
 		.name = "sprd-dpu-drv",
 		.of_match_table = dpu_match_table,
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index be60c0d546a3..cadf23f52ce5 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -137,10 +137,9 @@ static int sprd_drm_probe(struct platform_device *pdev)
 	return drm_of_component_probe(&pdev->dev, component_compare_of, &drm_component_ops);
 }
 
-static int sprd_drm_remove(struct platform_device *pdev)
+static void sprd_drm_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &drm_component_ops);
-	return 0;
 }
 
 static void sprd_drm_shutdown(struct platform_device *pdev)
@@ -163,7 +162,7 @@ MODULE_DEVICE_TABLE(of, drm_match_table);
 
 static struct platform_driver sprd_drm_driver = {
 	.probe = sprd_drm_probe,
-	.remove = sprd_drm_remove,
+	.remove_new = sprd_drm_remove,
 	.shutdown = sprd_drm_shutdown,
 	.driver = {
 		.name = "sprd-drm-drv",
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index ab0e5cce7adb..d5b05379ceca 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -1053,18 +1053,16 @@ static int sprd_dsi_probe(struct platform_device *pdev)
 	return mipi_dsi_host_register(&dsi->host);
 }
 
-static int sprd_dsi_remove(struct platform_device *pdev)
+static void sprd_dsi_remove(struct platform_device *pdev)
 {
 	struct sprd_dsi *dsi = dev_get_drvdata(&pdev->dev);
 
 	mipi_dsi_host_unregister(&dsi->host);
-
-	return 0;
 }
 
 struct platform_driver sprd_dsi_driver = {
 	.probe = sprd_dsi_probe,
-	.remove = sprd_dsi_remove,
+	.remove_new = sprd_dsi_remove,
 	.driver = {
 		.name = "sprd-dsi-drv",
 		.of_match_table = dsi_match_table,
-- 
2.39.2

