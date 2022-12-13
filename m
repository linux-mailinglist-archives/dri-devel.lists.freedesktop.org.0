Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AB264B0D4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 09:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9A410E2D9;
	Tue, 13 Dec 2022 08:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E7B10E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 08:10:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id ja17so4720019wmb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDknBfWThlh7welb6FJ9uvH/zXOQlTwHmX+vFXdoENA=;
 b=KfH6yKYKfeCnzkWuXUKr3VKDFbDQ/8X4099zjnwMewFhOOCDxbXH0rHshNaifHWe8A
 0SWaeCr/xrmTwLPu6exuTBWKHd/Dt9W09i0PmRBUXXhWoTO8+qD0fwKnofQtw/eHcbMk
 jW+rQdxNZGDg8qkculzu7TsS8K4irc3QHiPeKQDDZaUswss95suA3aBlaAsvY+JQnXG/
 klxx43vu0vn6vKEjKFP4nDL7O0r2zEBQ1ieWp902xhuKxoX7QPXObzqQCab0CKAt4/8g
 KEHA9jBmYQSfxr9JPGHpEqYUGuGssTnEDTCprQh9hregkihYWVL0TYpb+uJ+AhamOr+x
 bHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDknBfWThlh7welb6FJ9uvH/zXOQlTwHmX+vFXdoENA=;
 b=dy+51MXf6DPz+LNALZh5vkATiD5/jfs+Meku9xrWmY18iYKmVBJskcGYd2+SQ02aMt
 A0wTTUlGrRbYnXPin02YyOnPBb8VMcRD8grs+4rmceFQvgoWPe7GbVxrlE9BT96B1CEe
 jVRfSnmJ2/Wlc+kda45pzz5HO26564SgnnYSNStQI9Ya0tQTHdrh06NkGAq7Gfi332LL
 TKFYunoOikBSwPVqHorG1QasoHC8tFgWt4ZlKRAou/Gr4vYNeN38kih91g40rjqPbQUn
 v5+O5DiXEKnfEwPFW7XFCtmuyWG1ydzukm2fs3akUg2jB1Fndzl0lL6QpjUqd6X/qbfS
 maig==
X-Gm-Message-State: ANoB5pn1hRPX3fh5l2fw7/3m4bnsGqpQ6gGujVC31NyGe/JfZ84UKwh3
 XE7QN15aChKs7DVeIYzIjLg=
X-Google-Smtp-Source: AA0mqf7/mrQOPc2qxM2idtmGvB70VsFboYToPO3P2J37bUuVGtKAgT9SKu3Y5TDEybJUFJZdMIz3Aw==
X-Received: by 2002:a05:600c:54e2:b0:3d2:2392:33e6 with SMTP id
 jb2-20020a05600c54e200b003d2239233e6mr6251042wmb.40.1670919056758; 
 Tue, 13 Dec 2022 00:10:56 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-bc7c-15f1-6c3b-ad74.rev.sfr.net.
 [2a02:8428:46a0:7c01:bc7c:15f1:6c3b:ad74])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a05600c205900b003a6125562e1sm11585047wmg.46.2022.12.13.00.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 00:10:56 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: display/panel: Add AUO A030JTN01
Date: Tue, 13 Dec 2022 09:10:34 +0100
Message-Id: <20221213081034.14226-2-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221213081034.14226-1-cbranchereau@gmail.com>
References: <20221213081034.14226-1-cbranchereau@gmail.com>
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

Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
interface.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/display/panel/auo,a030jtn01.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
new file mode 100644
index 000000000000..fb2aef0061e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,a030jtn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AUO A030JTN01 3.0" (320x480 pixels) 24-bit TFT LCD panel
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,a030jtn01
+
+  backlight: true
+  port: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
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
+    panel@0 {
+      compatible = "auo,a030jtn01";
+      reg = <0>;
+
+      spi-max-frequency = <10000000>;
+
+      reset-gpios = <&gpe 4 GPIO_ACTIVE_LOW>;
+      power-supply = <&lcd_power>;
+
+      backlight = <&backlight>;
+
+      port {
+        panel_input: endpoint {
+          remote-endpoint = <&panel_output>;
+        };
+      };
+    };
-- 
2.35.1

