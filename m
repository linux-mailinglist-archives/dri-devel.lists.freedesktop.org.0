Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A0A4C481
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E176F10E452;
	Mon,  3 Mar 2025 15:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IrwTjcri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9D710E452
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:10 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22113560c57so86942685ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014910; x=1741619710; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
 b=IrwTjcril9Ceds4mku+3aB59dFRtOVnu60i7aQ2NbM1cT0Pkgz6iQVmeeD8BzvR3OI
 ZD2QjB8QDQ6MOklXiQM29YUJn19O/iJ4N2iyvKVAH1Xz9uluRLTp9UpN7eaxB7R6bSaO
 UTeTGGZ9qRoxcf2pQbLdq46vN3RpUGxCrd8zj05CjeyZIqVih3e93dyOXeVkdv/QrVYD
 IqmMF/ARlwfPA/cXfApYDnvLEiw8NxR9e2xj8GCJy/SGsIEGynNo/Xo/BY1wVHtGz+rn
 T+twDViqJzUqIpBYlYNNW8IjaREJ+m9bvP/qaSawM/SMiGBvFdq3Eg7TCOuNRuslkFBY
 bkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014910; x=1741619710;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
 b=qu8VJMDF9onKO9qhxX3kkEqZxFWTvNaJDz8sH31td5d08rMr2ghJi/mT1JTmg1ftc2
 vINMgJmDVD8m3MITWj+GrIwU6+NKDwUY0pPxMXOkF6y5IMHJNS+3n+HuyqLh5K96D2CA
 Hckd3ejtcDVOCzb+Jx11IIWop2+FJ+h/usQWK4xqdpPzT/dSPOWAZdE13JJjLbhndl6T
 Bxbjq+i4Lg7ZCiYZYREUL2payJoCki7wh5GjTAuN4ovBGsGTSn5Nov6Gb1Mgd5k1N9TI
 tN/WZ6CHP1btC6KS3KgSyk7wDRT07bJdH4kLw0Uq8MolApr+vxIE7WiJ1luTDUsdDxAn
 yurw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIVaPo0ay/YdiHTZcfc7TnvHkyrhE37npovC1LS3cTjQWAcIKmfLn0UyLmi1DRQ3VCp7g3HjE+GOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP+DhqOukI55F0nmIX5olEg0pX4WiL8Pvf89pLiQ+i7CwH19Rg
 YQIOpwgBPolYYTecsvAUZHOoMioBAhcLrxh7Vy0P2gQg1zbJWUpyluIZgM+r5YY=
X-Gm-Gg: ASbGncuXDQ24ZKuXkbGAamTo0BLeBrMHsiSMzO2vlTO58r1NYdLFyQ3bF4avOZ2TPqy
 c/T7piW6Ra3Oq+AM9kPNbTvKi/eLAqMH2LWpsAYr503roj9gfk3lMkScY5/rQtSZGT8qpuV6lR3
 QMy3D7EXpLmGK2QTFvL7fXzzq0Hyq8ONr+MrIjv/gnghG1nIJFWB9BQE+HWdTD62ffnzJxU9ziB
 eQDJTuppBrmWMs5fbDZ8kr+iUEEqnRHA5aVCaqi4VNm15WcvdBhvQtAQgMMaSBSRvJpuCQ041pM
 m/wiE2R1uijIpCloe/E4ISMNvLd9apG1q9+JrjgLfg==
X-Google-Smtp-Source: AGHT+IFXQFVV2iDx7zy3Vu2t/VrO3jNK2d7/LTTuBESSbmurMHpjbXZYGouAn99h2/O8Evq+lSAPvA==
X-Received: by 2002:a05:6a00:244d:b0:736:5504:e8af with SMTP id
 d2e1a72fcca58-7365504e9edmr6999431b3a.24.1741014910436; 
 Mon, 03 Mar 2025 07:15:10 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:09 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:32 +0800
Subject: [PATCH v8 03/15] drm/msm/dpu: configure DSC per number in use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-3-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=2046;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
 b=0/rhKu0LON5yZrlYDkf940GcbT6nSV69ScJn5vFP7k5m3Ms11NY5nPo997caC4RruAvKsAnc8
 vIrv6QQczDHBve5G8aFSo3D1SGx0UdO4M9SvMrA0P04XhlYQO87q5Ye
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
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d..5b98ae96bf5d46872a7af801d4157820d72af01f 100644
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

