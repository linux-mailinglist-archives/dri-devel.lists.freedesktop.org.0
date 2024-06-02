Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DDC8D7869
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 23:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDF510E1BC;
	Sun,  2 Jun 2024 21:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NI+3vyEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA0B10E168
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso3408188e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364398; x=1717969198; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qp9FZ/KZqeOjUAWYJu0Xh72B89CvM0oCuzm0aVvXT1M=;
 b=NI+3vyEfHriqBqZqZ6oNFJs8Vr5GCJblsP1rzF7F1pD6laDP7VgLbRsAhVSlNlo07m
 CfKSZjLV2G4pbfhL+RdnRMFW8HQGXr/Ios5Uq/mfMdUl1ylV4u7ZSMXf6eKEQKygvhwH
 +rdeA+/UGoSepIrdTpKYJUtv+BMj6qGiM/e/48QAa+vpuiJQ4tqjiF4sIG4EGRgzBYjk
 uU2Jco8wNQ2LdGeRln9fi/Jq/kLDcn97KKhrWcY+bxmqKQIV1Cwtb1D1zct9qb50PG8L
 +5c1IAtufevfY26DeYu/CxWFrkL5EMRKRthR6U+YUIeEYrxDLE0ipJYY9YANMQIQsfen
 8ADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364398; x=1717969198;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qp9FZ/KZqeOjUAWYJu0Xh72B89CvM0oCuzm0aVvXT1M=;
 b=Y3bHLwimipxak5Cs+O+narS2GVLQYvM7OczvL3CCwu/iBtcjJlqLbuu9H4YMzhGFJ1
 0msipsv64hXAGC4DqOs3jjRoXlF64wrHK3yWzWTI+PsgdbLq7fCjIULlmjNJjUGHbwlk
 sRDhUKRLgek8kLf7XevnTKHnbuV5bpY3BSWbmlckoEJJ6V35hjuEM7L5ypLOCrzBSkuZ
 vHsk57pQXCjiSdsJvnFKfFk06tes/zn41IBu43ea7xRK+CiV6MtnITU3juMjFOCQUuJo
 ZypeODGXM7cnKqDxTw09qHtyF9wVG8JsHpLqfk4KuWVhik2N/TFEGgBPKC5pUXzeMoF+
 pXCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIW/5oRTPTv8IgBEDPUiZHs3C/p5Insqc9kfSOuQ37aGtaCm/NzuR2JhWwdEXuXhwfC2X/3mUoOa5bYEK2VBfDkXBbRqGY2DxpriuNJJ54
X-Gm-Message-State: AOJu0YxEOtKgrhhKvyytX1mJcBe7zkq3fqZ7oSPT/0yunvWFl2xGMlm6
 j75ed+3BAigH+W3x7TZrsPh8HWHfUqhBhWPvBfntQ5Zqu5VQGOr7C2/Pvi00TLA=
X-Google-Smtp-Source: AGHT+IEAwm0w8+Z8Ipt9kYIObuKscTEAB+n6TxakwofZucyV59zCcLs50ECCLJ2Qdyb4B8ImhnL9MA==
X-Received: by 2002:ac2:5059:0:b0:51f:5760:dd34 with SMTP id
 2adb3069b0e04-52b896c210emr4440368e87.55.1717364397772; 
 Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:55 +0300
Subject: [PATCH v2 9/9] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-9-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2423;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jidBMydco/5DfITBWsZBXtE9R50V90I/Z1ZObhQMr4Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOam196bo+wcCbur0w0TxnWzapo7bLGi8eHyh
 1s1b/+FagWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpgAKCRCLPIo+Aiko
 1QGsB/4jqxWpfJt2CtymybHgjeXtamR2wwkPVI7lUOVx/6tFVCh/kFSjNQIvSNTrSAjGc9raLAY
 UzV2uXTJfHj47KMauiF0MIRILFtI+NYgJI20prq1qL8LRbIg8objny7nkKq4yaOGSkg4uBJWhyA
 dh8N6h6TgMhkjfn6RDK35RDnSB11cx8scH66TxthrzPUZp+UDcXGV6pffQ2L3Sc9+iVH1k90Yip
 sdavL0VRZ0jggtaQLBIJ9D4b9qUQkAwMAjKxYVlXFLjYQI6XKd7DEeQ0nr21OmHY91VdzCeCfBM
 LBuZ5quRWDiK7bjYJR/KO0Rt5YKuICjTSHHzbBU1drr9ANYC
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

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
to the drm_crtc_helper_funcs::mode_valid() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c5e874a3656a..8cf063e4c09d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1236,6 +1236,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+					 const struct drm_display_mode *mode)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+
+	/*
+	 * max crtc width is equal to the max mixer width * 2 and max height is
+	 * is 4K
+	 */
+	return drm_mode_validate_size(mode,
+				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      4096);
+}
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -1451,6 +1465,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.mode_valid = dpu_crtc_mode_valid,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0d1dcc94455c..d1b937e127b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1147,13 +1147,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 
-	/*
-	 * max crtc width is equal to the max mixer width * 2 and max height is
-	 * is 4K
-	 */
-	dev->mode_config.max_width =
-			dpu_kms->catalog->caps->max_mixer_width * 2;
-	dev->mode_config.max_height = 4096;
+	dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
+	dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
 
 	dev->max_vblank_count = 0xffffffff;
 	/* Disable vblank irqs aggressively for power-saving */

-- 
2.39.2

