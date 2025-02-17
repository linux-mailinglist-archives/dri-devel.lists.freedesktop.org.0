Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580ECA385DA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF3910E4E9;
	Mon, 17 Feb 2025 14:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qj1DsiiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71910E4E9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:18:03 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2fc1c80cdc8so5906254a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801883; x=1740406683; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9bsnor74CQhC3dm1vS3cAkcfQD0HtQ2hwGtKG/dYKq8=;
 b=qj1DsiiIHuNpcREQ5Egq87FI7hS7NLLEPLltV11fr0yyPrFjk96bs8sQD+n2hW+Ima
 p4kSRNnjf8BmOqxAlXuE5BjTUvuQ+hqtsLAZ+34/SHoD75rUV/5hcjwCFRDdesn6kzfm
 sciszBYIjGL4t2gJzDVsSe9wGb0CX4Lk7wEfpQy/m6T+95g+u40G5FR5oj4te9h1YFfs
 OHnwVOohh+Yn5HaSl8nFgrSJRWW0H5VubT9Dl0vmnvBzb5bjKccNuzVPwcV9JC4krt78
 vyXov0UBDWnthApEA/XE17gd1qvw8vy/Q5AymJnrOKnEI2kaI6Ptf8l8qb+y/rC+tGtM
 PqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801883; x=1740406683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bsnor74CQhC3dm1vS3cAkcfQD0HtQ2hwGtKG/dYKq8=;
 b=Mlo0PNL8SeAEY0HHxWfo/hftkJLfdrrH4qLe09CoVDs2g9Httz/EYT2NT+l5YH5FOm
 Y6wj8QSrf0Z0xLpr6zFhcG/WcZJRhPb/KuJpZQsv9uHmHF5/C1oqyL5jrk/rXNWxg+Tq
 4wsVpvvate3ICf2h/J6AiwwG3gPQIepIgyg7Nj17u6dpkuGDHPdK0Xn23huLAbMboymv
 wRvS/TaLSr7ycueLyWrPc0myIP294pgZUorEgTCbZS2SHkQnFQ1SKENTcn7JscoISXhX
 J7M29EDPr0b+/pj2FsSWEp1nlhJVS7B5ZFLJDwFDqr1//potnJiBN6vZFgT6ddb5yMyD
 Mnjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/hZbVxQIQ+NZJefGYp2JW9yER74gYBXxZqAMBrrUpeDkm3znnp1yiHvra0nsca8bBK2joY/BfXY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7Rvfcin3N/29sarvAqpljxASsfILLAMAiAteppCIWgsiCYa0i
 bka6lo33NUraN42+1TauRNE+4PhTGICbPpYWBsdxE2Ca6Im+FPv5W0tTaZhVio1+h4bhWE5mHdX
 9iCaHNA==
X-Gm-Gg: ASbGncsgrK3ECwlrxeQx1MEsPFqRu9qw48OFoxLpcKpJxHJ8T7+UT+rEv/VBwCszk9M
 0FV8HVs9zVjhKDWhSeOgsQWncYgAGNBkzATHg4OPdOAz6JB/joLAx+zUmvd7xuTJ41xh01LQdvg
 FPHlws/SpnkOeuy+XxXxVTA9p4HFe5QKj3+TZ7lPRMA8b/7jH3Pl7fSPdqfHf6/G98ZiRT71RGH
 xwAOWI1XVfLdmt73cpbbcAzeRyEeLng4ogcqzliFOJWySTTwTl09g/Toi1vlyxCmejr2eAhtuSo
 1Vhl6vZBkvGP
X-Google-Smtp-Source: AGHT+IFJ/9Ln4TwrSqudr9CAmOr3hLNQnzqL5uAlkzh70visApKWFl7N8wdmJkJczYPFDyU6ThqvZw==
X-Received: by 2002:a17:90b:2d8d:b0:2ee:cded:9ac7 with SMTP id
 98e67ed59e1d1-2fc40f23484mr15503162a91.20.1739801882505; 
 Mon, 17 Feb 2025 06:18:02 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:18:02 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:16:01 +0800
Subject: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=4912;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=za/TOFi8Ltkq/gvZgJJVaOFS39iYDTLgxFY68FFY8wE=;
 b=C7E1sah3ieMMpeE1ANh60+/IurCFbYXHxwXfnJio68TiqyBOEpkITeLJFFx3ibfd5qr2sGquR
 UPyVMlAY0NOAoNWEAg9Ts/VZNhW0IImF1gtu5l8rZnjKy6zclvOlabG
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
index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354faaa816fe74566784844c 100644
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
index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d02074505c5474a547a814 100644
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

