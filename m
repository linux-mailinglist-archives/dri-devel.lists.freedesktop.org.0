Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45474A133CA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE6110E8D7;
	Thu, 16 Jan 2025 07:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Acnh41I8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E21F10E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:27:23 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2161eb94cceso6274605ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012383; x=1737617183; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XOd54Oaxtj4ucXZfUtJIBMoZPaiqx8aUpF5vM9t0qnA=;
 b=Acnh41I81W/v6rsmcerYP9x38SKamB1JLW5/6dUJGFwG/2O6LcLK/j1FWTo75Is6Yu
 TdiB9F2kTGdnlnTFsolO0sE7FHMZYvHrFU5OMRcWlPrR7qsfK8f2j1UDSB+hPKvDiEhi
 0B+9cyOoOySuyAW9Dmo/Sdr5/Mx3dUSUSPJD0jK5eYuya1turaeFuv4AwcjfsK5h76n/
 0+iBERgmIIWrRWSAZL7ELDOQyxFC7IyiahvSFArETn7isnF4rpuXrj1c0qOC1LNGEbit
 EO0qiBpdP9iJvPu3N26Et+P6qPYNEgoEOnJ59yj4kzD8pNqNt6oZJOwyNpEpj0rX3/rY
 8DVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012383; x=1737617183;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XOd54Oaxtj4ucXZfUtJIBMoZPaiqx8aUpF5vM9t0qnA=;
 b=Us89KbNSVAk4jKnMu2y9fBTStgDppSVTaRRbc6NdRld7Plv2IAYKa+HsjZbY2X6e9O
 D6vRQMqYqNAqPf4ZjTqhnVhpP9BccZXUuIXUNT7ib8ra7t6Z9rGNCzCSRl6NW8CCF1Dy
 lNuj5CijRTfySTclt52MRQaRPsunZHfnlnEVxxbiOKCbDdSNu4At20sPxcRVgfLM7tKS
 ZMYsUE4AIVdqnEaqVimE3Cnuy/eRq+AOYXVq5/xmYPhsCzdpduk7H5OogxLyxoUNcJqN
 WQ1+CuQR+qwkJfZwJ5GV3VRj9s4TTHFBMz3W/sd8xxgo3n+MDI65zZUrMqp7r6NkKcN5
 CSBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9XHeY6vrO/EGP4hpEA0hCZqMR8coxoMVfuuAeX7JwEjtJFOeEGTm5F9yO5epVGU3uROjrO48a+8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW2CVcixhPIvyhgvQSYPPe78QhRibaBzNN9Ix4E4QZouZsmoTf
 3ER+LxOr1jCftXrTxQppqpmZz9iNG2dA25g/zdRbtCcXuW+vWCbQ7tePcKPgGE3mqYSLxGNfydc
 V+/YK/g==
X-Gm-Gg: ASbGncugIgAjD7qCWLkmT6MkigvLGy4KMAtozprBoDz25pXNmETO2WiXgG9JNHhOtO4
 poVv+rNtz9WpVt84yqyC3Cy6r+ahixVanEKi/Yffq/xQN1oWmDVxw4qVosPI6iiVjs5DDX7Kw5M
 AbGqR8XKVQ04qZ3aUPXY8ZdC1TE/3O717npTTG8gbiC33XRm3BIhVL/BEQ9bNy2mT22TdAatAtJ
 F6DrvhPh1LO4GuTeMfa5yJCpiCJigSmMtXJ+r1Nf8KvMPPNh4ewUA==
X-Google-Smtp-Source: AGHT+IEPKbUKt7krJ1E1ELhcjbtRED/bN4UmXEpsup+C+sMPlLYr3Q8dykFLSQkXTNMVVlUhbN8ZiQ==
X-Received: by 2002:a05:6a00:35c3:b0:728:e52b:1cc9 with SMTP id
 d2e1a72fcca58-72d2204914amr48248717b3a.18.1737012382892; 
 Wed, 15 Jan 2025 23:26:22 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:52 +0800
Subject: [PATCH v4 03/16] drm/msm/dpu: configure DSC per number in use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-3-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1739;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=eXNECQiRO+b55BrnG8VsEC3fTpX4rkFaox/olbPegR8=;
 b=ZpGI9rA0Yep9WbZMzmuE3wpwCyq+V72ZXvKnbh0f+XI9vex6SP5rVpcB+Qe2sTRs7UrQAVBKy
 121EILuWjGBCW4075/c9hoc2vvbmgzvNIVTEpqVnBWk9jAzXMWSHNGb
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

Currently if DSC support is requested, the driver only supports using
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
configure DSC engines in use, instead of the maximum number of DSC
engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2..6603e9c03226f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2027,7 +2027,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
+	int num_dsc = dpu_enc->num_dscs;
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
@@ -2039,7 +2039,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	u32 initial_lines;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
@@ -2068,7 +2068,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

-- 
2.34.1

