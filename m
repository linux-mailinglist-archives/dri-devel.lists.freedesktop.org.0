Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1728AB965
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 06:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C1A10F423;
	Sat, 20 Apr 2024 04:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zhbaea4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D80910F3EE
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 04:01:22 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-516d2600569so3420570e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 21:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713585680; x=1714190480; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x/VxGMXcUC7972zZCvX/pqSyv12NV0CZxNoZzzTE6kI=;
 b=zhbaea4Lx6uOlSzVUakRRG/WDE/1ikhoQEvch6pc6/dPGmWqZjJkL1PZv3WHqpxN30
 7VBG1zWEGHSAFylaXdKz5496rgsDp/iI+C+YASxp1aN87+B34Q9dO/cqUZh6pdjVQPlP
 57BRixLrsS9wXhZQpndzhjD5Pz9F+LsJXFwaVck04jNR8bzoAmG/B8noI/R2L4aKkBOw
 ShwUrdn698OwabzEB0dVCe/ngLesBzZG2LjN6zC8/9PCI/dDWwFdc3hbLQDtC970Gi6D
 8AO/OY8n+23fOYzt8wVlKfeWH7DJvUU/grDoITPJZg4vzY2+1Ff3jsQ7xAnnpeMu2Zq4
 oxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713585680; x=1714190480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x/VxGMXcUC7972zZCvX/pqSyv12NV0CZxNoZzzTE6kI=;
 b=JJNkF6ZVTGqlAZjmDYmZsWqtGqW1K2VwaTTzYND9CoRJX6hU5l65euZZcQoOUOk853
 r5jA+17K5vbZ/n5o9tlkoKsZlb4JNwUKXinO36+ylyj2vNxl2/k4otO57g7QxpeNvw2Z
 SR1CR9LZjJsvR3wXSKHEnMQOGdOTdzYf+e1h02bsKQ6jpaXGWPgusAT8kCojs9hzrErE
 cqmU8vylIFQC1c69fwge2TXN+4lDa/4Qfc6hgMukJU/tHLKRClSAdd/HlxMK7EX9jqpi
 Kl89oGGntkK2jjoQkUnSNokFg3rHJNqaKGaEqksxS9Yf6zjbLdYNqYfZazZ1s0xxXI44
 Vt6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnAm8cuzZc1qLkfUKaA9nWaF8U6P52l6jU07CGIIuOhHDXW4EKn6KZFym/z/1zNRcqOBXJQNRREuPEQOWIecWyEWSRC5kjDumfRoGiFlsP
X-Gm-Message-State: AOJu0YxofgDcBrXQSD+LeO50qVQeyBQAhyBm5G8c5gAnB/jclsazcxSY
 Kyl3NhMRYKo8/FxKeY/vBNI+WecdbBx7HE+pWwlK07mlSE6v6e0qs45j0CCo/DWNBSKw5xAka+F
 z
X-Google-Smtp-Source: AGHT+IExfEx8mtIjS5cmRBdCMsJal/rOeQBcMIzLPL1KlsMhscz6HdMjaPI7HsEUj9jEqYhbV7LABQ==
X-Received: by 2002:a05:6512:20c6:b0:519:5fdb:82b4 with SMTP id
 u6-20020a05651220c600b005195fdb82b4mr2619745lfr.53.1713585680688; 
 Fri, 19 Apr 2024 21:01:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 21:01:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 07:01:06 +0300
Subject: [PATCH v2 9/9] drm/msm: drop msm_kms_funcs::get_format() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dpu-format-v2-9-9e93226cbffd@linaro.org>
References: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
In-Reply-To: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6653;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AuQCRrUqnRgpA+wocS6SRQv47Exck7/IT0ZD+APsLPs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIz4JalQ/C4huecCuIwaBnq4a41g+VFrXEY/0k
 5kyuo/oA6SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiM+CQAKCRCLPIo+Aiko
 1d7gB/95fNnDzI2OUr6Gjh7izMHsbdDyeuAtsuUWPCMo5pm+tRuaZ+l2n9RhkqrOourPY7ME1uH
 hwUzKuoFxQgX57jLZxS/xbwAbaOtD+u/cxNWxnD+9W9fpgqKlwtuyfvVEuVGJ1KoYNKjHSI8vOt
 MMUvV70iQ962b/z0W82zpmvIbAycbedL8/RgpEsfZndaL5L887ojD5dUztpVwn4Zz4/s9OyTm4s
 ECiQO/JghIJGsDgRJSVd4DS+6o0Kj+EhNiuFkeDRf+7xwlshH0T/23JmLB9+4VXzE3V/g/oVPpV
 74zvI9peLb5aH9Q0pYEelC0vfUquaEO0Up8zi6WCdicyHGBV
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

Now as all subdrivers were converted to use common database of formats,
drop the get_format() callback and use mdp_get_format() directly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c              | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c            | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c             | 1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c             | 1 -
 drivers/gpu/drm/msm/msm_fb.c                         | 2 +-
 drivers/gpu/drm/msm/msm_kms.h                        | 4 ----
 8 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index b966c44ec835..ef69c2f408c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -274,7 +274,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
 
-	fmt = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
+	fmt = mdp_get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
 	DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
 
 	if (phys_enc->hw_cdm)
@@ -414,7 +414,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	ctl = phys_enc->hw_ctl;
 	fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
-	fmt = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
+	fmt = mdp_get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
 
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index de17bcbb8492..d3ea91c1d7d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -326,8 +326,7 @@ static void dpu_encoder_phys_wb_setup(
 
 	wb_job = wb_enc->wb_job;
 	format = msm_framebuffer_format(wb_enc->wb_job->fb);
-	dpu_fmt = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base,
-							    format->pixel_format, wb_job->fb->modifier);
+	dpu_fmt = mdp_get_format(&phys_enc->dpu_kms->base, format->pixel_format, wb_job->fb->modifier);
 
 	DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
 			hw_wb->idx - WB_0, mode.name,
@@ -577,7 +576,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
-	wb_cfg->dest.format = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base,
+	wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
 					     format->pixel_format, job->fb->modifier);
 	if (!wb_cfg->dest.format) {
 		/* this error should be detected during atomic_check */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index cb30137443e8..1955848b1b78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -982,7 +982,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
 	.check_modified_format = dpu_format_check_modified_format,
-	.get_format      = mdp_get_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b92a13cc9b36..1c3a2657450c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -627,7 +627,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * select fill format to match user property expectation,
 	 * h/w only supports RGB variants
 	 */
-	fmt = priv->kms->funcs->get_format(priv->kms, DRM_FORMAT_ABGR8888, 0);
+	fmt = mdp_get_format(priv->kms, DRM_FORMAT_ABGR8888, 0);
 	/* should not happen ever */
 	if (!fmt)
 		return;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 4ba1cb74ad76..6e4e74f9d63d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -151,7 +151,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.flush_commit    = mdp4_flush_commit,
 		.wait_flush      = mdp4_wait_flush,
 		.complete_commit = mdp4_complete_commit,
-		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp4_round_pixclk,
 		.destroy         = mdp4_destroy,
 	},
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index a874fd95cc20..374704cce656 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -224,7 +224,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.prepare_commit  = mdp5_prepare_commit,
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
-		.get_format      = mdp_get_format,
 		.destroy         = mdp5_kms_destroy,
 	},
 	.set_irqmask         = mdp5_set_irqmask,
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index ad4bb2b2cd66..09268e416843 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -181,7 +181,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 		      &mode_cmd->pixel_format);
 
 	n = info->num_planes;
-	format = kms->funcs->get_format(kms, mode_cmd->pixel_format,
+	format = mdp_get_format(kms, mode_cmd->pixel_format,
 			mode_cmd->modifier[0]);
 	if (!format) {
 		DRM_DEV_ERROR(dev->dev, "unsupported pixel format: %p4cc\n",
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 0641f6111b93..1e0c54de3716 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -92,10 +92,6 @@ struct msm_kms_funcs {
 	 * Format handling:
 	 */
 
-	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
-	const struct msm_format *(*get_format)(struct msm_kms *kms,
-					const uint32_t format,
-					const uint64_t modifiers);
 	/* do format checking on format modified through fb_cmd2 modifiers */
 	int (*check_modified_format)(const struct msm_kms *kms,
 			const struct msm_format *msm_fmt,

-- 
2.39.2

