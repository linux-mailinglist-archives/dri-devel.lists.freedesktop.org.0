Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD83696414E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D86910E61A;
	Thu, 29 Aug 2024 10:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GYruatb2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF8210E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:20:25 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-715e64ea7d1so346858b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926825; x=1725531625; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KqVaFuXRTjcV6hpBsvv8E/abzRWrI1lYc7ZkudzQdyo=;
 b=GYruatb2wsNqAjAFvu1efPoiBEKkshi1r2prrP0SmsSbllR6ZDQwludKq7y3qmnea5
 ptT2quL85fRimiQSRvd1T4Orj0+viZY87J2GXKdYC55JxZpHslL/dmpserk9KAr0scKN
 exNK6Lwu55LAWxdZnlIQMcUUHwhY3M6Z/ckCfh+ClsI5+WAkR4iHHsNxYq+Mv792nKnX
 sEaD3nvSzHb1fC6YcS2lfC+VJxYbFWQDsIPaNUVbXro7BJgfun+bkLAcspl/genWAavq
 B/FcbIzLCrZOyXh3DG6nYhrVNTSM2i56UfTwJXhUPZHI+UetDSlg14wUsQi8kZzc0PNj
 +Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926825; x=1725531625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KqVaFuXRTjcV6hpBsvv8E/abzRWrI1lYc7ZkudzQdyo=;
 b=PLP/DiPPc8/71PkNjualcS5zNmRx3O1r//ysqDxsfXK6+QJBSWCP19y01bpvaSsBVo
 B35TWDVeLXR/bQE4wktmx+IF3UIvoO9Gvh9ZHRVKztMQcPVC6mTRuMhzav/YIJV74f5A
 72KLqNfaSVektcv7FKPdYEzYGqC3kqmgLAYwbEfrJBDoaRarepgsozhdQ6FpTHFR0/z8
 0XfmOzMYP6eAoYbk2GZ7kizO8hPxTqJcqeyoo19JhYlc5//lQvOBFuD/FIrSUdyx2rFZ
 //ZkrlhLR989b56DgsxruUbW3HRvlmoZWRTen/c931Ckfu3YFyKjbX759NIy7xGrrcWV
 soIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/HrP3SheXr384QL+/xyD7Yxrsl9Bv8hJRsYz9iVDNz1occwr0ac32YPAOMMaMyKRmArqQ1TxiAHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUrwllsJFKxTwwJaeaWc2OTh2Etj7v3h+3zgalxIqhFCjtkOA3
 ByitjES4k0s8J9+Cekru2xnwN2rr0MxOJLLdmxqlMX2fiM4OM5dI/nCnQrr3AZU=
X-Google-Smtp-Source: AGHT+IFFcYQklmFqvsFpUrteERi7sYJuMzaDu52erTAc7hG9eMzpIZmxHDrIi9iF92E+PnEl7bRKMg==
X-Received: by 2002:a05:6a20:c908:b0:1c6:a680:ef3d with SMTP id
 adf61e73a8af0-1cce10479ccmr2252451637.28.1724926824735; 
 Thu, 29 Aug 2024 03:20:24 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:20:23 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:38 +0800
Subject: [PATCH 09/21] drm/msm/dpu: request more mixer for 4K+ DSC case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-9-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2153;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=J9qbpND/oK0fAXiMDbCuIZnkaZ9CaAJIulB/ZP/a6Ww=;
 b=2reSSKY4nTX2HXPWMGAjlTPGq8K51OYUY+VKwm+i9BINUgZREQbtA5f8i8d7LSSWkUPIvuj7B
 UDpmaeEAQAOAMDMADlR05u/TTonmyqRqi579jz6NI8X32aU6Ia4zUFr
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

request more mixer for the case that hdisplay exceeding 4096
and DSC enabled.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 05b203be2a9bc..33cfd94badaba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -59,6 +59,7 @@
 #define IDLE_SHORT_TIMEOUT	1
 
 #define MAX_HDISPLAY_SPLIT 1080
+#define MAX_HDISPLAY_DSC_SPLIT 2560
 
 /* timeout in frames waiting for frame done */
 #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
@@ -588,15 +589,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	/* Datapath topology selection
 	 *
-	 * Dual display
+	 * Dual display without DSC
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
+	 * Dual display with DSC
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 */
+
 	if (intf_count == 2)
 		topology.num_lm = 2;
 	else if (!dpu_kms->catalog->caps->has_3d_merge)
@@ -615,10 +620,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		 * 2 DSC encoders, 2 layer mixers and 1 interface
 		 * this is power optimal and can drive up to (including) 4k
 		 * screens
+		 * But for dual display with hdisplay exceeding 4096, we need
+		 * 4 layer mixer. Because DSC has a max width of 2048 and
+		 * a single plane can only be used by one mixer pair
 		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
+
+		if (intf_count == 2 &&
+		    mode->hdisplay > MAX_HDISPLAY_DSC_SPLIT) {
+			topology.num_dsc = 4;
+			topology.num_lm = 4;
+			topology.num_intf = 2;
+		} else {
+			topology.num_dsc = 2;
+			topology.num_lm = 2;
+			topology.num_intf = 1;
+		}
 	}
 
 	return topology;

-- 
2.34.1

