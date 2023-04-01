Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1587F6D3061
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 13:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820C010E267;
	Sat,  1 Apr 2023 11:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA7E10E24B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 11:55:02 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id k37so32285268lfv.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350100;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TbK2MVc1rKgyfPXfQElwY/6uPFFij3UrjXWyfn1dhPY=;
 b=fjL75dISZSV4H+8N12RUuLPgkvtiebKr+6ASoAkWxwfNiElc7/ojpiwwM3yQ/36c3I
 vWOXBYewl/m36ml0HT2/EnizqK63B9YCoSQR3Kavg8o42p7YH/4eRrbrgz91hpA6uuUk
 HYesEBGnCLJbbBdCmh9RDfmpPYX7LdT0dEH7vJdDF8brce3qbgqiClPB1Ld2JlKYNVsB
 GCBaziPE/grDFbX/NVENrq3jFeW6tqRDdlOkW0SGUiB3oVuMWVIcG4thFbLKAP6Sr7mh
 3QiAlOsUfwAv06pIxXMAgIz+lnbnd+KQ6gVDFzqSJaWl5wpvDSzBZTUGDf65sbOlEOYh
 7+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350100;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TbK2MVc1rKgyfPXfQElwY/6uPFFij3UrjXWyfn1dhPY=;
 b=HsvqAwkRBLziMjHEVsbiUPli5H+JwEAKhBHo1LGqGSwPf4dJmYtjPTQrBRRjxG+OKB
 P5KuWkpNQvoizYW+DXjMXCoooaaB/2YYeoOxgJatUS0oTnbChRWQiH9dumJTl+phYCEj
 SdYIm6xsvwGi9Y+Qn8PBDK5RzrquMVfAsxS4J09EE+z6ftE+baAPQH4Y3fIxPvzbJXQs
 eNwQMDqcPGU0jkO9o9iAhsIBK8tDrP46WU27eJDHNqFR0HQmOur7Fhm5PAsCgVYGc4p/
 3YeNHfU/bFnbVHJDSW2QMWDu/YMK8XLMi02SVXo0aHobi3RqNL6ewgglKvHrd2FaKo0+
 7fag==
X-Gm-Message-State: AAQBX9cmx2Y/igF8MUWY2whQPqXnCXfYjZ4V+7C6whB6OH25hGB5J/lo
 +j0sL3NBNAEj1sZ/hVyDR0wgRg==
X-Google-Smtp-Source: AKy350ZikYFxTM1MU3eUgc0PKcoDOOnyTT4LYLXu9S8Wq3YzPlUdOjbCAo75MJyxQB8wUCG3Wxdftw==
X-Received: by 2002:a19:5510:0:b0:4ea:f9d4:93a0 with SMTP id
 n16-20020a195510000000b004eaf9d493a0mr5593306lfe.34.1680350100305; 
 Sat, 01 Apr 2023 04:55:00 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:55:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:41 +0200
Subject: [PATCH v6 04/15] drm/msm/a6xx: Remove static keyword from sptprac
 en/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-4-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WpExda3PhDQwvsN/3DDBnvG0Z5wUKLMO4vx8OFJgLF8=;
 b=75IfQDAr9WDnfiDmZMmGzjEjaJNUGRJAMt23AHzSA5NWTjC9aPCa0S1vDW95VzrXJKrvjMNy/KHm
 ZelYSLzJDnopySv+ciDpRcmx/KPYBt9AILvfACq9ERo1s71ICFme
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

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..87babbb2a19f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..7ee5b606bc47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.40.0

