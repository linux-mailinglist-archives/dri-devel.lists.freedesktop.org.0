Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6875731523F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 16:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3243A6EB5B;
	Tue,  9 Feb 2021 15:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4836E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 14:26:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ea90us4sNqPHBNI3Zfr0ZQc04SfHBEORXe8tpVqyt/rFconVkfqB6PAG93OmbNFlCi0jcROobq7NdUltLJcr+tlGYEprJW/2ZHSYR5eaTyKIKmANkPW028F9mbp/jM5CmoNYgSK1iabq/iMmdaNWEfrSD5peQGCl/WZGwxxY14wtellG25cqyRv7FGZZIMAEABjSahKWDrFBLYwKkKQKaKUE4bNBNswoY5dfGzuHJ2BcAI5/08MyTuveuP5E71YldQTY5W/qRmqI5/Dsp2uKEPudHX2QruOxDnHqkIjlB+WXP6R1sUw9wGEmZC1zMWG0EEZIy1gNMpjikFVwLhYOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AElYMgrn5GD/9DDwkHcSIdH+7LKY1i2qB9olbhMHPG4=;
 b=NXl6JvRrsPgg3crhaF8n/7BAcDHCm88uRB8OO6CXKIhiecU8GNEqbDOxZw530BwOWyd/H4FiG2ecUHvkH6CXWWk3r1rJVxhN3hTEqRl3W+VXrYeVGZB4bTW2sNfe6dvZL9Le6XuhG8YWlrQsX4X9rRLgiV0guyRBO/S/PWa7c+qBqit18lMPuBVmI+0ucrZEaTGpe8hcGdSRrw2TCqTn573FtXSFmZg3uhl9oOuzxuE5Q5aBLxGkiWFUF5Xbu53rX7xx9HLA+xNRBWaEJntzMq4tz/1Po8nRBM6Xjxsp1WRO9UEUsTQ1PsutLeq5vof8wM7aZU73+6Wp+Eo+dwx10w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AElYMgrn5GD/9DDwkHcSIdH+7LKY1i2qB9olbhMHPG4=;
 b=ghDpf9kvOalKlQmb0veJ3JGiZdZN+pCDsyOz8aGikM+6rQSQGWjsCZlImcLVK+lg0NTjF9/S2nEZE2VGRtjbVmd+B8qxKJVsThbKl6xdfAtyVzHWGm8TG5kg7ZpY0P9FfoIG/+nPo8Hc/juxjHzcEreroE3MuWA7kTW8gjnat2U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3789.eurprd04.prod.outlook.com (2603:10a6:803:1f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Tue, 9 Feb
 2021 14:26:10 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:26:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6] dt-bindings: display: panel: one file of all simple LVDS
 panels with dual ports
Date: Tue,  9 Feb 2021 22:13:12 +0800
Message-Id: <1612879992-5908-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0114.apcprd03.prod.outlook.com
 (2603:1096:4:91::18) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR03CA0114.apcprd03.prod.outlook.com (2603:1096:4:91::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3846.10 via Frontend Transport; Tue, 9 Feb 2021 14:26:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0ff6d1e-928f-4517-71bb-08d8cd06a511
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3789:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB37893E0E25D44D30A05CA784988E9@VI1PR0402MB3789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YDEISnAn/obpC4ixyIH6CEcqI7kW4iK6xmlXoQ9hKQi+iskVrySX17hCNwcVlTPJSoeMfusr/DaeB48kuUsBG4yUHQjbZY4pYx1OE9UZRbPXzpi6tTHkdlBFKIZLtqEmEqQx9vZhMaww9Me/Jh3lTfQxhETxVy54G2QIR/hkkaiRABtnxvd3G7nj8OybHYzZgR+LPO94bo6cwNdGL6LQeXdqbpbtJmF0K3X9erZ3PPjwWGKlppsAUGd8nDTSHi61lS+BQwmmgQFs2gplMvuQYw5iauEEVV8g9rni8EUjFTKprdYFFnuXsA9JE1E1CXVFKltdFEcZyeu69IE6UeLsG7CxHq9KF2/w/U5WUkE6Ob+5JvabfM13AmALlgVkQB4xBwQdl7PTI/dsYtgN8y9R6U6a2ziZ00ACWG/eFenCbwFDZghWJT8eoyTlOk04G0LxeuEWi9+y+SP8HkMQZ3ujLFEXmCz6dNZnxBgI9K7BzfIPvhKdU43Ws2yYiBGzY+Ei+Np1gn0s4UTzDZAqWwRfgJmF1guLtBo+aIxftdHVAZrF/NlYCv1q0EMFVjkd+rjqrU99R4OMLgdzCEJ6UxDh95U6jBgq+Yzs8iCC/9iZx+9bHzEBRcWblUTKavbyY7olFTqqnDaX7q0BCCfzObT+Mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39850400004)(136003)(6486002)(54906003)(6512007)(69590400011)(66946007)(2616005)(2906002)(66476007)(5660300002)(966005)(4326008)(8676002)(36756003)(26005)(66556008)(16526019)(6666004)(8936002)(186003)(83380400001)(6506007)(478600001)(86362001)(316002)(956004)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yt8LK2yECkUV9Jv0NtZ5ciHHfrHfzpVi+yBLX4CLwl7PIKnVsjBwqdXNAqmW?=
 =?us-ascii?Q?pf41W2Xx7OP96bL9rWsSEYwdWSoIb3o2ZEzSvJqa7S2JYO2hBSsyoJCxM0/j?=
 =?us-ascii?Q?WClWGm3Gdf3MI+YtMfzR5ymQs6omIEcu5U/mISeSn05+8/kq1oi6689Avz/2?=
 =?us-ascii?Q?iBK28TehUISZklRGbPOETwf3uRtdWMj0po2q0NEm3PmHfBYwbjBbvSUWQebx?=
 =?us-ascii?Q?ZiUplsPOJGcvVp4g2QBHQMSO/cfkzWFpXKzJxsNgHXCRkpCUJNljAubM0yr2?=
 =?us-ascii?Q?Lnv6VKzP0tDWFqCDA8I11fljVrbJoJJJl5n04fvumZHiE4M9CxtTuY2Mo1F9?=
 =?us-ascii?Q?KGi/qD9OJMClMHHEo8fqrsztslevv4EX9vsJC9sG1vx8bVk06XpO5lBKMHpq?=
 =?us-ascii?Q?yHCvuoT9dw1/EMxLp2OLeumjXKQ94lJ+zzRukceqy06uwk29LlC/5yNL5Mq7?=
 =?us-ascii?Q?x8KVG79GQJWKCHQKSR40aEt8oU+Pyem/mhxoZUJKyBXnwki3CZ9KhNcor60R?=
 =?us-ascii?Q?/up+EKC91oxzoGVIQ5ydPHZNOXOUjcokunBr1Kfh3+Kyp5eg69xR46x+7ZkP?=
 =?us-ascii?Q?5oi8VJ1Pb2dtzRxtJtFTEjlkV3mURcGixz+0hexdDyElZlePNiCPESzs9qQd?=
 =?us-ascii?Q?e5zAspC1es0LzEwifgXU6wSWbXn8EqtpZLrK4tiTqisGpWKn0z370Ecbzmam?=
 =?us-ascii?Q?CPbgAzTfy1qF0EIAIV09+WEoIhWvWPWpTU+fP6gg/JOF0OueFvjFldp3aFj4?=
 =?us-ascii?Q?ypxtAt3WCPN3L8FL1OBeuVIpLnM+cSFmh/5z78VU9v5XEh+fx3Mlra7p/t+j?=
 =?us-ascii?Q?5BZoZjRL9PnqFb7KlQOzfI5M0ul5crOQaxEUJuChBveaOsdip2qLxOkF/2VW?=
 =?us-ascii?Q?qmqyav3Abt59wOV+bhGiAawJDFZn4V7cjRG73NkTG50BsKPqCO+32eRlgUIW?=
 =?us-ascii?Q?wOORXbmZ6QG+zmdTOxIbrP5/dlmwIIKRCJ1EbPiOqralb/Bv1hxlNsofKtC9?=
 =?us-ascii?Q?Nb9lZ8PY6lVHE3G/azZOltWVLDFIV9ipS2Is1T56501tmE/V0Yj29QVP/JC0?=
 =?us-ascii?Q?OpyZcFGySLY/oA+EOnDaPm/rIMO6F1HhkQ5KKauabXpA8bOR8D1mIy5QC9cb?=
 =?us-ascii?Q?YHup32al4bVeUEBO+l+23TzaNlcVDGC9bTUrxJMai9H3xj9+O0CZ4/XphiKa?=
 =?us-ascii?Q?2mBYkLkfz1S720kud1d925EyVeDCKZobS8AFuajTHQ/ABf1QX5Hk4aiGnksO?=
 =?us-ascii?Q?VXMVKWNRChjpIVc3fWeVgFU1jtbkbCdr+GqeTlMzdvqkRtpenhgOWJDa6yXm?=
 =?us-ascii?Q?NJ7p9t/HJ15CTQDhRp1NqkxB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ff6d1e-928f-4517-71bb-08d8cd06a511
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:26:09.9884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7QalfL0SZN908jtzSaQBM+EEpPbFLrlG5zSUQZMYAyRoQqCrbPWCJZtH+iSyy2wP02tdZwSfdHPMZpdj9wkhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3789
X-Mailman-Approved-At: Tue, 09 Feb 2021 15:00:40 +0000
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

 .../panel/panel-simple-lvds-dual-ports.yaml        | 116 +++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       |  10 --
 2 files changed, 116 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
new file mode 100644
index 00000000..274e89b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -0,0 +1,116 @@
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
+        $ref: /schemas/graph.yaml#/properties/port
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
+        $ref: /schemas/graph.yaml#/properties/port
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
