Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE146182A88
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A006E095;
	Thu, 12 Mar 2020 08:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A6E6E964
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 09:50:52 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so836445plr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gMxAacWfBtp0/RJtSrae2q7ULd3xlhV0qXYwkL9Z+8o=;
 b=W40z0Rg+x5Ajncf+ctlE6UF2o6FvQmCQtnhwJec++Syw6ttaYsDEeI0tcsYThpz0KS
 CJXTStgfNBTY8EQGZx/MkcciN84KKo8Mio7eFViFSdO4GB+YlMa6nMbnWcdftRfhg/qY
 INBdeh3H3COJqX+D52gQY0I7Gjf7ZQYc2Sa74yPtvUPGJAdSlhrOysjZ/QODSC5Sg/Ou
 nKz/Hi3nGO8TV6r5SZrOQK7Da7rU4s46W5P7D/mNZaycGghcoJqiMC0HklhzL+DXhfff
 uq6hT2E3+BQczL9FIK1t7esuB8n3bhPJTjZH0V+DAmv3oogB7jrWV8AjZ/JyMwagi8hk
 2nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gMxAacWfBtp0/RJtSrae2q7ULd3xlhV0qXYwkL9Z+8o=;
 b=NxUNaPuYgmI9ZURAjlKZ/Vd7rKPLVkLJJ6bByt1j82vyZiWNq+l13KW8Et5Leo82/z
 9T149oRck/lsjNCMwR0HmZ0TeBUP7+62kRSmlIb29RooWV644m8DCPpBWGXG4wK2rSPE
 85ZAnYKxGv1ORvdz90rki/UI4BhHGRHztIuwGqyL6lTYFDE47TjZsJO0t2heKQnDIgEa
 tlrT/7W3g8xHSHIWZZkI/wx7uZEc2C8w32S+RfzHbxkWppTB0ndgEwMCHNWmm2HW1Y6a
 xWZDjdla07xgSS0dBWAwh2KBT2cEDBV0Ix/OargZhBXYSP4MXMfIMEvOnb0uoK6yPEih
 UzzA==
X-Gm-Message-State: ANhLgQ1rBoMIfScsncoXGI2sgZyIrsx73ZEpiMopsf4xtyjx1zJ58XNQ
 CBfIjWaqF73ZZsM/QO13lm8=
X-Google-Smtp-Source: ADFU+vv0I7q2bLlo96SUvH8JddfaQ9+6pxLvBrC5NwQyuTElyRJsdv+ONcR8L/mGhopapI04ZQy+7g==
X-Received: by 2002:a17:902:7244:: with SMTP id
 c4mr2373121pll.88.1583920252132; 
 Wed, 11 Mar 2020 02:50:52 -0700 (PDT)
Received: from inforce-server-Z9PE-D8-WS.routereb3c90.com ([106.51.138.45])
 by smtp.gmail.com with ESMTPSA id w25sm49919222pfi.106.2020.03.11.02.50.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Mar 2020 02:50:51 -0700 (PDT)
From: Vinay Simha BN <simhavcs@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/2] dt-binding: Add DSI/LVDS tc358775 bridge bindings
Date: Wed, 11 Mar 2020 15:18:24 +0530
Message-Id: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Vinay Simha BN <simhavcs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add yaml documentation for DSI/LVDS tc358775 bridge

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>

---
v1:
 Initial version
---
 .../bindings/display/bridge/toshiba-tc358775.yaml  | 174 +++++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
new file mode 100644
index 0000000..e9a9544
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/toshiba-tc358775.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+
+title: Toshiba TC358775 DSI to LVDS bridge bindings
+
+maintainers:
+	- Vinay Simha BN <simhavcs@gmail.com>
+
+description: |
+	This binding supports DSI to LVDS bridge TC358775
+
+properties:
+ compatible:
+	const: toshiba,tc358775
+
+ reg:
+   maxItems: 1
+   description: i2c address of the bridge, 0x0f
+
+ tc, dsi-lanes: 1
+   maxItems: 1
+   description: Number of DSI data lanes connected to the DSI host. It should
+  be one of 1, 2, 3 or 4.
+
+ tc, dual-link: 1
+   maxItems: 1
+   description: To configure the LVDS transmitter either as single-link or dual-link.
+
+ vdd-supply:
+   maxItems: 1
+   description:  1.2V LVDS Power Supply
+
+ vddio-supply:
+   maxItems: 1
+   description: 1.8V IO Power Supply
+
+ stby-gpios:
+   maxItems: 1
+   description: Standby pin, Low active
+
+ reset-gpios:
+   maxItems: 1
+   description: Hardware reset, Low active
+
+ ports:
+   type: object
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          DSI Input. The remote endpoint phandle should be a
+	  reference to a valid mipi_dsi_host device node.
+      port@1:
+        type: object
+        description: |
+          Video port for LVDS output (panel or connector).
+
+      required:
+      - port@0
+      - port@1
+
+required:
+ - compatible
+ - reg
+ - dsi-lanes
+ - vdd-supply
+ - vddio-supply
+ - stby-gpios
+ - reset-gpios
+ - ports
+
+examples:
+ - |
+   i2c@78b8000 {
+	/* On High speed expansion */
+	label = "HS-I2C2";
+	status = "okay";
+
+	tc_bridge: bridge@f {
+		status = "okay";
+
+		compatible = "toshiba,tc358775";
+		reg = <0x0f>;
+
+		tc,dsi-lanes = <4>;
+		tc,dual-link = <0>;
+
+		vdd-supply = <&pm8916_l2>;
+		vddio-supply = <&pm8916_l6>;
+
+		stby-gpio = <&msmgpio 99 GPIO_ACTIVE_LOW>;
+		reset-gpio = <&msmgpio 72 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				d2l_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				d2l_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+  };
+
+  panel: auo,b101xtn01 {
+		status = "okay";
+		compatible = "auo,b101xtn01", "panel-lvds";
+		power-supply = <&pm8916_l14>;
+
+		width-mm = <223>;
+		height-mm = <125>;
+
+		data-mapping = "jeida-24";
+
+		panel-timing {
+			/* 1366x768 @60Hz */
+			clock-frequency = <72000000>;
+			hactive = <1366>;
+			vactive = <768>;
+			hsync-len = <70>;
+			hfront-porch = <20>;
+			hback-porch = <0>;
+			vsync-len = <42>;
+			vfront-porch = <14>;
+			vback-porch = <0>;
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&d2l_out>;
+			};
+		};
+ };
+
+  mdss@1a00000 {
+	status = "okay";
+
+	mdp@1a01000 {
+		status = "okay";
+	};
+
+	dsi@1a98000 {
+		status = "okay";
+		..
+		ports {
+			port@1 {
+				dsi0_out: endpoint {
+					remote-endpoint = <&d2l_in>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+		};
+	};
+
+	dsi-phy@1a98300 {
+		status = "okay";
+		..
+	};
+ };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
