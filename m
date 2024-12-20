Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301F9F8974
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AD210EE2B;
	Fri, 20 Dec 2024 01:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xF4PVlgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5693410EE2B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:44 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso17280181fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658123; x=1735262923; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r8niegYZnY9morgL7MxhpeF/UQMeeTk6uKDQF2VfVac=;
 b=xF4PVlgk2JmnA3vCNUid1ovUmvbRPp5gdGi6pCrbPMfv0x3VQYgPenpXt5I69m1Iw3
 98X5yFq5fUbZ5lwMi9Vnaq83tOXpGV1J2uRQv/GObh+Y/uA20+M4Z0Diy2MAvW1rwtD8
 9qtCGSrLtCN+KbbH8up+KqYyHUYSe+50aUYeIBF2t1rkX8JlOcz/iExyZyb6f4xk4Bh2
 r1CWYBTImwYDmiDdsnxnrVov0ot+uxCrw9TTZ74iN7OGsf7gti1kM3V7LDZOrz9gXuvE
 Od+cCnh4+cGtgtq3oN7AhuKhO4aL7Iqt0GvwciRS9Ri5ukNSTvXCdDJu+MRYiwCcCylz
 vAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658123; x=1735262923;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8niegYZnY9morgL7MxhpeF/UQMeeTk6uKDQF2VfVac=;
 b=QhWcrr1BpjqkxndPn/zQ0raCVLqYe3+DrWdx1LiLcjHJHYi8eDoX0Aa1BeZ0uNf/qy
 HCRZQO0Bs07zjMpzTY0csm30u/FOZrXP4GKi77HQpHFUndiDR2MUSSNWxYNPh+sg8bjW
 gr5Tk5wSB2Xmdf/KoSY63tLZ50DA7nA1w53Awq5YorHTOVrseAiOFqlviG7qGY/5ahP7
 RkM1uIFPrJzEkwrOSj7/JE24Jv+BkmcMxZvKWu1dWZ1Ecksa9+d3LAoVvSfra77jdq+T
 ZdEY1JhwRLqnwzySY6fyu09naKLl+C9VKe/Pppcz14JR9HeaDstRLTn/7nXmvTYy55ma
 odYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrYnw4jJmAT2TulhAQhoSrai6JEQsDhcn4sIX0yOrcMKESHw1z7hsvitCYNw8PimTadAMg4dWIHVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxj17U04aWIPzMf5haWk4mmuYK+t0z2Z7OCZ9DxILDHq3ZGddh
 3+HeahMbPbOLYzAHUJeiX/vJ939Rj31+jT4sNeef7t5VlF/lp4hHRGxes2zjX2s=
X-Gm-Gg: ASbGncsikMGsMGJoqVVe7DS3il9g05xdycZo8Rnu40gvfs6pmlQcO4FTQcruOO6XeZS
 R2aPIXLvKpuGkM7Q9nPFwo/xhURrjuq3/KhvAEjQujD5VARt94bckWUneNCQt1e2fxEYEEfMWRy
 GWv5dVW66Ti58lkIDwLXhTTVbcWSB3/39Obt8+KdKYW/RfjozB4T2xMwafMMCbywUBoc00xnMq1
 f4zlVLs1VbzPi5W45NuclQPt+G1XIW3qv5K82wMpttpCDV46nNMonnQJ8r9it0K
X-Google-Smtp-Source: AGHT+IF5Nq2wfvPB92CZMzX3Vkpwjzw8xyQ2wYN5LaM5HZlw7C5cwQ3Tpe29jJapNts5wwecQpNCpg==
X-Received: by 2002:a05:6512:3b99:b0:540:cc4e:6e20 with SMTP id
 2adb3069b0e04-5422958245cmr173527e87.42.1734658122638; 
 Thu, 19 Dec 2024 17:28:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:33 +0200
Subject: [PATCH v2 5/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-5-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=i4FVDn+/rOcn2C84yQSmmpsO3jO494mbVjBwMlV07+c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+fZYsheFVecn80/JQlhFbjlEtvUNOb5WRv
 Y2n8WFMVhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1YoMB/4yMWZzpGpG+2PXtT/HTOXM6tBCGMchJ/4CkZavOgbJxQHJkQjxk8vw1CVxJ5U/s20ffmj
 MOkyl9JUAElhkUXb8wt0aqM5r476DzWlXwcCtKsUEvmbZHYzZLGSqYFsk/SaYfXxk5bL/31ZGVZ
 1hTNDmw4hhs4xYpQ87HvCnTrfTbV1T7GaiFXm8fuhaH7M3AM0Z/3/74R5IjdkpTCEbtQui/nNhG
 6vG1agZoeNsl9f02sHLpTgq7EAz3qKipD4X7ddvTwcst7oLxo/vI/KxU35F+pjyn3Hy4pW+vrD5
 Cz0wSqb+t+w5LIESymNJ4Ij5C6mTZdDbJhcZcaBL6+JDg45f
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index aced16e350daa1bf5d24078b2468b5095a40ce07..f7c08e89c882038aa658955ca1202bda3d928e80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

