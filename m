Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F3995FF3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 08:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60210E13B;
	Wed,  9 Oct 2024 06:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cz2Laoc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCE310E658
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 06:39:36 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-71e10ae746aso1460174b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 23:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728455976; x=1729060776; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UEHWg2NUfrC5myskQ2P1TzlN1mLHcnkoynuCkkPVEVY=;
 b=Cz2Laoc1DrbxuTXkmE+8rVfcAkTS99w+GUMl0+ykakm/m6MewTAtvKAut2to161cng
 ngU4RPGX+1mZXKWMXm5GIgB5LqS0EeUHeFbE1I0KjHiKaMOUg5QUSH+qX/zNA+fTvBcS
 OHkL9ceOixnhw9LvnuVy7KYs1pQT8aLVnaX7PbHRRmGyEWBQtEQluMaWpST842IfCtIX
 aAWCQXKr2Hqb5rM58zdOuvv++VWjjl4R876Fd2cInc3fQK6YygEJhAWCdrdW4vaGbAus
 4Mklhq4qpramQb1sJ72ZMGE9/wqq1PH/odkPFPEbswn9g7GDk9cs5H5F8zxu3wcMAQIQ
 rBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728455976; x=1729060776;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UEHWg2NUfrC5myskQ2P1TzlN1mLHcnkoynuCkkPVEVY=;
 b=Wu1Mi1chP5dQp7MvSp2akbSmyBKpvpWVVv1VIFuXBH/XfHTQF6Ju/zIuRwoT9wd3hQ
 2fnppTQAjTpOcbawj6pcBP1fgEJneUh11jp1LhpfLVDXDyC2OXVhX7fdBZpT5EzdHLcM
 TAdBNw5U05vtqCTvIi+52+4RCZaXJFJlSe/Ug5a+vlpvG239QfIFlJSFDDFlRW6vfP5F
 sj2XdSZjRYVgnLlIl/V5IjQ8ageGMX1iKp0Qbw8E3Z/eujUnElHIwW+7z9JH4HtdZrw4
 HlPKnbPkgHbuO4jtr+s7+qTEiAw9SZCICBA56q8LRe71k+PO6XJyPw+XrisCVdcs8IO8
 MCXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpOOZdnaSW5jp6UQlWHXPeO1TuYFRnmF//1gx3hCusltwMujoZx1mjz9nYHC1PtTp/juZeiJp1QJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBy8wH5CvCUS3e2753YVq2KFFKUVY9DdXwa4jOtxAbzKL3sTF+
 oecjMGZFyCnux1m+lbGpRjucfMtssdc05XpBjhhl1OWNlW83o7wPTx4AOhMIhV4jHktBrkL8fwe
 9aRHIvQ==
X-Google-Smtp-Source: AGHT+IEt2QNCddQYWVKfB6+oA4wi1uwU6EE4Epbp02LT9vvWkL/dw9e49n8cYO5z2fCivqAKNp9p3w==
X-Received: by 2002:a05:6a21:4006:b0:1d6:e635:5c5e with SMTP id
 adf61e73a8af0-1d8a3be3800mr2761351637.9.1728455975717; 
 Tue, 08 Oct 2024 23:39:35 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7d209sm7077396b3a.208.2024.10.08.23.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 23:39:35 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 14:38:43 +0800
Subject: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728455958; l=2326;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2C0WI9dOI0xa55HS53fJ/ajH3JKM6N1WB9VIImPfKIE=;
 b=HP+c/P4RyRLtj5qmtNP5ZJC9hnjQGAIDviKyYH9UDoC7jibslP/JuWcqa/HanjQtWNGuZ1SQu
 cRL+hjUOnJVCOllDwonK4ucg3fw6355uee/7408cTrqeln2DjhnbP0Y
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

Only 2 DSC engines are allowed, or no DSC is involved currently.
We need 4 DSC in quad-pipe topology in future. So let's only configure
DSC engines in use, instread of maximum number of DSC engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 39700b13e92f3..e8400b494687c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
 }
 
-static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
-				 struct drm_dsc_config *dsc)
+static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
 {
 	/* coding only for 2LM, 2enc, 1 dsc config */
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(drm_enc->crtc->state);
+	struct drm_dsc_config *dsc = dpu_enc->dsc;
+	int num_dsc = cstate->num_dscs;
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
@@ -1886,7 +1889,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	u32 initial_lines;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
@@ -1915,7 +1918,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }
@@ -1953,7 +1956,7 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 	}
 
 	if (dpu_enc->dsc)
-		dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
+		dpu_encoder_prep_dsc(drm_enc);
 }
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)

-- 
2.34.1

