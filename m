Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF11E9E3D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862F56E064;
	Mon,  1 Jun 2020 06:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF696E04A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:29:44 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CB2BB20047B;
 Mon,  1 Jun 2020 08:23:25 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 03B38200480;
 Mon,  1 Jun 2020 08:23:20 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0C01440323;
 Mon,  1 Jun 2020 14:23:12 +0800 (SGT)
From: sandor.yu@nxp.com
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, heiko@sntech.de, hjc@rock-chips.com,
 Sandor.yu@nxp.com, dkos@cadence.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] dt-bindings: display: Document Cadence MHDP HDMI/DP
 bindings
Date: Mon,  1 Jun 2020 14:17:37 +0800
Message-Id: <9fa979f1099f7c02fd746f25002d8a652253d70f.1590982881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590982881.git.Sandor.yu@nxp.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
In-Reply-To: <cover.1590982881.git.Sandor.yu@nxp.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

Document the bindings used for the Cadence MHDP HDMI/DP bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/display/bridge/cdns,mhdp.yaml    | 46 +++++++++++++++
 .../devicetree/bindings/display/imx/mhdp.yaml | 59 +++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/mhdp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
new file mode 100644
index 000000000000..aa23feba744a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause))
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP TX Encoder
+
+maintainers:
+  - Sandor Yu <Sandoryu@nxp.com>
+
+description: |
+  Cadence MHDP Controller supports one or more of the protocols,
+  such as HDMI and DisplayPort.
+  Each protocol requires a different FW binaries.
+
+  This document defines device tree properties for the Cadence MHDP Encoder
+  (CDNS MHDP TX). It doesn't constitue a device tree binding
+  specification by itself but is meant to be referenced by platform-specific
+  device tree bindings.
+
+  When referenced from platform device tree bindings the properties defined in
+  this document are defined as follows. The platform device tree bindings are
+  responsible for defining whether each property is required or optional.
+
+properties:
+  reg:
+    maxItems: 1
+    description: Memory mapped base address and length of the MHDP TX registers.
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    - const: plug_in
+      description: Hotplug detect interrupter for cable plugin event.
+    - const: plug_out
+      description: Hotplug detect interrupter for cable plugout event.
+
+  port:
+    type: object
+    description: |
+      The connectivity of the MHDP TX with the rest of the system is
+      expressed in using ports as specified in the device graph bindings defined
+      in Documentation/devicetree/bindings/graph.txt. The numbering of the ports
+      is platform-specific.
diff --git a/Documentation/devicetree/bindings/display/imx/mhdp.yaml b/Documentation/devicetree/bindings/display/imx/mhdp.yaml
new file mode 100644
index 000000000000..17850cfd1cb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/mhdp.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/mhdp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP Encoder
+
+maintainers:
+  - Sandor Yu <Sandoryu@nxp.com>
+
+description: |
+  The MHDP transmitter is a Cadence HD Display TX controller IP
+  with a companion PHY IP.
+  The MHDP supports one or more of the protocols,
+  such as HDMI(1.4 & 2.0), DisplayPort(1.2).
+  switching between the two modes (HDMI and DisplayPort)
+  requires reloading the appropriate FW
+
+  These DT bindings follow the Cadence MHDP TX bindings defined in
+  Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml with the
+  following device-specific properties.
+
+Properties:
+  compatible:
+    enum:
+      - nxp,imx8mq-cdns-hdmi
+      - nxp,imx8mq-cdns-dp
+
+  reg: See cdns,mhdp.yaml.
+
+  interrupts: See cdns,mhdp.yaml.
+
+  interrupt-names: See cdns,mhdp.yaml.
+
+  ports: See cdns,mhdp.yaml.
+
+Required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - ports
+
+Example:
+  - |
+    mhdp: mhdp@32c00000 {
+      compatible = "nxp,imx8mq-cdns-hdmi";
+      reg = <0x32c00000 0x100000>;
+      interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "plug_in", "plug_out";
+
+      ports {
+        mhdp_in: endpoint {
+          remote-endpoint = <&dcss_out>;
+        };
+      };
+    };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
