Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF86676760
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 17:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3210E084;
	Sat, 21 Jan 2023 16:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4F910E010
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 16:24:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k16so6148348wms.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tfkYuI21meii7yISj973iC57fiTGptgMgJGNgDKb0o=;
 b=O4G25ETyycYemeCuoz3CsGecXTPoPCY4f330+vzGk4ZMnHFjrv3QZYz1DWOlxvpond
 nCHYkJM5ZZ0QJcRiNhjW17i4a5nzNBg2MKwD1ffGIf7L9jatiISKT0YXsGP8mAJwV4vS
 Wo6R+7dUO5a9M/DJ0T7amlnAzo2XCQr3uB4CIClGmJo9tFOBTLKwPtdk7NgFsX2IJCZZ
 C5RlWwzfaL2G1sJlE0yhC8Ny8MA17TrpIuMaYJdFUN71tX0aqFN02GfpU6N0P/QI1DRP
 ilmZCxqrY0rE1GMFwpVhg/amIJFupilwcvGo/Lc0H7VZyHhxM41Cvtd2hdlXxzGOaKxl
 lPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+tfkYuI21meii7yISj973iC57fiTGptgMgJGNgDKb0o=;
 b=7lypP7PNd6ohbEPVbaZS/4Tq1yPzdWmWlXaQB0E7r3ZMTQo3Rt7akAd7qbB6FxBkrB
 HJfgwAonzfp4KMGpPB/rw42HIQGxIeTuwVmFNxcsjlVHB8Zy1qiJPjjou+4EcQuakfYC
 0Te4SzQeMJ643UDUcUXxWMyHYO89TIDKhj5OpYSR6P+OuFhPhVT0w8pjAmnLzHQUuapt
 +j1gTnHwxV5vgPbtx1yZwkYe9f3ufcm36F9hStFbrGTyLqRDrQT+X/nCODFJqkQPCI5Q
 uayRgliP87mqIeIrhiElTQeLrn6qKKxl6TdL2IlceGAE8zI3f3JM4NV6TNFTe9pWm/VI
 4ozA==
X-Gm-Message-State: AFqh2kpIgPv1PFAdkIGuRM8AXvT0csVxqATy8WYpBg7tMD2/DmgCPPLB
 h0JDXqdYy0W0fwxmY3Xa4a4=
X-Google-Smtp-Source: AMrXdXusRqsRQrWSXNSka45/GTFvRl22F/EZAXpvUzrkIU9pKB2r77QH+Y9WpwuRH/UB8wS+8Ts6Dg==
X-Received: by 2002:a1c:7417:0:b0:3da:fcd:7dfe with SMTP id
 p23-20020a1c7417000000b003da0fcd7dfemr26348539wmc.10.1674318264472; 
 Sat, 21 Jan 2023 08:24:24 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-43c0-f52a-beed-541b.rev.sfr.net.
 [2a02:8428:46a0:7c01:43c0:f52a:beed:541b])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003db30be4a54sm5831443wms.38.2023.01.21.08.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:24:24 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: display/panel: Add AUO A030JTN01
Date: Sat, 21 Jan 2023 17:24:18 +0100
Message-Id: <20230121162419.284523-2-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121162419.284523-1-cbranchereau@gmail.com>
References: <20230121162419.284523-1-cbranchereau@gmail.com>
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
Cc: Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Cercueil <paul@crapouillou.net>

Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
interface.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 .../bindings/display/panel/auo,a030jtn01.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
new file mode 100644
index 000000000000..86c834eb4d98
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,a030jtn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AUO A030JTN01 3.0" (320x480 pixels) 24-bit TFT LCD panel
+
+description: |
+  Delta RGB 8-bit panel found in some Retrogame handhelds
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
+    const: auo,a030jtn01
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
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
+
+        panel@0 {
+            compatible = "auo,a030jtn01";
+            reg = <0>;
+
+            spi-max-frequency = <10000000>;
+
+            reset-gpios = <&gpe 4 GPIO_ACTIVE_LOW>;
+            power-supply = <&lcd_power>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
+                };
+            };
+        };
+    };
-- 
2.39.0

