Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9444AC3CBD
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1106710E306;
	Mon, 26 May 2025 09:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AaCQEhoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC51110E310
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:28:58 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so1715779a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251738; x=1748856538; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
 b=AaCQEhoQac62llyefXZlCNnO/dAtPzmhhe7nC0FJeCKqV476u2VPJom1ubdX9einQ9
 Kw+ydh4znlc/+jTHMtpaKKbNO8w2HTd4ozas23sPLrIgDjiEfnCHR7KHnrUaQzyypjy5
 yPrLi4YZQ2eX8jKhq2bvO/Oq19pLZ6kH1Wsr7pAna5saTLnC/qKZyGqXcfK988zUr8+z
 PYq5XkK6h7tthAkL1/eMm419keb2agjvoPY6STPP7FACnyD5NuOiEORQ2hnCvPMVPpAo
 PSimnq39IFkHDvQCAOX2xjBeqKpn8g79hquEw4V+PidRECgzHtBDNYUtvZe7LBFB5LHs
 QDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251738; x=1748856538;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
 b=rxJuNMuVMHaugCuoKF/++h+NCLAfXlifb0rmQD9uUgBRDYSqnhOYMkeVgtlNl+iTp5
 H1TRJ+FII5N5sABEIkFdnD9dC+NEPEDhhdGqyngLWQuPtSPJPdZPlQ1+9l6WG9Qbo/vM
 cJtx5+V5JA7V0O7E1o9Vx6KNJH63yGPtF2f9YXgTM8JT+plrwDJXFonw+8Mlt6TAbhTz
 3rYaDbelejA++A0SeUYBAxV/4P1b3KaHlQ6Lj919oMxg8DQ1k2laRm461dEinrpScQgH
 8o5d8CNbYGpEpYizrWAxFJrO8gVLd2Matnt/6u2XGuadDyIFBNuENhEvg3RR5pb0SkaP
 E9cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwCr1dbmaP4YS3AetRCdo1+tnCFNMw2FgctY/qqf370klG6eurCuIPatUblgR39KLZgSQFidQVDuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW4BFog+Nav3lsbS34KDUOPdRblZ1LR64SsXNMMp5ki3WIzALh
 J8BP5B+c/ogIQKJdU3gwRGrvoYCqf67R926ykGpe0CChry9oi84IQegQVSc5K3FHJAM=
X-Gm-Gg: ASbGnctzd+kSON/vm1TMA4YEnAHSu3hOYC/IhdxrdC6N2CKLb6lgeiP35a8QESXS0KX
 jAlfi9yv9f0+xnLqvcUNWX15FpDcRb9T/53jnwjMroBxcxF1xh+qPNE+lu4/05AhZFowO/xWJqR
 QbIbwmsYHjw7Mba3o/ILARLlegASehsHoB318Vd5PF95rDVxrtGegas1b2VxuCdOwycKLEdJRb4
 vSEepv7R2AwIGaEEmZ4jM3RX3BOg+5MofruTaXadxbXWg1Kqf5SKGOzpNcJJP6s53IxQtFZwYqX
 QepDynFhZN4F/jWKuW/mNEWboh+tiYokA4LZoeJekJ1peFxGrA==
X-Google-Smtp-Source: AGHT+IHg731yrBi3amdlRqRR8fJoqCAqCFFXApSAmT3tMnMtzw9du/a77ZBzV8cgtRweVYwDLfUSMw==
X-Received: by 2002:a05:6a21:6f12:b0:215:ee8f:9930 with SMTP id
 adf61e73a8af0-2188c37400bmr13100446637.33.1748251738197; 
 Mon, 26 May 2025 02:28:58 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:28:57 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:22 +0800
Subject: [PATCH v10 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-4-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=uDQ4bz8vnlfaTdZAeHvnaqmYz1iezU6QmXEPd3wO/d8=;
 b=mLvib70zbFHGz2cJgp25wrBgI33CfCNwmyWLywg1zVcvHZpswrxfEMFZ+zHOGXd5FPM9dVBiY
 r6eiZ77IfCqAKJLC3X81da4kjM0dw5FvCZfbwjjla1aUKFNhpJTfNgW
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7020098360e474ee149824a488d912a7ad8ed06a..be8102691b99d3b381476ff844ddfd28fe17dc7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1157,7 +1157,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1236,10 +1236,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

