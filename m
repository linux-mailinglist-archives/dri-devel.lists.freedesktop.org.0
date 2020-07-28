Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7923129A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865C66E379;
	Tue, 28 Jul 2020 19:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A1E89B22
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:08:23 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id e8so11572232pgc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k2EPigr/Voh7/YKEayuhZk/Idw0+OENbQIZ4qJ+Mu+E=;
 b=mXLcHFiWIS6ZNcYq9ztnBPxxcVIxWgskB9uehJOH+bVnWJR//zwYsc3Gz66BHE1kWZ
 /yUXFtTFw74By44bNLzLiSIeBNv3X2BKll4QTBm7cQHuR2Rlk6bZzhzeXYyn3ikXIcnf
 o4pGaeajsAxG2hrTRqeYTXO4S0slcQ9Sswaf3y7CCMJ25/VCOeyS8sGzYpPfXo3HdHCw
 nGz1As//kMZcI6/UQdITByeJNZFyiO4khqHmlzHqBFGNJEqkAP1wyd9ijUNuLGydDfqe
 kFpgdrTfLxRdMB6Hvh87AkNZAlG4WaYzco/NmU6abNQgkiKxjoeFSwWcIq3w9LtiF08u
 DRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k2EPigr/Voh7/YKEayuhZk/Idw0+OENbQIZ4qJ+Mu+E=;
 b=pEfFCDWhccyOk3g4g9VX8GE05FlNY2ns713pnAaA2z1zrddHZS6eCupZjHmVJCwZzg
 KJ4SDcoILdoYiuVWJiJAVJtQZivJmST7V0bfHAvYJ6uXAuhAmKa9vVKxlskuHqTUvyMK
 glQDUyeK0Z00a3hTUMoNhKaS/is1LvRKa9c1TSVTxwS0Q2RwTX4fOE66xcHlpJtTOIqg
 bUWpFDz4pCWxPWbVAw1emwdWci6h0NxMHwHWczZy8XF7+kn2t1C2MIawF4hKYKFX7ES/
 c8DDbeyXsomWB6YcT5XTMFcJ/acYGyWlzc5B/PwcFZkERvOrnGos9/4RnIuXQV2jimvd
 h9lg==
X-Gm-Message-State: AOAM533UbHwnhYODDLFpI0ji/S8po5F6AsrrY4W6kl8049U8oTjsklnA
 26g7xiuGssovdhMMiWa6kJs=
X-Google-Smtp-Source: ABdhPJzIe3A+FM8XOnrnAj/t7qE315wlxVLKsbVFa0CWNd/5bJmW2RCYjtFXR7sOJ1JSREdFTTvm/w==
X-Received: by 2002:a62:188a:: with SMTP id 132mr12505253pfy.59.1595930903364; 
 Tue, 28 Jul 2020 03:08:23 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id e76sm1704593pfh.108.2020.07.28.03.08.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 03:08:22 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v6 5/6] dt-bindings: display: add Unisoc's mipi dsi&dphy
 bindings
Date: Tue, 28 Jul 2020 18:07:58 +0800
Message-Id: <1595930879-2478-6-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds MIPI DSI Master and MIPI DSI-PHY (D-PHY)
support for Unisoc's display subsystem.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/dphy.yaml     | 75 +++++++++++++++++
 .../devicetree/bindings/display/sprd/dsi.yaml      | 98 ++++++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dphy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/dphy.yaml b/Documentation/devicetree/bindings/display/sprd/dphy.yaml
new file mode 100644
index 0000000..1b83260
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dphy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI-PHY (D-PHY)
+
+maintainers:
+  - Mark Rutland <mark.rutland@arm.com>
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dsi-phy
+
+  reg:
+    maxItems: 1
+    description:
+      Must be the dsi controller base address.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  port@0:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the output endpoint, usually output to
+      the associated panel.
+  port@1:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the input endpoint, usually coming from
+      the associated DSI controller.
+
+required:
+  - compatible
+  - reg
+  - port@0
+  - port@1
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    dphy: dphy {
+        compatible = "sprd,sharkl3-dsi-phy";
+        reg = <0x0 0x63100000 0x0 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* input port*/
+        port@1 {
+            reg = <1>;
+            dphy_in: endpoint {
+    	          remote-endpoint = <&dsi_out>;
+            };
+        };
+
+        /* output port */
+        port@0 {
+    	      reg = <0>;
+    	      dphy_out: endpoint {
+    		        remote-endpoint = <&panel_in>;
+    	      };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/sprd/dsi.yaml b/Documentation/devicetree/bindings/display/sprd/dsi.yaml
new file mode 100644
index 0000000..d89d957
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dsi.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI Master
+
+maintainers:
+  - Mark Rutland <mark.rutland@arm.com>
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dsi-host
+
+  reg:
+    maxItems: 1
+    description:
+      Physical base address and length of the registers set for the device.
+
+  interrupts:
+    maxItems: 2
+    description:
+      Should contain DSI interrupt.
+
+  clocks:
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: clk_src_96m
+
+  power-domains:
+    maxItems: 1
+    description: A phandle to DSIM power domain node
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  port@0:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the input endpoint, usually coming from
+      the associated DPU.
+  port@1:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the output endpoint, usually output to
+      the associated DPHY.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port@0
+  - port@1
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+    dsi: dsi@0x63100000 {
+        compatible = "sprd,sharkl3-dsi-host";
+        reg = <0 0x63100000 0 0x1000>;
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "clk_src_96m";
+        clocks = <&pll CLK_TWPLL_96M>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+        port@0 {
+            reg = <0>;
+            dsi_in: endpoint {
+                remote-endpoint = <&dpu_out>;
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+            dsi_out: endpoint@1 {
+                remote-endpoint = <&dphy_in>;
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
