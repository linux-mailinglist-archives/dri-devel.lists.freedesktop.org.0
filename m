Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178876590DF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D531A10E219;
	Thu, 29 Dec 2022 19:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061F710E205
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z26so28748300lfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cMt/982wLZd4QraSvhwuICrZ4L8bumnkzl1TUROOKcI=;
 b=K0OsOsKXvrw56MUJY1965atfUJAtFKp4wt8DhJIJxPrUISOat8JeUtUp144rh+g1hi
 sL1RVVZ0k9T9OgXc4Hjl9zhhnPID4Pn6MjdA57bqEFBctpqAU3urkpEF2I28w1YiCqBM
 jAxfJ0xUhxh1wGzeRsI++kTrJYmx/UedzpmjdKFTN7hg+fP3T3J4nSOp2CMN6SBL2tvQ
 cHHc6YAMkcCdogGX3WYZNAOz4NH5qr1W4QctZ48VSxelL+WHMblWrCmatzMCQlEWjKJs
 O9D8Zk7azL84kVdOy7gVljAMbK3SI4N7gZT41xU2fZ7sTlr4+XKH5z+RxWCIKlXk4qCg
 ZssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cMt/982wLZd4QraSvhwuICrZ4L8bumnkzl1TUROOKcI=;
 b=o96NLAIsk1AKz1WzTR0kZWa1CaSeIwIKlk8YZ/DjHNdx8ErvUSD/mw11/kKsCVzh3K
 5uQiTP48ItWFBkYnYUWGUG/DERoXzyZSO5dIa5pS/qJqmSM7/FLSnPhkS9g0AmLS/OKE
 H5MVodnO6PqGThT2CXdmXgdLxiGNJk7RFt5hq3TsGmpMcRsGkcpPiMiE4FDX1G4QLEjp
 9A9Vo1TsDoodm9ghuKhdLzdESWuD8dJJ5zLKanxfphMfeet+EYNmZM4YLK0QnN8y0Kr/
 e+uA6xGFAuwC+cmAsK+c0/6gaLHYzx9BGYxj/9+0KYNN22/guh8fi9RzLXpUnONdXIW2
 M2GQ==
X-Gm-Message-State: AFqh2kpyMgJbEL9qDA4DTMdHPrmnlZlNJdH/uWGaG9eztfl77RfRhp5T
 cDNFbZ2bsfdqL/EDFJ1FXAMpQg==
X-Google-Smtp-Source: AMrXdXvfVDYBjLhugNQfjqWBnZ8F+mh5LMU6OXDgrcLJeejHZd9VPaOxZcy1aAqwyiW/XtH9wwjqZg==
X-Received: by 2002:ac2:5503:0:b0:4b5:9845:c8a9 with SMTP id
 j3-20020ac25503000000b004b59845c8a9mr8024466lfk.47.1672341540266; 
 Thu, 29 Dec 2022 11:19:00 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:18:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 02/27] drm/msm/dpu: rename struct dpu_hw_pipe to dpu_hw_sspp
Date: Thu, 29 Dec 2022 21:18:31 +0200
Message-Id: <20221229191856.3508092-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For all hardware blocks except SSPP the corresponding struct is named
after the block. Rename dpu_hw_pipe (SSPP structure) to dpu_hw_sspp.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 42 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 42 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 +-
 3 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 691c471b08c2..93f01f767fd8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -136,7 +136,7 @@
 #define TS_CLK			19200000
 
 
-static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
+static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
 		int s_id,
 		u32 *idx)
 {
@@ -168,7 +168,7 @@ static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
 	return rc;
 }
 
-static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_multirect(struct dpu_hw_sspp *ctx,
 		enum dpu_sspp_multirect_index index,
 		enum dpu_sspp_multirect_mode mode)
 {
@@ -197,7 +197,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx, mode_mask);
 }
 
-static void _sspp_setup_opmode(struct dpu_hw_pipe *ctx,
+static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
 	u32 idx;
@@ -218,7 +218,7 @@ static void _sspp_setup_opmode(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_OP_MODE + idx, opmode);
 }
 
-static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
+static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
 	u32 idx;
@@ -239,7 +239,7 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
 /*
  * Setup source pixel format, flip,
  */
-static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_format(struct dpu_hw_sspp *ctx,
 		const struct dpu_format *fmt, u32 flags,
 		enum dpu_sspp_multirect_index rect_mode)
 {
@@ -356,7 +356,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS + idx, BIT(31));
 }
 
-static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pixel_ext *pe_ext)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -414,7 +414,7 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
 			tot_req_pixels[3]);
 }
 
-static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
+static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pipe_cfg *sspp,
 		void *scaler_cfg)
 {
@@ -430,7 +430,7 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
 			sspp->layout.format);
 }
 
-static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
+static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
 {
 	u32 idx;
 
@@ -443,7 +443,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
 /*
  * dpu_hw_sspp_setup_rects()
  */
-static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pipe_cfg *cfg,
 		enum dpu_sspp_multirect_index rect_index)
 {
@@ -512,7 +512,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
-static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pipe_cfg *cfg,
 		enum dpu_sspp_multirect_index rect_mode)
 {
@@ -539,7 +539,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
 	}
 }
 
-static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 		const struct dpu_csc_cfg *data)
 {
 	u32 idx;
@@ -556,7 +556,7 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
 	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
 }
 
-static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
+static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_sspp *ctx, u32 color, enum
 		dpu_sspp_multirect_index rect_index)
 {
 	u32 idx;
@@ -571,7 +571,7 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
 				color);
 }
 
-static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
 			u32 danger_lut,
 			u32 safe_lut)
 {
@@ -584,7 +584,7 @@ static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
 }
 
-static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
 			u64 creq_lut)
 {
 	u32 idx;
@@ -601,7 +601,7 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
 	}
 }
 
-static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pipe_qos_cfg *cfg)
 {
 	u32 idx;
@@ -626,7 +626,7 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
 }
 
-static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_cdp(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_cdp_cfg *cfg,
 		enum dpu_sspp_multirect_index index)
 {
@@ -657,7 +657,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
 }
 
-static void _setup_layer_ops(struct dpu_hw_pipe *c,
+static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		unsigned long features)
 {
 	if (test_bit(DPU_SSPP_SRC, &features)) {
@@ -695,7 +695,7 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
 }
 
 #ifdef CONFIG_DEBUG_FS
-int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry)
+int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms, struct dentry *entry)
 {
 	const struct dpu_sspp_cfg *cfg = hw_pipe->cap;
 	const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
@@ -779,10 +779,10 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 	return ERR_PTR(-ENOMEM);
 }
 
-struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
+struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 		void __iomem *addr, const struct dpu_mdss_cfg *catalog)
 {
-	struct dpu_hw_pipe *hw_pipe;
+	struct dpu_hw_sspp *hw_pipe;
 	const struct dpu_sspp_cfg *cfg;
 
 	if (!addr || !catalog)
@@ -808,7 +808,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 	return hw_pipe;
 }
 
-void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx)
+void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx)
 {
 	kfree(ctx);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 0c95b7e64f6c..651621b9794f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -10,7 +10,7 @@
 #include "dpu_hw_util.h"
 #include "dpu_formats.h"
 
-struct dpu_hw_pipe;
+struct dpu_hw_sspp;
 
 /**
  * Flags
@@ -214,7 +214,7 @@ struct dpu_hw_sspp_ops {
 	 * @flags: Extra flags for format config
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_format)(struct dpu_hw_pipe *ctx,
+	void (*setup_format)(struct dpu_hw_sspp *ctx,
 			const struct dpu_format *fmt, u32 flags,
 			enum dpu_sspp_multirect_index index);
 
@@ -224,7 +224,7 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to pipe config structure
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_rects)(struct dpu_hw_pipe *ctx,
+	void (*setup_rects)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_pipe_cfg *cfg,
 			enum dpu_sspp_multirect_index index);
 
@@ -233,7 +233,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @pe_ext: Pointer to pixel ext settings
 	 */
-	void (*setup_pe)(struct dpu_hw_pipe *ctx,
+	void (*setup_pe)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_pixel_ext *pe_ext);
 
 	/**
@@ -242,7 +242,7 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to pipe config structure
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_sourceaddress)(struct dpu_hw_pipe *ctx,
+	void (*setup_sourceaddress)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_pipe_cfg *cfg,
 			enum dpu_sspp_multirect_index index);
 
@@ -251,7 +251,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @data: Pointer to config structure
 	 */
-	void (*setup_csc)(struct dpu_hw_pipe *ctx, const struct dpu_csc_cfg *data);
+	void (*setup_csc)(struct dpu_hw_sspp *ctx, const struct dpu_csc_cfg *data);
 
 	/**
 	 * setup_solidfill - enable/disable colorfill
@@ -260,7 +260,7 @@ struct dpu_hw_sspp_ops {
 	 * @flags: Pipe flags
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_solidfill)(struct dpu_hw_pipe *ctx, u32 color,
+	void (*setup_solidfill)(struct dpu_hw_sspp *ctx, u32 color,
 			enum dpu_sspp_multirect_index index);
 
 	/**
@@ -270,7 +270,7 @@ struct dpu_hw_sspp_ops {
 	 * @mode: parallel fetch / time multiplex multirect mode
 	 */
 
-	void (*setup_multirect)(struct dpu_hw_pipe *ctx,
+	void (*setup_multirect)(struct dpu_hw_sspp *ctx,
 			enum dpu_sspp_multirect_index index,
 			enum dpu_sspp_multirect_mode mode);
 
@@ -279,7 +279,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @cfg: Pointer to config structure
 	 */
-	void (*setup_sharpening)(struct dpu_hw_pipe *ctx,
+	void (*setup_sharpening)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_sharp_cfg *cfg);
 
 	/**
@@ -289,7 +289,7 @@ struct dpu_hw_sspp_ops {
 	 * @safe_lut: LUT for generate safe level based on fill level
 	 *
 	 */
-	void (*setup_danger_safe_lut)(struct dpu_hw_pipe *ctx,
+	void (*setup_danger_safe_lut)(struct dpu_hw_sspp *ctx,
 			u32 danger_lut,
 			u32 safe_lut);
 
@@ -299,7 +299,7 @@ struct dpu_hw_sspp_ops {
 	 * @creq_lut: LUT for generate creq level based on fill level
 	 *
 	 */
-	void (*setup_creq_lut)(struct dpu_hw_pipe *ctx,
+	void (*setup_creq_lut)(struct dpu_hw_sspp *ctx,
 			u64 creq_lut);
 
 	/**
@@ -308,7 +308,7 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to pipe QoS configuration
 	 *
 	 */
-	void (*setup_qos_ctrl)(struct dpu_hw_pipe *ctx,
+	void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_pipe_qos_cfg *cfg);
 
 	/**
@@ -316,7 +316,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @cfg: Pointer to histogram configuration
 	 */
-	void (*setup_histogram)(struct dpu_hw_pipe *ctx,
+	void (*setup_histogram)(struct dpu_hw_sspp *ctx,
 			void *cfg);
 
 	/**
@@ -325,7 +325,7 @@ struct dpu_hw_sspp_ops {
 	 * @pipe_cfg: Pointer to pipe configuration
 	 * @scaler_cfg: Pointer to scaler configuration
 	 */
-	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
+	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pipe_cfg *pipe_cfg,
 		void *scaler_cfg);
 
@@ -333,7 +333,7 @@ struct dpu_hw_sspp_ops {
 	 * get_scaler_ver - get scaler h/w version
 	 * @ctx: Pointer to pipe context
 	 */
-	u32 (*get_scaler_ver)(struct dpu_hw_pipe *ctx);
+	u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
 
 	/**
 	 * setup_cdp - setup client driven prefetch
@@ -341,13 +341,13 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to cdp configuration
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
+	void (*setup_cdp)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_cdp_cfg *cfg,
 			enum dpu_sspp_multirect_index index);
 };
 
 /**
- * struct dpu_hw_pipe - pipe description
+ * struct dpu_hw_sspp - pipe description
  * @base: hardware block base structure
  * @hw: block hardware details
  * @catalog: back pointer to catalog
@@ -356,7 +356,7 @@ struct dpu_hw_sspp_ops {
  * @cap: pointer to layer_cfg
  * @ops: pointer to operations possible for this pipe
  */
-struct dpu_hw_pipe {
+struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
 	const struct dpu_mdss_cfg *catalog;
@@ -378,7 +378,7 @@ struct dpu_kms;
  * @addr: Mapped register io address of MDP
  * @catalog : Pointer to mdss catalog data
  */
-struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
+struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 		void __iomem *addr, const struct dpu_mdss_cfg *catalog);
 
 /**
@@ -386,10 +386,10 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
  * should be called during Hw pipe cleanup.
  * @ctx:  Pointer to SSPP driver context returned by dpu_hw_sspp_init
  */
-void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
+void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx);
 
 void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
-int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
+int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
 
 #endif /*_DPU_HW_SSPP_H */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index bfd5be89e8b8..e1cdd71716f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -104,7 +104,7 @@ struct dpu_plane {
 
 	enum dpu_sspp pipe;
 
-	struct dpu_hw_pipe *pipe_hw;
+	struct dpu_hw_sspp *pipe_hw;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
-- 
2.39.0

