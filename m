Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A831C69A7
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE956E49D;
	Wed,  6 May 2020 07:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4A89C51
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 06:31:45 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id f6so521246pgm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2Kklx6WNLIBEUnlaQW9xoqKKQiAQpc9O2rLkXNwH/Ew=;
 b=bU7UCV6bT4jUeZ7RQOMu3wRGQ+cZ2Cu8ugjmU1y3EAWGuBnm6OpfWbbpm6You3RxiK
 +LNF41UdPSiADhh5JhmW871M4g9IyrtTY1VBBlcdOnXjrbiSLoEC9cw73n94zcbxC/h4
 uTcyuFXuXjfASNKh0szxgXDzYvSFQaxJAVYZs3yeVCNIzfKVS9Js1tAMtPCytYfB9FO2
 GbZGWunwUSAsMp15drDmbitMgBncVnT1rOujQS3EKdwaSx98nrVIOieXLoRGhBPGvOlI
 HBBSfV0L6Y4Ovy8H6VTXXQk7wj31wccLCPh3rMi08OpmJ7Pn1VfItyFPGxlWIZf5+Jxc
 Kn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2Kklx6WNLIBEUnlaQW9xoqKKQiAQpc9O2rLkXNwH/Ew=;
 b=K5/fPeWysXfm3UmFujDC4ACsIG0+6YgU2qS8zua8UrQJWsU/hOfjiRDrgsxgORGITu
 GX0nZfON6WQeiGmpKnpY+pqic2orE8DEN1vUL6qkYiNp1lKq6VuBmFpXiSA8yiTnhkjz
 sCCkJ/MdL0rbTkHIk4sxAeM8vJ1veeRxE7IZ5K81ymJQjuusI5wSiV2Pfd/+GsL0RxNR
 2h4t65rCqYmo3bEMuswEC0gNGjdQoAkxRQ5CXKxV3mpyo7uwAgUexFLIRzPWd30v17a/
 xHsQzIh/jQ9VZaaud+R/pRrk6rYmVKB0EWc2jUY3ZEYdb6Vh2wfQFvCysALgOlgWSJFh
 FVFA==
X-Gm-Message-State: AGi0PuZGG0TaPD91WOwDbQig0wC3s4Quts3Nr741zrzc/L1PzfAx213r
 w6xTRlOCzd3s33bctFYEX1c=
X-Google-Smtp-Source: APiQypJSzYnaLatTQqkl0/D+fk+Akri+ROm11yE/Km6azhEgc2fuE8h7m7GlL200Ebyzf1EpLGYWMg==
X-Received: by 2002:a63:b51b:: with SMTP id y27mr5362061pge.400.1588746704798; 
 Tue, 05 May 2020 23:31:44 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id y3sm3771975pjb.41.2020.05.05.23.31.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 23:31:44 -0700 (PDT)
From: dillon.minfei@gmail.com
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Subject: [PATCH 2/4] dt-bindings: display: Add ilitek-9341 binding
Date: Wed,  6 May 2020 14:31:33 +0800
Message-Id: <1588746693-31078-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588746693-31078-1-git-send-email-dillon.minfei@gmail.com>
References: <1588746693-31078-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: devicetree@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

add ili9341 for stm32f429-disco board
some hardware resources can be found here
https://www.st.com/zh/evaluation-tools/32f429idiscovery.html

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 .../bindings/display/panel/ilitek,ili9341.yaml     | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 0000000..5138f56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek-9341 Display Panel
+
+maintainers:
+  - Dillon Min <dillon.minfei@gmail.com>
+
+description: |
+  Ilitek ILI9341 TFT panel driver with SPI control bus
+  This is a driver for 320x240 TFT panels, accepting a rgb input
+  streams that get adapted and scaled to the panel.
+  VCOMH outputs.
+
+properties:
+  compatible:
+    items:
+      - const: ilitek,ili9341
+
+  reg:
+    maxItems: 1
+
+  data-mapping:
+    const: stm32f429-disco,ltdc-panel
+
+  dc-gpios: true
+
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+
+examples:
+  - |
+    panel: display@0 {
+        compatible = "stm32f429-disco,ltdc-panel", "ilitek,ili9341";
+        reg = <0>;
+        spi-3wire;
+        spi-max-frequency = <10000000>;
+        dc-gpios = <&gpiod 13 0>;
+        port {
+              panel_in: endpoint {
+                    remote-endpoint = <&display_out>;
+              };
+        };
+    };
+...
+
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
