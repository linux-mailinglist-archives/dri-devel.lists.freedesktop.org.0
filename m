Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D401EB405
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 05:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75236E12D;
	Tue,  2 Jun 2020 03:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA32C6E12A;
 Tue,  2 Jun 2020 03:58:09 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id a4so4435630pfo.4;
 Mon, 01 Jun 2020 20:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nOr5FCHSTEgiVocf45/l3ooSGULR0cJognfb4cEKnPU=;
 b=R1H0NFeL2eZtM5B8fothsEYgC2PdeAg8xkqZwlbaO3QdOeDx86CGQ9C8PTXNij43IJ
 6Wz5HVuBjKUQqCyAqHtl3qTvHltl62wLzE29d0iQZAQ59Z+60Uza2D9cuxKQSn10GD76
 un8DWDfY3UWiyES6VZJw+NgGcwlHp6bOJO4rgMI0KD1n//GTXF6jLfgGFsnJoI56Trja
 PPRnoXjnlUoCM4Jr1KaKxFAg9HGGXg5h9PwbdWVsPXEFeZJs2owpmF6SKHOAC9iUrf4f
 FkzgpS1tmTh5XWXLuyBdPo56nTVmL8tsHgnWmZ2wA0hZMKdZ1rP4yizU9U26jMapJBXK
 m4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nOr5FCHSTEgiVocf45/l3ooSGULR0cJognfb4cEKnPU=;
 b=F3azB7SN9BdzGWRuFp4VNn4QWbWRzg62fy9BZWj6wjpEVVCVnSwaFr6AGSiZl6QFmF
 azzlXAzAAKtWVmmAsxq5TbcJph4C2hnVgeSPq/ytyQjFYVF0K4apga22Jdc5BPv0JEo4
 5aD1HEpIjo2OWLtozggx9Iysd0FcF+Z5tdXqPVEqMY55PVhd+6itV19TednFEaVCPo60
 lLckZ72z0L4cGBtLMKnnaWvl0tzIsQlTE2WsX5Z0YGQqjYK9VNdQsp8kcIO55oK1NLI6
 JwjLsEtjc4Yh/3sz2aS7UeE8Z9fTxH4COYkwkyHfGXTBsb7X7XlCMQpLYInVWKGc7191
 FHyw==
X-Gm-Message-State: AOAM530L+N4spia59DStU2bHc6U4RWxbQTYNcSYsaCyXn2ppB+3peK+E
 UcMR/DOAuvsrXmsH3P+t8SST13NSyJ0=
X-Google-Smtp-Source: ABdhPJyBWuRuoeY2+XSuiE0a82uUHaNhSTrDPFN8pluaxjnX/jArvnLv/xn2K8H7N7UjzM8q8diJ2g==
X-Received: by 2002:a63:c58:: with SMTP id 24mr22634213pgm.246.1591070288587; 
 Mon, 01 Jun 2020 20:58:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 r3sm925826pjb.20.2020.06.01.20.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 20:58:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/msm/dpu: add support for clk and bw scaling for
 display"
Date: Mon,  1 Jun 2020 20:58:32 -0700
Message-Id: <20200602035842.199711-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Clark <robdclark@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Jayant Shekhar <jshekhar@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Krishna Manikandan <mkrishn@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, zhengbin <zhengbin13@huawei.com>,
 tongtiangen <tongtiangen@huawei.com>, Drew Davenport <ddavenport@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This is causing multiple armv7 missing do_div() errors, so lets drop it
for now.

This reverts commit 04d9044f6c577948609c03b4e33b8fbc8b87c4b1.

Cc: Kalyan Thota <kalyan_t@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 106 +++---------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  37 +-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  82 --------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |   4 -
 8 files changed, 23 insertions(+), 228 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 9697abcbec3f..7c230f719ad3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -29,73 +29,6 @@ enum dpu_perf_mode {
 	DPU_PERF_MODE_MAX
 };
 
-/**
- * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
- * @kms -  pointer to the dpu_kms
- * @crtc - pointer to a crtc
- * Return: returns aggregated BW for all planes in crtc.
- */
-static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
-		struct drm_crtc *crtc)
-{
-	struct drm_plane *plane;
-	struct dpu_plane_state *pstate;
-	u64 crtc_plane_bw = 0;
-	u32 bw_factor;
-
-	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		pstate = to_dpu_plane_state(plane->state);
-
-		if (!pstate)
-			continue;
-
-		crtc_plane_bw += pstate->plane_fetch_bw;
-	}
-
-	bw_factor = kms->catalog->perf.bw_inefficiency_factor;
-	if (bw_factor)
-		crtc_plane_bw = mult_frac(crtc_plane_bw, bw_factor, 100);
-
-	return crtc_plane_bw;
-}
-
-/**
- * _dpu_core_perf_calc_clk() - to calculate clock per crtc
- * @kms -  pointer to the dpu_kms
- * @crtc - pointer to a crtc
- * @state - pointer to a crtc state
- * Return: returns max clk for all planes in crtc.
- */
-static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
-		struct drm_crtc *crtc, struct drm_crtc_state *state)
-{
-	struct drm_plane *plane;
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
-	u64 crtc_clk;
-	u32 clk_factor;
-
-	mode = &state->adjusted_mode;
-
-	crtc_clk = mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
-
-	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		pstate = to_dpu_plane_state(plane->state);
-
-		if (!pstate)
-			continue;
-
-		crtc_clk = max(pstate->plane_clk, crtc_clk);
-	}
-
-	clk_factor = kms->catalog->perf.clk_inefficiency_factor;
-	if (clk_factor)
-		crtc_clk = mult_frac(crtc_clk, clk_factor, 100);
-
-	return crtc_clk;
-}
-
-
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
 	struct msm_drm_private *priv;
@@ -118,7 +51,12 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 	dpu_cstate = to_dpu_crtc_state(state);
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+	if (!dpu_cstate->bw_control) {
+		perf->bw_ctl = kms->catalog->perf.max_bw_high *
+					1000ULL;
+		perf->max_per_pipe_ib = perf->bw_ctl;
+		perf->core_clk_rate = kms->perf.max_core_clk_rate;
+	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
 		perf->bw_ctl = 0;
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
@@ -126,10 +64,6 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		perf->bw_ctl = kms->perf.fix_core_ab_vote;
 		perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
 		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-		perf->max_per_pipe_ib = kms->catalog->perf.min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 	}
 
 	DPU_DEBUG(
@@ -181,7 +115,11 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 			DPU_DEBUG("crtc:%d bw:%llu ctrl:%d\n",
 				tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
 				tmp_cstate->bw_control);
-
+			/*
+			 * For bw check only use the bw if the
+			 * atomic property has been already set
+			 */
+			if (tmp_cstate->bw_control)
 				bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
 		}
 
@@ -193,7 +131,9 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 		DPU_DEBUG("final threshold bw limit = %d\n", threshold);
 
-		if (!threshold) {
+		if (!dpu_cstate->bw_control) {
+			DPU_DEBUG("bypass bandwidth check\n");
+		} else if (!threshold) {
 			DPU_ERROR("no bandwidth limits specified\n");
 			return -E2BIG;
 		} else if (bw > threshold) {
@@ -214,8 +154,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 					= dpu_crtc_get_client_type(crtc);
 	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int i, ret = 0;
-	u64 avg_bw;
+	int ret = 0;
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
@@ -226,21 +165,10 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
 					dpu_cstate->new_perf.max_per_pipe_ib);
 
-			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
-
-			DPU_DEBUG("crtc=%d bw=%llu paths:%d\n",
-				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+			DPU_DEBUG("crtc=%d bw=%llu\n", tmp_crtc->base.id,
+					dpu_cstate->new_perf.bw_ctl);
 		}
 	}
-
-	avg_bw = kms->num_paths ?
-			perf.bw_ctl / kms->num_paths : 0;
-
-	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i],
-			Bps_to_icc(avg_bw), (perf.max_per_pipe_ib));
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8f2357d9960a..29d4fde3172b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -541,8 +541,7 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 	.max_bw_high = 6800000,
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
-	.min_dram_ib = 1600000,
-	.min_prefill_lines = 24,
+	.min_dram_ib = 800000,
 	.danger_lut_tbl = {0xff, 0xffff, 0x0},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
@@ -559,8 +558,6 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
-	.clk_inefficiency_factor = 105,
-	.bw_inefficiency_factor = 120,
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f2a5fe2d9d62..f7de43838c69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -651,8 +651,6 @@ struct dpu_perf_cdp_cfg {
  * @downscaling_prefill_lines  downscaling latency in lines
  * @amortizable_theshold minimum y position for traffic shaping prefill
  * @min_prefill_lines  minimum pipeline latency in lines
- * @clk_inefficiency_factor DPU src clock inefficiency factor
- * @bw_inefficiency_factor DPU axi bus bw inefficiency factor
  * @safe_lut_tbl: LUT tables for safe signals
  * @danger_lut_tbl: LUT tables for danger signals
  * @qos_lut_tbl: LUT tables for QoS signals
@@ -677,8 +675,6 @@ struct dpu_perf_cfg {
 	u32 downscaling_prefill_lines;
 	u32 amortizable_threshold;
 	u32 min_prefill_lines;
-	u32 clk_inefficiency_factor;
-	u32 bw_inefficiency_factor;
 	u32 safe_lut_tbl[DPU_QOS_LUT_USAGE_MAX];
 	u32 danger_lut_tbl[DPU_QOS_LUT_USAGE_MAX];
 	struct dpu_qos_lut_tbl qos_lut_tbl[DPU_QOS_LUT_USAGE_MAX];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a5da7aacddba..b8615d4fe8a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -303,28 +303,6 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
-static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
-{
-	struct icc_path *path0;
-	struct icc_path *path1;
-	struct drm_device *dev = dpu_kms->dev;
-
-	path0 = of_icc_get(dev->dev, "mdp0-mem");
-	path1 = of_icc_get(dev->dev, "mdp1-mem");
-
-	if (IS_ERR_OR_NULL(path0))
-		return PTR_ERR_OR_ZERO(path0);
-
-	dpu_kms->path[0] = path0;
-	dpu_kms->num_paths = 1;
-
-	if (!IS_ERR_OR_NULL(path1)) {
-		dpu_kms->path[1] = path1;
-		dpu_kms->num_paths++;
-	}
-	return 0;
-}
-
 static int dpu_kms_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc)
 {
 	return dpu_crtc_vblank(crtc, true);
@@ -994,9 +972,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_vbif_init_memtypes(dpu_kms);
 
-	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
-		dpu_kms_parse_data_bus_icc_path(dpu_kms);
-
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
 	return 0;
@@ -1102,7 +1077,7 @@ static int dpu_dev_remove(struct platform_device *pdev)
 
 static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 {
-	int i, rc = -1;
+	int rc = -1;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
 	struct dss_module_power *mp = &dpu_kms->mp;
@@ -1111,9 +1086,6 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	if (rc)
 		DPU_ERROR("clock disable failed rc:%d\n", rc);
 
-	for (i = 0; i < dpu_kms->num_paths; i++)
-		icc_set_bw(dpu_kms->path[i], 0, 0);
-
 	return rc;
 }
 
@@ -1125,15 +1097,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 	struct drm_encoder *encoder;
 	struct drm_device *ddev;
 	struct dss_module_power *mp = &dpu_kms->mp;
-	int i;
 
 	ddev = dpu_kms->dev;
-
-	/* Min vote of BW is required before turning on AXI clk */
-	for (i = 0; i < dpu_kms->num_paths; i++)
-		icc_set_bw(dpu_kms->path[i], 0,
-			dpu_kms->catalog->perf.min_dram_ib);
-
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
 	if (rc) {
 		DPU_ERROR("clock enable failed rc:%d\n", rc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 94410ca9bd70..4e32d040f1e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -8,8 +8,6 @@
 #ifndef __DPU_KMS_H__
 #define __DPU_KMS_H__
 
-#include <linux/interconnect.h>
-
 #include <drm/drm_drv.h>
 
 #include "msm_drv.h"
@@ -139,8 +137,6 @@ struct dpu_kms {
 	 * when disabled.
 	 */
 	atomic_t bandwidth_ref;
-	struct icc_path *path[2];
-	u32 num_paths;
 };
 
 struct vsync_info {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index df0a9835bfb1..80d3cfc14007 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -8,6 +8,7 @@
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
 #include "dpu_kms.h"
+#include <linux/interconnect.h>
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
 
@@ -314,11 +315,9 @@ int dpu_mdss_init(struct drm_device *dev)
 	}
 	dpu_mdss->mmio_len = resource_size(res);
 
-	if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
-		ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
-		if (ret)
-			return ret;
-	}
+	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
+	if (ret)
+		return ret;
 
 	mp = &dpu_mdss->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2a6e3dacd68..3b9c33e694bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -131,84 +131,6 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
 	return to_dpu_kms(priv->kms);
 }
 
-/**
- * _dpu_plane_calc_bw - calculate bandwidth required for a plane
- * @Plane: Pointer to drm plane.
- * Result: Updates calculated bandwidth in the plane state.
- * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
- * Prefill BW Equation: line src bytes * line_time
- */
-static void _dpu_plane_calc_bw(struct drm_plane *plane,
-	struct drm_framebuffer *fb)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
-	const struct dpu_format *fmt = NULL;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	int src_width, src_height, dst_height, fps;
-	u64 plane_prefill_bw;
-	u64 plane_bw;
-	u32 hw_latency_lines;
-	u32 scale_factor;
-	int vbp, vpw;
-
-	pstate = to_dpu_plane_state(plane->state);
-	mode = &plane->state->crtc->mode;
-
-	fmt = dpu_get_dpu_format_ext(fb->format->format, fb->modifier);
-
-	src_width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
-	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
-	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
-	fps = drm_mode_vrefresh(mode);
-	vbp = mode->vtotal - mode->vsync_end;
-	vpw = mode->vsync_end - mode->vsync_start;
-	hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
-	scale_factor = src_height > dst_height ?
-		mult_frac(src_height, 1, dst_height) : 1;
-
-	plane_bw =
-		src_width * mode->vtotal * fps * fmt->bpp * scale_factor;
-
-	plane_prefill_bw =
-		src_width * hw_latency_lines * fps * fmt->bpp * scale_factor;
-
-	plane_prefill_bw = mult_frac(plane_prefill_bw, mode->vtotal, (vbp+vpw));
-
-	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
-}
-
-
-/**
- * _dpu_plane_calc_clk - calculate clock required for a plane
- * @Plane: Pointer to drm plane.
- * Result: Updates calculated clock in the plane state.
- * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
- */
-static void _dpu_plane_calc_clk(struct drm_plane *plane)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
-	int dst_width, src_height, dst_height, fps;
-
-	pstate = to_dpu_plane_state(plane->state);
-	mode = &plane->state->crtc->mode;
-
-	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
-	dst_width = drm_rect_width(&pdpu->pipe_cfg.dst_rect);
-	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
-	fps = drm_mode_vrefresh(mode);
-
-	pstate->plane_clk =
-		dst_width * mode->vtotal * fps;
-
-	if (src_height > dst_height)
-		pstate->plane_clk = mult_frac(pstate->plane_clk,
-					src_height, dst_height);
-}
-
 /**
  * _dpu_plane_calc_fill_level - calculate fill level of the given source format
  * @plane:		Pointer to drm plane
@@ -1180,10 +1102,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	}
 
 	_dpu_plane_set_qos_remap(plane);
-
-	_dpu_plane_calc_bw(plane, fb);
-
-	_dpu_plane_calc_clk(plane);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index ca83b8753d59..456949713e90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -25,8 +25,6 @@
  * @scaler3_cfg: configuration data for scaler3
  * @pixel_ext: configuration data for pixel extensions
  * @cdp_cfg:	CDP configuration
- * @plane_fetch_bw: calculated BW per plane
- * @plane_clk: calculated clk per plane
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -41,8 +39,6 @@ struct dpu_plane_state {
 	struct dpu_hw_pixel_ext pixel_ext;
 
 	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
-	u64 plane_fetch_bw;
-	u64 plane_clk;
 };
 
 /**
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
