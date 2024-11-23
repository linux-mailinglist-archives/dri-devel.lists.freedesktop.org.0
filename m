Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F469D67B5
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 06:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DA410E46E;
	Sat, 23 Nov 2024 05:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zPCRWrBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506CE10E30F
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 05:45:09 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb5111747cso33389841fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 21:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732340707; x=1732945507; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/hEtTqrfQSr9pI7m+IfwZIAeqdoTOG6+nBJQtRsFkFE=;
 b=zPCRWrBLTuC/UO1SLwk2wDjX6UjqUil6Bk6+5N3rAX7bDO3EjUn0TRCYt/gF7Apgmb
 lyWw8D7V5It3iZXuNv7TN78cxcbU+fPX08wJqvb8DluAEQ3jD1w8t8oAV/n6YeWldbAu
 rcA7kjVV2fpxHBaKh9HQO1N1GSS9MUlDfIdRZWySXkB6QubXl43uYK6OOPxvbnMzwFbq
 GILH1Il8jMjJNMmwmYwwSj9F4KPDW0Iz1Vpdly5DfFvlHgbmrW9RYvBZw+FuGDSBD+bH
 cJp/tNSQ+mnK/FFsjA6PaP13PVdHRT2G9QVOUoPI1QSOacN3KHsiu4N8Z7jecALkuRtt
 WMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732340707; x=1732945507;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hEtTqrfQSr9pI7m+IfwZIAeqdoTOG6+nBJQtRsFkFE=;
 b=S1D1rLYgU9okt5Rq67EatNwwpbzy5WEKqy5xc7q47BvccU8smUHkqUScg4jt2591fH
 aWapa68mhZKLC5hqvzWkNd4UBQijcpX3Bp3D/L3mNUUna98ie4jeTexdC4dTj3IF+GdA
 hyJ4axfxF7krSR5yxiBggs34igaDZ0Hq1Zsr/vksKH3GYClraY1qh7SY2LpO2CWm2bpb
 EARb6uC977CpiPK3Xvrm/ARi6uffJcP3taw6DJ7szcE6ZOzy8VxMwmqAbWdimVUDFbav
 AQLhEP0XYt3IVWISY/JexBs1vVA+n7WAY9plPTJPUFcYANXmVlMhtl9SUR4M1HdLJ7w3
 kQNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQIs01jge60ncs8IRNwo7NUa5CySXAmRU3iC2jgzPQNKldsxom3jf0CWHK0aVM210I+2T2PGoTUHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1Z8t2ZcIbgZy9T8bU6ICjgGnXZY6sA3JHHy6dswdzLicMblqW
 xQtzqYu/nlosQ6Sn0eDYmOncJMGUe9Ozli1rCPf691CapeUyn7JYrp8PFM2joec=
X-Gm-Gg: ASbGncuGgOvuogSA5ZEJUdlzvyVvR2U/eKPXToO55MsovpezN6bE3mtJTQgiYJVZFv4
 uloHHFwibN+UqXG4O+q2zgaERO3zIm/dvU3cCzeqbkpxldtJQDLv8k3KRVz87iiB30otnVJlEaQ
 ZNS7EZvyuY61k5BPHPPZVxHdOor4Uo+WP/yZaJ6ZHzyZtoO3Y9q2vhx57q3asY1ohsFwhIvVBMu
 6F/oKbvh5i3SxZJtsTjewlNWKXu6H9Xno4p8I1tSSipUykQXR+p430wTA==
X-Google-Smtp-Source: AGHT+IEJNfzSkuCdzOOYuqLdhThDbipynbQzrrmzQe+8Fcb8wjmn7htIVDE2uytHwA9HycVmGGo/ww==
X-Received: by 2002:a05:6512:3a8d:b0:53d:dbec:9fca with SMTP id
 2adb3069b0e04-53ddbeca289mr516396e87.0.1732340707412; 
 Fri, 22 Nov 2024 21:45:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24457e1sm740143e87.34.2024.11.22.21.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 21:45:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Nov 2024 07:44:56 +0200
Subject: [PATCH v2 3/3] drm/msm/mdss: use boolean values for macrotile_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-msm-mdss-ubwc-v2-3-41344bc6ef9c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gdM2PmIA7KXreNC4e0p5DKW62M8digF3+8KzLk+7N4s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQWvaGO+Y6FoVYTBQaZpzt8UIWJKd7OgPZXoQb
 1CWB/ILgCCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0Fr2gAKCRCLPIo+Aiko
 1aiHCACm2sH3vJTnYnx5BmVp1ztQ3EUYnPTFk6PpxdglQX8AeznE9hDRIEelD+LPW43iHWofTU6
 pkI62suQqYHajFWAEqWMO18EwqVqy8xODNIIV0GBVjgYSpuWvZlSix4uU/5q/T/Kwi9ygdrhe2z
 sNdynfWUQE2Ey1w1uwdNpWI2v/n4ETEGp+y50kNNaroNRRgX0nJOy4Qt4zwdij2pr6Fg/QvqHi5
 6DpG0F50H4ZDjhi8BmRCgHDpijcmR2jRVWR9JaGB2LlmjHrVbRK0IiWFItjDK72fIio18UrkFxZ
 Ek0kVpOmVc/k+s/ED6PQDFAFrTg+2vnXABrRLWw9SGP24yXx
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

The macrotile_mode is a flag, not a bit value. Use true/false values to
set it rather than 1/0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2fdad0fa4bc159e9a10755da2c0402fd87734aee..2d9db179accb0fd8666fe80371ea44a1fcc15e1f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -588,7 +588,7 @@ static const struct msm_mdss_data sa8775p_data = {
 	.ubwc_swizzle = 4,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
 
@@ -607,7 +607,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
 
@@ -615,7 +615,7 @@ static const struct msm_mdss_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
 
@@ -625,7 +625,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
 
@@ -689,7 +689,7 @@ static const struct msm_mdss_data sm8250_data = {
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
 
@@ -700,7 +700,7 @@ static const struct msm_mdss_data sm8350_data = {
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
 
@@ -711,7 +711,7 @@ static const struct msm_mdss_data sm8550_data = {
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 57000,
 };
 
@@ -722,7 +722,7 @@ static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	/* TODO: Add reg_bus_bw with real value */
 };
 

-- 
2.39.5

