Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102D6A0800
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BF110EB5C;
	Thu, 23 Feb 2023 12:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE0810EB4C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h9so10498557ljq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2SpxHoGUShGB+o0R51zX1h3RUDAwPHpUo8NWuduSFvs=;
 b=CW7Zdf9o3xrK/6ELRsSFvOeXYvGWeCWQUMKUIDEzLj0zJDMC0kZ4Sf+eu+ByhkMTcl
 Es1Q3UTCbueqYr7YOPW1jJHCExdQH+AiXelzjich8/Sdyoag3yS2hAYwdtikL5ZTu7TZ
 GFPAzxjiQa/Ro5lOGHYXCjSbzVUf8JInS2E1uY19uOEVGPeCDAWWTL8BpR6RCr2cXBdN
 tBmH4ZQv3nFju+1g1nLNU8vwunWMSeNAot98NwpTUX8cmpInhOQvpPZiwv2bkk2U4iSJ
 m0wHHMmAbpJ6a+X8bN+fnAqPe1eCTnaTAuydlFLgELu0s9JjugPB9lwPzSmjPq6dfCWR
 Se4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2SpxHoGUShGB+o0R51zX1h3RUDAwPHpUo8NWuduSFvs=;
 b=SEKMyAbFxI8XzqN/zUxTRAl5sABGJD0G79A4HTEnXh60NzO/pMmW+OG4z14zBdBhSZ
 UgtRcXE5+YsBvIDy2pFS8yEHm0vzDL1uyMJsUM6upi8uMiTv3qxm0IqlIurzLKFBqT5r
 zR+apK+kCFoMqYiQS319JtFGB/HL91n9X+Gg9wCwziJGQqwm6G08axopfiNCCadoK9FF
 EGzpQ15oZsiy5bLtogRee4jQ3Q1+xU7XwHt+UpxOTIitZWS9BhRERZc7jKo1QgeP0w1Y
 CHLpHyo2NgHVECDjaQQC47Y/pM3rOHbB+LAuscw4/+U1aJY9fUCBI3sG32YRj6yfTIBT
 ZdIg==
X-Gm-Message-State: AO0yUKW5rPLnK6SBwcONLPl8DTF42sJCjhcwTmmt1weJLh7cLws5O0Xu
 Dkg0IlTQupxRS89GZkuYjg1+Qw==
X-Google-Smtp-Source: AK7set/JpG09m8v5w6PbHb6UX+etFa7tyJdg/7j183gkfOzET7sdSYidOdMaYu2BevHmxzYmdnvd7g==
X-Received: by 2002:a05:651c:1548:b0:294:6ef3:f53d with SMTP id
 y8-20020a05651c154800b002946ef3f53dmr6137826ljp.23.1677154009124; 
 Thu, 23 Feb 2023 04:06:49 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:37 +0100
Subject: [PATCH v3 03/15] drm/msm/a6xx: Remove static keyword from sptprac
 en/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-3-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ckva7phaYizBiCARarCiXDqf5CCsJebA/ji3HmmQc6g=;
 b=l/shpHg0ffSlNRZs2INQLoUVacJRFfYkF+Cy0e+TxZ1egkncjMzHjycDzxCx+q1+9tccT2zVosvB
 bS8CU6WmA47RpIYvEnMLEb0EPdGByaiQb71p/qQ9pLoAf9bdQsDj
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
index f3c9600221d4..90e636dcdd5b 100644
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
index e034935b3986..ec28abdd327b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -186,5 +186,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.39.2

