Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51852709028
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 09:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241A10E608;
	Fri, 19 May 2023 07:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E92710E0E0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:47:20 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-52867360efcso1420488a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684421239; x=1687013239;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kvgIf19oHXt3jG+3jnSR39KiE1Z6F2UkisVQ+IwSMYQ=;
 b=j1PvAr4axI0UqISuZ0Di29AFnw9d80uWfBvFU81dpydJKPVEjEPNvKfouneurMTsOj
 EFh0o3+LLv8rYZFJ8Omr5QxB761b1aPTk9bTMBU9fbflGXTsJGwVP8PQ8eCYZFYtWKC5
 m+JHbnQnBSTi/v2JVIMNK9DHoRc68dzb/xTAF5gXAVQJfAZxahGLlIB9FFLUi/yOuiHJ
 HJuFVgnwCkzdeQRZUw9U8JbymaVopkDdoeU02qRbVmcJ8lIfOeNYSv9OVtM+AUVOikHP
 zEqfsIQSkCFUINUceUjzGMgnArkKBjY09DZmREAFWe+5h59oyMt40QVrWbn4TXhiOOAM
 I3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684421239; x=1687013239;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kvgIf19oHXt3jG+3jnSR39KiE1Z6F2UkisVQ+IwSMYQ=;
 b=N0USAUfUjl+dzje+cDS11q7sdstWs050oBTYgpuVOqutqtowSancEp97UvaJ5xIv6F
 0Jxf1CwcoF69v9JvXXpPyv3XiLvpszeFGKiMoUGg/dxPvWE5jT3o0U3KFQRhq9zZDkul
 wc6h872Gan/pEQ1BAyTgRI4cOI1QzBDrPb9te8Ik3ZadkLW1Ex4QSi3eacyAptdIrcPP
 DZ4Geg36xN4/fp60MUdDxeqb6Beq1LZYgIgZTvwCsayIShpn/1/vcycFgVHmdVQ6InqA
 Qt4SuXbw/BwTAjDt4todm3rnvYcPEukXx4wYYhADQ9y8OOjIm5xYutGW0eCRjVf6iSo8
 gUzw==
X-Gm-Message-State: AC+VfDy0jx6KGh9+1W+Xi9fNJi2WYgJ2s1BnXoupDOr0nDNnWtUmc8uD
 Flkkj/235GuZ/5UhOBtIYXqCSH7s+Uzlj/9orr8=
X-Google-Smtp-Source: ACHHUZ5eJZWIT/VXRww7Kgr3iXlHofukzD/zJJvJphi9c7Y+8ZZhIEJKgunM/dMHUuHP42LtXRhdjUPUux89MlBU9Lc=
X-Received: by 2002:a17:903:487:b0:1ab:107b:c127 with SMTP id
 jj7-20020a170903048700b001ab107bc127mr2665116plb.59.1684421239254; Thu, 18
 May 2023 07:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
 <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
 <CAMty3ZCAP6CRsJWMUZZ6+hd5igX3NgyNfhdEv2FwuDtqj4iaaA@mail.gmail.com>
 <HB0TUR.1IPEEV2C5LMB1@gmail.com>
 <CAMty3ZCSUx-81m4SQcJZvUq3NyhzZbe8ow+LiV7iyUmVLCmNYQ@mail.gmail.com>
In-Reply-To: <CAMty3ZCSUx-81m4SQcJZvUq3NyhzZbe8ow+LiV7iyUmVLCmNYQ@mail.gmail.com>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Thu, 18 May 2023 16:47:08 +0200
Message-ID: <CAO9szn2A22KTzrCTX+24Y3goSberHpcGf-O-Czv3+_dX+pL+vQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 May 2023 07:11:15 +0000
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> So, the driver has to be panel-fannal-c3004.c and binding to be fannal,c3004.yaml.

I believe I have covered this and all the other problems in following
patch which I will submit as a V3 of the conversation in a patchset
together with a driver:

Add dt-bindings documentation for panel-mipi-dsi-bringup which currently
supports fannal,c3004 panel. Also added fannal to vendor-prefixes.

Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
---
v3 changelog:
  - renamed yml file
  - refactored yml file to describe fannal,c3004
  - added matrix URI to MAINTAINERS
v2 changelog:
  - revised driver title, now describes purpose
  - revised description, now describes hw
  - revised maintainers, now has only 1 mail
  - removed diacritics from commit/commit author
  - properties/compatible is now enum
  - compatible using only lowercase
  - revised dts example
  - modified MAINTAINERS in this commit (instead of driver commit)
  - dt_bindings_check checked yml
  - checkpatch warning fixed
---
 .../bindings/display/panel/fannal,c3004.yaml  | 74 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 ++
 3 files changed, 82 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
new file mode 100644
index 000000000000..c2eea0fa8418
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/fannal,c3004.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fannal C3004373132019A MIPI-DSI
+
+maintainers:
+  - Paulo Pavacic <pavacic.p@gmail.com>
+
+description: |
+  Fannal C3004373132019A is a 480x800 panel which requires DSI DCS
+  initialization sequences.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: fannal,c3004
+
+  port: true
+  reg: true
+  reset-gpios: true
+
+  vdd-supply:
+    description: power supply voltage
+  vddio-supply:
+    description: power supply voltage for IO
+
+  width-mm:
+    description: physical panel width [mm]
+  height-mm:
+    description: physical panel height [mm]
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "fannal,c3004";
+            reg = <0>;
+            pinctrl-0 = <&pinctrl_mipi_dsi_rst>;
+            pinctrl-names = "default";
+            reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&reg1>;
+            vddio-supply = <&reg2>;
+            width-mm = <93>;
+            height-mm = <56>;
+            panel-timing {
+                clock-frequency = <27000000>;
+                hactive = <480>;
+                vactive = <800>;
+                hfront-porch = <30>;
+                hback-porch = <30>;
+                hsync-len = <8>;
+                vback-porch = <30>;
+                vfront-porch = <30>;
+                vsync-len = <8>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..f962750f630a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -462,6 +462,8 @@ patternProperties:
     description: Facebook
   "^fairphone,.*":
     description: Fairphone B.V.
+  "^fannal,.*":
+    description: Fannal Electronics Co., Ltd
   "^faraday,.*":
     description: Faraday Technology Corporation
   "^fastrax,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..75879341dd0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6566,6 +6566,12 @@ T:    git git://anongit.freedesktop.org/drm/drm-misc
 F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 F:    drivers/gpu/drm/tiny/panel-mipi-dbi.c

+DRM DRIVER FOR MIPI DSI BRINGUP
+M:    Paulo Pavacic <pavacic.p@gmail.com>
+S:    Maintained
+C:    matrix:r/mipi-dsi-bringup:matrix.org
+F:    Documentation/devicetree/bindings/display/panel/panel-fannal,c3004.yaml
+
 DRM DRIVER FOR MSM ADRENO GPU
 M:    Rob Clark <robdclark@gmail.com>
 M:    Abhinav Kumar <quic_abhinavk@quicinc.com>
-- 
2.40.1

Best regards,
Paulo
