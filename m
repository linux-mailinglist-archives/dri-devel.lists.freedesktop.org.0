Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FF26599D4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 16:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9480710E1BC;
	Fri, 30 Dec 2022 15:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329B810E141
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 15:36:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so9954108wmk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 07:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CO3cf7ELE8VZsDkOe+RWJcSBHW9hBBZN8aOD3+5Q1zI=;
 b=H3u0gwhz0dbghwgGKX4OEI6z3oljVv9R8wpCJb7hxZNYA/gzMJbcN6RA2IEZick4hM
 YuZMyeMzLAdvWcpfdXZiMxF/DCLw4DeIu/EWPIR2Lixm4su3oT31XBwYiAKZMsI6Opim
 N2Ip35qCu9cF3VtMcKKJ0NSSNn7CkDrHXMfawR0Ec+W9U6HDI9gCWkh+l766hDHTSlP8
 I3BN2bPxmozrfiAj4SbWOJVZbzmO9ax+nbGGKkrDI2t/nUJ8sH1ns/ejH9nCtwBNrIu7
 1XhOJ5mDHUFJtNjhbU1sLp/ud6BE+aP5SqtQtzmZXKIloMCNMLrVifRN7Sea/h40cJnR
 GBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CO3cf7ELE8VZsDkOe+RWJcSBHW9hBBZN8aOD3+5Q1zI=;
 b=yxUp+v/J/ipGEbCIMT561uzKFvcfT1qvcqb1ECMHyXxnDagHFAVPzheS6in4+J1VPm
 6ximRZtI7t7z+WzhhL2HFFy0q7Qd2YONfh15aBAXJ//tRqodWmgJmg27z2iLbu9NuwUE
 Cs5agv6C29hKukyI6hiuKJ7IiA1onQU+UX+dea//Hj9kRp07phUmLhYHKedRgz69xRjc
 TRQMnVqjcpnm+xqYKm8fUGkIEtE31QpzPMvKRYVyAXLO5qy57sWaAy+0gLjlwIivPMNl
 uQKIIaUbK9OfisAUEJY0351H5U8gxubjkB6LmyEh/pnTB0aRQe7ZreYjsMyGVOtFijQC
 PAuA==
X-Gm-Message-State: AFqh2kqwQ3yXk7l3azNcnAfxJuPgR6tCZO5ddVCrG36n0tnSvFGFP/RS
 hoC07FwOGjMADGfPz5THaAhcWA==
X-Google-Smtp-Source: AMrXdXtIBngmZXHs7up+c2JZtzrks6dw6xuPMLbxcasUNENhHSVfJyMDXo8IX2XeEAYuE4wFfJepbA==
X-Received: by 2002:a05:600c:358a:b0:3cf:8d51:1622 with SMTP id
 p10-20020a05600c358a00b003cf8d511622mr23314246wmq.1.1672414563515; 
 Fri, 30 Dec 2022 07:36:03 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm49857993wms.2.2022.12.30.07.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 07:36:03 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_jesszhan@quicinc.com, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
Subject: [PATCH v4 01/11] dt-bindings: display: msm: Add qcom,
 sm8350-dpu binding
Date: Fri, 30 Dec 2022 16:35:44 +0100
Message-Id: <20221230153554.105856-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Mobile Display Subsystem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema for DPU device
tree bindings

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
new file mode 100644
index 000000000000..120500395c9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8350-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8350 Display DPU
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8350-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display ahb clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: nrt_bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8350-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SM8350_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-345000000 {
+                opp-hz = /bits/ 64 <345000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-460000000 {
+                opp-hz = /bits/ 64 <460000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...
-- 
2.34.1

