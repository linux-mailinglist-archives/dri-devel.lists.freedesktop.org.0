Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1D2C1EB0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 08:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A65D6E202;
	Tue, 24 Nov 2020 07:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44436E202
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 07:12:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AO7CGsr043343;
 Tue, 24 Nov 2020 01:12:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606201936;
 bh=/+oNkOuSmPrZdDnb8AYQjur/yz8NTYE0rxBWwwTplD0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rOoxlbiMs20uWfTRKiUH9cMEAAxvFAeVfUMA0VeOfZWmuxvV9aww/gHQgV5DiJqRY
 5q9e+7TUpMfSxipp1V7SfuFSfvzfuW15ayHZ3pmHSiqNDetxzABT9UaB86CcESJV7O
 w0zgS/W6kkonQrarHSCCIVg3HyHh0maDD9KaJcQc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AO7CG7t052217
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 01:12:16 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 01:12:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 01:12:15 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AO7C9Fl052664;
 Tue, 24 Nov 2020 01:12:13 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Jonas
 Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH RESEND v3 1/2] dt-bindings: dp-connector: add binding for
 DisplayPort connector
Date: Tue, 24 Nov 2020 09:11:54 +0200
Message-ID: <20201124071155.76868-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124071155.76868-1-tomi.valkeinen@ti.com>
References: <20201124071155.76868-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Rob Herring <robh+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sekhar Nori <nsekhar@ti.com>, Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for DisplayPort connector. A few notes:

* Similar to hdmi-connector, it has hpd-gpios as an optional property,
  as the HPD could also be handled by, e.g., the DP bridge.

* dp-pwr-supply, which provides 3.3V on DP_PWR pin, is optional, as it
  is not strictly required: standard DP cables do not even have the pin
  connected.

* Connector type. Full size and mini connectors are identical except for
  the connector size and form, so I believe there is no functional need
  for this property. But similar to 'label' property, it might be used
  to present information about the connector to the userspace.

* No eDP. There's really no "eDP connector", as it's always a custom
  made connection between the DP and the DP panel, although the eDP spec
  does offer a few suggested pin setups. So possibly there is no need for
  edp-connector binding, but even if there is, I don't want to guess what
  it could look like, and could it be part of the dp-connector binding.

* No DP++. I'm not familiar with DP++. DP++ might need an i2c bus added
  to the bindings.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 .../display/connector/dp-connector.yaml       | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/connector/dp-connector.yaml

diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
new file mode 100644
index 000000000000..b5fc3e52899e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/connector/dp-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DisplayPort Connector
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+properties:
+  compatible:
+    const: dp-connector
+
+  label: true
+
+  type:
+    enum:
+      - full-size
+      - mini
+
+  hpd-gpios:
+    description: A GPIO line connected to HPD
+    maxItems: 1
+
+  dp-pwr-supply:
+    description: Power supply for the DP_PWR pin
+    maxItems: 1
+
+  port:
+    description: Connection to controller providing DP signals
+
+required:
+  - compatible
+  - type
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    connector {
+        compatible = "dp-connector";
+        label = "dp0";
+        type = "full-size";
+
+        port {
+            dp_connector_in: endpoint {
+                remote-endpoint = <&dp_out>;
+            };
+        };
+    };
+
+...
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
