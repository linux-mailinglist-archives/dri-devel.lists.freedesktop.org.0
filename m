Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D409150A4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B89110E4A4;
	Mon, 24 Jun 2024 14:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j3SOw44F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71C910E480
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52cdea1387eso2148904e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240442; x=1719845242; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/wMlH4i9aSiV8SpOBL/K+Len1cl9ltJo+1Pe77n/oAQ=;
 b=j3SOw44FUby/kMkcTx4IVsJNaCUVxf3dwEx6DK3X9/Lua+S6wyGbndZ3/GCdxPepzn
 4FLcAMSyyMa1zCilnllh1OARBfjSCj/+0kizhj9//tXtNP2lG8wzSCrsLe0aE5Ug1G9K
 j6e2SVJLinETmsdHdLosq4NYzwZWnF2fpu8dSkGGkvYSCw51Hl93PUJaAk7LLqNxYjDL
 lZrV1zzl3nXtgTzcvdebEBg9scGiUfm0v89EO+2n9ia4MhWU1jCY1mpcFU6ZID7NwTvr
 +wKtCnOykJWcBUwAX2Yndu1s2qLjh16dxO8ysAKvu+E2V+EIsxqui//rJWzUwzVl69Te
 QmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240442; x=1719845242;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wMlH4i9aSiV8SpOBL/K+Len1cl9ltJo+1Pe77n/oAQ=;
 b=I7yHRHyy5hL9h+0+Weyct2R5PRVM8z69Qq0LoBMFfNnPT816meyAv+JS1nXP93S597
 +wBKJLodGaEpiYpAXVVGZiFdxtz0h5Fv8SVXK1gIfW4PN6hnAOSndRYk9h1j1eMDHpuV
 UtCZDHRqg+rzuXGBMd3flJdoksA20Hy50vBPw7l0smWO7FF58PWdNiLpQtsTYDkI1fVH
 uyZykaY/bilDAUdLndV2ED3Fri1eSB0HJlWLxrSuEcQpHuftiIehSVjc7NiAaa0ZKgVG
 hHSofX59Mx8Olb5CoBGVblRPkARBJZf8KgEb5cRp6baV3vc4Yyf3L5D/U97zZjJILsOf
 7rHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtX1fYkrkf2Zu7uv0EYfyoqmeRXmQHJiKbUzpx3L36Z2ecn+KySWhRoiqqo2B0JC6yTujqz9N7GnNs4Py93b/XD7eltZphO0eQtXVAhkT4
X-Gm-Message-State: AOJu0YwapYtjGxmUKvxdKk9hbk0EdaMpVqhhfZUrnMUGRSudwR44+LzV
 qCH/6/EWhjNcRzsdgur+Ui9AZbdD+MrnhFv7LuJz3sDC1mNfBzKFHMQKvsb9AZ8=
X-Google-Smtp-Source: AGHT+IHOAxN9ePVbrTB/XoAtFimmZlfCa9n5Eop29aMQVEk6fxSv+SAQazRrzqA5y2KgIZ/nhOoaow==
X-Received: by 2002:ac2:57c5:0:b0:52c:dda1:5db1 with SMTP id
 2adb3069b0e04-52ce1865a6bmr2557315e87.67.1719240442190; 
 Mon, 24 Jun 2024 07:47:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:18 +0300
Subject: [PATCH v4 12/16] drm/msm/dpu: make dpu_format_populate_addrs
 return void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-12-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6500;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qX2/vlKkitTc/3eHEtcQg+VzMmr91mJSwt7zTMIK2v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbwP+C8Kgs2yJXNSVMG5XxxthJCfV/2LqRY4
 XR+FA5VIHiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8AAKCRCLPIo+Aiko
 1bkuB/0azRQzUUAJKmL7Pp/O+zBzpDN7D4xgBbW1LWy9yRjB/kNTRpF0VNVIl6fJ4d+7hYnt4ur
 2lXVT2rxKrsg5LHM/cg0p70r4xKhLBf+2O/U+jUfONVkpJ+Ofl6YKwQdMFYNmZRHp9mwI4vL1Cn
 4CWL1TNewA2UQobpkoyEuSJGQp1g4I4+TQ9lYnEBwUTaal8Fm1fqy53zPJlaOeN241qM/CbUGwH
 D7VMx8lzr45oGsuS39AnK8yHVFiqgnfzJWPjdJZ8OoqcEtqKeBrnQiabPJC2newYC1eEBQrBavX
 nmqf+bRXr15wZKktvGPy6UBvssktFQJjdRkc8xBBOT/I6t7j
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

The function msm_framebuffer_iova() can not fail, it always returns a
valid address. Drop the useless checks (that were already performed at
the time) and make dpu_format_populate_addrs() return void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 62 +++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 10 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 14 ++---
 4 files changed, 21 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index d8e37400d852..fcd5a073e2b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -590,11 +590,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	ret = dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
-	if (ret) {
-		DPU_DEBUG("failed to populate layout %d\n", ret);
-		return;
-	}
+	dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index abe3a1c0e409..095bb947f1ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -277,25 +277,15 @@ int dpu_format_populate_plane_sizes(
 	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
-static int _dpu_format_populate_addrs_ubwc(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,
+					    struct drm_framebuffer *fb,
+					    struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
-	if (!fb || !layout) {
-		DRM_ERROR("invalid pointers\n");
-		return -EINVAL;
-	}
-
 	base_addr = msm_framebuffer_iova(fb, aspace, 0);
-	if (!base_addr) {
-		DRM_ERROR("failed to retrieve base addr\n");
-		return -EFAULT;
-	}
 
 	fmt = msm_framebuffer_format(fb);
 	meta = MSM_FORMAT_IS_UBWC(fmt);
@@ -330,7 +320,7 @@ static int _dpu_format_populate_addrs_ubwc(
 			+ layout->plane_size[2] + layout->plane_size[3];
 
 		if (!meta)
-			return 0;
+			return;
 
 		/* configure Y metadata plane */
 		layout->plane_addr[2] = base_addr;
@@ -361,60 +351,36 @@ static int _dpu_format_populate_addrs_ubwc(
 		layout->plane_addr[1] = 0;
 
 		if (!meta)
-			return 0;
+			return;
 
 		layout->plane_addr[2] = base_addr;
 		layout->plane_addr[3] = 0;
 	}
-	return 0;
 }
 
-static int _dpu_format_populate_addrs_linear(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+static void _dpu_format_populate_addrs_linear(struct msm_gem_address_space *aspace,
+					      struct drm_framebuffer *fb,
+					      struct dpu_hw_fmt_layout *layout)
 {
 	unsigned int i;
 
 	/* Populate addresses for simple formats here */
-	for (i = 0; i < layout->num_planes; ++i) {
+	for (i = 0; i < layout->num_planes; ++i)
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
-		if (!layout->plane_addr[i]) {
-			DRM_ERROR("failed to retrieve base addr\n");
-			return -EFAULT;
-		}
-	}
-
-	return 0;
 }
 
-int dpu_format_populate_addrs(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
+			       struct drm_framebuffer *fb,
+			       struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
-	int ret;
-
-	if (!fb || !layout) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	if ((fb->width > DPU_MAX_IMG_WIDTH) ||
-			(fb->height > DPU_MAX_IMG_HEIGHT)) {
-		DRM_ERROR("image dimensions outside max range\n");
-		return -ERANGE;
-	}
 
 	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
-		ret = _dpu_format_populate_addrs_ubwc(aspace, fb, layout);
+		_dpu_format_populate_addrs_ubwc(aspace, fb, layout);
 	else
-		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
-
-	return ret;
+		_dpu_format_populate_addrs_linear(aspace, fb, layout);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 2f2bff14c0db..256ca25c37a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -37,14 +37,10 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
  * @aspace:            address space pointer
  * @fb:                framebuffer pointer
  * @fmtl:              format layout structure to populate
- *
- * Return: error code on failure, -EAGAIN if success but the addresses
- *         are the same as before or 0 if new addresses were populated
  */
-int dpu_format_populate_addrs(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *fmtl);
+void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
+			       struct drm_framebuffer *fb,
+			       struct dpu_hw_fmt_layout *layout);
 
 int dpu_format_populate_plane_sizes(
 		struct drm_framebuffer *fb,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8191282b8819..1431ea753a4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -683,17 +683,9 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		return ret;
 	}
 
-	/* validate framebuffer layout before commit */
-	ret = dpu_format_populate_addrs(pstate->aspace,
-					new_state->fb,
-					&pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-		if (pstate->aspace)
-			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
-						pstate->needs_dirtyfb);
-		return ret;
-	}
+	dpu_format_populate_addrs(pstate->aspace,
+				  new_state->fb,
+				  &pstate->layout);
 
 	return 0;
 }

-- 
2.39.2

