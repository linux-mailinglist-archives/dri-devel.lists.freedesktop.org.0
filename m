Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE0188718
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA3A6E15B;
	Tue, 17 Mar 2020 14:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DB089FE6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 13:37:23 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: FROM_HAS_DN, RCPT_COUNT_TWELVE, FREEMAIL_TO, FROM_EQ_ENVFROM,
 SUSPICIOUS_RECIPS, ARC_NA, RCVD_VIA_SMTP_AUTH, TAGGED_RCPT,
 RCVD_COUNT_TWO, BROKEN_CONTENT_TYPE, TO_MATCH_ENVRCPT_SOME,
 MIME_TRACE, ASN, TO_DN_SOME, FREEMAIL_ENVRCPT,
 RCVD_NO_TLS_LAST, R_MISSING_CHARSET, MID_CONTAINS_FROM
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 040dde7f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Mon, 16 Mar 2020 06:37:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 4124F4C196;
 Mon, 16 Mar 2020 13:37:10 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH v2 2/5] dt-bindings: panel: add binding for Xingbangda XBD599
 panel
Date: Mon, 16 Mar 2020 21:35:00 +0800
Message-Id: <20200316133503.144650-3-icenowy@aosc.io>
In-Reply-To: <20200316133503.144650-1-icenowy@aosc.io>
References: <20200316133503.144650-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1584365841;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=k5dZsJ/q6rrXyDSO2nmOTWqvPhDI4C+8rut25MFD+Sk=;
 b=OUlaYo/FyQ18QC+9N7l4EKPc9OYtnaEJ6rHTTmw5vWDG6bE4z3Dc0JryPNmmzGXHubXOqg
 vnAixztTiQggjBI+b2WQ1uKGq0JCKJczHDkbgeZsFMqH3T47xzNMNhu6qv5Xdi+haGzyNU
 I+cG4IhCqhUW5fahJroACP3Tm5imnHs=
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel.

Add its device tree binding.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v2:
- Example fix.
- Format fix.

 .../display/panel/xingbangda,xbd599.yaml      | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml b/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
new file mode 100644
index 000000000000..b27bcf11198f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/xingbangda,xbd599.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xingbangda XBD599 5.99in MIPI-DSI LCD panel
+
+maintainers:
+  - Icenowy Zheng <icenowy@aosc.io>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: xingbangda,xbd599
+  reg: true
+  backlight: true
+  reset-gpios: true
+  vcc-supply:
+    description: regulator that supplies the VCC voltage
+  iovcc-supply:
+    description: regulator that supplies the IOVCC voltage
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - vcc-supply
+  - iovcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "xingbangda,xbd599";
+            reg = <0>;
+            backlight = <&backlight>;
+            iovcc-supply = <&reg_dldo2>;
+            vcc-supply = <&reg_ldo_io0>;
+        };
+    };
+
+...
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
