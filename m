Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90724D6710
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91210E231;
	Fri, 11 Mar 2022 17:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5060210E29C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 17:03:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x15so13817824wru.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 09:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iwsLrQT6c+k88K9ITqU2zLknOaYZbpaIvD8leAUiegA=;
 b=DNvHgYYlkL+pKnnv8hzc0Q+oE5OOGcOD8j7/py2oJBZY/TQyGMwl3PHMAaocTTQPBB
 xeOlW7qBfgoS7PYJr9bVbg9s6cNVuEvAzEdVTd4OrBy7Npe+SM7H+LgXjkOgBFBfwKID
 CI6dIVeJqUIm7qyLaDGadFQNRJ/I7cVqOUVdY/JWAKPThF2fm9ZW1XvABrGPhkBJ8jkV
 Elg618lD+Pkn5zmdFR3jh8BkGmsj+SeDXvBiwWV51WBLFceCl1E6KK664XdqvdZXtrbZ
 OgWweurUsodV9JAJRa4MP2+0skqMy0Wke4oVd3rb3nj+Sxprcf4oSzMDWAgtB2v61uNt
 RwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iwsLrQT6c+k88K9ITqU2zLknOaYZbpaIvD8leAUiegA=;
 b=IW3E+DoUhLgOpTbH2ZI5Pg/bFcMHlpVr7ayapWYSg0rmKKzknf3P5843BuMv7ZKZUo
 e2opQhClpbsiN13g07Zh5SND47DnPC5uH94lgVWwmcDYKmJEm3Il4lfKTouC2hyuwhG8
 DfPFQo/k4HXZi/jQS9r2edfWjA6g7ENTEp/NE0ufUnS4izRqxj5NMp6IXYn0ee1QcEZq
 EBjhxpzvtPud4II4/OdGdvXvaZ2Pcm2oV4fNCX8aziaBf4FIwKCspkoUMFrVRnOAA1Le
 ZwqZH+tbfVpsIeU3ZxbSBmif4oVM7ZCDNy1j8UwUmumZ4Qfe+pm5Odg8inz1ROmUdF3V
 CQLQ==
X-Gm-Message-State: AOAM530RJ3twlTiokNDgG+9AQdnGbNVkwk8SXMgxpORgdqn8DbnE7hWa
 i7xvGp2MSfKgBFiBRDAEPBE=
X-Google-Smtp-Source: ABdhPJyvqTvSUrmLkj0DzlrVmQ5Jc2Hg5r5yfUjHfqN3lCBGmYwfQDZIjqPDTkJIWkodCizdeo4Q2w==
X-Received: by 2002:adf:908e:0:b0:1e7:bea7:3486 with SMTP id
 i14-20020adf908e000000b001e7bea73486mr7809967wri.401.1647018181847; 
 Fri, 11 Mar 2022 09:03:01 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm14067733wmp.13.2022.03.11.09.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 09:03:01 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 4/4] dt-bindings: display/panel: Add Leadtek ltk035c5444t
Date: Fri, 11 Mar 2022 18:02:40 +0100
Message-Id: <20220311170240.173846-5-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311170240.173846-1-cbranchereau@gmail.com>
References: <20220311170240.173846-1-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for the leadtek ltk035c5444t, which is a 640x480
mipi-dbi over spi / 24-bit RGB panel based on the newvision
NV03052C chipset.

It is found in the Anbernic RG350M mips handheld.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 .../display/panel/leadtek,ltk035c5444t.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
new file mode 100644
index 000000000000..817a9bed7d5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/leadtek,ltk035c5444t.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Leadtek ltk035c5444t 3.5" (640x480 pixels) 24-bit IPS LCD panel
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+  - Christophe Branchereau <cbranchereau@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: leadtek,ltk035c5444t
+
+  backlight: true
+  port: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "leadtek,ltk035c5444t";
+            reg = <0>;
+
+            spi-3wire;
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+            power-supply = <&vcc>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
+                };
+            };
+        };
+    };
-- 
2.35.1

