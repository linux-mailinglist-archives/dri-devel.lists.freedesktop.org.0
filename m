Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03619B18491
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BF710E8A9;
	Fri,  1 Aug 2025 15:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BFr/+nXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30F910E8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:51 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b3bdab4bf19so1833237a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060931; x=1754665731; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
 b=BFr/+nXFI/3DZ6oyV03QFvkcdMeTBld5gmZhC93avwmXeYm1uSFg8/Am70RaktAFNM
 rzLP9v67T+E0IyRug85+M9duSvZiZL4lhfmsGTbKU5mlRG4Lg2CWZCoGg3YiUwIXtQGC
 iDFZli0nCrmgvx81OLF66yDKBfJ1vNYqGWfXv70Vla5uduGfLWTVt1GmgZi/6d3SZjcS
 bIBMCUhtjjLIolvfzCegLnVWCXTId9JPueGX8XC+o8BmzJvIIIFgSRM/glN6RVnZfGqC
 CNMaSDEgPRLjRkLUtIqjOKF8kAfcg2C+aI2/C7O9I3r8OkKXpMB7gI4mrTqbik2syr5h
 t/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060931; x=1754665731;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4X9gMtrXb7FnTuL7OxdpBsAZ9YfPLCWw/9fwnW/EYKc=;
 b=TOmbqZGPEOHlSkd9aC1/WvbSCxREi80KQOPQ4jz3DTe67Sk0LeDnnoqrgPYwK81AmF
 MaOfAVi7o4VaLaF7+v0YdwNUqvgWnQFRa6PLIqmwIZMM9JBZzS6NwNlAHo3yFhbaRC5k
 LfF4SnLiaZFZrZctG1LxxFipChpX7tm2ixsLneiQMwjT4cymDDldD6VR8orrOO8PlMHF
 UA4tg2BuTzprbJxXvi9zyEHdZlKAPHKjTtS18IP9gWuuMpmLI1m9azXavBW7wAUCwBxm
 N/O0H91bct00Pf5Ld9HzCihPEGSkcqlH7rqhA5K394UT+NjTXMN3BYIe4YwwP67S57kx
 dbBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHyYVtuQLWb1fELinM8J9FEdcxb2p5gccE+LJbbb0q0AInOro9q4hjBPaHOzH20TVo2QhwwK9hTlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylZnky6DLxnCBquHF58Qlx1B8IF3ZQ/L4hGOKGaTvLd0j+Wj9j
 /uw1Ig5dA6vNpNbiiGgkznNm5lgdE20ehVekC0Td5UOuLMZnwaTobSmi0I6RMbjRLKY=
X-Gm-Gg: ASbGncsw7Y9+td1yHDJ6oKXNqvtUYl/pOkJC3xC/wA2fyYvMbhuhUS0tiIF07q0aFti
 tS5DJ9N4LOhQZN4BQdbwB1E+zEvgVyPhiPq+Hfa/t1cIvudThJzqPAq+rVRMnwi4jTUKmUgDIO1
 kdoMSZtA39GJSm5Mp4HNCUZClMHUZDnorjPhMCd8fiavMbKOsK/Csh6g+X5uDP2XyuKMWUvRV56
 LZq8GK113xq419SjEJA/ioUqrpAzLIy67gP9z2qXzQ2AN/LgrTUanS+f0tJnLoHqrJ5vc5ZjmX1
 I+F2ooRAa+QoZv1CacZ6vLy9R6QHRP/L6CxZZoFPnQp0MDdAjqfMtPHtIwdGlDBzZvEh+GM9047
 YrFb/f+SkRD7DhGJdOw==
X-Google-Smtp-Source: AGHT+IGE0kyspgqFHJSMZn3T6Cy17X8iDSC/ePImTcwnKhgqMsgy0USzP1VOri1Q3pYP3oL/oHtc0A==
X-Received: by 2002:a17:902:d4c7:b0:240:4d19:8797 with SMTP id
 d9443c01a7336-24096a7d37bmr169988725ad.22.1754060930899; 
 Fri, 01 Aug 2025 08:08:50 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:08:50 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:34 +0800
Subject: [PATCH v14 10/13] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-10-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=5682;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CF4TPmOyKCuR1vONvBUPDXaEUNdePxwbzP99ZGSmrmQ=;
 b=4NtN0lyCa7WeArznPw8dYtFLqzK/efwKlVC/tsSP9iuWrSvkcjCmjMnAEPJ9q0GZWgHWWo7dx
 L5gCLwwQdOICGvckADhzRLjEg5RHNGULj4y/LB4FAWQGiYealUl3lnw
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

