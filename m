Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14490795C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EB810EB42;
	Thu, 13 Jun 2024 17:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N7YGZYq8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB2910EB16
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52c8973ff29so1319812e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298310; x=1718903110; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gZ9HURv6FH09oBoBFNfJEOvMeQCHI23ql7MJjHP3eXs=;
 b=N7YGZYq8vZNLhVrs3QFd/Rr9jibi1UNyiBlTqygMBMUw94I8gxPPTR/FXKOIrYgmyE
 lZMBznWHoNUy09z9x5ihqF8qfceGPUHEpN9N49Zm4KmduZ8ScGJbRksjxcdofHiYjSIk
 AvDhCUpQInUrNOBxkymb3+vm8GhXyPu6Zv+SOWq3618p4cZmMM1BbTS2Vz053X4bOMQ/
 lagTIXaMdzFz+mxJc88Td5OyFmfvbphzu6dr28ro4Kfn6wu+bvFHy/vEJBJdaY0cmVN3
 XlUS6+JH6upFtnRDyYZ4EJF45RZY4hwKvq1DCmfSNKJX9Os4YJad14iPu4VFDzr8uRJk
 ifcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298310; x=1718903110;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZ9HURv6FH09oBoBFNfJEOvMeQCHI23ql7MJjHP3eXs=;
 b=Ud7nUt7u3orNjyAUTa2d5wD/D5GdiBcuVmEoYEKiN40VQZNSCigkRB7bTRNmmCa9ls
 QuOR+y3hr8FsGvX2ND2GkSj4uqLE1fsqJ2ewdvzXs1kP1zaM9fZPvP8fP3vn4XEfEHhF
 RwYsHI+EpIo4AkMwiB2YghxavFXj+VpppUsf523HLgXTJWDZWDmWhUKRGAvAH4UMBCWU
 Y3iqTmWgrCgTeDNZCxRh3Sw67ibzUTrdRj0p0vngltEUJwlIpvj7K1xWL1frk8l6phzJ
 amQPzT3LIWpVzHAstPLYXMavaQdZtJxWCmTiswBEAHNWUjTkhhyyHrm/W52ZuEgLApXh
 Juqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV73cQb3ZSqs+k6YYK4+ePToAxMhF9yOh6LmniJELsGXBRiz32NWh0LjOeX7aWf8G8w2y+Pm7uXd0CB6vGJgYJE2SEp8fIOgAwXw0My3yK7
X-Gm-Message-State: AOJu0Yy1FuAvt3SPohzIjJPoY221imChn43yP/6Jy4XKlDdFZ0RDuzOZ
 uQwaDkKhqhqZaVsd443H1JxMZVHEw/k2mh87u4RMe8CPdwCqnBUotz+fmHwiXgs=
X-Google-Smtp-Source: AGHT+IEn6Gn4ud9W6STspA6/L/OaJl+wN3z75c1efnwBhw6nqEM6i8VOzaj9WosELZ+SOH/HPkB3lg==
X-Received: by 2002:a19:f709:0:b0:52c:89b6:6b82 with SMTP id
 2adb3069b0e04-52ca6e6546emr269609e87.27.1718298310349; 
 Thu, 13 Jun 2024 10:05:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:08 +0300
Subject: [PATCH v2 5/8] drm/msm/dpu: rework vsync_source handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-5-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
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
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0Iv1DFyBhdoY+/Sz6mfuH/zko7qqu85Tsijz4fV/RPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybB/fvZLcXlwp6Sd6UVZoGCW1bqWg7hqV1I+
 WAgW9ocJneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwQAKCRCLPIo+Aiko
 1a02B/9eIc6+2K7PRVJf1MS1yHmWo3kw4wsfl3I0ZDcGMcrG914sOgEKHz04At6PIzmFVB03jHf
 Z2rl/6FoKCLL5F0vldvdOOhcUGme47GVp3TN16Fi9fkJd38v7J+AYOCNyQvpd1BgmVQ/e2EqJ/V
 VXd98uLTLkCze+c43pmvYfiIWCzwRxHdcodjcRAKAOy4dbfeT9JqGGSl/Qa70Ovs+QK3m9c+I/W
 sCNMYZlHKsYKtUpHZ7lZZLqpw7ON9lei9AIzNLm1sgF5se8YAYk4J8s/8veM5PRx7vTu52+J4Kg
 DTcTeBCMWsDpDNv1Ea321rw7wjIrvARf/1VXOtJy0NJOVJl9
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

