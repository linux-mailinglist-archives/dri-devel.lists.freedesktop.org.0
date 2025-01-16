Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06380A133BF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6393D10E8CA;
	Thu, 16 Jan 2025 07:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ypuETJdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC5B10E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:26:57 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-21670dce0a7so12551905ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012417; x=1737617217; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dz3TwZBuqS+A85PwaZAckZmjEANP7y/gVyTC1yHyCV4=;
 b=ypuETJdvEyuvrdbB39UHsyweMi0/IoL+BobmW3zONyYRZzmJauivnsHWDNVqhn+2K1
 qkCQX7EGQVISqlKtYjutqKTnFT3xfQfTYODcRK3F7c/7tHMOHwuwmd4J28AMiSIyfh+T
 sWJqOATQGNX4nIxtf+h1D75w91LIF6JDGtM1CstvZzQHBwXdiupNj3kyS4hti8psvj4h
 A9Hgqzc9I37OciH0Hl3fNvhCjR1Px3RM8PAnwjK/w51pInqx4MFLplcJaZu6X9qTN9kR
 Spz9nEUBEeoCRyqTeax97HeFf6pgJeMQtNEnTfaT7XRu7wo1UTxgscK8YEtluvMibbCy
 dhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012417; x=1737617217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dz3TwZBuqS+A85PwaZAckZmjEANP7y/gVyTC1yHyCV4=;
 b=cYZbFnktDBI1TFAWQXUZ9vXZjJGJzq0O1+pZpQhSY2o46UGxFzE4cfqSfBkn5M+s3N
 Hq3kreYhv++ercQypoIc+NBtHkwiTvCHyqUFAI9hxl/tEs6279tvO5uBU3urZC1be7xD
 WZqXkdxLZE2qlBZXfAQO6e4VcOHsDTqdEtP3OcaeCT6+Tgxt7ecwIJ7v3uDd1cIs9DOE
 7JDzeYfC9X4tOj3xKGPIOLP3YCIU/JVfGkFtBCIlduSVlVXQTFeWdHTMe69yxEMooWzE
 g667PALnq/cx7D1jSe0Tc46vIx1mt4tuciu2DFYNJCPeQC8il5BkALyyU1/TINT5OcmB
 RK9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL+MEYjf/VzvtG2N9ZPYR2298IWOkJb9HdSWEY+DmuwJH8nqgSu3wGt5Kcb3drgqGXmISSyA93SqU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd51oDanGNMjA3xwkEkhQqvvT+HJ/yREcD1pyiQWqxTtRGZzQh
 xv9cVpzXhVNwZc4yf2PjJqnrAXcPpEStIe/7YS4QOPXDqLHtUfINBGM8Wu39ZNE=
X-Gm-Gg: ASbGnctq2ogBv+K1+F/SoZL/4QdDd+9HrOqtJH9d//W6I9GtJYst32hGXielVJ9/xJi
 FG0BrAOyhtCKfeM6QpFKuvWXfJyf+2wesItE1X3ENLsl8rU2jqoB4o3DoAUJfHu3pnpKafgOaB2
 clYPmQBo+3J0yA0KD4uOjE30drk4FyOehvHqaLOJYccOTA5mDT6IzWLdMivCbIPQzlgEZxs4ix6
 LvIRFuKW5EGJeBP569aM1DY1BWdKh8V9mDEnDFjzJsd/ruRsKAF9w==
X-Google-Smtp-Source: AGHT+IGtMdMvQChRYDu6ipGP81wNRXfxlja92a5bcTceBrSH3LTru10XcvFatgNuBJMIKEk3mvL9KA==
X-Received: by 2002:a05:6a00:e83:b0:725:b7dd:e668 with SMTP id
 d2e1a72fcca58-72d2201700cmr41671382b3a.17.1737012417519; 
 Wed, 15 Jan 2025 23:26:57 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:57 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:57 +0800
Subject: [PATCH v4 08/16] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-8-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1981;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=fkwBKTtkClcI8zzn1B9oiPX8S9btYMX+2rqgtJiEZXE=;
 b=80/re1ViVNpyAQG3L20/2X75joL5lrM9EVkvlA8YAUQBWQimA7nvNtD3KQVN0iYfWhEtLtu48
 w9oiV09z4p7Ax1m/RcCwDtdvkkhyvZL6zeMtSGUKAGlnIhfbXByaNMe
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 42aa685e421c7..1f3054792a228 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1220,7 +1220,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1275,11 +1276,21 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+
+
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

