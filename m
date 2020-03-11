Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B5182A9F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8C36EA6D;
	Thu, 12 Mar 2020 08:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EBB6E497
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 16:34:08 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: ARC_NA, RCVD_VIA_SMTP_AUTH, FROM_HAS_DN, R_MISSING_CHARSET,
 MIME_TRACE, RCVD_NO_TLS_LAST, FROM_EQ_ENVFROM, ASN, TO_DN_SOME,
 BROKEN_CONTENT_TYPE, FREEMAIL_TO, RCVD_COUNT_TWO,
 SUSPICIOUS_RECIPS, FREEMAIL_ENVRCPT, TAGGED_RCPT,
 TO_MATCH_ENVRCPT_SOME, MID_CONTAINS_FROM, RCPT_COUNT_TWELVE
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id b6d436e9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 11 Mar 2020 09:34:07 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id B66154C335;
 Wed, 11 Mar 2020 16:34:01 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 2/5] dt-bindings: panel: add binding for Xingbangda XBD599
 panel
Date: Thu, 12 Mar 2020 00:33:26 +0800
Message-Id: <20200311163329.221840-3-icenowy@aosc.io>
In-Reply-To: <20200311163329.221840-1-icenowy@aosc.io>
References: <20200311163329.221840-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1583944446;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=ryOGBJbE0EZPCIwKdiVXZpn09MvjjBMYu9MRV2Z6xEo=;
 b=qBfqYufKA6WV46oKBRByMkVugBf2lR8zLWOu+gI3ucJ2ZoooPNStJsI4kXFwa+wkIK8fU4
 IH13K/0pI3/zED0kFD9w9Zl7ECGOT4cTZuaC0wIb6x5cNXtJxtadldZwqY5EdcsLp1vp8Z
 milTs2CU64tt69l7ntjJEU5gha8ieWc=
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
 .../display/panel/xingbangda,xbd599.yaml      | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml b/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
new file mode 100644
index 000000000000..62816b34de31
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
+     description: regulator that supplies the VCC voltage
+  iovcc-supply:
+     description: regulator that supplies the IOVCC voltage
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
+    &dsi {
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
