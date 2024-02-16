Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559038579F7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A737710EAE2;
	Fri, 16 Feb 2024 10:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="NO72MJ7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586D710EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:10:54 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5128812662eso776174e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 02:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1708078252; x=1708683052; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ytAhWz1L3xYxXELaLgaUujOMD+Gva0kVPECBIzo4HAQ=;
 b=NO72MJ7gT6m9Rh1L+CTSngOqbwAgGgeek+gbDzCuq18wha5G9E76gxCUMzcs+B33q6
 bAbT7T2cG/zJxszXx4Up3lO6yeCpniS2THRMrk6UYdiM67E4D46DlqsmCABII4AnkHZn
 9Z9VcfHwb6TIpxi7WU7owki368setRHOMMIMAgQdCDQ5zp/0ZbtRA41UhwPltmav44JZ
 oSatgy7xUzJVBH4J1nCzVkHRh5wxK4idJ6kDLE+5UyDop+cHewJmBClkmEFVwNRlVzH7
 +ylnrpMxsfXZO7H1g/qWR1zVwl/nTjrMqAprs6WG1MKCQ4dJEktX90JWmzegKakMO/3P
 BEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708078252; x=1708683052;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytAhWz1L3xYxXELaLgaUujOMD+Gva0kVPECBIzo4HAQ=;
 b=ve7Y0ArgduEUiCPkEbPB5THC+pDJtUmytylcCfoODFkHZEIXubEceU+f9xVXaeouIk
 pt+Q00sJSmB9lZeD4Y1EUHueCBPlJcJfdMerIhHf9dtThXOFlCD0EhCJpGdroMs8+eJX
 yqvlSelNjQ++Oc/tQJ+V2YqIeAWdz7n7yFSjHQXGNQ2zPHkhZDCXR39j6lg7Kc46x3yr
 moOnl8ByqH3KWsv/Pfa7WGI36ria/jZgMNQKl8Fmj7tnZjijSkSC9ijqGPLSmHsU3Djq
 fGkgtcGnfJEChv+G+A2o5YZ3iLYptgE5IOJ9r4ty2+NO0TFYZNglhIplw+pE6vKsAGkU
 Mk0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUua9OHmdPd7ExCh4AZUPSJPnl2EQOhIJdTFq9qzbijdy5fRZoewAbMajYkJBqIwXRbt8QEHDDth1YAKePWDDwg5qwdZDeo4G/vOriyw/lN
X-Gm-Message-State: AOJu0YyA+QP5nkomTlfuU7+PkGf5kuPGpQxlR8UBNPNZmGja6eteGiAS
 l0DtHpkBLd2qRLWXHLCGJ1/u6aoVLM/Y0chGQA9N8jpBlqKs15BvF53ncRLn00BIJXJ6vBgJ6iE
 y
X-Google-Smtp-Source: AGHT+IEVJIPqjDwlWe58ZAZjaPzBTQECJYMTp+kbNtQLru1WjXV8FTBd2JXmb4czZQII9OWQJ0sxpw==
X-Received: by 2002:ac2:4db7:0:b0:511:dc62:7f95 with SMTP id
 h23-20020ac24db7000000b00511dc627f95mr3369194lfe.15.1708078252249; 
 Fri, 16 Feb 2024 02:10:52 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a170906169200b00a3d1897ab68sm1398019ejd.113.2024.02.16.02.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 02:10:51 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Feb 2024 11:10:48 +0100
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Add Himax HX83112A
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-fp4-panel-v3-1-a556e4b79640@fairphone.com>
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
In-Reply-To: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
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

Himax HX83112A is a display driver IC used to drive LCD DSI panels.
Describe it and the DJN 9A-3R063-1102B using it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/himax,hx83112a.yaml     | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
new file mode 100644
index 000000000000..174661d13811
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx83112a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX83112A-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Himax HX83112A is a generic DSI Panel IC used to control
+  LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: djn,9a-3r063-1102b
+
+  vdd1-supply:
+    description: Digital voltage rail
+
+  vsn-supply:
+    description: Positive source voltage rail
+
+  vsp-supply:
+    description: Negative source voltage rail
+
+  reg: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd1-supply
+  - vsn-supply
+  - vsp-supply
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
+
+        panel@0 {
+            compatible = "djn,9a-3r063-1102b";
+            reg = <0>;
+
+            backlight = <&pm6150l_wled>;
+            reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+            vdd1-supply = <&vreg_l1e>;
+            vsn-supply = <&pm6150l_lcdb_ncp>;
+            vsp-supply = <&pm6150l_lcdb_ldo>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.43.2

