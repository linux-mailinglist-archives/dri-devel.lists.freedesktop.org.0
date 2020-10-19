Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FE29277F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 14:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928336E960;
	Mon, 19 Oct 2020 12:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775986E960
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 12:39:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JCdUwn025081;
 Mon, 19 Oct 2020 07:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603111170;
 bh=8GDNvt8NlmAdtPiDDFDlL3s82YfO6TAwF4qRv6Dse9E=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=t7jT99Z0z8QSZ1Y2yLIcvEU0wV+qgS0DGRMbN/SqCrzfZmSbc1q851SXkDi0BdxIY
 n6xAHCZKrC+zuaGRlrlLj31YSN2b7FerSSQDShenR05BGci//KRxOPXCtJR7Zky6CN
 UPcxf/n1AtyKjpNg3+zZNrsLt8IIyGLeAyY7ldX4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JCdUnR000531
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Oct 2020 07:39:30 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 07:39:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 07:39:30 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JCdP8W060195;
 Mon, 19 Oct 2020 07:39:28 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 1/2] dt-bindings: dp-connector: add binding for DisplayPort
 connector
Date: Mon, 19 Oct 2020 15:39:03 +0300
Message-ID: <20201019123904.259146-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019123904.259146-1-tomi.valkeinen@ti.com>
References: <20201019123904.259146-1-tomi.valkeinen@ti.com>
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
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
