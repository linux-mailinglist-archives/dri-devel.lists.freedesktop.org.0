Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70863182AC7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5686EA8F;
	Thu, 12 Mar 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 588FF6E9F7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 20:05:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,541,1574089200"; d="scan'208";a="41405016"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 12 Mar 2020 05:05:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1349A40E0C0D;
 Thu, 12 Mar 2020 05:05:02 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: display: Add idk-1110wr binding
Date: Wed, 11 Mar 2020 20:03:39 +0000
Message-Id: <1583957020-16359-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583957020-16359-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1583957020-16359-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add binding for the idk-1110wr LVDS panel from Advantech.

Some panel-specific documentation can be found here:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-LCD-Kit-Modules/model-IDK-1110WR-55WSA1E.htm

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../display/panel/advantech,idk-1110wr.yaml        | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
new file mode 100644
index 0000000..93878c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/advantech,idk-1110wr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Advantech IDK-1110WR 10.1" WSVGA LVDS Display Panel
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: lvds.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: advantech,idk-1110wr
+      - {} # panel-lvds, but not listed here to avoid false select
+
+  data-mapping:
+    const: jeida-24
+
+  width-mm:
+    const: 223
+
+  height-mm:
+    const: 125
+
+  panel-timing: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |+
+    panel {
+      compatible = "advantech,idk-1110wr", "panel-lvds";
+
+      width-mm = <223>;
+      height-mm = <125>;
+
+      data-mapping = "jeida-24";
+
+      panel-timing {
+        /* 1024x600 @60Hz */
+        clock-frequency = <51200000>;
+        hactive = <1024>;
+        vactive = <600>;
+        hsync-len = <240>;
+        hfront-porch = <40>;
+        hback-porch = <40>;
+        vsync-len = <10>;
+        vfront-porch = <15>;
+        vback-porch = <10>;
+      };
+
+      port {
+        panel_in: endpoint {
+          remote-endpoint = <&lvds_encoder>;
+        };
+      };
+    };
+
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
