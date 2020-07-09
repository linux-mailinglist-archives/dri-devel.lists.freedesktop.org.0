Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BF821B0B4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92DA6EBAE;
	Fri, 10 Jul 2020 07:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2132.outbound.protection.outlook.com [40.107.236.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE31C6E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 08:33:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgaGqlUxuhaXsYfc0Yz/HjpFfSrOd8W3YReIbLmKGvhALZN6vXpunGD4V+T2NsOqmNS8WRLaYn2nMlIs+YISAO01bJ12fEJmXUe+q28TaXGoM7ctdVkVgDnE13MRqLWy5v8MwkFA0WvzKDYwU5ELUnineqp5NMwd5Tr94bKuVaarwXak5cqHuecljaQ14BEKaJoIp+MfTe9nzSZNm2GcUj1pNRbGPD5hOB3R2ydRg5zEHNOuCDDv/P6sf40DRadxd/Z2EJcTNLOFo7cvPZ7eoCBkpnYeDQLafdOz2wHE55XGGIrxCkyzTlT5JXu9mgui2fMQVvTNmTxMcfbGz8UXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2l02bwqOJcFgzvXOM1FKabFhPQkV7mDdw5aOX8Ym6k=;
 b=J4+p5EGNOg+vpjQi3pPA2HBRNoXvIecyeVt6pK0PCGFFGMSw7JqGWpoEY8MCWxmLSOyUSzuSs2VcC9lg60Adk38B4hfDs9FEl9Tbts1QSVn40d7/XO0mBD0T06I2YqAZAxmk72+whTflVYDGhvXYNYZhFR1QjT7GvxFS8y6LQSM/6byOhDsqZ3NRghVOW14ipNYXEClJjWqPDarOhu4wMNUmxoopQTYeOfw8x0eJFSVXHmso7jlTnQrj9GoTIQHXgOhkvsT1DgtG+qw2f+w6cj0jeK7HaxDkn0E9UQENLSsg/XdeMDHAFPApW+pZ/VQ85SN4d6svrkr5gJZc/Gv4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2l02bwqOJcFgzvXOM1FKabFhPQkV7mDdw5aOX8Ym6k=;
 b=qx8oAUQuF38RMPaZATu6zZg7B2SnH8eMhyv4fiP5g9B4AnJteGibZ5JQ7S2iV2VTMwJ1WrvZjsFtSsbUhrnRwp1ZrpWC4jAn9xdKGeZEoPF+/j42k1A7Kbyc4Co/RicreUTdA4/Oo1TgdQXMZWtTZwiMNd4bQHMhqlcfF2ity48=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5462.namprd04.prod.outlook.com (2603:10b6:a03:c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Thu, 9 Jul
 2020 08:33:01 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b%5]) with mapi id 15.20.3153.031; Thu, 9 Jul 2020
 08:33:01 +0000
Date: Thu, 9 Jul 2020 16:32:51 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v14 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter DT schema
Message-ID: <eb234492d16805c9b3a1f5a56b161dc50be3ba17.1594283160.git.xji@analogixsemi.com>
References: <cover.1594283160.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1594283160.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:202:16::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR02CA0138.apcprd02.prod.outlook.com (2603:1096:202:16::22) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 08:33:00 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e86a5e0a-b30e-4824-8daa-08d823e2b103
X-MS-TrafficTypeDiagnostic: BYAPR04MB5462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB54629A7DE6A4DF9CFEA182D2C7640@BYAPR04MB5462.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 04599F3534
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a2j+eHRozwxO6dz2641rmk/89mzF/xPfbKAb1J0zNKqU/pqgHIn8ShuMy9PdenTSOhW/e/95+c2QKIM4ktcUSkOviM3qoeryTbRgVz/ws/ZAY45Kelnqw2NxG9CSSYl/ey8B2DzBnOcgzjqfmcIyVaIhImgD0Tk35iTHBM2m30OQWHt+e1kMnrOhiI7ddjY7rFl2n4+MmZRMLGfm7ovUC6CBDAQoFKPC2BvdJ8zHTdDvtyvMwDg31IQrHxmHHo7uyMrt7O4uyUwfYm52N1jAKMGIyNLFP9Vs+auVbb6/NpNI0VjpWcb6ChXVXLRmRgphk7dbv4Inb1Kgn0tEC/UTlbd+6NTvI+ffUYqmTJ1kM/OAYhL0Porr6okEJtCz/NHUUiNRjX6zGyqbQS0jYwxblg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(396003)(366004)(136003)(39840400004)(54906003)(110136005)(316002)(6666004)(8676002)(6486002)(2906002)(36756003)(5660300002)(66476007)(52116002)(16526019)(66556008)(186003)(66946007)(26005)(4326008)(6496006)(8936002)(107886003)(478600001)(956004)(86362001)(7416002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: IcA3BILt2uXCimQ5QdQUeQrSP3yjXZc0MboJKXcACzOjnhob89mJJgkVZ9UJD/KbDbftkTSiVgZBsenQETSgfy3iPxJ84MWh0HrIeixl2upT2Gm9dzqAAQoqrBmvFpxLgTn3QIn06hXQ1WzlEFl1JV7ydwOAdTLYHOmVlKSiXyUxQ4ttLSb3014NT9E5baG93Ho3fPNQ4tF+nUB+yxAP2VeyTDYUkrBcKCATVhXMUny0pRlqjz1Z/c7jVAs1y7Cd/WsR8iAbVhxz81VJ8bWg3YHc2QQXsJGVjJRu3t+m74HSVrPn/7t2r4GyNFoQTWrsFARTOWzf1s58yFzY9Ev0vAo64TPt++Eit6w/9bvBppscWnXS6ypObLj54DKJYCcKgV60J5HV97TWYiL76TMT+rDK8UG79StoD+ldXAqYvqjSJIxUGFYXwT1Cp+UZ0i7Dry7GM4gfcHWoiOJXvjbsvhLeEQTQenH4BSbMbSDeMjzfAGyVj1QV9U+5o6kbdJLn
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86a5e0a-b30e-4824-8daa-08d823e2b103
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 08:33:01.5721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tnTuxp8IAfA6OQcqe2hWIHgA/igfmmL/OyOebIcLSryvhwvXpAgcwOejgaUbEEfi4N6FhM9F5nAVoQvoZHzGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5462
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625: MIPI to DP transmitter DT schema

Signed-off-by: Xin Ji <xji@analogixsemi.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
new file mode 100644
index 0000000..60585a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Analogix Semiconductor, Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analogix ANX7625 SlimPort (4K Mobile HD Transmitter)
+
+maintainers:
+  - Xin Ji <xji@analogixsemi.com>
+
+description: |
+  The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
+  designed for portable devices.
+
+properties:
+  compatible:
+    items:
+      - const: analogix,anx7625
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: used for interrupt pin B8.
+    maxItems: 1
+
+  enable-gpios:
+    description: used for power on chip control, POWER_EN pin D2.
+    maxItems: 1
+
+  reset-gpios:
+    description: used for reset chip control, RESET_N pin B7.
+    maxItems: 1
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description:
+          Video port for MIPI DSI input.
+
+      port@1:
+        type: object
+        description:
+          Video port for panel or connector.
+
+    required:
+        - port@0
+        - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                mipi2dp_bridge_in: port@0 {
+                    reg = <0>;
+                    anx7625_in: endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                    };
+                };
+
+                mipi2dp_bridge_out: port@1 {
+                    reg = <1>;
+                    anx7625_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
