Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780A51CA681
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE366EAAE;
	Fri,  8 May 2020 08:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2672F6E12C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 04:13:34 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id y6so3667747pjc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 21:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Db6qOihor5Bj8DkFXZYYMAre3zfCOsyEXmYIyTZWgqc=;
 b=HZa4Ftrmwnb5Ap1XUema1giGFlB40rvdwsHrEWexpeZ6u5tBF43Pq4MFzxAYUu84aI
 JunK7vj/+KG0NUE2q78MI7A8GNKQoC+8zU6hWn6d1wy/rzVCxyRUPShkVXyJi/z4rZ8X
 i25uLgD5ruVcCH5djhBBhZKzsS361Rev4ajBHWYRd4FOcqm3ApHA7RHKdjnCKfSxMdL/
 OYq7KHB0yYJoOYEjmMuKH2w3YwgJDQNmQMo5R1V5fS/spm2DHonKxkvkoJEquM3oeLcX
 SCQtrBzKRLKh6kVEGNoNtw3jUeLMTnSQoqR3iHXqONoXhHB0amdTdYRt6MPXFkfyz2Fy
 C1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Db6qOihor5Bj8DkFXZYYMAre3zfCOsyEXmYIyTZWgqc=;
 b=VxK/8/fqqrVtepl1WsY2eo/iWqmZK9p9ptTO7raPivv72N2TJafZpGdBulmct4lSKA
 c2oTELRuCSi8UttwDuS7D2/HZMchJiUwUGR9+ltNQRExIBWtz4X3zdgqnvtsZOF4/BJS
 XSfJWXuxlf0seiAkCOCuO94UUWXEDnGE3e2rXQk8hnWpUYq5PrXoQd93EPsd7VaF4G4e
 AXtnR34kDrxP+UpbESPJ1ySP08/Wwf3dn97Lbw5m3m22EKLSI8SaqVdyWxhj+z7e7Dna
 Lk/xXBdiJ9Hki7koFJvl0quyOtL7IzXTDX6K9F4aFtqkNOxqdemiZk9KbcsB3njWdF1l
 Rirg==
X-Gm-Message-State: AGi0PuZTlNPrcK0bopKalOUtHlNzpsAFLAEGNq6Tg1VDloCmj73Cnv7L
 bdzQ+T2HOsjAvCZHM2jMshE=
X-Google-Smtp-Source: APiQypJLGCxoTkz92z+vdPnEwubOafhAAPIJICKtjIgVVEZQPHbclNonxkvq6mn3XY2pZohgYlX7KQ==
X-Received: by 2002:a17:90a:208f:: with SMTP id
 f15mr3825087pjg.60.1588911213774; 
 Thu, 07 May 2020 21:13:33 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:33 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 3/5] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
Date: Fri,  8 May 2020 12:13:12 +0800
Message-Id: <1588911194-12433-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
References: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

Add documentation for "ilitek,ili9341" panel.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Hi Rob Herring,

This patch [PATCH V2 3/5] about ilitek,ili9341.yaml was verifyed with make dt_binding_check

thanks.

best regards,

dillon,

.../bindings/display/panel/ilitek,ili9341.yaml     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 0000000..94c2b15
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,68 @@
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
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: stm32f429,ltdc-panel
+      - {} # ilitek,ili9341, but not listed here to avoid false select
+
+  reg: true
+
+  dc-gpios:
+    maxItems: 1
+    description: panel spi dc gpio
+
+  spi-3wire: true
+
+  spi-max-frequency:
+    const: 10000000
+
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - spi-3wire
+  - spi-max-frequency
+  - port
+
+examples:
+  - |+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: display@0 {
+                 compatible = "stm32f429,ltdc-panel", "ilitek,ili9341";
+                 reg = <0>;
+                 spi-3wire;
+                 spi-max-frequency = <10000000>;
+                 dc-gpios = <&gpiod 13 0>;
+                 port {
+                         panel_in: endpoint {
+                           remote-endpoint = <&display_out>;
+                      };
+                 };
+             };
+        };
+...
+
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
