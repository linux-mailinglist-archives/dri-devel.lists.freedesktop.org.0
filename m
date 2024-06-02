Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6DF8D785A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 23:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEB210E0DB;
	Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z6Xq8bB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA07510E093
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:55 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2eaa80cb573so12723011fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364393; x=1717969193; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XPP7TmA+2loPDbWoPi/CAkxj5Sf30vQLf/NX5YqEivU=;
 b=Z6Xq8bB7Z4q5wvRK/np0TBX2vjFJ/FyukewN5n0QUCao4AaDNCbh0Gb4vL4cmfXuDo
 hnviCikoxSJDg9gZxAdSQ3jbujYQV5MexqbZ9nhVLvlUkFC/sMLBq/DSLmms95Fml9Ed
 qfeBfvrxlNE6O+bRTsFrRvEi7+QX1dERsIodZana+gWjKpFQt5SeQ2uGA+g5XTiBomN/
 KdYBWix5jJGVsCCOasCvnl3wSx1tGxAZFxbKBcD5SEWbqVN7jLO3MyHxpaRJUIUU08N9
 1sgGfJuO9Yq3mz0VYWx1kpoOE01HxHyOPso1N90MGUspzpASbWmXiRGljh8/XuseOUoX
 HM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364393; x=1717969193;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XPP7TmA+2loPDbWoPi/CAkxj5Sf30vQLf/NX5YqEivU=;
 b=faPuSc5n3rFwx6JtTF4fjVEJEc3rov4v/+0uxuHtm29NnMxmdt6CxiveUu3qLptqIV
 OuIGIRAz+DYKsM1Xy9B0r6lLAZQVLvoNjczpniygLZpykW9e9Or17UYpIWYwtg/ZC8Dm
 N3wnHgliLM16rKeHCOu2r2KVPQ+yUv7ZjYQfXFy5IqO2FKp+X/8LnUHpoatuig7+CTCX
 EobABebV+uQKgPH83WAgsn9eOiPpa5tXvE7chLHz6LqWhfmB7fQE5L7pOfpj8/OKO9EM
 mSlLmHPFVxqugLrJTr+FTf3cschhXFUuDV+2mm9/7TOJWo4DVIFn7kCdwYMM3jALkROj
 0rrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVudx/8Gg4MosQaYN6k2q0timNzcSrmwLtD9lot3/Zi1/TOtXjC9dHGAuFEa7f7UePSRmpZ/ftWECLQviLnfev51mkNIt/bLKt+6tdA+UYS
X-Gm-Message-State: AOJu0YwrOoE3hSco1BSfIZy/bBEi9BmgcHdVM5jpCi6yDKxp+vlsglfA
 Dn6cwfgiUGpsY1QZBKI+ZkTmXFu9m5etjN+m0VnZ5NT4034fqdZFkMOlaFqVw7s=
X-Google-Smtp-Source: AGHT+IEbxYhfr5BWh0fY46RehGCiDe1M1me+3HU/84kF94fWyajmCzJKEqCdJbVVi31oObLZ+j1wnA==
X-Received: by 2002:ac2:5226:0:b0:51b:214c:5239 with SMTP id
 2adb3069b0e04-52b897039f7mr4247950e87.62.1717364393634; 
 Sun, 02 Jun 2024 14:39:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:49 +0300
Subject: [PATCH v2 3/9] drm/msm/dpu: split dpu_format_populate_layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-3-16af520575a6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6568;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jDftnbrj2pWC+/GjrBG3nHnjwOHiP63BF0nUNAmtu+4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalMcxLGyi3hvL/tcFt6Pa0SyDpzweV1gsgR
 8F4X4NgvHKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1VJ8B/99Sl3EQgmrIPMsnA5GQ9v5T4fVl61vvtVJFXO291kSCyt7W1itHf2HBNzs8NatqELP1tN
 bj6YcBuHV/W5NI4RCqQ3VGW+lPx7mbFOmOABGnt6D+XAFf8DQ10EPVOuv9SPsYoghrhXPNEdWhZ
 uVw51W9A0+sYgtPSNLxB8rrRQUTbcRQSICs+Ys6zXeN/6ICxuQyGrwkFcRSKbaWQGbFEyppQk/3
 2G0A8guAM/ZoiBmQgEG1Z74PCnSTpxIuVrrXjIE7lDGdwPWuApB9QI7VkFmNqRP9ND8hGHXFU4p
 hspwe9jevPUlH0w3dqcw5ylnkxjyxBMlxFn1L5s+4km6Z/yL
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

Split dpu_format_populate_layout() into addess-related and
pitch/format-related parts.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 45 ++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  8 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 12 ++++--
 4 files changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index d3ea91c1d7d2..ccf2d030cf20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -584,7 +584,13 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
+	ret = dpu_format_populate_plane_sizes(job->fb, &wb_cfg->dest);
+	if (ret) {
+		DPU_DEBUG("failed to populate plane sizes%d\n", ret);
+		return;
+	}
+
+	ret = dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
 	if (ret) {
 		DPU_DEBUG("failed to populate layout %d\n", ret);
 		return;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 027eb5ecff08..c6485cb6f1d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -93,7 +93,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 	return color_fmt;
 }
 
-static int _dpu_format_get_plane_sizes_ubwc(
+static int _dpu_format_populate_plane_sizes_ubwc(
 		const struct msm_format *fmt,
 		const uint32_t width,
 		const uint32_t height,
@@ -172,7 +172,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	return 0;
 }
 
-static int _dpu_format_get_plane_sizes_linear(
+static int _dpu_format_populate_plane_sizes_linear(
 		const struct msm_format *fmt,
 		const uint32_t width,
 		const uint32_t height,
@@ -244,27 +244,38 @@ static int _dpu_format_get_plane_sizes_linear(
 	return 0;
 }
 
-static int dpu_format_get_plane_sizes(
-		const struct msm_format *fmt,
-		const uint32_t w,
-		const uint32_t h,
-		struct dpu_hw_fmt_layout *layout,
-		const uint32_t *pitches)
+/*
+ * dpu_format_populate_addrs - populate non-address part of the layout based on
+ *                     fb, and format found in the fb
+ * @fb:                framebuffer pointer
+ * @layout:              format layout structure to populate
+ *
+ * Return: error code on failure or 0 if new addresses were populated
+ */
+int dpu_format_populate_plane_sizes(
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout)
 {
-	if (!layout || !fmt) {
+	const struct msm_format *fmt;
+
+	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
 
-	if ((w > DPU_MAX_IMG_WIDTH) || (h > DPU_MAX_IMG_HEIGHT)) {
+	if (fb->width > DPU_MAX_IMG_WIDTH ||
+	    fb->height > DPU_MAX_IMG_HEIGHT) {
 		DRM_ERROR("image dimensions outside max range\n");
 		return -ERANGE;
 	}
 
+	fmt = msm_framebuffer_format(fb);
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, w, h, layout);
+		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb->width, fb->height, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, w, h, layout, pitches);
+	return _dpu_format_populate_plane_sizes_linear(fmt, fb->width, fb->height,
+						       layout, fb->pitches);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -388,7 +399,7 @@ static int _dpu_format_populate_addrs_linear(
 	return 0;
 }
 
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -406,14 +417,6 @@ int dpu_format_populate_layout(
 		return -ERANGE;
 	}
 
-	layout->format = msm_framebuffer_format(fb);
-
-	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(layout->format, fb->width, fb->height,
-			layout, fb->pitches);
-	if (ret)
-		return ret;
-
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(layout->format) ||
 			MSM_FORMAT_IS_TILE(layout->format))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index ef1239c95058..2f2bff14c0db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -32,7 +32,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 }
 
 /**
- * dpu_format_populate_layout - populate the given format layout based on
+ * dpu_format_populate_addrs - populate buffer addresses based on
  *                     mmu, fb, and format found in the fb
  * @aspace:            address space pointer
  * @fb:                framebuffer pointer
@@ -41,9 +41,13 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
  * Return: error code on failure, -EAGAIN if success but the addresses
  *         are the same as before or 0 if new addresses were populated
  */
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *fmtl);
 
+int dpu_format_populate_plane_sizes(
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout);
+
 #endif /*_DPU_FORMATS_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9ee178a09a3b..a57853ac70b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,10 +674,16 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	/* validate framebuffer layout before commit */
-	ret = dpu_format_populate_layout(pstate->aspace,
-					 new_state->fb,
-					 &pstate->layout);
+	ret = dpu_format_populate_addrs(pstate->aspace,
+					new_state->fb,
+					&pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		return ret;

-- 
2.39.2

