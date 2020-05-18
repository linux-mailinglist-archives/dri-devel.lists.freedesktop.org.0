Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176331D9093
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AE96E51A;
	Tue, 19 May 2020 07:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E1A6E057
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:09:58 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id ci23so1522832pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MtXq2QWDOoN0CBKSeH60c2tJASyOu/uu0I8Lzq6RPtM=;
 b=dHoYOYK5C7B8o27fpfv0M/0F5nWFg9K5JTaF8DiGokgF4H7Hk3ORmVZhH3ivC7ze8u
 9GAjIx2MoqagVgcDWJ6W2sYD+coutMesqQ/4GpWyxLl2zddTgTzrnncEKk+loHjJTcGw
 L/Y5RJWiKplc++xkLT0gU1mfy/6xT5V5OLziXZkcymlb+cpNv+KfwdLRHdhzcp82TUg0
 lOPL9DG2zyNY9DLYMuASfG4YUn+ECzfxEsqLPrrHlKxMpfMU/FbOrPf6OE3KO7bv1FZE
 TZUTDKw68lNWMqNX6eD7G1Sn+daagSzcGiZIkyXMJGUOonAgYk7SqqajzgfcMjb26RC9
 2d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MtXq2QWDOoN0CBKSeH60c2tJASyOu/uu0I8Lzq6RPtM=;
 b=ajsJVGNxklpKj1bShcEDyazw4iw20QQnvpXzzxZVND8nb8GXZO8dMVaXg40quRsUJR
 SIa+s0HI7sBboYS0fUt5tFJtwmQ27Gq+WKxpwnKnfiwIdIXp3JlvOHD3Gi3KIAKu0XHc
 YovH/DGMPYJBsVYqz2RTqX5v/ZYPEzNpQd5YsYjqtIEZwK1fAASYyvWYVmbvuLp0Me6+
 DeFw03RFO6HW9EqLG+DJbINpKIokWW7zgJOoK83xzKWrt585GwvtFDLcsb8nVVhga4P3
 oVjZqMx0K1i/9mCLWW+G5p4dLCXHdDQ+FAZ4Ev1IWQjnhgC3rHGfjdmCFmtO+EDe3ipo
 XHEA==
X-Gm-Message-State: AOAM532/iyOZyZGlGakfwRSPfRF2/92H4LtYVOonQpyzX5u/5xhqCk/H
 EB6XiwasNlF1zeT8lhm181o=
X-Google-Smtp-Source: ABdhPJwzHEtadDk8lKvsMZLyWx4METgRLJ9kcXb9N5uz/umBI8IRQjS4U+6uHzPcAIXwk0xtRO1fxg==
X-Received: by 2002:a17:902:b187:: with SMTP id
 s7mr16222773plr.60.1589800198488; 
 Mon, 18 May 2020 04:09:58 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:09:58 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v4 5/8] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
Date: Mon, 18 May 2020 19:09:22 +0800
Message-Id: <1589800165-3271-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
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
