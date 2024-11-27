Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B695C9DA997
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 15:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B9410EAF2;
	Wed, 27 Nov 2024 14:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R0K+ZbP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB4310EAE7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 14:04:52 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53de771c5ebso3420138e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732716291; x=1733321091; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rzfmmxXcC5nfkCV4gc5yUHDuhltopU/HIPPIiYJqWlY=;
 b=R0K+ZbP3MRp2+k6B7jCJmYAbtDvzwbJzhOYTZbrrIHHrr0yhfMtRKgm38UqPzO4/30
 TSORUvpWV+PLBDD5JgeneB8ydNzBj0MGh9mTogIf3ahKHC4kdYD+o7T8zympMH2q/aju
 KfyjssDUx382CAZ8+pYvYMROZVHQhpuEr3WNtmEk1bhec61w8/F4tR4k+D/CKOB9t1XH
 FRoEsMVlwrwC7wDyDng7FGonaOnkonvXu7rFP7vVMXzIRq8GvZpzgVsI9/GWwnkkn0aC
 O20zTB7qcDhXmcgXD8wlpnxSPxn+7wj619V0cHEEoa8nPdA0OWgC1VG1EAByjI92CiTs
 MsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732716291; x=1733321091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzfmmxXcC5nfkCV4gc5yUHDuhltopU/HIPPIiYJqWlY=;
 b=DI2ftDq4i+qPF7Ky3d4OcOpJc7PYEh0QPJARn3XS1jtNA+x1AMbz6tP19P6dRyqTUV
 xRhRW8zNSMzNnaa69pFdPd5sWlCDcClcTh87pPVi7xbPiiWFL806dMoPNxwDoh84Cbbl
 avp78XpMLpfMuGiz1aTeCkNBnoZCsPPPWOEVlnHes+WhaUX6rwpOKccnl6u3KC5LU6Jf
 pZaSMutn718HUHT8ckf8C8FB2Ypo1NGbVoGtk0tI+26lo1oH2mc42DisV6dvUtoVQVvR
 kPvY96uL2AIPNoQ9hi5w9bDiJ/FBtlFWWf+GxQMyE97rw0rcIntNL2MvAP08rX1m1CfH
 T0wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW8nVEkTGbsdX5foscbclxpNdw89cxHkJFYiTgK2M+I1Sq4j0fLhnTSZfDBCe/fMkN1rH5GBhOdvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxncqMhaLAiCVllU8r4gbCwb0TFmbbqPndfZpbM6T5eST5nUUZk
 ey3iy2NdVOE3RPYxGn5Xe7peUeQ/wCEls5RY3LSLiulnRIavkmJPgLu4RJs6j9Q=
X-Gm-Gg: ASbGncuTY+2uero4HTpxyq58ToYeGIOTGf+k/ko4EPY48coeqqKqOXBt5mgzT2WNklV
 9xKTx1ZysN5Oz/994UbdMEE8JtdElJ8vd868cidmH/QxEiiXYxNeIPlmn1MpIDJySvSCrYWJ1cb
 I/XNwoeiE8yHhtmHK0hJI9EFVelH8dEG1hh+kTe/Dt/kExQ0vttGVkwhvQw/v6z7SyN/kpg6rrp
 10euoMUp8FYQvhXbMh/k4WH8RpmSt4GzKeODdOy4FnmzmIsuFCM7KRkUg==
X-Google-Smtp-Source: AGHT+IE2Yz6mOY37264WsE3DpCDAykgqJRgeSNe3trAvSeoBcV7ImxZGXM35npt/8X7BY4n/kF3gwA==
X-Received: by 2002:a05:6512:ba6:b0:53d:e5fd:a44a with SMTP id
 2adb3069b0e04-53df0112217mr1863531e87.54.1732716290684; 
 Wed, 27 Nov 2024 06:04:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd44cb7c5sm2157291e87.122.2024.11.27.06.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 06:04:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Nov 2024 16:04:34 +0200
Subject: [PATCH v3 3/3] drm/msm/mdss: use boolean values for macrotile_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-msm-mdss-ubwc-v3-3-9782a7c2b023@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ErNLlV3VyQUaeuBrJa+IVJY8nm3FUxVk1dHk6f1cd6s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnRybz5EfeQNFPp88Ula96PZeIRf/rzwux4YPIF
 4srT6SRd8eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0cm8wAKCRCLPIo+Aiko
 1c/GB/4mwY3uWvHXGyq/FbPpZu83Lz4gH8Aux84nF/nOP7nQF3NArHkTbPL2B3q+8GXtGQj78EK
 qp7oH7AJiyd93pxBlsc1KdkNxOL9QGZnYxnZsk/iCYPXzGsdnqVY+Xj47Gb9NAtX/5tNRbwX+HP
 nQaABEz0l44nD6C8RPgzdx/Lufo9hx6tf4+x2m/LR6CaDZOpyD1mJPQA917YlqkpuhXBnE4XvZA
 c3zy3IfY/01wXEzbMBNBcM/gstwVu/tN/J17OHIy8qy/wKiYU+20JBK521KzalJWM1JHqQyOHFu
 AGuV/fzcBvSjXKwogKpufaDGitf2gu9xGh5fuhQGHoW6KiBL
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
 drivers/gpu/drm/msm/msm_mdss.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 87ada64133924d712810c644a5ff660a082c2abd..6dbeea860abfa1cad8e1da926c66b825938933a0 100644
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
 
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 1714bb41b838c33f3da19d93c5c1f5c53cfbdbab..14dc53704314558841ee1fe08d93309fd2233812 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -13,7 +13,7 @@ struct msm_mdss_data {
 	u32 ubwc_swizzle;
 	u32 highest_bank_bit;
 	bool ubwc_bank_spread;
-	u32 macrotile_mode;
+	bool macrotile_mode;
 	u32 reg_bus_bw;
 };
 

-- 
2.39.5

