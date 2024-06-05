Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBD28FD729
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 22:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBE810E809;
	Wed,  5 Jun 2024 20:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x8mIs6Pj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0888610E809
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 20:10:30 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2eaac465915so2436131fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717618229; x=1718223029; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rsxI5OJmE2RBtxZTRf/cc3jqaLSF49oqnXau0+l27fM=;
 b=x8mIs6Pjf+NJa3HEBbsizxX50dvsagWChX8jcD+AtyXJZw1jBCYvSmf9HbJscE8okc
 1B6V0J+WCtyQMp1t8qNnx1UKHV47n7pEfw5DUaNAfkoKVuDR7UuCwaxHbiY5hiwbs3gp
 12wcchBRQdFzgzS9vBwAAg/LTAUXr+/FlrKkFpahncILdhscB8jPgp5FTDr28JDwOeSN
 nMfwYciIV5iFR/Lknqr3+AgfW1llfgPp7ZX1hr2fS/PMMTplYgql5YlFt2BQ0zu9h+ZX
 xCSnaseHMq4AZdNVTT0XQg2bg3oJ6j0L/nsbDko/rMni8OT6AIRhq4oELdFAvrBcBvXR
 Wx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717618229; x=1718223029;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rsxI5OJmE2RBtxZTRf/cc3jqaLSF49oqnXau0+l27fM=;
 b=wmhQDG+OQZ4dt3eQh4alaMHbixAlQWGuuIBZTMetYB9IEdyjR/4t62LaPrKT14EqVR
 CzcI+CfRvNWwilmYs8kcz/Wal/GQlTsDDkcxLYvWEhN01aHM3zdc/xG9XdqnYhYPwy3y
 4bJOmA4A04HZvx3sv7bIAplJyIQbm93wr1lQneeaSo74na7i0YHeJ5ZB0AH/I0z0Z75W
 WT+07OlGokUcUqSkvKrCrHlvF9YGX0nLRstKfJhAMwm0M85gKJxX3m/DfGkOuPz+s1dL
 wGipxsbaTzJssGDReTZFmKt3b0aFG9Px7lbnOQCbFk/e9krIlKBUlnbM+ua6vv7t/BKu
 jx9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOXVM5Soy2ZmB6DgaMUapcLZtNAMnCaVoXgaVpZ+0gxpZZyP+c1G3DW0axSmmbJj72UVLTDYFKagZWd2nWk+Nxfj9Aa7v7Gj7RJvYZiNmx
X-Gm-Message-State: AOJu0YyV2uxc9jEnWqKHBBns07NOf6DDcr3mb5PgxujUjj4m3IKSNhO/
 YMEUC02/860qW4CEF3k4hCaG5UaT2lKy0wM5yqBpujZNg1M1qhwrZ88lOP/DV9Q=
X-Google-Smtp-Source: AGHT+IHZPDBP/2G+iM8crT7CqzDpqiOTqjkerYD9t+xoHL3b/RsYHVFEDdIehn61CCgVDhqj+ckVNw==
X-Received: by 2002:a05:651c:b2a:b0:2ea:d142:d2b2 with SMTP id
 38308e7fff4ca-2ead142d3d6mr1982801fa.34.1717618229093; 
 Wed, 05 Jun 2024 13:10:29 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 13:10:28 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:17 +0200
Subject: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 / A740
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-smem_speedbin-v2-4-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev
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

Add speebin data for A740, as found on SM8550 and derivative SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 901ef767e491..e00eef8099ae 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -570,6 +570,10 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.43.0

