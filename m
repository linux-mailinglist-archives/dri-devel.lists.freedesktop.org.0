Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B76F99FC
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831B910E2C1;
	Sun,  7 May 2023 16:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7622010E28C
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:27:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-00026H-MH; Sun, 07 May 2023 18:26:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDY-001nDh-C7; Sun, 07 May 2023 18:26:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDX-002Ahi-OT; Sun, 07 May 2023 18:26:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Johan Hovold <johan+linaro@kernel.org>, Joel@pengutronix.de,
 Fernandes@pengutronix.de, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Liu Shixin <liushixin2@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 Miaoqian Lin <linmq006@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 31/53] drm/msm: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:25:54 +0200
Message-Id: <20230507162616.1368908-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10451;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CKmA1MoPFhvTsZuzcqmf65a2BYZ+TP/RrnqQzcAIOPU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EIGYkQ7XbNx71ppgBLH+MWORknGbl+9W+O6
 EFRpqkYy7yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRCAAKCRCPgPtYfRL+
 To8cB/4stQCtEmnkfMiiK2nlbM6VBoZ2yqoWJ7fHc2an2HFyZKTIf5k3lE8aSVkPEoYixeRuc6C
 C8rjXou+2D6WX3RrjONWDsDS7O8ra/fkuMMorygQ0jRDqD7X8j5mjJ+FCmoD7iAGcQ1YNBBiGxA
 ZcabcUngcoCLy+JcPt1bxxUhIk0XtHGStRiHbdg8+r24Dr85TNK1cvH8cikhmXXO0NKBIdSwLZS
 eniDPGuu0ai6rzKR+Pa5P7Chr1Azo9mtXQbb54VkbKCdcl7M7bvOLNRzTjRKi6ZlvnjuaiZX7JP
 0UUpzK97sfimmyG/2HwO5eHz8m3MD4HbsgCb/ajchwWKM+CN
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert the msm drm drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 6 ++----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 6 ++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 5 ++---
 drivers/gpu/drm/msm/dp/dp_display.c        | 6 ++----
 drivers/gpu/drm/msm/dsi/dsi.c              | 6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi.c            | 6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 6 ++----
 drivers/gpu/drm/msm/msm_drv.c              | 6 ++----
 drivers/gpu/drm/msm/msm_mdss.c             | 6 ++----
 10 files changed, 20 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c5c4c93b3689..c6f443ac7904 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -603,10 +603,9 @@ static int adreno_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int adreno_remove(struct platform_device *pdev)
+static void adreno_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &a3xx_ops);
-	return 0;
 }
 
 static void adreno_shutdown(struct platform_device *pdev)
@@ -721,7 +720,7 @@ static const struct dev_pm_ops adreno_pm_ops = {
 
 static struct platform_driver adreno_driver = {
 	.probe = adreno_probe,
-	.remove = adreno_remove,
+	.remove_new = adreno_remove,
 	.shutdown = adreno_shutdown,
 	.driver = {
 		.name = "adreno",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a683bd9b5a04..918c8c4f8e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1240,11 +1240,9 @@ static int dpu_dev_probe(struct platform_device *pdev)
 	return msm_drv_probe(&pdev->dev, dpu_kms_init);
 }
 
-static int dpu_dev_remove(struct platform_device *pdev)
+static void dpu_dev_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &msm_drm_ops);
-
-	return 0;
 }
 
 static int __maybe_unused dpu_runtime_suspend(struct device *dev)
@@ -1317,7 +1315,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
-	.remove = dpu_dev_remove,
+	.remove_new = dpu_dev_remove,
 	.shutdown = msm_drv_shutdown,
 	.driver = {
 		.name = "msm_dpu",
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9a1a0769575d..727d20ef9f02 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -566,11 +566,9 @@ static int mdp4_probe(struct platform_device *pdev)
 	return msm_drv_probe(&pdev->dev, mdp4_kms_init);
 }
 
-static int mdp4_remove(struct platform_device *pdev)
+static void mdp4_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &msm_drm_ops);
-
-	return 0;
 }
 
 static const struct of_device_id mdp4_dt_match[] = {
@@ -581,7 +579,7 @@ MODULE_DEVICE_TABLE(of, mdp4_dt_match);
 
 static struct platform_driver mdp4_platform_driver = {
 	.probe      = mdp4_probe,
-	.remove     = mdp4_remove,
+	.remove_new = mdp4_remove,
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "mdp4",
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 29ae5c9613f3..51b313b4da51 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -942,11 +942,10 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 	return msm_drv_probe(&pdev->dev, mdp5_kms_init);
 }
 
-static int mdp5_dev_remove(struct platform_device *pdev)
+static void mdp5_dev_remove(struct platform_device *pdev)
 {
 	DBG("");
 	component_master_del(&pdev->dev, &msm_drm_ops);
-	return 0;
 }
 
 static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
@@ -987,7 +986,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
 
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
-	.remove = mdp5_dev_remove,
+	.remove_new = mdp5_dev_remove,
 	.shutdown = msm_drv_shutdown,
 	.driver = {
 		.name = "msm_mdp",
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bde1a7ce442f..3fec97ede90e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1347,7 +1347,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int dp_display_remove(struct platform_device *pdev)
+static void dp_display_remove(struct platform_device *pdev)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
 
@@ -1355,8 +1355,6 @@ static int dp_display_remove(struct platform_device *pdev)
 
 	component_del(&pdev->dev, &dp_display_comp_ops);
 	platform_set_drvdata(pdev, NULL);
-
-	return 0;
 }
 
 static int dp_pm_resume(struct device *dev)
@@ -1471,7 +1469,7 @@ static const struct dev_pm_ops dp_pm_ops = {
 
 static struct platform_driver dp_display_driver = {
 	.probe  = dp_display_probe,
-	.remove = dp_display_remove,
+	.remove_new = dp_display_remove,
 	.driver = {
 		.name = "msm-dp-display",
 		.of_match_table = dp_dt_match,
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 31fdee2052be..c5d65f0a5140 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -162,14 +162,12 @@ static int dsi_dev_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int dsi_dev_remove(struct platform_device *pdev)
+static void dsi_dev_remove(struct platform_device *pdev)
 {
 	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
 
 	DBG("");
 	dsi_destroy(msm_dsi);
-
-	return 0;
 }
 
 static const struct of_device_id dt_match[] = {
@@ -186,7 +184,7 @@ static const struct dev_pm_ops dsi_pm_ops = {
 
 static struct platform_driver dsi_driver = {
 	.probe = dsi_dev_probe,
-	.remove = dsi_dev_remove,
+	.remove_new = dsi_dev_remove,
 	.driver = {
 		.name = "msm_dsi",
 		.of_match_table = dt_match,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3132105a2a43..884d2e142307 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -549,15 +549,13 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int msm_hdmi_dev_remove(struct platform_device *pdev)
+static void msm_hdmi_dev_remove(struct platform_device *pdev)
 {
 	struct hdmi *hdmi = dev_get_drvdata(&pdev->dev);
 
 	component_del(&pdev->dev, &msm_hdmi_ops);
 
 	msm_hdmi_put_phy(hdmi);
-
-	return 0;
 }
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
@@ -572,7 +570,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 
 static struct platform_driver msm_hdmi_driver = {
 	.probe = msm_hdmi_dev_probe,
-	.remove = msm_hdmi_dev_remove,
+	.remove_new = msm_hdmi_dev_remove,
 	.driver = {
 		.name = "hdmi_msm",
 		.of_match_table = msm_hdmi_dt_match,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 9780107e1cc9..52f45d6684b6 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -176,11 +176,9 @@ static int msm_hdmi_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int msm_hdmi_phy_remove(struct platform_device *pdev)
+static void msm_hdmi_phy_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id msm_hdmi_phy_dt_match[] = {
@@ -199,7 +197,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 
 static struct platform_driver msm_hdmi_phy_platform_driver = {
 	.probe      = msm_hdmi_phy_probe,
-	.remove     = msm_hdmi_phy_remove,
+	.remove_new = msm_hdmi_phy_remove,
 	.driver     = {
 		.name   = "msm_hdmi_phy",
 		.of_match_table = msm_hdmi_phy_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index aca48c868c14..8b1d097a82e9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1265,11 +1265,9 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	return msm_drv_probe(&pdev->dev, NULL);
 }
 
-static int msm_pdev_remove(struct platform_device *pdev)
+static void msm_pdev_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &msm_drm_ops);
-
-	return 0;
 }
 
 void msm_drv_shutdown(struct platform_device *pdev)
@@ -1290,7 +1288,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
 
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
-	.remove     = msm_pdev_remove,
+	.remove_new = msm_pdev_remove,
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 02646e4bb4cd..b8567b369063 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -508,15 +508,13 @@ static int mdss_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mdss_remove(struct platform_device *pdev)
+static void mdss_remove(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss = platform_get_drvdata(pdev);
 
 	of_platform_depopulate(&pdev->dev);
 
 	msm_mdss_destroy(mdss);
-
-	return 0;
 }
 
 static const struct of_device_id mdss_dt_match[] = {
@@ -540,7 +538,7 @@ MODULE_DEVICE_TABLE(of, mdss_dt_match);
 
 static struct platform_driver mdss_platform_driver = {
 	.probe      = mdss_probe,
-	.remove     = mdss_remove,
+	.remove_new = mdss_remove,
 	.driver     = {
 		.name   = "msm-mdss",
 		.of_match_table = mdss_dt_match,
-- 
2.39.2

