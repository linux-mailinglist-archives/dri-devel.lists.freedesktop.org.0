Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56179D67B4
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 06:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D8A10E30F;
	Sat, 23 Nov 2024 05:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qc+ZMlVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBDA10E25A
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 05:45:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53da209492cso3717386e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 21:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732340706; x=1732945506; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7DrDg8Sfy8VjRbQb9wXIsHbLpgOpk0bBFDGmPm833LU=;
 b=qc+ZMlVwu5P1azF8Q1G4287QgL5uWh/vR2pPRLbw/I04dQHH2bM48INzhStlXhQxOk
 VqC4MU1ok6DHcDv6fRQhdPmu7NuwjJbuCavR18RplIiuB6UJaXOTOzFWtTB+s1OtHkbS
 8as7D0NbklxpxpLCB1vnyHPuhew1opkNsNzWrRCirSNqH7OEdmksX2UOCiOMn9xqmdpi
 Bau6jvsKIWF2zy7xYmtw3ZDO3Aqx6D90A5DjLjAobuQwbmSJpncTLqBchHIxIx1xlZGh
 PC9X6nzBEflqh6lJpKg01Audp43CnFnH6Y1uevbnZbnr2Acz51J9FtnYKmvE2Jg6O7cS
 oKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732340706; x=1732945506;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DrDg8Sfy8VjRbQb9wXIsHbLpgOpk0bBFDGmPm833LU=;
 b=cTiQ4eJRrrLImLdpwLjnso1FQNMkdWzEMqfn4+n9JQAPOZERTE5Bei69QUrk0UYRJj
 wt+GLtSUMwNmtNo/9mwO4jClPFOtRJDN2UoZ80oG3INSRUN9LZWAamGe3+my1ALwdhIB
 sJTeSbN5/2V1+asSMS2yIkLUWNSBhziY8Rm724oBWboH5IdDG9ciVcg0Hw0H3Cv+9yoX
 S+HXpgkZQKl+/8HNF/ZlyJEt9jXONpDk1GjUi56v/9kD3s4enX8ETF/OqxxHv5g6vTCI
 m/z6Yhhl2mgYpPSS6e0iNIEYzsE2bRdytqNBijjLlKl3FTg1UG4pUF2+IKGB0RsMGVDG
 zulg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVESku75auFEZdBqmvbctt1/UZR3N1t8hZ1TTSfBpv9HTSl1FukPEDz5LVDPSEvjBAbvAIXxO/MbgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu/jnu1iW44IcVZGqjvoaj+MFSLNJGcQne68fjJqD/gAgt9PRS
 fWnRt+17TPlZYjnE6WXtwDY3BEDiik/y4blohIaytlHRI8aLCv9L3BY0bEhPJ18=
X-Gm-Gg: ASbGncssDdD5oe+tdP7JB2YEz9I7dXb7ZjqXWva+djHZxJKR/WTmFR+vcMTEEF5MDgA
 f//kieqP2Q1H1XXOEYPVZsJRRrDW/wUlXuAw/iQQwOggMa6ud658tALSFL3n697IrFI21H3xPMR
 lmwFG2JVQdcj8xTl4lb22QygO9OKXLgOWXNGtS3ZiAtAnvn2mo3OWGFtgJWfFdza+phemM0hSEE
 wgspLt0sLc/kAAkl6T55sXXQpoRBIISaXADKYXvtC/tBNK8Z5ZbTfKQdg==
X-Google-Smtp-Source: AGHT+IHNt5F2db538ToS6v4lWa1hIYzGmz2N5AfeJ0J+hmybh71MXci0fQWRwaxAHDyf839+P0+6rw==
X-Received: by 2002:a05:6512:3c83:b0:539:f7c1:5feb with SMTP id
 2adb3069b0e04-53dd39a4b16mr2495567e87.39.1732340705843; 
 Fri, 22 Nov 2024 21:45:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24457e1sm740143e87.34.2024.11.22.21.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 21:45:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Nov 2024 07:44:55 +0200
Subject: [PATCH v2 2/3] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-msm-mdss-ubwc-v2-2-41344bc6ef9c@linaro.org>
References: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
In-Reply-To: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RCQrEDg9Jf371ZVvZyxUNDcRd0dYuvhxst+HGMFH54g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQWvaJC/hfMr53Xnp+aU8MlaVVv17sAyaPbzhy
 7IVBxOCTZ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0Fr2gAKCRCLPIo+Aiko
 1dkOB/401lf+nszpksFsYEwE+4wZaylb0UuOyr6FiEosWoZPPznYOblrU4AVUIRMXw3X+cqS+cK
 jLxPa+zbtH+nUwqueapeeZHBZ6cjSuvYAvDUU77o/kz4/4gfdjyLSMvS2jJCRNFbvINciLFo78z
 soguSxPjKZ5eS+o4seBUMs6iuEGAstV1VGVfOI/tsTRWyCb6Wg1UxOpE8mIAgVz7SZhQOBtNjvQ
 VXCcQcK8JzupqDL9bJyAGAfGjKitrHrnzPpD2vopgG/x/WhsdtIGKevxK4aYoG5OhhG57xIe2ox
 AQWwwp26Gx5Tgj7y6lAtqfaiTCZLz5umIPQqiamiivqCkqLa
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

Follow other msm_mdss_setup_ubwc_dec_nn functions and use individual
bits instead of just specifying the value to be programmed to the
UBWC_STATIC register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/msm_mdss.h |  1 -
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4b57f39bec4e6232a0f5b4d49f8ae1200e74ac78..2fdad0fa4bc159e9a10755da2c0402fd87734aee 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -166,8 +166,16 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
 
-	writel_relaxed(data->ubwc_static, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->ubwc_enc_version == UBWC_1_0)
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
@@ -587,7 +595,8 @@ static const struct msm_mdss_data sa8775p_data = {
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_static = 0x1e,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0x1,
 	.reg_bus_bw = 76800,
 };
@@ -638,7 +647,7 @@ static const struct msm_mdss_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 0x1e,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
 	.reg_bus_bw = 76800,
 };
@@ -661,7 +670,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
-	.ubwc_static = 0x11f,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0x1,
 	.reg_bus_bw = 76800,
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 715e1426093de5a4f3b7d2b66b889573c30b7b5c..14dc53704314558841ee1fe08d93309fd2233812 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -11,7 +11,6 @@ struct msm_mdss_data {
 	/* can be read from register 0x58 */
 	u32 ubwc_dec_version;
 	u32 ubwc_swizzle;
-	u32 ubwc_static;
 	u32 highest_bank_bit;
 	bool ubwc_bank_spread;
 	bool macrotile_mode;

-- 
2.39.5

