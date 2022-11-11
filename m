Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B006262F9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A964010E8BC;
	Fri, 11 Nov 2022 20:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDDF88284
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 20:31:45 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so6581565fac.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xete0/AZnyUcmSDoDSoWQ2VGHllGDO85S4fbHOvDNzQ=;
 b=E+rsBRHvmA9YsHXUyGU0u16o6aut3TyI8B6af76TWu1JuXTFzPILeonjAnntNRG64X
 OqcytALmznkqacFQVhXHnjXS5mwARYi2zULr5HwbV78pIWeJbw4295y72ZKCDeQKcOvI
 pEp5jlWk3e72oCC7MHLpIfjct2buY/7Il6Y2joGbY9SYahtW0LpiKzprhZCVugdsPHW+
 pt1+7TqacuWM9JNFefksDsArsKEfHXlTfMY6hFnHM/wYuhsjXnrJrgSefEhxwePE0hIY
 ICpcPoTCFaMgIo68uHMnVlRGkuZIWDFMVmGs0eMLfsIQScFPqORTQ8aey/XfF4B+Ucdu
 5how==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xete0/AZnyUcmSDoDSoWQ2VGHllGDO85S4fbHOvDNzQ=;
 b=y4TinvuGo9KbqLhq9vvTRIQ4VpNCcMx5vaDaE6Xc2zFdncZA8EocckrlKwINPjDblx
 xhfaoyBq8gD8BheTp38VZaEDNxkrdHzYcc5cFaqdz5OInYvhORmmFOOe0suFnRDRaeCe
 Mv+8OjD7flYE1pm/djY6bS7+Qi+Pb0Slk+dZE+0crzML6SXYWfSbDb+broHJ23+p7cpS
 bhitP1MfHlSai3JWYHu58UlNrBAlCRwWAiIgCuVqccmlDFWBco6gJpK8HBopma4Q6UAI
 8ygeVXgaOoqXHVaYmvxlxVYvLsdqbgMlzfy2WzQWfy2rT87ATwjqhPV9+V7MnPqax/y3
 azhA==
X-Gm-Message-State: ANoB5pnx7XsjGpI6hzcSJCEbsEyTpkJKJ7u27S5Fm1i5DGOLOkJZyRbY
 1JkWuA2MAlBHenYznLwEc3TuID0SxHA=
X-Google-Smtp-Source: AA0mqf6Rjas0LF4MGwfygUwXhxQl49ZzYnF1cPIW6+C9MWVL0El/f6GV/+UoK48FHdo2K+sugG76Dw==
X-Received: by 2002:a05:6870:8903:b0:13c:ac47:63e5 with SMTP id
 i3-20020a056870890300b0013cac4763e5mr1905833oao.278.1668198704363; 
 Fri, 11 Nov 2022 12:31:44 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a056870558a00b00132f141ef2dsm1734054oao.56.2022.11.11.12.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 12:31:43 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 2/3] dt-bindings: display: panel: Add NewVision NV3051D
 bindings
Date: Fri, 11 Nov 2022 14:31:29 -0600
Message-Id: <20221111203130.9615-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111203130.9615-1-macroalpha82@gmail.com>
References: <20221111203130.9615-1-macroalpha82@gmail.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/newvision,nv3051d.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
new file mode 100644
index 000000000000..116c1b6030a2
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
+  reset-gpios:
+    description: Active low reset GPIO
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - backlight
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

