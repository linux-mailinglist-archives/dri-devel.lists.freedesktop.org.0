Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17231B5DB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 09:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF05E89EA6;
	Mon, 15 Feb 2021 08:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5656E141
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 23:29:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v14so6987917wro.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 15:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aw8ty2wXr4VPQmYPtx+i4SbemanGMqMFf7qDwvUHAcY=;
 b=kyS/zjLIaA4Xyi31w6fC/LWgjEjk0CbM0smn7HRs6oUAXeQ0WC7GU0lXoENHK8JOki
 T+4jBG8cH2692tBdMIHDZTZhi9trtAJAYLMSFRTHMZ+XwQPPPeNk29XSciRz8/BsSePr
 DGgSgv8tC55WYSIVmQUTEnzeyech5tNLT19jy6+hLIZ+Tg2Ev3RYNFipNlD3clbJbP4K
 CvRkN6qM1Q7lET3NZe0/zS87Qz9u7hB24kuaaY3hF5SKC9eyoGhy3IELgbT0iBmw483N
 8jW4KCbNB6DWooOeA5rVC8/5UwqXSdEFAOBUNUWh1KioodvoXCinS2bRPuDp31Ng3928
 AsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aw8ty2wXr4VPQmYPtx+i4SbemanGMqMFf7qDwvUHAcY=;
 b=HLE6NfIDa70JtDaTETpxqzhZvYaW8k3kAlE45/lRUi/35z543Fi+G+o2dZmwCCHJ4c
 ZDzYRIO6uhbkh1MfvMnMr9LTbhLXgSeUpoHGN9GjOfYdPM07Kr4hcDEdYutyQZFwOeYj
 TiBjvpcvjC+WSPKjXMsJgUzs1r08y17LHkG+mIFEWdBrusv1B/gT6NEaTcCcRJWOjhsB
 kDQdOQXA0wxRLWvtrib9h7aGyi2abBiISS2eZ7IeLpxpiOMfyFdNcXwfgEW7Phd+eZ1k
 vUicJ4tg78eWcuU0w/x9DD+COM6jGZamo1pKnGdO5/aFrltSJic7JHVcj4BLB/w4FQ05
 4yWg==
X-Gm-Message-State: AOAM530znDtsne3Z7TGp67/eZuMgv+/EQQoTF4o3SjwffIRPuxs0enV0
 2poGvq8xLN58duOqpagP3JE=
X-Google-Smtp-Source: ABdhPJzkgpc3l414YEG22Lt1GZcwXH8hUIy+zVLw+PsXB2EXZtYTMTEM9HWRlCLBL9gmB1MwyepC5Q==
X-Received: by 2002:adf:e411:: with SMTP id g17mr16712145wrm.250.1613345378428; 
 Sun, 14 Feb 2021 15:29:38 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700341b9a8437bdab47.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:341b:9a84:37bd:ab47])
 by smtp.gmail.com with ESMTPSA id l1sm19522478wmq.17.2021.02.14.15.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 15:29:38 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: Add documentation for
 LT8912
Date: Mon, 15 Feb 2021 00:29:03 +0100
Message-Id: <20210214232904.1142706-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210214232904.1142706-1-adrien.grassein@gmail.com>
References: <20210214232904.1142706-1-adrien.grassein@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Feb 2021 08:22:01 +0000
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
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium LT8912 is a DSI to HDMI bridge.

Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
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
index c38651ca59a5..f010b485aa7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10440,6 +10440,11 @@ S:	Maintained
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
