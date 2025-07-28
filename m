Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4CAB13B26
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 15:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1930610E502;
	Mon, 28 Jul 2025 13:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vHHf1gRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9573C10E511
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:15 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-74924255af4so3787124b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708515; x=1754313315; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
 b=vHHf1gRl3g0LEDIHEpKZjHBkupOR3hFhdIh8Xfm1rrO6B5RQPZ+9ImOsB7LbbnS/O+
 WqMDZ6xNU8kWp0atVhJ4LG+2DukORN9VFooZj1r5ZaE0dFMTfKk4Ywkz4ENxVvIxK4JY
 RwDAMMPp6OjYt2y7O4iIYq3YHRo7dGE8yHL8LbK7T3qBEIBwbSbGV6qNmQ0VQ3nIQCw5
 RlMXRnepcvxZ50faBSNiKPOgmEtR+wJtpvNgJIxyS2hvrWH8aHSV6d4quhydq4s7ePdj
 lua1UxSQnQfasfE2utt2Iy/nJdRBo0pbenpwfz/vqMU7evho9wkWMQB2UHRXjHT0XRQJ
 vylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708515; x=1754313315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
 b=qyywRtbuEKm46c5FI9Spev7RB6bLKlTJug2FfDYuwvUvoGMf0nuYUXZJwgvTP0O3p1
 wMbZImlaRajEIO8ZxFXrnDE/i9G+rJeCMrkw1eeKxkpYF3zy/8hbpUEjR4RdkkVWStiU
 jhdSsnDEsJEPAaDd7r+ngOdZLMEKdoJWxHKp8/NgIOTPO3Fxe2GOSL8Ff/QdW9DccbY5
 Re+rmWope0WJKSf1ugnBSwTNYcg18jdrpdIDjzJFc/Z9OkqDesYSa+HiF7t0xk9oMo/j
 3xlEAYacSJ8g3dwJd3iYUo91pzmJIAMiXT+aB90ZT+aCIwhZFeRekc0EJw4cken9rfaf
 aa0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVltbEtyvYV3cWblU+8w0DW0pPmyOuMcon+vTxvyNExgB4PFMaKlT+aV4xg0plZ2zydCd/JT8JjHBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzniBfwxQsVvay6l0oHLJeDoLnGPZMni70hK/LIFPo9AEJ1MKl5
 UJk+oVxNLAS527ap7XJU7TplLCbkmnzygn5hZDixk9wmIzHQZ3mc9C9R/vQ1TUrebz0=
X-Gm-Gg: ASbGncuPh584tibtkBDhDpw6iW9QBv3rF6ObqTLQUp6P2zrnEAOBdGz0K+psrYTxowJ
 jPPAp1KeV3UxVdUev+rMirmEA735NNECh9p7kbYY7E+6qcw9ThtUC03zeY6ocAi29SzBQBC74zb
 mP+GQjoxkXRhFPMFS2Zrhle6Ifc/aXAm5DT0scRthIRMpQoTqgTSEZOgaCjjVptuPyHG/2U8NKU
 xAj/t5qE43Xffp4oUOlD61aCSA3JtWOZEbQdyDZnt615Qk0J6t+0hq8rFYZPpUaAiwCVZO/B2Cd
 KVrXs9fCihTivWWF/YDddtFOoiFkskSLj2g8+1Vp2Cho6I3lWdlIw8vCZVhSgp+Wcz2EVM9rsha
 sxRROA1EuCow1imYeGg==
X-Google-Smtp-Source: AGHT+IG627h4s8TzpNVHVzRet6w2TezxDsYEi3mVK9MUyU17fql3o4Yd6kGo7YPE8teLTsG/doWEbw==
X-Received: by 2002:a05:6a00:22ca:b0:74b:4cab:f01d with SMTP id
 d2e1a72fcca58-76337014813mr17169239b3a.12.1753708515011; 
 Mon, 28 Jul 2025 06:15:15 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:14 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:29 +0800
Subject: [PATCH v13 05/12] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-5-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
 b=2E9xmcpuhxUZv8IFdqhxakZ6y9VSScGQZKVK9b9CXt0soD/bO89oUUJvm/GI3BLH2vcinJ/6d
 bUWQxotWu3pCxl8fYtTgf2gfVV8IC7eg40kPVx6skBIxgXRsOXacda9
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
index 9a40492e5aa961f7180ba4ac6c86e06fcccef8c2..cd0ec3edfe2fa8132e114bc1544c389141d1c1ec 100644
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

