Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302C39F187B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A8610F107;
	Fri, 13 Dec 2024 22:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wU81DZp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F7710F0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:13 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ffd6af012eso24330401fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128111; x=1734732911; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LifxdqaGCIwaKKWoCGFea03k7mgah7RmItgQGhr58E0=;
 b=wU81DZp6vBvbrwgu8EXSVGMSnUpZ204pmYG8frg8Ck/hgB65e0Trc9b5ABue5ZRvIg
 DzcAYWcUSbHWEvXaHxTVWB8QYY9zJ4sjqiu0JVL2UAYbc8IBSo+uaDAVONDIhAUxCHO/
 kuylHi31nOGntA2INdBmCrZjFxSXWWQzkMPDYtivni3Zsy8ekCYJ/7dOGcRWNY9WGZ4t
 YsiiA0vYBOEfHnmKYu3H81LK+Q+cgRyZ4gXF+lONr274ZH1ZJjQdAjiNq9qyDCIo26Mp
 4ovVFIRYzeGKAtUqmAhWGaoXeH2Z+wasQXwo9mze259J9wv6e+a51DYMf5J+1XyvjSMx
 E1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128111; x=1734732911;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LifxdqaGCIwaKKWoCGFea03k7mgah7RmItgQGhr58E0=;
 b=hsTghaSAIalwfvpeMylWbD2wZba073OO7/2oKU67wgAqvaixHd3dgcS75faVfQ3grG
 kVFlVoX5g95FaXcSTFvxLmZB1bcJEbwDrfqB4YmRelDunHTDCnSnFbIy9JJNzt7qI/Hg
 TglKtVNxnFzagvmYCwwT6XgonHFB5ofQTvSZoYT4pETXtvgHIIqp78XApMo6YoCSxUgk
 fV0Gjl9+pAELAS4oO2RLtOXavtv++XzXPtBR/M/kfYV69etx5wR2KYdd0L1ONMfJE3fC
 YJeyGBlN09UxWRHnuB5CjN0DVpGAqpWIH86zV0WJ+cQgS0qDF7twvIsHcJvDNwD2qrOE
 lzWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDUxaSTON9uKnkl5paTSRh8wK5sZ2mXmvuZEYd0y1sFDLBpBw86tk7Iph2pGOAgnKWo0j8GYdPbc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCk0ABQ1s8aLPb43oDcSFXgLNhfp/1OqHpk8aye2JJ9Pp3XJ6h
 WKc0z/xjaSdYg5oYXB90YhIgt62HgsVsUsRz6k78EtefF0YROO2+eXq7kf3MYos=
X-Gm-Gg: ASbGncvXTf0dIiZaRP+fdHO4S1kK3dgRIGKNhzBC2hh56miQTqmdwzY/7v7/9TS/F6F
 neeiBph4LPdvzX6T5QdD/wr7EqBJvZMhaWTp/XoWHU0p9Ck1K44DHlzBndZYrd44G0vNoMGOLMs
 7hGcwyPgy14WbMgm5QiPV7DWnioWIBFvkkfdVJ/FRUOJJNH/3DTljUaN4QEqEt9b9vNH7IBiI/l
 zyjwdY8cKMpyBueFErQA95bsWRQB5jzH3iggjUVDvIe6WzRT6bIYpB6m3g0404X
X-Google-Smtp-Source: AGHT+IEhOUoLULMBKV5L8uya25ux2kXuioNUid02Slg58JderfXbB5sF3kMUk2XM/AqxSo8NAgyhdg==
X-Received: by 2002:a05:651c:1a0a:b0:2ff:8e69:77d7 with SMTP id
 38308e7fff4ca-30254465075mr11711821fa.20.1734128111214; 
 Fri, 13 Dec 2024 14:15:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:31 +0200
Subject: [PATCH 15/35] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-15-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ptvBKeUKmjITErU7c/l4IsRxRCXm8P0WXwMqYb/lvdE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHGBjhdX3gmAyoNCRrO8/1x2hqeo+tl3VnN7
 Y4whAeJpO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxgAKCRCLPIo+Aiko
 1f+hB/9bRLBaxyxCbnkaCKe5UqiHtaDZamPs+PzorNLocpDS1iUPpgY6lnIAvQuNGrfIG5cPQ+8
 9vczDFGOC1AHvdDohjZHtKGVRSdk0IFMZkhIN445cnrNs3qDWSsH0PP8DM6pomIiXMRv8ytQlL4
 XrKHEmrguI14W9VgnQXLjTPDKtiZ2U4iejAGiohuUwyRmRiIWEJsGCUBsbmiVJKBluz3FGfNFCN
 NwcF8EP8pARpG74OezSMfhjlx4Kq0kcC4iM1lXfaeuO1gTGIP8O04s9VB4wE5H6uXqLTQ3FI7uV
 S6Sf+UZF7FLH0OoXUPxVZQ7LkcS8k2AgX1cFESZbFVODop9T
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
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index dec7f2c48d13078b9cda37a563d4e3459941abce..5d8f89f8a8a6ad772ff5f4cb8421cb3dd09cbc30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -112,8 +112,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7b9c77181b14a2db766beb5e36502fd0fc4e0b8b..6c21e1b0ded669b82f5939df748ce267c18d05ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,14 +145,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5

