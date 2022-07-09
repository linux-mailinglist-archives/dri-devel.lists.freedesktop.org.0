Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795B56CA5A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 17:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1107D112405;
	Sat,  9 Jul 2022 15:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D77113EE2
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 14:11:48 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso1081500pjk.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 07:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KllOWvu7e5SrcZMDE7g9T24hEywTIkk+v5p3DscJSVk=;
 b=URNmP3umu2PBlR0Jiq2x+70Gh+/snbyMaDhjDqYXTKpUbuT+iZ7a8v0Pr87jT5ljya
 mqGLESW71MJTMggzoFhVtAoSqiRB9CXcSxCalKUDDBQiTZiOG+kp+HJH+30PKfIXJ4P1
 rgPRmSMUxKYKgoQlLBJwEF0X0m5tDuU0J51tXReFYssdd+9DkCZPulPaaKmq9yU4fniC
 UVldYMoBotVX1vPCVSVySqpkaeWjybRfrdQh1m7gu/OWozZzrWH0zF6UqhVvKnljHidX
 FLOAT0j+rk+03varPvOLd+QWaXdGZ79R+LqA0JTY4jcYgPtLkTY6Px20CDGrSRHAoIh2
 mVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KllOWvu7e5SrcZMDE7g9T24hEywTIkk+v5p3DscJSVk=;
 b=Y825pYCMFyZAZBdI5nrLnMSJf5aV5GwrJyb60bQ870DrTkd5MWuzvDBv+6C1d2+Kam
 O5cYVlzJJqoj1XrbUF3eFEIyARgQJHg7auxpaJdwDxCOrItPB4W7TMbrSi10mVPt4ji/
 ej1BLdWCTt1oysvhj7sBEvRfgNRRImgBQRm++zJU8KR5eqwc5rC7EggfvdZ+zG3pJZ97
 F/LoXtoa6pybgQoHc76HqB52sNxLw+GTnkpIu/0JZBYB0BybvdazzG5nSg5RfDVUW0K4
 QfjyBzRXP5sc4AkWv0/l9/h6TYWFCS4ey+zKeLGGQTc56VYBAZ7VnYdk8a3KjR2I704b
 9wrQ==
X-Gm-Message-State: AJIora9EefwfpaGNoHvtUTz/+NYbNM5fGBvxMnGQGdkJqXiEnXn5fpKR
 ap+i2Ffbpswxgu6Wz6o/HBrWNhGs+h05gQ==
X-Google-Smtp-Source: AGRyM1veZswxyk5NCV2BlLrQOLUfYkf8tbPH2lK9NsCBmTlbFuxvkQULsL+YlEPBy6MIgc1Yp8h5/g==
X-Received: by 2002:a17:902:c64b:b0:16b:d51a:dc24 with SMTP id
 s11-20020a170902c64b00b0016bd51adc24mr8822796pls.48.1657375908291; 
 Sat, 09 Jul 2022 07:11:48 -0700 (PDT)
Received: from localhost.localdomain ([112.0.189.16])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056a0000cb00b0052974b651b9sm1529828pfj.38.2022.07.09.07.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 07:11:47 -0700 (PDT)
From: MollySophia <mollysophia379@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Molly Sophia <mollysophia379@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Date: Sat,  9 Jul 2022 22:11:35 +0800
Message-Id: <20220709141136.58298-1-mollysophia379@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 09 Jul 2022 15:28:41 +0000
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
 .../display/panel/novatek,nt35596s.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
new file mode 100644
index 000000000000..f724f101a6fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
@@ -0,0 +1,83 @@
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
+  vddi0-supply:
+    description: regulator that provides the supply voltage
+      Power IC supply
+
+  vddpos-supply:
+    description: positive boost supply regulator
+
+  vddneg-supply:
+    description: negative boost supply regulator
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
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

