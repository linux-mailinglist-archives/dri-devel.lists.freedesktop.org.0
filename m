Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DF2AA4C67
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F98110E7D6;
	Wed, 30 Apr 2025 13:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PxlFBIUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D943510E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:55 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39c2688e2bbso483696f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018114; x=1746622914; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lvMeErsxzspSIlGW/2qkBXNlhSczJES7Gq5aMBrNrd8=;
 b=PxlFBIUcX2KmyoDeOu6d6HT+HqB3LDB/YLK0QoqrruOKAuBlHSj3smVRKbP1Rb7hh1
 ZPQwg2CnRiam/Kv/RZ/Y0inzaBji7v7FTHvBdvRV09ieyT2crNlkNSrzmNbJFYVVbABS
 d2pD6in8k+5B9x3dD2ceQsv/H4OhV8EleJL+dpEdyDOM4vqfo2I1OE78czQ4TF01gKqI
 SlQ+JDpO6wkQqsv/Y/3df1tcC1F19AGZQkuo68fkM18bA6U1f/FT7er2Ynu2KTk5JbDL
 DdKjWZkIORddGySX4+J4Ne+nMhaNhFi9px5Ydutnla+mBbWd1VcndYkayHNNaPwETwVt
 0HBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018114; x=1746622914;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lvMeErsxzspSIlGW/2qkBXNlhSczJES7Gq5aMBrNrd8=;
 b=vkbLkRywCOXzigMt3ismJ16JNJVqskd8iSGXCc52GSYFAKjs8MpowDrTeJQ5YF9+fT
 XdQfnBpqsGCjmjbDtppr8hFkbks9Nd9d7+Qr4trMy9iumqmxg2aV2TJDluomGE2o+iTf
 QRFrdudoz04mX5FmeHiN4Fb9jEgJbMGwz/n7YgWX0R1MXLNumUjJYMQUW+dP4FeYRGQf
 +08au+wJXv/wF8p5quNPS3vazHH9LvgtGTiqNtq+eyDbsC9uCII545T9L6W4EeAEv9x8
 TMvEP1KJCbkZ6sIkEUxnbMd+vi5HTHneH9Yyqt1356Ddf+GuhZFmU7/sPyZI5MZhDpTM
 /tnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5oQ9cpgCDNAxNXlYzvTvKEX4EILrEb4m0g1nfirufLOEyFiiqslsZXewdDJ39aFJkxGItRmRb5NE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJsKLlasQ6yAmhqQzuSLHaylxh2+0TomAQeocaARPAp/u4e3Wn
 Tz+wJZr+V1HXW/HaLnIX3wZv2IT9DxTvtf14+gClrCbZB25zQbe8+Ud3QYtThmk=
X-Gm-Gg: ASbGncuY+HJ1XdSWPqVJukcyEoMR0f4abgV3eUhs56ljXFWxYYDlLSi2Kx409XX7dda
 jdfouH1+arse5BpquERnN31lzTYyURKMNw2PscbDxNbMdZov65pjjsoejY7iUT8bCPdIWviQypL
 2pn4PqPexKkQNQuL769+lXdY3SjJZdOKEBitfBMTJUkpOz/CE5hF3hAhcu6RelilDJEOHDr0ssQ
 edlCPY3NVWvu9VvhRgPSK0wU04z2adU1hoopl1gk2Zq5VsbCJpkRUiLDchiMq3onReLLL9UtC00
 0MZwQiO86Gjeeh7LEZzoZWFBYf5zg5Xb6U8gBy2ZtJQlC9BAVVZ2TFri/40=
X-Google-Smtp-Source: AGHT+IFZv8o6KCEUY51F0cTyK0BLkydSFJXpEBfGxpot5cmVITUa2IgtAcHUXD94u3/lt2/wBfJ90g==
X-Received: by 2002:a05:6000:2c9:b0:39f:728:4324 with SMTP id
 ffacd0b85a97d-3a08ff74043mr751533f8f.9.1746018113975; 
 Wed, 30 Apr 2025 06:01:53 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:51 +0200
Subject: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7657;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WAS/ZY2rni16gfsJ0XrYK7pyDfoo4oQax4c9rkXIQ+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8LMB1KhVzmri4QYY2D8mI+TfDoRqwLLpEHe
 Z7SKGbTFp6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfCwAKCRDBN2bmhouD
 1/+vD/9MiF/yQLp6Tzs6qeDRij9nAuU0zRnUYb0wGTH5medZzHhV0IdpwNsPK7gzkSARgLEvP7w
 sMa8/GNCrfXsr3Th+U5Q0+kFqeEw4Y1LrBXpALG/K/1mMymnGLQPAlRBY8iwAkNkmJbo5na8UKs
 BxvVj6C1H1ZgQOIMNVIa375f0dwM8H7C1sIIwXIYezaBGLIRc+jEzM6Pf4HOqVD8MTEH/RHhc4p
 M8VbtJYE8T+mAGmaz/TST9X2ztwlJJ7u+KQ5hvUskHYSEy+dpK4auK3ZljjGLwci1yYSHjtrNEu
 pofevITflRA35uiNHc5vUeZbdWK1EmMcp2nVlMSf9IY6GSDF9J0VmhuSwxxGZ9BiWVBqdZEWn1Y
 KtDM7ICCrYJC8qk9Jz7lXEliCWftcPG0+cGmWG2bapvwfnRa9SNKjfCSjthIftU4xvpkUT+S+U6
 O+3xWcBS2VJK/NRpPH7hlUpR+kpi7UcVru/7B9repvCmq+FLDSyldBNeCVeXreUoWLHiYDcBuMm
 RbLHfSCH9Zmq0dmbjqFJxYIXVw9qAlvRpQZrQAEuOZylnwaCRl6dxk9QRxTSZHm/ohohxz52Tq/
 OWQ+zaBORrzjuLVYYkQ9rzbGIn6XLZZ2WCwPJRj76swUBtBCi86Gm1hK3bbfecTVGG9GsrIwiaT
 oajDrysqk8vOSGQ==
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

v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
differences and new implementations of setup_alpha_out(),
setup_border_color() and setup_blend_config().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. Lowercase hex, use spaces for define indentation
2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 }
 
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
-		struct dpu_plane_state *pstate, const struct msm_format *format)
+				      struct dpu_plane_state *pstate,
+				      const struct msm_format *format,
+				      const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	uint32_t blend_op;
-	uint32_t fg_alpha, bg_alpha;
+	uint32_t fg_alpha, bg_alpha, max_alpha;
 
 	fg_alpha = pstate->base.alpha >> 8;
-	bg_alpha = 0xff - fg_alpha;
+	if (mdss_ver->core_major_ver < 12)
+		max_alpha = 0xff;
+	else
+		max_alpha = 0x3ff;
+	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
@@ -337,7 +343,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
@@ -348,7 +354,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
 				    DPU_BLEND_FG_INV_MOD_ALPHA |
@@ -482,7 +488,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
+			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format,
+						  ctl->mdss_ver);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..f220a68e138cb9e7c88194e53e47391de7ed04f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -19,12 +19,20 @@
 
 /* These register are offset to mixer base + stage base */
 #define LM_BLEND0_OP                     0x00
+
+/* <v12 DPU with offset to mixer base + stage base */
 #define LM_BLEND0_CONST_ALPHA            0x04
 #define LM_FG_COLOR_FILL_COLOR_0         0x08
 #define LM_FG_COLOR_FILL_COLOR_1         0x0C
 #define LM_FG_COLOR_FILL_SIZE            0x10
 #define LM_FG_COLOR_FILL_XY              0x14
 
+/* >= v12 DPU */
+#define LM_BORDER_COLOR_0_V12            0x1c
+#define LM_BORDER_COLOR_1_V12            0x20
+
+/* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_CONST_ALPHA_V12        0x08
 #define LM_BLEND0_FG_ALPHA               0x04
 #define LM_BLEND0_BG_ALPHA               0x08
 
@@ -83,6 +91,22 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
+static void dpu_hw_lm_setup_border_color_v12(struct dpu_hw_mixer *ctx,
+					     struct dpu_mdss_color *color,
+					     u8 border_en)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+
+	if (border_en) {
+		DPU_REG_WRITE(c, LM_BORDER_COLOR_0_V12,
+			      (color->color_0 & 0x3ff) |
+			      ((color->color_1 & 0x3ff) << 16));
+		DPU_REG_WRITE(c, LM_BORDER_COLOR_1_V12,
+			      (color->color_2 & 0x3ff) |
+			      ((color->color_3 & 0x3ff) << 16));
+	}
+}
+
 static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
 {
 	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, 0x0);
@@ -112,6 +136,27 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
+static void
+dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
+						u32 stage, u32 fg_alpha,
+						u32 bg_alpha, u32 blend_op)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int stage_off;
+	u32 const_alpha;
+
+	if (stage == DPU_STAGE_BASE)
+		return;
+
+	stage_off = _stage_offset(ctx, stage);
+	if (WARN_ON(stage_off < 0))
+		return;
+
+	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
+}
+
 static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
@@ -144,6 +189,32 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
+static void dpu_hw_lm_setup_color3_v12(struct dpu_hw_mixer *ctx,
+				       uint32_t mixer_op_mode)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int op_mode, stages, stage_off, i;
+
+	stages = ctx->cap->sblk->maxblendstages;
+	if (stages <= 0)
+		return;
+
+	for (i = DPU_STAGE_0; i <= stages; i++) {
+		stage_off = _stage_offset(ctx, i);
+		if (WARN_ON(stage_off < 0))
+			return;
+
+		/* set color_out3 bit in blend0_op when enabled in mixer_op_mode */
+		op_mode = DPU_REG_READ(c, LM_BLEND0_OP + stage_off);
+		if (mixer_op_mode & BIT(i))
+			op_mode |= BIT(30);
+		else
+			op_mode &= ~BIT(30);
+
+		DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, op_mode);
+	}
+}
+
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
-	if (mdss_ver->core_major_ver >= 4)
+	if (mdss_ver->core_major_ver >= 12)
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
+	else if (mdss_ver->core_major_ver >= 4)
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
-	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
-	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	if (mdss_ver->core_major_ver < 12) {
+		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	} else {
+		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
+		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
+	}
 	c->ops.setup_misr = dpu_hw_lm_setup_misr;
 	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 

-- 
2.45.2

