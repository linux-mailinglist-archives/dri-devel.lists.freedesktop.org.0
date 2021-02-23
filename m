Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40743323005
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B576EA0D;
	Tue, 23 Feb 2021 17:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201436E995
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 17:56:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c7so6734440wru.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 09:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fz8JrLPMkT7XzSR8iw0swckFELH4bbKO9UQzLaHxj28=;
 b=sgYop5FXxSudUTh7RZpkxYiXIeFsJ4OZAz+iEv+4P1jE3SlvZy4hGFfF9aNU8SGmkO
 7AwRJVwXz3mu8FwpZJGRRXFkVyCfx7HXFgn3lVk8xMuJzMGpdG1QcgEAab9ZhCq7ypYx
 cLveXMybtivlWB+h5qMuWFWZ6lJZrDsxSvkKNqVFWATbE+T3PQOFuWfT4wy6hw7KM8W5
 IJcF511TLwtnHoHTQyZT9kDUZbIIHMwachrknuJJjfdgtMoVg9+yPMuOdeLEjn33CVcQ
 Ye3r70UxQB76peeHP5iJmh30LLfX/s9zowIyK02hA1aSgZts3/Vb+zCZ4dlNByxlzA91
 fTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fz8JrLPMkT7XzSR8iw0swckFELH4bbKO9UQzLaHxj28=;
 b=FT2O798CP1+OWvb14n5SM3JXThAd9hUFHbqKBaPgkgek3SDBLOxc5cZwVSkuU1NfuP
 aiS3wQr735sKtvKSL9AokCUBWQqJM4UGaAE+BPBx8NCQbCrgE9/7GSqmdKeSHMfIJJzS
 /A/udVENIuqc9CTOugKEltc1Ix5OEKcHyjqTm7Q8bj4g2rDQ5BGEQy//g+5NZwMHiQjK
 zK3IWIJ7cSRF/MeAyckIQZkCSATlpDk0izNC1idNMTzcTdsTQWeTloRw7U1rRVp4lmc0
 A0fKTSTg2w8WxzbA7Yq5smayNUfmE+vAvUpAVU54p5zc6dy2IzEj9RTpvtvlGw3vbfcU
 aclg==
X-Gm-Message-State: AOAM533RwIq4pyaTuJEu8kNVMK50or0J5kufmv7pgozUK2i0hREk/ESF
 8nrLGgiw8om+ZbDefJgiAwM=
X-Google-Smtp-Source: ABdhPJzjcIFilXskzGrhtEqfLv7/lVpHTYUnrt7FdEsPWWoPRLWjZWGinAOiZSuomQE1Tf7036xDWQ==
X-Received: by 2002:adf:c101:: with SMTP id r1mr27793261wre.38.1614102973856; 
 Tue, 23 Feb 2021 09:56:13 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb0008bd270084c09ff22cc10cb2.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:84c0:9ff2:2cc1:cb2])
 by smtp.gmail.com with ESMTPSA id g9sm2779815wrp.14.2021.02.23.09.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 09:56:13 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v4 1/2] dt-bindings: display: bridge: Add documentation for
 LT8912
Date: Tue, 23 Feb 2021 18:56:06 +0100
Message-Id: <20210223175607.431796-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223175607.431796-1-adrien.grassein@gmail.com>
References: <20210223175607.431796-1-adrien.grassein@gmail.com>
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
index 16ada1a4b751..1e4d49f9dfea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10460,6 +10460,11 @@ S:	Maintained
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
