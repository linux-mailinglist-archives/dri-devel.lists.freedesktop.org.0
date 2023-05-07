Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6226F99D0
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076C810E260;
	Sun,  7 May 2023 16:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ED610E236
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-0002Gy-0r; Sun, 07 May 2023 18:26:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-001nEX-55; Sun, 07 May 2023 18:26:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-002AiK-CT; Sun, 07 May 2023 18:26:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 41/53] drm/sti: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:26:04 +0200
Message-Id: <20230507162616.1368908-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7282;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=8NQkMvjdiL3CEAKvtjv4HC+bAfqmgGCkmw5ona1pD/c=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9ETwB79bqVBoj3Cm7Kmo4pilQkYCocI2FQ7U
 TvU5ECj4myJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfREwAKCRCPgPtYfRL+
 ThIuB/9d9yCPJMrEjVvrjM+vz3vgzXRGdTCEudGlMz3y0A9ge2YhKZU95/Q3ERBJ3XwMafRh2sT
 3nf758ab421p1P5uY1PFSCy86cEcN0oW2jeJJLd3RhoiqCzPmU7pUeoGfwJlyH6eA7cNnsxevgY
 maDl4BBU/L+/2m1FHpsIWtrDAS7oorYBVn7htvbo3haHUj3MujetzcDWFLLxhiIa7cDL6uqf+PD
 oqr+GMbLJOCV6Jz8xM6hSyHxvNbtTPJgsosIWGM4Hmhk21sL0p+dFlL7k0Bu9dcgghoyyxdlQkc
 F8DISMUsGAofbcMk8TEVAH/Qlai0ZwuywsCow12GE0EuS2PT
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

Trivially convert the sti drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/sti/sti_compositor.c | 5 ++---
 drivers/gpu/drm/sti/sti_drv.c        | 6 ++----
 drivers/gpu/drm/sti/sti_dvo.c        | 5 ++---
 drivers/gpu/drm/sti/sti_hda.c        | 5 ++---
 drivers/gpu/drm/sti/sti_hdmi.c       | 6 ++----
 drivers/gpu/drm/sti/sti_hqvdp.c      | 5 ++---
 drivers/gpu/drm/sti/sti_tvout.c      | 5 ++---
 7 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 142a8e1b4436..33487a1fed8f 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -258,10 +258,9 @@ static int sti_compositor_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sti_compositor_ops);
 }
 
-static int sti_compositor_remove(struct platform_device *pdev)
+static void sti_compositor_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sti_compositor_ops);
-	return 0;
 }
 
 struct platform_driver sti_compositor_driver = {
@@ -270,7 +269,7 @@ struct platform_driver sti_compositor_driver = {
 		.of_match_table = compositor_of_match,
 	},
 	.probe = sti_compositor_probe,
-	.remove = sti_compositor_remove,
+	.remove_new = sti_compositor_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index ef6a4e63198f..451480041130 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -246,11 +246,9 @@ static int sti_platform_probe(struct platform_device *pdev)
 	return component_master_add_with_match(dev, &sti_ops, match);
 }
 
-static int sti_platform_remove(struct platform_device *pdev)
+static void sti_platform_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &sti_ops);
-
-	return 0;
 }
 
 static const struct of_device_id sti_dt_ids[] = {
@@ -261,7 +259,7 @@ MODULE_DEVICE_TABLE(of, sti_dt_ids);
 
 static struct platform_driver sti_platform_driver = {
 	.probe = sti_platform_probe,
-	.remove = sti_platform_remove,
+	.remove_new = sti_platform_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = sti_dt_ids,
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 577c477b5f46..0dca0048dd25 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -567,10 +567,9 @@ static int sti_dvo_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sti_dvo_ops);
 }
 
-static int sti_dvo_remove(struct platform_device *pdev)
+static void sti_dvo_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sti_dvo_ops);
-	return 0;
 }
 
 static const struct of_device_id dvo_of_match[] = {
@@ -586,7 +585,7 @@ struct platform_driver sti_dvo_driver = {
 		.of_match_table = dvo_of_match,
 	},
 	.probe = sti_dvo_probe,
-	.remove = sti_dvo_remove,
+	.remove_new = sti_dvo_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 15097ac67931..6ee35612a14e 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -792,10 +792,9 @@ static int sti_hda_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sti_hda_ops);
 }
 
-static int sti_hda_remove(struct platform_device *pdev)
+static void sti_hda_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sti_hda_ops);
-	return 0;
 }
 
 static const struct of_device_id hda_of_match[] = {
@@ -812,7 +811,7 @@ struct platform_driver sti_hda_driver = {
 		.of_match_table = hda_of_match,
 	},
 	.probe = sti_hda_probe,
-	.remove = sti_hda_remove,
+	.remove_new = sti_hda_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 8539fe1fedc4..3d8ddceca845 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1471,7 +1471,7 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sti_hdmi_remove(struct platform_device *pdev)
+static void sti_hdmi_remove(struct platform_device *pdev)
 {
 	struct sti_hdmi *hdmi = dev_get_drvdata(&pdev->dev);
 
@@ -1479,8 +1479,6 @@ static int sti_hdmi_remove(struct platform_device *pdev)
 	if (hdmi->audio_pdev)
 		platform_device_unregister(hdmi->audio_pdev);
 	component_del(&pdev->dev, &sti_hdmi_ops);
-
-	return 0;
 }
 
 struct platform_driver sti_hdmi_driver = {
@@ -1490,7 +1488,7 @@ struct platform_driver sti_hdmi_driver = {
 		.of_match_table = hdmi_of_match,
 	},
 	.probe = sti_hdmi_probe,
-	.remove = sti_hdmi_remove,
+	.remove_new = sti_hdmi_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 02b77279f6e4..0fb48ac044d8 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1400,10 +1400,9 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &sti_hqvdp_ops);
 }
 
-static int sti_hqvdp_remove(struct platform_device *pdev)
+static void sti_hqvdp_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sti_hqvdp_ops);
-	return 0;
 }
 
 static const struct of_device_id hqvdp_of_match[] = {
@@ -1419,7 +1418,7 @@ struct platform_driver sti_hqvdp_driver = {
 		.of_match_table = hqvdp_of_match,
 	},
 	.probe = sti_hqvdp_probe,
-	.remove = sti_hqvdp_remove,
+	.remove_new = sti_hqvdp_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 2499715a69b7..64615638b79a 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -872,10 +872,9 @@ static int sti_tvout_probe(struct platform_device *pdev)
 	return component_add(dev, &sti_tvout_ops);
 }
 
-static int sti_tvout_remove(struct platform_device *pdev)
+static void sti_tvout_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &sti_tvout_ops);
-	return 0;
 }
 
 static const struct of_device_id tvout_of_match[] = {
@@ -891,7 +890,7 @@ struct platform_driver sti_tvout_driver = {
 		.of_match_table = tvout_of_match,
 	},
 	.probe = sti_tvout_probe,
-	.remove = sti_tvout_remove,
+	.remove_new = sti_tvout_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
-- 
2.39.2

