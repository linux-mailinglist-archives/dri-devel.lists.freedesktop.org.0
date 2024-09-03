Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1F09691D9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B4A10E3D2;
	Tue,  3 Sep 2024 03:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rAi4JBZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D9E10E3D1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:02 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f40a1a2c1aso45578821fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333780; x=1725938580; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R3qV8L03p4INw6SLIS9yvfnIJMmwDeBJ05lkHS8t470=;
 b=rAi4JBZHWg5Rt6izTyz6nMBSN2bhq2vIh9S0ItG0wlkknZLjNR2LdxODhfhsM1mW5l
 OuUOI4FU1W/3k1jOcK96p8kFPeTwN7DKVO1S/pJDo6KfKaOnshAU9t0DQgSq7rG0Vn9M
 5FSLARLtTgKj3HOro8DwrC1u4oCMxBocwzIIBBUPzBBu7zI1ZNxnhvau6HvYTOGbOOxL
 VxfPYBTqduj5zFuB7vd9lePS5hs9E8k49Yy5sAJMcdfGv65p9EHEFUPtnnxKfrT8kRjU
 eGeY5a556sMYJkFD+cFFfqp0PeZH3v+M9Pa0iAeBrC4XbEIxR+TTu3uKxHJdMdMkdw5l
 hSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333780; x=1725938580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3qV8L03p4INw6SLIS9yvfnIJMmwDeBJ05lkHS8t470=;
 b=NrsGtwnAaB/jNPyGCXycaxyE0kI8tcnTBw1ERi8/hB6UHKQOK9BBgNgySKjFiIG17Z
 0PPy24Y6rWzI8MS09ISLx18ozlVfJvnyz5jvpE8Reht2gcTP7HTQX95D6Hav1XGqU2G3
 ybxuvMX8RzxK5K4/ymBgTuhUpfZ97oimbdD3WGUqWd7vIXKXt8AwqtN6Vm9YB6HK8tLo
 Vs4o1q00mgLEj62YZ6MchTtp/Ow02QpDBhzQKAFs0xg2PHi3Tq42qOYP0GyX/1sLhHGQ
 2V53pv5xLGCsS/YCibd3IYZgLekrzgPAbYY01MD4Yc6q9wsDwbv90M6bwD8/HU2YfzYa
 MexQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsv34GSJDlSzjWLRmRilrgHHMaMHtL7uxVUlM+1+t5uMOP3bxNm+rJUJ2ulKr0TdmkwfzqT9D5iik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLn0s4qY33LhYb/dm8t0zC7shIkHJXIicCT/V9eF6prJMKwCbY
 lvJXnH6Ui5/Pp+gWMFWt3Vx9m4KHd0kxG0EFdsNmwL2s9WLkcCnI6gVAla+aBU4=
X-Google-Smtp-Source: AGHT+IG+HO5b6Qz94fF9oVVqE7YS8sUB7eYarqOMt4TcLyHXYih282lm5RYr+HbQKmy1EQGdMi/TLQ==
X-Received: by 2002:a2e:a99b:0:b0:2f1:59ed:879d with SMTP id
 38308e7fff4ca-2f61038cbe8mr120348401fa.1.1725333779260; 
 Mon, 02 Sep 2024 20:22:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:50 +0300
Subject: [PATCH v6 07/15] drm/msm/dpu: drop msm_format from struct
 dpu_hw_fmt_layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-7-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9657;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WhNMdLAggb/eibU1w9vVgTPCuDUCOFkENzZfVbCfH8I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oELd0nAD/K5A3bffo5f0hUsBEMBFcWOaPd4G
 yKm9oy6gpCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1f67CACss1F/Wh4m9FutydnGF20c2PN8v5/+I9DXMms47HalNLx8WW8ytC2o0J9R+KEz9/ZY8pm
 EzHhA1iafUZzlCl57JHWRG5nITJ9IRqmitQ7r047ZwAEzihXVZz+0kBTgmU0Ws8QIj7BakeY7HO
 RZQEu4h61SG7B283dwCTgADyGglhoEUCWgtO4SwOAv6bp0iYeHAGKOI8zRR1xiMNBI+rNLbT76E
 4KQ7s7FNvoez0iB4L2ATsOV+bALzhJX1/+LAKgwc4VdpexhCl678MI2y3LXVVKeVTVLkZMV2f4D
 tzkeK1yslVrhRP6xor/Ih56oC8dSfia74PtyBBp1M6kfNN2Z
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

The struct dpu_hw_fmt_layout defines hardware data layout (addresses,
sizes and pitches. Drop format field from this structure as it's not a
part of the data layout.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 31 +++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 23 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  3 ++-
 5 files changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 882c717859ce..c4a16a73bc97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -166,10 +166,10 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 /**
  * dpu_encoder_phys_wb_setup_fb - setup output framebuffer
  * @phys_enc:	Pointer to physical encoder
- * @fb:		Pointer to output framebuffer
+ * @format: Format of the framebuffer
  */
 static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
-		struct drm_framebuffer *fb)
+					 const struct msm_format *format)
 {
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
 	struct dpu_hw_wb *hw_wb;
@@ -193,12 +193,12 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		hw_wb->ops.setup_roi(hw_wb, wb_cfg);
 
 	if (hw_wb->ops.setup_outformat)
-		hw_wb->ops.setup_outformat(hw_wb, wb_cfg);
+		hw_wb->ops.setup_outformat(hw_wb, wb_cfg, format);
 
 	if (hw_wb->ops.setup_cdp) {
 		const struct dpu_perf_cfg *perf = phys_enc->dpu_kms->catalog->perf;
 
-		hw_wb->ops.setup_cdp(hw_wb, wb_cfg->dest.format,
+		hw_wb->ops.setup_cdp(hw_wb, format,
 				     perf->cdp_cfg[DPU_PERF_CDP_USAGE_NRT].wr_enable);
 	}
 
@@ -318,15 +318,10 @@ static void dpu_encoder_phys_wb_setup(
 {
 	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
 	struct drm_display_mode mode = phys_enc->cached_mode;
-	struct drm_framebuffer *fb = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
-	struct drm_writeback_job *wb_job;
 	const struct msm_format *format;
-	const struct msm_format *dpu_fmt;
 
-	wb_job = wb_enc->wb_job;
 	format = msm_framebuffer_format(wb_enc->wb_job->fb);
-	dpu_fmt = mdp_get_format(&phys_enc->dpu_kms->base, format->pixel_format, wb_job->fb->modifier);
 
 	DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
 			hw_wb->idx - WB_0, mode.name,
@@ -338,9 +333,9 @@ static void dpu_encoder_phys_wb_setup(
 
 	dpu_encoder_phys_wb_set_qos(phys_enc);
 
-	dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
+	dpu_encoder_phys_wb_setup_fb(phys_enc, format);
 
-	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
+	dpu_encoder_helper_phys_setup_cdm(phys_enc, format, CDM_CDWN_OUTPUT_WB);
 
 	dpu_encoder_phys_wb_setup_ctl(phys_enc);
 }
@@ -584,14 +579,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
-	wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
-					     format->pixel_format, job->fb->modifier);
-	if (!wb_cfg->dest.format) {
-		/* this error should be detected during atomic_check */
-		DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
-		return;
-	}
-
 	ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
 	if (ret) {
 		DPU_DEBUG("failed to populate layout %d\n", ret);
@@ -600,10 +587,10 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
-	wb_cfg->dest.num_planes = wb_cfg->dest.format->num_planes;
+	wb_cfg->dest.num_planes = format->num_planes;
 
-	if ((wb_cfg->dest.format->fetch_type == MDP_PLANE_PLANAR) &&
-			(wb_cfg->dest.format->element[0] == C1_B_Cb))
+	if ((format->fetch_type == MDP_PLANE_PLANAR) &&
+	    (format->element[0] == C1_B_Cb))
 		swap(wb_cfg->dest.plane_addr[1], wb_cfg->dest.plane_addr[2]);
 
 	DPU_DEBUG("[fb_offset:%8.8x,%8.8x,%8.8x,%8.8x]\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 8c2dc5b59bb0..46237a1ca6a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -104,7 +104,6 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->format = fmt;
 	layout->width = width;
 	layout->height = height;
 	layout->num_planes = fmt->num_planes;
@@ -116,7 +115,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 		return -EINVAL;
 	}
 
-	if (MSM_FORMAT_IS_YUV(layout->format)) {
+	if (MSM_FORMAT_IS_YUV(fmt)) {
 		uint32_t y_sclines, uv_sclines;
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
@@ -182,7 +181,6 @@ static int _dpu_format_get_plane_sizes_linear(
 	int i;
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->format = fmt;
 	layout->width = width;
 	layout->height = height;
 	layout->num_planes = fmt->num_planes;
@@ -190,8 +188,8 @@ static int _dpu_format_get_plane_sizes_linear(
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
-		layout->plane_size[0] = width * height * layout->format->bpp;
-		layout->plane_pitch[0] = width * layout->format->bpp;
+		layout->plane_size[0] = width * height * fmt->bpp;
+		layout->plane_pitch[0] = width * fmt->bpp;
 	} else {
 		uint32_t v_subsample, h_subsample;
 		uint32_t chroma_samp;
@@ -272,6 +270,7 @@ static int _dpu_format_populate_addrs_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
+	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
@@ -286,10 +285,11 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EFAULT;
 	}
 
-	meta = MSM_FORMAT_IS_UBWC(layout->format);
+	fmt = msm_framebuffer_format(fb);
+	meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	/* Per-format logic for verifying active planes */
-	if (MSM_FORMAT_IS_YUV(layout->format)) {
+	if (MSM_FORMAT_IS_YUV(fmt)) {
 		/************************************************/
 		/*      UBWC            **                      */
 		/*      buffer          **      DPU PLANE       */
@@ -390,6 +390,7 @@ int dpu_format_populate_layout(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
+	const struct msm_format *fmt;
 	int ret;
 
 	if (!fb || !layout) {
@@ -403,17 +404,17 @@ int dpu_format_populate_layout(
 		return -ERANGE;
 	}
 
-	layout->format = msm_framebuffer_format(fb);
+	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(layout->format, fb->width, fb->height,
+	ret = dpu_format_get_plane_sizes(fmt, fb->width, fb->height,
 			layout, fb->pitches);
 	if (ret)
 		return ret;
 
 	/* Populate the addresses given the fb */
-	if (MSM_FORMAT_IS_UBWC(layout->format) ||
-			MSM_FORMAT_IS_TILE(layout->format))
+	if (MSM_FORMAT_IS_UBWC(fmt) ||
+			MSM_FORMAT_IS_TILE(fmt))
 		ret = _dpu_format_populate_addrs_ubwc(aspace, fb, layout);
 	else
 		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a2eff36a2224..f8806a4d317b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -293,7 +293,6 @@ enum dpu_3d_blend_mode {
 
 /**
  * struct dpu_hw_fmt_layout - format information of the source pixel data
- * @format: pixel format parameters
  * @num_planes: number of planes (including meta data planes)
  * @width: image width
  * @height: image height
@@ -303,7 +302,6 @@ enum dpu_3d_blend_mode {
  * @plane_pitch: pitch of each plane
  */
 struct dpu_hw_fmt_layout {
-	const struct msm_format *format;
 	uint32_t num_planes;
 	uint32_t width;
 	uint32_t height;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 93ff01c889b5..f39db534697d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -64,10 +64,10 @@ static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
 }
 
 static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
-		struct dpu_hw_wb_cfg *data)
+				   struct dpu_hw_wb_cfg *data,
+				   const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	const struct msm_format *fmt = data->dest.format;
 	u32 dst_format, pattern, ystride0, ystride1, outsize, chroma_samp;
 	u32 write_config = 0;
 	u32 opmode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index 37497473e16c..b240a4f7b33a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -37,7 +37,8 @@ struct dpu_hw_wb_ops {
 			struct dpu_hw_wb_cfg *wb);
 
 	void (*setup_outformat)(struct dpu_hw_wb *ctx,
-			struct dpu_hw_wb_cfg *wb);
+			struct dpu_hw_wb_cfg *wb,
+			const struct msm_format *fmt);
 
 	void (*setup_roi)(struct dpu_hw_wb *ctx,
 			struct dpu_hw_wb_cfg *wb);

-- 
2.39.2

