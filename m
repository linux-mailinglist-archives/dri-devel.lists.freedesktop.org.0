Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E87A7815C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5751A10E63A;
	Tue,  1 Apr 2025 17:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=chir.rs header.i=lotte@chir.rs header.b="KdYygNdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEC510E516
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743495566; cv=none; d=zohomail.eu; s=zohoarc; 
 b=Fgr8zrpVbfhfS+M9LwCdXcvRN10/eXImKzmzF8rrDnQBUOnqPV1sZ/aLypKh4aQ9uZsxku/FSMBQ9eXw7elPncsVHG4SEjOUgeo1AQMKipwoX9MN6jcurAl9EVZt7S9LigfzF7mL3ANMLNaRVKGKrd1PpLFJu8VEC4UxOzWNBqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1743495566;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BdzPdRWbVUnKTjnH+i1SnxSYrp+D5xI4pwUXRe8mtb8=; 
 b=BbbE6PtZTTJRCfoGo3grepU+Zz4slho5doK9Y93op+gFFoUuZ/tYjEcZeO6Ved3gEHlePa3lxrQID+AZ2rnONflGP6IGt2JEeX2MComWD8NIykDNJHjQER6uh3+HD4z3W11l8zpf0r7wzM0RoXFmThDBDkOl1wqHV3T1XKTyOUM=
ARC-Authentication-Results: i=1; mx.zohomail.eu; dkim=pass  header.i=chir.rs;
 spf=pass  smtp.mailfrom=lotte@chir.rs;
 dmarc=pass header.from=<lotte@chir.rs>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743495566; 
 s=zmail; d=chir.rs; i=lotte@chir.rs;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=BdzPdRWbVUnKTjnH+i1SnxSYrp+D5xI4pwUXRe8mtb8=;
 b=KdYygNdEvnIrZtqRMFYn0I3bqEOnVrLjG/aG99kYSwSncpj61sKpzRqaz6iumjh8
 O38FShTLaLIsrmUYC4naLt7d/4Z9u1XjlfhX4LMyHQHrUGxXu8zu5x7boaOt179/Sb1
 cfkvvIQ75iG7Ms03vaGfdl1X9coqSPGYVWxPbVtc=
Received: by mx.zoho.eu with SMTPS id 1743495563114631.7085270615262;
 Tue, 1 Apr 2025 10:19:23 +0200 (CEST)
From: =?UTF-8?q?Charlotte=20=Dele=C5=84kec?= <lotte@chir.rs>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, max@maxfierke.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Charlotte=20Dele=C5=84kec?= <lotte@chir.rs>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: display: Add Clockwork CWD686 panel
Date: Tue,  1 Apr 2025 09:18:32 +0100
Message-ID: <20250401081852.283532-3-lotte@chir.rs>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401081852.283532-1-lotte@chir.rs>
References: <20250401081852.283532-1-lotte@chir.rs>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Tue, 01 Apr 2025 17:22:19 +0000
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

From: Max Fierke <max@maxfierke.com>

The CWD686 is a 6.86" IPS LCD panel used as the primary
display in the ClockworkPi DevTerm portable (all cores)

Co-authored-by: Charlotte Deleńkec <lotte@chir.rs>
Signed-off-by: Charlotte Deleńkec <lotte@chir.rs>
Signed-off-by: Max Fierke <max@maxfierke.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/clockwork,cwd686.yaml       | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/clockwork,cwd686.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/clockwork,cwd686.yaml b/Documentation/devicetree/bindings/display/panel/clockwork,cwd686.yaml
new file mode 100644
index 000000000000..70f73b67abc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/clockwork,cwd686.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/clockwork,cwd686.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clockwork CWD686 6.86" IPS LCD panel
+
+maintainers:
+  - Max Fierke <max@maxfierke.com>
+
+description: |
+  The Clockwork CWD686 is a 6.86" ICNL9707-based IPS LCD panel used within the
+  Clockwork DevTerm series of portable devices. The panel has a 480x1280
+  resolution and uses 24 bit RGB per pixel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: clockwork,cwd686
+
+  reg:
+    description: DSI virtual channel used by that screen
+    maxItems: 1
+
+  iovcc-supply:
+    description: regulator that supplies the iovcc voltage
+
+  vci-supply:
+    description: regulator that supplies the vci voltage
+
+  reset-gpios: true
+  rotation: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - reset-gpios
+  - iovcc-supply
+  - vci-supply
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
+            compatible = "clockwork,cwd686";
+            reg = <0>;
+            backlight = <&backlight>;
+            reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+            rotation = <90>;
+            iovcc-supply = <&vcc_1v8>;
+            vci-supply = <&vcc3v3_sys>;
+        };
+    };
-- 
2.48.1

