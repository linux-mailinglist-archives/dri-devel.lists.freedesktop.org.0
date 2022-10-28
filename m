Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F813611BD5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 22:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454EF10E8D8;
	Fri, 28 Oct 2022 20:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA4C10E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 20:50:17 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so3642284otp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 13:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVTQdW/tfDHRh/TCdE4iVdi/g1MuzKivPgDmxM+3q+A=;
 b=kxmEUxwY93dZM/R2RJIk2GfdCKBU8jjUPE1wgYiRp6fXyNRme4G9Rn/D0orL/U2F4m
 T3o9hWzBI8Umn+AGORmwsGrrerMXHavJZKc3chNsokJzznF5kZm74YwyNRdiCF99y6bf
 uJUtj0cZvJLJnC/9YPFlASiz1l5hSyMf247MjO6mgZb+lWiZfZMSCnshQkRUrHKQww2/
 39PGgXdUt6qBjMfWVgDQ2OUUYxcyjrORXqEMTpBqL1+NPZgOMYsxrLhZQi7uOWqHIfTA
 6gyFiASITXvnIzpwvgk5Le5NhsVEMim4xCRhG2p5ADoOdNATzTA69xqKrYyjNIXusQUj
 kB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVTQdW/tfDHRh/TCdE4iVdi/g1MuzKivPgDmxM+3q+A=;
 b=jHV/f3bKfefW9Zi1g3F4vFBFBE+aWzPq1JsedM2k7oZVSSKp3vk6XKHc2agyQwjOzL
 uiQtp5s4CBG4+oRTuguF0ErQiS2uBjydC0kSRqpv365+sTW+w6jmPlo+OOf7EupoJZsb
 knLYGy7dUqNu0wnH/WsYBwIqvLMkfTCT4CQVO4EgbSmwnlIbEnW17J+jlrGSkrlljtSK
 FxT8Sa3SVxaLVpQN2slMs5+QnFlcOSDYnn24qFJwAXNBPghyqotdYcGUYpyYe0YrZgaf
 eazy9FtTv7rfJ5KXvZNNoXuLpjCwc3MTP8WDzOE5UGzLpUgByk/qehz/V4rOVJZ/N3kG
 RQUA==
X-Gm-Message-State: ACrzQf3Lr6Wm1zsKJbSHCQrE0nv7GG3a9wnna7OG8uzEGMpihegGS/ph
 LjxdWEXnLZWDBEUtK45r5NspmR6z94E=
X-Google-Smtp-Source: AMsMyM55DjxTBEeR6EBqEP6z7wg+RcAzBMz79Oq0Pn3CT51ZmgAlB/oXAgUghpHwu/C903z/Y9hm4g==
X-Received: by 2002:a9d:5f82:0:b0:638:eab8:14a4 with SMTP id
 g2-20020a9d5f82000000b00638eab814a4mr601637oti.71.1666990216782; 
 Fri, 28 Oct 2022 13:50:16 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a056830010200b0066756fdd916sm2090778otp.68.2022.10.28.13.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 13:50:16 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 2/3] dt-bindings: display: panel: Add NewVision NV3051D
 bindings
Date: Fri, 28 Oct 2022 15:50:08 -0500
Message-Id: <20221028205009.15105-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028205009.15105-1-macroalpha82@gmail.com>
References: <20221028205009.15105-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for the NewVision NV3051D panel bindings.
Note that for the two expected consumers of this panel binding
the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
is used because the hardware itself is known as "anbernic,rg353p".

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/newvision,nv3051d.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
new file mode 100644
index 000000000000..407de7fb5499
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/newvision,nv3051d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NewVision NV3051D based LCD panel
+
+description: |
+  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
+  this driver only supports the 640x480 panels found in the Anbernic RG353
+  based devices.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - anbernic,rg353p-panel
+          - anbernic,rg353v-panel
+      - const: newvision,nv3051d
+
+  reg: true
+  backlight: true
+  port: true
+  reset-gpios: true
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "anbernic,rg353p-panel", "newvision,nv3051d";
+            reg = <0>;
+            backlight = <&backlight>;
+            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_lcd>;
+
+            port {
+                mipi_in_panel: endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

