Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6BB9FA3E7
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 06:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A3410E2CD;
	Sun, 22 Dec 2024 05:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pCUzqQur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E17410E2E2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 05:00:58 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso3548814e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 21:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734843656; x=1735448456; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NaQTzRa7GyvxraeqI5vqmNWxM0qcr19enSqB7F9pnhg=;
 b=pCUzqQury6B2qX0YnbdHgF9Lv7hXKGUqefQ+lFzcGKblQLJ1ClJhuMjzAcWd9mYiR9
 qlCiS2c+z6I+SskKtteHWWcytoCDd/mj2xmV52/vO4VZItkPJkMHDXgdpCiZNf/kM1SJ
 1KO+E4/9b6yebLi1KdigmZOjlFKWSRc3NR999UvKCrjCeExiTEmvKDDERrCyRlNLPe3M
 TLJPwBANrwqnakyBpO4sJPzfWtAK0L5qf1qVYEg2tkEq79SoAzbSO6LRDz7IsdZ6Gqi0
 lPafDR9yKAb5i+4M2rXghk/K2QSLgoYUwa3U+5dN1XudUHyNWcVoundrnz9O3F8zwrPi
 sgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734843656; x=1735448456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NaQTzRa7GyvxraeqI5vqmNWxM0qcr19enSqB7F9pnhg=;
 b=i719abUQfcX6vVH5wOwD8Pv64eMMzOc8NaUeHzCUbvKhP5GJhMkGoFavN+cXwaFpkq
 +talbNhUrgaxaZPB42H+gCE0de2brooPmtNaGb5C1dQDfYaPT42lGxzcCJwZxFmWtrXF
 rn9xyufFb0RLXtjSP7/y89VHnjo2L7RS2G7DoXylFa1W+Ma193am18J9MF+wRze6ZVZD
 OI7WL0bGVVaUyyfKqVhyMXbr4D/BpDyECOdH1Cr+0+GEHOrP+zY+SqYY+VSM7CYezP0d
 y/RCDg3QyHtaNm2MkbZ/PVdW7AIX+2hHhSsMXgLdpQctBKWXuGzOPLBUuBFPLG5gX5Nl
 UEcQ==
X-Gm-Message-State: AOJu0YwnRayPefhWnVJgQgPrCVhpv8leLVSnlBbCsSuccE9Lr1A1OP2g
 uMfZ+rWcB/DFYjp8NPwSvSeIugvHtfNMdjvDJJpQ/u3tyXBTwKKHyLLM7uuaajA=
X-Gm-Gg: ASbGncsOCriv2qOiW7f6HhxV+egdkk3vW5OWSSMloLkotomi++69ghm//0n+Rlx60G0
 U/DVGVXqKxbCuizxIQuObL1xqdgop+Pt0+YxKP56KJQ6BaIkPugqjBiODftSc3ywwN7nanCICuS
 aFhVFYTVHUn19O1dvO9wpkHEDYnrk9ocpMCqie+tKJzK06+lrV+pkWQzegnIR252r62l31HQ3Sv
 X4Yx73ITQwbfBMDYS3rtpB4edmwoAvHm4SAqCChhUL0KuJ0r7ZTLKSob5Eee6fi
X-Google-Smtp-Source: AGHT+IFCHLgrjc5HUCgWghQmBMEv8FeLcEj5wjWCG0Y3qFK+eTqcI2LEnkuQNFWTsXWjWCzbF72i7Q==
X-Received: by 2002:a05:6512:1241:b0:540:2122:fad7 with SMTP id
 2adb3069b0e04-54229524544mr2818968e87.6.1734843656392; 
 Sat, 21 Dec 2024 21:00:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 21:00:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:44 +0200
Subject: [PATCH 4/6] drm/msm/dpu: move needs_cdm setting to
 dpu_encoder_get_topology()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-4-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3602;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o0B+a1EF4We4PO2V9bfhp7XNttccav9liOTM6iCtHpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z7H7lKvmpQPT9gsq35qp8BXSedRa8X6iFH/
 oDbcZTeZZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1V30CACrnY9yBGk9zsTN2C4/b/4NS4qlZM6+sC2Y/1tiUbIK5OOelFJxlAU9YUwhFjh3IDXOHen
 96VjYP4WOWeys786HTLeSzgDqoyfN1nh4HPZKyTruv8bnO4HOC+smWKvHJp7y0HOB4J7sVMNQHq
 /eBJ+zFbkuUUdpTiYwysNHbZHZqfQyXoUAqckbsq5eb9Ah+uqo6JnYRxH2cDZGg7fuvI+b1ia6G
 7soSXXUPF4As4NiokQVNEFyq7wT1N9hYgm9zhXfEWF5p/c691qcz70X9taEA+xsz3b7Q0R/RAC3
 oRClP3Z3LB3u5boHLR8PSbvh0oDS/eo0nAb6NLszMP47KqxO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

As a preparation for calling dpu_encoder_get_topology() from different
places, move the code setting topology->needs_cdm to that function
(instead of patching topology separately).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 ++++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1ccdca6044353f110bf5b507788efe368f223a3..88690191a9c9485e052d37749d1b61f50328916e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -652,8 +652,11 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
 			struct drm_crtc_state *crtc_state,
+			struct drm_connector_state *conn_state,
 			struct drm_dsc_config *dsc)
 {
+	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
+	struct msm_display_info *disp_info = &dpu_enc->disp_info;
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
@@ -696,6 +699,23 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		topology.num_intf = 1;
 	}
 
+	/*
+	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
+	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * earlier.
+	 */
+	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
+		struct drm_framebuffer *fb;
+
+		fb = conn_state->writeback_job->fb;
+
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
+			topology.needs_cdm = true;
+	} else if (disp_info->intf_type == INTF_DP) {
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], mode))
+			topology.needs_cdm = true;
+	}
+
 	return topology;
 }
 
@@ -743,9 +763,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
-	struct msm_display_info *disp_info;
 	struct dpu_global_state *global_state;
-	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
 	int ret = 0;
 
@@ -759,7 +777,6 @@ static int dpu_encoder_virt_atomic_check(
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
-	disp_info = &dpu_enc->disp_info;
 	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
 	global_state = dpu_kms_get_global_state(crtc_state->state);
@@ -770,22 +787,8 @@ static int dpu_encoder_virt_atomic_check(
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
-
-	/*
-	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
-	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
-	 * earlier.
-	 */
-	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
-		fb = conn_state->writeback_job->fb;
-
-		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology.needs_cdm = true;
-	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology.needs_cdm = true;
-	}
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, conn_state,
+					    dsc);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
 		crtc_state->mode_changed = true;

-- 
2.39.5

