Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BE691509A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3635E10E48E;
	Mon, 24 Jun 2024 14:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dfQa3eGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE4E10E485
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:19 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so2883407e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240437; x=1719845237; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ly9zxPF6kK6qWFLi6AuRER/W3ug3hHlZgBrdmIg0PXo=;
 b=dfQa3eGWtxw3jWz4CVM2hRhkhRzRmeyHkXHm/ziwfc8CLK6UTSoaGHlfZDWwgjxPvn
 qMzmY62jYB2TvPQd0GzCS41gwUxx8Kn/Uix31cIoQ6cZgQanjACCO6hP5gnRysgJSrBP
 4uiwTRmXEPEpycSR8sLoo7LONOJUUk+QUnx1UtEJBBgqJRn5eWk2o/jNMqI4v2D6HCta
 MA+6A/0YrXF+py5hM8/JlO9ZY+kbotUproJXdD6zyE/rpjYT+3iJiCmOVRTc9P2eTmre
 KXJ54CUT335vBOyzWBsqetO96BPPEKSxYg5yCuf+IRpnG2JoXtVX+EdIpEcgbOmCAbH1
 0BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240437; x=1719845237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ly9zxPF6kK6qWFLi6AuRER/W3ug3hHlZgBrdmIg0PXo=;
 b=HqTmUMrYgUTcdLGKgcA+EQ02vIUeZOR8bTMoM0lUIBwG1pEEUgKBo5xYOMx2EXNsFC
 ySjPdCWuCG/jCziWsClazNtIl+7llDA/hIZXGjW1rZ4SanBdpowgihyol5HHP8ccLBg0
 xm3kSUaa1/rxJn8dg9uTUsm+msiX+9bU3ABdnrZhdAS6Dpon5ULrCuYL1Pv5KG+wBKz0
 ObD2yCUB/mhh1lYxQMP7baW9oLnIuSMvv5eko9JowLFSStIA6A5F2QjPVVUsvXzvXVlm
 Je7ZYuQV2aH4AZALJhcfdrxiicc+N3eEUEtnWiC3PxhRPdspavDlXUNmR73EP4gdoE6U
 R/gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG/XtRRJplZ4a/fZvblChlVc4Rs9S7FtpvA2swV2h/azq4LmwnwNSL17+e2MWEejtx94yzsc6xIpQNPGjPyahPgwpli8vPiEL9qQf6ugRU
X-Gm-Message-State: AOJu0YyuX5ck2AMXqipRMHuSfoZbKqYRRRRwk4FEp3znyZ7H/aX5dsZI
 KwVX6MC1v6aKwN3gbmDM6WHgevwhQf5QkJ/oJtRPD28wNkm/nyzubOVk47LFsTY=
X-Google-Smtp-Source: AGHT+IH04ATCRnDq4dxRR2coL1lBGrXGyEbLbPgLDKDt2z7UORAPjyBa3IRaIMrGxV291tvd52qkCA==
X-Received: by 2002:a19:e04a:0:b0:52c:d819:f896 with SMTP id
 2adb3069b0e04-52ce061fda6mr3703448e87.35.1719240437307; 
 Mon, 24 Jun 2024 07:47:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:11 +0300
Subject: [PATCH v4 05/16] drm/msm/dpu: drop
 dpu_format_check_modified_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-5-1038c13da3a5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ejH+ol5T532KyZrIFuLloTm2XyxOOkDo+QG+9a6aKvc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pl2/sliq/t4pod9azmRz9cezTSbPmGpPR573jEX3i6e
 T5PmL2vk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATschn/+9Sm3b0peCbriX8
 MgGe4uUnvJWXvTO/UbT9rNHDioisxOxFBx5YXzxRvf/sTddgP3uHCWyak17Nneyf9u683JrpPzc
 9+F7VfvWBzu/bhYk9mU+7jvaacMr05m8PuK8t1/loz+SzsxJ1DppZ2N/kN0uJifASMPPkOrTCLE
 rc/3HKgfWZnYqTzBN/C91qbbfSKD3o+3GPdtryQL5FQvkFdRfT9NZH8U5mDY6ecPGs+tmDqzS6k
 pff1q+ctMr/cNGeeonQtJcKjaafE8waedh4oqS9+0XzZKVvbj4us1DcQOdVt9HvK3u3cpYs/8Sd
 01G4/KhnaKSzXu2C31tvlsmEHudRy77BfujaxqQg8zQBAA==
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

