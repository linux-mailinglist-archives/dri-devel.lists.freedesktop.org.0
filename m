Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0973545819F
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 04:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5041A6E9A3;
	Sun, 21 Nov 2021 03:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2166E9A3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 03:50:02 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4HxbyD5WYVz4x03p
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 03:49:56 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="lqb4zce8"
Date: Sun, 21 Nov 2021 03:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1637466591;
 bh=fgCZEroMp4kHW6gUAlTpccvILX+I2kD4Cw/AwQu87DY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=lqb4zce8gTBoHUPR+f9mi/xqZJj404Mpyib/xBrlTA6Nq6Fc+W6samwXCc23xvNRa
 qFuiHv/9zfvso8ggUAPBrOJsgv1nMOfI+zbCueMDTqbMgXbdsN1OmBXoO8r6ytY8dq
 Sqo/fhOHlk0+Oe26mTfqfX+V7MU6XDMjR2o5R2uE=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v3 1/2] dt-bindings: display: Add DT schema for LG.Philips
 SW43101
Message-ID: <20211121034748.158296-2-y.oudjana@protonmail.com>
In-Reply-To: <20211121034748.158296-1-y.oudjana@protonmail.com>
References: <20211121034748.158296-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: devicetree@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a schema for LG.Philips SW43101 bindings.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v2:
 - Make the DT schema patch first in the series.
Changes since v1:
 - Add regulator support.
 - Add MAINTAINERS entry.
 - Dual-license DT binding.

 .../display/panel/lgphilips,sw43101.yaml      | 75 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lgphili=
ps,sw43101.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,sw43=
101.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,sw4310=
1.yaml
new file mode 100644
index 000000000000..6f67130bab8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yam=
l
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lgphilips,sw43101.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG.Philips SW43101 1080x1920 OLED panel
+
+maintainers:
+  - Yassine Oudjana <y.oudjana@protonmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lgphilips,sw43101
+
+  reg: true
+  reset-gpios: true
+
+  vdd-supply:
+    description: Digital power supply
+
+  avdd-supply:
+    description: Analog power supply
+
+  elvdd-supply:
+    description: Positive electroluminescence power supply
+
+  elvss-supply:
+    description: Negative electroluminescence power supply
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - avdd-supply
+  - elvdd-supply
+  - elvss-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        panel@0 {
+            compatible =3D "lgphilips,sw43101";
+            reg =3D <0>;
+
+            reset-gpios =3D <&msmgpio 8 GPIO_ACTIVE_LOW>;
+
+            vdd-supply =3D <&vreg_l14a_1p8>;
+            avdd-supply =3D <&vlin1_7v3>;
+            elvdd-supply =3D <&elvdd>;
+            elvss-supply =3D <&elvss>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint =3D <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 37c9372305b0..b096425e3c01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6002,6 +6002,11 @@ S:=09Orphan / Obsolete
 F:=09drivers/gpu/drm/i810/
 F:=09include/uapi/drm/i810_drm.h
=20
+DRM DRIVER FOR LG.PHILIPS SW43101 PANEL
+M:=09Yassine Oudjana <y.oudjana@protonmail.com>
+S:=09Maintained
+F:=09Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yam=
l
+
 DRM DRIVER FOR LVDS PANELS
 M:=09Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:=09dri-devel@lists.freedesktop.org
--=20
2.33.1


