Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8FEB13B31
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 15:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486D010E519;
	Mon, 28 Jul 2025 13:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lAcX+NgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331EE10E51C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:40 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7490acf57b9so2908307b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708540; x=1754313340; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
 b=lAcX+NgB7oXG/oE4Xi+nbCSY36Bg1RoxOu1U5pSYQzG5a8vQFmB+Yg1KvIfRmIc6ki
 ZP3uTetpWbbu1ZMR8vfFJAiBVMUtO9mJwFZxKbM7Y2nPwib1MqG7q4ojftnapJR2juYs
 5J0LWe4jGzLiAW3oIDKzxavXWs+QHpt2OqZjDDuTeWF6ZLPbrOBLUcv9z7IJew7wracV
 NmNDZc9OajFoPYQm+jiagJHd2iBN5mLyAmnQlcXBM4FOaGrk+8dFnGb92iwOv1bwEzFD
 d6xFf2UdSLe3GkQ2p31kif/MTPnKTA2CxpziVmBSCO57i6UlnCm1iK5TeuAGeMeCVnze
 fTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708540; x=1754313340;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
 b=AoxN7ycuM6+coeICrOs0Z3kKhdjehi61USrch2D37su68Su4/l6xfGgHyIblArx6Uv
 5QSzmATQZC0RbF6ny5pWNOBEENUamVF9wgKzZYV0iq9JoOJ4bp2+uJL/CqdBru9Y+p8W
 ZZfg0OGioqBGVZ7c+m1Hr7UYh+bqJ/0XssTvvxD7eIbCKUvmdYtKvW7JjW5Rxxw1UmPj
 YuLldrdEKLlSqFIKdeEzwSIeLfLavMJNF6djTz5ohOpWD7gHXt7ZKmLr11LlaSlnOIU3
 /Wqb7D16O6XwItb4pnMtQrkGlzuadQyztrorbZgNC3yS+uKaDHCwjZuISmKPOANFc7NL
 Jg1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX30lg8zPaNEkIRyavZruxiyCwHsI/b16E6F47L5XMR4kmWFRRcvLDygMcR1GOsZ2VOX7spCY2QydU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm8z/45WrBVRXEt0tF0ZjARt4tSf0dbDGJGJYjAV9SusCXZrX1
 SvekHm5tTRGfDpxbmF22W8FLPYeXaVP4CETZZ1W7caHI3URtWgKxKoCxXivq73UTIeY=
X-Gm-Gg: ASbGncvwKHP7m+doPYSyDFCgO7pZ5cO8i+ryWFGolOKUq5mxb8Yf7Dmzl8fCYuyMrZZ
 EpH1Hk5Gu6/bsZkwbHmQNlW9RovAmqywyx7F67dKeju3W4K+70ehTtDaifdNBcDeyP7n3jFVbla
 5YPP02FxP2ISFYM2fhDnAZXi6X+txoIubXMsSQW+IcN4eEtCR8mACqCz90aTk4W5CJm7sqHooye
 9yDa2uBWwqs9KrK5VvUsTv8xTu6njIWNahoCn8otL9ZRVuhrPaETz3DwTCFNkDa9XyLZx9mJZyk
 6G6K818OJ+wd6khYrDOiWboCgNX44/wus2S/QHsgw/0ifpQ0RBnhMDZ4JYWI3PycSZJ3R8zHPeO
 Oy2SCWFLgwpAfsgCadA==
X-Google-Smtp-Source: AGHT+IHEkSAYyjZT4VNq7APpGgYHFTvAHWKfzG/ELkQoEDWy4X8OiOz3JWfDKavY/t9jLc7fjIEXjA==
X-Received: by 2002:a05:6a00:4650:b0:730:9946:5973 with SMTP id
 d2e1a72fcca58-763358483d2mr17156091b3a.5.1753708539621; 
 Mon, 28 Jul 2025 06:15:39 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:39 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:33 +0800
Subject: [PATCH v13 09/12] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-9-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=5682;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CF4TPmOyKCuR1vONvBUPDXaEUNdePxwbzP99ZGSmrmQ=;
 b=AqyfvXqypj2NxL0MC/YtWgC4WgzNfT9Hsjf83uDvjhK/TGjgIQbWsD2VuIJOKPYNAT4KhKQrZ
 VC9sXNk2RH0AWqQx3F/m3xP8LLQuhgK4WitOhn9GeRkvqtCYVP5f2GL
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

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array
size STAGES_PER_PLANE and blend pipes per mixer pair with configuration in
the stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 49 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 +-
 2 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 30fbd7565b82c6b6b13dc3ec0f4c91328a8e94c9..c7dc5b47ae18ebd78de30d2a0605caa7dd547850 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -400,7 +400,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct drm_plane *plane,
 				       struct dpu_crtc_mixer *mixer,
-				       u32 num_mixers,
+				       u32 lms_in_pair,
 				       enum dpu_stage stage,
 				       const struct msm_format *format,
 				       uint64_t modifier,
@@ -434,7 +434,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	for (lm_idx = 0; lm_idx < lms_in_pair; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -449,7 +449,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-	u32 lm_idx, i;
+	u32 lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_pair;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 	DECLARE_BITMAP(active_pipes, SSPP_MAX);
@@ -472,16 +472,25 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
-			set_bit(pstate->pipe[i].sspp->idx, active_pipes);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
+						  PIPES_PER_STAGE);
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, active_fetch);
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, active_pipes);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[head_pipe_in_stage],
+							   lms_in_pair,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -517,7 +526,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	DECLARE_BITMAP(active_lms, LM_MAX);
 	int i;
 
@@ -538,10 +547,10 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 	memset(active_lms, 0, sizeof(active_lms));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -562,13 +571,17 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * stage data is shared between PIPES_PER_STAGE pipes.
+		 */
 		if (ctl->ops.setup_blendstage)
 			ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-						  &stage_cfg);
+				&stage_cfg[i / PIPES_PER_STAGE]);
 
 		if (lm->ops.setup_blendstage)
 			lm->ops.setup_blendstage(lm, mixer[i].hw_lm->idx,
-						 &stage_cfg);
+				&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 9f75b497aa0c939296207d58dde32028d0a76a6d..e4875a1f638db6f1983d9c51cb399319d27675e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,8 +34,9 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define PIPES_PER_PLANE			2
+#define STAGES_PER_PLANE		1
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif

-- 
2.34.1

