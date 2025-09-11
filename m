Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED972B529E4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A815E10E30E;
	Thu, 11 Sep 2025 07:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="YTlxKpMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Thu, 11 Sep 2025 03:14:33 UTC
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C90B10EA01
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:14:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1757560133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZTCpuqimHVRO54aoEghZv3ss2SMTvWddizLriMnT94=;
 b=YTlxKpMSxc+KN6zC+TnOvkTqk69PF+MlAzgepLsKw/Q05v4UBQyWnNk6ljrw78ArbFd8qC
 S2oBA7eD/MQLIbEDj2xoS5CXli4LhkF+g4MId2N1LqcfPH2XD2xEu+fB3L6x3CESEomssm
 +sw+j88jFsVcrrYzFbEjm4SD1Q6gAL/Ifkibf2g9VxC+x6nWnMkVvsIOK/m50iq2k/utXH
 ZQhxRQ6pjzl+/kdQYpBPlW3/lxuLEhAxDUDAR4tv36BGquEXnH0Mgar0Jb4w09SoKz10qC
 piEGusrkgANrWi1XOJiho+DybAtkk2uc0i9MVl6BmdfDviCxB0bicwSc4TjvUg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 10 Sep 2025 20:08:21 -0700
Subject: [PATCH 2/3] dt-bindings: display: panel: Add devicetree
 documentation for lg,sw49410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-judyln-panel-v1-2-825c74403bbb@postmarketos.org>
References: <20250910-judyln-panel-v1-0-825c74403bbb@postmarketos.org>
In-Reply-To: <20250910-judyln-panel-v1-0-825c74403bbb@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757560120; l=2069;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=bgcaVa8rMGcBrZfsrzhFJtttqvFxPe7HhoFjF8JSFbU=;
 b=7RhDhMLDi49eJwI2wSG7OL9L35ioUiwGsk0ZM7W7E0/TdZooIC37LAH0lc9r5O4ITwPL5oE0i
 35ag74JZ7iaDzXrcikMCZGp54+Ze1LqNE5g8la6LIGj6MN6thF4rMAr
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 11 Sep 2025 07:28:36 +0000
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

Document how to use lg,sw49410 in a devicetree

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 .../bindings/display/panel/lg,sw49410.yaml         | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw49410.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw49410.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7e0db98687d9cfc4da7137e8781752e1401d5ed7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw49410.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw49410.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW49410 MIPI-DSI panels
+
+maintainers:
+  - Paul Sajna <hello@paulsajna.com>
+
+description:
+  LG SW49410 6.1" 1440x3120  panel found in LG G7 ThinQ smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,sw49410
+
+  reg:
+    maxItems: 1
+
+  backlight:
+    description: Backlight device reference
+
+  reset-gpios:
+    description: Reset pin reference
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
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
+        display_panel: panel@0 {
+            reg = <0>;
+            compatible = "lg,sw49410";
+
+            backlight = <&pmi8998_wled>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            pinctrl-names = "default", "sleep";
+            pinctrl-0 = <&sde_dsi_active &sde_te_active>;
+            pinctrl-1 = <&sde_dsi_sleep &sde_te_sleep>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.51.0

