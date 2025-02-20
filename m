Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E7A3D02E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 04:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEA410E871;
	Thu, 20 Feb 2025 03:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DWH9XX6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4849D10E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:59:32 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so4020121fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 19:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740023970; x=1740628770; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1buqoTyS8LTS0FvAWXv9OjwwCEAG9Q8Buw04m6my9bk=;
 b=DWH9XX6rKMND5MQpnozaY+MQDstpyGUgAymoOCGkiFypdeRXZA7wrlM/WLphhFYo/c
 IHJMmQbw4GxA+8Z+FAHVnDjT0tTno8IrTNCRjZOvLSRWLHe/rb8mfmLCfybC0JNnOkRX
 5I7BFSE1cheRhsc1oWxuqwdjdJ81Fkw9N1EFavBKZcv2bL/zAFd6ryxvjUc+2S2kZN5I
 P0vgWrmcGWk35JUGu2H++Jj925TZuagMQetn1YZMbwttip8+KrDUXNRqLsKtxWx9vbXF
 thneGrxlGxN4GmuoPsA6X25RNAH+DUtaHGQx48Ex+G36E0FiL38N/oRo8cOJYnGymGNn
 qfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740023970; x=1740628770;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1buqoTyS8LTS0FvAWXv9OjwwCEAG9Q8Buw04m6my9bk=;
 b=rJPFrjgH939m9V5jHBiblyIo8LgUXsTiQmMIVhHALr88HTaGZIT1Blmn2qr2OP6Th9
 FGjNcMiF1NVwwHto3nlFINIj2l+mePCCFIBIQNaUIj/uEu6NHsr6iLABcEObpQ86FU0t
 Y3UM0LjAhKAbAlSe/1iLbzeYjOBJg4PR4ejIlBFaMiwhMr2bbCcH1UNC3kwNJcotEntM
 Bzc/zymKQR4Pwoc8FDeCwHw6tI2sHVI+ti94DhqvKCfSY3ETdDRkUYahNxrXYQn1YP32
 SwwkfJPYP7Hgt8VuxlAppq89QB6SAyH2YhHDHjfYIRs1CxXzt8njIjavCil+3tDkXVbd
 qrvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJEdvvgmhyOVm51i7Yeswb4+sopCbfg6jnWM/D8pSOACD++adhZ1G5VDEka279y5zeSa82B+5x/Ss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOerexhb+EeWnI5NkioT7HSokmqyk5K04VzRYoaWymMN13zU53
 TNlTYXXz/gElDXMf1eEpy8u5tZv0Sqa+q1Ms9/FMTpWsDxZszjw9GtR7xXUEWbMoaLNPhmjmHul
 L
X-Gm-Gg: ASbGncvGXjhETfmWu1U+N1bCDKD9q+RkVo1yJi+1nA0IcQCBw8qcs9fvrd6kuCBMECl
 dF7sOb0kbKEPGUQNLCAsYOsFs1coL68SrpFKALMyyskIApq/bKAbqVLOBc/PDcclUF2rwf6ODg7
 eeaKXdvLM6FpPDwPDUfoEDYbfNBFIHop3j1YB/FOsWcb+w/MQr/OgWnQozJBWq25fETYoEOeVlN
 ja05u+I2X9NlHPDaFn/1ctHvjjEW9ctdT3tOO7aq5U4A91e47C/xJUqILZ7iwcASYXkz1apjOAn
 2jT3NMmSmVd6++Bem1Subjw=
X-Google-Smtp-Source: AGHT+IFB5cN6OcdOISTIDzwCna44ZkJ5LDxYOgyNDXJJOJ+6bYILIa/mm9Rz5mRGFEMeDIU6b5l6uA==
X-Received: by 2002:a05:6512:2356:b0:545:27dc:64ca with SMTP id
 2adb3069b0e04-5462ef19818mr2697703e87.33.1740023969994; 
 Wed, 19 Feb 2025 19:59:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545225f22ebsm2143909e87.16.2025.02.19.19.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 19:59:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 05:59:22 +0200
Subject: [PATCH v2 1/5] drm/msm/dpu: rename CDM block definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-add-cdm-v2-1-77f5f0df3d9a@linaro.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
In-Reply-To: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3239;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GNObJ2Uc82KNceelQcBkAhl4MJssNBmn9OFMj9GdoG8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntqidUq2n2lRLNlCrtDv6lB+4ZMDtYRBGU5i2e
 K1aGLmhE3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7aonQAKCRCLPIo+Aiko
 1aAmB/9iC8sBodCCNsTdZwNmP+kdaeSGLaeeWPtf1IbiV7bMBzo5Pvz9DhNORb05OCZ5TyAf/WD
 ipEi11Wgp1+lZqs6F08BuwWfjNPutNErNaW1qHqPu5SxrBlDAzX/HXCfoagXqBq/TiJ9dkEJBKs
 z4zbozXCPJ5A20YQiHWXWV6BWeoYnK+CzNmrvck9HyTA0wzcX9wc/JKwUJn9PTqeHy7LlqniEoS
 XWzAqhEKZlH8GCn2MaYrm5MbrccNj9eN21HXm39zLPMwV641WGoQD+0tUHUz3y4VSdzA0gdLfx3
 SGrfSGlASywMQKW4H75Znr0/8g44MCwYVit+wlP7/P0keeRX
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

The CDM block is not limited to SC7280, but it is common to all
platforms since DPU 5.x. Rename it from sc7280_cdm to
dpu_cdm_5_x.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index e8916ae826a6daf30eb08de53521dae89c07636c..47e01c3c242f9a2ecb201b04be5effd7ff0d04b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -386,7 +386,7 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.mdss_ver = &sm8250_mdss_ver,
 	.caps = &sm8250_dpu_caps,
 	.mdp = &sm8250_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sm8250_ctl),
 	.ctl = sm8250_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2f153e0b5c6a9e319657b99aa0954d9b190fe724..e9625c48c5677ef221b8fc80e7f9df8957b847e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -248,7 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mdss_ver = &sc7280_mdss_ver,
 	.caps = &sc7280_dpu_caps,
 	.mdp = &sc7280_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 76ec72a323781363d37b62fec752ea1232bbd75b..4d96ce71746f2595427649d0fdb73dae0c18be60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -458,7 +458,7 @@ const struct dpu_mdss_cfg dpu_sa8775p_cfg = {
 	.mdss_ver = &sa8775p_mdss_ver,
 	.caps = &sa8775p_dpu_caps,
 	.mdp = &sa8775p_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sa8775p_ctl),
 	.ctl = sa8775p_ctl,
 	.sspp_count = ARRAY_SIZE(sa8775p_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0b342c043875f3329a9f71c5e751b2244f9f5ef7..ec7f42a334fc688bec468df490c81a89dd3d396d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -507,7 +507,7 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 /*************************************************************
  * CDM block config
  *************************************************************/
-static const struct dpu_cdm_cfg sc7280_cdm = {
+static const struct dpu_cdm_cfg dpu_cdm_5_x = {
 	.name = "cdm_0",
 	.id = CDM_0,
 	.len = 0x228,

-- 
2.39.5

