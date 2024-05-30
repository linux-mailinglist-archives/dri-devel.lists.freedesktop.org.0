Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11A8D4513
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 07:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE4011B421;
	Thu, 30 May 2024 05:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sTKKpNys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338AC11B420
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 05:56:57 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f44b441b08so4556235ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 22:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717048616; x=1717653416; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3Q2dQm7nGZxBRKpXC++099T4NGLN3Sf0rMWvCRq/ORE=;
 b=sTKKpNyscIZDqZAHMO8QKY68nXm+3NnpGFRDuA4y8uXmwBSNipE0S9hf0pkMBrH/0s
 BdvAQtVFUSZJIVwA5ev3oyz6ZjxYDZ5smYvTUX7E+Y9HU8JtmxUtdnEz0oPaQMf6PbAE
 p0agyzWLcsBiLcA2pGLvSfgURu+4wxMyxDOcIpWEZBf6GNEbbB+ct7acIc1fjzre2aZM
 wti1pVbsovOCxvy6r88u67pguJQ1dycmNCLTRUdtDNj6/xifgi5nZiR+8v/rFMWoiLPy
 gnzzP2xphnUP4mjO3S3ejzWjnMquly+aGQZhmWG85OPuJFG3RIXcJelMvJki/oJf0vg4
 WLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717048616; x=1717653416;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Q2dQm7nGZxBRKpXC++099T4NGLN3Sf0rMWvCRq/ORE=;
 b=ajhxtTX1qMLkZ3C/hocHFyJP+9VMv4hw1aLyvKhKCSP1SMHx2PPZ3yzk5C5y6HnJ3M
 Fp2Gufp/Tf9CLjj6OTW0gO4V4UGv9vWlFexMdXKbE5/ND2BzgQ6HESackcTbffQZmGBQ
 miukRP8uc6yyCO7Wun6kyBrkFZjJgjsDVGZLI6gFBaQrX2ni03WYG+/6pLNudVNox2XX
 Kb/JvvrWqLYglCYlO3JTcpqUS97txmKCUF9Jz0BvhU7uO/rJ4mXcLdYKT1vr4GciAfBH
 1KRZYpYznQaamyA1/nBP8J+97FaM+ilNwFlxVYwKCRss/JzT8xIplhWwZ6d83aHl4x5Q
 uKxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9/1MRvEQcjf+42NyVSpWwGvGb945rqGYh+1PHwVj0rpGLHcHNWfj1T5ooWNW4rJqo7BDcfKb2OXUB52WB5SS91c+Zjl8VChN+5CEsgZyI
X-Gm-Message-State: AOJu0YwN2ZoOgaoN/69wKGITzagSlyU80JtBkuyP0s0LeoJnTqGJJLwh
 +55FexyPCD2YZqeVPf9taHaCwO8tZY23REjvyUzehs551diELP3GHC0CcHVz+s4=
X-Google-Smtp-Source: AGHT+IFO/Geqv96DJ2x7VEbic3CPcO41EhCM/kO6eOFtgrS539vWSkBfSlTbuVm2DCcEKokaKBV//g==
X-Received: by 2002:a17:903:1d1:b0:1f5:e796:f279 with SMTP id
 d9443c01a7336-1f6193f880amr12124605ad.9.1717048616304; 
 Wed, 29 May 2024 22:56:56 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 22:56:55 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 May 2024 13:56:45 +0800
Subject: [PATCH v6 1/6] drm/msm/dpu: fix video mode DSC for DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-1-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=3798;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=7/Tbk8+Q7zUBUA35jCKdBQKG2nj1ozoalJhqd4RQMnk=;
 b=Dhlz3AsXrGGPXqlA2+lGadxOh+L1AjtcGB6npyI0d9ojvc8k/NkO8+/YfRe/IyM/VfF9SJVyd
 OH/km1k/wQ/DlMtij0zP2N2sJJrUar3jLkRTu/HoShmSfieTWRj/ftB
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

From: Jonathan Marek <jonathan@marek.ca>

Add width change in DPU timing for DSC compression case to work with
DSI video mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..48cef6e79c70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -564,7 +564,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
 
-static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv = drm_enc->dev->dev_private;
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 002e89cc1705..2167c46c1a45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -334,6 +334,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  */
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
+ *   This helper function is used by physical encoder to get DSC config
+ *   used for this encoder.
+ * @drm_enc: Pointer to encoder structure
+ */
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
+
 /**
  * dpu_encoder_get_drm_fmt - return DRM fourcc format
  * @phys_enc: Pointer to physical encoder structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ef69c2f408c3..925ec6ada0e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -11,6 +11,7 @@
 #include "dpu_trace.h"
 #include "disp/msm_disp_snapshot.h"
 
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_managed.h>
 
 #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
@@ -115,6 +116,23 @@ static void drm_mode_to_intf_timing_params(
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
 	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
+	 * is compressed into bits of 1 pixel.
+	 */
+	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
+		struct drm_dsc_config *dsc =
+		       dpu_encoder_get_dsc_config(phys_enc->parent);
+		/*
+		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
+		 * fractional part if there is fraction
+		 */
+		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
+				(dsc->bits_per_component * 3);
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)

-- 
2.34.1

