Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8169F2BD1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E722D10E525;
	Mon, 16 Dec 2024 08:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HmVcfcAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ABF10E525
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:47 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so41820351fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337665; x=1734942465; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jFueXj50GklXs26URhroJEyDlIZhDwWcbd/CoZUqrUk=;
 b=HmVcfcAiwSjvh5U2Bv54ltdo4tdfTBxCagdSaLATyYy7r0fXlf7jUKSDhrEexNvUP1
 g6q5AMMl5yUig8HOvKjK78gr/2P3qVen+j5MKwil46kio97QJ5LGHi9esxZgFCJuo0j1
 LNBA4c+lZ8DsWCAQWZQQDC1LAg6TU3zgGgAy6PZKf39e2Z/Fb4x+ZUfHjSsLXyUd9g8g
 eYRhLHadoBQ6rFO2fv42K+84Ybguqv7svGxrVygVdD+NArKeGLoVGV2pEZGcsxavaATV
 hJgt9s+Og2pFgtpTZw1j7vniFwm3AZ/RLwLm+BJC1tVDCkpBqcnezNcS3al8yzxkOkZq
 Qz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337665; x=1734942465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jFueXj50GklXs26URhroJEyDlIZhDwWcbd/CoZUqrUk=;
 b=iYakBH71QT11tGFnpVfehoO3CP57zu/bV16y52F1dQ7OUr75XkzPNNDQQU93GbEG4S
 lEO4sqIG4ocTtBbHmm5u/Ip26QCTQ/jvhCOOOn0JHj3xXV0bG5ZUCXlHKkSe4LZfP6S9
 wXwBZS2e9hGuVfXjbavX8D8TFpVfrboV7Avq/e3e37vxm61AFleOL6biaiOWSfzt7xSA
 Kz1v7FArv8JvQQKDFgFLk5aeRDnjPUwL50j3ZNfZY6bKiofFjaFV0VqXQhjakl2nnujq
 bZ8pygrpDG1e6/fD1aMOEYlNYwM+6Ojk1u+wUDfSLtDPoQePWoxUCde97BLNHPmm6ZyL
 Atdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFjYt2DEoYDCvBQ4Uo//0ZzrGw0RiLh0Dkx7Qsq8+0sR7BXcPWhV5oojJ5OMdH93M6zAVqwqSrNhY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzqSpPmU78buSXBAQnWSKw7gonwq8DQaMbL7ZzSO5fMFLqHwt1
 RC9DnI6vZKmV3ZgJfTjr+JwjacGm3z2aU8VEfgO/GxzDu2j5vK0+xD+rueX6Mz8=
X-Gm-Gg: ASbGncvKYTVtxmpw28xkiYZCOArhvt3+BYXrn13pAg13wUt6mCjPYVjdJisrvlOvF7r
 7pI7Q+n5JBg8TXuw7xz/Uggf8CXCGu1FLE/KudCEBZpmz2QpyCTRkh6pf9lg/We+zEn4hNmljt+
 0P6OSQbzu2WTstyAGyysABu56NdEsBEIKfb40M0o2gMprd04pf60IfrUYoSsjGF3OV1NgThMjFO
 o65ztbBuEy4UYD6xgAliZ/AdcQm1761d0c8PX57+eKGAQOXdB/jcc74eRylQ1VU
X-Google-Smtp-Source: AGHT+IGsrhukEvweE+kATGZLKV7abTQp6BM2UyFHz+pdJV3ZnHx5w2xQCWTcZUPlJgEfT6lvq/IlrA==
X-Received: by 2002:a05:651c:2122:b0:300:1de5:59e3 with SMTP id
 38308e7fff4ca-30254521ed0mr38410041fa.2.1734337665329; 
 Mon, 16 Dec 2024 00:27:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:29 +0200
Subject: [PATCH 8/8] drm/msm/dpu: provide DSPP and correct LM config for SDM670
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-8-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=onC/sZOCceTmvl+85uTb+5rs4Fex+BwK8WACCKdIkwI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RstmAKkhUgDFSMOhulvZdpJWZcJyZTinijT
 6Z1u7es4gqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1aAOB/91xjMOv0FVK7azVd6PO2iTLH9oMN0HMJWRapBLHclS/S2HRw4THhS0ZTXl3SQWdRSKTzi
 wIF0W3NfZ7im9NKZR6BNny0YHjrC4g8ctYty0aFeoGiCyAKdHSzf3n0ws09fsYYKkpKTxpvF+pf
 +u1+U1KJN/2e8b3eUkzrdnVy1naigTtie8j7011s4SkhnbTbkF9QIn0ky4UqNxEaBzuCNuuLUVP
 xb+A22DDN96Y1ASkC+ta8ZI6TQR+qyUccvPAL4VKZOVLA8kHl1kNPqUNGLVncSzKoEvDeWa6mVG
 sOV3h9QmLI9X8KpCwJYjMA9uHtbm2rAZXondZBSxwraOMne/
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

On SDM670 the DPU has two DSPP blocks compared to 4 DSPP blocks on
SDM845. Currently SDM670 just reuses LMs and DSPPs from SDM845. Define
platform-specific configuration for those blocks.

Fixes: e140b7e496b7 ("drm/msm/dpu: Add hw revision 4.1 (SDM670)")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index cbbdaebe357ec4a82a3c3d950aa13792a1fb2d6e..daef07924886a529ee30349ae80375a324bbc245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -65,6 +65,54 @@ static const struct dpu_sspp_cfg sdm670_sspp[] = {
 	},
 };
 
+static const struct dpu_lm_cfg sdm670_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+};
+
+static const struct dpu_dspp_cfg sdm670_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
 static const struct dpu_dsc_cfg sdm670_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
@@ -88,8 +136,10 @@ const struct dpu_mdss_cfg dpu_sdm670_cfg = {
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm670_sspp),
 	.sspp = sdm670_sspp,
-	.mixer_count = ARRAY_SIZE(sdm845_lm),
-	.mixer = sdm845_lm,
+	.mixer_count = ARRAY_SIZE(sdm670_lm),
+	.mixer = sdm670_lm,
+	.dspp_count = ARRAY_SIZE(sdm670_dspp),
+	.dspp = sdm670_dspp,
 	.pingpong_count = ARRAY_SIZE(sdm845_pp),
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm670_dsc),

-- 
2.39.5

