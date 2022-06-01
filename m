Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4B9539E03
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F6B113007;
	Wed,  1 Jun 2022 07:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2550E112F1A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 05:18:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 820DE5C0280;
 Wed,  1 Jun 2022 01:18:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 01 Jun 2022 01:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxfierke.com;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1654060700; x=
 1654147100; bh=LNaQnDIeXyZYzF7N2J0Cp/6thqsA6QQKqx5EVMptTd8=; b=2
 J9qVEiwWrlBMNs7uItTHCGe1vwt3n7G/o7D2NzkSBkzi+VNxNgAdu8vRn4WW4MnD
 tZdqsCscBgPkchQkVsYiY657dqBJ7cuNA7f170lC+e5VPx5iEzBcUNBuSfD7CEEe
 WWR2aAY/UcsuZeIoht+jfDu3IYKTdNbshTlM9hTy08VJhZ7krQj+ZYq5w4Ao1LXd
 4t2LH+H8F94TZT8dQE/A0cYPa7j8IDlWVsgSz8QQKInVS+TuhR7Ao+w5UYD9ie9w
 bNOmKFoW6FubPrNswNycEUeKnC/BBuxfoM05hV9n/BMYhweT4Ozsq68UmVb8JX9z
 KubcQABuxCuj1Nc4xNH+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654060700; x=1654147100; bh=LNaQnDIeXyZYz
 F7N2J0Cp/6thqsA6QQKqx5EVMptTd8=; b=vZO4nOqGw80aBh42V7HL0tcd7+zSD
 uXNQdVomcCc7xlfIi0pFZcrhyZ2cF0Sew0JNsZqQ9FeEIHjnAhLntoQ5/EnpN74S
 wBIqkIgq/QA/ZulLsxfOdqSgt7uCZZC2nGQJuWHXivnf0hN0DOwfV2GZWdAtDatj
 nuobcyh9TbxjJ8MgR2EcER9Qjw/347P8dzgts9JoUet8tbBWC0LgRbNSeXfGPymT
 5/hn+CqQjiXEXFHMBhCtUBlXbkXMnEea9prDkMHLmHtRYaIUbAwzOseU7PN3KuC4
 4SsDouC3kS53XKT9yRvBF/hu4qMkgRfIt+j1viy4K1N3qPdDYYdQrPNlA==
X-ME-Sender: <xms:nPaWYtieBDABf8CVFJRaLgHiwFiVG8WW3JXs5Mk2qho0_FM8aXvM3A>
 <xme:nPaWYiDOw5-L5RKXzc5d164ooOkJgk-k55nbrGea7dfPgBGLxgycEAuwTA5gTLtAH
 V2EasVP9VyWbdkzTv0>
X-ME-Received: <xmr:nPaWYtHbb66jXrkVZ7vb_I9u7OSqHDtR3dkB1CdefBrR1nsIFst0VnRjT7DevnyYpzzV8kfH1Wtt5qiXePajFvmEtgQ2gJJ64Ba0FbY-ftZxcxe7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepofgrgicuhfhivghrkhgvuceomhgrgiesmhgrgihfihgvrhhk
 vgdrtghomheqnecuggftrfgrthhtvghrnhepjeeugffhgfejkeefhfeugeelgfegteeije
 ehheffhfektdeuffehheelvddvkeefnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdr
 ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigsehmrgigfhhivghrkhgvrdgtohhm
X-ME-Proxy: <xmx:nPaWYiTKrez3zQLLXvhBHZnkoGpEFsARSTJYW-Z9utI6OWEbZTwEeg>
 <xmx:nPaWYqwtD7eYkXqkoWy3KQkg7vvMxejYb4MncYmi-1TP81LGRLehFw>
 <xmx:nPaWYo6W9VfK0FPZbVYiWxd8t-pSRkKpQx4Zs0wrsJmND1NIgi1vjg>
 <xmx:nPaWYlo3RupsZ0UAL29gJTyZDxMNnW_oKi87tb-Gw1-jMtNh27Fm-w>
Feedback-ID: idee9475d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 01:18:19 -0400 (EDT)
From: Max Fierke <max@maxfierke.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 2/3] dt-bindings: display: Add bindings for ClockworkPi CWD686
Date: Wed,  1 Jun 2022 00:17:47 -0500
Message-Id: <20220601051748.1305450-3-max@maxfierke.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601051748.1305450-1-max@maxfierke.com>
References: <20220601051748.1305450-1-max@maxfierke.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Jun 2022 07:19:08 +0000
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
Cc: devicetree@vger.kernel.org, Max Fierke <max@maxfierke.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CWD686 is a 6.86" IPS LCD panel used as the primary
display in the ClockworkPi DevTerm portable (all cores)

Signed-off-by: Max Fierke <max@maxfierke.com>
---
 .../display/panel/clockworkpi,cwd686.yaml     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml b/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml
new file mode 100644
index 000000000000..935a33b9305f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/clockworkpi,cwd686.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ClockworkPi CWD686 6.86" IPS LCD panel
+
+maintainers:
+  - Max Fierke <max@maxfierke.com>
+
+description: |
+  The ClockworkPi CWD686 is a 6.86" ICNL9707-based IPS LCD panel used within the
+  ClockworkPi DevTerm series of portable devices. The panel has a 480x1280
+  resolution and uses 24 bit RGB per pixel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: clockworkpi,cwd686
+
+  reg:
+    description: DSI virtual channel used by that screen
+    maxItems: 1
+
+  reset-gpios: true
+  rotation: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+        compatible = "gpio-backlight";
+        gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
+    };
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "clockworkpi,cwd686";
+            reg = <0>;
+            backlight = <&backlight>;
+            reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+            rotation = <90>;
+        };
+    };
-- 
2.36.1

