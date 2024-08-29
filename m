Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B1A964167
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CEF10E63A;
	Thu, 29 Aug 2024 10:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UksSNbHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983C510E63A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:21:30 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7142448aaf9so327866b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926890; x=1725531690; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r8DI7ikA88or2iDAK3xOlBJ1PA1zv5oIPqzpNTVoeMY=;
 b=UksSNbHHmSX4Ybk40e43qt9j6qHM8O3RACr98CEuFqips3REzWDy32H89GAuFhtBt9
 oo0JxPdoXqfy9igNqYhYIZd7rSpjyMfOOT4HYIFDaYtQOvG/6YGiNYnfzJl1wl8sL8aY
 k+k2yxmB/jvAVY0ttoZ5TJZdKyIDS+3OFb5HIqeo7ci2TQ8N19Tkt37jBRLOnmxT5b77
 mR+A4wB0vYjo+xACfhMC9DDig8r1pOsg/io/l0xuNA/jWEcQcDZWkDDhpf7K5fnSVUfO
 UPaSa4WxfxzeLNd7wXUu+FiTeY9CuqYeQXqm6X5pa5lYifTxL44QV1Vpyc35ETS8C/s4
 8udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926890; x=1725531690;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8DI7ikA88or2iDAK3xOlBJ1PA1zv5oIPqzpNTVoeMY=;
 b=ViXYl5C3SGeGVSPOmvS8VpyYx2SDb2+0CpgvozSgMNHdebrb+irQ2duCE/EwYTdwxj
 xNdn5Ay3fenlosTkNEudWnIO9fDONzpyByvWB4G8z7MLxTGxbO//yLSOzDCYMzN7gyYj
 jDzaQTDjk2BisaifPkRtS7+KojbEOG6p/3C2ZRug1Y63mE02aWlCiJkE1cmq2q3i9cty
 UsIdO1BYF11SjQ6zRdZSJ0UgnaMRGPuST8irCyHZqMpkBaCECwYCuoRWPkC6HqbixIY/
 R9Ojl5IKRkgF8Zh1Ci8H1VaGLGdLKcOX8aya+vV0uhF/ZpbztD4ohV+SSe69KGuG1Xx9
 9USQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ebyi8V4TWkc/Gvz+e82dA9bj0EDY/e9I1jHe9ptDHCuei2g69GX6Se+eZhGwuryQS7TMXTp0mHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjVCZfVcXoIh8VnpV8gj/h+803krmTPS7zeE0/xucoDaFhlnYa
 cXz/BghbqNhiLirw8ULsRcCTa5X7RLD1smAAlCQ8UO3EDDT9VpQ+C2ifDEQ8iAY=
X-Google-Smtp-Source: AGHT+IEcTRkQ5ZzVXvod6iAZFqWooirDADbwt3Jr/PqEsTMQoqohkuPi28x0O5nZR5hpkrLnnYZuuQ==
X-Received: by 2002:a05:6a00:85a5:b0:714:2336:fa91 with SMTP id
 d2e1a72fcca58-715e1046500mr3379581b3a.14.1724926890039; 
 Thu, 29 Aug 2024 03:21:30 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:21:29 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:46 +0800
Subject: [PATCH 17/21] drm/msm/dpu: setup pipes with 2 set of stage config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-17-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=5154;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2p1+0sprLK6BeoqG75+2/3BJRBQEnZgiwY/ji6q3SdA=;
 b=H9wx3GYWS3rql7lX5rfVbEbl82Qcbjc7rs6cMYTyW+Phj7Uod5o3sipnk1tae3jS/Pk5YH9IM
 J4pqV5DA60hCdIOVKl2pnC50i3UFThlz+hG4URucuJqZAHwdFyMEuMm
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

The first 2 fields in multirect_index and stage array are for the first
SSPP and its multi-rect. And the later 2 fields are for the 2nd SSPP
and its multi-rect.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 76 +++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2c21a1e13d32f..3b3cd17976082 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -397,9 +397,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       const struct msm_format *format,
 				       uint64_t modifier,
 				       struct dpu_sw_pipe *pipe,
-				       unsigned int stage_idx,
-				       struct dpu_hw_stage_cfg *stage_cfg
-				      )
+				       unsigned int pipe_idx,
+				       struct dpu_hw_stage_cfg *stage_cfg)
 {
 	uint32_t lm_idx;
 	enum dpu_sspp sspp_idx;
@@ -410,7 +409,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	state = plane->state;
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
-				   state, to_dpu_plane_state(state), stage_idx,
+				   state, to_dpu_plane_state(state), pipe_idx,
 				   format->pixel_format,
 				   modifier);
 
@@ -422,8 +421,14 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 			 state->fb ? state->fb->base.id : -1,
 			 pipe->multirect_index);
 
-	stage_cfg->stage[stage][stage_idx] = sspp_idx;
-	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
+	/* Mark sspp[sspp_idx] to be blended in stage[stage], pipe_idx decide
+	 * the SSPP is blended into which mixer. For example, SSPP 1 goes to
+	 * left half of screen, then pipe_idx 0 and 1 shall be set for sspp_idx
+	 * 1 in quad-pipe case.
+	 * The operation is done in dpu_hw_ctl_setup_blendstage()
+	 */
+	stage_cfg->stage[stage][pipe_idx] = sspp_idx;
+	stage_cfg->multirect_index[stage][pipe_idx] = pipe->multirect_index;
 
 	/* blend config update */
 	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
@@ -441,8 +446,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
+	struct dpu_sw_pipe *pipe;
 
-	uint32_t lm_idx;
+	uint32_t lm_idx, i, c;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,20 +469,48 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		set_bit(pstate->pipe.sspp->idx, fetch_active);
-		_dpu_crtc_blend_setup_pipe(crtc, plane,
-					   mixer, cstate->num_mixers,
-					   pstate->stage,
-					   format, fb ? fb->modifier : 0,
-					   &pstate->pipe, 0, stage_cfg);
-
-		if (pstate->r_pipe.sspp) {
-			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->r_pipe, 1, stage_cfg);
+		/*
+		 * Check whether the SSPP fall into left/right half of screen
+		 * via mxcfg_id. The left half is the default area with the
+		 * first config. And the right half is with the second config
+		 * in quad pipe case. The SSPP for the left half always come
+		 * first in pipe array.
+		 *
+		 * For example: there are one SSPP for left and another SSPP for
+		 * right with a super wide plane in quad-pipe case, with multi-
+		 * rect mode on both SSPP. The pipe index for the 1st SSPP are
+		 * 0/1 which goes to left half with the first 2 mixers. The pipe
+		 * index for the 2nd SSPP are 2/3 to indicate the SSPP will go
+		 * to the right half with 3rd/4th mixer in 4 mixers.
+		 *
+		 * If a small size plane is only on right half of screen in quad
+		 * pipe case, there shall be only one SSPP without multi-rect
+		 * mode. Then only the fisrt field of pipe array is valid with
+		 * the config id to be 1. The config id 1 indicates the SSPP go
+		 * to the 2nd half/rectangle of screen that clipping with the id
+		 * in dpu_plane_atomic_check_nopipe().
+		 */
+		for (c = 0; c < MIX_CFGS_IN_CRTC; c++) {
+			u32 pipe_idx = c * 2;
+
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				DRM_DEBUG_ATOMIC("Checking pipe %d visible %d, pipe_cfg_id %d vs %d\n",
+					i, pstate->pipe_cfg[i].visible, pstate->pipe_cfg[i].mxcfg_id, c);
+				if (!pstate->pipe_cfg[i].visible)
+					break;
+				if (pstate->pipe_cfg[i].mxcfg_id != c)
+					continue;
+				pipe = &pstate->pipe[i];
+				if (!pipe->sspp)
+					continue;
+				set_bit(pipe->sspp->idx, fetch_active);
+				DRM_DEBUG_ATOMIC("blend pipe %d with sspp_%d\n", i, pipe->sspp->idx);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   mixer, cstate->num_mixers,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   pipe, pipe_idx++, stage_cfg);
+			}
 		}
 
 		/* blend config update */

-- 
2.34.1

