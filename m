Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E9A1A478
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3CE10E7FD;
	Thu, 23 Jan 2025 12:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BbSgp1fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6BB10E7FD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:45:00 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30615661f98so8373781fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 04:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737636299; x=1738241099; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zWl/mrUuu5iSDDnMWnDf6mIxagIYPOHoQVKnYJ6xmpc=;
 b=BbSgp1fgqchrvBM/UVkQaKf5BYGZhmq1Vp5NP75kUONmU8QVXgBjfvDGPrzBgkP1PY
 fnDuOpRW9ZmFXxa5HYp1VGbI8shKArZYl2rzpnfftsVOw+sxO+IYELoaoGtSFllR69Dk
 GSuw0n0zCLmBSnN4RdSMgx2Hg1bujuNL9uhyUbVqGPEPYf3ygNgl/6hTNRhzVVqU0TGh
 QXkjPvNpyXaVxi5ZCvmDvspK3onfjm0LSwyRXsbOoIjrtE4TzfFLajZktk7UfNCq9PDL
 pJib7azYuCK8wukN4vAd/VA4gzjnOcPfTCSycZOD4PhJwq5ISdB4yJt6KxbWGqMCqUjt
 Op9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737636299; x=1738241099;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWl/mrUuu5iSDDnMWnDf6mIxagIYPOHoQVKnYJ6xmpc=;
 b=iyhnsqw6nd3JtmpisZ8lEKImUHkPdAA70Q2m0Zrc/RiCiIUm6jPiH1izJycImfMcY0
 XJ2tz87883k2didg2KW3NH8LIypMBQrEwCUMKa6vi5UrmQF0iihG1dLNK8tQaDGWM2NF
 /WWUBOFSYXHC1BHk/A0L0bdFxFu0YSEGSBezYjaFsd9Sg/QMdXyEyv9g+AJWv3KGXeIr
 qeTUDX8YyS6g1AB6KQyTqc/2eESNwdZxI04y89lHokeYiTDyBXijAHwRkkctdRxSOW34
 FovKxCYI77NDk0mAkhVCvKyBcv1cvSMdJF54OrTeJdjY/hONfIt1lwO65SwsHdzi2bIB
 baSw==
X-Gm-Message-State: AOJu0YzL01fd5VNgTMMM98zjVwvT+0hMq/ly3LYVaKILk2gA8Te6ADrO
 DPGGdG6GqUR6MlRtRSUUhsU4RME/kLeUzev7mOrMX9vrBb+xguZ6dGj4ftxeLkQ=
X-Gm-Gg: ASbGncvDQCrrel7xY06UbtOEw/+UZOnx8oMy78mPXwD4qwrTKGxouRFkA0DaxtflgSH
 fWK8FxSOHIEhPEI7soh2cu6OAUBeYf0Nx1oiJKao/V9xcygS1iccNGE5buP2UF40rxU6+8Yw6QZ
 V6U5/00m6aQ3WS8PGLIvfmhiNR2a49rWEJMKJSz2LVjsYK4b/PZTB/5coHhgC10Un2MLRzkx7Ce
 ar8uxalP9eo9cdmo0YgrGCzn+kg3I7//j09TRhT/5esRmzXeDnksfdsgJ6wnWw3OQ+XSuBQm3q7
 FZHlt7uN1HLB
X-Google-Smtp-Source: AGHT+IH5IcSIZSra8LNFX06NTWLQF49L8vuXLlXRQh+G8XpZMvxMtaLUd8nrGDGk8rwkOVFCuslUyw==
X-Received: by 2002:a05:651c:b0a:b0:300:31db:a77c with SMTP id
 38308e7fff4ca-3072cb66636mr95637551fa.29.1737636299239; 
 Thu, 23 Jan 2025 04:44:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:44:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Jan 2025 14:43:33 +0200
Subject: [PATCH v2 1/4] drm/msm/dpu: don't use active in atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-drm-dirty-modeset-v2-1-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2323;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6FHiK9uSt3de2pV2Wxfa/Fv4p/tQ6hl+nIDAnUNBki8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnkjnGZW1iNAEucAxcOXqyOyw158iAcmY8raCT8
 0H4hgMFpe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5I5xgAKCRCLPIo+Aiko
 1brHB/93op8onAUXr5fU2A91buXHuSnIU4NV07hLC1vcebijvhJa1lT5ijFMMW5lkFVva1FJraK
 lTMyHGLBKOQVPBInM0u4bJPw23lqTdKT29bvGzjNNqkVjTrQFlQ3jlqGWBVqkqbLC8tEdP0oZlz
 eHJtnIddkK/uiP/gugYSZysBeHZMaXbYGczZg6LzXAE6ZIOiwVw8f5eIPLnYExHgLSw+qrHo4fd
 vo57FzUtE7M2eEEtJzTKaiDKfDVuEuLVjPA7ANYeNi7eUmY6tkvVo60tBnB2VvHPLlmGcewJG4M
 gg6BZn4vxqTEFxE3zWgCnOtwraczzavKlUDfWCb/XymzDNhL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The driver isn't supposed to consult crtc_state->active/active_check for
resource allocation. Instead all resources should be allocated if
crtc_state->enabled is set. Stop consulting active / active_changed in
order to determine whether the hardware resources should be
(re)allocated.

Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
-	/* force a full mode set if active state changed */
-	if (crtc_state->active_changed)
-		crtc_state->mode_changed = true;
-
 	if (cstate->num_mixers) {
 		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
 		if (rc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea995a154cd88d05c3842d7425fc34ce..9aacd3b5bcf808c5712bf797a48484e297386c1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
 		crtc_state->mode_changed = true;
 	/*
 	 * Release and Allocate resources on every modeset
-	 * Dont allocate when active is false.
 	 */
 	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 		dpu_rm_release(global_state, drm_enc);
 
-		if (!crtc_state->active_changed || crtc_state->enable)
+		if (crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
 					drm_enc, crtc_state, &topology);
 		if (!ret)

-- 
2.39.5

