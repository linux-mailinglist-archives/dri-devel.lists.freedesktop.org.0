Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182DD907EFD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E73D10EBF0;
	Thu, 13 Jun 2024 22:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RsduB2Y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE10210EBE8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:36:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2eadaac1d28so14656451fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718318191; x=1718922991; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bY4Fdj8LBem1j0JhiZYvE2hhGJdtm9/4wNp5qRC1HxM=;
 b=RsduB2Y0IGuljOixZ8z7o+GrRdekx8VjZJB53cX9PyxuBGeSLAAHW0oXnQY0b5gqBG
 qNlKJ0RfqePtcNLlR5+17G8iTU6JiHO0tHDZiWkYVPWdtmhKA8Xa477NxVeVzU09To3g
 T4QTv5tE7Eq8DtU2e6pO6I+zBnSNHB35G1hrx0iw/x6q3pYK2rtiK2xV7HLIfCEL9Rfu
 Dc0hr9Gxd6X+s+s2FsBHU5uu//fOM6SV78/IRDpVdiWhIOtd9YlSegumw7cE/RzksuWh
 kiOfX+MBcfAJ06iMSI8mj18k9iDQzmLp2QhQ6+wYg+Zb8F2fQ/7fq6lfXySPEQrqfJ+z
 Ei6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718318191; x=1718922991;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bY4Fdj8LBem1j0JhiZYvE2hhGJdtm9/4wNp5qRC1HxM=;
 b=KfbrhGUEfZiH5gUpyrPpnO00edT4aOWpxsD7aTmMiXny+WNrpu+SfKDR5dKd84JEPy
 CJ2RmrGIXg+SkW43ddCoX+4u8eiIwdS3td9CYWKwthPcZ0OHJXWKmF8p168on5D78Z+2
 U6T/9QHdael9DoBbySPFQR0v/1gvEVH6y6eoRkE8vwFUZX0aaKwAXprftKc0fyXs8OZm
 L1EBlipp0n2j1GSM7ygCRSV1zKwj1ccnyg8eRZSG1hY4evX2OTfl6RKBWDbJv1BeQDvR
 Cj7EQxn1n7usuy39q0FYA2+QnmAradeD3sYYzS9OC/jj3b/amwv8IDM2q2SGO2ZX/L4n
 u04Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF6iAc2VX0RhAz8Yy/X9bO7KbNDkBS0F4uw+o7HMkPX7iz9KeIKYHd+yt/rHTcWvGLrj/ldiWlHUNhU0uDRp40Kx6hk6AivvNKwH4aKgkg
X-Gm-Message-State: AOJu0Yyvg+VRyrDTHR6G1dGe+/k3Jc7s/WnGAA9qJX9sQbAL7IksuP5w
 e0jBVn9yd9S5Tnc5JKRwdcef7tTs283i/bzdAq82TcynYSOM0SkEswlb+6w4q78=
X-Google-Smtp-Source: AGHT+IG2py+4H7jt37FBEfwRxv0sXfQYiHwnRpgTcq1yNZuakide7ZoahBL0t1WvLFAHnD4eErzECQ==
X-Received: by 2002:a2e:7205:0:b0:2ea:e4e6:f227 with SMTP id
 38308e7fff4ca-2ec0e59e337mr7131841fa.35.1718318190997; 
 Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:10 +0300
Subject: [PATCH v3 9/9] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-9-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2Gk0OMDHQiW3uhDmJLEQ/urAc6vwlA6k4JGigLg8AG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RnU2cAhfsW0kpryawy2or81SC35WoohLjIt
 OyEwH+9gv+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZwAKCRCLPIo+Aiko
 1ZnjB/4mC7hCuKEZDzh+Akh97KN/xGwFn6VRH1/8fEb7ME9Y1HkeGiQk2DERDy1KHd4U6y2tDbe
 uEsPl+1gbs+TMxEFC9VPMmap6BB7ir92uClFDSh9efVmtApZRu/ztJUf6edgFlLcxtLpmc1vqfs
 7dtsXPS3y8sqe5OQAJd4vo5Qns+dt3AvQs+0rDSq4KRvgl6i4acI+qVIlVgwm8hNtxHf8fYvrH+
 Ea3jF8umIA7E9euQjr3PRctyD5yUSBsQcDyTf9FJ2qtd+Bqx8mZVy0zf9D3ib9nJqNqtUSZaBPB
 3flRryxais5gC4QhHT2GDAhp8qCASqoUNwR2VUsoi252bou3
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
index 5dbf5254d310..44531666edf2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1236,6 +1236,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+						const struct drm_display_mode *mode)
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

