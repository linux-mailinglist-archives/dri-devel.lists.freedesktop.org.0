Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7158C2EDD
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 04:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30010E1F7;
	Sat, 11 May 2024 02:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wJyC2I4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C76A10E1F7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 02:13:41 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6ee13f19e7eso2396287b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 19:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715393621; x=1715998421; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7CobSRVRvSvCvdbHg52Uq3JLXXFgOeVwFQVjf6DuNI=;
 b=wJyC2I4LAkGwJdD8tNUgwa2ESiXX4lDAFAEH2R1hj+Jz+tG03ASdVrDX1+OPvdSKLI
 HAN982XrX7PbiX+xEf5KNMdS1Zz9H6P2vmuFrCs27V2lBmGFR/AXFq6ux3mNdHpzjZZl
 DxoYi384C3mNQobd8sIp3p98S2lp8jZXpWt2SPyZTHSgCPXVHjZgbozinBkYG6h3MRNW
 LuYV+sfrq9EHe5ng2skLI0uJZrt9M/iK84eNK9vWQawiqBEvXDqtLsDqPEXiC6g8Dvtl
 9b37vx4PD5YmKdeXSUMg0WJWkQfOX93tsW8+iA92hEmK8/fSlbJT6wkk6yIU52xBIfIu
 VB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715393621; x=1715998421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7CobSRVRvSvCvdbHg52Uq3JLXXFgOeVwFQVjf6DuNI=;
 b=WSYqyA9Tk4L6niC6HAG7noYJUxLqQQIyJHoFmche+enUu9mwnHKLDkDhKz2/Db26jU
 HfZTmjt/CHjX75w9XyHUEE67HemNum/xmnoIBTrbf121Mm/DNhjaqG58AHx1MVIcedGs
 vSDvKlGmin0vzpQT6iyG93vg6ZFAGqsCRqfHmVqP9AFGMMdqQRcNFZ5qS2Siuy6JQ3WC
 lW66H9Cv+hogT1/KQI74jSMF0Jsdl9FWbhhZrYffbMc7h7DDW7ixn4dkSUDLi7VBGLio
 LjnxCS+oizxXt4dH6q+Yoz1Jvv3rcU4SH1YhVZeUg3yc1gDjpkIbXBESVikJuCvRDssk
 57Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtPBYMprCGdYhoEB0Sn4/mloVkL/S5Y2TyhXh+kaNPoB2ss98kFnv+oh/4g/y6uVnhVVItNSD+HnJ1VWyMWsYRJgZdejp4TJjIcmEZzX6L
X-Gm-Message-State: AOJu0YwiAqKUyDHpdKX5/2XQDweXumbUEUozLklU6YMf9oBvk1WUHM6C
 sTeVHmxY6faMTbktjf+Jk2Uw+Pg5KhVPMo/qEzvtGJkqsrZ1b0yOvJHhDIpWiqA=
X-Google-Smtp-Source: AGHT+IEOjv/rzqLcQpQn4Nq4tAVyZZZq4+ZitTdDgAP5LssffeyU+/ctOklxRQtHNlpFNG5FvdG18g==
X-Received: by 2002:a05:6a00:1312:b0:6ed:21cb:13f3 with SMTP id
 d2e1a72fcca58-6f4e02ecde9mr4623500b3a.17.1715393620648; 
 Fri, 10 May 2024 19:13:40 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a9d9acsm3680340b3a.90.2024.05.10.19.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 19:13:40 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/7] dt-bindings: display: panel: Add himax hx83102 panel
 bindings
Date: Sat, 11 May 2024 10:13:20 +0800
Message-Id: <20240511021326.288728-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In V1, discussed with Doug and Linus [1], we need break out as separate
driver for the himax83102-j02 controller. Beacuse "starry,himax83102-j02"
and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
controller, they have some common CMDS. So add new documentation for
this panels.

For himax83102-j02 controller, no need 3v3 supply, so remove it.

[1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=zBQJUC4CB2wj4s1h6n6aSAZQvdMV95r3zRUw@mail.gmail.com

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Chage since V6:

- No change.

V5: https://lore.kernel.org/all/20240509015207.3271370-2-yangcong5@huaqin.corp-partner.google.com

Chage since V5:

- Modify compatible format.

V4: https://lore.kernel.org/all/20240507135234.1356855-2-yangcong5@huaqin.corp-partner.google.com

Chage since V4:

- Update commit message and add fallback compatible.

V3: https://lore.kernel.org/all/20240424023010.2099949-2-yangcong5@huaqin.corp-partner.google.com

Chage since V3:

- Update commit message.

V2: https://lore.kernel.org/all/20240422090310.3311429-2-yangcong5@huaqin.corp-partner.google.com
---
 .../display/panel/boe,tv101wum-nl6.yaml       |  2 -
 .../bindings/display/panel/himax,hx83102.yaml | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 906ef62709b8..53fb35f5c9de 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -32,8 +32,6 @@ properties:
       - innolux,hj110iz-01a
         # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
       - starry,2081101qfh032011-53g
-        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
-      - starry,himax83102-j02
         # STARRY ili9882t 10.51" WUXGA TFT LCD panel
       - starry,ili9882t
 
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
new file mode 100644
index 000000000000..fc584b5088ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx83102.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX83102 MIPI-DSI LCD panel controller
+
+maintainers:
+  - Cong Yang <yangcong5@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
+          - starry,himax83102-j02
+      - const: himax,hx83102
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight: true
+  port: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp1800-supply
+  - avdd-supply
+  - avee-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "starry,himax83102-j02", "himax,hx83102";
+            reg = <0>;
+            enable-gpios = <&pio 45 0>;
+            avdd-supply = <&ppvarn_lcd>;
+            avee-supply = <&ppvarp_lcd>;
+            pp1800-supply = <&pp1800_lcd>;
+            backlight = <&backlight_lcd0>;
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

