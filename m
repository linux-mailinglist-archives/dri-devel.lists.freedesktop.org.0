Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DCB964164
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDB510E632;
	Thu, 29 Aug 2024 10:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iiwHTKSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ACA10E63A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:21:23 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-82a205810ccso9059239f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926882; x=1725531682; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4TuzTTnjlGvCSyzM33NKhNHvWlu8NZzgY6f6ECH0+Rc=;
 b=iiwHTKSB/6OLQpXQ5K/em98yXUX9Zvb7fgTyETKtnPifDtN02rZNLixgHw9n++Kksw
 g4Go/eMSj6ilSClt8GhjibZDbvFZ+9RVZzDRxdVx0VPgGyt5wR5p58/cP5OGXz4TRILJ
 T8YAoei/YR164a+irr6ePOPXXVkG2RpBD4EtZ02WSExi8aX1r5ajzgZAhXvehfVPA+uB
 L8pSVzYLcNiG2P7fwUqGNl+H3zvwQU7WdRTcSz38tPK7fiBJSGjLRyP1AAq095bstiLs
 mNTUVrF+OVpFR0zwKzKluXVDMTSvJlj5h3qp+Ex9G9QOCLJsdlC46rQh6d+hrOO94w+d
 pwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926882; x=1725531682;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4TuzTTnjlGvCSyzM33NKhNHvWlu8NZzgY6f6ECH0+Rc=;
 b=mt/izMLRhY540ibNZ78BvaTzsON6cENXOVkhccJSOTqwWPuqjV2XNgmPMY0qYOPEpq
 AjUqrjIHhURNNlZ/vq5MBO81onPsJ6xBCFJ/qp4GGWC36ggehvRjAWQVgwebfYIA07XN
 wHuSZVlt13k8vpgJAMLKpTYkiXtv2nv6T8peurzjgff8egn3koHH2cPnkXLGykyRbCdG
 TUqzz6SqzdYOnPQxV5R0Zx7lUY1xf+GroXb2YoQH4Vu1FoprMbFrHX3yPYoBLzDrkta3
 QWurQOj/I8cuOdTjZvVinOkrS4WkKCGEcrESQsLlwdwjdI1SUFPMxERxOW7NtpDn9mVU
 xjeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtYh4Ua0EkoE40XbiXGg3G4ll0c3Ia7hn1A9GakCwBs3mB7bnLt8nKEh5Kk6e4dHvlCYTGS6RpfFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeZ+Gu99JcReoCGDKnNIy8oq6kCucyc+XGVrqv2X5j3zBFjO12
 Tv8Ivt26HO2UtFz18OzGbHFKiZ7MNbd+ueuKU/TTWHpp8IBGY1zbx5WGlvhMAwE=
X-Google-Smtp-Source: AGHT+IHbVA0l+bX4JgXKuASc3OPCYhauqftt6K8Nr65uhYlEQYmVnADnoCU0mTUGLIgVyC3FpdBLfA==
X-Received: by 2002:a05:6e02:52a:b0:39b:640e:c5e6 with SMTP id
 e9e14a558f8ab-39f37983ff7mr21822505ab.17.1724926882300; 
 Thu, 29 Aug 2024 03:21:22 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:21:21 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:45 +0800
Subject: [PATCH 16/21] drm/msm/dpu: support SSPP assignment for quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-16-bdb05b4b5a2e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=4022;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=soj6PrVXT/xCUVwdiUUUMK0OTfrgaoP64MOuikj4L9c=;
 b=KPu/3YF8ZFbVS+RlbMDouNax60UXe9S/ZE+/72QOcOcl41DYXZyq3aJHCdKzR5U2a3JGsuALS
 1HRk4X+9u9oBjgzC1oS0mox54LeBYnMgRsEHQ+1zkwH6/vztr/eXti3
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

Support SSPP assignment for quad-pipe case with unified method

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 58 +++++++++++++------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 95cb2575c63b4..c38c1bedd40fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1143,25 +1143,18 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
-	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
 	uint32_t max_linewidth;
+	u32 i;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
-	pipe = &pstate->pipe;
-	r_pipe = &pstate->r_pipe;
-	pipe_cfg = &pstate->pipe_cfg;
-	r_pipe_cfg = &pstate->r_pipe_cfg;
-
-	pipe->sspp = NULL;
-	r_pipe->sspp = NULL;
+	for (i = 0; i < PIPES_PER_STAGE; i++)
+		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
 		return -EINVAL;
@@ -1175,41 +1168,40 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		struct dpu_sw_pipe *r_pipe = &pstate->pipe[i + 1];
+		struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+		struct dpu_sw_pipe *pipe = &pstate->pipe[i];
+		struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[i];
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!pipe_cfg->visible)
+			break;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
+			return -ENODEV;
 
-		r_pipe->sspp = NULL;
-	} else {
-		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
-		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
+		if (r_pipe_cfg->visible &&
+		    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+		    dpu_plane_is_multirect_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
+		    dpu_plane_is_multirect_parallel_capable(r_pipe_cfg, fmt, max_linewidth) &&
+		    pipe_cfg->mxcfg_id == r_pipe_cfg->mxcfg_id &&
 		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
 		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
-			r_pipe->sspp = pipe->sspp;
-
 			pipe->multirect_index = DPU_SSPP_RECT_0;
 			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
+			DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d and set pipe %d as multi-rect\n",
+					pipe->sspp->idx, i, i+1);
+			r_pipe->sspp = pipe->sspp;
 			r_pipe->multirect_index = DPU_SSPP_RECT_1;
 			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+			i++;
 		} else {
-			/* multirect is not possible, use two SSPP blocks */
-			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!r_pipe->sspp)
-				return -ENODEV;
-
 			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+					pipe->sspp->idx, i);
 		}
 	}
 

-- 
2.34.1

