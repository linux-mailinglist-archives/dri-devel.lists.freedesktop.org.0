Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E301897DC25
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 10:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5473510E2E1;
	Sat, 21 Sep 2024 08:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zjAPzMnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B54010E27F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 08:17:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5365cf5de24so3579434e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 01:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726906661; x=1727511461; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ixfycQ+OhOhX9IuLXKX0B+HAxSW+VAgfI+FMAgQa7F8=;
 b=zjAPzMnDK1PXwFctwI2aujAIjQGiQRyG1PlHn0lkw4KNq5I7oQLRXz88eVDtFb0CIv
 RveiT4xEaKIE2FbLZ8tB5GqK5huKDNzi0NbAWE+Dlew0hsY/XyN17JqDLf0BHfFEqOoY
 6cQ5xSZOOh4Qaa6YQn+cQGPKMTmSEkCIhovKqMmNFdgugomx15XGcpibeAO6K3CR5Blj
 o63E+yY87aVUGPJwbCaIitsm5sdgJp0gtAJcD6fhjrl1XZtnRXrirFUxMcpM2VTV5U5C
 yRsVwVu9HEJ1nIeV84eFHzpfPzYGHRMUaqt3abqjwFivTKfNlWZLGiLuMYPxvX7VYxfV
 HSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726906661; x=1727511461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ixfycQ+OhOhX9IuLXKX0B+HAxSW+VAgfI+FMAgQa7F8=;
 b=JB+HwkZZ1YArObFtcSuu41/K0zgH//Grf25MW687QEPyS6XDSbPgW/ovzVIvXS12hL
 hqidYQGnXNkPpsqmQ2EzLTqC14FbbUh2xSGxvP2w4Mkkx4gtckIzZ+RkoZ0MKOLKLtCH
 mbkZAA9u9WNRJg8xcSYRUyYvjtievi5iuR6wRe7O+IezTotDfCE8G6iJpxHQmp77b7WH
 2ANq/JDO+gFrKs2UdaAMs9MLw4gaqggnKUMuAGRhn7pG1FIWLqa0sHcYuxWdDqIwDEBy
 L3O+miMn6WjsJVaBXhmH+GP/S2AaufghpEAGlpnWz0V2/8HYN4JYIB1PXIsh5LPGNE7D
 i5TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw/oXzYx/ewE53i2dr470RWxB5CpgmbCvGhY2j9d3oVVp3lZLaq0dopEBHW7O6SkmWLpchshg+gGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCm0OTtlZw1O0qjq7n5G7eAOdQ3PmjpZRgEhQoM1I3CAWn9UTp
 36+pMPVIj/SS0Iybq+2kVTqbLw6/QUogY3bLX/wl+d32B0+45T2EcCHgPdxemzY=
X-Google-Smtp-Source: AGHT+IEp2IVp8R8KzUBL8pFZ6IqlRNTBR0iIOqCUIF+8/lDk/lTF27LBao01hpKd+T+aKhAGMpWpcw==
X-Received: by 2002:a05:6512:31cc:b0:536:5364:bc7 with SMTP id
 2adb3069b0e04-536ad3f1ef3mr2941827e87.60.1726906661068; 
 Sat, 21 Sep 2024 01:17:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870968d1sm2466380e87.175.2024.09.21.01.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 01:17:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 11:17:31 +0300
Subject: [PATCH 3/4] drm/msm/mdss: define bitfields for the UBWC_STATIC
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240921-msm-mdss-ubwc-v1-3-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5389;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=utH3zMLcvKLREFFdRj1W6cb06ULAA1VlL6GfopIfnMQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm7oEfpeo0nvjCbwL2dXM/STLppUW5swOrto7k9
 XdHqOo7RduJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZu6BHwAKCRCLPIo+Aiko
 1VCqB/9LxaTlULqdwKDcuNwoJVeE49D/XErOIzKSH73pAJu7Mpe32GRuPRCDmOlTPEkxRsso+i9
 l45NWc0w56sxH4PhPj7k7kb0enJOA+mF/4csROdGXG1mey2JkQ91evsX+gAdUUDJATv5tyYtKzM
 fclXMaHCMl8iadQpu2K9zV8c0sC7UNmbZWe5jKzuSAMeHk0kSGSt8qL2k7tKzMYIU+9slUTgemN
 CijIzfNW8lFkY7Ozx/N1qhjw5pX/BV2DBKRhlzyRhPJHkBPUmT9mSSbq87sQGaNNXSm6GPsz2ZS
 bj4qTK+Ar4E7IToM2yyfb/NxaA1DtYwZAlR7ZT1CLTc9cG0U
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

Rather than hand-coding UBWC_STATIC value calculation, define
corresponding bitfields and use them to setup the register value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c                 | 36 +++++++++++++++-----------
 drivers/gpu/drm/msm/msm_mdss.h                 |  3 ++-
 drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++++++-
 3 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ca9b7f953ac4..7704e1c9eb2a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -173,15 +173,17 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = (data->ubwc_swizzle & 0x1) |
-		    (data->highest_bank_bit & 0x3) << 4 |
-		    (data->macrotile_mode & 0x1) << 12;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
-		value |= BIT(10);
+		value |= MDSS_UBWC_STATIC_UNKNOWN_10;
 
 	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= BIT(8);
+		value |= MDSS_UBWC_STATIC_UNKNOWN_8;
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -189,10 +191,14 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = (data->ubwc_swizzle & 0x7) |
-		    (data->ubwc_static & 0x1) << 3 |
-		    (data->highest_bank_bit & 0x7) << 4 |
-		    (data->macrotile_mode & 0x1) << 12;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->unknown_3)
+		value |= MDSS_UBWC_STATIC_UNKNOWN_3;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
@@ -580,7 +586,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	.highest_bank_bit = 1,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 74000,
@@ -598,7 +604,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 76800,
@@ -661,7 +667,7 @@ static const struct msm_mdss_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -672,7 +678,7 @@ static const struct msm_mdss_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -683,7 +689,7 @@ static const struct msm_mdss_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -694,7 +700,7 @@ static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.unknown_3 = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 3afef4b1786d..69095c18ab4a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -13,7 +13,8 @@ struct msm_mdss_data {
 	u32 ubwc_swizzle;
 	u32 ubwc_static;
 	u32 highest_bank_bit;
-	u32 macrotile_mode;
+	bool unknown_3;
+	bool macrotile_mode;
 	u32 reg_bus_bw;
 };
 
diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
index ac85caf1575c..57c0bdf2ef65 100644
--- a/drivers/gpu/drm/msm/registers/display/mdss.xml
+++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
@@ -21,7 +21,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 
 	<reg32 offset="0x00058" name="UBWC_DEC_HW_VERSION"/>
 
-	<reg32 offset="0x00144" name="UBWC_STATIC"/>
+	<reg32 offset="0x00144" name="UBWC_STATIC">
+		<bitfield name="UBWC_SWIZZLE" low="0" high="2"/>
+		<bitfield name="UNKNOWN_3" pos="3"/>
+		<!-- high=5 for UBWC < 4.0 -->
+		<bitfield name="HIGHEST_BANK_BIT" low="4" high="6"/>
+		<bitfield name="UNKNOWN_8" pos="8"/>
+		<bitfield name="UNKNOWN_10" pos="10"/>
+		<bitfield name="MACROTILE_MODE" pos="12"/>
+	</reg32>
+
 	<reg32 offset="0x00150" name="UBWC_CTRL_2"/>
 	<reg32 offset="0x00154" name="UBWC_PREDICTION_MODE"/>
 </domain>

-- 
2.39.5

