Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015B627A814
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99916E2E3;
	Mon, 28 Sep 2020 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AF26E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 06:28:09 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id n14so3219pff.6
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 23:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wkcAukPVeQX/XX3VbeBj4swrCvj8XPck6PFWXkBMmfM=;
 b=u6bwuaQ/VWWPYDNv6doCwWuLXdjezSbkaHmJ07vmboOQTL71AQoyXeoAU/vUr/7JxR
 vhuzqXLpVhYGZHyCLbhb0TU4G9rUIN11DFNeTsd4BouCBecBHUckjhAVEoljFEzFIcDg
 9BAhOTLF4Vg2TbA5uxlkeCQ8F67icwWMuXFxMG6PPdPzxa/QDnuOvoXgRS8wFiJKSNUJ
 c6cwHlIHuu+mI7KtJpdQzBJbh6Q6vuuIVt4ooemyz07I7aw/ybmSHRrlKG/6A2RpK4/K
 6PGykAT17nMHTWDHFSjKllKZXPd4sBad+gpMaV5gq69XXilI7xlMIcfk6DVU1jFsP+uJ
 i+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wkcAukPVeQX/XX3VbeBj4swrCvj8XPck6PFWXkBMmfM=;
 b=TcYCdmoOroPqFKkHyh2dO1ey5nBb5HgiUpLUBvYzUJ3k6OwmK4KM7ZhnwsAkI4jz5n
 MRS8thCDYNGBZ5tMPT91TlxYXQd02fKuJqmJYaX3eMceoiuJCaYUpRoAxEwvUWeixniH
 4l0EBlX8msP2pcsj3asD9BcD/RHDAqDt3Iy6w4IxDXMGKwkVgsRsIB4Sc9TFFQhkEKAy
 qsK1fL9CKMzeG8hfbKCRIzZHOKHi+EliCj58em9C3Z/IN2NpS79jzooiM4oqeVnRsMLe
 JQudeWKd/aucAgEC/VRYWPlq7mn9TWXG6sgbIlIgKpeio4joNQRwkN/NAjAgVQyGJJKL
 Uu2g==
X-Gm-Message-State: AOAM5327jF99jnRDv4EMyCC8d/1aWLAB/Lv7ximjH51ghI4291dpdtQD
 a4CkNoDHhLkHm5NqZO0JOgo=
X-Google-Smtp-Source: ABdhPJy6ofbwaaPuOAbOqXa+MGoBE8Wf48NiX77W6nPBzsyXmTKavacYg2fcrnEzgyHgD1TxYw4C6Q==
X-Received: by 2002:a63:c74f:: with SMTP id v15mr94995pgg.143.1601274489479;
 Sun, 27 Sep 2020 23:28:09 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id il14sm5712509pjb.54.2020.09.27.23.28.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Sep 2020 23:28:08 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v7 5/6] dt-bindings: display: add Unisoc's mipi dsi&dphy
 bindings
Date: Mon, 28 Sep 2020 14:27:39 +0800
Message-Id: <1601274460-7866-6-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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

RFC v7:
  - Fix DTC unit name warnings
  - Fix the problem of maintainers

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 98 ++++++++++++++++++++++
 .../display/sprd/sprd,sharkl3-dsi-phy.yaml         | 75 +++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
new file mode 100644
index 0000000..b6bbf67
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI Controller
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
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
+    dsi: dsi@63100000 {
+        compatible = "sprd,sharkl3-dsi-host";
+        reg = <0x63100000 0x1000>;
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
+            dsi_out: endpoint {
+                remote-endpoint = <&dphy_in>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
new file mode 100644
index 0000000..0ab8c33
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI-PHY (D-PHY)
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
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
+    dphy: dphy@63100000 {
+        compatible = "sprd,sharkl3-dsi-phy";
+        reg = <0x63100000 0x1000>;
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
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
