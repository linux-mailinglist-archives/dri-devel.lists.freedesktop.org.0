Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC90704ED7
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 15:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC35610E0F4;
	Tue, 16 May 2023 13:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B7910E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 13:09:23 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64ab2a37812so5365073b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 06:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684242563; x=1686834563;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JnI2mCTgjLo9sKDeUzzDpzJIwWSO6LoMJa5F9uksNBE=;
 b=LSxpzNIphCX4pdKDAYRhRH09p5YyLtm9cdJSaSlo84MLRIqXWrTEFHI1F86TQye0V6
 1ts0UmaJhmUZo2SNSqNjxMIDlJ2X48cecPF03fG0SQ0PAcaUAYmq3PLTUBqtZaOgkOTz
 ot14jzU8Td/a+Mb7GYRqxcgncsVIWmTDRC0XfVsnyG3R8I2SCarQ28hLJUD7oBcuGmXn
 Y8+YPKd8fEpJ4NoiQL/a0bjNrsf1z+9v9N2LaK9rNIbghD3PhKMV+3KKNkzMaDIjceRb
 tOp/rF0KRDqyjGion2UzHUvuNJ7gWlsmsyWdAmpahQJ+XjKB/gt9/i15TuOXtA0tNzuV
 XHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684242563; x=1686834563;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JnI2mCTgjLo9sKDeUzzDpzJIwWSO6LoMJa5F9uksNBE=;
 b=Je65zkhWxrTaURBAEc7dFnKB0Qt+t9ZqcMtOt98qR8fNgJ+E8UpCozMNzgmyfF0/Sq
 qVu5lC2rQ54led0SvGvBvBQ55YK2jCWFFFjAvJphFUkHLe3tqyO/V6DAknyQIJ9pw7gK
 s90KcuW8qHDTPMg+F3q2GrYEr/6Hus+tg+BAd9dKlwDqDJ4jw0MdNaMuWNb7GUXHZV6z
 KLavmNmgBjRTjBaP/QAccujQr+qEadVC7CmpQhikBwbYOuiXAwk4qPoFH5epbUK+ahRJ
 o8KzXIOwdJiKpOR0K+NnSwYJ9A/qlB/o7ombmTb1VfwVGACy4RNLQEmulfGIUDubh6Xs
 nLNw==
X-Gm-Message-State: AC+VfDyOxDZi9YO6Si03RFpSXHS0rl3AazLqNArwOHn5+R/H1igidZCh
 p5xF/Gkh3iLDN5+JDUolT4Y6yyj9/Il+gF2jaGY=
X-Google-Smtp-Source: ACHHUZ5+Nhs4AlA41VRX7XHReaGKnGgZl0brEkEPSTE8PDEC4sfbygO22G292BwjZGl/f+FmG+dJAgmuStgvDpfJwKU=
X-Received: by 2002:a17:903:1ca:b0:1ad:bccc:af77 with SMTP id
 e10-20020a17090301ca00b001adbcccaf77mr25885743plh.18.1684242562600; Tue, 16
 May 2023 06:09:22 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?UGF1bG8gUGF2YcSNacSH?= <pavacic.p@gmail.com>
Date: Tue, 16 May 2023 15:09:11 +0200
Message-ID: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
Subject: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
To: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
 robh+dt@kernel.org, daniel@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings documentation for panel-mipi-dsi-bringup which currently
supports fannal,c3004 panel. Also added fannal to vendor-prefixes.

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

Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
---
 .../display/panel/panel-mipi-dsi-bringup.yaml | 54 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 62 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
new file mode 100644
index 000000000000..c9e2b545657e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-mipi-dsi-bringup.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPI DSI Bringup Panel Porting Bindings
+
+description: |
+  MIPI DSI Bringup Panel porting bindings to be used for a collection of panels
+  from different manufacturers which don't require backlight control from the
+  driver and have a single reset pin which is required to be passed as an
+  argument.
+
+maintainers:
+  - Paulo Pavacic <pavacic.p@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+      # compatible must be listed in alphabetical order, ordered by compatible.
+      # The description in the comment is mandatory for each compatible.
+
+        # Fannal 480x800 panel
+      - fannal,c3004
+
+  reg: true
+  reset-gpios: true
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
+    //example on IMX8MM where GPIO pin 9 is used as a reset pin
+    mipi_dsi@32e10000 {
+        panel@0 {
+            compatible = "fannal,c3004";
+            reg = <0>;
+            pinctrl-0 = <&pinctrl_mipi_dsi_rst>;
+            pinctrl-names = "default";
+            reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
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
index e0ad886d3163..46f988ee60bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6566,6 +6566,12 @@ T:    git git://anongit.freedesktop.org/drm/drm-misc
 F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 F:    drivers/gpu/drm/tiny/panel-mipi-dbi.c

+DRM DRIVER FOR MIPI DSI BRINGUP
+M:    Paulo Pavacic <pavacic.p@gmail.com>
+S:    Maintained
+C:    mipi-dsi-bringup:matrix.org
+F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
+
 DRM DRIVER FOR MSM ADRENO GPU
 M:    Rob Clark <robdclark@gmail.com>
 M:    Abhinav Kumar <quic_abhinavk@quicinc.com>
-- 
2.40.1
