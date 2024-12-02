Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D832E9DFE2A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C0810E69F;
	Mon,  2 Dec 2024 10:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rUEE15MT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3706A10E6B7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:06:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53de79c2be4so4601816e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134015; x=1733738815; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tIQfK40u5MKtv4iyJrin0zFaEOq8UAAlTtQOuxea7wk=;
 b=rUEE15MTUKVdChsjT1HJVy9ClntOQVcfeUs8RrwL/xgkXXbfhF0yJsaiMVIitdrp53
 EuLJ2MjXn7gWUCoG4+zHryXivz7h2uCOjRQLC8gWWdx0cI2U52zX9RWFm5Wgy/lExoF4
 35K0LHyz8JWm8OhS3p6SY5HNAnkmofwn+1PHkT6UaxmRWEnKiD3ym2SuGInNBpK31ebR
 NkgIjUI3tVXXiyyNqodpWx2dvwiO1H6to+op25cHzjbs6AgRaKxNp2STMuNPG7GWeiSJ
 4hIGvggzG1sFaTx7poXbHyN5GpsUjnEnGOBtBSSxQw7vmv3Ohx4c+fteuuCelAWkfwuN
 Z5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134015; x=1733738815;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tIQfK40u5MKtv4iyJrin0zFaEOq8UAAlTtQOuxea7wk=;
 b=xNWuLjXPsaEdqP6FQzYxeSJufL/+b8Qq3uDLoNLkb+8etBfFBJdn+9p2kOPEwN41fJ
 aubsfFt7LI99DmvWFYcGQ/CsHPVYbujS6Rr0/i3oblBhvLWZX/raFeWpFzjuXbMvoocy
 2FpBxgQvcL2WXTBSgYyYGu2xXkbRPA7Y7ZGzxPXPn5ebNiemYptviDAKmF1ZGAqUDVuQ
 QJWaLxks39Mn3AN+uoCDgvjjWGBNAcvYaCVd0XGyfD+7M1bz0Nr7kjSfO/ciJU76Dvxg
 PuGla32yRyQGbzhkVIY843kFiZunJb5XqP08oEQGrdLOXRCCUB3dsFYeMZs5BHVRCJke
 QkAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqc5UndX0nLcQRlUC3CUwMc2lhHjpq2mHASSBmmFfXoIss3lmMTAIA+EgFq5ISQYlHvWtrF49SYvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFy/z9gQ2JexX2mhIaDy/neJn8GRiHnz+lmP2MR7xeifs/9UmR
 uYe0lI5NbyrQlo/IKVB4wHNG2x9TpexhgERWmv/oPGh1WP9XpHkbms4y31iBApI=
X-Gm-Gg: ASbGncvrqmCsxmLCJF89TfpR576NwOgv66HKWRS8hv/4mCsIqQqoklWAFT9HV8colc7
 wH2gKDALxkpA1yIukNeG/jsye8Qw/ydWrZDUXlh6QE4JJOZaMX48R/e+zcoSSQGP1IcUxPdnjLF
 w1dggV1wsSPaXwgEDtRBSnBJkPWgOCsTGSNHaTAmBuf13177M0v1svDFDee2lk8iXOHwevHI2nY
 HIDkU4aJRNlEULAmpzKYNwHni5qNpy8LnnFQ3pVuhCDLLM9HvbeHSLQ5w==
X-Google-Smtp-Source: AGHT+IH9azoN7zaETDhGQiX9yc9lN0axqzz846P/VvtnLclhWRmp/vrtk4c3xeJpv/742FMLoljYzw==
X-Received: by 2002:a05:6512:3e2a:b0:53d:d17f:9c82 with SMTP id
 2adb3069b0e04-53df0106c64mr11168526e87.41.1733134015176; 
 Mon, 02 Dec 2024 02:06:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:06:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:37 +0200
Subject: [PATCH v2 07/14] drm/msm/dp: move/inline ctrl register functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-7-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=42508;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=orWBEYQ7OrTBOiqPKAzaFHPuA+4dzm5FmuJ8rmmKwcQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYatR27dllEESj5USdZnkdSSi7ncmHNR4B8/v
 G5gaKvvgdiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrQAKCRCLPIo+Aiko
 1Q3AB/4zNJltfSfRtKD9zG7ErnkR5fa4NLCUokzilFn+XVPFAalRlm8M91QrlPDCQE32DpaI+Va
 bF0SREOsaPk+N0XU++lgAeN35hrBjAnPbPkVtPp4+46Xd/Roehy1PGUZfPqIhPtvqcKS/CPBK9M
 S7LzMnH7qnWGz9iusUdZnSOhfoUUGpAypOunc+xZJRStNzN1y8HigZfrNrcS+Y+kv11z1fw7tOi
 SlA7A0xUoLSg5I7o9Lnwj+051l1nGf+sb+2gY+2s6JMYico3ptZiDYxsOLuxCImY0YboLcxGgyy
 q16AikuXKCDbGqgBiKHMNeptKFJ/TZ5SJcv75ViqRPP6yjr0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Move CTRL-related functions to dp_ctrl.c, inlining one line wrappers
during this process. The enable/disable functions have been split to the
enable/disable or enter/exit pairs. The IRQ and HPD related functions
are left in dp_catalog.c, pending later cleanup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 389 +------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  22 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 447 ++++++++++++++++++++++++++++++++----
 3 files changed, 409 insertions(+), 449 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5804231ac3ffcd13907fe6b09ee309150ef7b028..71a195a28e7bd5dcaac38adc93dda2d3189690c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -18,8 +18,6 @@
 #define POLLING_SLEEP_US			1000
 #define POLLING_TIMEOUT_US			10000
 
-#define SCRAMBLER_RESET_COUNT_VALUE		0xFC
-
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
@@ -93,217 +91,6 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 
 }
 
-/* controller related catalog functions */
-void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
-				u32 msm_dp_tu, u32 valid_boundary,
-				u32 valid_boundary2)
-{
-	msm_dp_write_link(msm_dp_catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_TU, msm_dp_tu);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
-}
-
-void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state)
-{
-	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, state);
-}
-
-void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 cfg)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	drm_dbg_dp(catalog->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", cfg);
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_CONFIGURATION_CTRL, cfg);
-}
-
-void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
-	u32 ln_mapping;
-
-	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
-	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
-	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
-	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
-			ln_mapping);
-}
-
-void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog,
-						bool enable)
-{
-	u32 val;
-
-	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-
-	if (enable)
-		val |= DP_MAINLINK_CTRL_ENABLE;
-	else
-		val &= ~DP_MAINLINK_CTRL_ENABLE;
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
-}
-
-void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
-						bool enable)
-{
-	u32 mainlink_ctrl;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	drm_dbg_dp(catalog->drm_dev, "enable=%d\n", enable);
-	if (enable) {
-		/*
-		 * To make sure link reg writes happens before other operation,
-		 * msm_dp_write_link() function uses writel()
-		 */
-		mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-
-		mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
-						DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-
-		mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-
-		mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-
-		mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
-					DP_MAINLINK_FB_BOUNDARY_SEL);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-	} else {
-		mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-		mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-	}
-}
-
-void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
-					u32 colorimetry_cfg,
-					u32 test_bits_depth)
-{
-	u32 misc_val;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	misc_val = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
-
-	/* clear bpp bits */
-	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
-	misc_val |= colorimetry_cfg << DP_MISC0_COLORIMETRY_CFG_SHIFT;
-	misc_val |= test_bits_depth << DP_MISC0_TEST_BITS_DEPTH_SHIFT;
-	/* Configure clock to synchronous mode */
-	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
-
-	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc_val);
-}
-
-void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 mainlink_ctrl, hw_revision;
-
-	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision >= DP_HW_VERSION_1_2)
-		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
-	else
-		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-}
-
-void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
-					u32 rate, u32 stream_rate_khz,
-					bool is_ycbcr_420)
-{
-	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
-	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
-	u32 const link_rate_hbr2 = 540000;
-	u32 const link_rate_hbr3 = 810000;
-	unsigned long den, num;
-
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	if (rate == link_rate_hbr3)
-		pixel_div = 6;
-	else if (rate == 162000 || rate == 270000)
-		pixel_div = 2;
-	else if (rate == link_rate_hbr2)
-		pixel_div = 4;
-	else
-		DRM_ERROR("Invalid pixel mux divider\n");
-
-	dispcc_input_rate = (rate * 10) / pixel_div;
-
-	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
-			(unsigned long)(1 << 16) - 1,
-			(unsigned long)(1 << 16) - 1, &den, &num);
-
-	den = ~(den - num);
-	den = den & 0xFFFF;
-	pixel_m = num;
-	pixel_n = den;
-
-	mvid = (pixel_m & 0xFFFF) * 5;
-	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
-
-	if (nvid < nvid_fixed) {
-		u32 temp;
-
-		temp = (nvid_fixed / nvid) * nvid;
-		mvid = (nvid_fixed / nvid) * mvid;
-		nvid = temp;
-	}
-
-	if (is_ycbcr_420)
-		mvid /= 2;
-
-	if (link_rate_hbr2 == rate)
-		nvid *= 2;
-
-	if (link_rate_hbr3 == rate)
-		nvid *= 3;
-
-	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_SOFTWARE_NVID, nvid);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_DSC_DTO, 0x0);
-}
-
-int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
-					u32 state_bit)
-{
-	int bit, ret;
-	u32 data;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	bit = BIT(state_bit - 1);
-	drm_dbg_dp(catalog->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
-	msm_dp_catalog_ctrl_state_ctrl(msm_dp_catalog, bit);
-
-	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
-
-	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, msm_dp_catalog->link_base +
-					REG_DP_MAINLINK_READY,
-					data, data & bit,
-					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
-	if (ret < 0) {
-		DRM_ERROR("set state_bit for link_train=%d failed\n", state_bit);
-		return ret;
-	}
-	return 0;
-}
-
 /**
  * msm_dp_catalog_hw_revision() - retrieve DP hw revision
  *
@@ -317,50 +104,6 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
 	return msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
 }
 
-/**
- * msm_dp_catalog_ctrl_reset() - reset DP controller
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * return: void
- *
- * This function reset the DP controller
- *
- * NOTE: reset DP controller will also clear any pending HPD related interrupts
- * 
- */
-void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 sw_reset;
-
-	sw_reset = msm_dp_read_ahb(msm_dp_catalog, REG_DP_SW_RESET);
-
-	sw_reset |= DP_SW_RESET;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
-	usleep_range(1000, 1100); /* h/w recommended delay */
-
-	sw_reset &= ~DP_SW_RESET;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
-}
-
-bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 data;
-	int ret;
-
-	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(msm_dp_catalog->link_base +
-				REG_DP_MAINLINK_READY,
-				data, data & DP_MAINLINK_READY_FOR_VIDEO,
-				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
-	if (ret < 0) {
-		DRM_ERROR("mainlink not ready\n");
-		return false;
-	}
-
-	return true;
-}
-
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
@@ -413,43 +156,6 @@ void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
 }
 
-static void msm_dp_catalog_enable_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	/* trigger sdp */
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x0);
-}
-
-void msm_dp_catalog_ctrl_config_psr(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 config;
-
-	/* enable PSR1 function */
-	config = msm_dp_read_link(msm_dp_catalog, REG_PSR_CONFIG);
-	config |= PSR1_SUPPORTED;
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, config);
-
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
-	msm_dp_catalog_enable_sdp(msm_dp_catalog);
-}
-
-void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool enter)
-{
-	u32 cmd;
-
-	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
-
-	cmd &= ~(PSR_ENTER | PSR_EXIT);
-
-	if (enter)
-		cmd |= PSR_ENTER;
-	else
-		cmd |= PSR_EXIT;
-
-	msm_dp_catalog_enable_sdp(msm_dp_catalog);
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
-}
-
 u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
@@ -495,6 +201,11 @@ u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_
 	return intr;
 }
 
+void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog)
+{
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+}
+
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 intr, intr_ack;
@@ -509,96 +220,6 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 	return intr;
 }
 
-void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_PHY_CTRL,
-			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
-	usleep_range(1000, 1100); /* h/w recommended delay */
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_PHY_CTRL, 0x0);
-}
-
-void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
-			u32 pattern)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-	u32 value = 0x0;
-
-	/* Make sure to clear the current pattern before starting a new one */
-	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, 0x0);
-
-	drm_dbg_dp(catalog->drm_dev, "pattern: %#x\n", pattern);
-	switch (pattern) {
-	case DP_PHY_TEST_PATTERN_D10_2:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-				DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
-		break;
-	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
-		value &= ~(1 << 16);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-					value);
-		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-					value);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
-					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		break;
-	case DP_PHY_TEST_PATTERN_PRBS7:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-				DP_STATE_CTRL_LINK_PRBS7);
-		break;
-	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
-		/* 00111110000011111000001111100000 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
-				0x3E0F83E0);
-		/* 00001111100000111110000011111000 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
-				0x0F83E0F8);
-		/* 1111100000111110 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
-				0x0000F83E);
-		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
-		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
-
-		value = DP_HBR2_ERM_PATTERN;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-				value);
-		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-					value);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
-					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-		value |= DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
-		break;
-	case DP_PHY_TEST_PATTERN_SEL_MASK:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL,
-				DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-				DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
-		break;
-	default:
-		drm_dbg_dp(catalog->drm_dev,
-				"No valid test pattern requested: %#x\n", pattern);
-		break;
-	}
-}
-
-u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog)
-{
-	return msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_READY);
-}
-
 /* panel related catalog functions */
 int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
 				u32 sync_start, u32 width_blanking, u32 msm_dp_active)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6dea28c5e97e8f939a71b008f95980ea55b13bff..a95ea7a8ca6a146dd46e637585a02738cf6d4997 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -136,37 +136,17 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */
-void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state);
-void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 config);
-void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32 cc, u32 tb);
-void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
-				u32 stream_rate_khz, bool is_ycbcr_420);
-int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
 u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
-bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
 void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
 			u32 intr_mask, bool en);
 void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_psr(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool enter);
 u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog);
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
-				u32 msm_dp_tu, u32 valid_boundary,
-				u32 valid_boundary2);
-void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
-				u32 pattern);
-u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Panel APIs */
 int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index bc2ca8133b790fc049e18ab3b37a629558664dd4..6ca2e055717b55c9eb064887948cf095fbfc1c40 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -8,9 +8,11 @@
 #include <linux/types.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/pm_opp.h>
+#include <linux/rational.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_fixed.h>
@@ -20,6 +22,9 @@
 #include "dp_ctrl.h"
 #include "dp_link.h"
 
+#define POLLING_SLEEP_US			1000
+#define POLLING_TIMEOUT_US			10000
+
 #define DP_KHZ_TO_HZ 1000
 #define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES	(30 * HZ / 1000) /* 30 ms */
 #define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ / 1000) /* 300 ms */
@@ -118,6 +123,114 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return 0;
 }
 
+/*
+ * NOTE: resetting DP controller will also clear any pending HPD related interrupts
+ */
+static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 sw_reset;
+
+	sw_reset = msm_dp_read_ahb(msm_dp_catalog, REG_DP_SW_RESET);
+
+	sw_reset |= DP_SW_RESET;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+
+	sw_reset &= ~DP_SW_RESET;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+}
+
+static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 val;
+
+	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	val |= DP_MAINLINK_CTRL_ENABLE;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
+}
+
+static void msm_dp_ctrl_psr_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 val;
+
+	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	val &= ~DP_MAINLINK_CTRL_ENABLE;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
+}
+
+static void msm_dp_ctrl_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 mainlink_ctrl;
+
+	drm_dbg_dp(ctrl->drm_dev, "enable\n");
+
+	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+
+	mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
+					DP_MAINLINK_CTRL_ENABLE);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+	mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+	mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+	mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
+				DP_MAINLINK_FB_BOUNDARY_SEL);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
+static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 mainlink_ctrl;
+
+	drm_dbg_dp(ctrl->drm_dev, "disable\n");
+
+	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
+static void msm_dp_setup_peripheral_flush(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 mainlink_ctrl, hw_revision;
+
+	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+
+	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
+	if (hw_revision >= DP_HW_VERSION_1_2)
+		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
+	else
+		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
+
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
+static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 data;
+	int ret;
+
+	/* Poll for mainlink ready status */
+	ret = readl_poll_timeout(msm_dp_catalog->link_base + REG_DP_MAINLINK_READY,
+				data, data & DP_MAINLINK_READY_FOR_VIDEO,
+				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
+	if (ret < 0) {
+		DRM_ERROR("mainlink not ready\n");
+		return false;
+	}
+
+	return true;
+}
+
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
@@ -125,7 +238,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	reinit_completion(&ctrl->idle_comp);
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_PUSH_IDLE);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
 
 	if (!wait_for_completion_timeout(&ctrl->idle_comp,
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
@@ -170,23 +283,51 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	if (ctrl->panel->psr_cap.version)
 		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
 
-	msm_dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
+	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+
+	msm_dp_write_link(ctrl->catalog, REG_DP_CONFIGURATION_CTRL, config);
+}
+
+static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
+	u32 ln_mapping;
+
+	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
+	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
+	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
+	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
+
+	msm_dp_write_link(msm_dp_catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
+			ln_mapping);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
-	u32 cc, tb;
+	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
-	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_ctrl_mainlink_enable(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
 
 	msm_dp_ctrl_config_ctrl(ctrl);
 
-	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
-		ctrl->panel->msm_dp_mode.bpp);
-	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
-	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
+	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
+	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
+
+	misc_val = msm_dp_read_link(ctrl->catalog, REG_DP_MISC1_MISC0);
+
+	/* clear bpp bits */
+	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
+	misc_val |= colorimetry_cfg << DP_MISC0_COLORIMETRY_CFG_SHIFT;
+	misc_val |= test_bits_depth << DP_MISC0_TEST_BITS_DEPTH_SHIFT;
+	/* Configure clock to synchronous mode */
+	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
+
+	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
+	msm_dp_write_link(ctrl->catalog, REG_DP_MISC1_MISC0, misc_val);
+
 	msm_dp_panel_timing_cfg(ctrl->panel);
 }
 
@@ -1003,8 +1144,9 @@ static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
 	pr_debug("dp_tu=0x%x, valid_boundary=0x%x, valid_boundary2=0x%x\n",
 			msm_dp_tu, valid_boundary, valid_boundary2);
 
-	msm_dp_catalog_ctrl_update_transfer_unit(ctrl->catalog,
-				msm_dp_tu, valid_boundary, valid_boundary2);
+	msm_dp_write_link(ctrl->catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
+	msm_dp_write_link(ctrl->catalog, REG_DP_TU, msm_dp_tu);
+	msm_dp_write_link(ctrl->catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
 }
 
 static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
@@ -1114,6 +1256,30 @@ static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
 	return ret;
 }
 
+static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
+					 u32 state_bit)
+{
+	int bit, ret;
+	u32 data;
+
+	bit = BIT(state_bit - 1);
+	drm_dbg_dp(ctrl->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, bit);
+
+	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
+
+	/* Poll for mainlink ready status */
+	ret = readx_poll_timeout(readl, ctrl->catalog->link_base + REG_DP_MAINLINK_READY,
+				 data, data & bit,
+				 POLLING_SLEEP_US, POLLING_TIMEOUT_US);
+	if (ret < 0) {
+		DRM_ERROR("set state_bit for link_train=%d failed\n", state_bit);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
@@ -1121,11 +1287,11 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int const maximum_retries = 4;
 
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_1;
 
-	ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, 1);
+	ret = msm_dp_ctrl_set_pattern_state_bit(ctrl, 1);
 	if (ret)
 		return ret;
 	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
@@ -1228,7 +1394,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	int const maximum_retries = 5;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_2;
 
@@ -1243,7 +1409,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 		state_ctrl_bit = 2;
 	}
 
-	ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
+	ret = msm_dp_ctrl_set_pattern_state_bit(ctrl, state_ctrl_bit);
 	if (ret)
 		return ret;
 
@@ -1321,7 +1487,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
 
 end:
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 
 	return ret;
 }
@@ -1331,7 +1497,7 @@ static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
 {
 	int ret = 0;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
+	msm_dp_ctrl_mainlink_enable(ctrl);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
 		return ret;
@@ -1470,7 +1636,7 @@ void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	msm_dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_ctrl_reset(ctrl);
 
 	/*
 	 * all dp controller programmable registers will not
@@ -1481,16 +1647,60 @@ void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable)
 	msm_dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
 }
 
+static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	/* trigger sdp */
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x0);
+}
+
+static void msm_dp_ctrl_psr_enter(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 cmd;
+
+	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
+
+	cmd &= ~(PSR_ENTER | PSR_EXIT);
+	cmd |= PSR_ENTER;
+
+	msm_dp_ctrl_enable_sdp(ctrl);
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
+}
+
+static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 cmd;
+
+	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
+
+	cmd &= ~(PSR_ENTER | PSR_EXIT);
+	cmd |= PSR_EXIT;
+
+	msm_dp_ctrl_enable_sdp(ctrl);
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
+}
+
 void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	u8 cfg;
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 cfg;
 
 	if (!ctrl->panel->psr_cap.version)
 		return;
 
-	msm_dp_catalog_ctrl_config_psr(ctrl->catalog);
+	/* enable PSR1 function */
+	cfg = msm_dp_read_link(msm_dp_catalog, REG_PSR_CONFIG);
+	cfg |= PSR1_SUPPORTED;
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, cfg);
+
+	msm_dp_catalog_ctrl_config_psr_interrupt(msm_dp_catalog);
+	msm_dp_ctrl_enable_sdp(ctrl);
 
 	cfg = DP_PSR_ENABLE;
 	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
@@ -1516,29 +1726,37 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
 	 */
 	if (enter) {
 		reinit_completion(&ctrl->psr_op_comp);
-		msm_dp_catalog_ctrl_set_psr(ctrl->catalog, true);
+		msm_dp_ctrl_psr_enter(ctrl);
 
 		if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
 			PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
 			DRM_ERROR("PSR_ENTRY timedout\n");
-			msm_dp_catalog_ctrl_set_psr(ctrl->catalog, false);
+			msm_dp_ctrl_psr_exit(ctrl);
 			return;
 		}
 
 		msm_dp_ctrl_push_idle(msm_dp_ctrl);
-		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 
-		msm_dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
+		msm_dp_ctrl_psr_mainlink_disable(ctrl);
 	} else {
-		msm_dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
+		msm_dp_ctrl_psr_mainlink_enable(ctrl);
 
-		msm_dp_catalog_ctrl_set_psr(ctrl->catalog, false);
-		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+		msm_dp_ctrl_psr_exit(ctrl);
+		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 		msm_dp_ctrl_wait4video_ready(ctrl);
-		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 	}
 }
 
+static void msm_dp_ctrl_phy_reset(struct msm_dp_ctrl_private *ctrl)
+{
+	msm_dp_write_ahb(ctrl->catalog, REG_DP_PHY_CTRL,
+			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+	msm_dp_write_ahb(ctrl->catalog, REG_DP_PHY_CTRL, 0x0);
+}
+
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
@@ -1547,7 +1765,7 @@ void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	msm_dp_ctrl_phy_reset(ctrl);
 	phy_init(phy);
 
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
@@ -1562,7 +1780,7 @@ void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	msm_dp_ctrl_phy_reset(ctrl);
 	phy_exit(phy);
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
@@ -1573,7 +1791,7 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	struct phy *phy = ctrl->phy;
 	int ret = 0;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
 	phy_configure(phy, &ctrl->phy_opts);
 	/*
@@ -1604,9 +1822,9 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	phy = ctrl->phy;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_ctrl_reset(ctrl);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -1638,13 +1856,97 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_clear_training_pattern(ctrl);
 
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
 	return ret;
 }
 
+#define SCRAMBLER_RESET_COUNT_VALUE		0xFC
+
+static void msm_dp_ctrl_send_phy_pattern(struct msm_dp_ctrl_private *ctrl,
+				     u32 pattern)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 value = 0x0;
+
+	/* Make sure to clear the current pattern before starting a new one */
+	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, 0x0);
+
+	drm_dbg_dp(ctrl->drm_dev, "pattern: %#x\n", pattern);
+	switch (pattern) {
+	case DP_PHY_TEST_PATTERN_D10_2:
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
+		break;
+
+	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
+		value &= ~(1 << 16);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+			      value);
+		value |= SCRAMBLER_RESET_COUNT_VALUE;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+			      value);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
+			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
+		break;
+
+	case DP_PHY_TEST_PATTERN_PRBS7:
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_PRBS7);
+		break;
+
+	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
+		/* 00111110000011111000001111100000 */
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
+			      0x3E0F83E0);
+		/* 00001111100000111110000011111000 */
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
+			      0x0F83E0F8);
+		/* 1111100000111110 */
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
+			      0x0000F83E);
+		break;
+
+	case DP_PHY_TEST_PATTERN_CP2520:
+		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
+
+		value = DP_HBR2_ERM_PATTERN;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+			      value);
+		value |= SCRAMBLER_RESET_COUNT_VALUE;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+			      value);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
+			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
+		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+		value |= DP_MAINLINK_CTRL_ENABLE;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
+		break;
+
+	case DP_PHY_TEST_PATTERN_SEL_MASK:
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL,
+			      DP_MAINLINK_CTRL_ENABLE);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
+		break;
+
+	default:
+		drm_dbg_dp(ctrl->drm_dev,
+			   "No valid test pattern requested: %#x\n", pattern);
+	break;
+	}
+}
+
 static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 {
 	bool success = false;
@@ -1659,11 +1961,11 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 		DRM_ERROR("Failed to set v/p levels\n");
 		return false;
 	}
-	msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
+	msm_dp_ctrl_send_phy_pattern(ctrl, pattern_requested);
 	msm_dp_ctrl_update_vx_px(ctrl);
 	msm_dp_link_send_test_response(ctrl->link);
 
-	pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
+	pattern_sent = msm_dp_read_link(ctrl->catalog, REG_DP_MAINLINK_READY);
 
 	switch (pattern_sent) {
 	case MR_LINK_TRAINING1:
@@ -1942,6 +2244,63 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
 	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
+static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
+			       u32 rate, u32 stream_rate_khz,
+			       bool is_ycbcr_420)
+{
+	u32 pixel_m, pixel_n;
+	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
+	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
+	u32 const link_rate_hbr2 = 540000;
+	u32 const link_rate_hbr3 = 810000;
+	unsigned long den, num;
+
+	if (rate == link_rate_hbr3)
+		pixel_div = 6;
+	else if (rate == 162000 || rate == 270000)
+		pixel_div = 2;
+	else if (rate == link_rate_hbr2)
+		pixel_div = 4;
+	else
+		DRM_ERROR("Invalid pixel mux divider\n");
+
+	dispcc_input_rate = (rate * 10) / pixel_div;
+
+	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
+			(unsigned long)(1 << 16) - 1,
+			(unsigned long)(1 << 16) - 1, &den, &num);
+
+	den = ~(den - num);
+	den = den & 0xFFFF;
+	pixel_m = num;
+	pixel_n = den;
+
+	mvid = (pixel_m & 0xFFFF) * 5;
+	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
+
+	if (nvid < nvid_fixed) {
+		u32 temp;
+
+		temp = (nvid_fixed / nvid) * nvid;
+		mvid = (nvid_fixed / nvid) * mvid;
+		nvid = temp;
+	}
+
+	if (is_ycbcr_420)
+		mvid /= 2;
+
+	if (link_rate_hbr2 == rate)
+		nvid *= 2;
+
+	if (link_rate_hbr3 == rate)
+		nvid *= 3;
+
+	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
+	msm_dp_write_link(ctrl->catalog, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_link(ctrl->catalog, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_p0(ctrl->catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
@@ -2007,20 +2366,20 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
 	msm_dp_ctrl_configure_source_params(ctrl);
 
-	msm_dp_catalog_ctrl_config_msa(ctrl->catalog,
+	msm_dp_ctrl_config_msa(ctrl,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
 
-	mainlink_ready = msm_dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
+	mainlink_ready = msm_dp_ctrl_mainlink_ready(ctrl);
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
@@ -2041,7 +2400,7 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	/* set dongle to D3 (power off) mode */
 	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
@@ -2069,7 +2428,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
@@ -2092,9 +2451,9 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_ctrl_reset(ctrl);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);

-- 
2.39.5

