Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001303E3824
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 05:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3E589C03;
	Sun,  8 Aug 2021 03:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E127089C03
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 03:50:55 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id l4so3731692ljq.4
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Aug 2021 20:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvlrtM+yBNUdex1HY9xYdk9KI9SkZNw8iEdfyc3oX4o=;
 b=nAK40s/rqTAOtL/6azfYvLR60IX4nNzmH4gEJWXDP2xA/0ZdiK2EfFvbfNCjyNkF4Q
 H/hMU2ukO9kUUFcY3NCW0YtU0vFDtABOAaS5WpuH/8ohwsWrpNB/nB0XVx9foeT90Y8r
 XMRxwBmyl6evABCnAtIQ4rvtkS8S4cOIr2izCfYKA8CWxAl0ZHInZ7/2VXmbPCnu2gyF
 Ss1rF93hOJ9AkCONHsGJVVYGFBLzUfySJSyM7xbZPu8x1pYovrbkeZ9v/GP0ZAgf8WnT
 HiIcCK2iYl4uFVruSEEIicDEA22pwvC8PeB+30rs9r8n8d9ciE7NlryKGUa9ZM33wYCL
 o7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvlrtM+yBNUdex1HY9xYdk9KI9SkZNw8iEdfyc3oX4o=;
 b=n5WPaWRxfKMaKnJKYeIUN/+iIco4PnwFLsytynd6j/YMkl4q2Mo+sJCZBdZ2ORT6t5
 YPfkGkh2fuanPpTesj+foXO874zQ5JinWgBsNoHvjLGpkUx4/1rnl+23XxNthy5p8ooI
 eNOdpifjtGVdW8OOiObq3NM5tptjBLwKKWf7FSXp5D9wHBZlWYsiPvTqtH7Sc1xDibxF
 BMWEVeTD89HlfDyih/4d8kwlYu6otx9cKOGbBkODj/cmWOKAuHuGUcm/PG9seldOHDby
 sYi6M9VBrS8/HHmvOogErA6sJb3aNt1ZncF/c7b6p2qvJ4rPm6qlPk/McQLdtRrzj9uj
 VWTg==
X-Gm-Message-State: AOAM533OJgB9KJuIb6vWn39eEC9Ydzh9N6th4brpcNole0ClEBbatAAf
 EPgJgrq9trlaouN3y49WWVprCQ==
X-Google-Smtp-Source: ABdhPJzQfBSCmGTUgsreBNAD6M+Ta2IA1JJIjYcQAPVgnZTM/97yGYPEp0sADjA69RdFRhgNjCn14g==
X-Received: by 2002:a2e:2f05:: with SMTP id v5mr11336246ljv.66.1628394654090; 
 Sat, 07 Aug 2021 20:50:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o1sm1307998lfl.67.2021.08.07.20.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 20:50:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: add bindings for the Sharp LS060T1SX01 panel
Date: Sun,  8 Aug 2021 06:50:52 +0300
Message-Id: <20210808035053.58074-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
using NT35695 driver. This panel can be found i.e. in the Dragonboard
Display Adapter bundle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/panel/sharp,ls060t1sx01.yaml      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
new file mode 100644
index 000000000000..e749f20d34aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls043t1le01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 6.0" FullHD TFT LCD panel
+
+maintainers:
+  - Dmitry Baryskov <dmitry.baryshkov@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls060t1sx01
+
+  reg: true
+  backlight: true
+  reset-gpios: true
+  port: true
+
+  avdd-supply:
+    description: handle of the regulator that provides the supply voltage
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sharp,ls060t1sx01";
+            reg = <0>;
+            avdd-supply = <&pm8941_l22>;
+            backlight = <&backlight>;
+            reset-gpios = <&pm8916_gpios 25 GPIO_ACTIVE_LOW>;
+        };
+    };
+
+...
-- 
2.30.2

