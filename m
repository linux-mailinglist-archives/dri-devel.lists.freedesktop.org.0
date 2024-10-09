Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2BC9963D2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C949C10E69E;
	Wed,  9 Oct 2024 08:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c5FfxcAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F8810E69E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:51:13 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2e109539aedso5474639a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463873; x=1729068673; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lGPiijXBHhXZLgDLI4yCnvpkLyy91sdQEmrQWlXpxFs=;
 b=c5FfxcAr/3nLYOpBYXmiYcFSr6+ngse2GQWHPDZNLjnpPCBDsVkWXwbnPtnm34f+LH
 c2JLG53PasgsEDthL+I8qlC+Npy98jS4Y30MsEzmoVG2leWDQvbh8KduUlnzt2lqzCJh
 OsoMFcSwO//EEajjmbAdKgUjrKcvES9wTGijsv20Q/n+s/Lq27Of1uOjCJGGm0TTkumJ
 smaRph5uuP4jSWM2n5UVS4lgLBeihKqfedwFGBzpezZPCqiNaZA75yEFNNrGCyZ/kkTo
 ldKuvgmWy1nWqYekpFEzcQ29XFptf1vba3rmBwl/yMcMZBkV01eLePyAgircaCafdBQr
 3SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463873; x=1729068673;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGPiijXBHhXZLgDLI4yCnvpkLyy91sdQEmrQWlXpxFs=;
 b=YL0nErZIfBqXXRnoyxm+3s/wsHdZL3jk2hiOJGGTDRAUW5/wD58nWyV1SVwT72UVLk
 EYFiK0nHmPRoegjQHvvgYjkqCG6KWneCZqheyyn1vNQ3Dc6Zh2+1XBUfYnQOzfmJAF+/
 CMoF/rgR0pY+ni45f0E4gkLlp2eTrKg1ko1Kcx1KTOl/3rWDrugoHQC4jxKoF330Njct
 M3urUKkne0p47l78/0kCOV7YfeRZexUZQLm9jAN+SMgrgb+KqN2RBRuPE9SJb+9W3BpN
 CUfmCVrXLrsQ1f3kSWZgGpWTbGD17qGnp5C8jRpkrXAvAtytQ1+tBWT6TXZEoo5xo0wL
 kUtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLaJqqCC9Yy6n6RfnFBLdMli2XkS1LwqsLNBjL8Hn0UpwBVNsmbavPLzwgLafBvqK03fZABVzF+xw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkDouZNI0k13pU9lq3bIhg6hscjv6XUFZ1rKTISQg/XEjjndkS
 09CqpXcVn3RGgyDtI/j0oEeWkjFqWLSa2JowyLaeL7x3wwHIgTbJkSe6RMpAjG8=
X-Google-Smtp-Source: AGHT+IHrjXqIDxYCqwvHmyuAo/2KaTwbzzxWXLOebacPfVE93Zx+pXmlthJkNcFwtHdZDvlnIGicew==
X-Received: by 2002:a17:90b:4007:b0:2e0:970d:e37e with SMTP id
 98e67ed59e1d1-2e2a246d989mr2280624a91.21.1728463873256; 
 Wed, 09 Oct 2024 01:51:13 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:51:13 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:22 +0800
Subject: [PATCH v2 09/14] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=3761;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=vJuCxGkGWnTz/P7Gtny2/1VxQGiyRWGiMV+/Rk64D/Y=;
 b=1MAjd3Jvkinq6GMa/Z1lrF4XLcay/hBv+mExg+EKDZlBZS5b9WsUnciLcQv8VCirNsVEuE42e
 uUJS17Cr/0cCekZocENT5LBgQ/bZiJecz/rUoIPmrKAEUZGAwKJUYSi
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
are for right in quad pipe case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 43d9817cd858f..66f745399a602 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, lm_pair, i, pipe_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_LM_PAIR; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair */
+		for (lm_pair = 0; lm_pair < PIPES_PER_PLANE / 2; lm_pair++) {
+			for (i = 0; i < PIPES_PER_LM_PAIR; i++) {
+				pipe_idx = i + lm_pair * PIPES_PER_LM_PAIR;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   mixer, cstate->num_mixers,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[lm_pair]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
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
index 3277debe11689..d8f5cffa60ea6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 
 #define PIPES_PER_PLANE			2
 #define PIPES_PER_LM_PAIR		2
+#define LM_PAIRS_PER_PLANE		2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif

-- 
2.34.1

