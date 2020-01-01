Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F7212DEB9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 12:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCEA89B38;
	Wed,  1 Jan 2020 11:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAFD899EA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 11:25:32 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id 2so20700096pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 03:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fdGoH1RBSE0s/FT++wCk+eXRQE/Dps6JokN9W13ec2A=;
 b=MO1HGiBMORzlmmGBTIkfOKcf78TkkSN/9tgtVrUAJc/hRF0XNQaz+yNfURcEgkZtLE
 6LhWWEtQ16lZn4VmnnutJU83l2YZ0Kwi1+mRZ3H9iqS3DSN2jKxEUAZD/v3IeeTSo+Ol
 ovt48RgOeck5uh1ThZ/ZKLFMdDeBwR/dUv+7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fdGoH1RBSE0s/FT++wCk+eXRQE/Dps6JokN9W13ec2A=;
 b=njMIUiJ9yo2RTzC4pXyt76lLA/AuIqGlvkdOgOT5WuXs7DgMqPBYPBJHHqhoZGZZri
 g9xEXEQboFwQouxz1i4aswFkz46aioLcbcnCkyCGdXhuXFg0CkytDIlpz3ZBpRTpWsc6
 zgl1yIR4VbjQAWtrHwMOhn53ZAhXB4pPeNYFOcxz0i/sENnCZjtYMlpq8fKcKc5ypZFG
 RRvBSsklRM3aaWU8XAC0yMJ+E15hVYrzYDBrs4B2V3vxitcD+c9rWL27Zrwrneqz9JzA
 AzkGQ8RoKkUK/1zxxxd5UW9cyRXwpL8E9hKa2c3+XN6It8AKMjiqZ2Ulz52XiJPlf+Xa
 2u4A==
X-Gm-Message-State: APjAAAX17JtReK9HoNA4pK+gtqVEMuBPkEgGCPkrq+PrUR2WyIAtsb6N
 PSB68I9W//tAG9cLKFTILGrKZQ==
X-Google-Smtp-Source: APXvYqyhFnef0p6xMGnWn9M8e38I99cM5qjK6fUCTcmrXYfohQ69YIgfsfWMkjrpcd1nvhR1r9Hkmg==
X-Received: by 2002:a65:4587:: with SMTP id o7mr82913622pgq.303.1577877931997; 
 Wed, 01 Jan 2020 03:25:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:d0fe:8978:1b04:ff94])
 by smtp.gmail.com with ESMTPSA id y7sm51945439pfb.139.2020.01.01.03.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 03:25:31 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 6/6] dt-bindings: display: panel: Convert koe,
 tx31d200vm0baa to DT schema
Date: Wed,  1 Jan 2020 16:54:44 +0530
Message-Id: <20200101112444.16250-7-jagan@amarulasolutions.com>
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

Convert the koe,tx31d200vm0baa panel bindings to DT schema.

Also, drop the description from legacy .txt since the yaml DT schema
of panel-common.yaml already have that information.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/panel/koe,tx31d200vm0baa.txt      | 25 -------------
 .../display/panel/koe,tx31d200vm0baa.yaml     | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
deleted file mode 100644
index 6a036ede3e28..000000000000
--- a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "koe,tx31d200vm0baa"
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Optional nodes:
-- Video port for LVDS panel input.
-
-Example:
-	panel {
-		compatible = "koe,tx31d200vm0baa";
-		backlight = <&backlight_lvds>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml
new file mode 100644
index 000000000000..4b64e8ad8ec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/koe,tx31d200vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: koe,tx31d200vm0baa
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+            compatible = "koe,tx31d200vm0baa";
+            backlight = <&backlight_lcd>;
+
+            port {
+                    panel_in: endpoint {
+                            remote-endpoint = <&lvds0_out>;
+                    };
+            };
+    };
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
