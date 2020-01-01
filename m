Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F4912DEAF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 12:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1823F899BB;
	Wed,  1 Jan 2020 11:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8EB899BB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 11:25:25 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c23so16720723plz.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 03:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aAzFwJEYuGgvW/P9IbRhSf+XnGQckgZrqUZat3QeX28=;
 b=e76aESV8OxAQ+1VReIRY8qExAktiTMGpxkgpQS4hc8yEWCX2XUpVgRMyQ0P+3VhGxx
 cG+Dvzo+9tQIGq5JLT76qntE2V5+hVAB99vO8Cz1zO/6WgM+qGy/PgKfaAswdNYIsyQh
 Bu2Vy4n7gYkG3IXYbGQsVR3lCVEYmT4YSAHDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aAzFwJEYuGgvW/P9IbRhSf+XnGQckgZrqUZat3QeX28=;
 b=rjjmKDbyKNGnWRA1ZeTYZE1ZwqN2ja8CUsyUzJa5myjdDSYznbnSKJDEmQOB659bEF
 rxFz0iT2J22zTtAaF/pRJ1FAWx2W+gFGl5sfUa92ZM/x6PPMO4W1xGPsF0K44p28e2su
 6sAZHhh6VP9llmy9ZBGISqw0GGf+ES68vxoMdokHeM5PqR3OGOm3C19NOmGwyW2onJaU
 ESIum8T0BK/E4J8bfgdDcLdcF96sbm2jgXWHJWcokEECHB2izpCgNXV07IcDiWBvNXuZ
 V40zxrKK4o779azkB1ln+FXPQBKbW/8ONSk5xfHjdLW2cFL59JGQYpxh8vr09cDdthRP
 n5Og==
X-Gm-Message-State: APjAAAWUz/GMfCN3VjrSA2J5K9QVtauVY+1IXV5h4WYL+Pc+Sd6ln1E1
 uEXUB7Fj8EbDYqIE0kcRyaLbug==
X-Google-Smtp-Source: APXvYqzkSctdjdd9fJlMbQsYlI1poSSJCvWf4LUQ6JA98+/eq25mxnQcgX+A0QG3VgKbw4bWIYZk/Q==
X-Received: by 2002:a17:902:d906:: with SMTP id
 c6mr35495504plz.137.1577877925003; 
 Wed, 01 Jan 2020 03:25:25 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:d0fe:8978:1b04:ff94])
 by smtp.gmail.com with ESMTPSA id y7sm51945439pfb.139.2020.01.01.03.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 03:25:24 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 4/6] dt-bindings: display: panel: Convert friendlyarm,
 hd702e to DT schema
Date: Wed,  1 Jan 2020 16:54:42 +0530
Message-Id: <20200101112444.16250-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20200101112444.16250-1-jagan@amarulasolutions.com>
References: <20200101112444.16250-1-jagan@amarulasolutions.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the friendlyarm,hd702e panel bindings to DT schema.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/panel/friendlyarm,hd702e.txt      | 32 -------------
 .../display/panel/friendlyarm,hd702e.yaml     | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
deleted file mode 100644
index 6c9156fc3478..000000000000
--- a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-FriendlyELEC HD702E 800x1280 LCD panel
-
-HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
-resolution. It has built in Goodix, GT9271 captive touchscreen
-with backlight adjustable via PWM.
-
-Required properties:
-- compatible: should be "friendlyarm,hd702e"
-- power-supply: regulator to provide the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Optional nodes:
-- Video port for LCD panel input.
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Example:
-
-	panel {
-		compatible ="friendlyarm,hd702e", "simple-panel";
-		backlight = <&backlight>;
-		power-supply = <&vcc3v3_sys>;
-
-		port {
-			panel_in_edp: endpoint {
-				remote-endpoint = <&edp_out_panel>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml
new file mode 100644
index 000000000000..0509c34d98b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/friendlyarm,hd702e.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FriendlyELEC HD702E 800x1280 LCD panel
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
+  resolution. It has built in Goodix, GT9271 captive touchscreen
+  with backlight adjustable via PWM.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: friendlyarm,hd702e
+
+  power-supply:
+    description: regulator to provide the supply voltage
+
+required:
+  - compatible
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+            compatible ="friendlyarm,hd702e", "simple-panel";
+            backlight = <&backlight>;
+            power-supply = <&vcc3v3_sys>;
+
+            port {
+                    panel_in_edp: endpoint {
+                            remote-endpoint = <&edp_out_panel>;
+                    };
+            };
+    };
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
