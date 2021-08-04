Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BEA3DFC95
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 10:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D706EA0B;
	Wed,  4 Aug 2021 08:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B7A6EA09
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 08:14:23 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id nh14so1873563pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AiCWdYM0ZuktKgNCZC5+4qf0aE8KCLR1T4PJjAilY1k=;
 b=cOP3iuvbTuwfXPfmpYiijC+va2mAKLtqQU5xNviYSA4JVJ893FpamQG29NVjkl51JW
 dDeOa04GIQ/WBIxc9Yqj0tUhR5JluQMsAYiM6iAsE+SVpo59JBbpaC9MwIy0BBuXOS4a
 kwoKRE+ixWOb6wt6Nqu1LAnplok7rPs31scGr8hmXC1LV/5JazqINWZgrEMaHN3vuruy
 sOZcZVmbT6cXjngmKmAvna6vBK0PXAExRqS6JxZYJL5fFRlEnoX7+fZZA0RjBZxJzzSe
 miGj092xNv4gdwItdW/S7q7FZFRPgA4IV8qEmNkn40T5OsPbyzES9m5f9OiBQ+/iDNH6
 5H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AiCWdYM0ZuktKgNCZC5+4qf0aE8KCLR1T4PJjAilY1k=;
 b=IUK8LDUMP43k8Y2exW7zpTGdp7QGksTR3sDoYgZJXM+56l6Eev6b9EUIsIqVNkfQ7a
 zCmWziK4Z3FJXdZN3Shah9IMRnzNGZEq45EakIpIGk1aP+fLNuq0aXwn6gqa1AKcXoD8
 sewPNSeISL9QMlmJk8vhfAcxdQHGGTKlJj/wuHNpNKFiQYGjg8d/4q/KPUwvyrGyYVxy
 pINpmtNsdNmJvl/lSyjmsDiAQPHPi20HH4nv0OvuskyWkE1dbIqZQtawiLtEwKr7fhXt
 6PnwAT3Jy2gB+SuTZ7ugxmi1v1jueeZerpYHVoSZHxQc2ATs3vHJb5/Eh8Lx06jkChmU
 ltIA==
X-Gm-Message-State: AOAM531Ra84EVf7/dnT2ZOg938SA3sNGTR3pbIBrhSSZWYxBwXQ7V3VI
 +hiWjbjHUqXj35vHHOfwZ2xs+g==
X-Google-Smtp-Source: ABdhPJx5G2UCzXgAaNZHMMJnE9G6c9mFRMleWkAIT4dR4rZ6iax896qlzpD/kd5Dgj3eWljPu/NlJg==
X-Received: by 2002:a65:6183:: with SMTP id c3mr80974pgv.73.1628064862981;
 Wed, 04 Aug 2021 01:14:22 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com.
 [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id g26sm2067445pgb.45.2021.08.04.01.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:14:22 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Truly NT35521 panel
 support
Date: Wed,  4 Aug 2021 16:13:51 +0800
Message-Id: <20210804081352.30595-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804081352.30595-1-shawn.guo@linaro.org>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
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

The Truly NT35521 is a 5.24" 1280x720 DSI panel, and the backlight is
managed through DSI link.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/display/panel/truly,nt35521.yaml | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml b/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
new file mode 100644
index 000000000000..4727c3df6eb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/truly,nt35521.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Truly NT35521 5.24" 1280x720 MIPI-DSI Panel
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+description: |
+  The Truly NT35521 is a 5.24" 1280x720 MIPI-DSI panel.  The panel backlight
+  is managed through DSI link.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: truly,nt35521
+
+  reg: true
+
+  reset-gpios: true
+
+  enable-gpios: true
+
+  pwr-positive5-gpios:
+    maxItems: 1
+
+  pwr-negative5-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - enable-gpios
+  - pwr-positive5-gpios
+  - pwr-negative5-gpios
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
+            compatible = "truly,nt35521";
+            reg = <0>;
+            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
+            pwr-positive5-gpios = <&msmgpio 114 GPIO_ACTIVE_HIGH>;
+            pwr-negative5-gpios = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
+            enable-gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
+        };
+    };
+...
-- 
2.17.1

