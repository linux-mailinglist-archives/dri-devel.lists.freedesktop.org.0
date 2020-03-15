Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FE185D28
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE456E1DE;
	Sun, 15 Mar 2020 13:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99F76E1D3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:40 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c20so11746511lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qBUTf9GpIdfXPTFTOtKhRJPsPUGuxMdiWCVmQGYT+2k=;
 b=Ws97P9zpToL4JcvpOFuzbNwuodP493lrUIGqjz7Zcvs5p1A1/gKzilbW1uym66jyLE
 ymvI8jhc9OblLE25BPqkdYMIgojPct7I1RJIH8jos/4GD8pzzT7Anik8FH2g/8Nf2jkP
 1ZeKH2CuFjRedUyUfdqmv81EUOyhQLeChEURQvA9P4ZF5GVf8xR5XJIYupNmYYWHrtpb
 M2WiYmSyD935LzvIqFZmiGbSjOW1WoJjabQlueBLHI0q+OO5TVYTbFuTZRJHiQXaWFht
 MYgttYKSf3dVIGDtITV1xogzvEc2JenZJaNpYY8jQHi5NdA0qTJDgolpkkhO8xP5US/b
 /3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qBUTf9GpIdfXPTFTOtKhRJPsPUGuxMdiWCVmQGYT+2k=;
 b=G0/vFAY99pLn4+a/47a+K57vBrxVVRDXF+ddrpf4QaLFSBuplWHA+i0LzUR4jh55e0
 79jBwnddvzUCw0P2reSmBe6m4sqy4CB4jJyjTLXvtp5F933dDN5dPjHmyhZTKaGovi6C
 Ds3Wv6grIg1uV3SzI40FXbrQJgg0EHa1zC6LrYI3zStmjJ5dxEldsEGxikiGfdDpe4lS
 AnAeiBzyHNJJ9PDCUWuniJm9W38TMGHlcpr0yqZFEXXjZQFVDCM2U0CygGjcWuvhyg8c
 g8+vZyvgOSlcRSRcJCvuZ5BzgyzdsexQS9Xd8NKGTu+ua7IqNsE+3KGa6CRPftZ7Ptda
 BNjQ==
X-Gm-Message-State: ANhLgQ1NXhlqmXtm3QCeYsvNVLf6+B69ylS1l2t5j1+fO5XkidOT61iZ
 MeS5Vda2gdu6Eg+kv6ZPI6tt7Egv11s=
X-Google-Smtp-Source: ADFU+vvTQEq/cvWDAYSQIlZsIN9Cs1P+wx3lsx1bi54HOkveLS6awGenZ0u5wIN3aYPyVsmSKYSUxQ==
X-Received: by 2002:a05:6512:31d3:: with SMTP id
 j19mr13911445lfe.178.1584279938846; 
 Sun, 15 Mar 2020 06:45:38 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:38 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 34/36] dt-bindings: display: convert seiko,
 43wvf1g to DT Schema
Date: Sun, 15 Mar 2020 14:44:14 +0100
Message-Id: <20200315134416.16527-35-sam@ravnborg.org>
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
Cc: Marco Franchi <marco.franchi@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/seiko,43wvf1g.txt  | 23 ---------
 .../bindings/display/panel/seiko,43wvf1g.yaml | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
deleted file mode 100644
index aae57ef36cdd..000000000000
--- a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
-
-Required properties:
-- compatible: should be "sii,43wvf1g".
-- "dvdd-supply": 3v3 digital regulator.
-- "avdd-supply": 5v analog regulator.
-
-Optional properties:
-- backlight: phandle for the backlight control.
-
-Example:
-
-	panel {
-		compatible = "sii,43wvf1g";
-		backlight = <&backlight_display>;
-		dvdd-supply = <&reg_lcd_3v3>;
-		avdd-supply = <&reg_lcd_5v>;
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&display_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
new file mode 100644
index 000000000000..9195de40b21b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
+
+maintainers:
+  - Marco Franchi <marco.franchi@nxp.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sii,43wvf1g
+
+  backlight: true
+  port: true
+
+  dvdd-supply:
+    description: 3v3 digital regulator
+
+  avdd-supply:
+    description: 5v analog regulator
+
+required:
+  - compatible
+  - dvdd-supply
+  - avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+        compatible = "sii,43wvf1g";
+        backlight = <&backlight_display>;
+        dvdd-supply = <&reg_lcd_3v3>;
+        avdd-supply = <&reg_lcd_5v>;
+        port {
+            panel_in: endpoint {
+                remote-endpoint = <&display_out>;
+            };
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
