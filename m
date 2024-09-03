Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A29691F1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D5D10E3D9;
	Tue,  3 Sep 2024 03:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DbFHwn0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3310E3E6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:07 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f50f1d864fso55370591fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333785; x=1725938585; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TdplmJxptUI5vC4a8O6uUv9gCPQGqO+K3YZJZ67p41c=;
 b=DbFHwn0PZs7AhZ/G7mO8oocOUiS3hpV2ObC7sYwGDsdWvYdhtQ93VWv9f5pFA/gVeg
 Q8Kob8uC0P9vsOE0LRnxkk9Nsj6RYPl2qS0+UlfgjUK9Dm+amP6wT0bAsStTli2zT7bB
 lEvOs98JTCxrSNyGnEFQRl+HYxQthfT7Pzq6mIC7eVEjoaP97rhQTi2dQIFHX4jlZSyp
 pcroGnw0VCW+g0cq6Pry9/4HUZh2w0ZAuoZqPUA7CUohdS2pQ8qD0RIKwZxibqHQIOSN
 1aVX6kHPAR7TlHzHfZ7goLdyNpf5dMnzNi4+iR8OHvEbKXWwqZNBVTvwjWjWoUF5jnUU
 EXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333785; x=1725938585;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TdplmJxptUI5vC4a8O6uUv9gCPQGqO+K3YZJZ67p41c=;
 b=Hbolv6YE4XV2iv5gXiuOvge+mrXXo3XaP8rqQJji7qBII1wG+KDjog6wj6XC/mzC05
 IJUADgo4bQCQV200YaJHONsBYvAnQ/RYVmQ+Vvx/rPxMHGK2kBSJjtLH+prEmhCuYREs
 aKMDfWNTfSHoc5FviW813sRp5CJ2KuTFEmPynycDPTysQIxMDM3DczhgCtSznkqXixcL
 r6w7PHcehpb9Jg+i/zzXBBIt/eK2hC2GEvnEYdME0EoTGL4LdxmXhnJSED1H2lYGnTiG
 Pw/aT7g5cN5Bdy0gqMpai9l3po42Pvr6f0bSjbzc8Q5FO+KwF39VVSuHKnvAcAXTE30T
 FStg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURUU1VYOSnhspNay8GvQSm1IWKeofI76H3tHwyKWi8mKqowvHZl93I+hpCoPZD9tndlx1qbFjOR78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGJpzrqISI1QGaaXptkW7k4fBBCZICWYwcgqsMX2K8OIYXv7n6
 JhGAsmo5r3QIhAa++CFjpgEysXDCI68llCaI0Nj17C/fz9ON+IWG3XsizkJmlME=
X-Google-Smtp-Source: AGHT+IEOgwK1uzPezT8AfH6qRHEtNuFp5jh6ed6Oxbz/+Ff0gSLazpkDyq2/79FYkyfQ5VYW0A6ORA==
X-Received: by 2002:a2e:a54f:0:b0:2f3:f068:b107 with SMTP id
 38308e7fff4ca-2f62dc25bfbmr60611641fa.40.1725333784770; 
 Mon, 02 Sep 2024 20:23:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:23:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:58 +0300
Subject: [PATCH v6 15/15] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-15-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UDjBz+OwSb+7oXTheaAi3fvbBJbmIDiMCaat2ECDIjs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oENYwMah92zPW3oip3MLKiZnIUYlUa1xd+3t
 /kh6S7kh0+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDQAKCRCLPIo+Aiko
 1cilCACqQ65UqNGu66yj8Yc5UtNC4Bxr5eciWwcxSeEPiNBcvfgPl6Z/KH0YARNLuYG3fmD6KlW
 wAgWGaQj30qYfW9QlswHwi6fZuKIeEgyPlAbh7EdYng5U/RtXh8CkZ/7ypJrA74SNcxeRNsNYBD
 Dm/6c+To2HvdKqwrSFjmIipYV/BP8MBa+yEMBqk8QQ1mD3Ypydo8qVht1lu0f6/usIxo3fUjG7K
 TBvASFRwvgP8id0dUeerPnDPOqcbHiMYimEjrv9Iyd9EOvGWSPw9WD83HflHZURv12dXgSw2EOr
 DwIf1EXXOTm29dCsQcc7HoniYrAM2OIIPzCfygu5IhQn1TME
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index db6c57900781..58595dcc3889 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1230,6 +1230,19 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+						const struct drm_display_mode *mode)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+
+	/*
+	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
+	 */
+	return drm_mode_validate_size(mode,
+				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      4096);
+}
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -1445,6 +1458,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.mode_valid = dpu_crtc_mode_valid,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index daa42f289d2e..7083baf7d5ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1201,13 +1201,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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

