Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E8BA1537D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3BE10EB29;
	Fri, 17 Jan 2025 16:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j5Zej4R9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABA910EB29
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:02:25 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21680814d42so39080845ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129685; x=1737734485; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CEVWVBq2xXs3gtt987wJdWPaa0xRoePdABgI8idn7OA=;
 b=j5Zej4R93bgTsW3/3MoDzMn6+W5NyScpLl5F+ty3rsMfWAzS5Q6XKbRsACBlHLl6QD
 hoCO9mgLKxH1afGcaWxW3sw5n5+Qn99m3UD/XOyxdcKcz/K46mBL08cPUeQv9k8e0mE8
 MNKYlhok1GBa9JfhfxdokryLQtpjnP2QVV7hD8sVvxmASBN+hA/Ce1NTFJdPeR2o/Yyz
 CiqGolQqGqj9rCqC3SOlDqDqdwghp+ynT2Hglhn2P/CsgnfwglJLGYkbSYlZgpoKBlpU
 IlCJq6XMmkM3pSoz0OZiN32X+Zac3/34tR/00md7CuA5cJsAx5dyyE1fjdo1NYCT4bIv
 A8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129685; x=1737734485;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEVWVBq2xXs3gtt987wJdWPaa0xRoePdABgI8idn7OA=;
 b=i67M7xCU1LwENwStPtucupi0vh88i4JhMcj0njQtUhEP8xijtojgQ1oOUlHnQ8T+D/
 lbGbLDjDLkNBvsAzGSJjzxBfVicuGy41lb9rQ322z4eq4G0TFknUNq0htWCbf/KBBroz
 lnHKBtKEiX3u279xU+OCmEbU4CbWpqWI/fxJOjkhid8vvFq0MZykXpFfNQRlN5ELqgEP
 3WiQteQV7WtauGV7KXxu/y+Cz9aPP+FZRlk1iW1J5/VFlOuxl5s5GpNNfCItkw2hEBhS
 7FQA9Zi021APbpWRayeZ2/fj+Toj5d3b6Pd1kysOIkrHoQ+gDSFBzg8oY04jlJTISnp5
 pEog==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8WcgcAk5BSG3VBGrS2UtIbtttX1yO1OZlo4+wca7P85/tb8oswaSNlRU76R1t00oMImchSZ9d/Ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYjZ2JKmGayLxuwkYXGs2SuAyIAFKmUCBDWaXbsi5D6GWf9C/b
 BpnZe2xfPn/B+XzqGc6nW9YbAKSSEJ9r+GK467Pj99IQTbsccQQCu1bwiwZZvwM=
X-Gm-Gg: ASbGncs+gv9AMmE/L0rjPGjY8co8iGdBab9582MJ5AFCeQDxlB6X08imNhL2piL3Hzz
 v6Hs9Dk9QQyrzJaMLZnmeoMaa2bQfz8WOlGAZbY1KTxni2V+oT8dvBOtqmFBdZH+X1d7HSYx2xc
 br1qVo3UFbJykDpGMN1c2taegGlx5j4t+fv0BHOL2BKDUSY8H2FC42P8+dNAvL8kg07B/jsANiy
 aSmKtm+MtYfCJ7jB7lLQesllx8wuUUT2bk03+Q0YhNFgl7ArH2pWQ==
X-Google-Smtp-Source: AGHT+IFxJrXP7faCwGCcSMWQrZZnf2BKovwITEHCqVUVHulJfmXf1NI1iyX2QKY8MQVmxQNmi+lDyA==
X-Received: by 2002:a17:902:d491:b0:21a:8769:302e with SMTP id
 d9443c01a7336-21c3540a3a8mr50050375ad.14.1737129685136; 
 Fri, 17 Jan 2025 08:01:25 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:24 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:46 +0800
Subject: [PATCH v5 03/15] drm/msm/dpu: configure DSC per number in use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-3-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1936;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=/IJAxmB/BdtaWwEww2aruOsoZxn/wFwYKiR9mHwh12Y=;
 b=PLo9rqMZUByQATi5cKV8NUWFtCY8QhDLLM6s5AvnWUqWUbZhgrg7FHqg5MARotXFVwlKreR++
 rPEi1c1y0aOBZJuYSdaP111TKAA8kCobONcSU9H+lCXL4S+swJF5WOq
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2..5b98ae96bf5d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2027,11 +2027,11 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int num_dsc = dpu_enc->num_dscs;
 	int this_frame_slices;
 	int intf_ip_w, enc_ip_w;
 	int dsc_common_mode;
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

