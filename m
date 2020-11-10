Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A006F2AD10B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4BC898F0;
	Tue, 10 Nov 2020 08:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE66E8966B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 06:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DT3R2O4Zy6DeanZSGAshlTf08I/6v/FBrAMZQ8RuqtOlg63P8WnrXMkpTkEw6sTO/G8bFjI5q4Az4R+tBiLgEbSPmhc5SV8iXlvz3xMI1hqgrfoRAJzmbtdD5mval3bcbjyirb+lwcNUuAk2GS27l60BThyp03uF+/xtu2o+2og1v4FVO4YjmODnnsuK3/OYCQZlR5F7MD1F8hKyspxpW+ChP5hi3dEMdAZby0KVzRR+5rrZfboZ6/52OEVijYy3dUZ6CiOeIgZg8NnBe88AeMemMSuFtS+nENBRkmute/KMrNg0earSZazsp2ChJVOc6epg/58FXUVTr6oKDuavUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcieKpgdJ8+VvfJla2JyOpBda/7+JFDo4MIImNWsEfE=;
 b=Emneuc9sE+y9y1aCG7WLFsdN9JpnrRUoTH6HG76NRcDsw+FnlT2/tE7+/GgrXe48f1r63rMJdE55CqMtgLwLCSedUKMLlgYzgn5rKL1tuoa++cYSn7tG5QuvItz0lqS2WTIX8cwXh0vf6TiHzwy4dR01/df/BEG1SY+f3mWB21lHTY8Z2ipnbjeuU4JU2mnicvQuG/s1DRkBvOzYwtxQD4pGRX0rRQZhtjK+KUm8qwUwKBgfrRgJAGx0pLQBF075lxXVMLyAaEVFHHNiE9rvWrhZjWqefinpKhNlF7WqPCf/F6upjg+ljNwZoHUyL61i7MQUjmDct3hUANg8lzuT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcieKpgdJ8+VvfJla2JyOpBda/7+JFDo4MIImNWsEfE=;
 b=s8oueSzXTcM3Mv7+HDUhkEUGSIgMJMiwUF9exlJsqYA+7u5w8lAVRyx+WWhg5Bw7b3pBrMYbHIIJJ2xhIj9P31ZT4nI89WQ432L6E3Ip7Ro1EGDz8kNPeH8pzlBqbR8mM9ixHOoCF74/jsbmNrIurbhe2F/m0miVKu9MPP5gjHs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 10 Nov
 2020 06:57:53 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::e171:19c1:b07f:53db]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::e171:19c1:b07f:53db%7]) with mapi id 15.20.3499.032; Tue, 10 Nov 2020
 06:57:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: panel: one file of all simple LVDS
 panels with dual ports
Date: Tue, 10 Nov 2020 14:51:09 +0800
Message-Id: <1604991069-28687-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0183.apcprd04.prod.outlook.com
 (2603:1096:4:14::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR04CA0183.apcprd04.prod.outlook.com (2603:1096:4:14::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 06:57:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad7c8e75-2352-4b99-927f-08d88545f177
X-MS-TrafficTypeDiagnostic: VI1PR04MB3983:
X-Microsoft-Antispam-PRVS: <VI1PR04MB39839D25D2747BF82D0EA1B598E90@VI1PR04MB3983.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2b5OIs7JaW6NIVCnNws4QzJUqyyt4PbXxas2L9eLUCLY9QTIdlG4KN0K6BDZz/GhsQdnXUmRxyhgTbbTGZi0GnLuarh2cVOK5Gtn5jH65hLU24hszYUjaL2pKRfsqdp21v0rjjH4Aq8qv40Cc+hhG8ETR+AcHsj1x/IJV1Upl3ETYkY3NwE6Z4H4o7Na8ngmhnt2heLPnxTt9sOkRPX8xfW40MSgRN4YodgccGVnF6bqdEhpbl8TVe/32EYUW8KdHeiRgz27+IOwy33dmMkeWR2q0Z5MV5Yt9yhe8Ec3NmpPbPplPhAm4NclF0ot3vQjHVXEiCCdbkFId81aDte1EuHjnOaa7wTvprJ9LjRh/PoqmX6aVZXkE/mu5OxJRT6K7zWNg2AGTB9+qhtpEwCsbPWXi5NC7LhiMLncUilp3z/yYafXeibQfKEabcUFLY1oDClTHMOkjHeeafbZ5YaMPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(66556008)(54906003)(66476007)(6512007)(6486002)(66946007)(69590400008)(5660300002)(956004)(966005)(2616005)(4326008)(6666004)(26005)(316002)(16526019)(186003)(83380400001)(52116002)(8936002)(86362001)(6506007)(36756003)(478600001)(2906002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8LKmJjctkupg8d6pGQGTO3eJUu+Y3GmFyChkrVEGOQ4qpoPUFEmE4rZyT4lvIKQBq9Zxk2dpJ+kl4xVWA1U4GuDkjct3q4pDXZiyLuBqxucbwCNSzDpuljK9ZsfY/tUWBvJxybc9kRkqcUlDLV3eIxSJZ16zrRTINyNjJpbC7Y2Ri1DA5a9FRnzpY4QARFHhkGvWf3bBRyHeBEqEXifHEmEtAv7KxK2xNnNLEkSTQEsDTPhGZd9x9HVG3dPnFfFEXGfoq9cGbKSZ3OOFINYDnsnHMmE6LZtTx2qRccyOPNa/KC6L++11Fqs8K5Zjmx4t2jkq10r3KrMVBRgKY6G0hOnkQ2UfDyB3hgoiASbtapqKXZT9SKVLiOe37r5WICGze6zF8Bw2Kvjr58DNW/Zvdm47m5AJetpeUBPTzSJh1HMYhlH9yIfRw4dfp5kRfQqmStWg/+ayoGolKS4YyafbxGYB80fJ6tkJKs0Cs7DyS6zCME+7OzchJdjaPlZteQZFyBDPUr1+8RXUJj7sIWFSvi+llt5k1LrdgcYoKHgAIPCKcKlkypPhEw40eU8+bBLE8y5c3XZdeaIjYxnQuqkSAaXE7JJYRF03AhgfpSUZQlyy8+BUdB6BNlXYixcgoz/ZIGeQHXj4ZvSROZ8gvGEgqw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7c8e75-2352-4b99-927f-08d88545f177
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 06:57:52.8465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqJx+cqWFUquRs8Y0TOfxhVXnPGAhWDK7JmIpcTijqso4uozvd7z5llfVgPUVOzIUm5VD4RFIS6hH4ce0X6BTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3983
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
has dual LVDS ports and requires only a single power-supply.
One LVDS port receives even pixels, and the other receives odd pixels.
Optionally, a backlight and an enable GPIO can be specified as properties.

Migrate 'auo,g133han01', 'auo,g185han01', 'auo,g190ean01',
'koe,tx26d202vm0bwa' and 'nlt,nl192108ac18-02d' over to the new file.

The objectives with one file for all the simple LVDS panels with dual ports are:
- Make it simpler to add bindings for this kind of LVDS panels
- Keep the number of bindings file lower
- Keep the binding documentation for this kind of LVDS panels more consistent
- Make it possible for drivers to get pixel order via
  drm_of_lvds_get_dual_link_pixel_order(), as the optional 'ports' property is
  allowed

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
 .../panel/panel-simple-lvds-dual-ports.yaml        | 85 ++++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       | 10 ---
 2 files changed, 85 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
new file mode 100644
index 00000000..4608481
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -0,0 +1,85 @@
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
+  One LVDS port receives even pixels, and the other receives odd pixels.
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
+  backlight: true
+  enable-gpios: true
+  port: true
+  ports: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
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
+          dual-lvds-even-pixels;
+          reg = <0>;
+
+          panel_lvds0_in: endpoint {
+            remote-endpoint = <&lvds0_out>;
+          };
+        };
+
+        port@1 {
+          dual-lvds-odd-pixels;
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
