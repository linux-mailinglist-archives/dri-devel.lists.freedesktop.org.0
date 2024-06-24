Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E854915897
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C20410E57C;
	Mon, 24 Jun 2024 21:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e87nFdOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEAD10E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:56 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cdb0d816bso2513438e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263634; x=1719868434; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PhAklPolawPNyeTmdPVqMJihu3ESGbzrA6xKl3WUL4Q=;
 b=e87nFdOHFl8POoMiWtQbhbcnLerjEQF8bOT1K1hf73PVA79VSyxnMfdUHIK8AlGs8x
 BuA+0kcQJCMA1KiVXMA6OREZujNccxxfQy9VDra7zRGp8cVCIHfpJ0MGJ60mOD5wYRWW
 n2RXrIBd0ez65RSw1rUkS8gp7Fasz1oQ8+grbw8YV/+/U9gtdxKyMq1Xy/GqFk0uLTuz
 czhFB4W+iXGMnBq4OdRNDO6zgb4n/j5RBdPyoRQaCbTpnlffuovKXnIRQEZRpBsBLvel
 kz3hERzho5jItixwCn8ocvUpnh4YcmzfMDBQERibl7QVcst5pfotwUjXEJdwlupmhKJs
 YlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263634; x=1719868434;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhAklPolawPNyeTmdPVqMJihu3ESGbzrA6xKl3WUL4Q=;
 b=nFegY8ZOzC3XF6xnqIG8J0g+JiSOwbzysyX/yG9QPjOVky8gfMPYDmR1PczH+rDRPB
 rLY8MXWVv1bqRgBMRVdGJPLDd0K38V9pwPEFyq1Xn1D33pqSX/yKLdKHlMj+ntTbRxqJ
 PSeM1xGPcomvLbH0wKVPI5W6pE7c1FPgCuM/GOgHDZMAbvujrIHt5RK5tQSk4b23faLt
 jlbkCQeFbzhQTVbFOfWiGdnxA1asq8SavIOTAKOvxkmAOm9UqapxFK5ysfoM3YizAh03
 lJuO6uCUy0DN3Smn8Vj0mvzXV1b6HiECrc1+tPy+jItnN46UGLOQ0BqESWgschl7ZpRZ
 3j6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNZh3fS83aeF7D8QsiDumI6l7o/2mXEE5MiwOgTqfPjR/3+TaL/SYPJKRm9kHAa5dnFh3ycGXh2oWGkwtqoE9k7lPPoGQ6ifH++jSpAbjs
X-Gm-Message-State: AOJu0YyWPg7iBPakV49YJCo4zk7laXbIHdz2r55xMHMG4MWVdQ/aCOlN
 a/y1ZIkHXHNYjCB3HW5yME4/dNx4pZyeVUFH0XSbSGPQ5UzwGSGGyXMyXZhtUuo=
X-Google-Smtp-Source: AGHT+IHhdzEZ+ZWrnvqcw1YESQv/ZCQKNsThdSxXfFNenYQAtNa5t8FE9yntzcrZNc+dr3XDZ1IONQ==
X-Received: by 2002:ac2:4984:0:b0:52c:816c:814b with SMTP id
 2adb3069b0e04-52cdf3463a1mr2001841e87.18.1719263634375; 
 Mon, 24 Jun 2024 14:13:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:51 +0300
Subject: [PATCH v5 11/16] drm/msm/dpu: split dpu_format_populate_layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-11-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6392;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kOHwFWSqYJBJbCyJFtpt9tNQmg4Dnx6ZWsh7BLAo25w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGIud0IZhVoI8kIxrjZXCuQ1bsyWWJYjRfvK
 lXJHP4j3ziJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiAAKCRCLPIo+Aiko
 1biWB/oDtOoRZe07adS2bwGVxrauaTm8jPFD6Gxc4tBH9n2tXoVYY8QU700qy3OqcTN2nAA4BgJ
 RzArduR3A4FtCpjrDNczHqSxEmLaxPE/ZQDFN2nZfgLtm5nJVaV5MD14rowJHIJxTWFV7Jdrvi7
 uPznwKp26Rh6WV7iJpEmM71UUagoH/MYggvu1TQB1n+EbA0FiyCcsfbcH8usbZWf70pcsFAIfe4
 vvGqpjXDYzlcJkPi8bwjv1cbucUrdShd1YDbdndBf4EyxPK/nRq9eP+UEnPs/9jPKn1Y7ey0E0k
 aAEkLSFAwKreSFty+Q5rW5focmGjWfuQGUGY0NVtSwgMTc5c
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
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 32 +++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  8 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 15 ++++++++--
 4 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index c4a16a73bc97..ede926d30285 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -579,7 +579,13 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
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
index 4d17eb88af40..abe3a1c0e409 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -93,7 +93,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 	return color_fmt;
 }
 
-static int _dpu_format_get_plane_sizes_ubwc(
+static int _dpu_format_populate_plane_sizes_ubwc(
 		const struct msm_format *fmt,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -170,7 +170,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	return 0;
 }
 
-static int _dpu_format_get_plane_sizes_linear(
+static int _dpu_format_populate_plane_sizes_linear(
 		const struct msm_format *fmt,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -244,12 +244,21 @@ static int _dpu_format_get_plane_sizes_linear(
 	return 0;
 }
 
-static int dpu_format_get_plane_sizes(
-		const struct msm_format *fmt,
+/*
+ * dpu_format_populate_addrs - populate non-address part of the layout based on
+ *                     fb, and format found in the fb
+ * @fb:                framebuffer pointer
+ * @layout:              format layout structure to populate
+ *
+ * Return: error code on failure or 0 if new addresses were populated
+ */
+int dpu_format_populate_plane_sizes(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	if (!layout || !fmt) {
+	const struct msm_format *fmt;
+
+	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
@@ -260,10 +269,12 @@ static int dpu_format_get_plane_sizes(
 		return -ERANGE;
 	}
 
+	fmt = msm_framebuffer_format(fb);
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, fb, layout);
+		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, fb, layout);
+	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -377,7 +388,7 @@ static int _dpu_format_populate_addrs_linear(
 	return 0;
 }
 
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -398,11 +409,6 @@ int dpu_format_populate_layout(
 
 	fmt = msm_framebuffer_format(fb);
 
-	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(fmt, fb, layout);
-	if (ret)
-		return ret;
-
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
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
index 241c2d7a218a..8191282b8819 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,10 +674,19 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		if (pstate->aspace)
+			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
+						pstate->needs_dirtyfb);
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
 		if (pstate->aspace)

-- 
2.39.2

