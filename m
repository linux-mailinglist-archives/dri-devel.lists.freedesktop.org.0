Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405879691CF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D733B10E3C8;
	Tue,  3 Sep 2024 03:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ijr7o5i5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6577A10E242
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:22:57 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f502086419so48458361fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333775; x=1725938575; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t8t12yUPj7e8mb7vqEqGXgnNpICOFF3VwhWmBnR3jP0=;
 b=ijr7o5i5glA1vA3WYcyNZ6OcnkOUjQK6aTjisszoA8S8YQzUo5/alGPHFwqQ5VfKD1
 HUs8MnYsTtRlIfxTtp9cripZc8P0RnaI0WbIGQ0B878Eeti2W7f9uc54YNLxxluUoV2Q
 ZrI4+f5Y/EPIdNBoxTp8YfiTg3zjE7yDsSU4Mx8CJhJ8LVUx8BcDufiQECW+jZcRfFh6
 u2cdDPoKMjTqHbw4rBAaRujf9eiKpfCi3ndOqUlGRAo/TZGrylIUa7QevF5hvEIz/hfS
 aRvhICU1HL6V5c1L7BYzQaMfMDt20O7DOfI6hbonpTStlvfNbQdoctlx+c+tpyeBWvX3
 u9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333775; x=1725938575;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8t12yUPj7e8mb7vqEqGXgnNpICOFF3VwhWmBnR3jP0=;
 b=V0FMr3GzeVG3xY6ZJfJuZkpkfU3JBdU1/YRh4nXn73eNkoMW1PYidPpUs6EXi0gXpf
 GmliJxllwia8qDbyJIkhiZwN1V/xCvOzXjtI7gKY8jKVKAW8iqcsB3Av3GC12BLTxSHY
 EhzkazIpeUo9pzLZExwu8KXBMXysdjY01Pt7VHefY6zcOYIKlC6zKoccd8GvmoXK7zJE
 2CnXM7THWlQ8Lw7VuY5lBvWowB6wHlabFwzh9rALkr3fTKirTLT+iFNcZojNAPUdYuGL
 JuYZSGQ93FSzZRAr+p73BMjYZBFMTJkKY6KyVDJmv8V+M7HfuFBQqVJaC90KbUlgShQt
 aecA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8KWIpJ5JNE+t+Mp0Tp9YF2cvh6N69PbuZ3KEHccsr6vY4SGvnkfnf3OqwXH9JS0tBTWpepvXujTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww1qH3pOFxh7wuCOO7Tnvh7mNn4GUVSvB4mHj3v6u5h3zoaMQ6
 6WujAZbcjeF2mnDPZAZQ1BJIVYRtHFK7M0lZOaHx48vZKXqZCAPjWRbJpX14e9I=
X-Google-Smtp-Source: AGHT+IGTh9Dwb7pkkxXKkDP242kXyVpn9BHR6Ast3Q1izqpsDPXTt0iIBv644h0se6VkdS6Eg+y/bA==
X-Received: by 2002:a2e:1312:0:b0:2f3:d82b:1959 with SMTP id
 38308e7fff4ca-2f64441ec9fmr11810191fa.23.1725333774462; 
 Mon, 02 Sep 2024 20:22:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:44 +0300
Subject: [PATCH v6 01/15] drm/msm/dpu: make sure phys resources are
 properly initialized
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-1-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9hiBNik93uZFwi3I0kzx7lGjwl8YmM6Oy86cQrRvVmE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEKxWGO3YydUMBY3XruJjJyYMN06dPEnug/J
 vWyj4bB7YOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCgAKCRCLPIo+Aiko
 1TBRB/9JjK9bNDkipN2L++V/P9kllEmOlC5pKEHKSTthCTD86R3p1mBRjVDpnr2naySQVy7Ft+V
 /khY5l/aDueIB9Sr6YGQbaB4rf3ZsrG9mL8c3V2xgw+60qtcLncikmD32e86nqR2lVmvpnAU4Wf
 NAXXf4UoR5Jec0mb45LmD5bOdIuCI45MiK1joxXb+eHACJrbYFEWvfmq18kuSY1gzeMoSYCXhXw
 3I/TFEGVvjaThzJAtBWuchqyBSTw9otRq/njo7lx06SsnVbXoJNo//O6eDgAggWfSFdlmB/RILj
 plc9tN5Zcu/2nwXJvGDcu6SY9QVu4nWmcVTEEhPuhfY+p6zH
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

The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
zero-init of the hw_ctl array, but didn't change the error condition,
that checked for hw_ctl[i] being NULL. At the same time because of the
early returns in case of an error dpu_encoder_phys might be left with
the resources assigned in the previous state. Rework assigning of hw_pp
/ hw_ctl to the dpu_encoder_phys in order to make sure they are always
set correctly.

Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3b171bf227d1..949ebda2fa82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1174,21 +1174,20 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (!dpu_enc->hw_pp[i]) {
+		phys->hw_pp = dpu_enc->hw_pp[i];
+		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);
 			return;
 		}
 
-		if (!hw_ctl[i]) {
+		phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
+		if (!phys->hw_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);
 			return;
 		}
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
-		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
-
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);

-- 
2.39.2

