Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48B8CE5F1
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8015210EA73;
	Fri, 24 May 2024 13:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dz7od1tA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973BA10EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 13:19:51 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6f4ed9dc7beso2434212b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716556791; x=1717161591; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WgnpbWbGj3yU1TMQYCC73xr75efIX86FBQqi5p9vSKk=;
 b=dz7od1tAL0q5IYULSjmnSLF6C3UfvnzJxcPxt2t5Mt5twSmI3on2rtVI+43aazSOWg
 0K5mjrmpYOwsv69cU94Dt3lmNUfejZgHx75Y27hak38ViPW8HqznB0+tcPNCNPh4unTr
 fVWlXb8kRUNPJKtqqB6aLnRMTR0BADuvz6+LS5tV1xre972/gfZFImDHw73NCnBm5zzo
 hWLyojo9GfNJjRns5x4IJwGlCTG/zPvuQnKRmtkSWVZ1md4bxvZ/oeiV+Bt10UKnYffZ
 f8BfjjbX4l4XSiIT+I0ZLA8WUdemjdj4CNDJ4sqewhvX7aVm3ZPXnBTQp1xyDdvgIULH
 s4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716556791; x=1717161591;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgnpbWbGj3yU1TMQYCC73xr75efIX86FBQqi5p9vSKk=;
 b=j6tNHLWoWuC1yXTbEO+Vs0S2Fy368+8zuheF5cyV/MTa2vVNDrrDD4wFZuYr97weA+
 4dbfNkOX7gooTjJkdccGKHkJ9LEip/1vD4Nk/GXr3UkEtms5gHcAK3hPDLpzk+GqOGZm
 qVQ5UwhBAclF1IHl1UpvZ/kkteTTMW27xWYSAqxw95ep/qzpz5zlDfxR4SGqoUr+NJ4Y
 GCDOkEDK5cAAc76G4ZAW9eL9hPUES2wJuYrUI7IFHFb54WFgilVlnjOYvLLkxy6KCtBA
 BhKSwtBmJ6d8hKk9NayswhKdFpWVGzoOSg6vgPyygauuZuICZ9+31uaxQ11sKzVZOAAk
 HbIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw84G5reLuvL+/Bzcb/cSbhBnqR0z8tF++s5PeOKwpEmLiJOQZDSFsstWOYTkvX/Ps3ADa82QsLJObj7NE4aL66U3Sfl2MgCTj+5+Fxq7+
X-Gm-Message-State: AOJu0YxPaKnfMc9wDWoGtFgfyLOxe1VEOfEA6GhqRt8+rK033PyeKaAA
 8tKiyPrAS0k/DBGBtL9aFEb5gKfVkNHgRKiiz+iXD8in4Ctd3BnMij2cIWAm6G8=
X-Google-Smtp-Source: AGHT+IHEL4x3gdCON7O0PynMBudw0cI55G33C2OPQFRzasPKKJOw+FbXFLEwCynVADqa94yWY0QenQ==
X-Received: by 2002:aa7:8648:0:b0:6f4:463f:af87 with SMTP id
 d2e1a72fcca58-6f77272c7ffmr7223303b3a.10.1716556790997; 
 Fri, 24 May 2024 06:19:50 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 06:19:50 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:21 +0800
Subject: [PATCH v4 1/5] drm/msm/dpu: fix video mode DSC for DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-1-e61c05b403df@linaro.org>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=3797;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=JIgIjSOIfhG3fLTjQkNn/7rXE9jtdjcvz5fMJSC9CV0=;
 b=Z2YHTYe+mOeh6vgYVQwL8RpgZX485ZkH8fuoQG+ixY9WJPhPcpb+aoVSNtxZXGkOILQR7IlYs
 Kk9Gbeyr3/FCXrUnQR2ebaVJnh/3pG/UryqSlvvQanLbnrUK7MdRWx7
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

Add necessary DPU timing and control changes for DSC to work with DSI
video mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          |  4 ++++
 4 files changed, 26 insertions(+), 1 deletion(-)

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
index ef69c2f408c3..7047b607ca91 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -115,6 +115,19 @@ static void drm_mode_to_intf_timing_params(
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
+		timing->width = timing->width * (dsc->bits_per_pixel >> 4) /
+				(dsc->bits_per_component * 3);
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 225c1c7768ff..2cf1f8c116b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -168,6 +168,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	data_width = p->width;
 
+	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
+	if (p->compression_en && !dp_intf)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 

-- 
2.34.1

