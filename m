Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9477FAAC9F1
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E682010E6F2;
	Tue,  6 May 2025 15:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MjZcANpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FF410E6F3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:49:06 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-309d2e8c20cso7629057a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546546; x=1747151346; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mlujadKcoeKmC/n1ImzL34cvC3TJH9wSs5Ab3nngFQk=;
 b=MjZcANpMci+LpKzOsiMX81cFy3cqjnO5P72smZmQwhcnE+pJSFrvyXYNSQ/Ssm8Ojj
 0zQPCRhEgMzPEnQ66EUVAob56jZbw3aHlk73qvo/LJf5mhcIS5xK9GrKVdtn64aPzTrN
 TzgXv+t7YO6ZWFoPR2AWJ9r82zSyyA+peD+cIh4f7l9/DImWOEPNQY0IDc7pmh8qQ4NV
 RWNmNjLYijLhFFppFS8i+Pol+0HAJ1cwR1lz3Zz7TNjmcyN4ANtzDN12HVUdT30l6V7A
 EOM5fuakXUEWmnJmR3mwmno59Z6Wv4v5ymhCMK29uq7SloFl8DDRRrFcS8j9G8/3Ugcs
 SQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546546; x=1747151346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlujadKcoeKmC/n1ImzL34cvC3TJH9wSs5Ab3nngFQk=;
 b=K3vWEEbkJajBrrLQtrAzvtexd6gegyu13pYeaCdAM3dDZK9L9SVNQQj0y/Za0HK/EC
 5B1foe2Mg8D1YCuqA6DgdED+AUUKhj0GqBiGUMsr+Kj3iCWr7ZnttTymr8ViPQGExBM4
 OYkCZ5xcRD6USGs6fzr6N5++7HjFnNZl9RywO9Zy3KOSBxrXCjKl5636PbfXZ1FHS/r0
 rF21qrK2fJY0IVHoH0aXa/ESEfNMBR3oMWGskdaKYUnGIpCgYLZ2WXk0seuXJsJhMePU
 vHHqBacwP9RNuw4KsPnO8PEULd/GqcinTNfbacB6At22ezIVSniKoORIxv/8hs1Rrbqp
 zuEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR6DUDEH9gZ/jUNSBn+s7Jt1K/tpHC3PPNbjQShxAz1dudNZEpIBqdVKW7nrReeFakKYkACuHsabk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzklgoZmaWDCPqyOdMtY3mQZaF+mYqhc9RUKo2Q174kd6J9n53G
 8E7xIzwOsK/i7S8/XH1k2LAYr3UImPANUj46EanaOvnFtiV5KJbNIf9Y7JINI8o=
X-Gm-Gg: ASbGncuFrB+IiCs5GCD2U4oi1HHmcCjVmQfMsyUcxAnFTaEzS5JMOFWd28OynVu67T/
 P+GbNR72GVwNPlqe4d29rGunF/VgCY24BTuuLD4wT+pTHEiq2+EUhzMGR9r1X9JzihmeyIawSth
 4CYjz/gFF1PxK7umtnPexZYtZU74rHfavMrBR3VSxx/ORVZ2uFHZBaFFBC5P+NumdmWRc07xetX
 LudqwS9hvu1H7cnyI+O468aTVjkHBiuDZ1R2GQnVjHbWN90cHP1PZQMJUlN1+GTplCB2mgJ9Vcf
 hf3aCWZQJZy1jTp2kKgjEh3T/Eh/JkiYmmTIJQ==
X-Google-Smtp-Source: AGHT+IFS6FZoJuDcTCvjasKd96JWhWXD/99BvVru50V8guYaaSYjpZZUDkxGXVJl5z1Bx8ea/lqMTQ==
X-Received: by 2002:a17:90b:3909:b0:309:eb54:9ea2 with SMTP id
 98e67ed59e1d1-30a7e1af162mr4218720a91.20.1746546545635; 
 Tue, 06 May 2025 08:49:05 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:49:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:40 +0800
Subject: [PATCH v9 10/14] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1599;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Yfa8LfJUqX0nGl+TeNHAer8ejcrj24FyRlRcXtmXu8E=;
 b=68OG/s/ha4iwdzGf/813VdpaYg/VDV1Y7XAOiTDn9rs/YFaOBSRRGyeV7PRqMDvSaSTWjbIOC
 mZADjlPu+Q+DcWqr1m/ArwQt4pYpEZKx8Idi4hVzDMNBARl6PXUIDEo
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3e4ff345bd6d9c0e2a08274874fac40690409cf0..a125a477404fdafee6495f6d3778160f14a01a96 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2372,7 +2373,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

