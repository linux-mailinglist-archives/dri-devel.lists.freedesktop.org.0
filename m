Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40336774C0D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 23:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E410E210;
	Tue,  8 Aug 2023 21:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBEF10E209
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 21:02:55 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9cbaee7a9so99430281fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528573; x=1692133373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eeeLPCy6qfu7VzyO6TB+4obhTO937OTJDmGqSEAL/C0=;
 b=eRcfceqdGyPWbfW1IJ46N3yGau4WsQ2IRDMKSpvhwjcuY1kR0EXgSKZpXQ3cPEYebb
 u8qMEteJ4St0tBsKjVoNTAPoxcM9D/47M/CQRXFqAjX/yvHuRXVZ0+ODhS/Gskr8soZb
 Mc7Vrr/yzIunoEBRd3AuGknL9b0pCsDPDvZYA/5ibX5mov+umg9pP/66rpmtQUe+YX2v
 C6A/wF6LhVTDNx+EFnJaR1Xp8kpiVmIGtbimvgXP1qaJr0Nx6OBgkSmbmENhPkUokxKW
 BDs3DXMbWlh74cFvqyVIEZGZYprXcQx222sijRafq1m/gmV4i5fhRI7qFcAQWaZoswM/
 Zrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528573; x=1692133373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eeeLPCy6qfu7VzyO6TB+4obhTO937OTJDmGqSEAL/C0=;
 b=Z2QrCWIQuq08Vu9QF+vamD+IHXkEUpfSG1hMPAQj/t/10wWLHTSAoqVOWbxfoOzTg7
 qP+WPG1YlIqwGR8CeoSy8s+78sH5Pp6SUZiNnVXpwI67BUzDVDf3xzgjx10SF3clS2ee
 DH/gO8V3zBGzfzGH+WrPkFYGZVCefpf/izTZcTEdXnT0IbtbQba40wDWFhcmH1ejj0SS
 lWncFcLddxzCbslmFnC6OvQLxMuB2DC9b+GEzKECVazoTwn1JaAZIBpW4TZR7tHqgftW
 YrCCpwnPZQlAdDc9lba0z2M2QibhqfZhVLvJVK5umhWgW2keaMxIs7o2iokoyHziNjht
 1dkg==
X-Gm-Message-State: AOJu0YzRUQxRCWtPG9Uj5RMiYD/EOsqyFZrB9jWyiAkgZDXEo+e/X4X5
 yc4W8rPGxkUIWtsvSKYPcWxkew==
X-Google-Smtp-Source: AGHT+IHn7Bj8Chf85274C6TwBy1wODZyxABYbM3L3w6Y3HCaMqYLDNJjbcllz+vIgP1YjMj8QqwXZA==
X-Received: by 2002:a2e:7305:0:b0:2b6:da66:2d69 with SMTP id
 o5-20020a2e7305000000b002b6da662d69mr477165ljc.28.1691528573769; 
 Tue, 08 Aug 2023 14:02:53 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:02:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:41 +0200
Subject: [PATCH v2 03/14] dt-bindings: display/msm/gpu: Allow A7xx SKUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-3-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ora3efxJ7ruQmdmZDV+9TI1SKqnioWIl7z/BhTRZm+U=;
 b=wxvCDdd4et5qNx/FesBXpu/lrapN0Cbryw33tqS57rBAVhyK7YZ8hVwPyuZo002qCn38q+GUZ
 BqucMQIeANyCEn41/g72zvwEiRwCHGIpRxtGArMsrIZQL1zjQ1MI0S5
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow A7xx SKUs, such as the A730 GPU found on SM8450 and friends.
They use GMU for all things DVFS, just like most A6xx GPUs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 56b9b247e8c2..b019db954793 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -23,7 +23,7 @@ properties:
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
         items:
-          - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-[3-7][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Imageon to
@@ -203,7 +203,7 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
+              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.41.0

