Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A6A385D0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BFF10E4CD;
	Mon, 17 Feb 2025 14:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MYkvtb1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEC810E4E7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:17:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-220d39a5627so63589625ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801858; x=1740406658; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
 b=MYkvtb1my/v2X4Z9vveSqzWrpO10figjphqK0Gpl1I1J5jkSfa54hKXcTyGFxOp0ng
 +yVgruOooi4zUbVmcPnd38pw9TdVXGp2AnCQFz3FIVr3y5gybLciL4cinbAHwsRiKEhh
 dZAr63ywP+7endA5S3yyCU396HsOgdFK9XvfMx0Y5YRhvCmQeWDiUXYBKm99ca4jG9PX
 ZyFSDJAcvHbWD5m6uc+7B2gCGfYF39fMTqDUwOFSm7mBl4pUT6MfhB7AwjxkBTXCnJX4
 DZ2uIr37Tn5g5DmCxSeGltWHOy1/rVMub0IgJkxiUOjFBb9M/tZip+aeJgNQPlKx12G9
 5QzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801858; x=1740406658;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
 b=jW+TAhWJXXinCku/cyVkqb+XamyjPJ4jQULEyEup+9ZigwM6nFoOYPJbxUpdwUJsIn
 iUMMBXogV5+04YJ0bAz0uaJ8CfpYZzMAsU0wSBPbKbyqKZfZDZaoWRhxCx/FONCB3YM4
 A2U0s1L1hz7SJD0yGhogQphDwbjN7EHIWs/Eq6HoMBLq2oX9Bi90ThhQqYSbAkGihPVJ
 nlr/c4qCNYZiJnLr/nDO32m36MIr40FryHgag7k7wpKzbwhnJenEMSr/yNhLr9OnXnxy
 aWKrQGm1x2BNfF1veIWnSgOhgvzvh9L01o3zdWKFpxmFducV9bei2OXRdPfxOXFAqMlj
 8H2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4O/mKQjIvS5ONLj6G9mlapbjzTbChtzYdpk7g+pxRa4EJIYM6jFVSk68vNIyv0K0uo16lgsX5Cck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqNcooCiCUEfJbuXnjW0aQ5DU52NFzD25J1FNAxsK4IhjQPzDF
 Sa+uRr6+/Bi9LAlMotc7gB8hliJWSv8PIQNOI8hdD+gksAMz+A12KUoU802sHSM=
X-Gm-Gg: ASbGncu85/ieR3RmyhRBtbuLCTylv2YrUZExsytmQgH/2vs8tQbq23EEbZKXzoCOGLv
 YWys3sUcrdqVHEbNZ2Rpe3wQIsq50vJHqatfBg9+QFToqoEDvmhUWtk7QDVW4nIrwtqRuVU2GVw
 b6sDGEDv7oJipxR9cQLV/csbx9WQb7cButBsOyh9QwCuUUQqvU6Y96PBv7FPOog3MijPsPODtTV
 qWQ0agOa12UAxFQ/zdTKV2PMfu8xaY7cFx5feTw0gUJ6YdQFzRUX35POjXMMz4LYCq2+vLsJRyQ
 AhUIWqJj3CWZ
X-Google-Smtp-Source: AGHT+IFS0jCADQX2AcgQY79NodGJN5uJRBAzhISMBvHFJ/ExxIfY5jpXxhVRd14EYRwV6Ijl2nRmvA==
X-Received: by 2002:a17:902:e88a:b0:220:cd13:d0ec with SMTP id
 d9443c01a7336-221040cf8admr179662625ad.48.1739801858618; 
 Mon, 17 Feb 2025 06:17:38 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:17:38 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:58 +0800
Subject: [PATCH v6 09/15] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-9-c11402574367@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
 b=B2USM0nmUXZxmqrKZovzuB8XerL0erfBe62Y10I49/1MRvp8nQlfAn9jo+PNTNYpWx/cQbM9w
 MOQC7Hp3220AdrYMGUqOjjWj8+fDjbOvDxW51kieS9V1hjiBg5SSetp
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

Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
converting pipe into pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 41c9d3e3e3c7c0c74ac9007a1ea6dcdde0b05f97..05abe2d05d8d81fbaac58cf0b298abb8d2164735 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 				   state, to_dpu_plane_state(state), stage_idx,
-				   format->pixel_format,
+				   format->pixel_format, pipe,
 				   modifier);
 
 	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 5307cbc2007c5044c5b897c53b44a8e356f1ad0f..cb24ad2a6d8d386bbc97b173854c410220725a0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
 		 uint32_t stage_idx, uint32_t pixel_format,
-		 uint64_t modifier),
+		 struct dpu_sw_pipe *pipe, uint64_t modifier),
 	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
-		pixel_format, modifier),
+		pixel_format, pipe, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
 		__field(	uint32_t,		plane_id	)
@@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->dst_rect = drm_plane_state_dest(state);
 		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
-		__entry->sspp = pstate->pipe.sspp->idx;
-		__entry->multirect_idx = pstate->pipe.multirect_index;
-		__entry->multirect_mode = pstate->pipe.multirect_mode;
+		__entry->sspp = pipe->sspp->idx;
+		__entry->multirect_idx = pipe->multirect_index;
+		__entry->multirect_mode = pipe->multirect_mode;
 		__entry->pixel_format = pixel_format;
 		__entry->modifier = modifier;
 	),

-- 
2.34.1

