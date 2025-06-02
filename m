Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6401AACB76A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 17:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF3D10E553;
	Mon,  2 Jun 2025 15:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XlSTxbds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2066.outbound.protection.outlook.com [40.107.247.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344CA10E2B4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 15:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khJlMZH+j/bIv3hHhpYuSMTaJHWrF2zM1WimXJQTlMXfG+hCcEqZmNp/9ZjW3uDk0Tjti0iZNRai4Owd+otpExYg2mz3oIbrcDVA3+cFzmMYm1Z8ZoFfTz62GcRJN5mIi28WD7kT+zH8iqtDdBgfiI53+0rYdfPCbhqdEQrY5Z/U2Ef+Wj4JBbxmLLV3GjIS7PAkXGC+hMIeX4Tew+TEYqNNhGi+5qrHoCZ89q4torSNiA0qzsl1HErvyliTBNm+TISP6t+euQbFzBwI3jLopQ9xp558HtR19DdY53bRhJ3FGo+2+WPHpipqH9uH2si2jRGEHs8cLACGsZvQwAcxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajlltD0V1ZYyLrv1Nf9n0oQGpyTYa3GyTjRM4kE8Iqk=;
 b=wolg4tcvVk5gXme8ALMEfBXbCTbHNRZD9N9+QVculevGIOyVzyZNiYkDgQ1S00w5tpL5NNl1ly9e7bhW6/u42EzyTPiyylMOgOdX2a+c7TZahNg4+FaE250E5vPMmvYarcslBiEQX1TaH4QxYlZv4HTunDLha31a8adH5o0xmirL8A76SKF42FW3vm2Z+2htjEwR1pLKoBMZi34WfslELCnNQUGl/9uTytXVfMzC9DWLbD7fX6b/moaWczKtKpFcapOu/qs8u3yRVQsMFiTAERYr5TuByK53wkm+cz/mXm8ltUAgbFMdy86ZWrZHmDagh4UOwrF/dU6mb/rPflYPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajlltD0V1ZYyLrv1Nf9n0oQGpyTYa3GyTjRM4kE8Iqk=;
 b=XlSTxbdsS6aGZxpyFKJUjg3G4PrDRZxjM1Q+ibFP0WT2CQQof9MZ3DY5E6uoeO4gL8Lisuh42FiaiORz90QpCfXJw4muctxKcADxp8O21b6wBVLjpM5ouaLSfXzv0fhpWl8zkULFuHIERy++6Q7G7hf2IshDFGMhZqLWkhjqCC9HIw9osiMa3CqP/OuQYjNNv6DwzewLKjFa+97oZ8RW7ulWjK518zp6EmYBQkuyAPvwxq2Y9PgwD5Kko1D2i5aqB0QhMvIZo1DXNQwBE9vnrJXi5WmnXWkuVi7sIVP+AIMS6SuqEGyvdvlyu6/LI9/gIFChFS89G5NmlB6iOcJpig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:28:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 15:28:30 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	wahrenst@gmx.net
Subject: [PATCH v2 1/1] dt-bindings: display: convert himax,
 hx8357d.txt to yaml format
Date: Mon,  2 Jun 2025 11:28:13 -0400
Message-Id: <20250602152814.949671-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: f14f1f48-50d9-4b23-52ff-08dda1ea20df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E9ZDc2al7IcwTholj8OGGlY0xnRoZvbaEWBVKoGmNGWeumSb9zCzw0YF0URg?=
 =?us-ascii?Q?VxIvpjI/c+3iYokYf8YKeaIk0Y9Xgzc8WSlatFRJ7T25Em+bQGBlDBrDuq1e?=
 =?us-ascii?Q?NznxptqfK99gSdeaDLIyN7f8jHPqmEBsF8WeshpX3jwsnGNWyyXXnz0fB0qs?=
 =?us-ascii?Q?rUckkX8L8hPiZ4PEjRMEjgPdxKF7KIPqx3Nh10ZXIIhvND9m4g66NB43Igzk?=
 =?us-ascii?Q?S0hjZscr8uUmd9outEPHmO2FkhHE3QerVM6zPxKEJkKW0tzBoh7+Ep7jeo/7?=
 =?us-ascii?Q?WvfRrTeL4clJ8C8MRDUUZHpbKgciUG+xiiTmkWq1pbHEjrT2CX36yPXyaXB0?=
 =?us-ascii?Q?ulS9UPMYiMbezelnwTHxHXeYuv4JOzrgUtonRTx3IZqxeL8iMSpYXfV4OhaH?=
 =?us-ascii?Q?mwiGVehPgzbvmAN249REiNMuzEpfjKVVY/89m9dmhM4KRU4qNevqcG2b8nq2?=
 =?us-ascii?Q?9BX6mgasoZWRF2I/D4ptb6scACklczr6YlPmeh04eMBAhlZyYqwQozu1fU+L?=
 =?us-ascii?Q?U5HIkhG9m8IwUOBfTEjQZe+p95s5TYGAht8payYlng+bZB8uMxtQjdAHLh01?=
 =?us-ascii?Q?clew+fe1qUpcllctc7hdSjtGiDjqq2Zut/qq9lGxxch5aqM1yZeFQNb/2fSM?=
 =?us-ascii?Q?BoLzoKR1y7pL3Jwm7gvxKtbnBcMczDgH2yWNVSNGAPBDejp7SYxPoEDQ3We+?=
 =?us-ascii?Q?HAnbrvomoQFphovSthUY8i9DP4jXaqq1LBU2YyZQF8BIDAW/0kW/KyEOOXoQ?=
 =?us-ascii?Q?cVrydnjujz2d+bZuLxOXUYqYcOxRt8uLDv2TXpwl6tjR5rTnqGphUqq0cywf?=
 =?us-ascii?Q?P3UBC7X/yTuSY4Ewfi6hII1t6iZS3pFNxTkMckNAs9uKEm5qCIk2rtHul3Cj?=
 =?us-ascii?Q?wWwnFw9fjM824A1oHZljNJrTodvHRf7JuLtRrq3mi8vCzOu2q115pgPS6SNx?=
 =?us-ascii?Q?Vjnfd6GgeBzSEQ+/gVhY1zmCXzrGP8lI6Ph8ekMAp8nSF29cUq8QQuP37uv/?=
 =?us-ascii?Q?tqbca140k63d9+tt8peSF4cW85tG/G+hUl/uoqt3or8WGZ1wEMhuzbWjz2sj?=
 =?us-ascii?Q?+qRtCpr5+UFu2dDY6hU/ezNUlE6r91vwaX8L9mYaaCeynMggg3GiEzrPkqP9?=
 =?us-ascii?Q?QLx3vExZOYAapMNYUzkZDl9sZdObpp+d3sJcAuSlYyHHHjqCNk7ZV74UzdTJ?=
 =?us-ascii?Q?f8mX2rkcVTJF2ifXotvAArCoKt6+jkYq3BbJvoaMu5Qv87aGHvffQfyRaoit?=
 =?us-ascii?Q?WxQsqDPuz/c5SaTtdJkHr6+VYfVEAr15WIn1RiAoBedoYiSnlg4Vfhwp+HVr?=
 =?us-ascii?Q?o6qM2fGE7k/PfVxQTSOiqlFXqPbzD/5vX7sua+l6BileFNdpLm7yhcakaMb+?=
 =?us-ascii?Q?iGfDtoHBmGnFEA9xCJ6Bz1u5gFfs/cOsoXqCMldC0ni+5WuWwY+raFxpobga?=
 =?us-ascii?Q?k8ahXoPYVBalJvrTzKfoX5cB+lc8ypJ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yEIksMfFCO+MLkxoMhMeAu5eoyWe5Nw8E/t167df+hNAPY1zv61Pbyj/X7Yb?=
 =?us-ascii?Q?8PoBrPrzFH0xW9O+e8MgNHvfVT+0JqUj6KGXU087GXyQAEot40EDhriVVPHv?=
 =?us-ascii?Q?TUrIVwMKIS51Ork4REUguydiJfL59gl4Rdyq0B0Izmqf673B6XcjnEUvPAFp?=
 =?us-ascii?Q?NbfcUW8jkC5aid6OkBiQ5Jkacy+YECUnpZvy8o8jb7bAMiQCVbfG+EXwbsGI?=
 =?us-ascii?Q?Q4KjKCLBh1nQpkcjb610nuQavwKDR1oT3MPE5lrCIXACIydhw+v92hEbGc8J?=
 =?us-ascii?Q?vYgQ2FtfA7d3+KzPNBeiWmKfMLoU8OvIGRzaPB/RuCnZASeIKoy18clMLdtD?=
 =?us-ascii?Q?1yJ2e64Iv20Y58VeQMHYQODkOc7D2YYtCWSA04gvXn+0fdldyTeGOLtcXcUY?=
 =?us-ascii?Q?Ne3n5+hEoPNdj3yi1yk4IXrGMAqQ7nvLUxEDH7es6UvFoQfCvQvAtKgVqBNb?=
 =?us-ascii?Q?vHWR0z1T3hfwPI6R/K4Xtl5E4FngvYvueS/H5IiMZq6p62yGmWfJuONlQGWf?=
 =?us-ascii?Q?kWUR0q9g0ksq0XpDKOiwhw4S2FwCXVC0cihR7EpCSJ17OB46sE30nKAsEOaS?=
 =?us-ascii?Q?m7P8udpLR7KmIonoTzXFpIwiJhiYlcuIAty6tAd9W2u9wXAo3lJMcmFvBhiQ?=
 =?us-ascii?Q?jiYjUGratw9Wwv2qts7/5mnyR8l0k+f8PFZtkLDVdFTC4aws4saT5mRmM2P2?=
 =?us-ascii?Q?JLQmDVsic6VkU06RXhtYSncMXAJC8GCO+vQuBzQ7zzLqq0p45YwLd7Vak1tY?=
 =?us-ascii?Q?U2VC58UJ3OfMcTCRT8jFLIVLXRBXJIgWHYt8ZWRwQ4zcGLWYsHB4RQX/JOOr?=
 =?us-ascii?Q?nY6vv6z+bawHqnCSUWfOuZs75RiJy0tT3TigagfIeGxYXjaBuvUJP8WGN9rY?=
 =?us-ascii?Q?SO2/9vs3ji483RV0qzooHMPXic8bveOmDS6v0zV6cdvN6e1xDQsRhc8smb8D?=
 =?us-ascii?Q?69WI9eg69qCHl7U8nJCfOmwHFmjnmsR3nDYDf4juvMPqSXLOfxQMomwtz17q?=
 =?us-ascii?Q?yz54I8L6TpjKcrUOk8ZpaSCcnNm5QXctn55mpqraAe6iffA3TvDiBU54mejS?=
 =?us-ascii?Q?IXP+hg4lBTxp+N0f8AwUSXcXdv0VD0N1GkI+dh7uQYl+vS56kartc2YQabIU?=
 =?us-ascii?Q?JsDbgd+veOsgtQaBIm2b0i/ucrl5HHxmWmWhyuJBiAuK/OOrNFubKWBUIysj?=
 =?us-ascii?Q?jmlbyY05coDwZNG/kQgoMhKEw5BI0wWPTpYk3PxhpZ5yk6JusxSq4BBzGDLE?=
 =?us-ascii?Q?6lr3Cmv8CTDRRief2lE5npyEjKphPxPfcngBuvY/Yi0JHZAvMQ71fmtCwgGl?=
 =?us-ascii?Q?T/bQEpvqwXbfH464rE2c8Vb4lp4dpPi6C680Swrf5e8ht6GeSgdBi/Oj0hiD?=
 =?us-ascii?Q?n05wDN85+xvoLWzvmuZ1ejh7dmZ+XE5c18HD6IboGlMO81vTyiTxrpjWHv75?=
 =?us-ascii?Q?pToSo3XvsqbqWRuILDKmOG0OmnVdQgR7U0rsvqnA5ZVBrkF2lMouXdfHSjcW?=
 =?us-ascii?Q?OEjkf3r+npEICwz0Q+vEP/PjrhqC+vqi05/xVBerHhGlnAwh/G/72tyMKzPj?=
 =?us-ascii?Q?KbGPZzQzm5bx/EOf4WDqvanjMPRDzq+S1WU26xAF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14f1f48-50d9-4b23-52ff-08dda1ea20df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:28:30.5644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9gXiIYnW02B9iy8Lf09kCQfCQ/wMGC1NXyAZDWJ2ABDBNhqRBgm730WzVCXfbyMYJu103dIqmaBLBHIH0FI5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064
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

Convert himax,hx8357d.txt to yaml format.

Additional changes:
- add spi parent node in examples.
- ref to spi-peripheral-props.yaml.
- change himax,hx8357a to himax,hx8357 to align driver and existed dts.
- add himax,hx8369a and fallback to himax,hx8369.
- allow spi-cpha and spi-cpol to align existed dts.
- add im-gpios for interface selections.
- add reset-gpios.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- update MAINTANERS files
- replace gpios-reset with reset-gpios, kernel have quirk for it.
---
 .../bindings/display/himax,hx8357.yaml        | 78 +++++++++++++++++++
 .../bindings/display/himax,hx8357d.txt        | 26 -------
 MAINTAINERS                                   |  2 +-
 3 files changed, 79 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt

diff --git a/Documentation/devicetree/bindings/display/himax,hx8357.yaml b/Documentation/devicetree/bindings/display/himax,hx8357.yaml
new file mode 100644
index 0000000000000..34c3b89bf0033
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/himax,hx8357.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/himax,hx8357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX8357D display panel
+
+description:
+  Display panels using a Himax HX8357D controller in SPI
+  mode, such as the Adafruit 3.5" TFT for Raspberry Pi.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - adafruit,yx350hv15
+              - himax,hx8357b
+          - const: himax,hx8357
+      - items:
+          - enum:
+              - himax,hx8369a
+          - const: himax,hx8369
+
+  reg:
+    maxItems: 1
+
+  dc-gpios:
+    maxItems: 1
+    description: D/C pin
+
+  rotation:
+    enum: [0, 90, 180, 270]
+
+  backlight:
+    description:
+      phandle of the backlight device attached to the panel
+
+  im-gpios:
+    maxItems: 3
+
+  reset-gpios:
+    maxItems: 1
+
+  spi-cpha: true
+
+  spi-cpol: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "adafruit,yx350hv15", "himax,hx8357";
+            reg = <0>;
+            spi-max-frequency = <32000000>;
+            dc-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+            rotation = <90>;
+            backlight = <&backlight>;
+       };
+    };
diff --git a/Documentation/devicetree/bindings/display/himax,hx8357d.txt b/Documentation/devicetree/bindings/display/himax,hx8357d.txt
deleted file mode 100644
index e641f664763d3..0000000000000
--- a/Documentation/devicetree/bindings/display/himax,hx8357d.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Himax HX8357D display panels
-
-This binding is for display panels using a Himax HX8357D controller in SPI
-mode, such as the Adafruit 3.5" TFT for Raspberry Pi.
-
-Required properties:
-- compatible:	"adafruit,yx350hv15", "himax,hx8357d"
-- dc-gpios:	D/C pin
-- reg:		address of the panel on the SPI bus
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-- backlight:	phandle of the backlight device attached to the panel
-
-Example:
-	display@0{
-		compatible = "adafruit,yx350hv15", "himax,hx8357d";
-		reg = <0>;
-		spi-max-frequency = <32000000>;
-		dc-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
-		rotation = <90>;
-		backlight = <&backlight>;
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 7761b5ef87674..c14da518a214c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7523,7 +7523,7 @@ F:	drivers/gpu/drm/panel/panel-himax-hx8394.c
 DRM DRIVER FOR HX8357D PANELS
 S:	Orphan
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	Documentation/devicetree/bindings/display/himax,hx8357d.txt
+F:	Documentation/devicetree/bindings/display/himax,hx8357.yaml
 F:	drivers/gpu/drm/tiny/hx8357d.c
 
 DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
-- 
2.34.1

