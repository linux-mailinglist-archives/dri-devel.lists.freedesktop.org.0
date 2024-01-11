Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2550282AC30
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F94210E88D;
	Thu, 11 Jan 2024 10:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406AD10E87A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:41:23 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40B68LIM021183; Thu, 11 Jan 2024 11:41:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=Bp9/DIei7Z2/dCS/yFRvVxYRRRLhHsJ5VlO2HEqw2KA=; b=4X
 qhWSNd+8hKbci6JlLoKAfhZUzV3swbg/UeWMWonG7izKp/t51wpPQQ/YuI3LScNT
 Qlppl2YadzV008FJlKMYsLtspx97m2SvA8MV6AAQjvS6XU9utjrrXD8fHgiGd7lW
 7foASDRRSrSt2JJtodunL/yX3nQlgM+xJJqrzzGqbTaY9IT1s/kJiz4byJkWRHSV
 6xRrb23ssQGpv8jaaOZCpDPPcBf3CHDnYv4UnbCuyuOTZJLCO+w/aBTSbutPyhXG
 sacoJ5g6/dB1TmCDAQySo0c9JWz65dVMrMXBG86ALzovjVf7PDcfovi5LqxilvN6
 W50GozvQ46Q3R8lIvCwg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vfha4tvp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 11:41:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A38710002A;
 Thu, 11 Jan 2024 11:41:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2B672309DD;
 Thu, 11 Jan 2024 11:41:05 +0100 (CET)
Received: from localhost (10.252.29.122) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Jan
 2024 11:41:05 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 1/6] dt-bindings: display: add dt-bindings for STM32 LVDS
 device
Date: Thu, 11 Jan 2024 11:40:44 +0100
Message-ID: <20240111104049.38695-2-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240111104049.38695-1-raphael.gallais-pou@foss.st.com>
References: <20240111104049.38695-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.29.122]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add "st,stm32-lvds" compatible.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v2:
	- Switch compatible and clock-cells related areas
	- Remove faulty #include in the example.
	- Add entry in MAINTAINERS
---
 .../bindings/display/st,stm32-lvds.yaml       | 117 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/st,stm32-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
new file mode 100644
index 000000000000..8dfc6e88f260
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/st,stm32-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 LVDS Display Interface Transmitter
+
+maintainers:
+  - Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
+  - Yannick Fertre <yannick.fertre@foss.st.com>
+
+description: |
+  The STMicroelectronics STM32 LVDS Display Interface Transmitter handles the
+  LVDS protocol: it maps the pixels received from the upstream Pixel-DMA (LTDC)
+  onto the LVDS PHY.
+
+  It regroups three sub blocks:
+    - LVDS host: handles the LVDS protocol (FPD / OpenLDI) and maps its input
+      pixels onto the data lanes of the PHY
+    - LVDS PHY: parallelize the data and drives the LVDS data lanes
+    - LVDS wrapper: handles top-level settings
+
+  The LVDS controller driver supports the following high-level features:
+    - FDP-Link-I and OpenLDI (v0.95) protocols
+    - Single-Link or Dual-Link operation
+    - Single-Display or Double-Display (with the same content duplicated on both)
+    - Flexible Bit-Mapping, including JEIDA and VESA
+    - RGB888 or RGB666 output
+    - Synchronous design, with one input pixel per clock cycle
+
+properties:
+  compatible:
+    const: st,stm32-lvds
+
+  "#clock-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB peripheral clock
+      - description: Reference clock for the internal PLL
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          LVDS input port node, connected to the LTDC RGB output port.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          LVDS output port node, connected to a panel or bridge input port.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp25-clks.h>
+    #include <dt-bindings/reset/stm32mp25-resets.h>
+
+    lvds: lvds@48060000 {
+        compatible = "st,stm32-lvds";
+        reg = <0x48060000 0x2000>;
+        #clock-cells = <0>;
+        clocks = <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
+        clock-names = "pclk", "ref";
+        resets = <&rcc LVDS_R>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds_in: endpoint {
+                   remote-endpoint = <&ltdc_ep1_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                lvds_out0: endpoint {
+                   remote-endpoint = <&lvds_panel_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9d959a6881f7..0b6ec5347195 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7193,6 +7193,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+F:	Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
 F:	drivers/gpu/drm/stm
 
 DRM DRIVERS FOR TI KEYSTONE
-- 
2.25.1

