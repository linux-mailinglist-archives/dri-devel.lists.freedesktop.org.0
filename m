Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1D12E4E1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF296E037;
	Thu,  2 Jan 2020 10:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F8C6E037
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 10:17:31 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m26so37756003ljc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdveirHsIPhVU+fkPoTDfHHFQp2fyC7pfB55HT7qYno=;
 b=Gi2UNwLci+se0PFY20T/OhetLxIvvY9XgaIoO/69Ge9J7EMtBQkLOmzkSiKVPTsHqi
 m/n5EJHzYv9ZUNtDGsDm6KtJPN+x47lziTzAT14ifbh/R0B9EQP4KnMI2HRKZ9ZNjVTA
 fJRULq1jN7RgL1FjM8b+fZOK0B4j5m4y/B7wQSBqw4us0hQceRyhfvj3+Q0HD+TmT0dW
 psNjnBQFRWQgNyAxRONo/vzjIrs+ahhXy90UtLtzbf3aUqe4WwGexktmrQyWG8HTNCEt
 joYi3o2KMkxGnOYo3woTSdeaa3Dy3ljggjDdjNcuupny+t3UrY4Czm+se2NvJ93Yj9yr
 7F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HdveirHsIPhVU+fkPoTDfHHFQp2fyC7pfB55HT7qYno=;
 b=gMcQoqaFvHmnSXBMsk98hfrW+1/23ydCG5m1R6FXP/8rVovNCNoilfP6jz8vM7HO+B
 mK6D//U9li9x2jU0FSE4gfHf6UXbns3/ei3C5p4giuIekUjEel2HI579mne0IzgW762L
 Zztp+Rmgvof4FdxyqhTYhBlQIDWHaBVYu1/i1bwYBuQjRw7gDBWjzV3e14xlO/J5zRu8
 t9ykLFSv5utsn5vwwU2YbweK5EAdbfWuGuWbWK870+dV2w+8zDiUJX1IEXNjpT6NiPn9
 Ed68VVJi3N6Dksgm+nwY50+7n1ThCq9KPV3aFiD+nSgAXwRZfiek+D3qk4TgnI4a96Og
 Q/og==
X-Gm-Message-State: APjAAAUbHwXUgh012OmpQrwzJxNZxNcIbNPsK11QF28tdDWhblcCwA3F
 tnNy4i64UuGujUh4+gkKSDU=
X-Google-Smtp-Source: APXvYqwAfBJWKYJujoq+TGAXqse2IxVi61pyufbfiuaJuxfXkOqmwL3oeQs76MNJPkqXVznqLQP5Iw==
X-Received: by 2002:a05:651c:1a8:: with SMTP id
 c8mr35734831ljn.207.1577960249839; 
 Thu, 02 Jan 2020 02:17:29 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 m21sm23025892lfh.53.2020.01.02.02.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:17:27 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
Date: Thu,  2 Jan 2020 11:17:12 +0100
Message-Id: <20200102101712.5085-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102101712.5085-1-sam@ravnborg.org>
References: <20200102101712.5085-1-sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To complement panel-simple.yaml, create panel-simple-dsi.yaml.
panel-simple-dsi-yaml are for all simple DSP panels with a single
power-supply and optional backlight / enable GPIO.

Migrate panasonic,vvx10f034n00 over to the new file.

The objectives with one file for all the simple DSI panels are:
    - Make it simpler to add bindings for simple DSI panels
    - Keep the number of bindings file lower
    - Keep the binding documentation for simple DSI panels more consistent

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
---
 .../display/panel/panasonic,vvx10f034n00.txt  | 20 ------
 .../display/panel/panel-simple-dsi.yaml       | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
deleted file mode 100644
index 37dedf6a6702..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Panasonic 10" WUXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "panasonic,vvx10f034n00"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "panasonic,vvx10f034n00";
-			reg = <0>;
-			power-supply = <&vreg_vsp>;
-			backlight = <&lp8566_wled>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
new file mode 100644
index 000000000000..05c52390269e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple DSI panels with a single power-supply
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  This binding file is a collection of the DSI panels that
+  requires only a single power-supply.
+  There are optionally a backlight and an enable GPIO.
+  The panel may use an OF graph binding for the association to the display,
+  or it may be a direct child node of the display.
+
+  If the panel is more advanced a dedicated binding file is required.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+    # compatible must be listed in alphabetical order, ordered by compatible.
+    # The description in the comment is mandatory for each compatible.
+
+    # Panasonic 10" WUXGA TFT LCD panel
+    - panasonic,vvx10f034n00
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  enable-gpios: true
+  port: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+  - reg
+
+examples:
+  - |
+    mdss_dsi@fd922800 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "panasonic,vvx10f034n00";
+        reg = <0>;
+        power-supply = <&vcc_lcd_reg>;
+
+        port {
+          panel: endpoint {
+            remote-endpoint = <&ltdc_out>;
+          };
+        };
+      };
+    };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
