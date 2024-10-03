Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D157198EB31
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 10:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E28D10E7CC;
	Thu,  3 Oct 2024 08:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dekc2H0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B12910E7D6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 08:14:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42ca5447142so818305e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727943277; x=1728548077; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ArBelTC9NYknk17YOAC0+lV31yeITIe1wOVojgMQpJ4=;
 b=Dekc2H0uT4KpbSTwfxe60pecmhhCb5g6Tl0wyVV4e2y8vhBwZBq4jURyKSBFGsWQ5X
 +VTVPQl/xvxvdu3QulLcR85156G6hGL6RiqTCfiUp7wu2TOCu0H2ZnNEW046ol4QzIVm
 rDooeX/fve+idJYGqt6aTCRIaMLjL9FeVwaIOo3cxvZq6iarkaXtr6DaOy7ifPzrvkcO
 BKWNO5aIiP0+GwqFGtlI1R0laCcd1FNZ19x45rxTtog/Uy/1VBHwYzKWNFVgjjAW7INJ
 K9pghBbcHamgchCp551xSI6xvCh8NZB8caXy2gZNU26mlu4fROcqJmAEGfFgHO20hOG0
 piVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727943277; x=1728548077;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ArBelTC9NYknk17YOAC0+lV31yeITIe1wOVojgMQpJ4=;
 b=WYaM6JHPOiVoJsmuQknC0+5wXnsVwN6lzNz67XCsfcByVwULWNqzeCLf1qCkLuaYPX
 uWWYl+CI1k8p2zX8GlPjoqXMHezS433xxyW6l4rsjCKLLmY7zFkDaYYkKdf8GpTZHqm7
 fOnfbpDq2rSesVNNvT5ZQImEqGd2DMXjCvkuAs/5Vk7cWCPEnvH8V4PpNexqoj5ziJX6
 mFDRHeUTqrDNIUI3gQ/TuGMgKL6HTy+BxdO2FV1f8eRysnbuS12c5sWbl65BC5plH1SG
 no8tw/UKScGWj4fgCNPz58dhTFQBspx4sVvi5pbA3LtlBSwk1+ULe2WRIUtfMPk92loO
 WJLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyRG4fPfdSawRhhef2Vgc+ho5N+yFdjKjU3epTQ7hpgF15kBKO5kOnM3Itj2PMePATShbwY1GUPlk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhW1GbYtbxaD4C+60Yu2Xg9JU8BwdN+U0I/ASELlI+CRxef2Yx
 vI4X5Lqnz7s8w6s6LLrs2WSY9hm5fsaKST1EsSQ9FMt6SA/YPvgJRmI7Jy0jGSg=
X-Google-Smtp-Source: AGHT+IEZZ9yqPRpUkj59+2e4tzhm/Y9ZxH9ngz6j0TXb/L0/Y1YM9lMtfkVQV3nVzkU4l8hHAEAmAg==
X-Received: by 2002:a05:600c:1393:b0:42c:ba61:d20b with SMTP id
 5b1f17b1804b1-42f790970b6mr19964015e9.3.1727943277392; 
 Thu, 03 Oct 2024 01:14:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082d230dsm702027f8f.94.2024.10.03.01.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 01:14:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 03 Oct 2024 10:14:21 +0200
Subject: [PATCH 4/5] dt-bindings: display/msm: merge SM8450 DPU into SC7280
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-dt-binding-display-msm-merge-v1-4-91ab08fc76a2@linaro.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5495;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AKhgP7q0GaIQSUQKoHkiCv6d3dwP2bPLVjVUtecZON0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm/lJi9PKnUZKPp3bxs4fScDOr+KitJedC3+vAz
 0o9qOFFaG2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZv5SYgAKCRDBN2bmhouD
 11upEACJ0BVnq8qjv3Ph2jKpGDLXGePbTEmqdtBS4tTB4aqUTYWkLBhapJkGGUSa04rNy3eDHdx
 2Chu4qCpVLpNcHjHfnPQxkeUZYK0fH1ZJvMfTzbNQsq5OeIkWn8ARRPBO3wISAyh/U276apikcf
 6Pd8hSW0YCJNbyygS807LXfA0RD25MVv8/azvytxtmnLKqvaJpWPdXSI8Fn/7osOh9PcvKs5r19
 rhbTxv6AoRIgeoXHUtKh1/r/tco3c31H9fXHTQsz0J73B6DyoQFjzs7OXXmjDMvwxA/CmDFRlra
 pWEVEAQOC5W2vMFWRp+98Mnj+LlRaeqs+0dCZESTeZg4rlSsknaFiqb9qtqA5yUU+pDBSdIkvL/
 yha2Clkxx243AZ+6wHZd7gVEEBXzFtpkPgOvami5bVTkIW0IDDgE7o1+VRi0z5SrvFiM5JwKUMV
 2cD7ZFojH7Ivko0G5OQvE5bIftcK1Jhx9lvvSGHRE6dwe3l8YN3lyE9s+O8uY0fxjpdCEXoflpX
 XCHXoAg0Fz0AN1onmNQIruiCEav5AmsJm0L5nlBu7tOnNr93ugJlG4LRtHKtyPdHUcqexzaEuN7
 QVkk0g8ddnRWELvo/slmntpKjvyn5X/SxkkMvYAZWo3JjpbrxEf14mX+MJd9J5U6YjX+4yDUX9f
 akLeIow5PLj1HHQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Split of the bindings was artificial and not helping - we end up with
multiple binding files for very similar devices thus increasing the
chances of using different order of reg and clocks entries.

Unify DPU bindings of SC7280 and SM8450, because they are the same.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   2 +
 .../bindings/display/msm/qcom,sm8450-dpu.yaml      | 139 ---------------------
 2 files changed, 2 insertions(+), 139 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 3d69a573b450..750230839fc9 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -8,6 +8,7 @@ title: Qualcomm Display DPU on SC7280
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 $ref: /schemas/display/msm/dpu-common.yaml#
@@ -18,6 +19,7 @@ properties:
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu
+      - qcom,sm8450-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
deleted file mode 100644
index 2a5d3daed0e1..000000000000
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
+++ /dev/null
@@ -1,139 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-dpu.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SM8450 Display DPU
-
-maintainers:
-  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-
-$ref: /schemas/display/msm/dpu-common.yaml#
-
-properties:
-  compatible:
-    const: qcom,sm8450-dpu
-
-  reg:
-    items:
-      - description: Address offset and size for mdp register set
-      - description: Address offset and size for vbif register set
-
-  reg-names:
-    items:
-      - const: mdp
-      - const: vbif
-
-  clocks:
-    items:
-      - description: Display hf axi
-      - description: Display sf axi
-      - description: Display ahb
-      - description: Display lut
-      - description: Display core
-      - description: Display vsync
-
-  clock-names:
-    items:
-      - const: bus
-      - const: nrt_bus
-      - const: iface
-      - const: lut
-      - const: core
-      - const: vsync
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - clock-names
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,sm8450-dispcc.h>
-    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sm8450.h>
-    #include <dt-bindings/power/qcom,rpmhpd.h>
-
-    display-controller@ae01000 {
-        compatible = "qcom,sm8450-dpu";
-        reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
-        reg-names = "mdp", "vbif";
-
-        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-                <&gcc GCC_DISP_SF_AXI_CLK>,
-                <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
-                <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        clock-names = "bus",
-                      "nrt_bus",
-                      "iface",
-                      "lut",
-                      "core",
-                      "vsync";
-
-        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        assigned-clock-rates = <19200000>;
-
-        operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd RPMHPD_MMCX>;
-
-        interrupt-parent = <&mdss>;
-        interrupts = <0>;
-
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            port@0 {
-                reg = <0>;
-                dpu_intf1_out: endpoint {
-                    remote-endpoint = <&dsi0_in>;
-                };
-            };
-
-            port@1 {
-                reg = <1>;
-                dpu_intf2_out: endpoint {
-                    remote-endpoint = <&dsi1_in>;
-                };
-            };
-        };
-
-        mdp_opp_table: opp-table {
-            compatible = "operating-points-v2";
-
-            opp-172000000{
-                opp-hz = /bits/ 64 <172000000>;
-                required-opps = <&rpmhpd_opp_low_svs_d1>;
-            };
-
-            opp-200000000 {
-                opp-hz = /bits/ 64 <200000000>;
-                required-opps = <&rpmhpd_opp_low_svs>;
-            };
-
-            opp-325000000 {
-                opp-hz = /bits/ 64 <325000000>;
-                required-opps = <&rpmhpd_opp_svs>;
-            };
-
-            opp-375000000 {
-                opp-hz = /bits/ 64 <375000000>;
-                required-opps = <&rpmhpd_opp_svs_l1>;
-            };
-
-            opp-500000000 {
-                opp-hz = /bits/ 64 <500000000>;
-                required-opps = <&rpmhpd_opp_nom>;
-            };
-        };
-    };
-...

-- 
2.43.0

