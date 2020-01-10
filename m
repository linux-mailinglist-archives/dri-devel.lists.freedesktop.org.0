Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB713865C
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799E36E4F8;
	Sun, 12 Jan 2020 12:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E180E89A6D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 16:00:35 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 15
X-Spam-Symbols: ARC_NA, MIME_TRACE, SUSPICIOUS_RECIPS, RCVD_VIA_SMTP_AUTH,
 R_MISSING_CHARSET, BROKEN_CONTENT_TYPE, MID_CONTAINS_FROM,
 FROM_EQ_ENVFROM, FROM_HAS_DN, TO_DN_SOME, TAGGED_RCPT,
 TO_MATCH_ENVRCPT_SOME, RCPT_COUNT_TWELVE, RCVD_NO_TLS_LAST,
 ASN, FREEMAIL_ENVRCPT, RCVD_COUNT_TWO
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 06909b6f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Fri, 10 Jan 2020 07:53:55 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id AD79446EFC;
 Fri, 10 Jan 2020 15:53:46 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] dt-bindings: panel: add Feixin K101 IM2BA02 MIPI-DSI panel
Date: Fri, 10 Jan 2020 23:52:22 +0800
Message-Id: <20200110155225.1051749-3-icenowy@aosc.io>
In-Reply-To: <20200110155225.1051749-1-icenowy@aosc.io>
References: <20200110155225.1051749-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1578671633;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=z5doQufRXnQT5L4o4+thcACLlpA/uKfmmktXJZpePJk=;
 b=jxqLBstjTsy4JyM4ofvrsBDqc9fIHbbUL4VKzx57QgeQIzto6Oc202p6dTD6GDeDdCOR2v
 LELUX2m/wri/B4Rq3WorrVoophvrQNWUBf3qxDBarGlojSp8z1W+Gk/IUGlc7NHZ1v5zS4
 xmqsYWDb/dlSm+8taLY0SNmEHtXSN0c=
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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

Feixin K101 IM2BA02 is a 10.1" 800x1280 4-lane MIPI-DSI panel.

Add device tree binding for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../display/panel/feixin,k101-im2ba02.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml b/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
new file mode 100644
index 000000000000..7176d14893ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/feixin,k101-im2ba02.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Feixin K101 IM2BA02 10.1" MIPI-DSI LCD panel
+
+maintainers:
+  - Icenowy Zheng <icenowy@aosc.io>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: feixin,k101-im2ba02
+  reg: true
+  backlight: true
+  reset-gpios: true
+  avdd-supply:
+     description: regulator that supplies the AVDD voltage
+  dvdd-supply:
+     description: regulator that supplies the DVDD voltage
+  cvdd-supply:
+     description: regulator that supplies the CVDD voltage
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - avdd-supply
+  - dvdd-supply
+  - cvdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    &dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "feixin,k101-im2ba02";
+            reg = <0>;
+            avdd-supply = <&reg_dc1sw>;
+            dvdd-supply = <&reg_dc1sw>;
+            cvdd-supply = <&reg_ldo_io1>;
+            reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
