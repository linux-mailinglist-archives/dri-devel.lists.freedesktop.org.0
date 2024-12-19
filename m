Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A179A9F7615
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1497610ECA1;
	Thu, 19 Dec 2024 07:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nU16alIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBD510ECA1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:49:45 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2163dc5155fso4251275ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594585; x=1735199385; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YL0eJAJsn+bF1xqyLJhetwK7icVAiboBpbquincLAUk=;
 b=nU16alIa/lbOMn3BdsOxFkj1Ft2+md4DNkWcx8KH0GfE0W1iFP8Y8aLLYESE92OAmV
 1IdKPOYc7ljjOiUNwcYeUQpbPutYmgoHgmaP+NBlaBcx9kQYNw5TWhfp6Ppt+PZ5T0Gv
 nGtAaglKrwRn8kJXzwVj2w/P1ncNendtlGNE4gPo1stulwhw6trau5diG5vaUnMZFHi/
 ybnWEqOS8VoNOAJOJs8HCDmc6MFM510N6zFJpyMAw3UC2FHfZAbXffA/Y2GIFOob6Mli
 8TZuzT/4Qy7hI1xd2pE0hR7uKa3Tbkkj0cM8oXrofvbEC5r19bBBFkO11uuSMMiayawL
 kUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594585; x=1735199385;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YL0eJAJsn+bF1xqyLJhetwK7icVAiboBpbquincLAUk=;
 b=h9rNHj8GmTyFQ7tFJPiejR6+bxTXaP/0mEVbKuFWxj9bKSLv6iWU6GWapM39Guhiwf
 JUvRWO2vdrzyFKvo8iXg+b95pXJXOiAoeXShKVWTTkFUMO1hk/lb9fxlvzcJx+Zn7b5t
 bbft6T0A+9Tp52b4HxBS1MOZvSNnHAHfjwtHseKkdobnMWS2clfVdcFcm/rGn6fIlv49
 MJi/+5QVIbKN+DmnSXLL7TyoDSKdCTeJsEHY8GEhmS9Vw0p3O7ACqA8Gd10kZiMcGSvh
 AKNTUwYaoLpzODGN3/2HlZZZVTWCWTzCOyVRIF1VAuOHJaU6WSYp7j5ewHXz/Iookfik
 iMKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKkeW2geqfHL+nNKfQv9J+uUkcUnoCYl5hkkbHDgGllUyvkkDNYquBuT/hCElXtxSueOybHaZeY9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB3N1Nk1gPFgTuFcg2zYkwph7WfMJZpYzNz69epLnN73+1nBFk
 LHTV6SvzhO/wg0euKFkIf/Lh8ejbEM/3MrpFSbsrthrA8zfVi8ludw5a839khqQ=
X-Gm-Gg: ASbGncsJiJHAr/uZ/YJcLPs0rs0LOM0hesJnhK1A42WwGXe0pnKSBmLKdp7dhyq23Qb
 O0okb1gwR+sS5olxPKvLU6PHFmXwT8fyYXKFYB9MRWp+A5cvTBuFK9y/Bfr5hQRcTE5NlVu9BrX
 KjqXz3IKRE0WA/2L08nsKnaVXW7R/dajTi8nwrcXaHtvYUxJ8XdXm6gH/mRGqGlZWikwYBLb9DR
 oyZc4dlmha6ZXhZupb5ghCMkNDPPdTAkmVjOSAgUpwDaytQP0F+sw==
X-Google-Smtp-Source: AGHT+IG8rv5UfI7SqBNEnpsP6TqIUeKqwCRsTWaZTqEBm7avzTjZMTdrTbSgeuVwf1Up9AP+9yofcg==
X-Received: by 2002:a17:902:f542:b0:216:554a:212c with SMTP id
 d9443c01a7336-218d725b78dmr84056735ad.46.1734594585506; 
 Wed, 18 Dec 2024 23:49:45 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:49:45 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:20 +0800
Subject: [PATCH v3 02/15] drm/msm/dpu: configure DSC per number in use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-2-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=1681;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=dEsdzF1H8mOIfM+sxcd5TqOuqI1FUZfMvRVAMT2Swjc=;
 b=rrqwTWpMtEAIaU36uDB76/XIvHkIBNMil6khUbR4tZDKfFmCUSldk1LyQIc7lN+lIjC8yU/yR
 uHMpx/08OwiCFgHnHxKMoea7xtwZyW5YCHEUxhMwkxJ2WVoHoyjsUse
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
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So let's
only configure DSC engines in use, instead of the maximum number of
DSC engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 650df585138cd..cc23f364dd080 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2028,6 +2028,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
 	/* coding only for 2LM, 2enc, 1 dsc config */
+	int num_dsc = dpu_enc->num_dscs;
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
@@ -2039,7 +2040,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	u32 initial_lines;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
@@ -2068,7 +2069,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

-- 
2.34.1

