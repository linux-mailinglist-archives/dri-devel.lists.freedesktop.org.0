Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC1BCF985
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D83710E336;
	Sat, 11 Oct 2025 17:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="VIKBhS9b";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xaWL2zvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8121810E33C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:10 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckVMF2VNpz9stk;
 Sat, 11 Oct 2025 19:04:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxo7qyJjIMTsU/zyVaLPBmGiXTVYD1zzMv1jDaG3HZQ=;
 b=VIKBhS9bEiBjHnhQxwRf8TRdjqW2lMxFfJ2R69vj7xhyrtad+4x4rkNiCjlVn4HXWbfgxi
 JNwD6gS5okMoY3coqfqHnEcNTQsS/nPiOGML9vaAn8TBJ5sM/IcCn4CcWRLCi0u39VCxU0
 dgzloH5f0e4QcNTMm2R0f+PvFmDU1134MbGbZ4Y6KPV49rycJ2PuW8Meu2MnwHgeef8nV9
 k2KIVwI0dEd9WNks3iTiCTGmHWboWtEIJudU0Z6CurOps8PVJKGzFhnCpsHInRCOuabt+H
 R3ggjUUX9DutDrf+m0K+zziAaVgvJ3QkDjxpBiC3IWBxO/GGj6yDQ4YC8rvk6A==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xaWL2zvr;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxo7qyJjIMTsU/zyVaLPBmGiXTVYD1zzMv1jDaG3HZQ=;
 b=xaWL2zvr/dMcOzeva3JAPRU9oyXVuiscZJqtWfl1q8bYqzIf8vCUDJINW/ylcmg4lKZSQk
 9r4J3wuCV5f6VGcAITfBUlreE0bmtb/bftrZnMfp9tyh9ucyEaUMVHsVblvbgOO98px8Iv
 z7q+BxIRSc5MFSGvWAM3WdSVdKeOTAmjiMYF7ngmsZPlqtIs4Ku0cEGeiP4eHWPVOmnctl
 Ur8iEL0JOe9lTEk7jWuHeFToEyc6CK3DiyJJ3XhMOAIwQ0dB9Sb05OFzab2AiSxSd2AM57
 zo8WQ854ZBaD9lO/Nk8wVYluXCEtEGdbO/NDGbqWfw3ZaHHMall/q0Us2uRK7A==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 27/39] dt-bindings: display: bridge: Document NXP i.MX95 pixel
 link support
Date: Sat, 11 Oct 2025 18:51:42 +0200
Message-ID: <20251011170213.128907-28-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: e1iik1smz9zfisk8yowoonbfo69cicwa
X-MBO-RS-ID: cecf55de22ea7313ca3
X-Rspamd-Queue-Id: 4ckVMF2VNpz9stk
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

Document NXP i.MX95 pixel link bridge support.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../display/bridge/fsl,imx95-pixel-link.yaml  | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml
new file mode 100644
index 0000000000000..b37888adfa45e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx95-pixel-link.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 Display Pixel Link
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+description: |
+  The Freescale i.MX95 Display Pixel Link (DPL) forms a standard
+  asynchronous linkage between pixel sources (display controller
+  or camera module) and pixel consumers(imaging or displays).
+  It consists of two distinct functions, a pixel transfer function
+  and a control interface. Multiple pixel channels can exist per one
+  control channel. This binding documentation is only for pixel links
+  whose pixel sources are display controllers.
+
+  The i.MX95 Display Pixel Link is accessed via syscon.
+
+properties:
+  compatible:
+    const: fsl,imx95-dc-pixel-link
+
+  fsl,dc-stream-id:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      u8 value representing the display controller stream index that the pixel
+      link connects to.
+    enum: [0, 1]
+
+  fsl,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to Control and Status Registers (CSR) module.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The pixel link input port node from upstream video source.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The pixel link output port node to downstream bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - fsl,dc-stream-id
+  - fsl,syscon
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dc0-pixel-link0 {
+        compatible = "fsl,imx95-dc-pixel-link";
+        fsl,dc-stream-id = /bits/ 8 <0>;
+        fsl,syscon = <&dispmix_csr>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* from DC 0 pixel interleaver channel0 */
+            port@0 {
+                reg = <0>;
+
+                dc0_pixel_link0_dc0_pixel_interleaver_ch0: endpoint {
+                    remote-endpoint = <&dc0_pixel_interleaver_ch0_dc0_pixel_link0>;
+                };
+            };
+
+            /* to MIPI/LVDS combo subsystems */
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
+                };
+
+                dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
+                };
+            };
+        };
+    };
-- 
2.51.0

