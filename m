Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38D4A385DC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0DB10E4EF;
	Mon, 17 Feb 2025 14:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HxkZRoLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3464A10E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:18:11 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-220ca204d04so57765185ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801891; x=1740406691; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+84HgPlIvBKwxhkb6I9ELvGb7NzlKgnjKlOyPCjS9Kk=;
 b=HxkZRoLpF2WMkvfEEaphEN4dtnR4Um2jtN/VTQx1iylb2Ojz0v7MsH0fAWO8HLDTgM
 4P2xBZ7krJFpIaHLgPmb76x8nUR16oWof68vz1S1Nn13fSiau1kr7Ihe/ISsWPb6E6Px
 vdSlxgfpkXHZaqnc8I9b2pOz4+utnz8vKWuzXMNwezw8AtoYbZAs6BfcWfAVLQgp1NYC
 i6Z0qeicPY3E3sC1Of5UqZ47GvhhhcPMs6BecWNAwI6MstQyP63uzA6gInI2ttnOAZfP
 UxUbp2J4+icX5jM1cJFJ7XQdyURzZPBxLZuI1jZvuMqbZq51jTaJvlvO0COyZVdG4Wl0
 yeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801891; x=1740406691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+84HgPlIvBKwxhkb6I9ELvGb7NzlKgnjKlOyPCjS9Kk=;
 b=wuaETIbjfCFaX2STQZ3T6WXhgIoBwxsOoitLztd/x9Np1qfqZUfgViTd4ZnE4GTKc1
 0Omr5l4uz21Ia9eJpiPpB9TpGp3eA8miRhZUjNKhYr3VqeQcwCU9SGoSBdCVHTV+KTUC
 ibliaRg7bjrg8N8trjCUTtQzMZAk+pukci6+2bwjrs7a3t3oL6Ctu8F3IhyXEhdDf788
 mcqGk5dG9ry4H1AEUBtx0DgoKERx4LDI07T5CMe3PI3PteajCfanyPdtkDmkvZVKH+18
 qiXgF438meJMZ3CT8mm2N6Ly9Qx6jF8maOUM7sIpGTL5hDZDrj5HffwAwmkH4Pw8C/7H
 /1ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGXw/PY6b2BcUO9UWIfhWLrPovaYSA1NDcgCxvnDnRY5MvjpbP2ulFeO4oAT+CFw/BuspJOnzw6A0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhVRfdBxhNTH3Ww976dP3UKOEbHxD8T9KT+kjXIcDbF2ShLzyX
 96U7iIyjqhfzOx7udjgXrHiAi0Il3rDoi1t3pjaunGrAotkVIeWw7CfErwVNuNY=
X-Gm-Gg: ASbGncv//Tf8szRR1Suo0RNTL1xBZTU7PMW/mMPu8R98MvebWKHYYbIUl2+v3alaVpJ
 rmLDh0F25GqreVB2ZDljiF/iptIUUMHy3aluPzbyfSxjQpEal/n9dwoRKamIkhNkVqAxPlV6OR3
 DBSf+RngzvHaI/tKaw8cXy/3OqywYcAx1GsxUnSLzNXAGAVCuI3sEcEA/1V/nvHYYQbkV1Trj1c
 c4yIfnTsGnsKEp2zODONSajrZWVPV9iWmLyawTnoLCoEIRFpqH5Z4yDMix1DIap74acwsyqYm1b
 1YBWEmF7197Y
X-Google-Smtp-Source: AGHT+IFXNtZ+5TJKSeoeqvx2/Zk1qMDod+K/e9CgiVIH+8Qg/bBnmV4JIgwavR0yVflf7Ko4ZwZPaA==
X-Received: by 2002:a17:902:f547:b0:21f:53ce:b2e2 with SMTP id
 d9443c01a7336-2210409af9fmr134156335ad.45.1739801890768; 
 Mon, 17 Feb 2025 06:18:10 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:18:10 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:16:02 +0800
Subject: [PATCH v6 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-13-c11402574367@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=4059;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=7p8Cf2cc/bnE8b/fucvAxqQfmQCibLQPXtQ8uTs5zao=;
 b=gfPi485oSXgo49FYw33li21uSnP9+HXe8ePAytCi/gAzb22q722yTuHv6ToMd//mLSrcS+Lyl
 Al8Rn5R+5uNCWF1U7Y/oDbn9bGmG4jYjFeQbUvvLcynFv//T46ltJ+e
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

Currently, SSPPs are assigned to a maximum of two pipes. However,
quad-pipe usage scenarios require four pipes and involve configuring
two stages. In quad-pipe case, the first two pipes share a set of
mixer configurations and enable multi-rect mode when certain
conditions are met. The same applies to the subsequent two pipes.

Assign SSPPs to the pipes in each stage using a unified method and
to loop the stages accordingly.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d67f2ad20b4754ca4bcb759a65a39628b7236b0f..b87da2bd20861370e7b3b1fa60a689a145c2fab7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1115,8 +1115,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1124,11 +1125,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1142,24 +1138,43 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
-			return -ENODEV;
-
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / 2;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
+
+			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+			} else {
+				/* multirect is not possible, use two SSPP blocks */
+				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+						pipe->sspp->idx - SSPP_NONE, i);
+			}
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1

