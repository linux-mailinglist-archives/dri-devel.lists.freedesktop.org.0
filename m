Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A590456CE50
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 11:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAA7113E3B;
	Sun, 10 Jul 2022 09:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F083110F841
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:44 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id w17so1495756ljh.6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxYOYEArwHfC1EBEGrasikYW6pj0UuIU8vXNFVNnVMM=;
 b=VA+Ew8NFOYAPVzxbQ7T7bB6jiXXyevij1M/DS3zsxWNnvntUeUmoJq6aydmYxKWtsR
 fyFYn6D2D1+xrukR8wIY0d8iG3Iz7PO6Kpl1dIE3U0KY/IO6bT60nIUSr4eLNfBbO5dY
 Ta3ExK0k5B14QkCua0E8gVXlk/xgzY/yZFVkV5nr8QhvuCGNwb2p7vKjRMC42topR5Xz
 ag1rpc/0n+acj1oEM9+wVPgFNnuyLh10w8OXaZifShu2CgyBk4B/SPFAjUm6Tjc6gHms
 SHE6b658GPbgpwF8GUW3kQhheHMSak4xVkQtNbmNeUnNdUL8orEBKYPeAUi+j4lo7371
 JffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxYOYEArwHfC1EBEGrasikYW6pj0UuIU8vXNFVNnVMM=;
 b=hdGwoX5ybSQGgJYQV/4EckA66H/JHTSCzJ6/LYuIP3PM2zfPsrBO2/YOSIaKQzn3xc
 Y03ygqPpkn/xXwwWKyuZPWHF19nsjuKgqan1eHEJF+dLOa1DItzEf7pitjJc7ExPMUG2
 IY1b/fXWTSxzRloW32+1XZQ75AKZTvVS5hVsg99781EeyEkE3QG2jy9nHryplxcsWQ41
 P7cP0rRKELKuuCxjMPb7BbKpc4iPwWYLI0Q/zV6n4zAZVYj9CvkC6TVtYl+esfl4ihPQ
 fVJlLzZMguKaV6iZL33VGrL89NpT8WoZP5VbIuH1ll327oByGFrI5jqULtZ1E75B0Qw4
 6mOw==
X-Gm-Message-State: AJIora+5XhJSxWZUP3UwgvV8UPNjwiJKnmIG+rmzpUMGgE1CcwWsRqCO
 i1gAn/O6vNWyanCw2E6dr+1xgg==
X-Google-Smtp-Source: AGRyM1t/mPCH+3KpPAwyzSrxnOmsiAFwLrShnV1B0VGJHnnxi1cL4OM8P4nzwzwVvRTNcpqeGnS+Pg==
X-Received: by 2002:a2e:a78b:0:b0:25d:6898:d0d1 with SMTP id
 c11-20020a2ea78b000000b0025d6898d0d1mr913245ljf.218.1657443644479; 
 Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 04/11] dt-bindings: display/msm: split qcom, mdss bindings
Date: Sun, 10 Jul 2022 12:00:33 +0300
Message-Id: <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split Mobile Display SubSystem (MDSS) root node bindings to the separate
yaml file. Changes to the existing (txt) schema:
 - Added optional "vbif_nrt_phys" region used by msm8996
 - Made "bus" and "vsync" clocks optional (they are not used by some
   platforms)
 - Added (optional) "core" clock added recently to the mdss driver
 - Added optional resets property referencing MDSS reset
 - Defined child nodes pointing to corresponding reference schema.
 - Dropped the "lut" clock. It was added to the schema by mistake (it is
   a part of mdp4 schema, not the mdss).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
 .../devicetree/bindings/display/msm/mdss.yaml | 161 ++++++++++++++++++
 2 files changed, 162 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 43d11279c925..65d03c58dee6 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
 
 Description:
 
-This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
-encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
+This is the bindings documentation for the MDP5 display
 controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
 
-MDSS:
-Required properties:
-- compatible:
-  * "qcom,mdss" - MDSS
-- reg: Physical base address and length of the controller's registers.
-- reg-names: The names of register regions. The following regions are required:
-  * "mdss_phys"
-  * "vbif_phys"
-- interrupts: The interrupt signal from MDSS.
-- interrupt-controller: identifies the node as an interrupt controller.
-- #interrupt-cells: specifies the number of cells needed to encode an interrupt
-  source, should be 1.
-- power-domains: a power domain consumer specifier according to
-  Documentation/devicetree/bindings/power/power_domain.txt
-- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required.
-  * "iface"
-  * "bus"
-  * "vsync"
-- #address-cells: number of address cells for the MDSS children. Should be 1.
-- #size-cells: Should be 1.
-- ranges: parent bus address space is the same as the child bus address space.
-
-Optional properties:
-- clock-names: the following clocks are optional:
-  * "lut"
-
 MDP5:
 Required properties:
 - compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
new file mode 100644
index 000000000000..ba674a261b18
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Mobile Display SubSystem (MDSS)
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
+  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
+
+properties:
+  compatible:
+    enum:
+      - qcom,mdss
+
+  reg:
+    minItems: 2
+    maxItems: 3
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: mdss_phys
+      - const: vbif_phys
+      - const: vbif_nrt_phys
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller:
+    true
+
+  "#interrupt-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+    description: |
+      The MDSS power domain provided by GCC
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    true
+
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
+oneOf:
+  - properties:
+      clocks:
+        minItems: 3
+        maxItems: 4
+
+      clock-names:
+        minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+  - properties:
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: iface
+          - const: core
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - power-domains
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+patternProperties:
+  "^mdp@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    # TODO: add reference once the mdp5 is converted
+
+  "^dsi@(0|[1-9a-f][0-9a-f]*)$":
+    $ref: dsi-controller-main.yaml#
+
+  "^dsi-phy@(0|[1-9a-f][0-9a-f]*)$":
+    oneOf:
+      - $ref: dsi-phy-28nm.yaml#
+      - $ref: dsi-phy-20nm.yaml#
+      - $ref: dsi-phy-14nm.yaml#
+      - $ref: dsi-phy-10nm.yaml#
+      - $ref: dsi-phy-7nm.yaml#
+
+  "^hdmi-phy@(0|[1-9a-f][0-9a-f]*)$":
+    oneOf:
+      - $ref: /schemas/phy/qcom,hdmi-phy-qmp.yaml#
+      - $ref: /schemas/phy/qcom,hdmi-phy-other.yaml#
+
+  "^hdmi-tx@(0|[1-9a-f][0-9a-f]*)$":
+    $ref: hdmi.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mdss@1a00000 {
+      compatible = "qcom,mdss";
+      reg = <0x1a00000 0x1000>,
+            <0x1ac8000 0x3000>;
+      reg-names = "mdss_phys", "vbif_phys";
+
+      power-domains = <&gcc MDSS_GDSC>;
+
+      clocks = <&gcc GCC_MDSS_AHB_CLK>,
+               <&gcc GCC_MDSS_AXI_CLK>,
+               <&gcc GCC_MDSS_VSYNC_CLK>;
+      clock-names = "iface",
+                    "bus",
+                    "vsync";
+
+      interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+    };
+...
-- 
2.35.1

