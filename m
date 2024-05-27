Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F0F8D0357
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F129510ECB1;
	Mon, 27 May 2024 14:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xy87wbC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F9210EE1A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:23:32 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6f8ea5e3812so2699321b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716819811; x=1717424611; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L9Z/Xi90npJWSANZU6vr3ADO8xKaQ7p/btP/dc1GbEs=;
 b=Xy87wbC0Or15vwW96eTiHM1CsXFRgk45k0aNuRHnn4uAWtqgUqsuogQMltpbhX8kTm
 pfkKUllURatDP+2H6Whvax8ciw5qv9hXc4Q1hD31MCkcQ9ZC8FjD1vKRTGimfcw05bSt
 Zuu8Pduhjvg/UyaUwbl/uh7Rbgywm0r5nkUZuliz38OPkFyvNjIZ3uK+VSxsVECGOp3y
 jcKhnIgwLNFalxpQbRjU+WOZgwepEG8aWheZufpE4+jD09DkvUgh8ymV50cGxcK8t/aG
 PMl/1rL0cmXLT6iLR7ZUyYQb4EBTNLIahM27gTv3W+FYlnG7PNlc4mNwDecHWC8y2j6G
 ycjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716819811; x=1717424611;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L9Z/Xi90npJWSANZU6vr3ADO8xKaQ7p/btP/dc1GbEs=;
 b=IVyn0KW8wRAe99UX/W3qALRYXcvglpafcQQaPPoQ2PHYEeHSAfEza5dS+/uA4mGjGp
 pKjbegCAIY8WYg78CRWeBw5xUwAMC3FgYLSAxNjShxaV/GNnB3Hx+6HUFjm5bLyeSXHe
 t+5v7gjgTSilvufTVzmDkimN8NvT/ANGB3eaNkQ16Shg9TjbJyn/ZeeYYXoEKzpcMh5U
 Hn2TLA14WPEgtfDqP9Hq+GY79o0IDVSclSDHkRNGmw2OHWoouhQWvL0lbMI6XRy2pMBc
 hTj4fqnus9Oa3LGFiTtRW1qWALGsTPo63MBfeb6vLEuGYZjc7aSvO9nphSmio2b+Y/Pq
 zn8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVugMsk1erGYerPL15LkitXskF4n4pKYQWwNj3mRCA7eXhjRgRkrxFBZu2qBRU0ITzHldXWSK50oTHb31Wm0XXuwULD0l8WylWOn4G5MsAr
X-Gm-Message-State: AOJu0YzD0v62bfU8/tqTBGHaf6se9fZAj3R4H2XOQE09kYYjyMDyCzXI
 Z4gisS9sXiklI7xvlbfT69zJ8Q1JhcnSNsoFzrdFDZ1v6U3P80EtIOXJW03fJbE=
X-Google-Smtp-Source: AGHT+IGUEW9adF5QWmGNx1DovOuHLsKxPisVNvPhcbc2Cq/jloQiLoZPjjpF/w4GkgiCUaAOTK1iYA==
X-Received: by 2002:a05:6a00:28cd:b0:6f6:7c17:704f with SMTP id
 d2e1a72fcca58-6f8f2c626e6mr9680863b3a.5.1716819811597; 
 Mon, 27 May 2024 07:23:31 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:23:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:47 +0800
Subject: [PATCH v5 1/6] drm/msm/dpu: fix video mode DSC for DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=3468;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=pcO3EpSEffMXfzg3qm9/56HyKCoO+GZpl6408uIpjZY=;
 b=1A5BlK6c1bwwAerpYBl8UlV6cF5n3ZbY3fE8Nds6gp7rWU/K/IBq1VVN1PiZ+uWBQGtopy1WL
 PbEDmwmC249DHdk1GblzbVPzt8mM+9JWPyReTQIY1dC8ARwGDqrxOZy
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

