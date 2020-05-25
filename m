Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680151E07CB
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05BA89DF9;
	Mon, 25 May 2020 07:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD54889D61
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:41:29 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y198so8286468pfb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MtXq2QWDOoN0CBKSeH60c2tJASyOu/uu0I8Lzq6RPtM=;
 b=Uu0Me0dGDuqxYix7sKTmgNEVZhxag/XQKpN534oTVw9rKWGtvA9xHjsL1UJK9EHqtM
 nTKC1y2cevDfXsqAT0EYJvl8CF73OhyMOohDURns9BNuV5Rc9adO0KEa3uwcxCsnP/mx
 EyB5Hjqc6Sa+myM+jtbKMHbS9WzPPlgjS8Oe581UgE7bvXzAOGSNdHyPXhR1AGfwYaOc
 rPtop39Crps4TEq4vIoNsfU2i/khaZbcUJIm28SNH/z0XB7uXoNdttEsUFzSmFjnhCKB
 mdAoD+tHQiD5gk3Qoo7RpLrnvHVJ/+WPuPEmDrEWFXf7JwJSPVcW1ggvNyeKJeJY1grf
 FTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MtXq2QWDOoN0CBKSeH60c2tJASyOu/uu0I8Lzq6RPtM=;
 b=A8GS4klW1t335Qj5IpKl3HkszQcvoOMr2tDddxM+TKLsjqgzHhweNctYkzOM2rW78W
 N6m+ChJ840M45RA2bxdZ4t60YM5L+Jx/ycTIGZaxsiMdt1z7LQ2OsuBZx4Ml0FXawKKp
 +m9rChtBNIcT0xw/pFXeT8YZkiXCGG5UD22EobcnLvH4V0+NMqirzwd4DhDzkC+iqgDj
 N6RlcCwQyvEhgSuQBySJYH09EKXNHiepFg0O5LLOHqjrgpkK2nixB/8WBfV7g8HB3Inl
 QWb3iumjCx7kFEHIoDwhvjQyZNaPgaG95cdX3Pg4DI9mqq+t5r0WDjkaI6Qm2Dw3Hap4
 VBOA==
X-Gm-Message-State: AOAM5317bGV4t/tGG6Dk5wL9uVYxLJEYCF5tAclZOa3BLZyR29hvw2gl
 RM3marANhO60aBk2RwjHuNQ=
X-Google-Smtp-Source: ABdhPJxXQqJcbq5UIqIaFFaMYgZDDnOf9VW5SW6flIYRe44Lc/7NrxypHleIUL/neqr4Ngl52ftzNQ==
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr23931653pga.312.1590378089383; 
 Sun, 24 May 2020 20:41:29 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id 7sm11981695pfc.203.2020.05.24.20.41.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:41:29 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org
Subject: [PATCH v5 4/8] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
Date: Mon, 25 May 2020 11:40:58 +0800
Message-Id: <1590378062-7965-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

Add documentation for "ilitek,ili9341" panel.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 .../bindings/display/panel/ilitek,ili9341.yaml     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 0000000..2172f88
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,69 @@
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
+  streams with 16 bits or 18 bits.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # ili9341 240*320 Color on stm32f429-disco board
+        - st,sf-tc240t-9370-t
+      - const: ilitek,ili9341
+
+  reg: true
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
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
+  - port
+
+examples:
+  - |+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: display@0 {
+                 compatible = "st,sf-tc240t-9370-t",
+                              "ilitek,ili9341";
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
