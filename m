Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB144AF81D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F8110E422;
	Wed,  9 Feb 2022 17:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA7A10E40C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:30 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z19so5492564lfq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GzF+RzV2hotypA6X3hFw6Qw5d48CTFinwJESYBrfrQc=;
 b=kvcvcw3m3FIOUOPpC3ZEqDThxzInJ40mQzHsKhbqntRXfcwshHXoo5bvkr5FfJOKGr
 MnCqiBhbkPtbYPCuvWGIim/3orFO9t95lTDPLdK0Yf+GC4ktaZIkjuMjtwnJ9f3EovHH
 vYSh8f3K3jE88dc8W9OForTDc82zVtSm10elriJem5G2E+X5TJgwx/Xugop3MbpE5670
 wYsfPwdxeMCe0W5KEARch/kERN57WgPWH1usB2FyMcyJotRsx4BynLoMHF3jue5adZck
 6GVny2LAVYi4pslIvpxFi0sJoz2UynIeRV1IcH6aGYUrMU/0OB++dmAdkiGS3AIIi/1H
 36zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzF+RzV2hotypA6X3hFw6Qw5d48CTFinwJESYBrfrQc=;
 b=YhsTIx0EjsB65a8KDeHxh7N1lbl9Y3RQZSiYL0M6gKJxvXBglySOz4bQLlwieewBwQ
 ZN0XSPT/6s76NNhRPuOeXSDPVz/kOiKwzVSB+ajcw1f70nWojx04lVgB4Z26jFdVDxnr
 Z99R+5vehGyhj6PzeMQI2tzupm/rXbj2BoWIk9GYbCbwpukzCgibm2cBRZ3WftdtaNjd
 njn7X2Axa0MZlvFdXxIxwtPz/Ix+ud1G2UEJF16fyREGto/eFX2Ru3MKM0fRkm58pMM5
 OCu1RTU2iufj4kDtgzu+kz5EeVJQmgiOawD/ZVLrRnXzOPyFWzsDkn29IgT3V8tky7d4
 xXNw==
X-Gm-Message-State: AOAM532VLGJcylBN7k9x6kLFYJafCCuWKJ5oCmlGXsVTAKHLSfq7ZXw5
 uTacL+erDfGFahDGAI8Ub8WUxQ==
X-Google-Smtp-Source: ABdhPJz0QMpz5Bvvcvt4RYWRsTP2JzNueOx1h1aqiX1fzPZUqnjuusvDOzrSKfZEa/n5BwFTUX+iWA==
X-Received: by 2002:a05:6512:70a:: with SMTP id
 b10mr2235444lfs.672.1644427529072; 
 Wed, 09 Feb 2022 09:25:29 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 07/25] drm/msm/dpu: drop dpu_plane_pipe function
Date: Wed,  9 Feb 2022 20:25:02 +0300
Message-Id: <20220209172520.3719906-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There no more need for the dpu_plane_pipe() function, crtc code can
access pstate->pipe_hw.idx directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 7 -------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5fc338ef3460..d21791db6ab1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -364,7 +364,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = dpu_plane_pipe(plane);
+		sspp_idx = pstate->pipe_hw->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -1112,7 +1112,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->pipe_hw->idx;
 
 		if (pipe_staged[pstates[cnt].pipe_id]) {
 			multirect_plane[multirect_count].r0 =
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ca194cd83cd0..d1f9b4bc10ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1391,11 +1391,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
-{
-	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
-}
-
 /* initialize plane */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index aa9478b475d4..d745cde4ea77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -54,13 +54,6 @@ struct dpu_multirect_plane_states {
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
-/**
- * dpu_plane_pipe - return sspp identifier for the given plane
- * @plane:   Pointer to DRM plane object
- * Returns: sspp identifier of the given plane
- */
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.34.1

