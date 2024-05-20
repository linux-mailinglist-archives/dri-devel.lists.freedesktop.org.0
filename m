Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95498C9CF7
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC7B10E666;
	Mon, 20 May 2024 12:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NayrJB0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF4710E61C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:12:52 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51f2ebbd8a7so5074740e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 05:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716207170; x=1716811970; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EngRNEegfEjPtk1lyTiOuhRxh7ZIkugIZOeBU7wBZ0k=;
 b=NayrJB0vBs4tu/k+u3gN9d6La+uqUUPvyOfy+tKkvrcLU+K8hZvp/jlyRXXGZmtP1W
 An5CATHw4LJWtQw6ubc20B4yDUpnmcFOHPa6A7jJi9osNDLaxQU+8dmLvZL/xCY89lGw
 cA09wmLltXgk38E2DsRlom7E6s7Ca6wxmCM9yKVWWjWMckrrclfx8D3kc+diGcOJYNrX
 expBlJAHWsl0RStpPOLafnxRoWwfMEcxY9VvWkryebbpGjQ9mJZS49k8jujfBGmbkxTE
 3INLeYFjkR5ojMkKkoG27W1dXsSwJpucSi6PmkMClSPFDnsFaQ/QfnY2s0qWHHyMr+bQ
 J1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716207170; x=1716811970;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EngRNEegfEjPtk1lyTiOuhRxh7ZIkugIZOeBU7wBZ0k=;
 b=AVjCMMrAsNof7R7FO5C85bkyL8ZoVIRReGBM4Ff4RRE4WKkqxge7cLtS7SpQp4bsh4
 dlKd1xDHf5if4ZdfFfeSTpj2tv1kN66m/ukpfjTpK6iYpNzPkbYkGGktYb6jCKOuHmRD
 DyUWgZvcC9KaXDutJbV+QkQeM2MsowKg6f45ZJ6hZHlwPFVAAqHVDCFIB4AF7bQbZrQ2
 GkAxzI8k8KpDK3bN7DTHelZEEpNr84wcPYKOMgVbqytsJvoC9D8+BrsYizDIJ6tALtH3
 xozq6h1sdxwx2upDBv9QJteBsuHobmYu+Tm2WsjRY93eoDendi/6pXnmi3Z+ffeL5a6z
 y3Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7daF29dboi8RC8gb2e3TUVOQPfKyj1AGH3/6B6dfLPL66EH9aG28PapXCTQYYA3XsHwRgQ1j0aPYRVWkF0f5HZ1OCIv076a6EVKW0uK/H
X-Gm-Message-State: AOJu0YwgNXmlHLsMfmx7MyPQ09qkhtovk26PD0pzLhvRweqxjTMtN0nW
 WBSda3o7UJ6SyZEJx4ET6TTFJjlHyMQqGi6Pol9BW+Y/kKc28L9MU21fNNCPcnU=
X-Google-Smtp-Source: AGHT+IEYyPQvYUPUkStl7KT7W6EBwKTLfRV+KK4qV5SWFd+bL47S1rPoRfmfxHCn1nM/BJ6/LstSyw==
X-Received: by 2002:a19:e05a:0:b0:518:ce4b:17ef with SMTP id
 2adb3069b0e04-5221006cdd3mr19262792e87.60.1716207170564; 
 Mon, 20 May 2024 05:12:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:12:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:47 +0300
Subject: [PATCH 5/7] drm/msm/dpu: rework vsync_source handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-5-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bDrKpwdiQQO/7yqHHeSqz8kQDyfWunAboKt0w5ii6fE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz49AMFTxVsOTQ6II89mW7JkSKQZyAIvHbgJH
 GxIP0WdhFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PQAKCRCLPIo+Aiko
 1UxpB/0XrJ+wL2heNZBu+e/GS36+zBKxFzinOB9jN7LtSt7GELN2B2DbynOfvt1Z45kgyVqKx38
 UN2uXeXYzkKRWoWwfzbZw9tiKiKFA0OkCj/JCOS/Z9kGU4S0f3+/cCentspiGssxmouiLyKwG25
 0xrAfeAo5Gh8C8hnUt6uPv3BqfuaQZByJMVTOxGtGnxkgDNloIXu85lrdgWcVdVAIvYe9p+bYGx
 tL20eForFg4k6aDr7uZxZ8VrZ59t9aFKdFHNWXuFu6wmwV9FW94bVoVFqNZqLQ5BJuIPA/cLTum
 BmBjE8Lxto1irvaPzlrAICxldSLjkHnye+trSYfynhWxLR+6
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

The struct msm_display_info has is_te_using_watchdog_timer field which
is neither used anywhere nor is flexible enough to specify different
sources. Replace it with the field specifying the vsync source using
enum dpu_vsync_source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 ++
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index bd37a56b4d03..b147f8814a18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -743,10 +743,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
 		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
-		if (disp_info->is_te_using_watchdog_timer)
-			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
-		else
-			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+		vsync_cfg.vsync_source = disp_info->vsync_source;
 
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 76be77e30954..cb59bd4436f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -26,15 +26,14 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
- * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
- *				 used instead of panel TE in cmd mode panels
+ * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
 	enum dpu_intf_type intf_type;
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
-	bool is_te_using_watchdog_timer;
+	enum dpu_vsync_source vsync_source;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1955848b1b78..e9991f3756d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -543,6 +543,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
+		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+
 		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
 		if (IS_ERR(encoder)) {
 			DPU_ERROR("encoder init failed for dsi display\n");

-- 
2.39.2

