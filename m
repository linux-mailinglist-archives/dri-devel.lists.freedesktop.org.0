Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3AD9F2BC2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A8C10E405;
	Mon, 16 Dec 2024 08:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gimgf/s7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9235110E3E0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:30 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30167f4c1e3so41673031fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337649; x=1734942449; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p3QX07TGdBq1gHdO6oikHZ2FbBQpzQ564YrLte+zAm0=;
 b=Gimgf/s7+gNjS3oImRAAzxnEHmRffhvenWIxoNUvzDISt7tHoDvw64Nm2NcyG+4jqT
 MKYgROv27oMWsJJzzW+DquJv6p1n1iA6RrvGsyEwTRLy1rwDbGTtZe+xRPKhVIwb9/Z6
 jrIwvZOK5kJNsQPxEHUg0/IlZ/gEkwCb/+YvMJnJDTWybhXjipUeWqJ0B2uhpIEu5YTJ
 13gmIzH4TcSp7joEz+NNKYVj3HvO4ARbOUYezDwMsbkJJjkjiJZ+7ZEjnM4siALonWcM
 dlN+PeQF3Peakh9C0m41d4UasdslTkkMLvVrPZKKMfPZxr6WmcMTfJIPWJ1uKNZqDF1M
 LmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337649; x=1734942449;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p3QX07TGdBq1gHdO6oikHZ2FbBQpzQ564YrLte+zAm0=;
 b=PQ5pgerV5fuZWgv8Y3vB+9JFOqkWWlu3BQIDwjXN9CSFKiKDGvNaViUuTcswtInJ3N
 QrE4jOVQl+M+0W9sAMkmr/XJ4rRsFSAGL6wHgGtk0pVa4Og/Jug5xLlQCm6GBIqPZKjM
 HlfuBxiYrG9d/DplWYaDR/oVD6bRKB/BYGUp5pfUmSYkScG7+9mRBWzla8ahv+n1I5Cd
 cPCrpd7Q2FN0uWyRYhquduMXptgf9gAYt6U6NJQFdjqyCtPIe0z44KHGq1vqUWJhz4gd
 nFh6N0I+tAdDI6r6igoLOcTn5Nc7Xvv1+Ytm3aIhH+gfIOZkGWPAU03EiYD+XiLdeUGH
 5nUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuUlF9uX5M+RH1YkpwpXf0mpOjLYgbkoN1eie/PM0aTAL7QsNFh6b2n4jrvZCmM9ymU2Xd+rxYTwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI1YmVMd8AmHFCgk3MvlHkTT/TMy9b9EbwDGIy10yeArNj8suD
 IpxieLuscJjIdDhxJSHmORbbFD42P3VoAeQBVxixLx8pSklioKgRKmdlSEB4uaQ=
X-Gm-Gg: ASbGncutaUumNfcR+9qxJg4I3fIoX/ND6B1gVouDAaECbhkrDAdq5rXI+ffEKw5HcIX
 2Q6DG2AIoObQf8CxIr2QFMO/FkHPX+SNi9YmJ91VYEryUQX7VevO6ei+YFMuPdslDIJ7C3dV/rD
 eMuLoquWSpp+x2v6WHzfj4fLcSpytW/r5JJqlGOV9lFzYpSQCl5osb9i0fHhkjPqOaW7tRDVMPW
 iuGG4GA0LS/RTwUc4zO2UZvBpWuty59ZY1UhLgmruqDmwFD7l/W1L//+MbLXFje
X-Google-Smtp-Source: AGHT+IFx724whJM/3tgOtZRukuS/DQOvI/WHlmOjoQuMlO70R1sWXtGolZHOH0q3MJfJtAKMP/bH+g==
X-Received: by 2002:a2e:a5cb:0:b0:300:27fd:a7cd with SMTP id
 38308e7fff4ca-30254464080mr42374541fa.19.1734337648920; 
 Mon, 16 Dec 2024 00:27:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:22 +0200
Subject: [PATCH 1/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-1-15bf0807dba1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9MObEe5KzGyCABZYczA3jsFGPjAHvUO1PrGscQg+Yd8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3r8k2yTndeVZTf/++P01X49twj3domE3+FdLPFdf7jMA
 mwT2w52MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAin/PZ/7vnCGkdk3tiWteX
 uPGqhuc0xeKKy9IesoUVn0Mm7CgzL8sq6z97evsLbSbJF4vy+pc//sjQ6nIn8SfLnLu8zZx7HqS
 o2P521re/VyWyaVf6Lneno+eihGMbky0amdPPvfRbdWrifa6p5ZdK8hLX3+5/bxZx8LPhYf+g/F
 WRzxp7p9p8ElTbfDLqale0x0yVrnK+H/EpfW3p1uecuM8EdDW47T11Z9dfmX+O3J/nhXen5uXZL
 2zf3beke9mnMtVQBV2rJsnH9yfpzP0y7arzzeyqO6/+2XZW77+bcJgtW59RIYW1KjAh4vbkaLt7
 FXFPjlyX3VXFevWQSOcPhW9/HI86/HT4W3T0KsvPUzHJAA==
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..421afacb7248039abd9fb66bcb73b756ae0d640a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -164,6 +164,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -171,6 +172,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

