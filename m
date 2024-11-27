Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7F9DA995
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 15:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C053C10EAF0;
	Wed, 27 Nov 2024 14:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LxKFgmUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C72110EAE7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 14:04:52 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ff550d37a6so75833561fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732716291; x=1733321091; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=72/s2aAz5EY0mwh8LitCCx1LbBniPW9ZXzF/7Krgc0A=;
 b=LxKFgmUvcIgg7EhpSmpm6P78/5g5pycBPt2gOxKUM6bA/QJprwww1WVjGLXW/dLFDr
 UTa2oSlXcVih6R4saeOl8Qjej15XbaZZjqjOCcXO5my+5x6v00F5Pq8X65cw1L4uF8I9
 UaqS5lZqaFe4wNKN9If6sGztT9uslL4iH9+XFEEz/bwGu7ZoqNq4aYocJdRjbmkIib03
 psl65cGOluVVxWNi6PAOy0uulkZtn8oDM3VJpsgY7VnYHEJ8oxWVcW6eh6A5SUIS/Aus
 //SD4mCeFbM1ChfBxq9USMq2ps5+VWBqUbuLqliAqMHCwjdVdkQQ33vnjB47EhrK82Fc
 EM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732716291; x=1733321091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72/s2aAz5EY0mwh8LitCCx1LbBniPW9ZXzF/7Krgc0A=;
 b=JENWz4Xe+xGCz30m+b9fbZe3nK3CqUAB6bxnjEZjqHIR/KaxTRO63FmgbYP2590e1g
 89nPRiaA8aDJgRq60k9oKNgLsQ0e0ZhbTbfoBGFZpY0w20FXMnzrqJiABTsTZ3OC8P/F
 V6uglqPN43lDTVeKhSjULU5hVFYpPWe1KwHze6gsSr1ubl0DQ164YNrpv5Q6exKQQOKI
 WBbkZRZpgP5TiEYUZ3TKpasPxuuj9VdPtUSn/BLfb2T8Q/aO+3y8J7pFAGK/HnPBX+i+
 XW+rgMpXCViXTFxhJr2ft4D6B6Yk6D06rOC+tBeSbJfzsBRKH5L4Amk6PH/1FtYJCwQu
 Mh5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Kp22kEzvCCSmBvRLz/Chga5jFBhsmLpkar8AjXRWqu6xFOtIj53J+UOvOeUBi27MsnEkawqoZCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+fht4Jp/IsKaX0chmbDaf2QDC6pk4N9diNrgqoWHvkkFbiADk
 EQvHz/+T3qmVBLabeaAzKzgaXQzv+hvrqSQhXMkzx4wYLP7KpuKOOIholUKm7kQ=
X-Gm-Gg: ASbGncv+siYpBmZmsXXC3x6nXSuAvGDnJBsgPFT+a6i0Kyfn3u2f+n1PQbqjkH29Uy3
 L9MMVu3TAgjEERCs1KzPGN0kPCzIgnfTKNWCtJBZT8VNOkl66P10dxJbOLE6iUcPlwiNtaTEnEZ
 prmXj9RuJGTTI5NBs+I8tN7wuDuoPSpEpJjXKTPAWYKqKWJdET5AG1Ol+yyofRquAl1GQUs5QID
 /GcpINGnF5/AOTYBmF2oWFVQ1U/FBp4+MLzlFOkicgxpcCp1TzsPb6AHQ==
X-Google-Smtp-Source: AGHT+IGF/QHYDm0CT+wA1NuP7NJ4YCS3p/mH8/g7Cx82llyqYFv5ATWtb43Nzi/a5RuKJ1xyN20SLQ==
X-Received: by 2002:a05:6512:32c9:b0:53d:e3a6:ae82 with SMTP id
 2adb3069b0e04-53df00ccf7dmr1632023e87.14.1732716289138; 
 Wed, 27 Nov 2024 06:04:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd44cb7c5sm2157291e87.122.2024.11.27.06.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 06:04:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Nov 2024 16:04:33 +0200
Subject: [PATCH v3 2/3] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-msm-mdss-ubwc-v3-2-9782a7c2b023@linaro.org>
References: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
In-Reply-To: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2727;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QXlCwnR73sOvgJbeSLPKA0J+vuLe1Chwk+otkmp9zJM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnRybyC9Wz4xuhmvfGaHaKJ7PiP1FzhN+t5Et36
 EVrWeYMjQWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0cm8gAKCRCLPIo+Aiko
 1dpZCACZ7g/CCQJyt4U5vHY+J2co9NFbwn6zfIj5RmiF/WDoZk6OzjGboFKXiHWKrNo0flIns68
 cehetRi55IUJO47IYj4eO3vMc4Wwt2rcaJYGMbIUatj7YxlZRpq+lDZhOjalHsrCN/2QINiDMgJ
 72IInEH1jK2eH+f6KJKmJd3fZJiaUnUMvvJh95nqQbMYlYRIRZ0EgpEaGT8WTYCQ/dUv29HhfSp
 ng/5PwLWdp9Yj3WLdFgB83ErB9x5Rjg38QNgFQ8g/mlQXCaLi7RIWCAzb7WrJEtu+7w1Jun45k2
 rqh3PiQOnGna9wr5LalvzgOmczJWNDKjYRHhMp7qS6bElAxn
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
index bb176178855cbe14386481d90bf70aa82be4d522..87ada64133924d712810c644a5ff660a082c2abd 100644
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
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
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
index 737ea6c39271ca85ab82b72914acb9781a7a2cb3..1714bb41b838c33f3da19d93c5c1f5c53cfbdbab 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -11,7 +11,6 @@ struct msm_mdss_data {
 	/* can be read from register 0x58 */
 	u32 ubwc_dec_version;
 	u32 ubwc_swizzle;
-	u32 ubwc_static;
 	u32 highest_bank_bit;
 	bool ubwc_bank_spread;
 	u32 macrotile_mode;

-- 
2.39.5

