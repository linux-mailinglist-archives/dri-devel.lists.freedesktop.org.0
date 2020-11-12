Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F822B0109
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B9E6E1A2;
	Thu, 12 Nov 2020 08:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00063.outbound.protection.outlook.com [40.107.0.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81496E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 06:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7iU9qtQ8bvrCtovRIbIvfIilCKzulpoVioFtBxH4epf7lLEHIxco5RTAvmeLED+XI5fJrWSmC1fPovuiVbKr2eIkFCS9x5sRZAY9gxKvv57i3y7W1F1m20oarFK/B7sv3qkUOPWfCpVXrEcwicSGG6fW5MNTs/xSAgyt2z/1CLV3obQXOjkrKQycZBrWhVnhcLCDO9DZiks+CM0l68dcRX5kLFrAeUAoKT6tt5+ZycFQIcY8UotC9uUCBlzEEY75QsumxyCtGvaThRkzEdZ+e4si5Md9d3tY+z8/mVpCUOw3MU9wOFwUcZvkxYiLHonfstm8lVQqPNmXdonzp1Pmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mEApSpHB9DhnFoADb42uoVhqHeSUFk3LgclKVYBK2U=;
 b=WazGHLqPdcM/lq3Jk0Eb6dKJDgYTWoVDmzsuq3pUW4rqQRPBYCQIOWiUquGtyRxOyBNEfFOjExPTh5f+vlZfzEX7avc0mdHwdKsDAroC/MmeA3Q1oQXHqsuJPSMzv7qWPVkVEIMVLBuwebJ5bDxSg6b+VUqbRn83ylP/R8NEuDeFallauc9QYzlB5fq8W0s8b4tHWJS9vEo6kUYp97kuiphPQC4E/jWeO4dWO6Wau5zultXMQFHLYbP7WZpKU3QaX88EyUsdVNzKt6tOuCbrvL0jL2HCkaFbnmzLtQ/OlHVynaBpXOjQHXKgtIHvXgYWWVeAJiE3M1jJKLHuGA/iCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mEApSpHB9DhnFoADb42uoVhqHeSUFk3LgclKVYBK2U=;
 b=jeBR/AqmiUM5FjexncQwnsqug8vRg6t/sFW8+TPiKoYNlTmGA/JALhJA7VQ+Ik3J3YCZQkxsdlkiq4w+QHoSvB9VZ3Exg5MaeqXyekO70crATOd+BJbZshmEiQQYZID9hNfsao/QeRQgwHDUf87v+TkhJumWMr4pRXoCbU+r3Hc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 06:23:58 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 06:23:58 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3] dt-bindings: display: panel: one file of all simple LVDS
 panels with dual ports
Date: Thu, 12 Nov 2020 14:17:11 +0800
Message-Id: <1605161831-10740-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0094.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::20) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0094.apcprd01.prod.exchangelabs.com (2603:1096:3:15::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 06:23:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0be06f4f-0348-4700-0b06-08d886d389a6
X-MS-TrafficTypeDiagnostic: VI1PR04MB7117:
X-Microsoft-Antispam-PRVS: <VI1PR04MB7117A214640948C44777E0FF98E70@VI1PR04MB7117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9E3sAKFPAd6d0+gcviNUbdqfuNCJ4+5P/oHY+bWW4EwaJo5unYGHWwDzwghZ3uVjdTYxPJ466eV9Yg+W8b+ssTDmz8jUEhtV/duZqiWqTjBQ+LLtl7zLEWKI02GGepZa//t7Dv9QjgxuYMbPmHaPFEbYjxXzZv5RFqtlXkvF9F9KpBJIOA6CdCDtK798NKmfvIb3nmWz/pnvuJ7L5aS7ic1OlS58IVodlNcvTd8oPRu4CYIz888I+sL7irUdWBUs7hU21+gWRHupB4sI1bnGMyGbgmJNDbubMKaa/fMi/KdIXEVHG16F57A8l9vxhsV2xZYV4kmFAYCVOBBG8K5EIsWPH0qyFgrSFrEU8VenVfwmoFfkFEcCc6Y3FHYpzVILzR5krsUksAZ1NzT8pdLEP/9Zzxmejil3/Y85nhiYRtVMBos/GdM4LOul0yupWHdvnvi7eLACBeos7xxr4YaJoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(6486002)(36756003)(86362001)(316002)(54906003)(69590400008)(66556008)(66476007)(6512007)(5660300002)(66946007)(4326008)(478600001)(6666004)(2906002)(966005)(52116002)(2616005)(83380400001)(6506007)(8936002)(8676002)(956004)(26005)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +NgE4sv/h4jKBhAcKAzl5oIDZwT+kJN9Vy3UbpjtxP1azzs11DJKzVIR49dYYOkML25rOFiBItWX7+21fZjws6nD6a6jCVjIeEQDiU5cRVHmiQB8feWaYafpTXuRC/52Vegmwh5nltFE+US9fVJQiBeWFH/arxfPcr2ez5lErukEbsbatiDZzvxmYBvMoJLC8KjhQi0i9QhhcHd4QX2hIgnrbjTJ8eCn3mRLNiMO1xXpe5UpwwmIdtzwFrxfs7Fw60E2IsM1g+aVZkCrBurhRrlvOA6zsNOC5SF14zDYPTyhhlYrrHyG6wq4PsgW+cKY8xmP5gPkXTz3jYIYDCtFjpRy+o1QbJjr+G6Mbq9jkvoJy5N5U68mRc0yJgq6JCugAI2YIfGElmHyxl9UixfINuZ1xdfQKApsEA7A7hjif2yaPsyaUI0nHUkn0ad0zhUvzg5P/sTK7Lz1Juy8/zAegqS/cRQ/8COHrfHMbpbafLEdqhTPfmePlRvvE6klq4QmnT9oX21E8beCAMm5ZFlQB8wqWSw6PpZIJ2XBKk9XvkdlcJaAlRQ2nw9qADJ1XZpZsF1+zhXku43mCbGPRU+hM+/CqESx9p/PLo+J+Hx/4rLi+mw8/U42ekipBPSiq2lSCDbSwOFILCgj2EuG7OZO3w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be06f4f-0348-4700-0b06-08d886d389a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 06:23:58.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urZwvKna23bkj4/GJmE/dsawwREZIvtE7h6rwuiv1r6u+oJ7qU0asSYuQEYQxfJIn/0mBx4QqwT7NlvjGF+G1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
v2->v3:
* Do not allow 'port' property. (Rob)
* Define port number. (Rob)
* Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels' properties. (Rob)

v1->v2:
* Correct pixel order in example LVDS panel node.

 .../panel/panel-simple-lvds-dual-ports.yaml        | 126 +++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       |  10 --
 2 files changed, 126 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
new file mode 100644
index 00000000..d30ae82
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -0,0 +1,126 @@
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
+        description: The sink for odd pixels.
+        properties:
+          reg:
+            const: 0
+
+          dual-lvds-odd-pixels: true
+
+        required:
+          - reg
+          - dual-lvds-odd-pixels
+
+      port@1:
+        type: object
+        description: The sink for even pixels.
+        properties:
+          reg:
+            const: 1
+
+          dual-lvds-even-pixels: true
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
