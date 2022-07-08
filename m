Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E456B3C4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BA610F6AF;
	Fri,  8 Jul 2022 07:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A8310F252
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 02:20:23 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id f11so2657200plr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 19:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQUS1uH91aVB+0XmXBENBE6FQndufm4Tu4vHhSYzrys=;
 b=VP310OkbcIo5wULkEMRYyC8Jn48+GGgcFkvppM0u4eayWjHH7Uk/rFRsGkUFjJ3mCO
 XOTxGFDYZ9Z4b8SuEhSmi3NbIvH4VeU7tauefXlcOoI29cgT4MjfQZRkOP43eP2SiWTH
 soTTMFf8Ytc/SaoyQyb93krx13oQSkGiTgAbCBmqMiXrMnjzAB1rBs5s+9/HSUNj6iWG
 qI7KuFzQcu33Em4UDvukzPEVv+zgNHNhgw6mgkcPtmzEIj6y2ZyrIOIAnd1OHnQy+weg
 Oye9HksqfYbWnv9rzhbbaD/kpJFd0ooLga6Iz0k+se4ct/MZ6eskBVitHO48uzmpW8nJ
 LPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQUS1uH91aVB+0XmXBENBE6FQndufm4Tu4vHhSYzrys=;
 b=2e+WoayQxd5XJUR1XHMvJxlUHxmXBMHF648ZJOjJ0rM5/V+7jb+9WcWJVSBEvqd6yF
 fdOiEMw5zdLlyQZGkW4HyeRqo9BzNjQM/bmqaHD4ImYuQR1tEGBu9QdtScm7t0f9DsQi
 rfVnKb2ioW1ryftrMwyQX0WrxG1CCfpmdT4T2q86f56sdLQMpdPSCAx+iZdM5guWPA2a
 5LOU0V4aEpyPjIydW2dQVYGVlFrbFiWTZWZKsF6+ofndRbn5hKKvyZQwghWcUJJ4mToR
 4aJvXXftv/bWxE817RnFFDfwWAiO7a7hLFLbGEar1sPggzx1mJLxj7ZgDNUGeI6aqJQr
 tJTA==
X-Gm-Message-State: AJIora80by0oZI8JN3/RETT/6s8SNFoIrxKcIpIb5mCUyoYcCWDYPDic
 9XPd2e4N1bSftGHmMaWsCog=
X-Google-Smtp-Source: AGRyM1sDsSK9Mdd7E9ePhl3agk2mvYgX9I66p/yZJNZ2D+EGlTvaLBMJweE1+Ro+nVEg+T5N51uRPA==
X-Received: by 2002:a17:90a:6809:b0:1ec:c213:56c8 with SMTP id
 p9-20020a17090a680900b001ecc21356c8mr8912325pjj.82.1657246758218; 
 Thu, 07 Jul 2022 19:19:18 -0700 (PDT)
Received: from localhost.localdomain ([112.0.189.16])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170902d49100b0015e8d4eb1dbsm12678820plg.37.2022.07.07.19.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 19:19:17 -0700 (PDT)
From: MollySophia <mollysophia379@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Molly Sophia <mollysophia379@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: display: panel: Add Novatek NT35596S panel
 bindings
Date: Fri,  8 Jul 2022 10:18:24 +0800
Message-Id: <20220708021824.9167-2-mollysophia379@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220708021824.9167-1-mollysophia379@gmail.com>
References: <20220708021824.9167-1-mollysophia379@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Jul 2022 07:43:02 +0000
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for "novatek,nt35596s" panel.

Signed-off-by: MollySophia <mollysophia379@gmail.com>
---
 .../display/panel/novatek,nt35596s.yaml       | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
new file mode 100644
index 000000000000..937b194a6f18
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt35596s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT35596S based DSI display Panels
+
+maintainers:
+  - Molly Sophia <mollysophia379@gmail.com>
+
+description: |
+  The nt35596s IC from Novatek is a generic DSI Panel IC used to drive dsi
+  panels.
+  Right now, support is added only for a JDI FHD+ LCD display panel with a
+  resolution of 1080x2160. It is a video mode DSI panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - jdi,fhd-nt35596s
+      - const: novatek,nt35596s
+    description: This indicates the panel manufacturer of the panel that is
+      in turn using the NT35596S panel driver. This compatible string
+      determines how the NT35596S panel driver is configured for the indicated
+      panel. The novatek,nt35596s compatible shall always be provided as a fallback.
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active high)
+
+  vddi0-supply:
+    description: phandle of the regulator that provides the supply voltage
+      Power IC supply
+
+  vddpos-supply:
+    description: phandle of the positive boost supply regulator
+
+  vddneg-supply:
+    description: phandle of the negative boost supply regulator
+
+  reg: true
+  port: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - vddi0-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "jdi,fhd-nt35596s", "novatek,nt35596s";
+            reg = <0>;
+            vddi0-supply = <&vreg_l14a_1p88>;
+            vddpos-supply = <&lab>;
+            vddneg-supply = <&ibb>;
+
+            backlight = <&pmi8998_wled>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+            port {
+                jdi_nt35596s_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.37.0

