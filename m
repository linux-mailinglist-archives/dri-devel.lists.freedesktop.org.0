Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44959691E6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0D710E3E4;
	Tue,  3 Sep 2024 03:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bmYOUuI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1E510E3D2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:02 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f3e071eb64so68458241fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333781; x=1725938581; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vn4y0gVtwJEmmSUaMDUfTbNnv5xg0I2o5qI5Lo6C+nI=;
 b=bmYOUuI/WBaHFLULEh/Drql1ab1mhD5lZgOjIho9tuNlXeanhjscnQ8e5d2pMxsggs
 NWGZVfOvjfjVmChB+idZcKZhnOKTpKMnhC7NBYMHVCwa/+ilddlEyg4uAbnCFwdia42F
 b8J9pTYdxoTvoCznm2ycHJirmhWyn9hf3MO/QcO51n/5R8Z/8M/605wRUcLN5TDv7j64
 YFXDEreU8ke6sQ6VNj9Y0a2qEA1BhRFTxP2aXBUN8BX6caSV+cakUAKQRe3n7IZYB/th
 BrRjsgIGiQVesKd+0VwKCXn1vMoPHsfrrvC8/AkCQq5nWZeDQA+kf3xN6pa2fZUWTh0h
 OKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333781; x=1725938581;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vn4y0gVtwJEmmSUaMDUfTbNnv5xg0I2o5qI5Lo6C+nI=;
 b=odukRNqHTYMkwDDMvY2xDAq20ed/4snPDVy6OmVEf1DCJxqjNWQByK49vGwOGpZq1Q
 k6FNluY9gt0Q++KGGPc2D5U/R3NlRbXkiZvS+yF83k58wEAbabGTbTtNrMmKON5g/UiR
 ttuHxPp61jsLXlQcUwGX/Jn/S4RYmv3m3DBdq0UD++9VMqsCWz0cgwaBKknycm+Cf5O0
 Qj8JRhmQKGBUNq8AZHbnKaIjUVQZiUO5bBH0+SOdaaqS8GthNJDebLLK5XRoGmPznzAx
 NLQFUfV2SHGQDGVoxiJ6Xe+osDUJSsQUADP2XDRUlohADzCmsCuZrlVsQRKWraAntHcr
 KMvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHHP2io69ylc/lxqd3We3z1KymaZXVUBUTl/doDFuVHQF/2AuNI7/rrnuEt0VQxIvRIi5UKdb3Onw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA24jWABFG4jhNMX/nERxO7pw3ewxtf5d9ogDAVVxhcBd1s3uA
 ZR2UOT10Qg9eipIYWBsnDwy9mnSvBYbvFaYbFakZDRaG2KcGtRihcbtBijPOJxM=
X-Google-Smtp-Source: AGHT+IFfakhBSUwZNYaA3irBZwqBs+aaq4Y/jhBv4IZq4oAeR4GFjy3SZe2fV1GmZjkCukypIR7QwA==
X-Received: by 2002:a2e:6111:0:b0:2f1:5d61:937e with SMTP id
 38308e7fff4ca-2f610707e55mr118590661fa.29.1725333779948; 
 Mon, 02 Sep 2024 20:22:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:51 +0300
Subject: [PATCH v6 08/15] drm/msm/dpu: pass drm_framebuffer to
 _dpu_format_get_plane_sizes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-8-617e1ecc4b7a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7845;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uzEkRjLwqwwp8yGM+VEKUZT5JztSQ+D7q1qSN8x5gD0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEL4EqkTVoZURQsdHu0HPZpMLH5nnPI7gs8y
 ZpQEwcCCkqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1akJCACmn37pXxD9pwZuDOcGc+duqzqFr8K5flqii/yMdCHu1+cRKVln0KfCVH6zGf0N8/n57eA
 WgcH9MC3Af8Bms2Gx8VkZEMIVQRNmiujKj6NBwu8eVwEyfSd2JwuwCX8MdBnuMiEC59B6Cm3zwW
 clxSax+AFGleQx4tjAGp2wCKPYpeBkvbCPlMtbYuJ86vfpCASfeOtl9+zge6B6wvVmYADpwu543
 aH9UXzjZSyyCAkgy4VuG8H8lGRioWckgvk5zVHMgP31ANUmMySmUrCya+hfND2AX7Vx/jxac+1F
 H8B3kG9QdcelrtVQmU8aQJ3SAfm9Zb6/LbJSl/g80AihXQiR
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

Instead of passing width / height / pitches, pass drm_framebuffer
directly. This allows us to drop the useless check for !pitches, since
an array can not be NULL.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 73 ++++++++++++++---------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 46237a1ca6a5..df046bc88715 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,8 +95,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 
 static int _dpu_format_get_plane_sizes_ubwc(
 		const struct msm_format *fmt,
-		const uint32_t width,
-		const uint32_t height,
+		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
 	int i;
@@ -104,8 +103,8 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = width;
-	layout->height = height;
+	layout->width = fb->width;
+	layout->height = fb->height;
 	layout->num_planes = fmt->num_planes;
 
 	color = _dpu_format_get_media_color_ubwc(fmt);
@@ -121,13 +120,13 @@ static int _dpu_format_get_plane_sizes_ubwc(
 		uint32_t uv_meta_scanlines = 0;
 
 		layout->num_planes = 2;
-		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, width);
-		y_sclines = VENUS_Y_SCANLINES(color, height);
+		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
+		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
 			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		layout->plane_pitch[1] = VENUS_UV_STRIDE(color, width);
-		uv_sclines = VENUS_UV_SCANLINES(color, height);
+		layout->plane_pitch[1] = VENUS_UV_STRIDE(color, fb->width);
+		uv_sclines = VENUS_UV_SCANLINES(color, fb->height);
 		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
@@ -135,13 +134,13 @@ static int _dpu_format_get_plane_sizes_ubwc(
 			goto done;
 
 		layout->num_planes += 2;
-		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, width);
-		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, height);
+		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
+		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
 			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		layout->plane_pitch[3] = VENUS_UV_META_STRIDE(color, width);
-		uv_meta_scanlines = VENUS_UV_META_SCANLINES(color, height);
+		layout->plane_pitch[3] = VENUS_UV_META_STRIDE(color, fb->width);
+		uv_meta_scanlines = VENUS_UV_META_SCANLINES(color, fb->height);
 		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
 			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
@@ -150,16 +149,16 @@ static int _dpu_format_get_plane_sizes_ubwc(
 
 		layout->num_planes = 1;
 
-		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, width);
-		rgb_scanlines = VENUS_RGB_SCANLINES(color, height);
+		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
+		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
 			goto done;
 		layout->num_planes += 2;
-		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, width);
-		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, height);
+		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
+		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
@@ -173,23 +172,21 @@ static int _dpu_format_get_plane_sizes_ubwc(
 
 static int _dpu_format_get_plane_sizes_linear(
 		const struct msm_format *fmt,
-		const uint32_t width,
-		const uint32_t height,
-		struct dpu_hw_fmt_layout *layout,
-		const uint32_t *pitches)
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout)
 {
 	int i;
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = width;
-	layout->height = height;
+	layout->width = fb->width;
+	layout->height = fb->height;
 	layout->num_planes = fmt->num_planes;
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
-		layout->plane_size[0] = width * height * fmt->bpp;
-		layout->plane_pitch[0] = width * fmt->bpp;
+		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
+		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
 		uint32_t v_subsample, h_subsample;
 		uint32_t chroma_samp;
@@ -199,7 +196,7 @@ static int _dpu_format_get_plane_sizes_linear(
 		_dpu_get_v_h_subsample_rate(chroma_samp, &v_subsample,
 				&h_subsample);
 
-		if (width % h_subsample || height % v_subsample) {
+		if (fb->width % h_subsample || fb->height % v_subsample) {
 			DRM_ERROR("mismatch in subsample vs dimensions\n");
 			return -EINVAL;
 		}
@@ -207,11 +204,11 @@ static int _dpu_format_get_plane_sizes_linear(
 		if ((fmt->pixel_format == DRM_FORMAT_NV12) &&
 			(MSM_FORMAT_IS_DX(fmt)))
 			bpp = 2;
-		layout->plane_pitch[0] = width * bpp;
+		layout->plane_pitch[0] = fb->width * bpp;
 		layout->plane_pitch[1] = layout->plane_pitch[0] / h_subsample;
-		layout->plane_size[0] = layout->plane_pitch[0] * height;
+		layout->plane_size[0] = layout->plane_pitch[0] * fb->height;
 		layout->plane_size[1] = layout->plane_pitch[1] *
-				(height / v_subsample);
+				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
 			layout->num_planes = 2;
@@ -232,8 +229,8 @@ static int _dpu_format_get_plane_sizes_linear(
 	 * all the components based on ubwc specifications.
 	 */
 	for (i = 0; i < layout->num_planes && i < DPU_MAX_PLANES; ++i) {
-		if (pitches && layout->plane_pitch[i] < pitches[i])
-			layout->plane_pitch[i] = pitches[i];
+		if (layout->plane_pitch[i] < fb->pitches[i])
+			layout->plane_pitch[i] = fb->pitches[i];
 	}
 
 	for (i = 0; i < DPU_MAX_PLANES; i++)
@@ -244,25 +241,24 @@ static int _dpu_format_get_plane_sizes_linear(
 
 static int dpu_format_get_plane_sizes(
 		const struct msm_format *fmt,
-		const uint32_t w,
-		const uint32_t h,
-		struct dpu_hw_fmt_layout *layout,
-		const uint32_t *pitches)
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout)
 {
 	if (!layout || !fmt) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
 
-	if ((w > DPU_MAX_IMG_WIDTH) || (h > DPU_MAX_IMG_HEIGHT)) {
+	if (fb->width > DPU_MAX_IMG_WIDTH ||
+	    fb->height > DPU_MAX_IMG_HEIGHT) {
 		DRM_ERROR("image dimensions outside max range\n");
 		return -ERANGE;
 	}
 
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, w, h, layout);
+		return _dpu_format_get_plane_sizes_ubwc(fmt, fb, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, w, h, layout, pitches);
+	return _dpu_format_get_plane_sizes_linear(fmt, fb, layout);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -407,8 +403,7 @@ int dpu_format_populate_layout(
 	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(fmt, fb->width, fb->height,
-			layout, fb->pitches);
+	ret = dpu_format_get_plane_sizes(fmt, fb, layout);
 	if (ret)
 		return ret;
 

-- 
2.39.2

