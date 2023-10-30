Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF87DB4C7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD9110E228;
	Mon, 30 Oct 2023 08:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [IPv6:2001:41d0:203:375::b2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED5110E220
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 07:25:12 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1698650709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhEQ1dqgKvz3w9QUVhZNxp0xbOiz8esdacL61UcOl+o=;
 b=YUTRiIDO6c4V47NTDewFxsIKZNafI3YGUUBiwbJzBLE00aC+Q2CABGQN9scYF9ig2XerDs
 /yX90oyP2rdtnu7Z25m6w+kiboDt3jhV8o6QFugs2rkFktszKNte13tyGVlHbqNJyAdJ0n
 jIfK4FcckJuDe22wj74xHJ7XAQZ4pJpHbseh4hD9TGPeGm/PbTUuv0RMlaiFqi9VZXok7q
 D2Z9kRpKfVrDUqyK/3mOocJIPlPclW6i3ijo6ODOYyivYhhUFOcnOdotZ9KYMpQb89Snn0
 5RP1WkFqwfyzKa90oKMIzklDkFoZ8m2Hi5Z8CzJpNDJ5tIUsyl31/tSWi1bcOg==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v4 7/7] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Date: Mon, 30 Oct 2023 18:23:38 +1100
Message-ID: <20231030072337.2341539-9-contact@jookia.org>
In-Reply-To: <20231030072337.2341539-2-contact@jookia.org>
References: <20231030072337.2341539-2-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 30 Oct 2023 08:06:21 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, John Watts <contact@jookia.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
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

