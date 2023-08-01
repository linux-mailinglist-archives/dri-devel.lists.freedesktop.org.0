Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29A776B288
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859B810E3D2;
	Tue,  1 Aug 2023 11:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9474410E089
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:02:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-0006ev-Mw; Tue, 01 Aug 2023 13:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9H-000MYw-Vd; Tue, 01 Aug 2023 13:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9G-009bbE-PG; Tue, 01 Aug 2023 13:02:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 04/12] drm/imx/ipuv3: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:31 +0200
Message-Id: <20230801110239.831099-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6387;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=j589YRmYI1TtS9QzeONZtwyj6NCrrysJAYfy6LL+7Gw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW4MuPoht7FGOxj3SV00IH2w0bEUQ+TYnduP
 X7scjNrYqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjluAAKCRCPgPtYfRL+
 TtvlCAChIe+ewv09kVA0envIQ1NCwi4gpct+u0Q23r8Al7b2fQ3cdUVXF49le26Euft5Q6Hhbky
 VJWrN9A48LKnaTsH2ge3HVmdZIyEn9VwLVSK/zBaBVRFNrVWABjDSD5M8auF/I06BSBggMYgo/N
 QgZ5Mx7FbpL5he7GVp9D8ZI73Vf7GpXZacWGwmBA2rFWi3Fp0H8+EpuNQ9grQzbcA3zHg9qEECv
 b15NmUFxXUHNECutcDEI8TkAoQORH5I1a3VPrvgEnpxolPfvs2uGKCTS6fgPgNEECkd4YhrI/Xe
 S3HVKbuax9k03cL3aLlEC02BGgvy8kQb8E5OzPb5d9daRi9i
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
Cc: kernel@pengutronix.de, Jyri Sarha <jyri.sarha@iki.fi>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the ipuv3 imx drivers from always returning zero in
the remove callback to the void returning variant.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c      | 6 ++----
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c     | 5 ++---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c          | 5 ++---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c          | 5 ++---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c       | 5 ++---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 6 ++----
 6 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
index a2277a0d6d06..0006ea52b83c 100644
--- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
@@ -255,19 +255,17 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dw_hdmi_imx_remove(struct platform_device *pdev)
+static void dw_hdmi_imx_remove(struct platform_device *pdev)
 {
 	struct imx_hdmi *hdmi = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &dw_hdmi_imx_ops);
 	dw_hdmi_remove(hdmi->hdmi);
-
-	return 0;
 }
 
 static struct platform_driver dw_hdmi_imx_platform_driver = {
 	.probe  = dw_hdmi_imx_probe,
-	.remove = dw_hdmi_imx_remove,
+	.remove_new = dw_hdmi_imx_remove,
 	.driver = {
 		.name = "dwhdmi-imx",
 		.of_match_table = dw_hdmi_imx_dt_ids,
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 4a866ac60fff..352fa31ab4ed 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -292,10 +292,9 @@ static int imx_drm_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx_drm_platform_remove(struct platform_device *pdev)
+static void imx_drm_platform_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &imx_drm_ops);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -324,7 +323,7 @@ MODULE_DEVICE_TABLE(of, imx_drm_dt_ids);
 
 static struct platform_driver imx_drm_pdrv = {
 	.probe		= imx_drm_platform_probe,
-	.remove		= imx_drm_platform_remove,
+	.remove_new	= imx_drm_platform_remove,
 	.driver		= {
 		.name	= "imx-drm",
 		.pm	= &imx_drm_pm_ops,
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index c45fc8f4744d..989eca32d325 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -737,7 +737,7 @@ static int imx_ldb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx_ldb_remove(struct platform_device *pdev)
+static void imx_ldb_remove(struct platform_device *pdev)
 {
 	struct imx_ldb *imx_ldb = platform_get_drvdata(pdev);
 	int i;
@@ -750,12 +750,11 @@ static int imx_ldb_remove(struct platform_device *pdev)
 	}
 
 	component_del(&pdev->dev, &imx_ldb_ops);
-	return 0;
 }
 
 static struct platform_driver imx_ldb_driver = {
 	.probe		= imx_ldb_probe,
-	.remove		= imx_ldb_remove,
+	.remove_new	= imx_ldb_remove,
 	.driver		= {
 		.of_match_table = imx_ldb_dt_ids,
 		.name	= DRIVER_NAME,
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index d6832f506322..b49bddb85535 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -645,10 +645,9 @@ static int imx_tve_probe(struct platform_device *pdev)
 	return component_add(dev, &imx_tve_ops);
 }
 
-static int imx_tve_remove(struct platform_device *pdev)
+static void imx_tve_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &imx_tve_ops);
-	return 0;
 }
 
 static const struct of_device_id imx_tve_dt_ids[] = {
@@ -659,7 +658,7 @@ MODULE_DEVICE_TABLE(of, imx_tve_dt_ids);
 
 static struct platform_driver imx_tve_driver = {
 	.probe		= imx_tve_probe,
-	.remove		= imx_tve_remove,
+	.remove_new	= imx_tve_remove,
 	.driver		= {
 		.of_match_table = imx_tve_dt_ids,
 		.name	= "imx-tve",
diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 5f26090b0c98..8819e40d5e6e 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -441,10 +441,9 @@ static int ipu_drm_probe(struct platform_device *pdev)
 	return component_add(dev, &ipu_crtc_ops);
 }
 
-static int ipu_drm_remove(struct platform_device *pdev)
+static void ipu_drm_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &ipu_crtc_ops);
-	return 0;
 }
 
 struct platform_driver ipu_drm_driver = {
@@ -452,5 +451,5 @@ struct platform_driver ipu_drm_driver = {
 		.name = "imx-ipuv3-crtc",
 	},
 	.probe = ipu_drm_probe,
-	.remove = ipu_drm_remove,
+	.remove_new = ipu_drm_remove,
 };
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 0fa0b590830b..70349739dd89 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -353,11 +353,9 @@ static int imx_pd_probe(struct platform_device *pdev)
 	return component_add(dev, &imx_pd_ops);
 }
 
-static int imx_pd_remove(struct platform_device *pdev)
+static void imx_pd_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &imx_pd_ops);
-
-	return 0;
 }
 
 static const struct of_device_id imx_pd_dt_ids[] = {
@@ -368,7 +366,7 @@ MODULE_DEVICE_TABLE(of, imx_pd_dt_ids);
 
 static struct platform_driver imx_pd_driver = {
 	.probe		= imx_pd_probe,
-	.remove		= imx_pd_remove,
+	.remove_new	= imx_pd_remove,
 	.driver		= {
 		.of_match_table = imx_pd_dt_ids,
 		.name	= "imx-parallel-display",
-- 
2.39.2

