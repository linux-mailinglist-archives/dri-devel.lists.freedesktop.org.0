Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75CF915887
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A75010E266;
	Mon, 24 Jun 2024 21:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NVutYEDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D83C10E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:51 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso3545717e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263630; x=1719868430; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ly9zxPF6kK6qWFLi6AuRER/W3ug3hHlZgBrdmIg0PXo=;
 b=NVutYEDC1N//ZuUqWEfYIgMfM5KXL+pxzp+Yd6JwBnLwDRXsnVDyATWDXgWnArinkq
 b3QXAjdL/V83sBimeq6I18MjYuMFk6ELBpBHIsKwqy9vjUwHQnzzTrLDAHojh0MTHOl+
 Fa0v6uu0x+vhcm8Me5/p12xbpc4vBJjcf4x41rA5DUazUXIBVF5g9wcI5Cfp2M26Y6pL
 GVdm2lLewraZh2nN4LXn4MSxiQC59DeFvMpSzOAp47OuHY7P3pQGvo4GURYZyUcL5v0M
 gH2UKCBUlP1olbvTpjlzKsRzUYn7mF/93HCaMEuK89GAsIYwswKugNCRa/yayZd9hkzE
 exzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263630; x=1719868430;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ly9zxPF6kK6qWFLi6AuRER/W3ug3hHlZgBrdmIg0PXo=;
 b=G5ETxzZepINP2vg23j/U81NocQy0+7Fpb4kB95X+6pv2Or6qnhHAWh+tTTlFrZlPlu
 +TwErIRSepPZVS54rJYHcG4HXdmIN3LBo2ZbWJBujhzM5qR0YnzVMarjIS8iKUgAgA8r
 5lSFd7JoJBdwTF2LzHKPQhG/M70tC68WXJhZeFsipkpRmbBVaJBcU+Z0Hwvi9MKyRhrf
 XqXXSBlBkhsxe3Ksli12hSEPuiHPr6CDodyBcY/+GDi6gf0vDNnTW1//7j00tzWO7c6s
 GB4ToBarlbXfVkI6TGDXIGilkT5N7HEQu9KhdfLVHGbo533kei51hq0RBVcR+oVY27La
 +oiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEvA0kZTwyc2Z/fBslqOlBpnpoIQMJr7jG6mF7DOJ/iYxZs79hWI6g8G5Arl5sLiDeIV6QWX1RC2M3BBHjfI0s00G6k2Aj8fmyMORctsdL
X-Gm-Message-State: AOJu0YynUtG1CYiFmeNMkhXkr771Gnl2xx+O/XeF+cl4eWZfZa8jTw2M
 y664fBsrR0zfcu5t6+hAQAMbRJK1Z/RKQvnkgqV2xRlKqe511lgzVtu5y88eMBI=
X-Google-Smtp-Source: AGHT+IGrf2DRTDknZzyb3RY+ew3v9yoG+1gZs23M7/VYPdu7dDBXRLNv41FsamkSs/sJPWRjFc/dWg==
X-Received: by 2002:a19:5f58:0:b0:52c:d717:2c90 with SMTP id
 2adb3069b0e04-52ce1864854mr3127500e87.59.1719263629854; 
 Mon, 24 Jun 2024 14:13:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:45 +0300
Subject: [PATCH v5 05/16] drm/msm/dpu: drop
 dpu_format_check_modified_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-5-501d984d634f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ejH+ol5T532KyZrIFuLloTm2XyxOOkDo+QG+9a6aKvc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGHnaEOUyaAnU9Vrpz5Mh9HXPbkf3XE4HcnG
 ViR5o3QS2eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1f3yB/0QyeMDGZYEeg10fm81Ysz/VbVWbOawpU/XBHxUjH88pvzJnTghZ48aAQFBejtzZfweZbh
 Gjq5sqLoVcJau1jy3cPTV0+q+Q0BckZE+AMlpijBnoS0dgC5oAvCvcFkc+E4iahD+On8mc8ysDP
 0L8fwkFThOdI7jF6JoJM6BpAqnKCmRn8D1BTV+JoVg8p/O3Zrwv83otWlyyIeh7gHXLUZVznCsz
 d5HiCNbC22/LEar/7+gk7XC9+3h+vbYFpIUdBvsrLyAd5uFvxam9F7N/fNn6vo1pTZYXgJzj+QJ
 N613YIA0+GuMPIco16iHAjvgxKgxakcUsT6qGL8p8Fr474vy
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

The msm_kms_funcs::check_modified_format() callback is not used by the
driver. Drop it completely.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 43 -----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 16 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
 drivers/gpu/drm/msm/msm_kms.h               |  6 ----
 4 files changed, 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 6b1e9a617da3..027eb5ecff08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -423,46 +423,3 @@ int dpu_format_populate_layout(
 
 	return ret;
 }
-
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos)
-{
-	const struct drm_format_info *info;
-	struct dpu_hw_fmt_layout layout;
-	uint32_t bos_total_size = 0;
-	int ret, i;
-
-	if (!fmt || !cmd || !bos) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	info = drm_format_info(fmt->pixel_format);
-	if (!info)
-		return -EINVAL;
-
-	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
-			&layout, cmd->pitches);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < info->num_planes; i++) {
-		if (!bos[i]) {
-			DRM_ERROR("invalid handle for plane %d\n", i);
-			return -EINVAL;
-		}
-		if ((i == 0) || (bos[i] != bos[0]))
-			bos_total_size += bos[i]->size;
-	}
-
-	if (bos_total_size < layout.total_size) {
-		DRM_ERROR("buffers total size too small %u expected %u\n",
-				bos_total_size, layout.total_size);
-		return -EINVAL;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 210d0ed5f0af..ef1239c95058 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,22 +31,6 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-/**
- * dpu_format_check_modified_format - validate format and buffers for
- *                   dpu non-standard, i.e. modified format
- * @kms:             kms driver
- * @msm_fmt:         pointer to the msm_fmt base pointer of an msm_format
- * @cmd:             fb_cmd2 structure user request
- * @bos:             gem buffer object list
- *
- * Return: error code on failure, 0 on success
- */
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *msm_fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos);
-
 /**
  * dpu_format_populate_layout - populate the given format layout based on
  *                     mmu, fb, and format found in the fb
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d1e2143110f2..40e4b829b9da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1025,7 +1025,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.complete_commit = dpu_kms_complete_commit,
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
-	.check_modified_format = dpu_format_check_modified_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1e0c54de3716..e60162744c66 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -92,12 +92,6 @@ struct msm_kms_funcs {
 	 * Format handling:
 	 */
 
-	/* do format checking on format modified through fb_cmd2 modifiers */
-	int (*check_modified_format)(const struct msm_kms *kms,
-			const struct msm_format *msm_fmt,
-			const struct drm_mode_fb_cmd2 *cmd,
-			struct drm_gem_object **bos);
-
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
 			struct drm_encoder *encoder);

-- 
2.39.2

