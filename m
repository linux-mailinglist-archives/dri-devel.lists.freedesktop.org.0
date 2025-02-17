Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A0AA389AC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027A210E547;
	Mon, 17 Feb 2025 16:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="En58HORx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF7E10E568
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:42:08 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ab7098af6fdso64046266b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810527; x=1740415327; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qq9jDOhpy0aHY5CpHEf81pq1NORQVrGmfKnjY03h5OA=;
 b=En58HORxU37R8Gy/nG/CP6AniU7bfviltb9clBJuV3Ab92LCYY9sayxNSoe2JRCHQE
 a8QJMwWh4xcHMH+8UCgJtBLPdHrekMYu1A9h8XDxw5KeT9nX7tuD55wRaGDFQIaOXx57
 rmuVmP2PP2Q3AONcbipGHK+OwGvxVONlXf3gSratocW03kppf635qy5L3t1ZgrPvSqpT
 wysRkwaH73Sz5k8W5U2rchUjapkAeTsFKhreWh1pZzPKN6KMRMIR/iqAMth01I/4WE1I
 WOnMqcjuRITNZf2MT8LQO6i2NmXZqjSiWrs6ERnCEXGTc7eCzKRkVwM3/MwEfAlTfFuq
 uXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810527; x=1740415327;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qq9jDOhpy0aHY5CpHEf81pq1NORQVrGmfKnjY03h5OA=;
 b=n4kycWsYhABL7e2OJBcxu63ji3H+khBNXsORSjSQ2pVLhwxFKeF+Fx3YU1JmNnG5jm
 Rt0CKTGHr30MVxc7Z9XByI8YqsfyaXUhswTtZwiRrryK0oPWfsNeVE9wZXj1QoexPo7+
 Tr+un04O5sRsZVnkCEnlkgV+GUUmnnYWpNgyKMP6fzwEaNdhKUUiRdghO5QAfz1+ss3s
 Y61aYtWGF5budWatjq0MkJfOZupeb6nr6ZO9Sd1hZ0S4RG6LJb4uwpYLBehvtv/mdPhm
 2P2q5uZej2z7ZpbtVSceNp34EXXJas4Syw8KSBzUquq6z9B48y+Yp65xmRptF1NS4wk8
 MMQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8TYdzIFparEWeJiA2XI7E+mX88jrOqTjlpZDkwNDDQHCfu8s99V3KlCFuVaLU9z/utU1wzpuCP6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZaDkW+6A2V4+kyLlYGZDCYI3Rpqs+yMOUq9FMkBpVCBlpB0hE
 pP7XNbs0fB05RTr9aSf1cpMG+iHv+Y0HLNsQPS3cNIq6nye3ycDe8g6zxzhbLkk=
X-Gm-Gg: ASbGncvji2udXSaZgUDORiLdFCDiIwHIxyVJlIXIOvXXsnKch8WlQm1OrZ6io5lkeWZ
 UKTXcd1XCUrcU18dG2XEuveHwHBFba9KYcDmYlFe/9ddSZ04GMCN35xOwkzIeStYAMR3s67sVF5
 Aa3Pf7jk0AxH6c3SltGzCPkHC9swOChEq7PJmGvcvch/WNzCKz+aaUFhdrmP2LaMyW2qG5JcvZu
 nRSPAXcBWey55Hp/wkEoKisDHR+D/U/ctmIaRlIVu9Lp/3XzyiuuWWaZx3AkHo/VCGBZ8G8PIOP
 BVwgx3UMwO99cw74FWWjC16WYs/9v44=
X-Google-Smtp-Source: AGHT+IHUbKvk34LNIqLlw3qVx9Dr2B+JaIdhDNM3wwCYi7YmKK/mUCo5o4s4nbHcy8FqMo7cFYRmGw==
X-Received: by 2002:a17:907:6ea2:b0:ab7:63fa:e35a with SMTP id
 a640c23a62f3a-abb70934426mr408925566b.2.1739810527229; 
 Mon, 17 Feb 2025 08:42:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:42:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:33 +0100
Subject: [PATCH v2 12/16] drm/msm/dsi: Add support for SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-12-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8333;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DkJ2BVBvEeNNA0cxtQOdcJsL6j5MFl87qRB2heFwXH4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2bBB/3ewDrbJ12hx5zM0rdjjEqOr8S6kyglz
 asQB5qDrbeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmwQAKCRDBN2bmhouD
 17dvD/93hWvDAJt5m4WLO5T+2/5m9tOBDOCgQ5KoBtqgWmlVsY7Iy6b9qxTOW4t7+sItHF7NcM6
 4ucYCkQWfP3ArTa0T06DV6p7mOZ+Tuv78/y+CrsoJ31BrT818Ti5QObdk6w/AyKsbzMq6V+2lnY
 ZdkHG4pR5fCWeNEu2Wg3vMY5bqf+xAYtmfhRZpnE+jYQCeHS/RhNU8ElP6ouDUWfCQTQkDqPEJp
 umfVFWZNK1nK/Splxu8Km8Mw6PDNNlHn9ECqu6qvKgPJ3b+IU5renC2yis9J5VIwG3O4O4lzm/m
 VSDDyFnZc5+1CkYcaeLHowB3uFktwAcnnptiNhP5kxFoATdF/eppemOyxttnwIiSUOjLfssFwSl
 OjhWOrBvUtABBJ5/Qc3wjJnhUEeDLCo06g6KIqbpxD5vf09pCtYvWQgfddT3kQ62jf4Qf9NV3+u
 3yVJx6hKUtVDt3kuE6ikCHn8Cw18Qpvy1dfvgFEUgR2SAiZR/nzU+1wA2Ku+4D3qGstlLneiOxp
 k7hvlSz9BL+h/FIrqoaMp5Jciy1nmLMPronJTBHtRBMM5qRdBffoy1HYXCiHGdY+OC3NSJpoyDI
 dNr616VSVFJyJyC66lXUbQQ43+W+sW4ZP9FCou+H9ol2ruGS5PDaMgTctRAtQCkQaVx9DoWtESD
 d3JW7NMk5KIQQHQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for DSI on Qualcomm SM8750 SoC with notable difference:

DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
parents before DSI PHY is configured and the PLLs are prepared with
initial rate is set.  Therefore assigned-clock-parents are not working
here and driver is responsible for reparenting clocks with proper
procedure: see dsi_clk_init_6g_v2_9().

Part of the change is exactly the same as CLK_OPS_PARENT_ENABLE, however
CLK_OPS_PARENT_ENABLE won't work here because assigned-clock-parents are
executed way too early - before DSI PHY is configured.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

SM8750 DSI PHY also needs Dmitry's patch:
https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
(or some other way of correct early setting of the DSI PHY PLL rate)
---
 drivers/gpu/drm/msm/dsi/dsi.h      |  2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 25 ++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 80 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 87496db203d6c7582eadcb74e94eb56a219df292..93c028a122f3a59b1632da76472e0a3e781c6ae8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -98,6 +98,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi);
 int msm_dsi_runtime_suspend(struct device *dev);
 int msm_dsi_runtime_resume(struct device *dev);
 int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
+int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host);
 int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
@@ -115,6 +116,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
+int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..e2a8d6fcc45b6c207a3018ea7c8744fcf34dabd2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
 	},
 };
 
+static const struct msm_dsi_config sm8750_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -257,6 +268,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
 	.calc_clk_rate = dsi_calc_clk_rate_6g,
 };
 
+static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
+	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
+	.link_clk_enable = dsi_link_clk_enable_6g,
+	.link_clk_disable = dsi_link_clk_disable_6g,
+	.clk_init_ver = dsi_clk_init_6g_v2_9,
+	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
+	.tx_buf_get = dsi_tx_buf_get_6g,
+	.tx_buf_put = dsi_tx_buf_put_6g,
+	.dma_base_get = dsi_dma_base_get_6g,
+	.calc_clk_rate = dsi_calc_clk_rate_6g,
+};
+
 static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
 		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
@@ -300,6 +323,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
+		&sm8750_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -30,6 +30,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
+#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 2218d4f0c5130a0b13f428e89aa30ba2921da572..ced28ee61eedc0a82da9f1d0792f17ee2a5538c4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -119,6 +119,15 @@ struct msm_dsi_host {
 	struct clk *pixel_clk;
 	struct clk *byte_intf_clk;
 
+	/*
+	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
+	 * PLL:
+	 */
+	struct clk *byte_src_clk;
+	struct clk *pixel_src_clk;
+	struct clk *dsi_pll_byte_clk;
+	struct clk *dsi_pll_pixel_clk;
+
 	unsigned long byte_clk_rate;
 	unsigned long byte_intf_clk_rate;
 	unsigned long pixel_clk_rate;
@@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
 	return ret;
 }
 
+int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	int ret;
+
+	ret = dsi_clk_init_6g_v2(msm_host);
+	if (ret)
+		return ret;
+
+	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
+	if (IS_ERR(msm_host->byte_src_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
+				     "can't get byte_src clock\n");
+
+	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
+	if (IS_ERR(msm_host->dsi_pll_byte_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
+				     "can't get dsi_pll_byte clock\n");
+
+	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
+	if (IS_ERR(msm_host->pixel_src_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
+				     "can't get pixel_src clock\n");
+
+	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
+	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
+				     "can't get dsi_pll_pixel clock\n");
+
+	return 0;
+}
+
 static int dsi_clk_init(struct msm_dsi_host *msm_host)
 {
 	struct platform_device *pdev = msm_host->pdev;
@@ -370,6 +411,45 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	return 0;
 }
 
+int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	int ret;
+
+	/*
+	 * DSI PHY PLLs have to be enabled to allow reparenting to them and
+	 * setting the rates of pixel/byte clocks.
+	 */
+	ret = clk_prepare_enable(msm_host->dsi_pll_byte_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(msm_host->dsi_pll_pixel_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
+		goto out_disable_byte_clk;
+	}
+
+	ret = clk_set_parent(msm_host->byte_src_clk, msm_host->dsi_pll_byte_clk);
+	if (ret)
+		dev_err(dev, "Failed to parent byte_src -> dsi_pll_byte: %d\n", ret);
+
+	ret = clk_set_parent(msm_host->pixel_src_clk, msm_host->dsi_pll_pixel_clk);
+	if (ret)
+		dev_err(dev, "Failed to parent pixel_src -> dsi_pll_pixel: %d\n", ret);
+
+	ret = dsi_link_clk_set_rate_6g(msm_host);
+
+	clk_disable_unprepare(msm_host->dsi_pll_pixel_clk);
+
+out_disable_byte_clk:
+	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
+
+	return ret;
+}
+
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 {
 	int ret;

-- 
2.43.0

