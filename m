Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9256BFA79
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 14:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E8910E290;
	Sat, 18 Mar 2023 13:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8231410E106
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 13:43:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y15so9744335lfa.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679146986;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U+jIZB+lOj7L713dwYSMYXhpa9ZO/qMAXKk3i/Uz2ak=;
 b=FzWZrHP16xKM/suGeskGqhufuiGNrR+wjzdZUs2SRtC9Sn2k3/kRWqsRrv32g1VTTB
 SW1uYciJCL1aDUBl3hdgBl4qPS6woupjb/jjFDDO0ms9t8TOCvmgGxZRG4Lalb2XCVSj
 toQ9ndNWqqu/PsPDeHEJYod0QjUP2jz2Zhu2x0o42nU9V1cU6j3pL5xMv3Dzub0SHHwe
 K0brJpS4DaRA8wEO8n57+XamMquBtcDSEaaG9O3SkOIwJo0hXFHDU7VPXxXEA7GDecaI
 tYIDqgZIBVMwJA8991R3UynxsA62Ge130WDC3S0yv9hwILh7AdbUSxuGAJTCpuJq/Hko
 BUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679146986;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+jIZB+lOj7L713dwYSMYXhpa9ZO/qMAXKk3i/Uz2ak=;
 b=dd+UiiGUS0WvHakuqIyl5T/9kIoJ2uBCp8aOaTSY5MPVJ+YaKmJIZl/69tbZd/aqWs
 lVqb3hU3YU8ezJhRxXyCwJreMT8jnimOR4P/IvlVct8Gf/ZemMhMjYqDvXf97XdtCMCP
 0aFxySJ2A9taiTATtUO32KENqjJreYU/eUtI7YwntrCg1BVz3lLcoYNdmV2FFgC6m5k4
 vk4guYqNMEefdAqMnvNMUA2bh/HWwC+BG1bj3+NXvZKPNfOCK9YQVF/UNTphfDfX9VMN
 tpwbagIhNnsxEUGdbk5OY28hXDV+23Ck85uHWsOsxb3Zlo5T1wG2KIho1WA+y1yyMe58
 saLg==
X-Gm-Message-State: AO0yUKWOaOgQgcJ8DRd3jH4kdvKnU1TJIHWLDLVCvn5dC2qvr5mFl3mJ
 Ef9CcYfIgT4BiQQVN5VARxfeXw==
X-Google-Smtp-Source: AK7set+hYmmfY91OTCZI8XgA/WZ+zAgYTLxr0qhrk1g8dSCRhvdGhXypnycKVt6y+Ok8/jAX6VF0zw==
X-Received: by 2002:ac2:5deb:0:b0:4dc:81a3:c095 with SMTP id
 z11-20020ac25deb000000b004dc81a3c095mr5463529lfq.38.1679146985862; 
 Sat, 18 Mar 2023 06:43:05 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a2e9d82000000b0029a0b50a34asm888367ljj.36.2023.03.18.06.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 06:43:05 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 18 Mar 2023 14:42:54 +0100
Subject: [PATCH v6 8/9] dt-bindings: display/msm: dsi-controller-main: Add
 SM6115
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v6-8-70e13b1214fa@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679146971; l=2355;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TH3q3Ed2aw6dX9xtVNq6VpDwcDDpJoS9emOd9LF1Zus=;
 b=IEzuk0TI7uwZ53rvy74C1k+EIg8nf+j85wwtz+eHnVKNv9VaL+M4qtd5rZNbcp2H8mBdNFMZytxd
 4nwFN9n7A8b1HfuGX6eiPEKz2RT7s9x6z1fwf5FdJ5ss5B6lElud
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

Add a compatible for the DSI on SM6115.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   |  2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml      | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ecc89011bec4..c8884a84e73d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -350,6 +351,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
     then:
       properties:
         clocks:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..b9f83088f370 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,13 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        oneOf:
+          - items:
+              - const: qcom,sm6115-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - description: Old binding, please don't use
+            deprecated: true
+            const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -114,7 +120,7 @@ examples:
         };
 
         dsi@5e94000 {
-            compatible = "qcom,dsi-ctrl-6g-qcm2290";
+            compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x05e94000 0x400>;
             reg-names = "dsi_ctrl";
 

-- 
2.39.2

