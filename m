Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B283F4A17
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 13:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED7089C88;
	Mon, 23 Aug 2021 11:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8F789C88
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 11:51:41 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id b9so5612689plx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 04:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LkJF9gL3DFUvt3rlo/nzGGGMNzuUgKnkhv0UlxkwGu4=;
 b=Ofv1R2i1a5c2X/aAvS+lwWJysrrhDQlsLsZC27I36yxS+YLRscajlqrdz9/afYz9O7
 fCuKKu1MjWnuk+m0WLbOipx0H2lrn1J0tuiO6Et8yhm1qm5qy8mHtOCHEGYWTYAVbJNa
 Re/4jzeHogLm3ZL+cSFsldwFtWJUtlCWlbbkX7AAcR8XF+OjZ1FouwgnYIBIJwg6EjiI
 w7fI/CG6PMGbPsQBFdutM55vliglUH24BFbtKT6JEc6ky20gyLBzz2bGVycFF0vwUIY4
 PbqBH6NDmjn9N053v2w25XS7cP0AZZO9d8/nWYDyT8byaAwycXn9Jotx7hkBtdSh6wsx
 5M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LkJF9gL3DFUvt3rlo/nzGGGMNzuUgKnkhv0UlxkwGu4=;
 b=JwTdhawqgkcfWvqL/b5DzmYR3ijDt0Eek8GwEOxHtcESn/nStfEUF0HUpAhnbn68Bv
 LiJXc3cDrszJQp7pso18QvkdEZYT6LSkCaBdGEwQqVevZCIn+qx5Iw5coNaBLTYOESaM
 kOdmLZyOjChq9zGpdjKYAciAKWpUU9Oo2PTZ+P2Y78kqbPfM5KOmQxHZUDZThPam71Iz
 fi/06BM7azmqNT0wQbh5UiJ9Fst5+Wd+biz3ftd/1NOToYZA13T695gDmgtxWZx0uazW
 XhVejL1W+UfoM51ZR1zrCUisn2CL4eAq+i0d6nRRzxIUjJoP4JzEKmlfvFItqj08xndP
 gW6Q==
X-Gm-Message-State: AOAM531v4JPB7qfxHAS30xgUxuLkwZJ0pPzkHr2LMEiqjAEbAB61Z/oE
 wvEliQj/IstVMjqRIJOGD1/tLA==
X-Google-Smtp-Source: ABdhPJwdocfiEf11B5CvUDIZH1FHjE4IEAZiQMZg6/TK1SySDNCgg1m7Jyl+2hK5CJTNJQNDnT2FqA==
X-Received: by 2002:a17:902:6b4a:b0:132:803c:3ec with SMTP id
 g10-20020a1709026b4a00b00132803c03ecmr9492652plt.81.1629719501275; 
 Mon, 23 Aug 2021 04:51:41 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id z19sm15985426pfn.94.2021.08.23.04.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 04:51:41 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v2 2/2] dt-bindngs: display: panel: Add BOE tv110c9m-ll3 panel
 bindings
Date: Mon, 23 Aug 2021 19:51:25 +0800
Message-Id: <20210823115125.1070257-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823115125.1070257-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210823115125.1070257-1-yangcong5@huaqin.corp-partner.google.com>
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
 .../display/panel/boe,tv110c9m-ll3.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
new file mode 100644
index 000000000000..85969441d572
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
@@ -0,0 +1,83 @@
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
+            pinctrl-names = "default";
+            pinctrl-0 = <&vdd_reset_1800>;
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

