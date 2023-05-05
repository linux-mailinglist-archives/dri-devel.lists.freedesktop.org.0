Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83726F8B39
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A9310E67E;
	Fri,  5 May 2023 21:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7DD10E0B1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 21:40:46 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so25626701fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 14:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322845; x=1685914845;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Olp/PVXIJr8fEMjOP3fCHDkSYD0xJnBud5aoQtWwMD4=;
 b=bcyb7PU+mB0xuZcC98A3z4xrQTA4cCO9fBd6WOSZ4BXU+qSJ1uguBXdCQkKkfa1qOG
 tz29LlHe+jDhfBGEkFjUPX0kG/zMnGQdZaUbfQGKVC24x4niiJcGNPPWgl7i8TZEGNgy
 zKaTUKwGCrCIiCDNEutlCwoHmLJVBCSeUhO+emE5U24E0omFmV1YfVxmBKvL5bsPsNb/
 CvU5JYSMOwJrZmG3cpVKwpR/DwiFu6t/cGXEaeJzn/dSt0Glh6iKohWshJo9Q21rz8DN
 vmzfXNbcmz8axbxYCWdVpFDXPsbEUSf3l2CUlGgX6r3WJ1n0PqpnxZs7iJ2vu3RlcxlH
 j+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322845; x=1685914845;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Olp/PVXIJr8fEMjOP3fCHDkSYD0xJnBud5aoQtWwMD4=;
 b=SOEWQkZhdkc8LeE0JtCpD2AeLZ8InNfSUmuEAZeA+5w/TayyQphUCuByxaNKKAB72R
 lEALBkraSzQFrCpx+WZOQA7WT2DWXmTxui1VVA9AAObPdP/4/VmXU9mW+bolQawIELYB
 Ncw6X5zWb/n3CbKEOX2ZJ3hvfSbVA9PvOCmAC82t072XBMquiG4Ub5kk8D/w5VtKNj5o
 iK3IIb4FeSDhfsCph8lYHX8wy4CP9eweazP/ED6rZlHFuca4dGgX3CJbTm/B6NmgCngB
 sC1ajXFrz5okjknf7wN11rurKFl4Zr4cKw37mQm5hYLpICcZUN2NdMMO2040X9WoEi64
 yZcQ==
X-Gm-Message-State: AC+VfDyuqE2eeNoWW4/FIOm7c7+c71s4Pr27loY0SBUVZKugLJtyNuF1
 sOBI2M2lZDJCCTqGHQiX8D8YUpyPRubfGxruA6w=
X-Google-Smtp-Source: ACHHUZ4gXaB+RYZgmcooayAAK8tmsa/H8nYRTCwojYzNiGeovBEiytzLG1KPmci+aNtG4Z3ZdQlYPQ==
X-Received: by 2002:a2e:8815:0:b0:2a8:bf35:3b7 with SMTP id
 x21-20020a2e8815000000b002a8bf3503b7mr821445ljh.32.1683322845019; 
 Fri, 05 May 2023 14:40:45 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:40:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 May 2023 23:40:28 +0200
Subject: [PATCH v3 02/12] dt-bindings: display/msm: dsi-controller-main:
 Add SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v3-2-9837d6b3516d@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VsWoYP7GHCgHOv33piyXwEtJ6/KtKH5SJYQ2EDUVEdo=;
 b=+3R0ILIrXzT82PWwbsl52w/wP4I53hpnomknSN5Kg5vAI7isrjcQm4SRnGPHieDAD+1Jm6gke
 4m7bCcjT25dAP6HBg9UzJaX/QBj7wkbo8MX8s82R3DQp7aHegBP1CeB
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the DSI host found on SM6375.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6f367a1fabf8..f7dc05a65420 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -354,6 +355,7 @@ allOf:
             enum:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

