Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC87A5A67
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A4D10E38A;
	Tue, 19 Sep 2023 07:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-214.mta1.migadu.com (out-214.mta1.migadu.com
 [95.215.58.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6155B10E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 13:00:30 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695042028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5G1aT+AHi7jek6Uf/y5TeohqhmCW5n4KHyN+Nw2tzQ=;
 b=bun50opM5dimzLsCGjkw0y6gEd/JNoD69i4kGYHbMosSzIWcI6JEbEe3YOPdIkVMtmlYMc
 eHk5W2A6fZmjDuawkH3jAU2G1rjte6655tRV/3p/gvxH7aMLbwULpSUc55a04VxZ69jdGT
 EgQjHwChB8NVupEWTmUQH52l8To57xkrOsawTvyWNxCpyRLJDvydVoiEvIylak4iT32pEC
 OktAc0d2GpWkM67mx8BO4YJxMmjRucC41ecehCnulaDNxK7DHeKu99aoqbAuvcCPFkuIkT
 iLV9vaq+5JWP/nYqeMFUy8wIqO5gVitcquNkVyfdnWkDzgUPwunWYIqZ2LQsLQ==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 9/9] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Date: Mon, 18 Sep 2023 22:58:53 +1000
Message-ID: <20230918125853.2249187-10-contact@jookia.org>
In-Reply-To: <20230918125853.2249187-1-contact@jookia.org>
References: <20230918125853.2249187-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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

