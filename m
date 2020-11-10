Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5232AD111
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C9789906;
	Tue, 10 Nov 2020 08:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3499289836
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 07:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9yK6hF8Tb7+kVlyWbic1I3G7xYMMlLOFkh61cEeoVAkiD7L1FwMqWglr0Fg9QtaUPTEMB3SLUs12/H7YiLbP8B4hcHix0LlcGtgurJoLpWYwhI4fdBWR/n4CSH5YZ4wawlaYbP9TiJ9TKejN+u3i5zbEVcXKtBupBVWkCLbtiizEZZ2P0S9REFQE3v3Hat5PrI6arBJ3eCMyz2SbyrAQQacOgybfcbwkMVuReapCZdKMjVzN18xRhnTDVz46sF+uCOBZwO9W6Oa3TlxY9o+D7RZ5tQ7NxQ+PNgLO9rBV3omi0mSS5sgoSUDzX4Lz3JRYpvCpFhzvbgrS17JIUIbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DAs8e4ZlHvspH7EhOC3KyxqeWt05B3REBdNXcwZf0o=;
 b=X59LDhQQdS+MFLXw6XDMHxixdhCpPlhBn5FRR5akNpbElXXzTgyV1kJc6eI0SMk9POZf10lIRHJs779mL8Pcd/GpSgenD5kQlirpxPi+OD3t1sw7l1nbPL/C0nhk9cbWNcBHdDpzmFK8BiLqe4iUQKPVWIgDrrEzSNGa/heh5stS1Kp7KNLDMDDiRZIbiF3vn6CCNc5eDqwQlSzoGszo6HaMnmOzQG/okQgCxBBvZ4QXjCtbiF6cC5kKdJF/9S/sF7em0uIGH2D8OUViOrhf2Lw0nz2NVyHI5kBYRpqBelDWValDHzSrCXNntTywgy6+LSLscbXjaGAiqF4Gtpso2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DAs8e4ZlHvspH7EhOC3KyxqeWt05B3REBdNXcwZf0o=;
 b=bDxrbOCB8mPSso58M7FEXWegE4E5wVW8CluYE8N11UZXEuJbyGPPC4IOJtJkTjIZQoCFl4u60+/hc4jhw5Hptshu2BpMQQclq8d6ms/f95hLHxiHUB3v8pRJYnYyHtfmFD3bA3OIMM1AUEuZXhVAm4e0Bvn5LObYCXdXaWvTxCg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6559.eurprd04.prod.outlook.com (2603:10a6:803:126::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 07:43:15 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::e171:19c1:b07f:53db]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::e171:19c1:b07f:53db%7]) with mapi id 15.20.3499.032; Tue, 10 Nov 2020
 07:43:15 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: display: panel: one file of all simple LVDS
 panels with dual ports
Date: Tue, 10 Nov 2020 15:36:37 +0800
Message-Id: <1604993797-14240-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0207.apcprd06.prod.outlook.com
 (2603:1096:4:68::15) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0207.apcprd06.prod.outlook.com (2603:1096:4:68::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 07:43:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d23d5364-6305-403c-0bd2-08d8854c485a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6559:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6559B3AADEA63831DF9D557098E90@VE1PR04MB6559.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3t7Uee1dG9MOLO4i2hMAzEjWTezUU7bXfZtFI3YdE059ICEW/2CTzcmpoz89Nk+cUVbG3TNj/c3LM7GOrP85esJCsTDB2/L/OllEYy4wKGVs1ubRSfU7faTI66+xZpaTrG1PAgNDzrlX1b2Yb4Qmu55AjN5zKXNHUUL9RqwlYMFG7VefOPki00J234putOfdzRCbaRrmNLDZ6pJXX4fv3SEnCAQoZZuLuLmbExbmUAc9Mt9xLKQ6iu0/PqBcOKUpBiqrYXZXCm/Qq/ixBi4RgAUKJCQSPAvRTAtV8hOYwelMUfh3MUP833hL9q7wwVKrK48SuYleiwgcHSF3tHxXbCS+wRd95OWFo2WItD4mhPy/BUyqLoNt0cWX7qq12CMGqipkAJr0PdImgLOqvpcljrJZNkc88X1ALT6T5Caeh45ssdLwkOTLbuOfus/9u8mJ4ZO/4cKQAo26jKmVeM73mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(83380400001)(69590400008)(66476007)(66946007)(66556008)(6666004)(6512007)(2616005)(6506007)(4326008)(956004)(5660300002)(8676002)(2906002)(36756003)(8936002)(54906003)(478600001)(316002)(6486002)(966005)(86362001)(26005)(186003)(16526019)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: isfUjUrBnR/iZkwRycHz3sCUMEXc9QxMAavgxsH//fe5WrsucI3U8xCxZI7xW8fNootsyBVRHZK0A3lGE6EH0JXU2b9cxgffXfH3XxXtUYo4OCqyrw717DFkafatntB13mYEkFdg5dzgdfWOcJBQjKeubax3xVy/qo4rcFoR8xvXP2n9NsK2EWBrKaNPRfbsNtKdqB7JoBIQ/w3s3VAePLVEDQqN1GxLwzx1T1OjHuUUdMCBNxPjZzIokqKHD4QHVNV25RxgJisWEJ00/22S7go9EXV/cogbEpeANgf9doyfd77rdE9kcbEEihA+x/SrQ8a0JotIl4MLAW+jsVzTxVoN243XTsS4P4dW2CIIsT0N63XwT64mcjSYgU5GZzpzIE4nokWx8o7SEgAPRKR2OE2h107onLygX+YZZKF8y64lbP+IIe6OHKdoFOshq7J+1jDN5JOw3zqNjFH+gC1Gn/3OnZp40BihdnRmok4Ndfn2F8ulcykvDJtg5dFRXInaVeHHBD2/Mfk7KR9HrM2MVXNf2mUV64JkXTWokAxfg5MP3H5Chg0Q6ZK7mhO5Qt4b5HF9Wy2vMSLYpEPL6xzsIzIgbXqcKHWEAZGLq/It2wU7Sy7LU491zXFMOpm1f2J49FSakAvLnUvCdh9pRYLVAA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23d5364-6305-403c-0bd2-08d8854c485a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 07:43:15.4092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MWmBfMKiDpZCAimM6ta/rU6s9KPRc6jDbPBjFGlGk2n2+/Saj74lApBMpNK7XREflbzQEV/RsUF9ntNO2FB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6559
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
v1->v2:
* Correct pixel order in example LVDS panel node.

 .../panel/panel-simple-lvds-dual-ports.yaml        | 85 ++++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       | 10 ---
 2 files changed, 85 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
new file mode 100644
index 00000000..58774ed
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
