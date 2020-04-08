Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D71A29C9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79AA6EAD4;
	Wed,  8 Apr 2020 19:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B2F6EAD2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:54 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q22so5252860ljg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b92gXAPWMpc0tS9Vby+B+PzcrbaE0rgwDuXebSiFRRg=;
 b=IvxLBa0n2JUNinS2blOc0DW0okymgwZB5gd9SnpHsndS134FrpX2hCLERzqbU6i9dn
 caKSGJkRyA1ufQK2i8ytcAyNs+DyXKCAu1qTv9Ktrsy2fbMXZlfXxLJaRV++8gQT4l9l
 0hZxK7MgfHrsa2lNqT/kxdxwzi7JU01bHlMMWtzDqSsLbyqSa3BqHjuODVuSWrz94rPK
 +4d/Iv5OTq7Z/i19lF1YH+gRNZADjeP/9iKgohKKaauNJjQEHz3dcfGPVJrd3AuVTw8/
 o9/abOqweb5gN4C/B3BjElUJzGuRGFUL6qkcS5Gmc/+U07LklAUObmxblQ1qLsIaSjwB
 HhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b92gXAPWMpc0tS9Vby+B+PzcrbaE0rgwDuXebSiFRRg=;
 b=feXCNX/IBEdiMybTX3lxyqNFSWKPY6CmZHW2w/H/UEmrsV5++/0DTEB1g42+V/zfoJ
 nuifacqfRPeUyW+NxhMiAuZTgSm8TwFyAS9ZImpP9VrZezRDq12ANfW7o7DXwtAsLffX
 7LR4UmA+oExEPU8DmYdJOomHkSBUe5IztAQyPFeLwnRPOcoVX+exOrvDEvBuZCZ+Cr8X
 K5zv6bFeCdYgS4yLg3GupFNoc2ASGVKknsD8QEC5R5koNPvfi7k51D1Ev/4V1t9KGAy8
 ze7BWJhMS7tcqDyPKvASHKWr2GlIK1iKL2wKWwGpblIP9YSaaNw709DkjKeab423tbpm
 zOpQ==
X-Gm-Message-State: AGi0PuawnHjVVrRhQWE9rCvuEtPxuByaIwmpukfAciMK8ninT4Uoj5Ad
 kt0y4X2ScUhw71j065VVZBExHYhyX+8=
X-Google-Smtp-Source: APiQypLvBGqysXcl0m2MRJGgJ+NjRBrb9vi3AZyK/BUUCWQED3vSWle/WY0vOUASBXGPdkcMV/gexg==
X-Received: by 2002:a2e:8057:: with SMTP id p23mr5898367ljg.261.1586375513020; 
 Wed, 08 Apr 2020 12:51:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:52 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 11/36] dt-bindings: display: convert innolux,
 p120zdg-bf1 to DT Schema
Date: Wed,  8 Apr 2020 21:50:44 +0200
Message-Id: <20200408195109.32692-12-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Sandeep Panda <spanda@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sandeep Panda <spanda@codeaurora.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p120zdg-bf1.txt     | 22 ----------
 .../display/panel/innolux,p120zdg-bf1.yaml    | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
deleted file mode 100644
index 513f03466aba..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "innolux,p120zdg-bf1"
-- power-supply: regulator to provide the supply voltage
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel
-- backlight: phandle of the backlight device attached to the panel
-- no-hpd: If HPD isn't hooked up; add this property.
-
-Example:
-	panel_edp: panel-edp {
-		compatible = "innolux,p120zdg-bf1";
-		enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
-		power-supply = <&pm8916_l2>;
-		backlight = <&backlight>;
-		no-hpd;
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
new file mode 100644
index 000000000000..42f97b7b86b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,p120zdg-bf1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
+
+maintainers:
+  - Sandeep Panda <spanda@codeaurora.org>
+  - Douglas Anderson <dianders@chromium.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,p120zdg-bf1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  no-hpd: true
+
+required:
+  - compatible
+  - power-supply
+        
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel_edp: panel-edp {
+        compatible = "innolux,p120zdg-bf1";
+        enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
+        power-supply = <&pm8916_l2>;
+        backlight = <&backlight>;
+        no-hpd;
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
