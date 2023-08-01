Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364F576B291
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D5710E3DB;
	Tue,  1 Aug 2023 11:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D478310E089
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:03:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9L-0006fW-T7; Tue, 01 Aug 2023 13:02:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-000MZ5-F7; Tue, 01 Aug 2023 13:02:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9H-009bbU-ND; Tue, 01 Aug 2023 13:02:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan+linaro@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "Joel Fernandes (Google)" <joel@joelfernandes.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Su Hui <suhui@nfschina.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Rob Herring <robh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH v2 08/12] drm/msm: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:35 +0200
Message-Id: <20230801110239.831099-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10594;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=DQXdudoZIFzC5d4kK4v4DYpgqsziHn9Og79FUsg0vy4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOW9T1PQAaa823KGFef24R+Qln/jL+jd1cmpH
 dygd8kSZVuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjlvQAKCRCPgPtYfRL+
 Tlx8B/0Wt3NXUOPplh/9zHq9b1+X7KtKpvb/CkzDb4IoCs4dFycMO0wTD4Bti/3yUn5YW5RZjzQ
 m5al1J9D6cXXQXMT8ZGM5W1xu/DUvQqCk56PQTyqN2p5DP2j0F4CaaYJu80N+8GcxG8LcWvGqN2
 AnggvQ2WShM2IL5VN8+zUeO0uDeYaINMw8Rh4XUYJN/H9Dm5WWPhFLJQ2ePHgib/WdDNexenvc5
 lBaN7/3cyOwg83kOMJZxHnS8D9IPvqVbLdIK5r8IGYOTDY2PkhzXh7rk0rTRCnOsCREz3hy19bP
 daqrE7JYGu++9IYF/LZVY24cjvfTqNWYXECK1kWUHOqQJ2Kk
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
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
index cb94cfd137a8..26a27cb039e9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -647,10 +647,9 @@ static int adreno_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int adreno_remove(struct platform_device *pdev)
+static void adreno_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &a3xx_ops);
-	return 0;
 }
 
 static void adreno_shutdown(struct platform_device *pdev)
@@ -765,7 +764,7 @@ static const struct dev_pm_ops adreno_pm_ops = {
 
 static struct platform_driver adreno_driver = {
 	.probe = adreno_probe,
-	.remove = adreno_remove,
+	.remove_new = adreno_remove,
 	.shutdown = adreno_shutdown,
 	.driver = {
 		.name = "adreno",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..a16ae7db6245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1239,11 +1239,9 @@ static int dpu_dev_probe(struct platform_device *pdev)
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
@@ -1318,7 +1316,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
-	.remove = dpu_dev_remove,
+	.remove_new = dpu_dev_remove,
 	.shutdown = msm_drv_shutdown,
 	.driver = {
 		.name = "msm_dpu",
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 6e37072ed302..3c4258d1784b 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -561,11 +561,9 @@ static int mdp4_probe(struct platform_device *pdev)
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
@@ -576,7 +574,7 @@ MODULE_DEVICE_TABLE(of, mdp4_dt_match);
 
 static struct platform_driver mdp4_platform_driver = {
 	.probe      = mdp4_probe,
-	.remove     = mdp4_remove,
+	.remove_new = mdp4_remove,
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "mdp4",
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 323079cfd698..e8aebad5f208 100644
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
index 76f13954015b..01784e9e7127 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1296,7 +1296,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int dp_display_remove(struct platform_device *pdev)
+static void dp_display_remove(struct platform_device *pdev)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
 
@@ -1304,8 +1304,6 @@ static int dp_display_remove(struct platform_device *pdev)
 	dp_display_deinit_sub_modules(dp);
 
 	platform_set_drvdata(pdev, NULL);
-
-	return 0;
 }
 
 static int dp_pm_resume(struct device *dev)
@@ -1415,7 +1413,7 @@ static const struct dev_pm_ops dp_pm_ops = {
 
 static struct platform_driver dp_display_driver = {
 	.probe  = dp_display_probe,
-	.remove = dp_display_remove,
+	.remove_new = dp_display_remove,
 	.driver = {
 		.name = "msm-dp-display",
 		.of_match_table = dp_dt_match,
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index baab79ab6e74..7a8208cd6649 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -161,14 +161,12 @@ static int dsi_dev_probe(struct platform_device *pdev)
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
@@ -187,7 +185,7 @@ static const struct dev_pm_ops dsi_pm_ops = {
 
 static struct platform_driver dsi_driver = {
 	.probe = dsi_dev_probe,
-	.remove = dsi_dev_remove,
+	.remove_new = dsi_dev_remove,
 	.driver = {
 		.name = "msm_dsi",
 		.of_match_table = dt_match,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 60509fb39710..b6bcb9f675fe 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -551,15 +551,13 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
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
@@ -574,7 +572,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 
 static struct platform_driver msm_hdmi_driver = {
 	.probe = msm_hdmi_dev_probe,
-	.remove = msm_hdmi_dev_remove,
+	.remove_new = msm_hdmi_dev_remove,
 	.driver = {
 		.name = "hdmi_msm",
 		.of_match_table = msm_hdmi_dt_match,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 3e00fb8190b2..88a3423b7f24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -177,11 +177,9 @@ static int msm_hdmi_phy_probe(struct platform_device *pdev)
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
@@ -200,7 +198,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 
 static struct platform_driver msm_hdmi_phy_platform_driver = {
 	.probe      = msm_hdmi_phy_probe,
-	.remove     = msm_hdmi_phy_remove,
+	.remove_new = msm_hdmi_phy_remove,
 	.driver     = {
 		.name   = "msm_hdmi_phy",
 		.of_match_table = msm_hdmi_phy_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2a0e3529598b..551b0bc28095 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1278,11 +1278,9 @@ static int msm_pdev_probe(struct platform_device *pdev)
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
@@ -1303,7 +1301,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
 
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
-	.remove     = msm_pdev_remove,
+	.remove_new = msm_pdev_remove,
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6bf6c4a0f550..268fb3d490de 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -492,15 +492,13 @@ static int mdss_probe(struct platform_device *pdev)
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
 
 static const struct msm_mdss_data sc7180_data = {
@@ -594,7 +592,7 @@ MODULE_DEVICE_TABLE(of, mdss_dt_match);
 
 static struct platform_driver mdss_platform_driver = {
 	.probe      = mdss_probe,
-	.remove     = mdss_remove,
+	.remove_new = mdss_remove,
 	.driver     = {
 		.name   = "msm-mdss",
 		.of_match_table = mdss_dt_match,
-- 
2.39.2

