Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B711E919A02
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9B210E9FA;
	Wed, 26 Jun 2024 21:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVz6BO3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719C510E9CE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:13 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ec5d31be98so9522661fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438371; x=1720043171; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HfWR6KWS6ucr/I9LD7F4kz2B10LaGDv77CEK7PHDOoo=;
 b=sVz6BO3WB27ZgichlW1s5clXxAfKFSebU8hSwEDCi7UBNaVPa5V0mdztzYpw8PL6/4
 +zWvLGP0bvoeqlfYG7IDSWS05mrVl88kuUa+fZ9riOce5HLsbvp1yzXNAMvKQA9GbLAz
 bqKVOJ5AEeCz5g77Fx1E1D7VayFekGGi1bNpfZ/5V1SmX3Q6NigU91/MB4H8obyJkd/l
 /UNgx8LlUb8UGRhOqRw4dJJDYkAHe6F18apWgUqOX8uYCRi3CtL8o8JNESyRoEv+pAVA
 9UiOlseCok1rtOUbPIPRWK6zVR0Al5C3BosWH9el4gkkIfLz0XX9AvyZsL4nPOoTTRwO
 Uxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438371; x=1720043171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HfWR6KWS6ucr/I9LD7F4kz2B10LaGDv77CEK7PHDOoo=;
 b=AY9SISmNf/WJdEeumj3mPVSoEAuJMAkPVr5suxL2KPcxvYbRpowOUsSmH4se3GjSMa
 D+E5Vp2UN+ecp0TLvvSbwt0jpKpuHUlAj8h1uXOUR0UPoNbQ5ZO3R/ghFck6DtzIBqS3
 o+Dx3eN+zUPl11kPuoA7cUX7m+UskPl/4ssDyszZvzYg/7fEHzL+3MUsmseV7y+tTY1Z
 ds9ZS51xfPMpDR1CTex267tPEPjmDKc15DH7QqFdTgF6irEbi3k98lGlMzc1u1by6Fn2
 5Oy60FD01ZYgsxR6GtCj14PrVR461McyVNTlndl4GT+z6WeaJ0hMxHruskPL0OohYQu5
 /mPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb26+xJeiAuK3a1utdVXk6dUccrehPiv7aiksPa6NURZ05NO8jViBGswoDcbd6xXqSSqkfGT92tA4xbokDWOOqk3rSp2bRgDVaYWfHZeVs
X-Gm-Message-State: AOJu0YwznW5LRlOxsU0L8GMsxWRSx7L42mHUEG9xJQi3Hb2kFoseXeQm
 bdy1uBkgj3hbDzavhKzsolTlb9znDbWWfjXGsp3/nNLCkwrWcF24Is/l07H8/N4=
X-Google-Smtp-Source: AGHT+IF5HmzqsUb0uX9O8aP4y/jojDPZCn4mcXglqij0FO8WTGaY7pA2DKil9If9FRRFqC5rsA32jg==
X-Received: by 2002:a2e:a601:0:b0:2ee:4928:f01d with SMTP id
 38308e7fff4ca-2ee4963d43emr483691fa.11.1719438369584; 
 Wed, 26 Jun 2024 14:46:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:02 +0300
Subject: [PATCH v5 08/12] drm/msm/dpu: split dpu_plane_atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-8-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aCY13whvSmnJxORQcKDzMHt5c9aniKmeRabPxTgp1b0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwZZenh5Adjl9Pr+3iH1Ye7Y9hdziqf6NxXt
 6IrjrDAv3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGQAKCRCLPIo+Aiko
 1ZVeB/4ocPXRf/yat813LE024JXtXUaZ5ghLx7Q95P4e9Ze2Ifj3cJDfsq1lOQOV72swJFgCB0w
 VwsmeKH0E7MkwHo6xg69OL1tztlXxTisV44K4AsyfWWJqvHDvWzfY24SAuyXyMUVw+D1e7WA4oo
 Yih+7tW9mLrjjaNWW1q84v9XTIxN5BwNCUmtsWGop+113UBUzxtLCMWsfM243uSSb+J9Cq60DDn
 ZOothT6FVWNG8IkeoD4I1QqwkyB+Ac2I1YSGfEIWM0i5xeIJeUXNbH0J4gjlFvI62s++SJTv2em
 8MV5ZkSo/NlwU+34UW2Sr0zUCHbqrp66btqRj5SSyfQhUipF
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

Split dpu_plane_atomic_check() function into two pieces:

dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
without touching the associated pipe,

and

dpu_plane_atomic_check_pipes(), which takes into account used pipes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 178 +++++++++++++++++++-----------
 1 file changed, 112 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 115c1bd77bdd..9b9fe28052ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -788,49 +788,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 #define MAX_UPSCALE_RATIO	20
 #define MAX_DOWNSCALE_RATIO	4
 
-static int dpu_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_atomic_state *state)
+static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
+					 struct drm_plane_state *new_plane_state,
+					 const struct drm_crtc_state *crtc_state)
 {
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
 	int ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct drm_crtc_state *crtc_state = NULL;
-	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
 	uint32_t max_linewidth;
-	unsigned int rotation;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
-
-	if (new_plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   new_plane_state->crtc);
-
-	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
-	r_pipe->sspp = NULL;
 
-	if (!pipe->sspp)
-		return -EINVAL;
-
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	if (sblk->scaler_blk.len) {
-		min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
-		max_scale = MAX_DOWNSCALE_RATIO << 16;
-	} else {
-		min_scale = DRM_PLANE_NO_SCALING;
-		max_scale = DRM_PLANE_NO_SCALING;
-	}
+	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
+	max_scale = MAX_DOWNSCALE_RATIO << 16;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -843,11 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane stages assigned\n",
@@ -871,8 +839,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
-	fmt = msm_framebuffer_format(new_plane_state->fb);
-
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	drm_rect_rotate(&pipe_cfg->src_rect,
@@ -881,6 +847,78 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
 	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
+		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		*r_pipe_cfg = *pipe_cfg;
+		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+	} else {
+		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
+	}
+
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe_cfg->src_rect.x1 != 0)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
+	return 0;
+}
+
+static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
+					struct drm_atomic_state *state,
+					const struct drm_crtc_state *crtc_state)
+{
+	struct drm_plane_state *new_plane_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct msm_format *fmt;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	uint32_t max_linewidth;
+	unsigned int rotation;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+	int ret = 0;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
+	/*
+	 * We already have verified scaling against platform limitations.
+	 * Now check if the SSPP supports scaling at all.
+	 */
+	if (!sblk->scaler_blk.len &&
+	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
+	      drm_rect_width(&new_plane_state->dst)) ||
+	     (drm_rect_height(&new_plane_state->src) >> 16 !=
+	      drm_rect_height(&new_plane_state->dst))))
+		return -ERANGE;
+
+	fmt = msm_framebuffer_format(new_plane_state->fb);
+
+	max_linewidth = pdpu->catalog->caps->max_linewidth;
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
+					  &crtc_state->adjusted_mode);
+	if (ret)
+		return ret;
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
 		/*
 		 * In parallel multirect case only the half of the usual width
 		 * is supported for tiled formats. If we are here, we know that
@@ -894,12 +932,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 			return -E2BIG;
 		}
 
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
-
 		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
 		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
@@ -921,26 +953,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe->multirect_index = DPU_SSPP_RECT_1;
 		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
-		*r_pipe_cfg = *pipe_cfg;
-		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
-		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
-		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
-		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
-	}
-
-	drm_rect_rotate_inv(&pipe_cfg->src_rect,
-			    new_plane_state->fb->width, new_plane_state->fb->height,
-			    new_plane_state->rotation);
-	if (r_pipe->sspp)
-		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
-				    new_plane_state->fb->width, new_plane_state->fb->height,
-				    new_plane_state->rotation);
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
-	if (ret)
-		return ret;
-
-	if (r_pipe->sspp) {
 		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
 						  &crtc_state->adjusted_mode);
 		if (ret)
@@ -963,11 +975,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	}
 
 	pstate->rotation = rotation;
-	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
 	return 0;
 }
 
+static int dpu_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	int ret = 0;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct drm_crtc_state *crtc_state = NULL;
+
+	if (new_plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_plane_state->crtc);
+
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	ret = dpu_plane_atomic_check_nopipe(plane, new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
+}
+
 static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
 {
 	const struct msm_format *format =

-- 
2.39.2

