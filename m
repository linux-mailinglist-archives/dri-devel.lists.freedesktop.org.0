Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C01A29F6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F636EAF0;
	Wed,  8 Apr 2020 19:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F956EAEA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:18 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x23so6122152lfq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vNIDvAoEerZAuf8dJ+yQQsEQf67OS8CEL+Bx3wu/FhI=;
 b=M6N4YJK8WMnJe09nboa+mfd0cdhhop7Ev2LuL84UYPhkVG81VbEynHD7pJHQBqwqRp
 jYppLlaT4ScHajRT2P1ch4KatWic5vP8gjrx7JRNhIfLMkeCmYwEvuXfcEM9jF1G3ZcH
 7YSZJdNPFWUysk0PAu/ryB90mmp7JEJx3uF7HJj/0ZSHxHzq217VTEbdL9mbWfSYatVp
 jWCk7O3c3TJ1mSosBoLFMz/ElbwDvjE/FLHsLY+uYCdJmpyywQGsMbO+4MV9owB2vY9H
 jviyjSu/eOZEz312jFizJpkwGcto3nA0WzC+OpGAbv90b0fBceIxXq1HEar1hamy8eAn
 Fk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vNIDvAoEerZAuf8dJ+yQQsEQf67OS8CEL+Bx3wu/FhI=;
 b=Y7BCqXPQZ7ymxDnWH3fuA8ThrvHp+GvNCcgpm5rxqd3ynqcSEIirEvOjxnkGmucZ6d
 2uX4fQ/WeX3dvxgtVJHtUARW3DjZi+SnBqle5H4denr8ngfwlfUq5RNbpR5WPfMZBZdL
 Ls6SjOYvjANQpf05lgfF90XRCNGMuaTxShcPLyzBIOXJHsxlWXn6WEvFOFApo37dyZ19
 ZSjZ9jKtRH4Kbj6TRtBF40UM4+m2H5qWVbYNc3uYyQJ619jzAeu4MKQyYovlk5pQx5zV
 4Qu3reF3T+xDBH71rmbcgqHKoFISFz+xhnd20Um6z3QBiZ6nqQAhWeDA6VOT2A8RvWnp
 OeGg==
X-Gm-Message-State: AGi0PubbaDLZGFw+v2c70RmXQ9+ZGNIOrKx1/uruO5+w+HZOlY+Ileoo
 dEjhXCm3wrH76CL7xhJlGWlH3d46aTU=
X-Google-Smtp-Source: APiQypJi0xt++3QZ2oXMVrgH/Hf2EGq34NaSdgMCRANHDzwvodSzX3HxcyQlllhdQTrSPIBLbX9dxQ==
X-Received: by 2002:ac2:5c07:: with SMTP id r7mr5622578lfp.160.1586375536484; 
 Wed, 08 Apr 2020 12:52:16 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:16 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 33/36] dt-bindings: display: convert seiko,
 43wvf1g to DT Schema
Date: Wed,  8 Apr 2020 21:51:06 +0200
Message-Id: <20200408195109.32692-34-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
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
Cc: Marco Franchi <marco.franchi@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Marco Franchi <marco.franchi@nxp.com>
Cc: Marco Franchi <marco.franchi@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/seiko,43wvf1g.txt  | 23 ---------
 .../bindings/display/panel/seiko,43wvf1g.yaml | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
deleted file mode 100644
index aae57ef36cdd..000000000000
--- a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
-
-Required properties:
-- compatible: should be "sii,43wvf1g".
-- "dvdd-supply": 3v3 digital regulator.
-- "avdd-supply": 5v analog regulator.
-
-Optional properties:
-- backlight: phandle for the backlight control.
-
-Example:
-
-	panel {
-		compatible = "sii,43wvf1g";
-		backlight = <&backlight_display>;
-		dvdd-supply = <&reg_lcd_3v3>;
-		avdd-supply = <&reg_lcd_5v>;
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&display_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
new file mode 100644
index 000000000000..9195de40b21b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
+
+maintainers:
+  - Marco Franchi <marco.franchi@nxp.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sii,43wvf1g
+
+  backlight: true
+  port: true
+
+  dvdd-supply:
+    description: 3v3 digital regulator
+
+  avdd-supply:
+    description: 5v analog regulator
+
+required:
+  - compatible
+  - dvdd-supply
+  - avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+        compatible = "sii,43wvf1g";
+        backlight = <&backlight_display>;
+        dvdd-supply = <&reg_lcd_3v3>;
+        avdd-supply = <&reg_lcd_5v>;
+        port {
+            panel_in: endpoint {
+                remote-endpoint = <&display_out>;
+            };
+        };
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
