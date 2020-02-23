Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD3169781
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 13:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A796E17A;
	Sun, 23 Feb 2020 12:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D216E17C
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 12:18:56 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h23so6945471ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 04:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aRGzSkSHgczFsciecVAokfTdkPHn+AG3ECWjmVIUPgk=;
 b=dGguut1pzGDsUAgroOEop/ne3R93zfJLfz7iidgWLbPVomYfY7H+SH65RCkUKuMJLc
 BhaobR0xlOyDPyEfv3pF+S50xJjypcTH8M/bLrU+uH+Pdfq0ffWBGk+EIhGb1T/wkYZb
 fBw3s4e7aO8b9H3ZWxxvx4rl4QWLttro0YlKXHFnpkTa78q8bcVudm9vXtzhNEA1WEE5
 /g2Y4U3AQTeqWz7AKJcIny0cPVWQmwT7aer46uUrxRJ20BaMsNdCoGXA6rmqbSe28Zr5
 hxTZJjY44hKq3pvvU5/B1G0bDZ8S0sJhRADHi/C1niJNYt9LGk2yFqyHNEkSlTdbi6Y1
 8dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aRGzSkSHgczFsciecVAokfTdkPHn+AG3ECWjmVIUPgk=;
 b=t+afH2QUIVNW5GQwxyPqVgPHOFtjC+9+VfwOaFqoR3A3GYvFQS1aSKoybE0cwttswO
 k8Up25ELqp8TRpSanHTF3Cpdpf9H4D555JEhxRrxfpALvhubnPY3XVoUXx034fqjLa5m
 q7Fh89G2GOOzM/QI8fI37rUVIsVRKuIRVw9yV2rp6WGOnRgQiKeqz1Cw50zhLuvdZsEd
 xIeb7NBAW0xTGNF4GOWQHnU04e5mqlTUXKcQo1KaVpLAeaNXsaEjt0AVIVTv6NvFiHeM
 kxnSMI3nuKSyfRGqyotPuhJrrRTi+mIQUDAuR5iv+eqhfyr9Wybm4p7DxJXAexLWcssH
 y5ew==
X-Gm-Message-State: APjAAAVYQL/Lr2BBIh8OmYmy86TL1NT/samrmZRRQpyQiQs5LF49upMs
 xVNQOLog2A+N3URJEzWulVBKPg==
X-Google-Smtp-Source: APXvYqwG7AyjEOj+PMsDeBjBb+ptB1qKv1HeFB4H1TfJy+5emdbpard7QQkjhuLvi48koCsYed3HGw==
X-Received: by 2002:a2e:8e70:: with SMTP id t16mr27732613ljk.73.1582460335026; 
 Sun, 23 Feb 2020 04:18:55 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
 by smtp.gmail.com with ESMTPSA id r10sm5458553ljk.9.2020.02.23.04.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 04:18:54 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3 v2] drm/panel: Add DT bindings for Novatek NT35510-based
 panels
Date: Sun, 23 Feb 2020 13:18:40 +0100
Message-Id: <20200223121841.26836-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200223121841.26836-1-linus.walleij@linaro.org>
References: <20200223121841.26836-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds device tree bindings for the Novatek NT35510-based
family of panels. Since several such panels are in existence
we define bindings common for all, and define the compatible
string for one certain panel (Hydis HVA40WV1).

As other panels are discovered and investigated, we can add
more compatibles to the binding using oneOf constructions.

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rename file to novatek,nt35510,yaml to match the first
  compatible.
- Require both the specific display manufacturer compatible
  and the novatek,nt35510 compatible in strict sequence.
---
 .../display/panel/novatek,nt35510.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
new file mode 100644
index 000000000000..791fc9daa68b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt35510.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT35510-based display panels
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: hydis,hva40wv1
+      - const: novatek,nt35510
+    description: This indicates the panel manufacturer of the panel
+      that is in turn using the NT35510 panel driver. The compatible
+      string determines how the NT35510 panel driver shall be configured
+      to work with the indicated panel. The novatek,nt35510 compatible shall
+      always be provided as a fallback.
+  reg: true
+  reset-gpios: true
+  vdd-supply:
+     description: regulator that supplies the vdd voltage
+  vddi-supply:
+     description: regulator that supplies the vddi voltage
+  backlight: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi@a0351000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel {
+            compatible = "hydis,hva40wv1", "novatek,nt35510";
+            reg = <0>;
+            vdd-supply = <&ab8500_ldo_aux4_reg>;
+            vddi-supply = <&ab8500_ldo_aux6_reg>;
+            reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+            backlight = <&gpio_bl>;
+        };
+    };
+
+...
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
