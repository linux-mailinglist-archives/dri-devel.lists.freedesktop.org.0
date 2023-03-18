Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819166BFA56
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 14:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD52A10E0F1;
	Sat, 18 Mar 2023 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637EA10E030
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 13:42:56 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z5so7778261ljc.8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679146974;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gR7d4RO2oXpB/c3r0bQ4Ajknjymjb6WOVIZPuCDVi/s=;
 b=H+KKwkXjEOO0xzTuKFQmmnSBPzTcBRlFbmOuHHf0Uf1URi+8D0dsxGBIdjFfhSufft
 DrJpuK0pjFw5vgPotYM8FgqBQan/tczhlitMFlsrMRdr6y1YoAiafr7ZNKsSQhjxcP9i
 QdGlVVNlQVzg2orND8EdgzhC7jo6B2q11qv2GhzXuxoRIPLQsqaKpQR8yYmitCbxFlf6
 8ePht5xEcqLrc9tJ/+GOPrYedYc/80thHuI+k1zq2FBRjOTtam2lDB+hz6s/gbG+/4vc
 nKCUA3ZMHKf8TG1JhXh7229zquYFFboM05CWaQpMqtUQQcK0bYW25K/WR2h7EV2y+JD6
 bT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679146974;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gR7d4RO2oXpB/c3r0bQ4Ajknjymjb6WOVIZPuCDVi/s=;
 b=cDY0IWJTvz0As+QaLYj63Dppa+ekWDJ5TyRNxZkrlOITsLXCb/SrvwFxzek6IL+P6k
 /4xgGHSusAqZy5/Z/Nrjhazyju0Bz64D0R0PGqomARQIZcmmNSueqfV1KlVpYGbc88d2
 LznggibCa/ZFTaEqrpepm8dz/6aXni8zCc53rwluwr0H3luZmo/yXwOjGbN/OL750RcU
 NPKigmCbtPWcjTf4T7PTFe/qduoziTpidZKgiq+o6jojqkdjVDaH2k0Jq8oKRmZ5Dvs2
 /9isBjiXvYo0e9wJoDWP6YYS/MdGu6MeF0kTaX7qoK/Zwce8WTSDOn+6BGY3K4O/VgFU
 V9DQ==
X-Gm-Message-State: AO0yUKVswfix4TS9APo0Eb0bapl50uEnh333rDyAFAy5I1bTa/mWIRGR
 0wL3c38rCGJtMol+d+zZbanGvw==
X-Google-Smtp-Source: AK7set9GN9auH9hYdKHl3gOJyNgaD+0SoeqFRn4nVBRLI6bcjVlPdnl1lVslCbG8ftxVuXbiMtxUiw==
X-Received: by 2002:a05:651c:391:b0:298:9db0:a9dd with SMTP id
 e17-20020a05651c039100b002989db0a9ddmr3848542ljp.50.1679146974706; 
 Sat, 18 Mar 2023 06:42:54 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a2e9d82000000b0029a0b50a34asm888367ljj.36.2023.03.18.06.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 06:42:54 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 18 Mar 2023 14:42:47 +0100
Subject: [PATCH v6 1/9] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v6-1-70e13b1214fa@linaro.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679146971; l=1481;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lSCVKFJ04QtIFibtVglZV7BCCs/8/zx27+lAfw7WMPU=;
 b=X/s/41QPUlm8nRs2vQaKIl635XNevr5YacB1S+xQkmK9HwhcN8L3ph+JFfv/IpLFvBj0pHm1IC6M
 af8muWHKDv5rbdPZkHE5JmnQP98Q8umthXsGYo2492dX8ODNKJbj
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
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
alone. This however didn't quite work out and the property became
undocumented instead of deprecated. Fix that.

Additionally, the "qcom," prefix was missed previously. Fix it.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dac..ecc89011bec4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -31,10 +31,9 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
-      - items:
-          - enum:
-              - dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
+      - enum:
+          - qcom,dsi-ctrl-6g-qcm2290
+          - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
         deprecated: true
 
   reg:

-- 
2.39.2

