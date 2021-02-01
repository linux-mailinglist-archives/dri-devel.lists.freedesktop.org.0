Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA030B9C7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F06B6E90C;
	Tue,  2 Feb 2021 08:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CCA6E99B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 16:53:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id f16so13217444wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 08:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CkmdVzgNbNrIaaF20+A1gXu1TaJvHR1vrtcVh0MWaj8=;
 b=Sa0x2A5sCoxsagip1yKOtVtJUhS6O2APA0VMshlVpCWK3yA6a8PQK0PKSiztYswM0Q
 /6vKdJ+nnspAa3ZwthiKiZ4tMqTzCWJL4iHdauHyYNig8CbO9hb3QnE4KgSeufSltK3j
 r1Nh3qgJkEoDT8czHd83aImvm8GjE0NBLdCmtFh1C2TR0+FlyKAD/vzfHxEW8V5Y/+PM
 b+nNXY/aW3PWCIKsLGzkrqwZ3A3//gYodrlHeOs9tMNgZzC/29AHEi3V/8gtX81Sp19d
 e0wd6f8T2j1lfNrf4n8u506htnju1pNP1TitxF18PSASxUS7CHss3TaOVPiauf6xfWuG
 d6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CkmdVzgNbNrIaaF20+A1gXu1TaJvHR1vrtcVh0MWaj8=;
 b=JplimfTUkBgNCmeAdiLviXgdjbbpCnwdKlmOolKkIxHMuLbxyZPyeGEbooTJe8bzid
 17856nRSrO3swTatYOAWQuGA2rvpZMOIwzR5U3hd5LmFwpsODCN3Y433t794H5hEgmwu
 dYY7zFVH+zmoKDyXupjnpCvg4KEIJ64j16YJkE0u7iPl9v9d/OcB+T6jwf2qqy9ld9UE
 9ATBNIcw8/HHUqn5L3+El2GZMXGpeq1HtPbpkGw+1P8OTrUvKUaUC9wRzYaHxDkvVKmC
 E1xKWb3aYhiC27wcSp8VjrDjBeQRQ4q6FYTz25ecEoPTk79NqZmDJAjc93vm9z1V0irH
 OrNw==
X-Gm-Message-State: AOAM530JKp6c4ajonx5N0Fw41Pgz0FZ+0zk26jjRFxPVwxWjl/2KzT0M
 oGPjoc5ep9/SORnYJreaIbs=
X-Google-Smtp-Source: ABdhPJwL/oyWhS2IOVT3OkuLeII6y6CxfbUrkxFI5N3fZy8o1bHz5oUwfDqgwG6r7Sc1bGBwmCN/8g==
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr16118185wmh.64.1612198413859; 
 Mon, 01 Feb 2021 08:53:33 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id r12sm27749156wrp.13.2021.02.01.08.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 08:53:33 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
Date: Mon,  1 Feb 2021 18:53:05 +0200
Message-Id: <20210201165307.51443-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Iskren Chernev <iskren.chernev@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Samsung S6E3FA2 AMOLED cmd LCD panel is used on the Samsung Galaxy
S5 (klte).

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
Add a simple generated panel driver that supports on/off and the corresponding
binding documentation.

Changes in v3:
- fix dt_binding_check issue with missing include
- fix panel type (cmd) in kconfig description

Changes in v2:
- move bindings to separate file, add 2 regulators
- add standalone panel driver

v1: https://lkml.org/lkml/2020/12/30/293
v2: https://lkml.org/lkml/2021/2/1/313

 .../display/panel/samsung,s6e3fa2.yaml        | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
new file mode 100644
index 000000000000..c751ad589480
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e3fa2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung s6e3fa2 AMOLED CMD LCD panel
+
+maintainers:
+  - Iskren Chernev <iskren.chernev@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e3fa2
+
+  reg: true
+  reset-gpios: true
+  port: true
+
+  iovdd-supply:
+    description: IOVDD regulator
+
+  vddr-supply:
+    description: VDDR regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - iovdd-supply
+  - vddr-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* from Samsung Galaxy S5 klte */
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,s6e3fa2";
+            reg = <0>;
+
+            reset-gpios = <&pma8084_gpios 17 GPIO_ACTIVE_LOW>;
+
+            iovdd-supply = <&pma8084_lvs4>;
+            vddr-supply = <&vreg_panel>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

base-commit: fd821bf0ed9a7db09d2e007df697f4d9ecfda99a
--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
