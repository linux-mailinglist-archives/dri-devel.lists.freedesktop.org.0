Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C6EA15380
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569B110EB2E;
	Fri, 17 Jan 2025 16:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ts77M3qw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0110EB2E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:02:28 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2164b662090so44720365ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129748; x=1737734548; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z/VudKlbPALVqM0M7Jv8cinL9zqQTWFtOjSLds8bTH8=;
 b=ts77M3qwWajNB908rW50jcyQmdk+P3iyHhygyqhrx2UM0gf3BLMz3cWsZ2a3QTmqvB
 qMz8dd6tYiXsw+Pw5+Jv4RYMc1sbCr/DAesg9t1wosNLFxNsyYql3b/AvOIkTJME+INW
 DcUonVnoL6Y5AcVYoU15AQnWg+8nstVcfN7ePMDNLOafHqnFCsMwohAfruHdvChkAXsd
 J6o+BqQni/ml10/PTodEhozyxaamioU6VaERceJ+7OidbwwyCAD6Kr4C5gUiSObzJ4ou
 MpZeKZ2SvXyUwOYNKdGsoZlj5Q/YlCig4CC+SAfRI4GcNVSjcDVYq8rTg+0EHHAJGxA9
 gKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129748; x=1737734548;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z/VudKlbPALVqM0M7Jv8cinL9zqQTWFtOjSLds8bTH8=;
 b=qyMbnzILZRGc3blPwfhtg2WR2pSfGRQzyD/1NXMRHu6jqr9/5rp+29AIjR+CHbpmZU
 hfWrVWt2eAsxgJEJlM2hJ2E/TJTgSfnla4uZjr4c9uDoacbpbVu7qrSR8JCiP/nuVvdr
 sfvdDqHvNmhPkhDImjFGiZFv1Nfxu/JiRk+hHmVggk6eF3CdNwHK4JdqtujDSta23DaJ
 193oPZ5kLauuTOo0qsDa4qm1FO3Vc2GpeREI2Qys8OQSThH0/yVj9eAFirryoLJeQEzi
 5bltD9qhecJ7CZjd1kbR6tb2ZtS/LZTRgl15gaawcDgVs3m5mlwb7I1CU2slBPNX368E
 s1Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/gUfMwLAvkrhle2MstFakGmzBuQ/1pzY3u64Lj3Kk5BrWe03HFYJ5WgaP4S37RDSF6G/4u1TFkrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh6KPNnBgrUTI4bAHhJSptS1RRzRKcSW+GSJS6cFxx2szTsx//
 ofOVKx1VU6SDKHbtjCGCg2/dVzLSy6EWh0a3Q1gNE0KkYQJ/8LXbXmbey1UTSzk=
X-Gm-Gg: ASbGncsHwJ7GjIzvmXVJhnNbCBbJwpY870000qMJeoIpxeUekkvFNYExYiZHBuhSgxC
 BXaUi/wmmCHqptG3AZg/3AYBXIlxDPOGjwra4yVmDUbSWDRXyAqrY7e1vMWUQ7iJusC7EHrIrpL
 yB8oYbOfdR8VVX+j2WCVTUb1Xkqimmav08/WJVhbJsMnzZKlQZK3eUBQXNNNRrbaELzRmRpQYZ0
 MBumr92LiHrhCqCn6yh5MLwNxSgssQ69CjQK1fVPX6qpm7YiKsqXA==
X-Google-Smtp-Source: AGHT+IG2v2L+mEIrQMTWWXVznvK1a9QA1KxWi805ituqiaxFlg2Kl9dCeG39Snnn3md7Yw5CS/TFqA==
X-Received: by 2002:a17:903:1ce:b0:216:4a06:e87a with SMTP id
 d9443c01a7336-21c355dc64bmr48245505ad.40.1737129747935; 
 Fri, 17 Jan 2025 08:02:27 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:02:27 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:56 +0800
Subject: [PATCH v5 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-13-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4005;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3Dx5K/6uAomDMeJNtwufyISMDFI3SQ3qkcEnvFt0TEg=;
 b=fo2bonxa5vP7HaatMCz13umTZipF5JnxHE1MuWx+G/5Kzbtf6CGxow+jTGeXd7AqjDupMGhQK
 FikawLqALoaBudKEfrJ2MEBi0KJ2OtaleFfM1iNLJ5TVnV94WuFp456
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
index d67f2ad20b475..b87da2bd20861 100644
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

