Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC496416C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0AB10E640;
	Thu, 29 Aug 2024 10:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WjoUzEa8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC3C10E640
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:21:47 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-39d47a9ffd5so1387745ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926906; x=1725531706; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z9jx05Flyz1UJjR2gb/LXP0v8OrpVfCmxku2GEq5wWk=;
 b=WjoUzEa8ex6faYXJ6VuUVlMsgX1qVds1LfZwlo75TlWqx0h3CIOJ5UCrIVM4YkKrxI
 h5mUU3UU11iNsurOHuLF46ALYqVc0t5RtAYZKuVLN1HCwYT/r2y9OT8kCS9gfVwo75Ai
 kzlg+ausZ+fq2FLCtpF+UTJobGbn7wNP2KNK406LLeYFwO/aJ+5Itz88pk/cLpIlbrsX
 kHJdYVcegAU9rslTbmP4guvq0XyVyr3vYRmfw603e7kAeL9sSaTKayIQiTgsF2Qu91B9
 b6NPGim72vpRF+Ddq+lze91yp9a6w9zWwePjqbNIr10vZzw8R+L1aK5+9isiBapdDMPJ
 +auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926906; x=1725531706;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z9jx05Flyz1UJjR2gb/LXP0v8OrpVfCmxku2GEq5wWk=;
 b=IKdsOv0Fjy59BVJgfMX7xF2fl69Wi1b1FY1RSc/y4LvE88E1EJRIHEGpwqppYrWVzb
 kvPW4RLswBJBtJJsj0wkgLuRbZ6qxL2dS3JouMjyi2oFn1TfaQ2GEKm6Zvwl2r2qGXhD
 Ej3EESMUMZh4iet/tb7ykxU7ua2QF8dgmMKuq0XxDl4dwwKCbEH7wNhw8yx8ahv7Ix6H
 KiEKBRpPrmPXFiX1JD+WaK8jz/q2sPEPjFHQR5kAKN5nnd9z486nb4Fk/m9Sylx5Zltn
 LGkc+4EbWK5NJTdg7tXsUkC4Dq/59qVlMAbycOxYJzSjiCOZCr8PlLU2ZLXwl5X+wiJR
 QKSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV49phKbbdtB932tAPEL14A8Cxesr2P+VX2D6+2U+AGfzAQeL/SJlMUze0Zbgs27Dz+hgs9hhjzWeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHkmcC1o2mxcciVCJZesxyWhjjkHgcYAfKhj9qwtLh5q8rJ/wL
 MtYlo1rgP2XN57NlRqw7Qfd0FiZRFh00vD1PLu86cGf1x3GasIilgXQAwaCug9g=
X-Google-Smtp-Source: AGHT+IFNqtjfH6898xDZo1oKXP4FPGRERQN/yG4/hS7UmK07Tu9uaYdYVMcYyGDgmPzuMBRpPO+cdQ==
X-Received: by 2002:a05:6e02:1e09:b0:39e:38f6:d006 with SMTP id
 e9e14a558f8ab-39f377e0c13mr29566845ab.9.1724926906455; 
 Thu, 29 Aug 2024 03:21:46 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:21:45 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:48 +0800
Subject: [PATCH 19/21] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-19-bdb05b4b5a2e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1799;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=/0TaKCKB4quJoQmigc/feb+UNK8aS1L+bPWvhyMG0y8=;
 b=3i+u31QYN7+VHMXzkpCRi03u866yLUbNqbRJCoGzSkySX+He1RCO0pnnTqsKTYMy8tm3E030Q
 xxudyn/XPdCCPTgpW4OTkgRD7GYqnBTA3DrC7a4Yf0rdPAGAP5e38jk
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

There are 2 interface and 4 PP in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5d927f23e35b2..e17b7b39c4db9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1116,7 +1116,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1186,9 +1186,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	}
 
 	cstate->num_mixers = num_lm;
-
 	dpu_enc->connector = conn_state->connector;
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * bind to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
@@ -1210,7 +1215,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)

-- 
2.34.1

