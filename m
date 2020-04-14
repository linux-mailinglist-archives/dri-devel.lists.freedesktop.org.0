Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E614E1A8F2E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 01:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9E26E5D5;
	Tue, 14 Apr 2020 23:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 337 seconds by postgrey-1.36 at gabe;
 Tue, 14 Apr 2020 23:35:19 UTC
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD266E5D2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 23:35:19 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A98DFC00DE;
 Tue, 14 Apr 2020 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586906982; bh=tNu4Scr083t5TpR/FgPDRPLMswuTZmLX+MVL6F246l8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ld35b5F/22iSy4ujhnk9XA69Db+XLvF8r5GbDNw98Ky+EapwNFKzH6fWXathYC/sd
 rpPjVxISeXcG5TnQTtGdyV9gzCDHkmjgz34PUtX4FlLQ4OKUSGFSHGWB1Sg4iy2sbl
 ujG33FON9BrY8B1ZFAEMrwsIDnDw8XfxYjezBSyha4WU1fPyI9SCuOm6V4y0HAh61b
 2s0D13KGqKpwCM50sAH96yO0+psKlMkUW4r6s90y8cXWyhat2yCn7Ar/qs5SKn9jXx
 z2kTa9LlODtCZQZjDFgk3B6iWP8ZzFmRNP5AkQWLLGuv5RUqvhtKVyMk7l8I4lAS6L
 vVd3Cu7zPminw==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.48.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id E28A5A0063;
 Tue, 14 Apr 2020 23:29:38 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 2/2] dt-bindings: Document the Synopsys ARC HDMI TX bindings
Date: Wed, 15 Apr 2020 02:29:29 +0300
Message-Id: <20200414232929.22788-3-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
References: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-snps-arc@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds documentation of device tree bindings for the Synopsys
HDMI 2.0 TX encoder driver for ARC SoCs.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 .../display/bridge/snps,arc-dw-hdmi.yaml      | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
new file mode 100644
index 000000000000..9b2fdfecd5b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/snps,arc-dw-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare HDMI 2.0 TX encoder driver
+
+maintainers:
+  - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+
+description: |
+  The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP
+  with a companion of Synopsys DesignWare HDMI 2.0 TX PHY IP.
+
+  These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
+  Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
+  with the following device-specific properties.
+
+properties:
+  compatible:
+    const: snps,arc-dw-hdmi-hsdk
+
+  reg:
+    maxItems: 1
+    description: |
+      Memory mapped base address and length of the DWC HDMI TX registers.
+
+  clocks:
+    items:
+      - description: The bus clock for AHB / APB
+      - description: The internal register configuration clock
+
+  clock-names:
+    items:
+      - const: iahb
+      - const: isfr
+
+  interrupts:
+    maxItems: 1
+    description: Reference to the DWC HDMI TX interrupt
+
+  reg-io-width:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 4]
+        description: |
+          Width of the registers specified by the reg property. The
+          value is expressed in bytes and must be equal to 1 or 4 if specified.
+          The register width defaults to 1 if the property is not present.
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description: |
+          Video input endpoints of the controller.
+          Usually it is associated with ARC PGU.
+
+      port@1:
+        type: object
+        description: |
+          Output endpoints of the controller. HDMI connector.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi@10000 {
+        compatible = "snps,arc-dw-hdmi-hsdk";
+        reg = <0x10000 0x10000>;
+        reg-io-width = <4>;
+        interrupts = <14>;
+        clocks = <&apbclk>, <&hdmi_pix_clk>;
+        clock-names = "iahb", "isfr";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                hdmi_enc_input: endpoint {
+                    remote-endpoint = <&pgu_output>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                hdmi_enc_out: endpoint {
+                    remote-endpoint = <&hdmi_con>;
+                };
+            };
+        };
+    };
+
+    hdmi-out {
+        port {
+            hdmi_con: endpoint {
+                remote-endpoint = <&hdmi_enc_out>;
+            };
+        };
+    };
+
+    pgu {
+        port_o: port {
+            pgu_output: endpoint {
+                remote-endpoint = <&hdmi_enc_input>;
+            };
+        };
+    };
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
