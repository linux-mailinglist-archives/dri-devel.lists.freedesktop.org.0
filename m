Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E2AFABA9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 08:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E687F10E412;
	Mon,  7 Jul 2025 06:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="adcq2dQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D88F10E412
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 06:19:07 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-236192f8770so16706405ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 23:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869147; x=1752473947; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
 b=adcq2dQCOMBEVMUk5kDZ0SLVD9q3f8yUKCjL7TqBUUAiPFImhkuoBEs4pH+48OH4OI
 FFWMWTPhfmvJXYA+9eXf3M0EiVDiQ95GDoCBYs9oQWaqzNYH0f8qUejzP4Aofc28Ol57
 I8Vl3Fo5H1UVfTRKLB0lXyxOZ+9mSGaTn2OSjwWr7SWtdOZgQPkEBaADAoDGHj3DDLJv
 U4AoxHTeMbqhiuSyiG4cvWhs9UkqH9Wu2x+eCSnZMI/vcB3UKetAmwC/rf8jvOjHivap
 q+JWU+xtI82lljCMANZ5Gx8IHvu1AvPJuzfBCApGtUbWeYvjVuIX5TyMnK4vG2lry5xE
 HqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869147; x=1752473947;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
 b=JsZLVd/nVuyWSnj0bX+/+x7NMdJe993hPDQQTMkOCKDsIlVcEO1CzmUZi+3sFiEeDC
 rz3oV0zzK37wk44X9YJvS9nCH1TyVX4aqOJfy1JbzhffTfnkhWdVDF95r73w/QX9x7aa
 MeMc8t0PpShoqc9GnHrrZMymQ4oHVtRGZEIbhmZYvbJWFqmAlWOY76nIGTQbm3Hb8kjV
 6oxd82RNGK95ezBdT3Gq9QToTShsB9/1e+6pMW4ft31cVlRDDfbQC8GotTkZks8BOxWe
 PR+KLm7y54Z/CinXAABvI96j+0exq1sIVa++EonsfR53xMs70omR2joLbeaCf16BHJyn
 FFgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWppkZZk+b2AAc7DeT2tegqx9HvTporgRjUG9tt/iw8xXp8cZDbFzID3bx1o+R2Kns6VqtG/ZzajXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxaeq+V1aW6KaERQoxskPCAJGdWBglD0MAHqfXU3UUJ+BWUVSUD
 vcvqZO6FjseoGrJuJqY5QXDzUhHliG+G28ITtpD3qCOPcQo70PBYNzYjDBnfTk1v6Ts=
X-Gm-Gg: ASbGnctT2T8o80IdTjRHGxNAuB7jS4z5cSCzUKyzNjA0EJd807DOsjwqBId5L4++jSd
 GHoOD44Fg6hWY4n/S0E3eXcZQdBsS7cLEx1MZc6KFKw0XuYiaH/yUHRZadCh5FqNv8lUj8q26+x
 0HB/GLQmJvCJZKGYRZK6McMiKAkVfrYBh00NOspHEQn5YRVq2bj91hmYHblXm5RFBrKlSUxDKq7
 0l0YNc4ZXpJEzAq9qxPlolcTblGEFFTu687ljPBm9Zpl+0xtLCpXRHlcEUO2Wg9esq1gH8Y4UFM
 hmaKIYB1ErkpyhMNCiWjAb8oIVCZWaTiE276ia/A0SgRjzzl/Rk2bUlzyOM=
X-Google-Smtp-Source: AGHT+IF0KghELWti7eAnoagzbwdIIn1DE9MqdtlCtyl50iG7cdctR6/FfVoLGdbm0IZghmiYQnDCAg==
X-Received: by 2002:a17:903:22d0:b0:234:1e11:95a3 with SMTP id
 d9443c01a7336-23c84b6842dmr178708885ad.13.1751869146841; 
 Sun, 06 Jul 2025 23:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:19:06 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:04 +0800
Subject: [PATCH v12 09/12] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-9-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=5682;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CF4TPmOyKCuR1vONvBUPDXaEUNdePxwbzP99ZGSmrmQ=;
 b=N4ahDdpG2ihiFC1g+IKZNN5WQUerHf+f6XqTqdOsvy94vavAWPgeRXS8L1jrF5o0rg6EeeSan
 gXQgp+zKLSlCQFG09tmb44YXBmCyycrVryBt1pFe7MSLQA9I+1ODnIk
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

