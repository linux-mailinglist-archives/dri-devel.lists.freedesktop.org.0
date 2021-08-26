Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9583F8609
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 13:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84486E7D2;
	Thu, 26 Aug 2021 11:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126956E7D9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 11:03:29 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso6315404pjh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nxvll67J3XpmADTGvnJ8QFA4/5rp+GwPgMrOnVdNvPo=;
 b=RMNgAF0BCNlgdvkP+UgS9c463NC4wc1kfJjxPt5iICLa828IZGrrnBm4tz0DebmFJ2
 LWHRuoGSUzZ7jbarQDkSl8/85XFL8yCXh/ClO3BcCtknFl23Y0lKczt4oSa+6vhs29a+
 cocWcZo8pZo1W44JIFfI8Av4lisIFU8emUqjiwTS7Y6RXJP7NEyFB7XGgGJDOJQ+SjJM
 ve/gHAI30gxnSSBJbe3QGa1NGW9/uR4/KPu5HvQl4FkuJA1u65ef8BlnOmioXJGQQqwP
 EkdrId7q0WiX0neBXfWTjvV5oDeJvzxEOq5/S+2ePCXHLdj88Qynmzh9jnd7OfWwlmgK
 RuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nxvll67J3XpmADTGvnJ8QFA4/5rp+GwPgMrOnVdNvPo=;
 b=WHF1flcIsNsftOMTXBqiBVRLLS4kZqEoHMA8nOOIrYhxGnorLE/HutyJBbz0VqlmkX
 SuS06nlTN5HJTg/id1+fmiOoGIFG+XpZPXGuYACYIL/K/AZMMSbFxs0MV0I11I8YrsQy
 Ynlu9qCcQwBsj9OHJBT8AdtphPJWK3QM9o3v6d+OeBYAOsQYVSxBk/AAAiO7Mzg+7zUe
 jSagF+WQpAcBopW1tem2Sl/YDyf03v4jvB4uXEEzsXo65oW+lTOBDL+YQgRMrESq+L3Z
 n82mC3dCFFXDoBX6xKk+r7D8R5g1hZGnkNT6Yfsj2QbYdcyEbZTfEJlfdp9KlnMQIURx
 aG6A==
X-Gm-Message-State: AOAM532p7r+aHuV6OuMpj5KyMPMzsYDuj/mNuU9Sh/d4eB+j1d1sbwgU
 xT8uE8MIJrtapDpQ4YTYOpn2pw==
X-Google-Smtp-Source: ABdhPJw3V4LfqiuEcKFM38WlYz5CA23xYtM52p/p0VCQ2WFgXNQLy9SERQL6JEd62Y0IHjos5zfVcw==
X-Received: by 2002:a17:902:dcc9:b0:134:92c7:3cb6 with SMTP id
 t9-20020a170902dcc900b0013492c73cb6mr3207476pll.79.1629975808680; 
 Thu, 26 Aug 2021 04:03:28 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id z12sm2655335pfe.79.2021.08.26.04.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 04:03:28 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v3 2/2] dt-bindngs: display: panel: Add BOE tv110c9m-ll3 panel
 bindings
Date: Thu, 26 Aug 2021 19:03:11 +0800
Message-Id: <20210826110311.613396-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826110311.613396-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210826110311.613396-1-yangcong5@huaqin.corp-partner.google.com>
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

Add documentation for boe tv110c9m-ll3 panel.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 .../display/panel/boe,tv110c9m-ll3.yaml       | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
new file mode 100644
index 000000000000..0cf8b70c77f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,tv110c9m-ll3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TV110C9M-LL3 DSI Display Panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # BOE TV110C9M-LL3 10.95" WUXGA TFT LCD panel
+      - boe,tv110c9m-ll3
+        # INX HJ110IZ-01A 10.95" WUXGA TFT LCD panel
+      - inx,hj110iz-01a
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  pp3300-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp1800-supply
+  - pp3300-supply
+  - avdd-supply
+  - avee-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "boe,tv110c9m-ll3";
+            reg = <0>;
+            enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+            avdd-supply = <&avdd_lcd>;
+            avee-supply = <&avee_lcd>;
+            pp1800-supply = <&v1p8_mipi>;
+            pp3300-supply = <&pp3300_dx_edp>;
+            backlight = <&backlight>;
+            status = "okay";
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
2.25.1

