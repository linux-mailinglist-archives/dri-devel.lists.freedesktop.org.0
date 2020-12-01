Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA842C9957
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655306E530;
	Tue,  1 Dec 2020 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140085.outbound.protection.outlook.com [40.107.14.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3989F2A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 03:11:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgAUNxccGhfAhppO+DS5yNmua5VE3vi/jVtviGmVaxcaa1Ym1QX+guvmfQ+lEu8bNASMvmz+ex+MdBK6kBoIcqAoQMJiGvpeCA/erafFKM2iRVE2b2Xu0d1UfIhUO4yDcGzlFp1Yv+8F3xXU/r18UGB9OWP3jkkqaajdxXMPAQkuScGb3msI3b+N0kHAA29sJqaVGXZn5TLX7owJWS7aa/gLZo2nTCuePAucN0OsqLQtHwvEQHGQTrHobcKZKRPh4aNeqEb0f7589QV7GwEu6tTF6rHD4oyRGE/cMGe0bRCBoG8Z+pKsykzNm4ey4f9hA9AUvcz8zk/BGkb+IvJ/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/BIBVB3qjNBEOVC5gNZzxLxzHS58Yi3q7H85brPhw8=;
 b=mjXoz7pY6BExY1rwZv8GuGB01Hu+cW1zJzxCKWKbUK60fTf9AB5M3AWi0xUfeSUPmSXWMGj6ZLK5j1r7fsWpMNobFR79/lgKwYK356gdpUUPsxmBLhsMx0hW233xdoBa5/tr9/bEM5n19gKISG0DBEdFpO8la7c8KKdsdsUL5/UYewRc7De/S+jxtjesaBT3/bBXjJo7XMx+Mh9NzfcI3RkAZ2skNTvIFLeSj+cWzgeDiqCPcsAi78Ijp7YVP4pU+D0d84zDgssT3gMSgGA4vsEa6FXJnl51CRPIMaObUSd+nTrBN5H8EcegKBwnJE9ZcTK5fYjA79H+dqJhXGH4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/BIBVB3qjNBEOVC5gNZzxLxzHS58Yi3q7H85brPhw8=;
 b=lJyCixNleHRLD5A2PlJaz0Yo7TThJrPsxIlDDixKgJKqg6Jz+s2g1n3Ofv2Pafb8eiJsH89qWYSUk5gphK4fcD+WCezzQV9uekC21YYbA5a6UtWEQpK4aM0EadSqJr2oRHxXlcLq676aaemZca5yhULQE6ldtJP6BKZYPdGmqGI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7344.eurprd04.prod.outlook.com (2603:10a6:800:1a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 1 Dec
 2020 03:10:59 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 03:10:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5] dt-bindings: display: panel: one file of all simple LVDS
 panels with dual ports
Date: Tue,  1 Dec 2020 11:03:12 +0800
Message-Id: <1606791792-6556-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3611.20 via Frontend Transport; Tue, 1 Dec 2020 03:10:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8022333e-0254-4c4a-0859-08d895a6b9df
X-MS-TrafficTypeDiagnostic: VE1PR04MB7344:
X-Microsoft-Antispam-PRVS: <VE1PR04MB734422D45F80592EC707DA8598F40@VE1PR04MB7344.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ASQtMyEAJfOzTF0qcwipKBaSowzYs3Llr36E1pY+3zfh9LxBqDjgD/47wbJLvsSKqhfJR2UtkPTGmvmC9y4t7h0c71JurbgRr1PS/TnJQluQnaaMc6TfXURFM+2RHAfpnRWXWZ70P5JeZx20UFM0UeFCQGuwipy3b8PvotkCf89YIyaCuM/Km+hfR9Ttnra58RB3cUB9p7Ul90z33cI6KT5jlypHkhY9p7VQT4bZZIw10V2a4C139N7Tz4aER0KOo2TWTeCwED++OZhHiYWakmatbNDnHLGe3yrCSIS7ryOtMXjvazWObsMdgdFLsmYNibbxeQYfcg+wxmFxBv8wvCRZGo1wOUHMfL15Skr1zAQTPKyoPY78t7og8x02DIFAgYquepxV9Ofn4K16UEfzD33Fk5MEHy9E4US4ilfX49vJoIf5WNmwsVx1UyFvoqsHq8rpk2JC/c+hS5rQzlkiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(956004)(2616005)(6666004)(66946007)(5660300002)(66476007)(4326008)(6512007)(36756003)(8676002)(2906002)(66556008)(6486002)(478600001)(16526019)(26005)(54906003)(966005)(316002)(6506007)(8936002)(186003)(52116002)(83380400001)(69590400008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jJ08TS1+oPiKGhataIeGtjzffvV/VALZR7ydeHdbO94ScYH7bhYUnfuzy9m3?=
 =?us-ascii?Q?tDRGoTqfPZP1+yZRn7i/ZlHODXEoyyNT221uca1vDheyFlTH8Hc5tJYaqd2C?=
 =?us-ascii?Q?wJ4fqX231BQeIfUF3Epo8hbPHEeKDPtG1jzIgknKpk6kZVZ6z8l5AWFB1Kcq?=
 =?us-ascii?Q?pTQHvLf8vY8aoDWqvxxfwSM32bmaLqsCoporgdq0L6ySCaog6Wb9YGFs+8C4?=
 =?us-ascii?Q?uveka7ZCCwJ72qN1v/iYJeX/RYsN9njsCjpUZMUdKYRyUvNw0yHBJNInHG6l?=
 =?us-ascii?Q?IYuJV2PogGgRlNM8TkB6XAOqYAKkgmcU2T0kAOLqIhaj1ZgX1EATwVBCI3pD?=
 =?us-ascii?Q?CsZnuf6j3HMH0VMVSbJSTRfPI2hTYK+Pd4YBcOC23llYYXpIKGqZaQpDykCt?=
 =?us-ascii?Q?/GM5VTL80L9N88c12VeopK0NcvrmD56NJrVjtvjp7ZvBhVdgh7pVIHEyzJTS?=
 =?us-ascii?Q?zPP0N3RkQVhto7vOL7HqNnsnHBfx3RRVwLN9qACKqukZeVcjaKLumS0PSEiu?=
 =?us-ascii?Q?bRVv0FgykKVM58pf8VmVg1GvEio3Ds+Ov6fJfWwWsaDXagduA/J63ago0cvx?=
 =?us-ascii?Q?fjv1Z91l2vwmJeGZDlRUpJTn+nNMCCQsFtEzViGJLRzkts2Qn7E6CQqGCRNS?=
 =?us-ascii?Q?OQBCzlbyU4w43pEwbGSfa9PBxwsPSz/jrCujG7SxcnDWWQd3htcfRYdtl581?=
 =?us-ascii?Q?VME6Tg7iTaVGMn5mHc9Y9Oy7NgsU+rI5FGb5S5KL7yF5xUIVf1986PRppvLM?=
 =?us-ascii?Q?/PgDF3Iw10Tx7Z5r8gmwV0YnfpA7k8LTQaAZuDXCh4lMQA6+tgb18H1XdCpZ?=
 =?us-ascii?Q?/fqNkcQPwO+f5gE/8FQfntlEtk4UTp9m+2NL4qpy9DDK+rkab1sYYlub23TQ?=
 =?us-ascii?Q?80Er5NVvjIy7q0kL9CU6R2YifYvQ1NOCBEkFNSZQCTZYwiRK+j12yPjP+cEm?=
 =?us-ascii?Q?QM+cgPt15p6VDnbwVRJo6JxnWsCAWsvQO2ej3EYFVsXbqZFQp2yzZtwZrZL7?=
 =?us-ascii?Q?2C4m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8022333e-0254-4c4a-0859-08d895a6b9df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 03:10:59.1454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upcTEozlBIdsBwYIFbT3J9v97BD6rNmZEfoXMk3opvsbvV8EMOdVG2M2bAg6r8KBmroRfXmiEP2gJyNxPd6LaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7344
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

 .../panel/panel-simple-lvds-dual-ports.yaml        | 131 +++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       |  10 --
 2 files changed, 131 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
new file mode 100644
index 00000000..b43bafd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -0,0 +1,131 @@
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
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description: The first sink port.
+        properties:
+          reg:
+            const: 0
+
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: The first sink port for odd pixels.
+
+        required:
+          - reg
+          - dual-lvds-odd-pixels
+
+      port@1:
+        type: object
+        description: The second sink port.
+        properties:
+          reg:
+            const: 1
+
+          dual-lvds-even-pixels:
+            type: boolean
+            description: The second sink port for even pixels.
+
+        required:
+          - reg
+          - dual-lvds-even-pixels
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+    additionalProperties: false
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
index f9750b0..62618e4 100644
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
@@ -167,8 +161,6 @@ properties:
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
       - koe,tx14d24vm1bpa
-        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
-      - koe,tx26d202vm0bwa
         # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
       - koe,tx31d200vm0baa
         # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
@@ -205,8 +197,6 @@ properties:
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
