Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB56E7031
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C076210E185;
	Wed, 19 Apr 2023 00:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E5710E185
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:10:33 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id e13so14184637qvd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 17:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681863033; x=1684455033;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x24IGLY9CVBMTbD8Qpvp/dsz7w6tF7pOSZxQkUNrMtE=;
 b=KshvSsuFZS3y13v1ZRqbqOghv6PiMcSMtZwjpLe+PyX9XUgJkdCb73ST5GILY+QZCk
 i9SCXhUQaCUr++cK37HGZdaj7mNqt6bTvtKBS0gdZOuM4eUwsm9Uj0rHAFExXMj0fJmk
 3s4LvRbsUSmumgNoWgmjRKoyGUKEdlaSXdYKirG3IgDiyhu3V85JFYx5x+IIjOzfprvB
 nZPxvDS/xmQhZq0hgwPeL3Hj9wBQGNjaXjalh44JmT7KDPm34/rl/nkaM0LXvVfnHwmp
 hP0Nr9jAWHKbLNvsbDFmdfc3sHthCrknAb++tKDrHqxweIi8JbBEiu0kB0JXP+iMdd5K
 J3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681863033; x=1684455033;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x24IGLY9CVBMTbD8Qpvp/dsz7w6tF7pOSZxQkUNrMtE=;
 b=Z18AiuOsGXj3sp1NnvNVqMAFj6ag60QcFUR9mTGNMjeYMzJ77tUTGShIpz5ik2LyGC
 UPOtzusrxNdcfmhvZ1i0RGt8mMABXjBo2/7zKE12Ub94KK0qHWb0tGzdM5C73avHGCB2
 qHOQiLucCMSQyDKFgfWrz2si33UIYh7QOPpXDXk2vXwgC/ra8BgTVX7AIphDdgXPphDG
 EhTzUvg50QrhifbJZVa2Ce3Lq2O5odwOtylS2leQtu6LCoW39iVK+Ht8Q2SJ8h6AIIQV
 F4GLaJbTS68LuvSrOpfxBsnc3TBPPmTB06EILYkmmWR42pVRdrH0gcUx2YMuk+DjpPRS
 3eOw==
X-Gm-Message-State: AAQBX9don26gYG0ayWh1q4+YqR20+nPlMl5rjGphD33zWSUxj1hL9ThE
 Y5UyyYTFdMxADlOajejng4M=
X-Google-Smtp-Source: AKy350ZSx682zuDgvKTodV2CK7QDBAFVawTHif5JDzhca5MOxfNKZX5KI3ypZElcbz3e2JL3OPdkeQ==
X-Received: by 2002:a05:6214:c8d:b0:5ef:5250:c5e0 with SMTP id
 r13-20020a0562140c8d00b005ef5250c5e0mr21737097qvr.7.1681863032718; 
 Tue, 18 Apr 2023 17:10:32 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a37680e000000b0074d1b6a8187sm2639035qkc.130.2023.04.18.17.10.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Apr 2023 17:10:32 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next 1/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Date: Tue, 18 Apr 2023 17:10:13 -0700
Message-Id: <1681863018-28006-2-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 Justin Chen <justinpopo6@gmail.com>, krzysztof.kozlowski+dt@linaro.org,
 kuba@kernel.org, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Florian Fainelli <f.fainelli@gmail.com>

Add a binding document for the Broadcom ASP 2.0 Ethernet
controller.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Justin Chen <justinpopo6@gmail.com>
---
 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 146 +++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml

diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
new file mode 100644
index 000000000000..3817d722244f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Broadcom ASP 2.0 Ethernet controller
+
+maintainers:
+  - Justin Chen <justinpopo6@gmail.com>
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: Broadcom Ethernet controller first introduced with 72165
+
+properties:
+  '#address-cells':
+    const: 1
+  '#size-cells':
+    const: 1
+
+  compatible:
+    enum:
+      - brcm,bcm72165-asp-v2.0
+      - brcm,asp-v2.0
+      - brcm,asp-v2.1
+
+  reg:
+    maxItems: 1
+    description: ASP registers
+
+  ranges: true
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: RX/TX interrupt
+      - description: Port 0 Wake-on-LAN
+      - description: Port 1 Wake-on-LAN
+
+  clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandle to clock controller
+
+  clock-names:
+    const: sw_asp
+
+  ethernet-ports:
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[0-9]+$":
+        type: object
+
+        $ref: ethernet-controller.yaml#
+
+        properties:
+          reg:
+            maxItems: 1
+            description: Port number
+
+          channel:
+            maxItems: 1
+            description: ASP channel number
+
+        required:
+          - reg
+          - channel
+
+patternProperties:
+  "^mdio@[0-9a-f]+$":
+    type: object
+    $ref: "brcm,unimac-mdio.yaml"
+
+    description:
+      ASP internal UniMAC MDIO bus
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    asp@9c00000 {
+        compatible = "brcm,asp-v2.0";
+        reg = <0x9c00000 0x1fff14>;
+        interrupts = <0x0 0x33 0x4>;
+        ranges;
+        clocks = <&scmi 14>;
+        clock-names = "sw_asp";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mdio@c614 {
+            compatible = "brcm,asp-v2.0-mdio";
+            reg = <0xc614 0x8>;
+            reg-names = "mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            phy0: ethernet-phy@1 {
+                reg = <1>;
+            };
+       };
+
+        mdio@ce14 {
+            compatible = "brcm,asp-v2.0-mdio";
+            reg = <0xce14 0x8>;
+            reg-names = "mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            phy1: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                channel = <8>;
+                phy-mode = "rgmii";
+                phy-handle = <&phy0>;
+            };
+
+            port@1 {
+                reg = <1>;
+                channel = <9>;
+                phy-mode = "rgmii";
+                phy-handle = <&phy1>;
+            };
+        };
+    };
-- 
2.7.4

