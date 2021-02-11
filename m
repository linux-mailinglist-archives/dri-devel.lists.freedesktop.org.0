Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9722431845E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 05:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5D76EDEC;
	Thu, 11 Feb 2021 04:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EBB6EDEC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 04:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndSbW3YLgp1LrGRT3cTzBArFYX0NkJujQTNoEYB95Ip4Wz1AocccXaubU1tcKahkGzNBus1WbuI9yoFtMik0lYPUwOeECvrgrWMIXnSc/WX7SGVF96i3YMtXuvhZtqLcDriI5S2+Do34ho5yy7uzQejgxwdrYl3sX39YM5Cd9cfjNLXSi9ggmqci0Z5vsBv8HB3Q3ArswGs90PyNGOe4vZbKPoLEhy5+p0jlFET2ecPhLxr4qXtPRcAu5MTrB7kKRqQ2NSfqHXE+E2txYsCmfBEsMzHp+7kua3lngf9e2U7B0ykuv7acijv6xLgegM12yYsPe5qHGEKCQZWxWqhURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SO/NuhRfKHm7qm/YP9neBbXmKvrvEWJIv3Hlu52aRn4=;
 b=FG+9zYXaBL0nUOW0VRjmgHEnfk/VqCuphcXkwNTyQMuK/0YH2zoKpce0msUsaAFo3+NtGYIfMQOkSNWuHhdQ06wxWlC+QFQvePpTL0oEvyN9xuX7cB117KpzSqONBhkoiNVlONIrKH/TBj5txHXBMytNSZ6A6JwjocDF++ZKxCVfxjpwYXu1zM/pZpOmJVUcsMA90Ty3Tc4P/2vFMnXBHO273u0qhPWC1nnoaP3GJSLjhQFJ0AX6osMbw8fIesMqdWyRhLDeDJ2L6NRw8s9jo1/GtMBjUVn8ilZhSh9ZB65Q1k6W2xg1mapxEonmpWWXQl0z4K0sQMiuFVC9R7x2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SO/NuhRfKHm7qm/YP9neBbXmKvrvEWJIv3Hlu52aRn4=;
 b=XSFlsVZix/X5yfner4M56UbwZxYzGyJcfx1eyKRwQhkANFnBCBYwV+lhYu7k62Olaj/R94mrFauhJtb7/F19JocHrvaSRSlydjXNrBbr9pyxbSwAgrWWueyeYWd6VSpqMfqj/9BAn+3WY4TGtsQ0CmaLX4npyBq6v6mudlSTrYo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6351.eurprd04.prod.outlook.com (2603:10a6:803:128::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Thu, 11 Feb
 2021 04:39:27 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 04:39:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7] dt-bindings: display: panel: one file of all simple LVDS
 panels with dual ports
Date: Thu, 11 Feb 2021 12:27:52 +0800
Message-Id: <1613017672-2734-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0201.apcprd06.prod.outlook.com (2603:1096:4:1::33)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0201.apcprd06.prod.outlook.com (2603:1096:4:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3846.26 via Frontend Transport; Thu, 11 Feb 2021 04:39:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6af9752-768e-48a0-e8fb-08d8ce47034f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6351:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6351A37F8EB9F546DCA9AAE2988C9@VE1PR04MB6351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CCn1iXcJZ5gqn5yolliHgOEUoUbWc/3KH1CuoCXnKiHyKIT+03JzC22ozkCjXRMz/Rssq4n/688P6eu6Opz+2qRZ8t9F9TICBDm2p16IC+PXf5TIdkjs0Nkr7cXuzE9urR/wAmXhlF62K5mw9L/NygfCYFqbfvYZtEGoGmPhNG13jUICxCFfvyTTNh1HY4iZF2+T4+NzcJwqFK8eio92RaJkNW7NXVT65b5gL9albzv0Voc9zEsKQfPB3/XsYvGLy9X+X1ar2EBgCvv/UUaXYDy88jNlaOYc+IEBa0wBgDWZgGZWXhJ+aA0Iou2YbJy2Oh3x5msCDy/xaXoC6g5k+whmkBIMsae/bZB25TUAXjVnSJ4Sj9zuDJacB7Zucf3qSKnyerQ3Urr/cd8ieE7CdpHdWrOGnQ9AUxPOGX555mM/hTYXHONGtRb4Dv4PeCH35k6lBzMrcyjFzKP2CGg+hIRZNUQsnztvI74SLgSRXYwwYVwIH3+89JYTXlscxwlWDv3HpAEgDvxjYaCyEF/yiunqXZkP5kwFyDnc+l2JC2R/BvqJP8SdyQNVLeu4OlRJyWBmi70FwWymWyiEBuPRW3bpUVogS69t5MOZKZJ9p29hMxxIdssWtkZMURqIq3RyAu6znDxNtT9FHFXpup2TA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(26005)(69590400011)(83380400001)(6506007)(16526019)(966005)(6486002)(5660300002)(52116002)(186003)(316002)(4326008)(956004)(36756003)(66556008)(66476007)(66946007)(6666004)(8936002)(478600001)(6512007)(54906003)(8676002)(2906002)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rSoqQ8pps6H60Y0FPfphdWlj6H4P7gUv+C3a4ZNvvqvrIOU9sAtNBTS8q3Gv?=
 =?us-ascii?Q?nnAE8HUvT3KeF41bSL5aMYyFYr7mDars65WGrw8XXXUY6SPHmC2iyU5dGaX5?=
 =?us-ascii?Q?ALXRw6GUzl38Sx97phm9MTyOGvgufXetWdevWUUZF2cK+TI+9ViAvRpgCoiT?=
 =?us-ascii?Q?VBgahL9QwvvA7xV9ac+QpA0h/nHeoyJcd9AgptbsbPm547TEn6K+6S8sgb5X?=
 =?us-ascii?Q?QKJyRal7FodNV1VsoTcS/cdCdKiDioJjdEkkhc1RnDxlqzV2FK3qoSSAJw2p?=
 =?us-ascii?Q?Z/GO+GQTISRgXhsS8Fj+MrzMfZquY2ykp2pRSUzsAF4LCEXPdXrz/xkjrJ9v?=
 =?us-ascii?Q?kLOJOWwpNusAD3ComfBB44ZfKGK552hi0F05JWmzW9DA7v2mvb4W42I5PMOL?=
 =?us-ascii?Q?YSLykh6tbSJE8lld6/oGPvl63I13+KyLih4mX+eBWgerFuVsa01je1oFSKZr?=
 =?us-ascii?Q?4tJjGkqtlg6WmtWbu92gWuUe3X4Y+ruV3GbUQwX7Z/iHVBKi5MoXt9+YYUY8?=
 =?us-ascii?Q?mSTlY0p5S7bhBOq2y/5PnZpV7baiZFQV3RNxddFERa7tu0kjh5NFeiLVWFrU?=
 =?us-ascii?Q?WCYQg5Ni3+y4T/9nfplkNxVyG5IVde6pzPW1UMov1O95cEJxdalD+SaNR/Jw?=
 =?us-ascii?Q?N4aOQCjxuRPgdToO9gWBQs2VyI+oX36JjzLc69fPQWR4y8wJYDBxwaaQ+OfU?=
 =?us-ascii?Q?lyJD7TTWh8+tGz3xQzmwvO43TGR8zI/yeQJvfBxgzKiREU2fllAgVuV65/2X?=
 =?us-ascii?Q?Sj1IHJ9dEoOrXhf9s9BQir6qOArJZwEP/tOYsx03TuTJYQnW3aJtql/u6wkA?=
 =?us-ascii?Q?ZnW1u0WFZmiYmbm8tGMxyMvAmV8GGyxdfI2CWvnzqY61BLHvdIvmTEWEeuCE?=
 =?us-ascii?Q?1db37EcP/YphRHkEqz1prFWH7EYjhz6OORJ+MerYNgEbEMOvviqVUcSxGGzF?=
 =?us-ascii?Q?9vD8pINN4aqVVy4byBvdv+k/cyNI2HY8InomOgHZe7NXMJXz2Kfq+YOueJ9B?=
 =?us-ascii?Q?kmB/tNnoZi8JQYan2kURPRv/zgpvYM6JpOn+3TfWNr+f8OfKs2SZxWggWA4A?=
 =?us-ascii?Q?iXfBEs68u3ZVkovxkK0LCSPyZbpLvZhLjxdO0yp0myN4y19MKd463A/IBBod?=
 =?us-ascii?Q?EGoSkZJ/IzlTFOjVROBwp30XkPTzMwJgI550rCr4sx5RE680YIRNBCASVQ7D?=
 =?us-ascii?Q?8AVOm7B8qTrY9U/P2oRbE0B4UmpySiY0QkYr7+4L8fjnDY2E4dpY2woWTvF7?=
 =?us-ascii?Q?nl1AVKyhVMRBtydUzmS7Vsfu9ZMTALo8LytYWoAIKI+WAWl0wTTk435XUFrM?=
 =?us-ascii?Q?AkJLzryhszvELWs3I9asCtho?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6af9752-768e-48a0-e8fb-08d8ce47034f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 04:39:27.1300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8DH+w+pJ+Hl+5t3DFO3SHQNckIF4nbjQgysucdaz1CmNtBryzFkPPiu7aEjEQ4YfqKCGMvyXT4BxgiYqD/W7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6351
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To complement panel-simple.yaml, create panel-simple-lvds-dual-ports.yaml.
panel-simple-lvds-dual-ports.yaml is for all simple LVDS panels that
have dual LVDS ports and require only a single power-supply.
The first port receives odd pixels, and the second port receives even pixels.
Optionally, a backlight and an enable GPIO can be specified as properties.

Panels with swapped pixel order, if any, need dedicated bindings.

Migrate 'auo,g133han01', 'auo,g185han01', 'auo,g190ean01',
'koe,tx26d202vm0bwa' and 'nlt,nl192108ac18-02d' over to the new file.

The objectives with one file for all the simple LVDS panels with dual ports are:
- Make it simpler to add bindings for this kind of LVDS panels
- Keep the number of bindings file lower
- Keep the binding documentation for this kind of LVDS panels more consistent
- Make it possible for drivers to get pixel order via
  drm_of_lvds_get_dual_link_pixel_order(), as the 'ports' property is required

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6->v7:
* Reference '#/$defs/port-base' instead of '#/properties/port'. (Rob)

v5->v6:
* Use OF graph schema.
* Drop Rob's R-b tag, as review is needed.

v4->v5:
* Require the 'ports' property and update commit message accordingly. (Rob)
* Add Rob's R-b tag.

v3->v4:
* Add type and descriptions for dual-lvds-{odd,even}-pixels properties.
  Also, update descriptions for port@0 and port@1 properties accordingly. (Rob)

v2->v3:
* Do not allow 'port' property. (Rob)
* Define port number. (Rob)
* Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels' properties. (Rob)

v1->v2:
* Correct pixel order in example LVDS panel node.

 .../panel/panel-simple-lvds-dual-ports.yaml        | 118 +++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       |  10 --
 2 files changed, 118 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
new file mode 100644
index 00000000..a5a596f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple LVDS panels with one power supply and dual LVDS ports
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  This binding file is a collection of the LVDS panels that
+  has dual LVDS ports and requires only a single power-supply.
+  The first port receives odd pixels, and the second port receives even pixels.
+  There are optionally a backlight and an enable GPIO.
+  The panel may use an OF graph binding for the association to the display,
+  or it may be a direct child node of the display.
+
+  If the panel is more advanced a dedicated binding file is required.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+    # compatible must be listed in alphabetical order, ordered by compatible.
+    # The description in the comment is mandatory for each compatible.
+
+        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
+      - auo,g133han01
+        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
+      - auo,g185han01
+        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
+      - auo,g190ean01
+        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
+      - koe,tx26d202vm0bwa
+        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
+      - nlt,nl192108ac18-02d
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The first sink port.
+
+        properties:
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: The first sink port for odd pixels.
+
+        required:
+          - dual-lvds-odd-pixels
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The second sink port.
+
+        properties:
+          dual-lvds-even-pixels:
+            type: boolean
+            description: The second sink port for even pixels.
+
+        required:
+          - dual-lvds-even-pixels
+
+    required:
+      - port@0
+      - port@1
+
+  backlight: true
+  enable-gpios: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - ports
+  - power-supply
+
+examples:
+  - |
+    panel: panel-lvds {
+      compatible = "koe,tx26d202vm0bwa";
+      power-supply = <&vdd_lcd_reg>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          dual-lvds-odd-pixels;
+          reg = <0>;
+
+          panel_lvds0_in: endpoint {
+            remote-endpoint = <&lvds0_out>;
+          };
+        };
+
+        port@1 {
+          dual-lvds-even-pixels;
+          reg = <1>;
+
+          panel_lvds1_in: endpoint {
+            remote-endpoint = <&lvds1_out>;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 35b42ee..e7718d2 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -57,14 +57,8 @@ properties:
       - auo,g104sn02
         # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
       - auo,g121ean01
-        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
-      - auo,g133han01
         # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
       - auo,g156xtn01
-        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
-      - auo,g185han01
-        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
-      - auo,g190ean01
         # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
       - auo,p320hvn03
         # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
@@ -171,8 +165,6 @@ properties:
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
       - koe,tx14d24vm1bpa
-        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
-      - koe,tx26d202vm0bwa
         # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
       - koe,tx31d200vm0baa
         # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
@@ -209,8 +201,6 @@ properties:
       - neweast,wjfh116008a
         # Newhaven Display International 480 x 272 TFT LCD panel
       - newhaven,nhd-4.3-480272ef-atxl
-        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
-      - nlt,nl192108ac18-02d
         # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
       - nvd,9128
         # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
