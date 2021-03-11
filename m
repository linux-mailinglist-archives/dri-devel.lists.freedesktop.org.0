Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39A337D9C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182BA6EBA6;
	Thu, 11 Mar 2021 19:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35516EB94;
 Thu, 11 Mar 2021 19:21:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u4so41678312lfs.0;
 Thu, 11 Mar 2021 11:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F42wbfm9swQcWjHqQZGPfWt+ITu4UeiWzX43fB3h42w=;
 b=FZsWC7BKKifar8O3yvIsOn3Dy58tUR1dyY5JxWE+AGwDLPphnXiuAUbw8l0/kxO0vd
 mknhXB+QRwJWyPCWfGP2fTmOGniVI1gS+T5xYiBOXFLVx2ENN+klo/3KSvx9RZ+2tK07
 cEeVB+iDjynOqDqvpiDApDV6LbOm1jY+mh0Tqh2pKoa3F/o0D3CDtESJkKcVLxnsm2j2
 a7SCatk6fQ3opuO64zgoILxbkscbUSphhBGPaDyYCE8nYGj/pijC1Cc7+1/c0vYZkUdW
 m4mG5u48zENhrEuHY22GPz2Io+T4JWF587sFxbNkOH4s0m2tRtr0MJxPL7AP9AjzWQSq
 etIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F42wbfm9swQcWjHqQZGPfWt+ITu4UeiWzX43fB3h42w=;
 b=mhZlgIjNh6xiEJje+5KLCMRDHkZHUSZXdCW/TJ9g9txh6b7ngteg2KNJP5hdnpM4ay
 oct1XfUNK2hUEQ8wWe2vhNkD/u0T8ySWAULh5ggQOEZfiZVlpeqT2fBHx8hG0XNy5xSO
 1EgsKF5lD93VAve5eoVRqP1Ez1fexN5UPAUbCxZqz6Y+X2FimZYXuDvBz3lg+dZzajLE
 q90Eg3LXOIUT/mYXD9xu1Lcj9+T1U0Zs++pu0OeJZdEA7fc1eGjRE63W9ndwUYTQJpQD
 Y1/N/vLsAgEfKvmrPdHNFtZHC9EHBdM4trQmS/aUofCRsxYMwVypofO71G1eRUfce/8S
 qEhQ==
X-Gm-Message-State: AOAM533m00P79rfGx7kjzXm+I5yKEBKmgib5DS27/7DmdBR+i7dJC0dZ
 7FRMroYr0JgrtojyajhIxco=
X-Google-Smtp-Source: ABdhPJwb3YRI7OWwFyZVKmS9BPsHp7f+Ro2/iQYI4vQe+wbTXlFub3JGwR5x2n7wphwDra4zQSSyUg==
X-Received: by 2002:a05:6512:3582:: with SMTP id
 m2mr3201372lfr.10.1615490509044; 
 Thu, 11 Mar 2021 11:21:49 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 10/14] drm/msm: Convert to use resource-managed OPP API
Date: Thu, 11 Mar 2021 22:21:01 +0300
Message-Id: <20210311192105.14998-11-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311192105.14998-1-digetx@gmail.com>
References: <20210311192105.14998-1-digetx@gmail.com>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yangtao Li <tiny.windzz@gmail.com>

Use resource-managed OPP API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 24 +++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c        | 31 ++++++-------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h        |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c     |  5 +---
 drivers/gpu/drm/msm/dsi/dsi_host.c      | 14 ++++-------
 9 files changed, 25 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 7e553d3efeb2..caf747ba8d5b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1705,7 +1705,7 @@ static void check_speed_bin(struct device *dev)
 		nvmem_cell_put(cell);
 	}
 
-	dev_pm_opp_set_supported_hw(dev, &val, 1);
+	devm_pm_opp_set_supported_hw(dev, &val, 1);
 }
 
 struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 91cf46f84025..232940b41720 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1340,7 +1340,7 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 	 * The GMU handles its own frequency switching so build a list of
 	 * available frequencies to send during initialization
 	 */
-	ret = dev_pm_opp_of_add_table(gmu->dev);
+	ret = devm_pm_opp_of_add_table(gmu->dev);
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev, "Unable to set the OPP table for the GMU\n");
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0f184c3dd9d9..dfd3cac50f7f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -841,7 +841,7 @@ static void adreno_get_pwrlevels(struct device *dev,
 	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
 		ret = adreno_get_legacy_pwrlevels(dev);
 	else {
-		ret = dev_pm_opp_of_add_table(dev);
+		ret = devm_pm_opp_of_add_table(dev);
 		if (ret)
 			DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5a8e3e1fc48c..8344a3314133 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1082,27 +1082,28 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
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
 	if (ret && ret != -ENODEV) {
 		dev_err(dev, "invalid OPP table in device tree\n");
-		goto put_clkname;
+		return ret;
 	}
 
 	mp = &dpu_kms->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
 	if (ret) {
 		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, dpu_kms);
@@ -1110,7 +1111,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
 	if (ret) {
 		DPU_ERROR("failed to init kms, ret=%d\n", ret);
-		goto err;
+		return ret;
 	}
 	dpu_kms->dev = ddev;
 	dpu_kms->pdev = pdev;
@@ -1119,11 +1120,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	dpu_kms->rpm_enabled = true;
 
 	priv->kms = &dpu_kms->base;
-	return ret;
-err:
-	dev_pm_opp_of_remove_table(dev);
-put_clkname:
-	dev_pm_opp_put_clkname(dpu_kms->opp_table);
+
 	return ret;
 }
 
@@ -1139,9 +1136,6 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 
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
index 1390f3547fde..b186bd8d43ab 100644
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
@@ -1872,6 +1870,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_parser *parser)
 {
 	struct dp_ctrl_private *ctrl;
+	struct opp_table *opp_table;
 	int ret;
 
 	if (!dev || !panel || !aux ||
@@ -1886,20 +1885,17 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
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
-	if (ret) {
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
 		dev_err(dev, "failed to add DP OPP table\n");
-		dev_pm_opp_put_clkname(ctrl->opp_table);
-		ctrl->opp_table = NULL;
-	}
 
 	init_completion(&ctrl->idle_comp);
 	init_completion(&ctrl->video_comp);
@@ -1915,16 +1911,3 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 
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
index a836bd358447..a6f6fa2c2aef 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -31,6 +31,5 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_power *power, struct dp_catalog *catalog,
 			struct dp_parser *parser);
-void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6e1eaf..6dde09c0c52e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -720,7 +720,6 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
 	dp_debug_put(dp->debug);
-	dp_ctrl_put(dp->ctrl);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
 	dp_audio_put(dp->audio);
@@ -814,13 +813,11 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
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
index ab281cba0f08..6bfc4baddde3 100644
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
@@ -1886,14 +1885,13 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
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
 	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		dev_pm_opp_put_clkname(msm_host->opp_table);
 		return ret;
 	}
 
@@ -1932,8 +1930,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	mutex_destroy(&msm_host->cmd_mutex);
 	mutex_destroy(&msm_host->dev_mutex);
 
-	dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
-	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_disable(&msm_host->pdev->dev);
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
