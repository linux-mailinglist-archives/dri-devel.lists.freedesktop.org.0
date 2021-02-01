Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614DC30B9BD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A3F6E900;
	Tue,  2 Feb 2021 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F4C899A7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 10:37:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id a16so927308wmm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 02:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y4HDfAIXn4csaJdLWtNsEmq7IQCGJl8To6HPJWasocw=;
 b=KDyMx9ldojQIM8AwkDVYF8F1ETlxUKunw92WGM4JluCVPQT9YLW+qKb3DCCNyzOIEw
 NP4PtcLXRr3lHSJyC1yTWAfnHvtTD4Ap/wDHG6AdbHLck8aVffJXZlWGdeKoOq1aPjjm
 d5YIQa99intc7jlL6wVD4JMbtMmRYvYSl47idsrQEFyuIhjgewEewXTLXYIBcQVAkVI4
 0Nx0wYogCKbwJzV0llHwUADc9lRSDCmM0cDD4i3/1sQ5Y1KPaKmvzpC0/TDtwYzoip+M
 sXRexM2tIl1DLv3NpYQcfeQ/Q0R5RPGe51z6W+/6ThTyRf3Zxff+5AeviBAEyHHMO/K1
 QZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y4HDfAIXn4csaJdLWtNsEmq7IQCGJl8To6HPJWasocw=;
 b=mFmEl0Tr64pOHziRcX0Hd7wiTjGFBY4T3WA6YnYnUnYVTWgzEwtpC701mvOyk/co/n
 DIeSbwYS1Xp24qI5dXtWlvZ/AmGvYVzS/XYgIXLPANk4bGSq+Lof5/g40uOBx6LXSNWU
 KpXizewtyoI4y56GZck/fFDnvJQlVXgQoDidPXOj4hjL59igso+ii+ge+N4wYHbIRmHU
 BLBH+waAx4xEXz0VMP4Und1yulPF67jbqb7F9WCon5eEtgzrREus0HAaLh9pAwly3Pdn
 YYX5xjL7caZIbNOO4L0u0LJ6EFn+tN+o9BSeLESUSKGJlmD9Fmfjuoqv+pJxMXVdp/4k
 82lQ==
X-Gm-Message-State: AOAM5320xGoJXHXMkKxTC+IYKTpL/0165Y5ple0XBMTiOYAjTJwlYJqL
 1hkbShhsRfql9wzVNt6tq7c=
X-Google-Smtp-Source: ABdhPJwnmYdI8hHeNi9Yhcx2VLE+xn7/xCz3CN08L3cPwx5ZZ0HUnj7/Ym4SfDktzPrKQoBLNeqXzQ==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr1297910wmk.17.1612175868447; 
 Mon, 01 Feb 2021 02:37:48 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id m18sm2243760wmq.1.2021.02.01.02.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:37:47 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
Date: Mon,  1 Feb 2021 12:37:10 +0200
Message-Id: <20210201103712.1619585-1-iskren.chernev@gmail.com>
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
OK, miraculously the panel turns on and off now, so the simple-panel can
graduate into its own driver.

v1: https://lkml.org/lkml/2020/12/30/293

Changes in v2:
- move bindings to separate file, add 2 regulators
- add standalone panel driver

 .../display/panel/samsung,s6e3fa2.yaml        | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
new file mode 100644
index 000000000000..a759150bd539
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
@@ -0,0 +1,62 @@
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
+    dsi@fd922800 {
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
