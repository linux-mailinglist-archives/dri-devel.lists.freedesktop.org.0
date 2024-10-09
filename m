Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD409963CC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808C010E6A1;
	Wed,  9 Oct 2024 08:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eg8IQ6F5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082C110E6A1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:51:02 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7db238d07b3so5577766a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463861; x=1729068661; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1LPn0pitWd582eaxpygCPJ3KnkuQTc8TgGjrVLwJiU4=;
 b=eg8IQ6F5w07XTBSkiytCLKLzJZpbfxX/A67x6bO7Et/Kw7dgIEAGJF/19t1GoOyrZA
 1EMLoCpX3XBgfMY/PQWwcueriJXtYW97Eonca1jqzXRZr3yxcdBctu4P4/vIew66QQ1k
 DavwTQyhUF5Rp/C0D9d92tYEV81hqAD5sI5TfTgNgh9rEziHHOcknQJ3mHBS3TaDr29l
 LiIdv8/5RiWetzOx4trn7uOLeCISXTBvD0TrWBRBMPI3XJ7HmmDyLhCO8fyYjJV8o1Cs
 6M0M3cFsCyHBKoRvSWiqKu4SYemnEaAh/cuLNcSsMJC4SF1a19doFGCwNqbauXQvXemn
 +v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463861; x=1729068661;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1LPn0pitWd582eaxpygCPJ3KnkuQTc8TgGjrVLwJiU4=;
 b=LUDUMbyhbHAruixvVdeIOot7wRluAdkhWDYSGi5afME1qaidY7EtOr8zA/EhuxvTXB
 kB3nXAS59ipSfKP7XubwLalfClDkEL27PGw7difec07XYK/OfR3D39C+a4avAz8TsBYa
 i5wZjSi97KR4VhndSRWI/8SXCVBhmrrzeIuswbBP//lXDkpUXj6usw2ThWRmC14b7gxF
 mbbs/JzNJXdIu8EM0hy72SxdZDasXcr7QYgEXT0W/+y5fCYta+7tf8axziQ2qILOwmqe
 Aq0ga2Vk+9rObAbpNN07jsAFw69tjX9HohpFYeOWMCGPR4N82VdQvqUnE1NjGzqbBNK0
 TDkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+GuE/NIDTeUGBLT5VmozVeFwYP1YwquXqZ1tf6tJipJ7VFam+/m0N/AO17XsrQSGUuLHIkjTegPM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgfQSEUD25aPrDH+J+5cH1ImwaliV9rL9S7FHCYFdt0eX4BB4A
 +pCC/VIQLa5Vu8ePrf9ArdvGmBcHMO6etDFtKkLmxhb85gKv8/ElrYj+CpG4ppg=
X-Google-Smtp-Source: AGHT+IEuBbVEOzp/44KTvogO+2Pwv6ey+PCRNhpJDBXR48nTEps9zZhOE/C5TsBcWU49Kk9eDonz1w==
X-Received: by 2002:a05:6a21:4006:b0:1d4:fd63:95bc with SMTP id
 adf61e73a8af0-1d8a3be149bmr3557677637.9.1728463861596; 
 Wed, 09 Oct 2024 01:51:01 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:51:01 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:20 +0800
Subject: [PATCH v2 07/14] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-7-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1834;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=9RRYODS3A2d0Z0V8KOVcb66YQ53zyJFTZeiR1EUXh1U=;
 b=zI/fFfLWAz2Rx1/Bo0e+EbbQoShERiEAOqxWMBxb+PzQbh3DuBOpjimccwD4p8gsYHq+UnPTf
 qnLp6+iodCIDPeqPBs96CqtOwscwnDXQLGLGX3o192BuKvN1lM195gy
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

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index bd2509985c4d0..dfe282c607933 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1100,7 +1100,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1171,9 +1171,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	cstate->num_dscs = num_dsc;
 	cstate->num_mixers = num_lm;
-
 	dpu_enc->connector = conn_state->connector;
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
@@ -1195,7 +1200,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)

-- 
2.34.1

