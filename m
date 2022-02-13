Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566594B39D7
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 07:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2C810E519;
	Sun, 13 Feb 2022 06:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED4610E519
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 06:32:11 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id c4so2377740pfl.7
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 22:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FnIfjUmZdedfi4INaVoGg1BBbTjtjdDq0mhqvofLu/o=;
 b=ayLkrL0jVN0cG0TefQ83qSKycUfY3dJJZFQRvZNkD7dR0yESr0YP5GzNMheLhDUZWA
 5tWk/kUE+RK8efoINPQj40BpkLfBDANJ1LmGtXKTStJpcsMxQoWQTwJhppynRbfjUxim
 1VamoWWTaQlLJg8UiekJpEQzo4G820Tt9Td/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnIfjUmZdedfi4INaVoGg1BBbTjtjdDq0mhqvofLu/o=;
 b=mNDRhCxYuVqMzrI7JU0ir7V4pLBwOqGc63TlXYe+5P212oRsDoZrJ1UlWjmwFtE5Dn
 yAsTNNSzdD9W/qno2pOpJw/gxJklgV9n5W7SG2iiSMjW0EQlEWffmiYAcnRZzQ9cbx2k
 1JqCM8oJXCAO9TwdSaTXHCErUNE494/S36Onj6ctwq6/vGAT52pLAeC05RVJpGQXajdq
 zhc1e/0KUfl+emqwsBPrkz4emvit0+9x8Z1fO3pSOd6sa9uOjRe+/beTKILM/beopi4B
 xSxsi4DBRdx1s74LWKvQzsaA+Te5xkGP7BCyRMkCxcEYt7AfvTRRkm2rKqToBr0fA6VB
 lWMg==
X-Gm-Message-State: AOAM53022LvSonICPzbtxZB2KgRn+EoynTFWml46Nkp5AkAWP/esR/Vn
 YI73zMHUjnNWQNjvV6fu3pkYwg==
X-Google-Smtp-Source: ABdhPJzGawVyNFBnKSTS7EoIyQkuKznXDZQHiblP4nZQ75Arj2fe0OXk2XiTMXRtxaLQq6D82ZRsYg==
X-Received: by 2002:a05:6a00:1d9f:: with SMTP id
 z31mr8990026pfw.38.1644733930515; 
 Sat, 12 Feb 2022 22:32:10 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3653:bf18:8571:5f26])
 by smtp.gmail.com with ESMTPSA id q2sm34170025pfj.94.2022.02.12.22.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 22:32:09 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: display: Add STARRY 2081101QFH032011-53G
Date: Sun, 13 Feb 2022 14:31:51 +0800
Message-Id: <20220213063151.3321331-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
In-Reply-To: <20220213063151.3321331-1-hsinyi@chromium.org>
References: <20220213063151.3321331-1-hsinyi@chromium.org>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>

Add dt-bindings for 10.1" TFT LCD module called STARRY 2081101
QFH032011-53G.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2->v3:
rebase to next-20220211
---
 .../display/panel/innolux,himax8279d.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
new file mode 100644
index 00000000000000..fdcea3870dfb80
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,himax8279d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: INNOLUX HIMAX8279D DSI Display Panel
+
+maintainers:
+  - xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
+      - starry,2081101qfh032011-53g
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
+            compatible = "starry,2081101qfh032011-53g";
+            reg = <0>;
+            enable-gpios = <&pio 45 0>;
+            avdd-supply = <&ppvarn_lcd>;
+            avee-supply = <&ppvarp_lcd>;
+            pp1800-supply = <&pp1800_lcd>;
+            backlight = <&backlight_lcd0>;
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
2.35.1.265.g69c8d7142f-goog

