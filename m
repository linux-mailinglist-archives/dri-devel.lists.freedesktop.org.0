Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7E9F18A3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A8410F114;
	Fri, 13 Dec 2024 22:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LlxqZ1Mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC98010F115
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:51 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30033e07ef3so23897391fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128150; x=1734732950; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zjj/qqDvDuLYCA3Fq80qpptmIsu9a2DEDY78ew7Wi+0=;
 b=LlxqZ1Mce7YpMlrXZEpgI8hfSufGubEaitwbacfZXoiNBupuMqPWlA1hiQTsCeUhxJ
 K4TzbGzbKJ5uLjxvbwC+eW9I9JZ5oQgZKBANuUclIt2TCgAkWqY4+wf0ngj6votwwmu6
 /PD4mz6uPQMtSGVb4sQHgJsMxmhVGlE/qDFqHCpdJWT31H8KR7n6NAwuL2elD9e8znnj
 4oZUGj5IejSI/3jTUvHB9fbIAltasBW3UsoIzks2jQ2/UMiK+5xgCzH43V90o5cpkzag
 20W0QcnJ00LuGLAFxQLyoplH/qoEedyKarM3vKHsOmIJcHmbtTcHXjo+IgNvzhCSlF9M
 nL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128150; x=1734732950;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zjj/qqDvDuLYCA3Fq80qpptmIsu9a2DEDY78ew7Wi+0=;
 b=lWYCAxcB5uyELeHrP/BgVXXgUo/TlegzQcMdpdORSi1rfTE6yN3TZD0ssAW0+Q75kE
 bi/brGF1h3c7f4650XtgjQYqAw014FbpumJBEd796jHoM1GvVH6NFL12iGDhYkq94k9O
 dmmhJNKxRSLbzsggjm8rxPH/97wVwEfXKkI56iq0jLXDwSqy4eRQqFQoWOd4W689nPxf
 Z0izWJh973BUAUWqP9t1KR8UdV0hSnkzwtBwkbR8LFWWjg1rmzpYU37/fva7fs0KKhyH
 Ryn5F4k4E6O5xplALXXKQL7xTiqjtPuyUaKZ0VF2rsD7kjQfPzDPNom/MuAx4qeMuKLW
 uaMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsJM0fVtEIK1U4xGIRwLEn7FIm8++g5iwjrh4mCKzzaIzV/OZ8IuP91+R942fLw0dQ38gzSwmdegI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzexDto4wyuMlzAD3fEkBmoOR+dLl6OVwClAOGpbBoBpVipYu+1
 gdfHkXBzIwmkxOjH5oqlXpGuECJ5ta9RByVzLzMiGwl6nlvozaAdxCFASw6DSWxts7lVYcJYt1M
 erJT0jg==
X-Gm-Gg: ASbGncv4EhQnmmIlXc68wGDTNz/xnGLFF4VeaIFm4tC+trIu4sUp7pEc3ra59BEfqCZ
 EfaeRRjly0xup1VY7VXWq7rhOb9eXVzp828pi+Exh++sErzlloHKr50UlDinZfODAiuBpPZAog3
 +hnLVQlFsAIWSkf6wjy5joyrZf+dD3CpFd4hrXK2ado0aQ9Ofa9cxw3HTLCTku+dGD88tB23DIU
 L5wy6lcQPm0X3NcCD934jyDqdOYevipaiNpIfxgKQo6GD4yqLu7igzRMzKhPv5E
X-Google-Smtp-Source: AGHT+IHA7pDunTcxXBJapEzkZ/aH1UE6qzy/Xgi2oSyghqhyMHSPPfI86KhgbU7KmaEsbX/hwpbPWQ==
X-Received: by 2002:a2e:bc15:0:b0:302:23bd:354b with SMTP id
 38308e7fff4ca-30251be6dd4mr20625131fa.1.1734128150020; 
 Fri, 13 Dec 2024 14:15:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:48 +0200
Subject: [PATCH 32/35] drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-32-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=33676;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=piY9WyeflZLOt0Y//1cXsPE7Ro1F1QD4lCE/W06Wv08=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHJhDe/2Iz7VopTEeH+yqca5n6AR8bb6pt4Q
 7Z1hjpkzDGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyQAKCRCLPIo+Aiko
 1eYyB/9fg8D7VgeFZJpnoYxJc+6qmbDgUru0grEQwAVEPeXHLJtmbTjCtJheAfPdCQog12YsYKM
 oAl+UeleEOByi7TL+2x/hvk8EwzWhDofR0obhrmlV3IABcj+MUbK+WORrgqsH/unpS3oFnEkBKw
 w0wRyYPJHqVXPSae4ox7czEZzF3RnL2xjCk/P4kklLxKC79SD59atyNskRWa9AiiIb24lsFS5Pj
 M3H4kObSz/KmKYsfDg5OoxpXbKihvsrB7OUjKf5+V0jci0OVtDDdMjuzs/0JA1B3ofeOLnReBYd
 uE2AsMayLxhoRxQpZ5YqBcp64cAXwltCEYxdBeitp2JzDVKk
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

Continue cleanup of the feature flags and replace the last remaining LM
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               |  3 +--
 22 files changed, 92 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 8eb08eac0a795ff1bb98b361f3c2cde0aec943fa..612926b4ba9b311becd642f42f303507f7f3cee0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,28 +151,28 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 93d1d64fca3c8a68493109c954896b0fdf2b4ff3..fe59136dccff31f0e8f82a0ce2d904148474a423 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg msm8996_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg msm8996_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -162,14 +162,14 @@ static const struct dpu_lm_cfg msm8996_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 915c4facecb2220fe73a1b44cc60ab30b56780c2..3d9d4c13200da0708fd2ea86761b824ae0ab19f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,14 +151,14 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 78482b42c5f790a84587a330ed7eb160c3a2d06d..e4981bba80615603a0b96eb095a2ff69358ae115 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -106,7 +106,7 @@ static const struct dpu_lm_cfg sdm660_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -114,7 +114,7 @@ static const struct dpu_lm_cfg sdm660_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -122,14 +122,14 @@ static const struct dpu_lm_cfg sdm660_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 20efb6313a4b98ec835865535dfb67de422168bf..2b2628fcfaa30ffa76e20e1affbb4a7ca4bede4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -97,14 +97,14 @@ static const struct dpu_lm_cfg sdm630_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.pingpong = PINGPONG_2,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 8b050366e9209fb6761e9da65f0fc2e764abd996..ad13471da10a0a1390d766f14a472a28a2d74cb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -133,7 +133,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -141,7 +141,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -149,7 +149,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
@@ -157,7 +157,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index b7c23f3b90af27bd7fc1993e6448497cb4d38ab9..5d192e86d905d749fdfde3b58cc55d812fa08777 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -139,7 +139,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -147,7 +147,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -155,28 +155,28 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 1b24fd09946eb9cf457c61a2af8405258e685d00..276130a1a09e5972581745c87e630778e738508b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -154,28 +154,28 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 6ff3d80fd6c78510ab1562017d2404bcb955bde3..cc702fc4abf76024662b73fbdf0c3c714ce0a50e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -111,7 +111,7 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -119,7 +119,7 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -127,14 +127,14 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 02d071cea9ff98abb3cf976f53c0a5ef6fe58292..7079b43aada52f72a7e898e5af2946fc679878f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -154,28 +154,28 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 18c7b5ff27b6314a81437cb3ba186257e264935d..887cabee0b0ff3ef652e65642a78c3c162e06f97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -84,7 +84,7 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -92,7 +92,7 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 8b4b21842c234d586fa2ecffbaa0b00aa8ac253e..71a41b1cd869edad1ebd80e64711b2221d93acb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -91,7 +91,7 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -99,7 +99,7 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 86143f0ac3e7ef7966dcf532dd4989683e0684e5..60c8dbec43f36e269297e90f88ecfdc6e1fbbe4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -154,28 +154,28 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 82c0d42d5ece7e23d1c5fe9e1d433f8ee6abd284..f8713b41c18aa638bb9bcbf66f3d0bfe2a279e1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -88,21 +88,21 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 42f0f7240f4ae845259c748feaa5b7f924c54abf..543e346ed6072693812fb3d12bc981327c3e621d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -137,7 +137,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -145,7 +145,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -153,7 +153,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -161,7 +161,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -169,14 +169,14 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index cd97804938f83f7c7a814fc80a0efee863052202..aa5894a32b3acd7d9a088d502c0cd5cca8db4e36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -162,7 +162,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -170,14 +170,14 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4c6b749a3b33468fc5cf2e4c46e95ac17bf06b3e..1411239e29ad9ce84060ed9244b3c3c11182a039 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -137,7 +137,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -145,7 +145,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -153,7 +153,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -161,7 +161,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -169,14 +169,14 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f029032197c5db302237bc90496ecf4bed643bdf..cc99a9be988f703e299ebbfda1e299d9782d833e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,28 +151,28 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 211bac893e188d0f5c5a181c68a3ebbdbd027ed4..4f4583c6376b8c7e361bc0b89a9461e8e42dc65d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -134,7 +134,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -142,7 +142,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -150,28 +150,28 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 77187b6f5caa8c69498502d7b7e9c06b8d01fcb6..ddc8778313348f60a7a6808f00d0b7f1b3319580 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -86,12 +86,6 @@
 	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_CDP) |\
 	 BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_SCALER_RGB))
 
-#define MIXER_MSM8998_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT))
-
-#define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT))
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3267a145d8927c458545668607bfc1d82a6b028c..06c447e5ae8f0c5a08b1d293488c4b1e4c075ab2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -64,16 +64,6 @@ enum {
 	DPU_SSPP_MAX
 };
 
-/*
- * MIXER sub-blocks/features
- * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_MAX             maximum value
- */
-enum {
-	DPU_MIXER_SOURCESPLIT = 0x1,
-	DPU_MIXER_MAX,
-};
-
 /**
  * DSPP sub-blocks
  * @DPU_DSPP_PCC             Panel color correction block
@@ -423,6 +413,7 @@ struct dpu_sspp_cfg {
  * @sblk:              LM Sub-blocks information
  * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
  * @lm_pair:           ID of LM that can be controlled by same CTL
+ * @sourcesplit		Layer mixer supports source-split configuration
  */
 struct dpu_lm_cfg {
 	DPU_HW_BLK_INFO;
@@ -430,6 +421,7 @@ struct dpu_lm_cfg {
 	u32 pingpong;
 	u32 dspp;
 	unsigned long lm_pair;
+	unsigned long sourcesplit : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 965c896fba2e1f06e5e36fcdf76d656dc8877d17..0021df38f8662683771abb2cef7794c3209e9413 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -491,8 +491,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	if (stages < 0)
 		return;
 
-	if (test_bit(DPU_MIXER_SOURCESPLIT,
-		&ctx->mixer_hw_caps->features))
+	if (ctx->mixer_hw_caps->sourcesplit)
 		pipes_per_stage = PIPES_PER_STAGE;
 	else
 		pipes_per_stage = 1;

-- 
2.39.5

