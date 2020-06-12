Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850C1F71DF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 03:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910CC6E0FF;
	Fri, 12 Jun 2020 01:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75D96E0FF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 01:52:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591926740; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1ttjwVbsLOVOivS+1aUiGGbw0jwstUAS28zUU4Fs3Ts=;
 b=jdDIf/nSnYAQGqL8s/aIPwteHmYYpTpe9BdIVlDGCTudmYGYGXVZARQ1lTQPXnczMP9qcizk
 129MCELH4xlQ4x0Ec0dStonC1OZgkRDhO2Q/ocA/CDaw4v1YoH6LP00OpWgq67qS7QCkq8j5
 pgvvD9UMyxw5iDFezRsJrHo7iVg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ee2dfbec76a4e7a2a020327 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 01:51:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 746DBC433CB; Fri, 12 Jun 2020 01:51:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D996C433CA;
 Fri, 12 Jun 2020 01:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D996C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tanmay@codeaurora.org
From: Tanmay Shah <tanmay@codeaurora.org>
To: sam@ravnborg.org,
	robh+dt@kernel.org,
	swboyd@chromium.org
Subject: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver
 for Snapdragon
Date: Thu, 11 Jun 2020 18:50:26 -0700
Message-Id: <20200612015030.16072-2-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612015030.16072-1-tanmay@codeaurora.org>
References: <20200612015030.16072-1-tanmay@codeaurora.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chandan Uddaraju <chandanu@codeaurora.org>

Add bindings for Snapdragon DisplayPort controller driver.

Changes in V2:
Provide details about sel-gpio

Changes in V4:
Provide details about max dp lanes
Change the commit text

Changes in V5:
moved dp.txt to yaml file

Changes in v6:
- Squash all AUX LUT properties into one pattern Property
- Make aux-cfg[0-9]-settings properties optional
- Remove PLL/PHY bindings from DP controller dts
- Add DP clocks description
- Remove _clk suffix from clock names
- Rename pixel clock to stream_pixel
- Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
- Fix indentation
- Add Display Port as interface of DPU in DPU bindings
  and add port mapping accordingly.

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 .../bindings/display/msm/dp-sc7180.yaml       | 142 ++++++++++++++++++
 .../devicetree/bindings/display/msm/dpu.txt   |   8 +
 2 files changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
new file mode 100644
index 000000000000..5fdb9153df00
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Port Controller.
+
+maintainers:
+  - Chandan Uddaraju <chandanu@codeaurora.org>
+  - Vara Reddy <varar@codeaurora.org>
+  - Tanmay Shah <tanmay@codeaurora.org>
+
+description: |
+  Device tree bindings for MSM Display Port which supports DP host controllers
+  that are compatible with VESA Display Port interface specification.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,dp-display
+
+  cell-index:
+    description: Specifies the controller instance.
+
+  reg:
+    items:
+      - description: DP controller registers
+
+  interrupts:
+    description: The interrupt signal from the DP block.
+
+  clocks:
+    description: List of clock specifiers for clocks needed by the device.
+    items:
+      - description: Display Port AUX clock
+      - description: Display Port Link clock
+      - description: Link interface clock between DP and PHY
+      - description: Display Port Pixel clock
+      - description: Root clock generator for pixel clock
+
+  clock-names:
+    description: |
+      Device clock names in the same order as mentioned in clocks property.
+      The required clocks are mentioned below.
+    items:
+      - const: core_aux
+      - const: ctrl_link
+      - const: ctrl_link_iface
+      - const: stream_pixel
+      - const: pixel_rcg
+  "#clock-cells":
+    const: 1
+
+  vdda-1p2-supply:
+    description: phandle to vdda 1.2V regulator node.
+
+  vdda-0p9-supply:
+    description: phandle to vdda 0.9V regulator node.
+
+  data-lanes = <0 1>:
+    type: object
+    description: Maximum number of lanes that can be used for Display port.
+
+  ports:
+    description: |
+       Contains display port controller endpoint subnode.
+       remote-endpoint: |
+         For port@0, set to phandle of the connected panel/bridge's
+         input endpoint. For port@1, set to the DPU interface output.
+         Documentation/devicetree/bindings/graph.txt and
+         Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+patternProperties:
+  "^aux-cfg([0-9])-settings$":
+    type: object
+    description: |
+      Specifies the DP AUX configuration [0-9] settings.
+      The first entry in this array corresponds to the register offset
+      within DP AUX, while the remaining entries indicate the
+      programmable values.
+
+required:
+  - compatible
+  - cell-index
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - vdda-1p2-supply
+  - vdda-0p9-supply
+  - data-lanes
+  - ports
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    msm_dp: displayport-controller@ae90000{
+        compatible = "qcom,dp-display";
+        cell-index = <0>;
+        reg = <0 0xae90000 0 0x1400>;
+        reg-names = "dp_controller";
+
+        interrupt-parent = <&display_subsystem>;
+        interrupts = <12 0>;
+
+        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+        clock-names = "core_aux",
+                      "ctrl_link",
+                      "ctrl_link_iface", "stream_pixel",
+                      "pixel_rcg";
+        #clock-cells = <1>;
+
+        vdda-1p2-supply = <&vreg_l3c_1p2>;
+        vdda-0p9-supply = <&vreg_l4a_0p8>;
+
+        data-lanes = <0 1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dp_in: endpoint {
+                    remote-endpoint = <&dpu_intf0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dp_out: endpoint {
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..30c8ab479b02 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -65,6 +65,7 @@ Required properties:
 
 	Port 0 -> DPU_INTF1 (DSI1)
 	Port 1 -> DPU_INTF2 (DSI2)
+	Port 2 -> DPU_INTF0 (DP)
 
 Optional properties:
 - assigned-clocks: list of clock specifiers for clocks needing rate assignment
@@ -136,6 +137,13 @@ Example:
 						remote-endpoint = <&dsi1_in>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+					dpu_intf0_out: endpoint {
+						remote-endpoint = <&dp_in>;
+					};
+				};
 			};
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
