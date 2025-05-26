Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1DAC3CCC
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA4110E310;
	Mon, 26 May 2025 09:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nem9ObeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AE310E314
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:29:26 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-73bf5aa95e7so1382666b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251766; x=1748856566; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
 b=Nem9ObeDtViW1SHLVHfjSvEobZeeXKa3dMseMQ/BuEJ82AETds0X4rDrzczAcGeDkr
 Pqae1e1dg6YGa3eilWrAIsq/ekxXbvNbrXJlWFGuCmkUPnS1gYtFy91j48gntdOo4NVx
 ZViZWilh20DtqZg2sO5tkVKeCcg/zPjN3NXYhCzT7NWOdqXxykFlK8hVTyi93yDJnGxQ
 igIFYa84ttNb/+Ds4EQjlPGdmzZsBlhLMnmnEVSIi2BJ4gnBwc/RFA84VVLCUmU6xPm1
 fXkvng1cHvhMkRFp9z745umwLXNw/vFGPNsvVv3ACP4NymAwjmGX0ZQqc3ZhV/bOm4wD
 xymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251766; x=1748856566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
 b=Mm3Qfrqe+g1etha+TALHajNOqLXyiClUPiqfC6NftfRYMk4wH6EmhqEqZgXm9yqZ0R
 W81R94syPbiD4lXqtvyzjB0me2w+DHMufzbVRrXItbgxdQwB9v/I40/zUC9AgwGlqKWM
 4kClF9xTTBlwvvfo7KGdawiXS2DKb6BRQHvDPTu6uhT6YZ7+eXuIPseccMvydFCE3bTL
 xgWeFY25Vq2ZSQfKAwXRnC5PQOkbqwtwEvadgZzZfAVyGKbPYT2NY+uMpoOykHcaILoo
 kGU7+rKSqCPdWB5sL723X6j4qIh4cUDWniblkt0jxtxdKO9b+TYUYWBkPZUz+mXK8nXv
 WyUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUxh6pW2utg2RfOCRgiVGNmfXPbgzTtTx+mi36QBznzB37I20O8NN61cZ5SxqYfGOw++I6/lOynpI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo4faOkqOfBpJOQDjQtEZyh1E2Djj27d4P/K5sq81iPlBEaf5J
 VUBjipV/o2zEK0cRHv4cpLnsd5QKUbhque4kCtF2axuGIUi6+efII7te11DZsP6NFaE=
X-Gm-Gg: ASbGncue7mgpbiGvGfKoyYOJ5V6UdI621n6ieLYbnYK8W0alyYOkc3i5e3eXAu58imu
 qHamXwS6/xcASr7htpOm4IPKh/bOiff0xQD15gl8MBbifIkOuwlgJwW5hyHxA3Ox9jfVWvEDqco
 kmGfUT9qZCwlyyHzKJaay3UqduJPtKfGPSUmTYzQmJNjw3+ygT5HL/+u0bTnirxuNqANuXOUgl1
 /vQowQ5A44v+5HOiiu7hqLdtiPV+XmRpdfNDHw0GZxytJTweQ+/8hSmxJdoggFVSgLNqk1zVkuO
 QLUsMq46CVIfX1zY9KJt2AqXmcqCz+Ol0jErEKPTEEfCK5ytcA==
X-Google-Smtp-Source: AGHT+IGBU2+X9RIttwmFp1d909ftMCV8QM76oVtcLcEN6kaVIzpX9cZHgBQ1cN8l9hiL0Bv/OYUGjQ==
X-Received: by 2002:a05:6a00:3e20:b0:740:5977:7efd with SMTP id
 d2e1a72fcca58-745fe01b292mr10482210b3a.13.1748251766134; 
 Mon, 26 May 2025 02:29:26 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:29:25 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:26 +0800
Subject: [PATCH v10 08/12] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-8-5fed4f8897c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
 b=UpshzwdRDHpc47WYogNvfnNWELf2045T5glAjSaMOQFc1v4LPx/qXu6iDqlflfI4UaZIUNLrf
 LWewYmH4X4FBtOCHV5q9qhM+SL745aQSzrwfrU/kXib3L9aLVxNH4V+
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index be8102691b99d3b381476ff844ddfd28fe17dc7c..8b6fa7ef78e2c0fb38daef9090dbf747c7ba111d 100644
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
@@ -2377,7 +2378,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

