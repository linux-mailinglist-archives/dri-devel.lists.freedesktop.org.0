Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834A7197528
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2953E6E130;
	Mon, 30 Mar 2020 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390B489B45
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 17:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503530;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=P47J+ydCJh3kFopP2+/EUJrxkdjk/F2qOhW+JzxmQP4=;
 b=qbSvj0ueZZTV+Ye31JtvhjdUdr8AcETBe6i0NJsTcLMUNavEdfXaOpsYjr/Yz3+pq+
 rS4/J1yIw11rEt5LwBGqxjNWpXeP1u9MLf2F0xEcBUencUeV/qHCt85pZmBkuvqTtjYy
 1I2XUoz4pEHrcIP3iRbE2PTXnM12FA+3LCkeikO4Opt+I3U6C1WnNJPBBx2foKuRpiew
 83ukkFy3SmkMjBnOy4+z8U6ll7YWWy8AoUtX9+Cv1zgpMqS+u743WQ+rKQ7mh3mVROUA
 VTIbnHPH+4FoU5Pwlf8oXgUm4Eep4WRKhijNRxs3imvwTBX/iEa4CdbJsLzChTqzv8E+
 RpCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id m02241w2THcRBMj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 29 Mar 2020 19:38:27 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v5 1/8] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Date: Sun, 29 Mar 2020 19:38:19 +0200
Message-Id: <000359713a45bb1a1adc0b609e4e659aedf99e6c.1585503505.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503505.git.hns@goldelico.com>
References: <cover.1585503505.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
 Philipp Rossak <embed3d@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Imagination PVR/SGX GPU is part of several SoC from
multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
Allwinner A83 and others.

With this binding, we describe how the SGX processor is
interfaced to the SoC (registers, interrupt etc.).

In most cases, Clock, Reset and power management is handled
by a parent node or elsewhere (e.g. code in the driver).

Tested by make dt_binding_check dtbs_check

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
new file mode 100644
index 000000000000..aadfb2d9b012
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination PVR/SGX GPU
+
+maintainers:
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |+
+  This binding describes the Imagination SGX5 series of 3D accelerators which
+  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
+  Allwinner A83, and Intel Poulsbo and CedarView and more.
+
+  For an extensive list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
+
+  The SGX node is usually a child node of some DT node belonging to the SoC
+  which handles clocks, reset and general address space mapping of the SGX
+  register area.
+
+properties:
+  compatible:
+    oneOf:
+      - description: SGX530-121 based SoC
+        items:
+          - enum:
+            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora 600MHz and similar
+          - const: img,sgx530-121
+          - const: img,sgx530
+
+      - description: SGX530-125 based SoC
+        items:
+          - enum:
+            - ti,am3352-sgx530-125 # BeagleBone Black
+            - ti,am3517-sgx530-125
+            - ti,am4-sgx530-125
+            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04, OpenPandora 1GHz and similar
+            - ti,ti81xx-sgx530-125
+          - const: ti,omap3-sgx530-125
+          - const: img,sgx530-125
+          - const: img,sgx530
+
+      - description: SGX535-116 based SoC
+        items:
+          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
+          - const: img,sgx535-116
+          - const: img,sgx535
+
+      - description: SGX540-116 based SoC
+        items:
+          - const: intel,medfield-gma-sgx540 # Atom Z24xx
+          - const: img,sgx540-116
+          - const: img,sgx540
+
+      - description: SGX540-120 based SoC
+        items:
+          - enum:
+            - ingenic,jz4780-sgx540-120 # CI20
+            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and similar
+          - const: img,sgx540-120
+          - const: img,sgx540
+
+      - description: SGX544-112 based SoC
+        items:
+          - const: ti,omap4-sgx544-112
+          - const: img,sgx544-112
+          - const: img,sgx544
+
+      - description: SGX544-116 based SoC
+        items:
+          - enum:
+            - allwinner,sun8i-a83t-sgx544-116 # Banana-Pi-M3 (Allwinner A83T) and similar
+            - ti,dra7-sgx544-116 # DRA7
+            - ti,omap5-sgx544-116 # OMAP5 UEVM, Pyra Handheld and similar
+          - const: img,sgx544-116
+          - const: img,sgx544
+
+      - description: SGX545-116 based SoC
+        items:
+          - const: intel,cedarview-gma3600-sgx545 # Atom N2600, D2500
+          - const: img,sgx545-116
+          - const: img,sgx545
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu: gpu@fe00 {
+      compatible = "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544";
+      reg = <0xfe00 0x200>;
+      interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
