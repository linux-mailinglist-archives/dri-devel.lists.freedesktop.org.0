Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436299F897B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D8D10EE32;
	Fri, 20 Dec 2024 01:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="udTQFYzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B58B10EE26
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:49 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3003943288bso14470701fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658127; x=1735262927; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iGem3bHUSgcY0xYR5Szm4SGhekE0/o689Nmwl8dsbT4=;
 b=udTQFYzdoSFKasZi6zasjTiJZmVfkglbpszrSeDyryJVTAI31pDsfdiMljHl555SGg
 SSZd5JMXQtgWw2PtLDaPSh0/qe2bSCsQYH5I7v/B9EXBqiirHVHGzT/oYFP5LFjcxgHy
 +O6Q4oQ7OIIfnR9vmyTaxGDbPULh8MiF5br8Ohj3arvcq98ZzwH5zfh3QKJMiWtxkJGY
 N1x6S+Fv+kMRV0HJpXf5Hp7IdnNfPXA64C8eqS7FUj8cWQ5XXGzoyE/2IoktP6hVqAg9
 FvL3cOrSaAkRfSnZnFFkHWAUQDQWWNiZ4IXBdRrgxVJBxN9WrQ0aNXLzPQr48IJPRcdB
 mJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658127; x=1735262927;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iGem3bHUSgcY0xYR5Szm4SGhekE0/o689Nmwl8dsbT4=;
 b=iOPG3MefPUEDio3DqK6do0O2dfj/9TUwTjXfS1g6X6PcrLczIkWWb67x1jzHCjfZxz
 sKELz0O0tTWDjEqoWvqzQf6nEazitXzNI8dTW+GE/JFN00rAFB+CXgtvXB6QAAy/MSjD
 5wWcIXdsvuVH0vPRm84bBIZQqK2RTPdLld+6Xv2negyl+zv2iO3uQvGg3d42x2iM8J3I
 Iu5hpocsI1FDnMQITkiUGncBYfNERWa5vtwG+KQuu0mQISs65U+R94OTRLUjxzF2jqUx
 i8TltCTyJ1Mh1L764edhib/MgV2q5TBy0ibYLGAltOxfF/9Ir4eiI6/joZsr+xxAk92C
 iV7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXChGp0CmMe0kTRedzwmczYm7BuL5UO5aw1oIoZPiUcSdUGISe+twsmFBpHxY5MuZ5+tdscdksXtmI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0pj35gweIfZJZUXhSbZejmuBGEyRucZaPn65eVRgjO9lAE6eB
 UB+LsOe4FQUmvIvFIBM3nGOfbkwEt2ltCCUD+AY7we4zgRSP947oSBo07zvy1lg=
X-Gm-Gg: ASbGnctcHKOjY2uo3ANTOQ/BwMWl2UELqoWHiqgbDuOvSSSSwkF2h2GdKSs1RHvMzKh
 9o5bHlEOBbh7oIlx4XxLV10o+4szKglueKMMRvB8zXuIce8gmz/8MEorqw7D0muytY37unLDzl1
 qSYWi/wzneHZEuKEa6W3VxlQY3tV+0IoAYcR2vH8Y1REqGspgMDysY5HUNQkfVFS74LlYUT+2kg
 nfrwqpsy1KOcgN2+auX+Lm509PY9dR4zzpOpVwsYnzWHVPYWaJ8jjhKxhbdgUe+
X-Google-Smtp-Source: AGHT+IFlLa1rzI9ywvTJgP+UZWS6o2QRUDkLVRX0vF55rzdqfZOrzFhtlmkOZ3P7H/6LEWkwS0b3DA==
X-Received: by 2002:a05:6512:2346:b0:542:1b8f:a922 with SMTP id
 2adb3069b0e04-5422953332fmr191927e87.13.1734658127556; 
 Thu, 19 Dec 2024 17:28:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:35 +0200
Subject: [PATCH v2 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-7-38fa961ea992@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=X7FvetBkuSIFwQPFNTIHnsnsMQMhXRkzYapuXItW/ig=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg/v9DmM5T2yxcq/g6fD7SJF08okGiWvXljD
 A+sHsPo32aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPwAKCRCLPIo+Aiko
 1YdiB/9rgVTCRMCi/eCKZkC3QRKJkXBrXzrFD1gJRnAnmiBIJw3rs/CqcZNs+y9qE8Rs3HErKQD
 1GRF18FqRlktpoMn/wWx0XVfvcqvF1/JOwIaufOYW/gHeDqX9bcljy+lV5BEETGiHPHlKLUSeeF
 lfPMYDBMKMh6fg2aMIeLOcPkBrvtuLrves2QMTCj3MzOi96WM0CFNWRijeJkeMEA21Piev+6WNP
 ru5ILrSjJlfyDl0PHKOOum6RS7vclvX/USM04KP03T+jQpOucULYy0PesTYVXGuxlHwqgKOwkdk
 q9c5a6ORSLriEroIZi3LtZE3dEhGouXRoh/oPAMTx9tic1Ex
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

Fixes: b94747f7d8c7 ("drm/msm/dpu: add support for SM8650 DPU")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f48d793f9d83aafed592d0947f04b..e187e7b1cef1677261a5de7b01ea3fa8136723ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -160,6 +160,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
@@ -167,6 +168,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,

-- 
2.39.5

