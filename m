Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5370A7EE
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65510E188;
	Sat, 20 May 2023 12:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6258710E178
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:20:10 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f27977aed6so4678835e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585210; x=1687177210;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6Ip+CXVuP7IS2/mYQVsL3Ja3H2zQ181XB1GCMW1tFs8=;
 b=V2JG2a5J5x3ayG/iRny1Ow5v+YHDpYewZWpqNN/sDR1hWsJVBfSBDECP6YrUzAtqY0
 M5uHi1AfWgrb31dpuAXPMiqW20ruCogAeJVQgolKdgvYH0Kbe4VxuppmMgy39jJpzRjM
 0GSwk14yzn/dHchFdgxdiVcPi96YCzkqPkOLHAKoV/L2kv5RqV/AoJqXywW2klb1DC+H
 qysSxO7p1mZjRMk6ui2aJe/Nqv/UKvONqPdPmcxKbYVLJShbA4CRDPZlFtUzQQBBymst
 Mf5Zyut55ftnSRRTKpdq3hYbR3n+VZXbYcNLLTmVvjIrdPWX6v8TcyWlUytkSb5hax8Q
 uFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585210; x=1687177210;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Ip+CXVuP7IS2/mYQVsL3Ja3H2zQ181XB1GCMW1tFs8=;
 b=M4IP/DnF0JjXldQTGi5BDMaQM4oJrR7PgQ2RLcyARWXKE8BMiFj9BN+BiEI1t9vJDZ
 yThDjbjU8E8LIZpISWjYvPvQIY1WGeAqbKNClE6OoaqbLxvnzTmI9rbi7QWmt0OFV66S
 dONbAjtHfDqY4A/oVhzhr1HsPRSfnVF3JkUN9DlvD/xQik9AtFcW+eJAJthrIASF2rvm
 9joyvqe3t+7wYvHOzc1o7Bbjce3UVgrKwPylYoX61hQWbetN3kY1McZxLCfjupkdTrSd
 5Bb1TAKalutzJ/4PeaRI41kIyfV1OhXwbxZ+93yHBBmJcQBJcbOSgaemPsBOvxUV5iMs
 QCoA==
X-Gm-Message-State: AC+VfDwhJwDUGr0SbLo0uh99UsXAG3wrxyYmYwYZ1kZm7eYDSh6lh6o1
 IDZ78WQSNrCxq3RKTUUaDxQh9Q==
X-Google-Smtp-Source: ACHHUZ78AGukOnCv6sbkq8FMEQtyJedUdD62YCMUxF/2gDPO4GHSdSnirfO3CFGDkmvI4UacEB267w==
X-Received: by 2002:a19:7018:0:b0:4f1:3d7d:409e with SMTP id
 h24-20020a197018000000b004f13d7d409emr1775263lfc.0.1684585209892; 
 Sat, 20 May 2023 05:20:09 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:20:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:54 +0200
Subject: [PATCH v7 14/18] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-14-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=tiRhEnWKQorRchYKK0xFSXYxLCZIr0JF9605Ln4P3Mc=;
 b=6SwQwq/wcZwxW4yEQVOA5mZvDtrX7nHuyB/e5KLEInDWCrw81IDGPtjfjNDDBsSw+TJRba0C6
 RUXiL0DgPMoA1WRZnBdKZCN2CiNHUN9aJms2zOdcWl8HZoWUpEdm69G
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ca055bff23c8..9f296928c249 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1198,6 +1198,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1215,7 +1217,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

-- 
2.40.1

