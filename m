Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA4B51DEBD
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 20:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F5B10F173;
	Fri,  6 May 2022 18:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615110F127
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 18:10:41 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nn2PU-0005VY-Pm; Fri, 06 May 2022 20:10:36 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v0.5 1/9] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI TX
Date: Fri,  6 May 2022 20:10:26 +0200
Message-Id: <20220506181034.2001548-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220506181034.2001548-1-l.stach@pengutronix.de>
References: <20220506181034.2001548-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sandor Yu <Sandor.yu@nxp.com>, Robert Foss <robert.foss@linaro.org>,
 patchwork-lst@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
core with a little bit of SoC integration around it.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../bindings/display/imx/fsl,imx8mp-hdmi.yaml | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
new file mode 100644
index 000000000000..bd9a2b135176
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP DWC HDMI TX Encoder
+
+maintainers:
+  - Lucas Stach <l.stach@pengutronix.de>
+
+description: |
+  The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP.
+
+allOf:
+  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mp-hdmi
+
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    const: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - {}
+      - {}
+      - const: cec
+      - const: pix
+      - const: fdcc 
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    hdmi@32fd8000 {
+        compatible = "fsl,imx8mp-hdmi";
+        reg = <0x32fd8000 0x7eff>;
+        interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+                 <&clk IMX8MP_CLK_HDMI_REF_266M>,
+                 <&clk IMX8MP_CLK_32K>,
+                 <&hdmi_tx_phy>;
+        clock-names = "iahb", "isfr", "cec", "pix";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
+        reg-io-width = <1>;
+    };
-- 
2.30.2

