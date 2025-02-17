Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6321A385B8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F245D10E4DC;
	Mon, 17 Feb 2025 14:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f7Vx7WCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A1710E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:16:50 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fbfe16cc39so8262963a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801810; x=1740406610; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rajdpuATf4cHrwTeJ8T+ZsyTPgo2DiGPUjAIn6iu1Wg=;
 b=f7Vx7WCSsEKgGps0iYRXfE47iW6sHRi1eVBvf7wrpHxwvDwmX4WpmXG3Axl8K8LuAT
 CK9exy+0r2hCqo1A5ErHmJOtVKVAT8jhUr0ebYPJKwqhhpKquYoi9l0yzjFgiWxdof4A
 y/W+uEGQJb3iowHY7G5d3YRUCOIeHmrneDCvxzFetO9/+leGOoRzvIVaKyFx7szWO9Ri
 VpyM2qCM1KdGe/oYOImd/gLFfmmPcL+LaKiEgZwgUjO470R2LPb+Jp4RoyFTXTJLpgAd
 VIUnRQhESlk4+CFHNoVGCyC4vQSss9XDPAbwVTyKzJ5z5Pygawc1ZIToisIX5HfSmRvl
 d/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801810; x=1740406610;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rajdpuATf4cHrwTeJ8T+ZsyTPgo2DiGPUjAIn6iu1Wg=;
 b=wA2eaE009TBsS5D6fcK82Kfgl1KG3D/M1BhJTmjIIaGZEgjW02GoJVI6OrzVMRFUQm
 NmT5ZaO2Qiys+IY8XTznWpm37Pl/eoCW1DA15bwuXgdI+GH4gXlaga9JaPbeWZvzeq0+
 bgnVU8+bkC+P9XV1dT08/pxzNwLllKcUzLAdOoQNZGRY8cFjAh1TOsQh43WAO4lWw+eZ
 Ix3mzwdvDqsCQU31LCxOrNd4L8rHsaV9rLZYIPb7e8h2gRvQdq6yocTNzvK2ZA9FRXzW
 td06eQgTQ9AMzq/27hC0cdUlg46bQ7POZs8cL2+mMv5p9aXmey+njsTM82yI55a2Vq45
 e8XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfU9v65cqrbymOaFq9EA6EtuRoKv5iAjoJHmZ9u9EuaHabf6kkboKhQ2NYuE2AimNu1Fq2q22GlUI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe6ZeoDXUL/GqnIObykDpPgMMCM2mHEuTeVisssD+HfOU1xr3B
 64qUF8iB6/3BMYsd5P2/ej7rg64fTs30+Wp5uPXIhK2S17VNVJ+ADT1hB8UcxYE=
X-Gm-Gg: ASbGncs4PVNWTKvJb9ARRPHuyzbBRXcpsWb+LpdVh1kyLplBkNQa9vPUN8bZtdXHoiM
 EWdUEIj46Q9Za/59iLys4flLg+AXaH6rzW9t/cb8e5SHZbLYFcbc518zSoJRRbe1o6HSI/mQEBC
 +WnawrgULdDU7hMUzd3WbpqjAHprPC2SAJBEfOYkPWC8ta4NF4pm2GkOT4IDtES9QIVxrPvy+/+
 hEC2E3n5GAuWesuuI2ds7vp4ton9JX/SnLFquXYuh6sMlmHyMOXaXgpBscan8Y5iYB2sYdkNnGj
 bEk8I6S1Bsbq
X-Google-Smtp-Source: AGHT+IGU0FyPjwmxRoPaGDsf+N+koULFGoADf0/rSjEWbWDRJqGiRCi3XPxpi3patdoZmzDMZvgdqw==
X-Received: by 2002:a17:90b:380f:b0:2fa:ba3:5451 with SMTP id
 98e67ed59e1d1-2fc4115089fmr14918129a91.35.1739801810264; 
 Mon, 17 Feb 2025 06:16:50 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:16:49 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:51 +0800
Subject: [PATCH v6 02/15] drm/msm/dpu: Do not fix number of DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-2-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WBM/p7IonF+GUTkphvNqY034IFJPvXxbXKnpEjol144=;
 b=mcXuCakUN4KMWaFmxuYcUpbFO6rXbt/WIvqiY/25a8klCfKl7bIvE0DvHvDTCKwU+id3pVIq6
 kD9VT2lfBCkDMeibmtyY2fQ1YAGkFlOEZhqnwXA6HzuKx21ogcHiIyF
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

Currently, if DSC is enabled, only 2 DSC engines are supported so far.
More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
get the real number of DSCs to decide whether DSC merging is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eaac172141ede7bb4002ce1d0268b2f436fffc6c..c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1

