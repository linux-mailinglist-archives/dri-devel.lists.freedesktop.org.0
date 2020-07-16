Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC3222752
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 17:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298696EC7D;
	Thu, 16 Jul 2020 15:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E766EC7D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 15:39:19 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id k71so5009404pje.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZAKSAh34vTXMTUWEjv2hN2YsXCAZIAQFEsdbfwVoDU=;
 b=FnTEaAYt0y6BvQOFPCsBRFnTthf3sONoeLwowi4ONN/7NOSqNe/7Guc9c5CyDpPbl5
 UWt9WLPB6kjrzLv2tFFfUbhmNO7xyu7G32cNI2I7WGJ1FBqo1IMpocIoejL3/DyWMLcr
 juFpoZdNbRRZ1prAfjrmKmXrc+lFm2w7bQTqxP9k+uUjTZSd1RizMYBdM6yw3oEGnShN
 GuhUQCcQ7ydXBCXGZ7hJ2JfOig0aOuZC0H7lF+r3+Gw+EV2Zj1TU1Z2wqNVZrlU1/tpp
 LQ10NfyB3EziTrY0Wci0FvwaPeYi7/Kwart4MXJXgXVKUZHknlGtDh7ml9kb3o4oHneE
 CWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZAKSAh34vTXMTUWEjv2hN2YsXCAZIAQFEsdbfwVoDU=;
 b=hboroNzYs8Qi1WI4N1gTP1fw/eyWa7Mz8AwGkqSCe+YTLkGAYAJvRAwYwu2Absmy6k
 f7ZJG/PLBKfCx0qSTa38r7IPW9ZtruNVUKu1J1FqGiXaELxiOWDI4S1R+DqwF/5tiHbi
 u8cvXmfmBqGmqfujOURe4UsGrj+80zIGx+umkh78anyp+tUJv6SzRztbow6UXr9DC+62
 ouJ9TTHXP948jceINpjol+E5Yoim5nBcSs5TOLY6ow+mz+FPgvRN4hawwffj8d4fj5KE
 xF2Xxe5zGRGp+VzYxRaUAcj56oLiANq0bQqHhj6oyrauEQZNxZaQXjhRZY7Gg76ihsWU
 Ro1w==
X-Gm-Message-State: AOAM531WV6Lbqx9zFBmZoXIfrCssPQXw11m9fQbWEKrZIw2E9b8pWyZu
 sE4li/gVcCqfhpgSzoe5BzWgxw==
X-Google-Smtp-Source: ABdhPJzqE6oeEFFqme3rNP4ESry/Nvs1h8rm0US3SV0eP4I21Fv1cOF9PvgFvbXn5mcqhBlJZUVx9w==
X-Received: by 2002:a17:90a:ea83:: with SMTP id
 h3mr5772276pjz.176.1594913959344; 
 Thu, 16 Jul 2020 08:39:19 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id f14sm417056pjq.36.2020.07.16.08.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 08:39:18 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Tianma
 nt36672a panel
Date: Thu, 16 Jul 2020 21:08:57 +0530
Message-Id: <20200716153858.526-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716153858.526-1-sumit.semwal@linaro.org>
References: <20200716153858.526-1-sumit.semwal@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nt36672a panel from Tianma is a FHD+ panel with a resolution of 1080x2246
and 6.18 inches size. It is found in some of the Poco F1 phones.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 .../display/panel/tianma,nt36672a.yaml        | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
new file mode 100644
index 000000000000..3c583ca926ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tianma,nt36672a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tianma model NT36672A DSI Panel display driver
+
+maintainers:
+  - Sumit Semwal <sumit.semwal@linaro.org>
+
+description: |
+  The nt36672a panel from Tianma is a FHD+ LCD display panel with a resolution
+  of 1080x2246. It is a video mode DSI panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tianma,nt36672a
+
+  reg:
+    description: DSI virtual channel of the peripheral
+
+  reset-gpios:
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active high)
+
+  vddio-supply:
+    description: phandle of the regulator that provides the supply voltage
+      Power IC supply
+
+  vddpos-supply:
+    description: phandle of the positive boost supply regulator
+
+  vddneg-supply:
+    description: phandle of the negative boost supply regulator
+
+  pinctrl-names:
+    description: Pinctrl for panel active and suspend
+
+  pinctrl-0:
+    description: Active pinctrls
+
+  pinctrl-1:
+    description: Suspend pinctrls
+
+  ports:
+    type: object
+    properties:
+      port@0:
+        type: object
+        description: DSI input port driven by master DSI
+        properties:
+          reg:
+            const: 0
+
+        required:
+          - reg
+
+required:
+  - compatible
+  - reg
+  - vddi0-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
+  - pinctrl-names
+  - pinctrl-0
+  - pinctrl-1
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/gpio/gpio.h>
+    dsi0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel@0 {
+        compatible = "tianma,nt36672a";
+        reg = <0>;
+        vddi0-supply = <&vreg_l14a_1p88>;
+        vddpos-supply = <&lab>;
+        vddneg-supply = <&ibb>;
+
+        reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+        pinctrl-names = "panel_active", "panel_suspend";
+        pinctrl-0 = <&sde_dsi_active>;
+        pinctrl-1 = <&sde_dsi_suspend>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            tianma_nt36672a_in_0: endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+        };
+      };
+    };
+
+...
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
