Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F04842B5B4C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC016E14C;
	Tue, 17 Nov 2020 08:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00052.outbound.protection.outlook.com [40.107.0.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0922E896F7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 01:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdYmXoR/aBbTMQRIM2W52wShpRE8P7SEKgfHL2B4/67XkX8EYC0laS33hKXZW8Y/z4L562/p6epIpGuVJ/aJlzkJA9beenNEEXBMeq0jDvVXY7mjfG/zstHArVW8jaUXxLlWTwb0n4vMsBXKjyCLA/SoaLnZkNg8FiBgTt34xeHDuLiTMF3CXwhXoLhNz+puurX6qnNtIitFBLGPyRt5yYYbD3Da0p4wHNhrozzcslmFgLmRu9fbCdOOHmU/TybHS9AFnTxmrriL4WeKKbqtQ9DCNjn1kGj74aqOT+ZoLL8RNfeUWv3gEquGUvr8Di8oaFRHN4TjrU3SfxR3oGyLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOIMZzDPza8eDxKewptaxHE6uO+WvEN8HGCZ43mo/Oc=;
 b=cX1CbnqbFT/NAvjMkoUFznwd0E2KbZ+x73kE2gbTX062ZYfmTvayfGiWdVcziOQmd/3RbAsEuIbDMlnM4/5Gm05Qr4EgVZIJ5RnKxVr2Ho8euMJgmFcVF+gmvMrUWqp0JskbgnW0SHTAAnCNzUNy4jnl59SwRHk2N5V5D14lNMCDuDEyHfPU89fZI8o0Z4Q6n0wYSzUxcJSQ0st1RPs/R9KrPFOyTErbGe8FAOMNquXp4cuWaeBOJ72BMkfc36w1tAme1TwF84dmto9C9ijUZ+gUzuJ/q2i6I14RTDV+nMB+/hr/ZzW7W+l6X4Rf+ZwGfivd0Dth2OR5ntziZcnq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOIMZzDPza8eDxKewptaxHE6uO+WvEN8HGCZ43mo/Oc=;
 b=DPmerr1nwug1BWWYmKUB8eSOmlrxE21G315KyVwD0/htxz47ofTV0oIUhAtubxtb0dtLA4kuS0Nj9CfuCgMCdeo8nO42158ZL/rsCs1VltBUSpSopJcWVPx3rdVMYaRm4eBHJE7ISzMPbPgtLtxyBBvD2oRDpHHDuw5r1bMrW0I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 01:54:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 01:54:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4] dt-bindings: display: panel: one file of all simple LVDS
 panels with dual ports
Date: Tue, 17 Nov 2020 09:47:25 +0800
Message-Id: <1605577645-32173-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3564.25 via Frontend Transport; Tue, 17 Nov 2020 01:54:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ab58432-6304-4ab3-ea66-08d88a9bb090
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2816:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB28167EDC43ABEB35DD3FDC5998E20@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxzJUAaOXx5n9ZPfo7rVKkWzGRAUQcUuejxpLSSKwhj9OkHjGqy/JY6s9iBDLt5iDsLAszj+BnLZkBToKaO+iHyfqYBXNuPooof/XMDhPeapohRL9/wudg8MjIxl9VWkCbZBUNBuHgfr09R2+V0NjYQ39grfJBGIq1CHkOg0Rwg+vV/AeCZt1C5iRJBI4a7Mkbd2PvToncTTO6kk+mg+n0inUWh2+IoLjlIXbdOE3Mc0cnXbpqBieV25F2mxA0wt1fc4OJXTf9Ev3Ri+t9Y4dO/kAFA6BiafRZINKvt2FjhzhJqs6yoBrYivbnCcYT9H9VqVkz5sJ0WekNXAj2KpWj2H7xa4o4L7BKsdJPv5bEFYmPpAuUfkccbcDgH/N2MdhwR7ISu8CL5aT86mzv18nk2pMeabSXwCdpd655IL/mDxI1w2jkC9PZOJ0Ku06qPTAEI6mdDRzT5K62Hl05VQDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6666004)(5660300002)(66946007)(69590400008)(86362001)(66556008)(83380400001)(66476007)(966005)(4326008)(2906002)(16526019)(186003)(26005)(316002)(478600001)(6486002)(54906003)(6506007)(956004)(36756003)(6512007)(2616005)(8936002)(8676002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OsO3AP4n3dPfztwwNVEzd/rdfUuZcgAu1pCs67Oh1pTrUpDRSxU4hlsfiudpHiejbx929/BJ0AuKvZRH3pnIFrHKQl32KTr97Z7FAUJh+/nBqUzw74Tshe/1/q/MOTw9A57ajF2XlDnTrUD6gTQLOzG1Y34H5jdUWKCfcMQQ5FaspR1UhHs3zD9D/t0jSGPu2324TcVBXSR+fE5TAYxypADqhH0BtnZVJjeXvm1GGvdQrN6VhFyUZOI/R1Z58LcW4drWSZxBp7XCRR4TyjzqhNb29WTZib/0HjStiQA/de8HGyJHy9S1Orrm3o+/Lv7/AmqJUK6qYb8CtF/kQH0eoQ8dWT3IVUwbU8ExAkMCeV0iQaCR1E2F22dSj0M1nNPx7L9Rxbn7jr6LJywIHAu1pu5lDz2UbN8CNgCqQ3m/MIpqPA/JWT4ePvaXSBnpSdKUJUDfd9UJZyWDFHsr0XMpevkDuqk5DLvmcJ31PY9UUVPsc7b4SnrjVCjf1ghc4ahyjvZOtc0OGoEQInSSgXODk/RuAmUcSlZs7PyJBTPkQliE4edsNtZkrC96CbHBwBuyUs+aEZIgkzr91JlzNUsXDa7DoI3U3uHSoVzpuRCdW5/FgfYNoqPFAbEZvI/3RHA9eXM94uwSdty+q5k9u4zuRw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab58432-6304-4ab3-ea66-08d88a9bb090
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 01:54:16.3204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVFoLejJE/6N1vMQGPJRcl4NKEwzexs625yREcSf6JdU5H/TxsO+oC2ULfqM9Q2lHnHJ+se8qj7H7kfkMb885Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
v3->v4:
* Add type and descriptions for dual-lvds-{odd,even}-pixels properties.
  Also, update descriptions for port@0 and port@1 properties accordingly. (Rob)

v2->v3:
* Do not allow 'port' property. (Rob)
* Define port number. (Rob)
* Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels' properties. (Rob)

v1->v2:
* Correct pixel order in example LVDS panel node.

 .../panel/panel-simple-lvds-dual-ports.yaml        | 130 +++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       |  10 --
 2 files changed, 130 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
new file mode 100644
index 00000000..38a789b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -0,0 +1,130 @@
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
