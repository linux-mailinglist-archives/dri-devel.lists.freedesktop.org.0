Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21DE1E59A0
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F60B6E426;
	Thu, 28 May 2020 07:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB46A898CC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:28:01 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d3so9830774pln.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nVArjOONMUkkYFoFrci5k0663uSmHnt2FzTEZnX/GkE=;
 b=fNuI+idsbzoB3q+zS+ICH8mO5EylmfUuUOqZmykgFsWg7vs6FF87px9saoDbnpMB1N
 9Pt6MoaMW+ot6Kjuwk95RYR4F8rLKpcDYuvEvPOPftpgTVRx/KD0Gz1y2dCPMWKOrZcE
 aX+Nij+DtOvqgqXWrssP49bQvzkFQuV0TsLmqFgDyG3xOZayLc+E2xe88K/lunp1mlOm
 uhJiCNPxCW/g2h4L9YdqTpAqKNA6BUHtm3B2QUJe/FsjT4g7IE63UzNB5x5j2z09Iabr
 +peSmHWwb+BBTn/5IUJ1/Yb71gjsvAYsMeRC8gC/zKp6zOM0uqvUXaAbPgJf/N+51uig
 OoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nVArjOONMUkkYFoFrci5k0663uSmHnt2FzTEZnX/GkE=;
 b=JjeaoR5jyhOiFm9dCd8s89dbVwNkPFavGO5MFwBgFLoi4qHb0LisoWmcFsx7jCHhyU
 F9sPiL3bHPxtwqX9V0p3MT5Xku5Apy4g07E9CdyfarxJSKZI3RAgWyVqAl2hffXHk8pz
 1AxIG+yU1piIFIYnmNAQQoIhU48lqmDYsgroTUWXQ1TGvrkGRWli1s+0FU4FvA3WSeJx
 BwkwRqHhV0fxU+yLCChKQ+faOAeFZjOgaQfYO5qj9z/ZCqGsJgTZ3LqfZmi/IEB9lHuu
 12JZV7khErTBQaDp7rKJBhyeM2Y/tHLjULsfwEOP2+J1n48vF2URRE59zoL+gNkcA8W7
 oBpQ==
X-Gm-Message-State: AOAM530fPDpEHVm8xKfnsouxe7mOkC53Sxe0T1P+Vx8FqPZE7E/G+UdH
 HFIVFqqYgaoY3wH21+R6fFs=
X-Google-Smtp-Source: ABdhPJzrL/U3t1oZby1+25XxH8pSctzfppOL3s8v/Pl5c9EFRQsy1WnMGrduSxxRz3uMkZe46M4AsQ==
X-Received: by 2002:a17:902:7b96:: with SMTP id
 w22mr4863111pll.232.1590564481460; 
 Wed, 27 May 2020 00:28:01 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.27.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:01 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Subject: [PATCH v6 4/9] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
Date: Wed, 27 May 2020 15:27:28 +0800
Message-Id: <1590564453-24499-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
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
index 000000000000..2172f889af3c
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
