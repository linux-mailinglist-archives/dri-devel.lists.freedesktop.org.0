Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6439FA3E0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 06:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F8510E2D2;
	Sun, 22 Dec 2024 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MSyUtMcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78E510E2D7
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 05:00:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54024aa9febso3438449e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 21:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734843654; x=1735448454; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SPUKe2inYvlgyzg1RdM9z6lWoAQEDWbkCd9hh5ymtmI=;
 b=MSyUtMcFClOEOico6cZfZ5u+FfK314bRXVtEbMjSANoLl9VuWypHWoOjsixf1YwUnx
 90uSZ2HkwWyMSfvZf6HIsIdUFCUWUiqjHFl5jJvkp8sX0LZKwJ1oAvQ4sqQngvHGqZIB
 h0tyH6CjzuxFlVTB1FqSI4SnVXLjI1Vg0lxRa8909FohXK8zTnoxQAkFZjE3LoQIjXdG
 l9pNunkPoRe/z9yAgM1IaXN4OzaCkvJPGkgLHbHBjiGumx1zGQ3qP/jnBC0M953DThcv
 z8ocn9wHBwWSsZkWbC9r1yF1uGDeS3ybTR4+xdcNpvyXhv2HZEnpZ2ZUwFLDYTKGemTk
 D5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734843654; x=1735448454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPUKe2inYvlgyzg1RdM9z6lWoAQEDWbkCd9hh5ymtmI=;
 b=FSFNYaFElYoGvXc0W2J1GB8XtrdbKkHlD6yDKPFxTTz7fv1DeHSn15uxW1aRHblS3S
 swdSLqyNRKC5LRnpFjfyEpBSQtHMULLLlh2ggz03QOtDyDVr1vQImeDg7Z7jVX2Gd3Pp
 rDlZzO/gwH301U8m6OvS6aV/qTx5TqouXFcvpbY8/XtD/xol8ovXmh5h7C65NASCDmox
 j8Vj4D+MjsEE54BfyguCaklr0gLa5NooBzijAQGGpH7VznUUgc2JMMpWqni7dVATFciR
 kajO56s+vzGXhzcPEjE1EqbR4VDYuL5hOif57bMPPrC+/QnUwPeVruABP1X+ngW8yUxw
 uefA==
X-Gm-Message-State: AOJu0YwNKTLEU4pV2FHLmtVfLLp+mLu8uGPz9OtrB4vyfxM6dYkjLe3W
 WhAsmjLOuG89bzBv0tfZPxIadNw/ZyEXUXZ3ALgq1VZRGMoqFsXgNSBPznD/j5Y=
X-Gm-Gg: ASbGncuK3qp8PlIXODuuf4eX7Fy9OOZcv5kUvJYiMKdqoU40saGfR6JQDcxqXyjwNY8
 4V+MHupNSrRrDND+a+8DPZ7LMWVox/qdeFJKNfRHczOonwRPN0NqP7juB2M/vBOE3WOyscyy5zw
 hBWCGpVZhJxbsq5f9ktl3A9bOySpgMIiCH4Fbf+HT3vxuAx1/4wqHJdg/w+h6SnRelU+8Lu9R0W
 25LxyaZG8QiOgquluXzh7aOZ3crNbQ1SHu0YJI++ebAsP1DEJMflng8ZzVCX/14
X-Google-Smtp-Source: AGHT+IH5FngsI07NNLouagSYBk1lHP+UW7OocB95mR63hfokDbT+bvXmYWVojBL11pLAgTWk4aF61g==
X-Received: by 2002:a05:6512:1392:b0:53e:38df:673d with SMTP id
 2adb3069b0e04-54229562a01mr2899574e87.43.1734843654003; 
 Sat, 21 Dec 2024 21:00:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 21:00:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:43 +0200
Subject: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dBpoTk4s8OfoXgQIHG9q+kMWzF7ACr4fOXNDIEIP2pc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z7MZS6rAhW4DKuCWV9b4WdZ4hjqC6HLAq/i
 yre35Fm6UKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1YNhB/9hX2wrzJFQ1fwM8icQeBER9azSe4PG8Bpkhfz75DieLiutJPwRQtpOItU+qWqg6WCbESd
 AFhW4a8ggukt6IuqRscFxzbxnfStjAf2/AAxGGiUjRKmbegN4evvPH5ZuwMVRYHJipxbUjM5dRq
 DY26GP4KUxfZcN4d8cap0cnUgNxEWBohuAcKFyOWCgnSxUgNoKTOVPzAbLRB/+eOClO0t8tg8lG
 mu7U1WhfrEEKB7DCcQOb4GQxWfGAazde4EKF39I9VOy3jDXwpFEdA8wWS7KB8Dd6qh4K2Qf6Lmm
 ngCcXoIiCtGuHQpeqXSzY8TZe2MPU/nrQD2jLanaCowQhYyE
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

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
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
index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
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
 					drm_enc, crtc_state, topology);
 		if (!ret)

-- 
2.39.5

