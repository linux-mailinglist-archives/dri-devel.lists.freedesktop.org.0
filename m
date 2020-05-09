Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5D1CD247
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150E66E200;
	Mon, 11 May 2020 07:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 528 seconds by postgrey-1.36 at gabe;
 Sat, 09 May 2020 11:27:01 UTC
Received: from pruto.48.io (48.io [IPv6:2a01:430:17:1::ffff:361])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930126E33A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 11:27:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pruto.48.io (Postfix) with ESMTPSA id 8B55A94C8D;
 Sat,  9 May 2020 13:18:10 +0200 (CEST)
DMARC-Filter: OpenDMARC Filter v1.3.2 pruto.48.io 8B55A94C8D
Authentication-Results: pruto.48.io;
 dmarc=none (p=none dis=none) header.from=48.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=48.io; s=default;
 t=1589023090; bh=D3x6JnWefErO/TazipsOhJ7MREKFaWlPTxw8f1HkRrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=x6raWZpoEGEB1rMVVeudi3uDHkbdRcFBR3qdMfM94S2C+ipI5PRt8XPBWFQs7A65Z
 vX/YBgWpdK1EA+XdZV+W5yBx07ICHMsKIse+QhdqRwgplK+qCb3zqTHGklCV2Uh6/B
 JQYCGPudiqzcw+cABjV8xybSohSW5Nj30x3VZ68o=
From: srk@48.io
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/2] dt-bindings: it6251: add bindings for IT6251 LVDS-to-eDP
 bridge
Date: Sat,  9 May 2020 13:17:31 +0200
Message-Id: <20200509111732.26102-2-srk@48.io>
In-Reply-To: <20200509111732.26102-1-srk@48.io>
References: <20200509111732.26102-1-srk@48.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Richard Marko <srk@48.io>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Cross <xobs@kosagi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Vasut <marex@denx.de>

Add DT bindings for ITE IT6251 LVDS-to-eDP bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Marko <srk@48.io>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sean Cross <xobs@kosagi.com>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 .../bindings/display/bridge/ite,it6251.yaml   | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml
new file mode 100644
index 000000000000..8daa44a30fa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it6251.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT6251 LVDS-to-eDP bridge bindings
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+  - Richard Marko <srk@48.io>
+
+description: |
+  The IT6251 is a high-performance single-chip
+  De-SSC LVDS to DisplayPort converter.
+  Combined with LVDS receiver and DisplayPort Transmitter,
+  the IT6251 supports LVDS input and DisplayPort 1.1a
+  output by conversion function.
+
+properties:
+  compatible:
+    const: ite,it6251
+
+  reg:
+    items:
+      - description: I2C address of the bridge
+      - description: I2C address of the LVDS part
+
+  reg-names:
+    items:
+      - const: bridge
+      - const: lvds
+
+  ports:
+    type: object
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
+         Video port for eDP output (typically panel).
+
+      port@1:
+        type: object
+        description: |
+          Video port for LVDS input.
+
+    required:
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+  power-supply: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    it6251@5c {
+      compatible = "ite,it6251";
+      reg = <0x5c>, <0x5e>;
+      reg-names = "bridge", "lvds";
+      power-supply = <&reg_display>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          bridge_out_edp0: endpoint {
+            remote-endpoint = <&panel_in_edp0>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          bridge_in_lvds0: endpoint {
+            remote-endpoint = <&lvds0_out>;
+          };
+        };
+      };
+    };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
