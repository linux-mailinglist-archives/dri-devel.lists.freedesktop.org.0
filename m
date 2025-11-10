Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822DC458E8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E6610E35D;
	Mon, 10 Nov 2025 09:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zr4bI28R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666C210E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:15:26 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5942e61f001so2502010e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762766125; x=1763370925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
 b=Zr4bI28R4+Y3KzLA+krtitqEfC3WHgFqrd+IBOnN2fe35j3i53GNyEQj4jXFXLQ9Aa
 cqziO5qiIihM9UEgfMIs4Gszxjj77MxseCsZwFNcYsdx/bjF6/ieWlHVgtTnfLgG9jqN
 TYYrTK6CnSXSz7F2cP5p7Lvy4R49sT1va8t6uMoPf1lg7ZA79A7I99tcOU6TetfDUYkk
 qvq1npWwLrV7aVIBlr+1zvB6QHM4ud6NxncGnismI9EtlC3GvRCJWrLcW0ag0X50u0sS
 3LEFWHv87JlZjUC9cYOzBXiu80o+6v9cCN7NmTw94BbEaUE1+QNFgnEcq9wARDF1rEEx
 ZYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766125; x=1763370925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
 b=UL5+gf0+PGSqPb3ofkEQVDxsGkpQvGxDkkct8ZLHU+x4iZyrRSUKnttJuOs1iSWJra
 yKpmRIcwTW9PRffP9ziHcsBYfNLgGoMKFYYomV20FivEeIq/bHfLIjuGU/fqjsfV0Q38
 qnhx1XVggIZTCWfa4VE1zG9dH9gmjNfmgVfrMDO4AXQFjSxTAg2enqQvUVTG63N7NXaU
 XH/C6ZuF81ntPUgOeVFSbSi1cmArAUDX1CxYtwoDk0SBXI4m9Koq6bUG2e76Q4FZCWQD
 Y6w7Nx0BXtb3E3VwSjdvP8VHYGEAkl4fvGjFW6uZp/WAY6mCNoGRTh9rxwd1MPoFqRnh
 I+NQ==
X-Gm-Message-State: AOJu0YzNvWw4JdiL+f8muGcub/PrkC2DcDinPUbTYGRgJadXxmGuOhxS
 1uoNMeduFXKuEhkZf8NbP0tJn8tejJzgPn/bD1rl7C1ikFvWc9E9ZAHdCC1bww==
X-Gm-Gg: ASbGncuVmoTU7GyOwuW3/sE8MUwoaCcxJzHB4SRnZOR2TSEJeFqjb5ev1+PV5tVfS6H
 pllOL77Wq2l4Ni/RW7VXM1Nr21gVEHz+tHD7p4r76Qd4JLQGvIrmlu/kPC+e2lfH+R3rLQUTEvg
 qYX9kFEaHVxIUrRIWoQ+dyL2xPolVobNJMwJp8buo5PTYBi1Mx0AZJR5X24uAA+LqgTZ8PsOs6N
 F88bVozh2PN5oJfWRUnJHIxjNKKjKgz3QYiTg2zxcqLbKnghkoT3fKPv3FWFHl8mxg4GN169/ta
 AB7PxHQJEX/QtxW9BgyR4MgnduhcObGtb+GUuickFcrmekScuTl63xsZDYN5ev+qZI8t2kq+2Qx
 tGccY6gTlyZNjm1QRjtFVNPByqynlSFGtKoWKbKMwHcORRaiBB8XITi2eSDNO8gVe
X-Google-Smtp-Source: AGHT+IEnre8euOUlJN4NOBJZ2nC+Kyrobg6JzCsMbW0vlCirl1sVxwVHvO40Hh8x69PfhvhcPyI0sQ==
X-Received: by 2002:a05:6512:a8e:b0:594:5236:2842 with SMTP id
 2adb3069b0e04-5945f146023mr1871274e87.10.1762766124504; 
 Mon, 10 Nov 2025 01:15:24 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:15:24 -0800 (PST)
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
Subject: [PATCH v3 1/7 RESEND] dt-bindings: display: panel: properly document
 LG LD070WX3 panel
Date: Mon, 10 Nov 2025 11:14:31 +0200
Message-ID: <20251110091440.5251-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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

