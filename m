Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D49A4C490
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931F110E464;
	Mon,  3 Mar 2025 15:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="My9TLY3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795A810E461
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:51 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22385253e2bso47266255ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014951; x=1741619751; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
 b=My9TLY3RmIyj5bJto5CYHgK6sLNNvGHZ9aigFZwJWg3RRgj3zvj+RIUNt2ei+qYPoU
 vlQ1UdOmYZwqA+IpGVVsNwbryt1K4gQQsVZteMca1U4zEHXWM7zAhPzYG8GRKKL1IMzh
 xrW5WfigzcQ8qcBXHCsS5rPvo7tobk2D8b2jOnmMzq6jWsgjmpI3ct57Aqeq86X0yWLh
 mgzBS9KpeI4MSsrxc8lQ3eSUCMJkThe4aP1WljCvMZj0160ScJTbx47Nqo5bsTjGO1nA
 StSBD6xrwwaVk6txazSz+Y3imoqH3lvL1C+1YrPRmBQ5YxDsd/zYLs7WwdIGjzxCibVM
 hsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014951; x=1741619751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
 b=FqYkWbWW9xe2HZ4DnbPoTftCZri+8KgQcWdGku8ltCRA/dKfJh+TJXtMTH/0BhXyzt
 JUvKnXMLy2v85CVebuOsbH9yGmrqQ7ETmTN76kPTKrkABZS6HnT7UcP2fnWcdl4PjBD+
 lUGkINqExKk8zpdX1gLgebs76icdRQ+ypMF7fzd4O6hDD6lsbXgsSzaeUob9WMLgtThS
 klFtqbI1ZxpJnl/zwhmI9O+PGe9PYw+AE7cQ2RzAt5RGJt7ahyW+bqMvncSyhMfHsGCs
 rIIxptCRDccjk4OGKrkF93Zvk6xyZBxQfpyU5sUddbnR0N/pp8X+lNwqBMrhT1Y9gLZx
 9gpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViRaPsBpa/pN9AL1XQIpGAg2HwQ39ptKGdj4Rl1hf2aLgEcxMRBkIw9qHGTzw5TdhP6CHhu1YzWaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOMkC92RliP07JXE6no/kpS7U+pkvv7n9yJFV6GN9aBhNpbo2s
 zQGALFTzqnNlghDQb4HOxlKSNGFLmkCeGPtTuq+DQb9WHz0UAnGN2WlxRXfubl8=
X-Gm-Gg: ASbGncubdlGNNcwh6NqNVVVDY5Gin+DwxzSI0CQudTyHhDGeSWG/J075yeZlszUaEjt
 TFcaRpGhMJNMMd1gai9u8W8vBBthfFXvJnqzBoRuyAiubzzWE4Pid0Uw9/d9LXMHaVadLrM/Tso
 RYGRq3b9mSG/6ygvdxy/jZ74i3Vmitymue6+cFbc9Xmd9rvgHjxI5pCRAWWeK0DNox75qjgO3q3
 VG6P9TFAru4ctFDroLOmkFWW87tSHZ4ZuWft7UR2asgvDkk3k2CcTSk5UGwz97iRHBgZwWVJOI/
 90VxeKf2wJls944rcvYWlMTb5EYQJjadfSXLDFRbwg==
X-Google-Smtp-Source: AGHT+IHBMkeJ/K/xmZ0r+6e1iC6/N1q8Tpd5ZgTdrqZ75hZ98XnPHX+o0gzUBYeec6SHcEus8rnwfA==
X-Received: by 2002:a05:6a00:139c:b0:736:5e6f:295b with SMTP id
 d2e1a72fcca58-7365e6f2a10mr4343635b3a.12.1741014951078; 
 Mon, 03 Mar 2025 07:15:51 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:50 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:38 +0800
Subject: [PATCH v8 09/15] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-9-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
 b=tEkg4RUT7oIGfsE4cuD/GwxCmFq8r/pBRQl9NiRcBh8QSHfXdU+84EoL4yepFYoNSj4QpB8Dh
 i4x5sqCQIuNBKjB1Q4RTZE+R5Y4emQpw31G4+A4LPEc+J5kUhrVA0gI
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

