Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA32E91D1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208C6896E5;
	Mon,  4 Jan 2021 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1A089BBE;
 Fri,  1 Jan 2021 16:58:59 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id iq13so6292634pjb.3;
 Fri, 01 Jan 2021 08:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d0MeQ6bYLtbPcxoPQlZFc3ic9eUjEeCkrstTXoX/svQ=;
 b=HAmdTHbj5KTn/8LyhESYVv8JE6FMzRlAkEB1db1RQttKdpr46a56BQdfYTw8JN7NGg
 nO8c6DAZE2viWIBzXRXLbANRuvpUdJZ4abRv0qHtpyj8cupXUGdcVES8REhggy5mJ1DS
 /SvqAlmLtRV7QRceQZtwahiWWz6ymNuzDODXAxX8770i87k8+/gajOdswWQ0y7SdRIkY
 /5u21r/3w+J60Ti2zUB9v14hew8q/5Pt1Bz3qclZH2mp6pSqCOoTdCgkLbF5TQbn7m5i
 UALh+YnLg8UINoPjD92g0i4mamXY+OPuF5S4YM6u991nZWSocAo0j45tQdccFgRyACuQ
 wy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d0MeQ6bYLtbPcxoPQlZFc3ic9eUjEeCkrstTXoX/svQ=;
 b=B/Y1GwAHjuJMN/CW9n08o0dBvq3nvvQ14NqPhqXlAvMeMt1TpaFHlWWizD6r/x70G+
 smB7nld34GLMYpWYSUbpbUBMGPh6DFf3AQNoFc+tkUK1EXWYFWMFKcdjnwcd0XzeC6uX
 ZSXNGaWIKIBK3YHCaRj/PP5l96ThaMPbw/UySybFucI+JS3Ign3GRIOQoChV/LQuqC7S
 og/jwnwTqIReMmsJMhVOHQih5u/c9SYZVLxn7APS2ftpKi9lBdDUs1df07nxcci0OHXU
 RiuVszRjubVY5+0z1FpmcHhHDiK7ejAarG5YTjB48ce6LDCA4hcISvEPFaj+8G4a64f0
 Tl3Q==
X-Gm-Message-State: AOAM5319faCpzcSZpj9uqHuacw22VY2DF7JWzb9P8iR4lhnDmdgRH8uP
 F0efxyK+mkkAoszNeH84jr4=
X-Google-Smtp-Source: ABdhPJwLT40/cdQZVPfecrvJ0EfyqQq30J2h7Pf5a16H46Pl2j7y17c6pU10FoFKACrkriwNvo+nDA==
X-Received: by 2002:a17:902:ed45:b029:da:c274:d7ac with SMTP id
 y5-20020a170902ed45b02900dac274d7acmr61615241plb.69.1609520338834; 
 Fri, 01 Jan 2021 08:58:58 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:58:58 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 stanimir.varbanov@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, mchehab@kernel.org, lukasz.luba@arm.com,
 adrian.hunter@intel.com, ulf.hansson@linaro.org, vireshk@kernel.org,
 nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, tiny.windzz@gmail.com,
 ddavenport@chromium.org, jsanka@codeaurora.org, rnayak@codeaurora.org,
 tongtiangen@huawei.com, miaoqinglang@huawei.com, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, chandanu@codeaurora.org, groeck@chromium.org,
 varar@codeaurora.org, mka@chromium.org, harigovi@codeaurora.org,
 rikard.falkeborn@gmail.com, natechancellor@gmail.com,
 georgi.djakov@linaro.org, akashast@codeaurora.org, parashar@codeaurora.org,
 dianders@chromium.org
Subject: [PATCH 16/31] drm/msm: convert to use devm_pm_opp_* API and remove
 dp_ctrl_put
Date: Fri,  1 Jan 2021 16:54:52 +0000
Message-Id: <20210101165507.19486-17-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Use devm_pm_opp_* to simplif code and avoid mem leak.
2. Remove opp_table from dpu_kms, dp_ctrl_private and msm_dsi_host,
since it does not need a global scope.
3. Remove dp_ctrl_put.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 23 ++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c        | 29 ++++++-------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h        |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c     |  5 +----
 drivers/gpu/drm/msm/dsi/dsi_host.c      | 15 +++++--------
 9 files changed, 26 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a5af223eaf50..47e51c632209 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1560,7 +1560,7 @@ static void check_speed_bin(struct device *dev)
 		nvmem_cell_put(cell);
 	}
 
-	dev_pm_opp_set_supported_hw(dev, &val, 1);
+	devm_pm_opp_set_supported_hw(dev, &val, 1);
 }
 
 struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e6703ae98760..bd159e6fac5a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1321,7 +1321,7 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 	 * The GMU handles its own frequency switching so build a list of
 	 * available frequencies to send during initialization
 	 */
-	ret = dev_pm_opp_of_add_table(gmu->dev);
+	ret = devm_pm_opp_of_add_table(gmu->dev);
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev, "Unable to set the OPP table for the GMU\n");
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6cf9975e951e..e6c446c436e3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -845,7 +845,7 @@ static void adreno_get_pwrlevels(struct device *dev,
 	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
 		ret = adreno_get_legacy_pwrlevels(dev);
 	else {
-		ret = dev_pm_opp_of_add_table(dev);
+		ret = devm_pm_opp_of_add_table(dev);
 		if (ret)
 			DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 6f19dfcb4965..cb7e4fddf268 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1082,19 +1082,20 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	struct msm_drm_private *priv = ddev->dev_private;
 	struct dpu_kms *dpu_kms;
 	struct dss_module_power *mp;
+	struct opp_table *opp_table;
 	int ret = 0;
 
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
 
-	dpu_kms->opp_table = dev_pm_opp_set_clkname(dev, "core");
-	if (IS_ERR(dpu_kms->opp_table))
-		return PTR_ERR(dpu_kms->opp_table);
+	opp_table = devm_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret) {
-		dev_pm_opp_put_clkname(dpu_kms->opp_table);
+		devm_pm_opp_put_clkname(dev, opp_table);
 		if (ret != -ENODEV) {
 			dev_err(dev, "invalid OPP table in device tree\n");
 			return ret;
@@ -1105,7 +1106,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	ret = msm_dss_parse_clock(pdev, mp);
 	if (ret) {
 		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, dpu_kms);
@@ -1113,7 +1114,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
 	if (ret) {
 		DPU_ERROR("failed to init kms, ret=%d\n", ret);
-		goto err;
+		return ret;
 	}
 	dpu_kms->dev = ddev;
 	dpu_kms->pdev = pdev;
@@ -1122,10 +1123,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	dpu_kms->rpm_enabled = true;
 
 	priv->kms = &dpu_kms->base;
-	return ret;
-err:
-	dev_pm_opp_of_remove_table(dev);
-	dev_pm_opp_put_clkname(dpu_kms->opp_table);
+
 	return ret;
 }
 
@@ -1141,9 +1139,6 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 
 	if (dpu_kms->rpm_enabled)
 		pm_runtime_disable(&pdev->dev);
-
-	dev_pm_opp_of_remove_table(dev);
-	dev_pm_opp_put_clkname(dpu_kms->opp_table);
 }
 
 static const struct component_ops dpu_ops = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d6717d6672f7..1483995a94d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -130,8 +130,6 @@ struct dpu_kms {
 	struct platform_device *pdev;
 	bool rpm_enabled;
 
-	struct opp_table *opp_table;
-
 	struct dss_module_power mp;
 
 	/* reference count bandwidth requests, so we know when we can
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e3462f5d96d7..fdb696ec9d9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -77,8 +77,6 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
-	struct opp_table *opp_table;
-
 	struct completion idle_comp;
 	struct completion video_comp;
 };
@@ -1873,6 +1871,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_parser *parser)
 {
 	struct dp_ctrl_private *ctrl;
+	struct opp_table *opp_table;
 	int ret;
 
 	if (!dev || !panel || !aux ||
@@ -1887,19 +1886,18 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");
-	if (IS_ERR(ctrl->opp_table)) {
+	opp_table = devm_pm_opp_set_clkname(dev, "ctrl_link");
+	if (IS_ERR(opp_table)) {
 		dev_err(dev, "invalid DP OPP table in device tree\n");
-		/* caller do PTR_ERR(ctrl->opp_table) */
-		return (struct dp_ctrl *)ctrl->opp_table;
+		/* caller do PTR_ERR(opp_table) */
+		return (struct dp_ctrl *)opp_table;
 	}
 
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret) {
 		dev_err(dev, "failed to add DP OPP table\n");
-		dev_pm_opp_put_clkname(ctrl->opp_table);
-		ctrl->opp_table = NULL;
+		devm_pm_opp_put_clkname(dev, opp_table);
 	}
 
 	init_completion(&ctrl->idle_comp);
@@ -1916,16 +1914,3 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 
 	return &ctrl->dp_ctrl;
 }
-
-void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
-{
-	struct dp_ctrl_private *ctrl;
-
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-
-	if (ctrl->opp_table) {
-		dev_pm_opp_of_remove_table(ctrl->dev);
-		dev_pm_opp_put_clkname(ctrl->opp_table);
-		ctrl->opp_table = NULL;
-	}
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f60ba93c8678..dcd6bde2b23d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -31,6 +31,5 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_power *power, struct dp_catalog *catalog,
 			struct dp_parser *parser);
-void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6e971d552911..44c1572e7005 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -706,7 +706,6 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
 	dp_debug_put(dp->debug);
-	dp_ctrl_put(dp->ctrl);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
 	dp_audio_put(dp->audio);
@@ -800,13 +799,11 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
 		dp->audio = NULL;
-		goto error_audio;
+		goto error_ctrl;
 	}
 
 	return rc;
 
-error_audio:
-	dp_ctrl_put(dp->ctrl);
 error_ctrl:
 	dp_panel_put(dp->panel);
 error_link:
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a282307f2799..30c89dd448b9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -113,8 +113,6 @@ struct msm_dsi_host {
 	struct clk *pixel_clk_src;
 	struct clk *byte_intf_clk;
 
-	struct opp_table *opp_table;
-
 	u32 byte_clk_rate;
 	u32 pixel_clk_rate;
 	u32 esc_clk_rate;
@@ -1822,6 +1820,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 {
 	struct msm_dsi_host *msm_host = NULL;
 	struct platform_device *pdev = msm_dsi->pdev;
+	struct opp_table *opp_table;
 	int ret;
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
@@ -1886,13 +1885,13 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
-	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "byte");
-	if (IS_ERR(msm_host->opp_table))
-		return PTR_ERR(msm_host->opp_table);
+	opp_table = devm_pm_opp_set_clkname(&pdev->dev, "byte");
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret) {
-		dev_pm_opp_put_clkname(msm_host->opp_table);
+		devm_pm_opp_put_clkname(&pdev->dev, opp_table);
 		if (ret != -ENODEV) {
 			dev_err(&pdev->dev, "invalid OPP table in device tree\n");
 			return ret;
@@ -1934,8 +1933,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	mutex_destroy(&msm_host->cmd_mutex);
 	mutex_destroy(&msm_host->dev_mutex);
 
-	dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
-	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_disable(&msm_host->pdev->dev);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
