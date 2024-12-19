Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A499F762D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9534F10ECB0;
	Thu, 19 Dec 2024 07:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yvHZbs1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6C310ECAD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:50:44 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21644e6140cso4529205ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594643; x=1735199443; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ENyMFx72ZbBjFc06s6EFkz2rNCIxTdMxqvx5v8cSqvI=;
 b=yvHZbs1mk3lc1BK+GCAVu67sB+SvgBHRb5Rr4uH0XOAh3PjsR+wOHz8P/QwAWiaa+T
 5a6Sj9fwfumFbakxF+YZ6S/1Wh9lROfpJmU0/4hNeChgpyPp6UT+vmFqOWiBZWzTM43h
 jwjUamD/1a1OGPe/Yg3JAMMHMlLRjOQa/veRuwQzKJ8S1DbYVnvTh6u0I6qTDguiDsm6
 5SLEefCth+XxTUGil5a21rgp0v74QkDrqCrZkDL5GXtwEyKnTFCAW1/R7ZutYOwRt/Ui
 xwBIZOWf6pn0vYV4f11458t/MmIVdnw0Lc5DR00/YcRnAbYqD2fCGUfqCLrDreeWzFEi
 EDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594643; x=1735199443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ENyMFx72ZbBjFc06s6EFkz2rNCIxTdMxqvx5v8cSqvI=;
 b=ujkVH/w+/4LzNZEfXkXr990i0M5l7qL8SoEK4n1GXg6ONly8uTw8DIcc6WhNrIFVkQ
 iUAlWK1TJ2jB+N2dCyCDI0AqMf4IkFnbjpuU8s0BHkHc1qPKirpTu3MYNpM26FQ3dHPL
 Rkcn06qCybvRZdDbUtV9YvznxFzDRmhCnqOM68l4Wlpv4BQ4WOiDzg9Hmhcj/Zh0od8s
 2fA3Z4WBQo1MYA0HKhiBKr4Kj53tfC0ywK0weUVqYpy+TGc/EzjZlP0+KdSni13dhBdH
 TPND0ooPfHPuRYPnH4DYjbCCIw8+iO9SfyS98tMTMpG7vwBibavXkIUlCFT7joQjxC16
 1QPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMNgzXw0R/MpDcKjX0s/NKi8e/V4C2W7ZhHFi1V/4GTYOQol2Sha+kXM3umiq39WNE8AtGJhuHMrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFPPz4Fvlhv0IotxNg5Loi8/MzHNBRngNfV2a5BzoOpRrtzeLt
 th4gS6yIfRkmvA/aaELF6OtjZvSFG8RSMhXeeLTUBMoBgsGXNNAKNhcdvKPgang=
X-Gm-Gg: ASbGncuhT/fyuWZlcSBPbW3uvdwBDY4pojPyH7mJlW4NY+Gd9wp1pVmnjWkTJiPANUf
 Jc9WIF2NI84EvhRWI6ivlUNj/QuLbekAHivFQEGMpC/HjAauoosHflI/Gnn2nkQmn6hNslIAlbA
 cnC5yRRuWd/91tkCGuiZS17EhhJ5IBPk1HD9CAC/daXglWeek97TeZvn3fBqrauPYB/8GH+IL6O
 RERnMIGwyIRnw48dSO8Kx2/2JTWFS+uv5Ay+7bUn7S+HtMdBiNLwg==
X-Google-Smtp-Source: AGHT+IFmpHu4d1IsZ65VlCxjfUI3RfnJ3SyPUSxBWEEQxMEDM9PoBBmloo1N8vMAb0BH43O2dSKsZA==
X-Received: by 2002:a17:903:2306:b0:215:b74c:d7ad with SMTP id
 d9443c01a7336-218d725f86emr101088515ad.36.1734594643625; 
 Wed, 18 Dec 2024 23:50:43 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:50:43 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:29 +0800
Subject: [PATCH v3 11/15] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-11-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=3915;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=oxfzARhHE0/oq4CY3TryYx9jMpUF/fTBmG2EofRgAt8=;
 b=4VJ/vrmSv8023lmyh58C9GHrKJCLCtsc079xQYjNxU1PjwMNPdtal4TXeYiH+XxluBWXIBxv6
 cio4O+HUxoXBoQdmaVODcZCYQp/364gkSdqbwGST3Kpk4tPOKgqGnzG
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

Blend pipes by set of mixer pair config. The first 2 pipes are for left
half screen with the first set of mixer pair config. And the later 2 pipes
are for right in quad pipe case. A stage structure serves a mixer pair,
that is coupled with 2 pipes. So the stage array number is defined as
STAGES_PER_PLANE.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6841d0504d450..6ef7e6ed00238 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair that's served by a stage structure */
+		for (stage = 0; stage < PIPES_PER_PLANE / STAGES_PER_PLANE; stage++) {
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + stage * PIPES_PER_STAGE;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   mixer, cstate->num_mixers,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +521,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg[0]);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +540,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * There is 4 mixers at most. The first 2 are for the left half, and
+		 * the later 2 are for the right half.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / 2]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 68867c2f40d4b..27ef0771da5d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -32,6 +32,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1

