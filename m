Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47019A133C3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE22010E8BB;
	Thu, 16 Jan 2025 07:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fPLSoAC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE4C10E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:27:03 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21636268e43so12308245ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012423; x=1737617223; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1HYLeiZyIOvA21Dgt9YqH8OCYcim7YKyut+u6v2ZNUc=;
 b=fPLSoAC38212FpdPsvvhTUitCx8Ap8jP5pvxxCnBOVx96sscAjWq7ilE5ACpi6qxZC
 nkpZ+PBWfPYeuLhuKDUcT+EuubKIJ9kVAQlwZ3Iz4QT3Zibmn8rOaO9rVAUgBiWQRyZ+
 EDHznqmNLweUmGU0O1MB2BEo+Ycom0UTTZ0Aisu75iCoCzT2itdFh3NFQn+5DNigfT4c
 i8WvYWhPx54YqPI2jW50hF5OkGGhBVnf5hcymp0/ZumzaGaT+I9b2xJRcWz8jtuGQimA
 5T4ul0JqpUaYnpROppK2l+17uB7EyWVbrBwFTis0lstxuknxFvA5VZqZuaDdb8Rw10Ov
 pSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012423; x=1737617223;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HYLeiZyIOvA21Dgt9YqH8OCYcim7YKyut+u6v2ZNUc=;
 b=w+nNb3qGnN5BUQ/4FxT1SFOsxSPBoeQNc0eHgThCTQSvQ5VaLCtw4wLeEWen1WNp/H
 zSD8nUWlsulLMxTZS9cAILtb1yq9KHFiGjts/mkkATEe386OSMM8sja1o90Y2Fnc60tk
 p9G0v34AJqrY+r5N2b4bdHvaWOMvs0bAWOG4TfEdukp93HXSC27GZy/MXB6VH7lPSBTc
 wo/f8o/Ua5/DGutJrV/yiXD7fUx40MNUR6U1e0MsxQ3181/tvuueeQJ4HcLb6fkEqxQC
 F+7SkSV9Z6iEdMUdXcKPeS9enWYA1VozKbzq4pr6LLht3z1D1ioigzJ7K+6J2UFKXCvV
 E9Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdJOnKYuTTp4/pe2Xrm6pkzFvBdUeTfe5RZhLaTPA9I2PhOCf4j8dQIgRnOShMhk7Y3F+utPBVpps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwFGjHb0c54xB/OK8Zlk+oe8VsMEONfYHir2frpz1ucgauAAW9
 FbbtsD19aAQVnhfQYKGV0MeUlqWCwnFG/oaKknu2v0uEM2HorNL0GQiTEbs3GrnErhXJT6vMZ5p
 U8ODS2A==
X-Gm-Gg: ASbGncs7y6lNBuAn/DPjA/fXpgntBsD88ImKAOZCco/FPjIh29IBWZ5VuE1urH1sNCN
 JAV0CJyCA0w/2lpt+FBPAbFc7ToF257U6O8TL08QqKWTDhIPBr9W34bapjSgpIYkn1Ikf3kZ3yh
 T4D669JLG6xaPECoUr4nFzw43z9P+7ofQZQdZhSQc93zuyBobVdSdh9dA8dM9nqrjROivO+6bYZ
 fpruA+KhVEOgioxYkzvCSeooTwInltJgYcOy9k0Wn1jhJ5nfddTZQ==
X-Google-Smtp-Source: AGHT+IFMlqohE+m+oB2xKB2qyt7+cZY18igkkgu1BKdnZzBDVn/mcglu8dUjGlFiuAFhzV2EFU9N3Q==
X-Received: by 2002:a05:6a00:2e8f:b0:727:3cd0:122f with SMTP id
 d2e1a72fcca58-72d21f62d51mr41568525b3a.9.1737012422904; 
 Wed, 15 Jan 2025 23:27:02 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:27:02 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:58 +0800
Subject: [PATCH v4 09/16] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-9-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=2262;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=YkPGu9nozT3vAqexZbO9/ANJwzFKO7zuAWrFHDipIGc=;
 b=oPBsKlFEkzdUaf+A8gqoC80xWLR2JyXkDOfTow5etF4pnPb7ua0+DzufxgYFYVrbaKCImULk1
 qnAQcnwodqNAygfFJaJyTfFvUlbRh9ygb4QmBy74CDwXn8stKdaMziW
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 41c9d3e3e3c7c..05abe2d05d8d8 100644
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
index 5307cbc2007c5..cb24ad2a6d8d3 100644
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

