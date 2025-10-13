Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0DEBD1891
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 07:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295DA10E377;
	Mon, 13 Oct 2025 05:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZBhzDIxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8220D10E092
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:56:15 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-636de696e18so7953100a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 22:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760334974; x=1760939774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
 b=ZBhzDIxdHw6RLoSwrl2zg2l5cVHXYnP0rNhw2fir6IL+be/3oChqXS9sbUHGWnncVt
 UAHeDM2bJm1/6c+7n3rPh2Yc5+LzaC62Y2NLY15B/AXq7AQLMfTJz5YJkBPDqJt3N94f
 pSiiQmW2nXDYLRK6IzVq9nxEsKTo3+hpT8kK3DyAvPcLGnDXfpHCxvnO3OB+6hgFtRw3
 g9FqEvQ5EmEf6yvQnfB/HmIza/1tnJtJ2ivonOpkmcEc8RCni0VzxlvbiAet2VHzeZ7q
 FPutZqpwF6Uv6nlDrVGNR39zJc9QO36+UZZyQo0jY8r9KF/UkZA0WJw0swLXHw/buTG1
 nQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760334974; x=1760939774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
 b=eYopR0z9GmY0tmIJHXwrM3PCbj8eIZsIenYodpLTXQ8mgDw8bqy5XipkqbQlsze7C1
 ecBSKpOO+Pb0AVKeXkdZZy4n6l77ahZN7bOmm+1kjBZGTB0bGar5L6NyyvZMFzkdCQsa
 XJfPxBLuAYcmE+JPKdx+hnybfakpQmRco+uszxkslUHKNUPb/sMl1h1R8ql0EquWgUA3
 RwKQAMWlx6ZoqS/w9ak80+7OVpkpFMU9j9e2HLhlXvhK2TtIcSVHDGJSTIPmjY9+zmBL
 obo6+gBcfbWXT4ZuNQFqVGnsupbgXXe5c1SREr7oFfeVuqfIdHp99uwPvMI8jY+C1P/o
 suXQ==
X-Gm-Message-State: AOJu0YwJBIQpGnnM2Koub/NGAeR23/nYgU1N4avZJenlbATkpBDiDecg
 LjOchQtymGvlR9LI+ehds5OKbgw08gwbenwz+CymQs9J7iST0vKrWfm1
X-Gm-Gg: ASbGncvCeV8Lbb8AbsCkyqNGkEsoxgFC9UBmP73cqkxNpnHZXBtasrTfDFDZj1Whndh
 K5qziiktcAAZrV94unCpcP9bMxTG/Sc0T++y+1ZHPW4Efi07xCjfbSLZoFxPU08ehp52WG+2mv6
 S+wPhkvtronjALdgHNztysJ1zET4QW6z8g6/QssVD6jL2pcqtl+G4kwsG39sLTrjrCN3RqI90eM
 AloEHKj5ztsNPADOY5xjXWxG29mFNp86dUrvX0/Z933yzg1W/4StgLOQkLmxRxA/whiQduqPLcA
 JI9NABUmvBbH2AWfjXiRxzo4E3L0dYGGKaIv9wwkayhLQCnkqUEfvHxYjBxHOwmVQBzgaXpr2sK
 T4+eLqRPPXqCQX0RkbE5IhzQM1O/CIwkiw3JkjKaViKA=
X-Google-Smtp-Source: AGHT+IH2c+24CivWPPJ/ldu3md2RU+buuXCl55Yc9ObghGW9GfGlOejHYQ5h1JhatOPelTBivJjgCA==
X-Received: by 2002:a17:907:5c8:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b50a9c5b352mr2011241866b.4.1760334973858; 
 Sun, 12 Oct 2025 22:56:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 22:56:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
Date: Mon, 13 Oct 2025 08:55:36 +0300
Message-ID: <20251013055543.43185-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013055543.43185-1-clamor95@gmail.com>
References: <20251013055543.43185-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which it
clearly is not. Address this by adding the proper schema for this panel.

There is only one user of this panel binding in the mainline Linux kernel,
which is the Nvidia tablet Tegra Note 7. Its panel is broken anyway since
it cannot initialize properly if the bootloader does not leave a
pre-initialized panel. It also cannot suspend or re-initialize properly,
since no DSI configuration is set and it has a loose regulator which
relies on an always-on property rather than being hooked to the panel
where it belongs.

Tegra Note 7 device tree is adjusted as a part of this series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../display/panel/lg,ld070wx3-sl01.yaml       | 60 +++++++++++++++++++
 .../display/panel/panel-simple-dsi.yaml       |  2 -
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
new file mode 100644
index 000000000000..0f0b9079f199
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG Corporation 7" WXGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,ld070wx3-sl01
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vcc-supply: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - vdd-supply
+  - vcc-supply
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
+            compatible = "lg,ld070wx3-sl01";
+            reg = <0>;
+
+            vdd-supply = <&vdd_3v3_lcd>;
+            vcc-supply = <&vcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 9b92a05791cc..f9f1e76a810c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -42,8 +42,6 @@ properties:
       - kingdisplay,kd097d04
         # LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
       - lg,acx467akm-7
-        # LG Corporation 7" WXGA TFT LCD panel
-      - lg,ld070wx3-sl01
         # LG Corporation 5" HD TFT LCD panel
       - lg,lh500wx1-sd03
         # Lincoln LCD197 5" 1080x1920 LCD panel
-- 
2.48.1

