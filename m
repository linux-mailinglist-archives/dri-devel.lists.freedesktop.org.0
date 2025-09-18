Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D00B84D09
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126A210E8AB;
	Thu, 18 Sep 2025 13:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zf/BIOGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2CA10E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:29:31 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-77b0a93e067so914602b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758202170; x=1758806970; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=28syEWEQ+04nV2yrVvLwGhGtOEbRtKV5q4Tvc20tktk=;
 b=zf/BIOGGQnA+Ctz6n0iHQXeLalWMR5yyCGhXmCngrc/j3Tk9msIa70uh/IpzPnCWJa
 aBXRJnin+WzTlblCBXgCQB+KowCJBwv2RFEoh9pDYzHhbqtLI8daiFUjqUV/jX5vl+5N
 ZKGjeOii3UbS/XuNxkO4mY5AK8eLlVKD+ldSrw5Fb3FhpKWZJYe4Y0ngd9l0Glg1HUcE
 F1y22L0YzLYVnhtMd7PLzZThRdthBSz/yMNUi/VbdtDGEAUtmQaC70GcwEvYMTJVxSJ3
 yyxT/4mL++KBl7KkNcMvOmOhYKgmeR4DR2+Bqmqcw57QxdoNkDZN/o6EPAAtHz0cWneu
 wCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758202170; x=1758806970;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28syEWEQ+04nV2yrVvLwGhGtOEbRtKV5q4Tvc20tktk=;
 b=w8w9UDfERxmla/bBbzJlGh0E18H5+zpuiEZ3/F8v4tJ83GogXG5WSC3crPOv0KhlHj
 RcXomz6/cLlwd/zS8adHtUppVVFMnbX+xD1oxVhTCcfnEX9qvwxY1IYNxW6ijJCipeZq
 uE690suKg6u5mCPsq/A6kF0I2FhdKQvqQaHDEJxhnAyEYml5MVicpnGRETVpvba05a3Q
 n/0GHNXyQJB513sNBxzeukwfn049G4h/IYkKFfLOeSjTsIKeFOKpzMLWjl7V5HvlqBJ5
 F8jlfpFeQzyS94bw5r+LhL+KioOWqXDX+zXUddbqqlishDTzFD55HX8EI+cbQxEz19c/
 aMjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWnzJuO0gUlX/nj8WDbvEMfiKG3KJcfFV5kOvglq6H0NTMTcLzB83eLEPHMof0yilA6YoEEM6gTow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFLc6t/D6am6VxNnf4fVu6aDS4CMR8yvxokvxHm6Sdh5kiCXZi
 kj2TNJLObFdO7l5eKHZQp6/jBMjRoi7rep1o8Ey6JN3C25pHig1FkUATer9yrTRSlao=
X-Gm-Gg: ASbGncua14OZbuxfSPPhrHnCaSU9G31V/OloJN7w7wwsaBf91CgKI4P7rdSu0UVNxyT
 i1xqA3JAL3C+8Xw8WE2DyqUgPY8BB1yO/W52Bv4FBD0CiyE6cWM5akiIvzPraEfGOrHngNa+Ji0
 k1OjJvGfcCFQWJ/rszNowgRXXkkWirtfKtnYBXfyWDfMANC3AWwafOHDMzHvRboBTCzEW4E70E1
 r8I9zsYUcvoc8mhoMRiW8e5TVO7WrEsVQEl1exTyBY1tfM8QAJdH1xCCx2jT6wl9Gtn/NJdeZCk
 lPeK8/7Wmlc7vTNOBC/zyDm5127CoJqGi+x/VUCPJz8b04ZEe6Pd59dp9FM/DaKiCxw25inBNki
 UnshPO72I8fLXDXGjjGI6xdPhWTg9+9yeIrM=
X-Google-Smtp-Source: AGHT+IEr67DRNgZ3DE6KFICzJIbFlfGSdHc/Slw8f1MzR5KK9YO+06RKpTdDXaS5rz2YkS8dCzoV5A==
X-Received: by 2002:a05:6a20:6a13:b0:263:616e:b62a with SMTP id
 adf61e73a8af0-27a9732f05fmr8819522637.13.1758202170544; 
 Thu, 18 Sep 2025 06:29:30 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:29:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:55 +0800
Subject: [PATCH v16 03/10] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-3-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ipv+iK4CzMgH9qiPSwbsVlKVNkLoDzm+o7+o/w5Dg/Y=;
 b=nGkZEsPuH8Lcqdbcyo3WUX02k6h40bejotuX9hh7cObt3eAMkDs7DBu+XJbKtHUY2NWARmVAV
 WkGJHeaHRdJCFi9aCUcGlq2YEcndSGDXOL91Hy5GbLfmOn27tV5+gv2
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
index 4b970a59deafdae3eb964da912e7f1f1d181eec7..f47e961de51265941820bb8d1081eed925b286fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -419,7 +419,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
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

