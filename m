Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55C631F1D8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 22:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567186EA63;
	Thu, 18 Feb 2021 21:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74786EA60
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 21:05:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v15so4488675wrx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 13:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t5l3d0kDf23czhBRFA0lvtKtXerTBefqvKS8i3dJCWU=;
 b=Z5XGtDzHTKI+5lFCoQSYoEWYd8AImrB9jQbPADHzlHLjYXlRBkDgNcBRxX0/pKCasg
 eBrOj+2QAjk2pPzEtfyWiqUodpQLlQQkStx7QmUxqKdhR32EiILcnA4e4IQM+CfujeHN
 tRAXgO2dh+Wfm1tep+ZUZ2BB/9BkJ9ww5jLMWgvyoLeENdU9dwKJfOZcy81CJhPjPEVa
 7utR/SalGJTHu63v/8RKYRI1PDXO8bHgIzd5wF7b5cjNKdKTOp2oUIrcn0+HFRpM/FLU
 /nYYX6ZJFuaEPPyNTcs9nAgPrp2wsPZKqQlLH1IB3LrJRxBWFmiI80XSQGvAJjJIm0mp
 y3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5l3d0kDf23czhBRFA0lvtKtXerTBefqvKS8i3dJCWU=;
 b=C3q3uQUSGXjD/NgYbPj6oMRzK6IJyd18yWlhqQ4w+ANTkNsCtdKahrqdX4TeTeGnE8
 K4tVEvbJYnIfK6UNVHG4cS/cSOgXSvHnWc9Qn/JT0fUfGUv1jzjC0wfJZY+KD2yvi3sS
 Fu+zwZVNRSwLSYQAbrkCHcEEiZ/vvhOev5t+Zh0a21Joc1iVujrQX+kRLR6M54wzW4Oc
 KQgvXI++umS5W9AzpDOHb7EiPqqQ85rpyQ68zKLTQEMxXm7z+Vc5vyERZSRx6Gi/Uf3g
 tUG2QXI1UcywLFcMMXauLEfTV7xxISNbt1OSWm2kV3ctLX8LIlOh1NuWcHztTg8mCnRx
 6WMA==
X-Gm-Message-State: AOAM533GVRcXqJSXfitK2H5QPl8LLIFj6nPO9ECY43nZlcfdX2L94QJb
 UOUaJXjOR7qjj+xNpJgUOO4=
X-Google-Smtp-Source: ABdhPJxREHMt9IqKQ257TRA9q2IA1QCdZQHJer3SjM5Cw3TxTt2bjueefVM0GK4PeQgX/g6SvCzFcw==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr5956557wrt.67.1613682316534;
 Thu, 18 Feb 2021 13:05:16 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb0008bd270040b01df6f3b9f578.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:40b0:1df6:f3b9:f578])
 by smtp.gmail.com with ESMTPSA id m2sm8450878wml.34.2021.02.18.13.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 13:05:16 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Add documentation for
 LT8912
Date: Thu, 18 Feb 2021 22:05:03 +0100
Message-Id: <20210218210504.375752-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218210504.375752-1-adrien.grassein@gmail.com>
References: <20210218210504.375752-1-adrien.grassein@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Feb 2021 21:55:23 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium LT8912 is a DSI to HDMI bridge.

Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/bridge/lontium,lt8912.yaml        | 102 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
new file mode 100644
index 000000000000..1e5a2ad5eb47
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt8912.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT8912 MIPI to HDMI Bridge
+
+maintainers:
+  - Adrien Grassein <adrien.grassein@gmail.com>
+
+description: |
+  The LT8912 is a bridge device which convert DSI to HDMI
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt8912
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active high RESET pin.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI port for MIPI input
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          HDMI port, should be connected to a node compatible with the
+          hdmi-connector binding.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c4 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hdmi-bridge@48 {
+        compatible = "lontium,lt8912";
+        reg = <0x48>;
+        reset-gpios = <&max7323 0 GPIO_ACTIVE_LOW>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            hdmi_out_in: endpoint {
+              data-lanes = <0 1 2 3>;
+              remote-endpoint = <&mipi_dsi_out>;
+            };
+          };
+
+          port@1 {
+              reg = <1>;
+
+              endpoint {
+                  remote-endpoint = <&hdmi_in>;
+              };
+          };
+        };
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad16d3bb517..5d1ed281cd41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10458,6 +10458,11 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
 F:	drivers/hid/hid-lg-g15.c
 
+LONTIUM LT8912 MIPI TO HDMI BRIDGE
+M:	Adrien Grassein <adrien.grassein@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
+
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
 M:	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
