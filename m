Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4399C9F2BAC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5D710E0B7;
	Mon, 16 Dec 2024 08:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bNz6KW+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C79D10E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:20:41 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401ab97206so4005627e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337240; x=1734942040; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YbfXvKOjtQu6oW6OVlC1iMgsVrQx7zWveYPYCO9K2UI=;
 b=bNz6KW+wpr9T1X3bnKViF103EVgdcoxIxPkmgaqjkLerBWjKSgutyOJvq2U3IUmEjB
 CWsPmgBVH4UOq67DJPqTOMXNhR/UBnhDfVRevWbKac5cwQgawVKu9RqKIGlcelCANiam
 Yknk4w/237wrAKEyhqmrE9Ju5NaT3TIwZrvdFNDW59BIpBNuuz6/qFHoGJ4vM5DAxyhI
 OWz8Il46vZKsZXVjZIucFs22pnDjK23OjyKGB8MIjs2flSIstILjPf20sbN8ckPG22HC
 harpVDVbWD7FoYPTlhz2JnttY1KT4J6x7Q5qc2svNL6OK6OHTfgc5lgF9TJ3+tJDUNPe
 i2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337240; x=1734942040;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YbfXvKOjtQu6oW6OVlC1iMgsVrQx7zWveYPYCO9K2UI=;
 b=J652BR3POMNN2ds7AN2e1GwjIiibDlWogerEvWCN5sC8QOq+dHk7vskbdSGYX2Akjl
 sZUjoBNceiLL7Q5z3I1qr05DqhbTlCzP5RtF7WImf03DTYm+i+lqLKk8c4E6V5c0yxcH
 5IH+uTjGM/hN3KLIb0dGLY3W8FCH1eLDOALtYzkohBX04aKdyiPegaU6xdOmhy9leuW1
 QwpNXm7AAHqoEhRAq78AJE97qcCweOkrTd3MilwexNE+JnVROKNM4/zSIWugcMiZJqLf
 hzba6Ujr2T7gPdlpMNF8aHVfz12aGzv5tLV7fGvXojHb+lfnTJid0hD1DzuBkrUczF4i
 48Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ucC88Ie86LC284cWVT1sUJhHFBRgfJr8fLMMAzMQsxswSkg7pTq5eUsb3Gdk376lHZsvYlUwl60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8TWgVvVR+AszFUW+mDb4vImLyU00u+GW/zptvrBY4RVsGkBfZ
 6Vc9v3/qlKhETbgT5QlPTmr20fxGZWvWZV/CI/3SNDaPOaKJH9zXscoTrcIwpfs=
X-Gm-Gg: ASbGncunQiOVY/WoHeM2TZzpZTn8QqdyvEahEge2PSVgeJwkYnt45DhTq44rPkiA4WY
 CObS8Xkao6nCUQAN3cdj2xIsVtKMe9QRQH9yKzkNjbSe/wxAb9ws7eHanJo3FvjRACjdJlMZ1Te
 aNxepj2oDg0+y471V+NIcKbyY8elcuTJtVV+FMOz2KGwto+BEBwb6LezOU2RAvl3seVMoiIRWYU
 jVwRQb7LoTHYXgrIchdcTEAiDA1QlZJ8O51vpptzY3YDYIdPMCS3h90DAgl5qu5
X-Google-Smtp-Source: AGHT+IGzenR2jl87nMf97W1enF+uDtS5ypA2j8yTcUnPoV9iEHOCI2uxIt76PAu02Tox+YY54Iz5kg==
X-Received: by 2002:a05:6512:3dac:b0:53e:39f0:4bbd with SMTP id
 2adb3069b0e04-5409054e4a5mr2594490e87.21.1734337239738; 
 Mon, 16 Dec 2024 00:20:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c137e5sm754516e87.184.2024.12.16.00.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:20:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:20:36 +0200
Subject: [PATCH] drm/msm/dpu: correct LM pairing for SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org>
X-B4-Tracking: v=1; b=H4sIANPiX2cC/x2MywqAIBAAf0X23IJr734lOkSutYcslCKQ/j3pO
 AwzCSIH4QiDShD4liiHz0CFgmWb/cooNjMYbSoy1KA9L3TyYNwbqjVS63Rb9q5zrCFHZ+Bs/+E
 4ve8H2Rd72WAAAAA=
X-Change-ID: 20241216-dpu-fix-sm6150-17f0739f8fe0
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uUJA3/TZsxZSLGQ3iJa9Q98/lgULeCMhq5QBKWADGSU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+LV2CEVo6lAAyY1ot+m4rawCBEiNbmKI0V0H
 +juU3EvY9iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/i1QAKCRCLPIo+Aiko
 1ZGXB/9aO6ZYG+gIxJb5oe7hQ1dXAs82EbfevXvtGTdQVCnxun+PDjw8B1Aui2HOARJcXI++Tvs
 Mrb4cmy3DvJu36eTg8diFOjJAOMa7gEfLZe3RsMsilSkGjVti/XpkQ83zgspXFA0kDwHaIMSppa
 qulF6sCTzWjzG3V75X/ezks+tZjzi2xF1QiGJ1WHFdsohZYOZEaG89/SoORUguCDm0gHKWT8l8j
 Oek+oRlCB/h4b23/7VnSw2zWwZ0lY/5mT830UlmwNbtHQTtPoqiz5k9Ykda4M5rFRX1wWnBlWzR
 j3YvhI65dGIlbxHx83z/SV1ncEyeME5+srWX5L1yhgODf1rB
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

According to the vendor devicetree on SM6150 LM_0 is paired with LM_2
rather than LM_1. Correct pairing indices.

Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 621a2140f675fa28b3a7fcd8573e59b306cd6832..81eb274cc7000a3b70b0f6650088ddcd24648eab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -116,20 +116,20 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
-		.lm_pair = LM_1,
+		.lm_pair = LM_2,
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
 		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
-		.lm_pair = LM_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
 		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_2,
+		.lm_pair = LM_0,
 	},
 };
 

---
base-commit: a3d570eace66b4016f2692a6f1045742ee70c6b1
change-id: 20241216-dpu-fix-sm6150-17f0739f8fe0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

