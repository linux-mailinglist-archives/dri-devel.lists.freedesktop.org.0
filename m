Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2270A7EC
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8F010E189;
	Sat, 20 May 2023 12:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020A10E183
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:20:13 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2af1ae3a21fso31173481fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585211; x=1687177211;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T0/N3UhKyosOC5GIX6zF4duG0WOxNT9nlQC/xkc4q20=;
 b=hQ2hixELOV6pHTV9g8I73dQeO+6iBzNKFDq2hboJZvtE8dDkzeDWLXKRbwVWZjQ1oz
 kWiz+S2V+s8A486CTnSMSZryYix6SWBKVu5fhtslimtlxe0MeqKwwtzUNlEPfXWGAELG
 iurxOUS1yK/FB8HGeVooKAe52tsbSIWa1isrIGOYWKi3sAEinn+FIcExOsSqa57xcm0I
 6XtWIwyRc+zNsQ/znuIF+xoGE2LLPwOj1at75UhthmmFE4QMOaZR+RU71ftu9ZGgq8UP
 I08yf8q0rrFDA1k+06mm8xd5aiBvVN+IRyPEdRg7qUI6sqigzDbx+vRV6TZQQtl2jTOY
 0hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585211; x=1687177211;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T0/N3UhKyosOC5GIX6zF4duG0WOxNT9nlQC/xkc4q20=;
 b=Sn2OMTFTrSNRmwWubgOU3f/87aM0bAujCXajanSKpAegNjRrlMTo5mMWyWm5IMJAyH
 xPUZkStQii1V4I62Sbuty9b4FWEKveEe5GW07cSvGHLgSKbut3Tjz3FBA6ND8ZAJkqKY
 +RdGfhGC/Kndwk10S7dg9hi/fEpQS7nSjlP7I9ne+EiWaq+Hqq3LKGeqP0/DlM3jbphg
 zE2Wh2SBvdVLWtDh4bOTg5HYZ6QSCIztereMUC132+I3MgevygI4AWs/rm1WIWnWNuo5
 MZbuHTL1phjPk6SY2PQF0xLnE3ISM+sb8ydAncHcdCifnlkr2AVGS+6wTY4ZqVMui2kQ
 ESVA==
X-Gm-Message-State: AC+VfDyhAVHd1dskbjPdE0ZzwmPpmpBclvAXxnyJ1U7XCR7kiVTvN9nB
 eMOtDlgFBbVrZgzsQaA9lssKTg==
X-Google-Smtp-Source: ACHHUZ6epyhcKzUCAVYZ3n4xjPRSEnE1Ai3K5YzOW2ci78F25R6AVqSaB3T94wZzfOoB6qkhWxs0Dg==
X-Received: by 2002:ac2:5a47:0:b0:4ef:d3f3:c421 with SMTP id
 r7-20020ac25a47000000b004efd3f3c421mr2066083lfn.4.1684585211446; 
 Sat, 20 May 2023 05:20:11 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:20:11 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:55 +0200
Subject: [PATCH v7 15/18] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-15-ecc7aab83556@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uKjhc80Jm6KagI3RgryxQkGd8nbEDN7qDXqkFWwfuNY=;
 b=djhvgV5FSYZPoGpc+9gnMJCNWzKm+II36WSU9XC/UIk/xq8RC0p2wAU2mUwY3Vx5XrKFYGjOO
 GKXLFoER77JDkAHm+5jSu5979Rk1nQ1Q46NaBTJeOgNaL2fQyvr11HC
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

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9f296928c249..99bb3d16657a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2174,16 +2174,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {

-- 
2.40.1

