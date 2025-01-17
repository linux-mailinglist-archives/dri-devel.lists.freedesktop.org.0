Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44584A15392
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B490210EB3A;
	Fri, 17 Jan 2025 16:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O1Y2duj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B885310EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:03:23 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-21634338cfdso59388925ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129743; x=1737734543; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cOulllN9aZzFO446Lt84ogptCoA3FAWcE93Bj/EGSKE=;
 b=O1Y2duj5xgqP8EpFKMOx9uSZldrwa/XPF6w1tFzxxWjly6uxnuvsUHPygIYn2Rmmox
 5p8LRZe2GdiQlhGvWx5Oa736CUvkufQaCaJWy7x1kbAsdNegZPGhyCG9SyT8uPXXkkGF
 N0v9DuMTCw9CCWZ6H0Tzw0kH/MITYmsVpD6mWoeNRDhv+ydK/2MkqlqGu0YWZ7J2yPjQ
 DWArGnKm6MiJHj6/huvzSE4YuulmuJDVx4Vg9wqGWFHubD2uxgJg5Po7cFzLl5W7T/zs
 5rexCejbD+0o/y1qcT/+PeYLQRvsCe9ldhvgS/Dbqlc3CyLMEnXbDkznPxmhrxZrShYI
 ZXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129743; x=1737734543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOulllN9aZzFO446Lt84ogptCoA3FAWcE93Bj/EGSKE=;
 b=ESE5iNqa/JTtnpTG9BukbNen6D4BiPhvzaNYwujJZazTRz/A0IzUs/yQbeEb699vsY
 BNYnQbPY1Ds3QqrAMm4pM61ArN3vke8ylH4ELCeE1Tuhf//gNJq1rfq7VX3ejg1Rn/OK
 3MvPpbM/FuU3+6TpONV1vJwP+QLlH8/e1PLc5wmxoMp0ceRr8XbOiE+KnyV7mlCsOftn
 YiQsn+aC+BcR6enhCT2re2CR+m5Nlg8NEvp4Bdl9fFmyAOuBf/nuTXCKnkj+7vu+7jJ8
 g7XmvcOLy+Ou9e4b0zox9d7/Mwvs7lx8l7ciWTuOYzCd3f3OLM5rff1+g9nAEjLIiAi6
 DoAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx+ziVnrQ/LWZkA5DtC45M3QOTAgDCkMDHB5nu2pUjOF7H7uCqqNWXCKkCdyFV6L8OqJWzLUoMIYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXf7k628xOyDj71krmws/daAd4hyBUc5ZRiaf9mPimbxEue9im
 j+L/eTwY6ppFrNSGIVkR6xTBtyWwVIOzbR5Vtxl/Vs5lYZcI7cgeOecPGuw987Y=
X-Gm-Gg: ASbGncvKvkxALFpkf8TGjM4Z/o4Q0JAbp4nnknXKyEehy8PozyAFZ0FHEoUq91Itozk
 SjfM66jVMVsUqPQB94btq4ybg98YryKt035CcZCKc9N79HmRAgsKSbDtmeG5ld39Jjk2dQrKTz1
 u9lyjSYyLHQY00yufwVrBmyoHh+qIP5rEolZ90ClILJG8zHEtBD64K5zZW+Eq3VJMz8YzaEqkxU
 5UuJGUdn5tjqgAGWRHF4W/AUoBH1QRipihhtav7qsajv+sPzvE6DQ==
X-Google-Smtp-Source: AGHT+IHpuygeP4a3oblxntKAoJkuSHzCTb/co1je6xxoMOTx17zxeIbEsAukBbzSmaNPTXrbekg4gg==
X-Received: by 2002:a17:90b:37c5:b0:2ee:ab29:1482 with SMTP id
 98e67ed59e1d1-2f782c98743mr5030832a91.16.1737129742042; 
 Fri, 17 Jan 2025 08:02:22 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:02:21 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:55 +0800
Subject: [PATCH v5 12/15] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-12-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4804;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=mNnbVchZDWdr8Yg/YpTwQUIazQTVsbTUg2THmF3QLm0=;
 b=78hjrdHzB29udjI1uXAhjvAvBl1liprsGWe6tFMH4pkq8Aby2Yq0rMlEofTeRg69Ca1NObJj8
 jrzJOJXVfiuBwitXACcoo3kcVOlmCtvHOVXazTtr9leG1fBdjeEOFax
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
stages are used in the case. So extend the stage to an array with array size
STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 81474823e6799..50acaf25a3ffc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_hw_stage_cfg *stage_cfg
 				      )
 {
-	uint32_t lm_idx;
+	uint32_t lm_idx, lm_in_pair;
 	enum dpu_sspp sspp_idx;
 	struct drm_plane_state *state;
 
@@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	lm_in_pair = num_mixers > 1 ? 2 : 1;
+	for (lm_idx = 0; lm_idx < lm_in_pair; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -442,7 +443,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx, head_pipe_in_stage;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +464,22 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
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
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[head_pipe_in_stage],
+							   cstate->num_mixers - (stage * PIPES_PER_STAGE),
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +511,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +524,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * There are 4 mixers at most. The first 2 are for the left half, and
+		 * the later 2 are for the right half.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 5f010d36672cc..64e220987be56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1

