Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121588C0BB2
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 08:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A92810E437;
	Thu,  9 May 2024 06:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="JM76Pv0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E36610E437
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 06:50:45 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6f45020ac2cso508421b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 23:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715237445; x=1715842245; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N4ZlQt/Y9+Dha+5rkW2FelVk7yDcsRo8ctkHcXLJDwk=;
 b=JM76Pv0s4StKvh5KoVKELzG3bcXCqbGYwdxQlu25EN4K1kfma0pCyUcb1E3dkI2XuD
 vyLrgjuPwwBtiXEWEIPaU/EoP0GJtbT9yd9A3POtpMRyelD+o8CX95ztvhKkPuWKBQHj
 hd+cnbkCt5fjyL3waglR8BeVCFfqklcW6TKcX7wdSPRxNWN3ybMyqv12liU3ErjL7QPg
 vti5j9CGdLgiT5vt5dRSDe2tkg6NIAadIL8G/FkvZnH4lWat1uXiNHOYsW4oj6AP5tDW
 7t3OoMWaiVva7itkjMB/t816Wdm1BZW4JvH3hBbeeDfEJ7oV/yarvWRDesiUIduzgtB0
 vlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715237445; x=1715842245;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N4ZlQt/Y9+Dha+5rkW2FelVk7yDcsRo8ctkHcXLJDwk=;
 b=Ow8hJIZeVc+aypFg99RO9+1viv5oFJWRJ232+Oimn/WRbuEeJFemboS7x5hdQdbwf/
 tX9P05gJQThzyGVfIo5bzA+bQ+QWGygeCKvW6JJ9Qlh48tPUEyTZ7QkJYgt1ejYOKhKc
 +ncne517B51tzdut37OjGgkxcpzs84wltyRkpvo+mQheUSb+z+S9nXa2TnKalYhqeQ8d
 rxxyqh+gvG+v3aZWVLk6+YkydTKGfDXW5TNgDJXR6kDLkpNYmCBCxbGn8vYZM0exZndL
 XoWUkUAmyzwRlxcmuVkgCjO3VsNxwz44w/Pw8jj1pOL5KgMN0/7jI8JvVOTy9Osgf0cV
 S4CQ==
X-Gm-Message-State: AOJu0Yzvj9STVOZlT98Cx117NaLYWxz7ktpI79Ewf8yYvzuADfHSbFCi
 lIAkBf1I+UvUkjVWcx01a12dLmKjX47cvloE6IHVT3mFLYFaTTdhfMIKHdk1SOs=
X-Google-Smtp-Source: AGHT+IFBNOOnux53aEtgCfWt8suqTQ28VOR/y9RzpqGcfNYpWzPc/8vnze4mt4HMbw5xu1kLSzbltA==
X-Received: by 2002:a05:6a00:3a9a:b0:6f3:88c5:fed6 with SMTP id
 d2e1a72fcca58-6f49c22a887mr4670792b3a.19.1715237444915; 
 Wed, 08 May 2024 23:50:44 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a84b6bsm633939b3a.74.2024.05.08.23.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 23:50:44 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: display: panel: Add Starry-er88577 support
Date: Thu,  9 May 2024 14:49:58 +0800
Message-Id: <20240509064959.23550-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240509064959.23550-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240509064959.23550-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Create a new dt-scheam for the Starry-er88577.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 .../display/panel/starry,er88577.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/starry,er88577.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml b/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
new file mode 100644
index 000000000000..6686beaf0f16
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/starry,er88577.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starry Display ER88577 based MIPI-DSI panels
+
+description: |
+  -This binding is for display panels using an ER88577 controller
+
+maintainers:
+  - Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: starry,er88577
+
+  pp3300-supply: true
+  reg: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp3300-supply
+  - backlight
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: panel@0 {
+            compatible = "starry,er88577";
+            reg = <0>;
+            enable-gpios = <&pio 98 0>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&panel_pins_default>;
+            pp3300-supply = <&en_pp6000_mipi_disp>;
+            backlight = <&backlight_lcd0>;
+            rotation = <90>;
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.17.1

