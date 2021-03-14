Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1710733A60E
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154416E0C4;
	Sun, 14 Mar 2021 16:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5126E0C4;
 Sun, 14 Mar 2021 16:34:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l19so6729841wmh.1;
 Sun, 14 Mar 2021 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PEZSLtKLB6SS7tdK3utFjawPAXqzq/i1hnM8ugdeSv0=;
 b=loxFQMotnyz6jwBUhcXMah7bXVybSdE3SLsvXqfaey92D9KOy78CQUtndclESQKjiA
 GPJcn4jBSAhNmUJwnteTAjt8pi8586bweiaOp0EUiOywlncv40hVsQs+RXt/1Ju/fLJi
 vWbRjGC5L5fQUcbcq/suF2yknCuiYj2rBh071bXbACYAvGH16NZ4ZeKQjogORMXUlveU
 Xo4piVTyJ0mgRocXGL/zICwg6UW1BYN9dBO9DREw4A3g6XeEY6GbyogTbUwen8JjRPbC
 yyV7z3/NYyJ8tNiKG4G8Ik15PteRTmnoSNjXyYQQs9bZNuogI9VQTcJVBa6VoHz24aw4
 LprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PEZSLtKLB6SS7tdK3utFjawPAXqzq/i1hnM8ugdeSv0=;
 b=BU89CaOQtbS9fGjp1W96TqpkbqBUC6hdUyUpe0MnXO1YxciD14ukBblOElHw/By9nT
 V7nOG7wkZTIcxlJyU2Osqfp9b9qb6j1HcwHvkwNpA4L40bc3ipVy1DCGstyp282cQ3TI
 mE7KrYUXOdipmF9sfFp4xB8R0tD1Uy2/o5kqNM3AOMIjpDTNao/iDw+bJangGkP/mKaD
 DgN3F242SARQUEqffR7Bh+f7j55SKHX0apiPhOSqIF5P/OMfkLsh7OFIl4r8ycfOruoz
 4hz5xMlYJg3JVVzz87n9MrnZJQIdWHfghf8O9Eam7GxjWeBlcgMPGRuhs7/ZaZ5OUksH
 CHDw==
X-Gm-Message-State: AOAM532pCK1s5f9Lu5y+QAMNFqLovH7KxpNuTMPaFK+f2wzV9qAF/IUp
 NE/zT5nAaklB5UKv9RQDFq4=
X-Google-Smtp-Source: ABdhPJzsMJVWWAN7WTcug7O/JgWHaVJmmic1ddqEukrXPNnhlwZcEec5y421Sh9n0lshIo6I71xL5g==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr21904356wmi.127.1615739693057; 
 Sun, 14 Mar 2021 09:34:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:52 -0700 (PDT)
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
Subject: [PATCH v3 11/15] drm/msm: Convert to use resource-managed OPP API
Date: Sun, 14 Mar 2021 19:34:04 +0300
Message-Id: <20210314163408.22292-12-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314163408.22292-1-digetx@gmail.com>
References: <20210314163408.22292-1-digetx@gmail.com>
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 11 +++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 23 +++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c        | 30 +++++--------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h        |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c     |  5 +----
 drivers/gpu/drm/msm/dsi/dsi_host.c      | 13 ++++-------
 11 files changed, 25 insertions(+), 68 deletions(-)

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
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 690409ca8a18..c87b4665bb37 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1265,9 +1265,6 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 
 	adreno_gpu_cleanup(adreno_gpu);
 
-	if (a6xx_gpu->opp_table)
-		dev_pm_opp_put_supported_hw(a6xx_gpu->opp_table);
-
 	kfree(a6xx_gpu);
 }
 
@@ -1400,7 +1397,6 @@ static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
 static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 		u32 revn)
 {
-	struct opp_table *opp_table;
 	u32 supp_hw = UINT_MAX;
 	u16 speedbin;
 	int ret;
@@ -1417,11 +1413,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
 
 done:
-	opp_table = dev_pm_opp_set_supported_hw(dev, &supp_hw, 1);
-	if (IS_ERR(opp_table))
-		return PTR_ERR(opp_table);
+	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
+	if (ret)
+		return ret;
 
-	a6xx_gpu->opp_table = opp_table;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ce0610c5256f..e793d329e77b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -33,8 +33,6 @@ struct a6xx_gpu {
 	void *llc_slice;
 	void *htw_llc_slice;
 	bool have_mmu500;
-
-	struct opp_table *opp_table;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
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
index 5a8e3e1fc48c..0c057e73ebf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1088,21 +1088,21 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	if (!dpu_kms)
 		return -ENOMEM;
 
-	dpu_kms->opp_table = dev_pm_opp_set_clkname(dev, "core");
-	if (IS_ERR(dpu_kms->opp_table))
-		return PTR_ERR(dpu_kms->opp_table);
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
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
@@ -1110,7 +1110,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
 	if (ret) {
 		DPU_ERROR("failed to init kms, ret=%d\n", ret);
-		goto err;
+		return ret;
 	}
 	dpu_kms->dev = ddev;
 	dpu_kms->pdev = pdev;
@@ -1119,11 +1119,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
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
 
@@ -1139,9 +1135,6 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 
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
index 1390f3547fde..d20386a5c190 100644
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
@@ -1886,20 +1884,17 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");
-	if (IS_ERR(ctrl->opp_table)) {
+	ret = devm_pm_opp_set_clkname(dev, "ctrl_link");
+	if (ret) {
 		dev_err(dev, "invalid DP OPP table in device tree\n");
-		/* caller do PTR_ERR(ctrl->opp_table) */
-		return (struct dp_ctrl *)ctrl->opp_table;
+		/* caller do PTR_ERR(opp_table) */
+		return (struct dp_ctrl *)ERR_PTR(ret);
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
@@ -1915,16 +1910,3 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 
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
index ab281cba0f08..e0fca4224cfd 100644
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
@@ -1886,14 +1884,13 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
-	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "byte");
-	if (IS_ERR(msm_host->opp_table))
-		return PTR_ERR(msm_host->opp_table);
+	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
+	if (ret)
+		return ret;
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		dev_pm_opp_put_clkname(msm_host->opp_table);
 		return ret;
 	}
 
@@ -1932,8 +1929,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	mutex_destroy(&msm_host->cmd_mutex);
 	mutex_destroy(&msm_host->dev_mutex);
 
-	dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
-	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_disable(&msm_host->pdev->dev);
 }
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
