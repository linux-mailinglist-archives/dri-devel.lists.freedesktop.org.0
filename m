Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF97AD20E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109FD10E20F;
	Mon, 25 Sep 2023 07:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-190.mta1.migadu.com (out-190.mta1.migadu.com
 [IPv6:2001:41d0:203:375::be])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01E10E1C2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 02:12:01 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695607919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhEQ1dqgKvz3w9QUVhZNxp0xbOiz8esdacL61UcOl+o=;
 b=reLviE8eY03Zixne93aJYjmlNnoeKH3LZ7mp6VsZHKBJPOc9sKjWVPwEFW3s/4NENAjZW8
 deain8KjDdxO8t7euO5BpC0nX+tduW1A7cUFDILo6X9gQ80H8zliAQH+Ztk1O4ROyg73UJ
 54pJspsixPhbOEElPzb4l94W8GodS+ejKgyLe57267wK011zlpqD/yI08N+DNLt8KiaP6Q
 pG5ePA7/BwT/nsX6BhG01wc8F76Q5GsUt7uUWqupdyStwXj9LM5F3AjerqhzJbDBI6kSZl
 qTPbUemZr6Oe6HeGCfvo6saHRrIpN3X+MjWFf2u/h3IbDQab1bpH8kzypWy8EQ==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 7/7] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Date: Mon, 25 Sep 2023 12:10:58 +1000
Message-ID: <20230925021059.451019-8-contact@jookia.org>
In-Reply-To: <20230925021059.451019-1-contact@jookia.org>
References: <20230925021059.451019-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 25 Sep 2023 07:43:28 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 John Watts <contact@jookia.org>, Rob Herring <robh+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a small 3.5" 640x480 IPS LCD panel.

Signed-off-by: John Watts <contact@jookia.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/fascontek,fs035vg158.yaml   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml b/Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml
new file mode 100644
index 000000000000..d13c4bd26de4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/fascontek,fs035vg158.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fascontek FS035VG158 3.5" (640x480 pixels) 24-bit IPS LCD panel
+
+maintainers:
+  - John Watts <contact@jookia.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: fascontek,fs035vg158
+
+  spi-3wire: true
+
+required:
+  - compatible
+  - reg
+  - port
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "fascontek,fs035vg158";
+            reg = <0>;
+
+            spi-3wire;
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+            power-supply = <&vcc>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
+                };
+            };
+        };
+    };
-- 
2.42.0

