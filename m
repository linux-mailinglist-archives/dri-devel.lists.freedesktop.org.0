Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DAC9F1874
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69C110F102;
	Fri, 13 Dec 2024 22:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WG8KWmuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E110F0FC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:08 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3023c51146cso22183651fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128106; x=1734732906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=72LEVu4zv5GnCl7a/DOzppLgP9PEkC9JVzSKxkGRJcM=;
 b=WG8KWmuSQjdckvx5BOCSgMeMuJfDEF9Ue/A4IQYY1RVwAuVAMlK+IyH5BISTPJQ/xs
 Et25h90V667Nf2olSZ2CXTAuVscwUYllKuVpU0mHTBSJBo1E7QO1k0zrxT59RiLKiQgj
 gxiGcwamQ+nVC7eZxoZzWcHcsZpuueONfUH+N6PmHupRhXakspy/DguE5DzD3nJVKuIg
 /DJBsWIXqkyVY67umpcgLHPRie7t5fSD7cmvLKZrJ/y21gA5+D4bGTgp0ORYUtyJceBi
 KUmCkDZtr18tZG/YrYIt1qX4P0Z7i+ziEqzVC0F2XD3aZgZu3WPWI/UM/WFJHJB/6q7L
 CQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128106; x=1734732906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72LEVu4zv5GnCl7a/DOzppLgP9PEkC9JVzSKxkGRJcM=;
 b=PSI6Bm5UxyzOAUmRzgwH8hT/D7jSAfEvx0XZVjNzYpzDJv8aEa8CgXcA2HFNIe2ulq
 U42hQlN0de8VKQjMO9/u/86xntEkERmGecLqp+iur8wObD7e9Br36/j2YaBzEg2xOOE9
 ZVLn8XQL95iu3FidguYtP+eaP76wT620TiVSG8odAuzjZeJDw2lVXrrme7toRnxjsuGM
 dCYcIHqwlmU1R0SApxIY2ggvWAfhbb9M/yDJUtE8VkUCxlWiLVt95Zgc4ANxOpSwiUw3
 xCIe75o5psgYQKy0MD+ZU7gwJme8EgusXm8sWKYK3N1KTnUxbm3G1rGxYGbu9XnhJRUA
 5wiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/f4c05JoZsIuRMBdE7RU7ETAJIaA0ujdHqtWkJ1lRz1seGBhNj+eW2RW/yUhLqb4Zy3KMm+1teKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6pmUvS3dpgMItb6KTnrkp+S/uuECA46LDyhIlboh7+Q2fFxa4
 pmVY/Zp8MiXbrwm+/8DJHhJxXbyRZe/THoUygyUvoWqvK/HHHnn9TYSelh46fpc=
X-Gm-Gg: ASbGncv4YYTqWUl0VFF/E9oyrWEkTg2VMX6SxdDE/WoZfpX2Z8X4WDywxHeas8RR6W1
 R5E5CSL47yiTvz9Q9LhEd5jfFwI+cLCAqv0odKaYQKko/eOOUjm9ObIpal6CYOg4L7SDTluMfR6
 sbcIicVgdASZjdPmAhhPjqEyvuXrTemDsV2VoWG20mdg8pmX0uOismqA4sWo4xgBGY9icR6e/oO
 PKwvJgdcQzu8d764Sd2PYv+9u3Qnboi5HFTe7LysMz8/x9wO+2o9GWUZrfz6mFs
X-Google-Smtp-Source: AGHT+IFnTWBphArn+3nEEQZAb7l6bmtWQ8xRj98QypbmoOZGU0ruXSDAvaWrK58SXtuDlMbXHNeRCw==
X-Received: by 2002:a2e:8095:0:b0:2ff:5d45:883d with SMTP id
 38308e7fff4ca-302a4d2182bmr10620311fa.13.1734128106486; 
 Fri, 13 Dec 2024 14:15:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:29 +0200
Subject: [PATCH 13/35] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-13-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2599;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pQCOp1S6V/JRH6JOV3082YMk98ZUP3XYs5wxxF1uZAw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHFa7D/ZOU6IWO40FuM1ZI07Ay9Uc/VNqqwo
 oX+EXBeavqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxQAKCRCLPIo+Aiko
 1QFAB/4vfqU0CQkPt3pS20P8KsDEBmonJiPX1mt3JX0VCdEdcJrcC1udYFMOdgcnMq03qC+YfQI
 3Sr6VpcdPUX4MiqjZVctNlVdNzE5dEZ36InR79hGK4yey7xZ9D5QAWKDe18h5Vi7Uw614vgi5Oc
 ndUA26f9HBfBW9+O01C73SjpM4746nj8kLYvcV3zBuMJv84ymli6thWH5qzUYP6nZHQJkve6dos
 5h9RsGGSzHUVD3kIdQApOO38PUOj+akVpikaL1ltqzeWQQt2EN1dFA9Ko3ZVyzeE2ln5m7QLbu/
 66O8zNnAj1XJn+OTSidkY0+KixCF5/Q//ZPfD8q6BcGR16XQ
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

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4b44e4d8d13631b6b1a8824b12cd8d5bd4ae7e3f..188d73b56190c2719a012889d6b7993f38a28906 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1acc1a7d0a365e511d5b6d7cc236e1c28062c76e..12b0faa9e9380034c20142e6c7077192ca097985 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -135,13 +135,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index f0dbb00737df2b4ade540eb440cb3ae0baf7c153..4427a97ad52237b4ad64d63e4e02428c76f8616e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -753,7 +753,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

