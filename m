Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B41F34EC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB946E25A;
	Tue,  9 Jun 2020 07:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2092.outbound.protection.outlook.com [40.107.237.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AFF6E1A4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 07:17:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aISb0tVSTfPMPYy94C6UguRIzus7GNuJze2SwPe9fDpheZViOmmpDG6WCIJkKLzwn27leQfpRsZlkYtXfIginTzUEViKAFqiVM/0ICvh2TA3nU1zE5EYbmMRNEHgcdhG4yiMEjtYtdVRRXJlSrqmHUUGAzZdOUt2tZv7moe2thu0IzNH5yp1S1oI5p+KKL3Qb2GiEXPvLe8tjRM+GWO6yZMBvw76PUm7ITyaFsgYCFEtSoCYblK+KELQHkmT806CC0TuYN+i9suJ0IKzQ7/amnxjluf7VraP9g5H2mjAfCIirsaHTVEs2fqfdg6OIT6porQBZqsGC7lIBwq44QuZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2l02bwqOJcFgzvXOM1FKabFhPQkV7mDdw5aOX8Ym6k=;
 b=SU8o8nfwsAM6hJSb/xWoSNxdPUXcIHLsl0nt7iSofr/oo4dULVk9zakgZoorkgXjX7Jv9UcJk7hUepI6/UI0UzygdVVnYRwhzeAB2EgWGqZ28qKPBHhtIstae1YiCVqho5N5aVRTY8ahTO0U+9yZBqpbAFT+sRjJz0F54KCW5wnasOpduwMobMDIixbeG1ukePV/qzx/QWrJ6iuFcmIAc7EvkfuAfS91QWUYXAqu3yVII5zoSYzt43cUaZn7ldhhzjpQEV4Gnhidvchl1g9tc/y2IRupQhwXmcP2+Zp5lA6iE/grXxjNhkomu+lizKmVB15mYKlr3PoLYvu6u1dIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2l02bwqOJcFgzvXOM1FKabFhPQkV7mDdw5aOX8Ym6k=;
 b=rYFLbnwp5yLDa/vwM16TfpHncd/6pVZaE3RDcA88lpYlmFO9mBSZdWx2gQxu1Q9+qvpJlgIcYh0VUQyhGVoTBbIyhjgenp5LNRb7Z1xoAQif62ItWMEwmLGEX53LTcUX9RsxWm9AleywT0tth3ZEdLh77g/ups/k4P3E2voEJqM=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6641.namprd04.prod.outlook.com (2603:10b6:a03:22b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 07:17:12 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 07:17:12 +0000
Date: Tue, 9 Jun 2020 15:17:05 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v13 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter DT schema
Message-ID: <eb234492d16805c9b3a1f5a56b161dc50be3ba17.1591345160.git.xji@analogixsemi.com>
References: <cover.1591345160.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1591345160.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3088.7 via Frontend Transport; Tue, 9 Jun 2020 07:17:11 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0ca269c-eb0b-4ba1-3dc7-08d80c4520f9
X-MS-TrafficTypeDiagnostic: BY5PR04MB6641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB66411D75E73413B7D5E5800EC7820@BY5PR04MB6641.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljvS2lTScWTVe486TOvzMlHj5ggVn10MBefFqsgDblyfKshEf0fVfM8OH/93PPMSOo6uOGEPLeg+v+lv9ty3VUCbALtkuRJNWIePjd8egABkCXlLUZ+E39k607auVzTwip80nq7ZZUiNR2s+1j9E/7ZsVI8WGLHh7Oz8ShIdF73og4A1Zy3qw+TcItgzHDaPgSXdymu+vDWXw5eV3KczAUEdscRmi4HwO3Sr4gRJ4/OhB0SYxbGvNQfgQtYk6Z+2JsAB9TvhlMl13bLQKqoH00wVdo9Qo9KKD9XPTu6ioG2VarlYMMFtgPlB9fnceiXwxB0ZF0fV4etOptE+4zImiTjcY5z260vjDg/4QJkKHQGu6mDKFqeQWjb9C5LlLbdStOkB09DOD+8uY/w+hpoSOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(376002)(39850400004)(136003)(366004)(2616005)(316002)(26005)(86362001)(186003)(478600001)(7416002)(54906003)(6496006)(5660300002)(8936002)(8676002)(110136005)(16526019)(6666004)(52116002)(2906002)(6486002)(66946007)(66556008)(107886003)(956004)(66476007)(36756003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: fguBw40sYRJmrnjXnyAK/lriz1CLStyDqFXd+ti39kJG8uBIgIcw+bly32UjNTRwxkKoYhZdCihzH3e7qjPrgmB7n0TrEEds9cvYjiBP01044pXV1T5h3AWOcuWeLhg6Nl3+ymNQsXm5JgQ+2h/Hp41FuYjLjookHzgogme3AoPRwJV/mMS8lFhcqGPwhbqsFCJdX05PLzORKwV+eR+0KPd0zkJxB43G0mdvfZdWfDOXMvWe/256KI7N9ntCpPk/3+FutwoX2I+8NggkDZl8eAbDdRvLmKCJbbCaYNgg9xKpsnV0h51KS7/5C1/G+YwN0+pcoTeFLwA+a/91Ojwkn2p9Jls5btHNsvGMz3PzXJNzFwcbK+VY4konS7DmSK/79QNtWgM9v7rj/PCybyHkCas7tZStmReCOUe3oDOW0ows6Fd2Oagjly466b+Mf8ESWhC06lBVQvR+3pmgYYMBa7d+RgW0Fk9CgkH2vm9zdWRj+3OutVbkojno0EbMbZFG
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ca269c-eb0b-4ba1-3dc7-08d80c4520f9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 07:17:12.3026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnjFKaUN0C7cRf3efjEgppcBQ9iWPezTGzf/dBN354IjfBKD6Nn+9aMU984etNiEwIxfsNeqGIbbyfRSK3SrsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6641
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
