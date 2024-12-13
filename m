Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8FD9F187A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66A010F105;
	Fri, 13 Dec 2024 22:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RwAGUduA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321F110F105
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:15 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3003e203acaso19561821fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128113; x=1734732913; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gTen3MLzUzXXvgZKInKgFh0vdQsFh4VkZP2U7PMmam0=;
 b=RwAGUduAV+Kehb3W8VuP8mHymZiyDBx4QVJiB0q8UIT8EQcUZUwlfqm2BU43GfL4Lg
 mDlbiCpIUAW5n1GzjhaoO5TzHg4OlYGjhL7RzDSQfBTheGlhMtHWD1spPM+D2tI+uWic
 WU3DyrQ/xPZD1gQ3r17JjwSHTjDQDk2PTkfP39JSHndXw7Owc8fq6NSs+wKj3bqvoblf
 O8O5r6lzbZKm5momgCUWA/C0AYn4eH2guZcJW4Deok8KCnXPxbtOtBPuVV9p6P8qrQew
 ETkrrcNOstZXJbY6aHcX5hw4rysDIb2te0WzAm1H8KY8MyI5FNeD4xttUOGRcDqI6hd6
 mxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128113; x=1734732913;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTen3MLzUzXXvgZKInKgFh0vdQsFh4VkZP2U7PMmam0=;
 b=HPpvDiMverPHetozqEhMzlTBQ2LmUiFke6pwVwto6iTWHqvx6Bc4hJ2nx7KC6eFqcI
 7NDmXLjR/JftLUHld6HkzYPQk8hHlNDVHpmRkYdQEosLigcaTSsIAeHVUYJIWyJbIG+H
 ezbr9aH1Qpjx4IkIXV1ZrZSdMNkb+4qC9asyCHaP8yN4w8ENDba4SNXdzrjhraEr/KrJ
 UO639cmloKLjcKc6iQ1GHmV9qo9CffgTeuPPUlq9KJERW3DY5zMRIcvpcHOIJhPoUBvD
 XQAHMgXR+rcHxS2f/zLgWmNblLsLz0eb4JLSq6Mt9Ie4Okl1Tb3iiwxFPN1KJhpnsjDF
 JImg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc9hN7wbXqPfg91RKsi7fHwDV8B0xYfQs+usTGDClldWDZ/iVI70yzI1Iy/5N/I+a407XttoJTVQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk0LZpqEB8I5CNGA3Tx8g7Gz+MNTAwdFjQONqCEWOqd8fyvnLy
 5FYK5+n6OszDl3Qsv+xssfuXoBYToXbNg2f2pcVfcnBsbQESTbrw82cyWJfmpnY=
X-Gm-Gg: ASbGncujB4rk5ic9AYVbTJWV2hgUd4TGYmEq8ey6MgH0blFbh0RbecTQM0hdzf/q4/k
 aMtJgxVtIHKVcPUGILxN+Km+qwnusp9O5K4zgR2ckb34qeYbqvRZsFi8anOLtrGa3H11evVPiRx
 LNMXosc//44F7umhj0ln2Ra0kNt06HOlQ9Tk8V74gzGngzFyWdcG2+X2VuJ4QBJlgr+3kcJIfgl
 Ekxgd/vREzfFanuJ6ZLMUtFp3eY0z1hnUGQNi8WL8vSXRBvi2GmwY1dR1RnZ6Fl
X-Google-Smtp-Source: AGHT+IGhehVgdzx1i1C168VhhYvqHD8YUOQ5/Sf6tYXDzcFnjRY2EnsjMMRs7Cl7C2CtfmggsqIRGg==
X-Received: by 2002:a2e:a9a1:0:b0:302:2320:dc81 with SMTP id
 38308e7fff4ca-302544f94a9mr18022951fa.29.1734128113516; 
 Fri, 13 Dec 2024 14:15:13 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:32 +0200
Subject: [PATCH 16/35] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-16-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/NnPOG7oiIzewxWYg3YzQ/UzNsq9zG9OnyGw9Ls5kf8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHG6jMDZ5yDcAevjSw28Xh4hS26TBQsquJ6d
 xULnxrrSrmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxgAKCRCLPIo+Aiko
 1QjECACeBo1ZSnhdDm60oXksK6oQWmuKuKco79Cntx0W+9EwBK+59HdEJ2Zs6J75IoEud9S9mNU
 4ukULTZgjbYMu1Em1057NA64f8Z8e/SftJKjkqdyHy9WWTSnB2kh4kJz7i8pOYKSjDY25BX9R+C
 QulDuJNybExzcu+Z+tEaIZCF9IexXZJwuicHNR4JR899pciHmH+UuIYgBQEVW6Q/o/RcMfwXVk0
 RQIVfmAwhEgmZiR9zoRewQLN3C4DaCb56nkpNgYf6q1DaBh0XisTUSGEdSjmoWxubiF4zYpNg3Y
 Cml6JyZs+gMRLVkjOvli97ZfhA1w8qnMMTLuE3gYa/P8ZFa1
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
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5d8f89f8a8a6ad772ff5f4cb8421cb3dd09cbc30..0078b203461992267250b6ceae7559aeae4bed9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6c21e1b0ded669b82f5939df748ce267c18d05ae..5afdf7d4324423952f5e9d5735ad112f600f1b7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,12 +145,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5

