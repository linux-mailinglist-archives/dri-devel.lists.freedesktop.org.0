Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2F185CF5
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A7F6E19B;
	Sun, 15 Mar 2020 13:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DF66E0A1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f10so15604049ljn.6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nu/r+Huhn6AYJOGmQ6c5zAmhio2Nquq+BTmg7Je8VJM=;
 b=m1HCMOwaFHZJcQOdFpg0mAHY0vsRfDWBU9O9sekPG3fDXSGhoFCaa1kbavjJru4FZP
 ORqnY6LlsdmHLqRG9KAzOcbOMDWIA05+DxP7C5ob8WPsAZckqD2joyrVST3aA3q4vVH2
 kZNHEtfjjbdShYc5WkQPWyqEGBGLRYui3eCHUgQxJjqwYpedh9ndLBBkXoLnGuVBuQF8
 x+PwZj0juwgKKy3/8t4rN7IQrW7vkZNju3+7sYmGAy+k0I8Ji2zejZNg38kudL/ywxn1
 jHiea+QwEm0Sfj5Yu2Tal1gQFsIxBck1aFy1M8B0b+QcOuTSGA9Ogjy/VvUogpMiNJzb
 c0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nu/r+Huhn6AYJOGmQ6c5zAmhio2Nquq+BTmg7Je8VJM=;
 b=GIeAtIU3BPFe4Z2J6dqj7G4JccLFsGIKmkFlR8M/llAFswF9wxuY+LJfg0gw5dQv1k
 kYPa8RD00ZtzocWR3deQwIlf6EI3ztwEg0y/m3s8RLtE7GKmYAPiWetSk4sOPWLCbom0
 nouWsV1AqNk+YpyjJA/oWEBEVXcNTHsNZ9h6vbCcwhei549HQ+8GvxmdOtpGECz79UYe
 sJgZe/i4+5gZPVmAx6geusVek20NelX2lyNtLr0j3uWoD0vP0k7VyJmYvzZh3Xjttv98
 1EB/dIRYxoW7Y49fl3mMGWmeMUVH4SM33xX9XkFKaTOQaQMny8hxv0otXhnZqXQAyspe
 qDHw==
X-Gm-Message-State: ANhLgQ17rXKOG890azqO0McUVJY5yi27EEvmE1U18u5zLdJJc719KaUd
 zxx0wdaFPUBu371pVpmsG4h2sewB2+o=
X-Google-Smtp-Source: ADFU+vvlJTe4GHQcEV/ZdV0DbLDKFm/ZvBiA+whjD5EOIPP7wCtCV7p8oGshivkflNE/azzSGlNeVw==
X-Received: by 2002:a2e:87d7:: with SMTP id v23mr12712633ljj.10.1584279902237; 
 Sun, 15 Mar 2020 06:45:02 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:01 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 16/36] dt-bindings: display: convert lg, lg4573 to DT Schema
Date: Sun, 15 Mar 2020 14:43:56 +0100
Message-Id: <20200315134416.16527-17-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Heiko Schocher <hs@denx.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/lg,lg4573.txt      | 19 ---------
 .../bindings/display/panel/lg,lg4573.yaml     | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,lg4573.txt b/Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
deleted file mode 100644
index 824441f4e95a..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-LG LG4573 TFT Liquid Crystal Display with SPI control bus
-
-Required properties:
-  - compatible: "lg,lg4573"
-  - reg: address of the panel on the SPI bus
-
-The panel must obey rules for SPI slave device specified in document [1].
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-
-Example:
-
-	lcd_panel: display@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "lg,lg4573";
-		spi-max-frequency = <10000000>;
-		reg = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml b/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
new file mode 100644
index 000000000000..b5b475cf8406
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,lg4573.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG LG4573 TFT Liquid Crystal Display with SPI control bus
+
+maintainers:
+  - Heiko Schocher <hs@denx.de>
+
+allOf:
+  - $ref: ../../spi/spi-slave.yaml#
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,lg4573
+
+  reg: true
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    spi {
+        compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        lcd_panel: display@0 {
+            compatible = "lg,lg4573";
+            spi-max-frequency = <10000000>;
+            reg = <0>;
+        };
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
