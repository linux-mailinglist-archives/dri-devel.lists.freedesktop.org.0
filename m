Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66459BAF6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 10:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5A49AC25;
	Mon, 22 Aug 2022 08:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50072.outbound.protection.outlook.com [40.107.5.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA56C9ABD0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 08:07:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXjL99Kc4tVNY4y0NQ4EMznDcZgvIcowfCcUD2fHRmAPKD4/1v+FL0qrbRQHmG10xpSiqVIWtH7H4eLKy1QuvuYY5r+SGfikURe1I5KlVPgFWflxOZJYUBX3T5EHVNu6tjLQHI8N2T5duKAgFlSB23llBIVIA2CME/hgxDvxRka9eVFZ73b6c8fQ1zfcDrOuLWK583qTvY9+t1qxUsA0H8kNgJh1s1I0CpWOVOwQP6X6qiCKuenboipSjKp3IOoxguWPVTinP3DRKu41mkaWczmi/fa4c4GsbVDNy4X/MGhCIUUAGjgzexNxMIh4zkn26M3xVwwVHfr5lrUjzQRPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nScs3YwDVopwq7kBxi3tgy79I2Xma7LB5Rj5bDH2vxg=;
 b=kv9Vt+K7kWhn1PnfNW44QFlHrZFtXkvlzouwPUVW9ZRU/YlebVfc3JZr8tayuU7cXkhD7r+ryiupBmcKCIqAdf1osUVCV3uGFEP8p0H9Rii9KbPewiswQm0+twt2wi7nlCMtXiKBai2auy6MUSmfSI3VGu8UN3LgPdjZkDNV3RGeIt6/KUprNooMTmGdnWyY9fTO5+81cvAFhNM+wLDJHD1rIJkRtSm7e7PoEWhzDjqWX/ieT+pprDPknx/OLt6UZUIaC/lJtSM8v5xzT+kUTwV6IkT+DEP/JK5d2io1Ox6uVB4PU3X6HMCPTYPBoA4gI/LuaLPys6HbPAiHhPrPFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nScs3YwDVopwq7kBxi3tgy79I2Xma7LB5Rj5bDH2vxg=;
 b=eCFa6rM44X/B8oWSXGxWSD0Jmg59P0ahycqKhUzuThU7bCtsA6VDFXL/3FW9vxlPBCXnUbcpjg4BUmeiFm5qNsKGvtUEFclcLjzkbQyOPeGUtP/bXs62OglnoNX+70mSBF6a6UJRAMF/DDTKWsQV6qS4n9+23Wn7mb/+CIaQVEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB4865.eurprd04.prod.outlook.com (2603:10a6:208:c4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 08:07:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b%6]) with mapi id 15.20.5504.027; Mon, 22 Aug 2022
 08:07:03 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Date: Mon, 22 Aug 2022 16:07:53 +0800
Message-Id: <20220822080756.37400-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822080756.37400-1-victor.liu@nxp.com>
References: <20220822080756.37400-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 767f3215-f286-4c92-180a-08da84154c1e
X-MS-TrafficTypeDiagnostic: AM0PR04MB4865:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jPsQam0tXud1BZXJxd1NtzsP3h1wXFAarg+LS5REuDzXXtVUzlbQS4wz/L72ueu//HIdLCwoKZ+vpZD0f4HV5plHB2A3o3dFoTkZMoNqTNoxmLrRNP3cZlBIGxlXT+Y65FbYslp+fEQdhEsvj6QGe+goQCJlecmQTawQvOm8m/jBBFHM6cEnHQQMKyYzP8wW9OAyUf8BCIFZPGr6VJf6VTyi0vWeY+g+OS8S6Tfx82SOkP/4j682GTZ0bckMFCis1l7N2egtL/3DEWM8XZrXnNk93W99NbV85OVpkA7eoVnQQI6vgiCLqRXoeRtiWPlbalAKQzWj7MqtwgDyd9qnaugs8pE2t4wSRFm9nvxP7tWBZHqqiwGKJW/Y2ZxM5LMazjXcUU6BFr9hINJuMQdQkRRQhkqla/L2o8+ypKPW7p5Tk7cboi6CoxOfHgLHkZfgwju1kO6EiGLX/23s9SXzgyruI9p8EBKl1xgV1at0RkAXQXbHPC68HtqAw8+4eDHxD/dFIwI8qWlunvliqDcwjbwxzNdra5Dt1oN5aYct65UNhLnzTOPiE66UtAcgazRuJ4WNLSn+5j4XHpzYhb6JfUR6kabCEATSYEHOwKXZlB/ksse/ZOOhS93jggOtAQDG2olnOGXwg1WNler0uWvGkIZ5XoBuR6y3Im742pdJ+/S9SV0cayKcWjwRjjX0U0urkJ8a20ie0A6RBGqliJiSazBAO0Elz15B73WCg07xXJS7nBFWOwRvXdBmyB2QQ2k92GacFDl6T7d0OwtH9/F9hfV/aOvCEwEbBguJ+COvTYYhSztRSvr8UiMlcTcTn8Jzn+R1eX4KSmluiOc4vQZdXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(6512007)(6506007)(316002)(6666004)(26005)(52116002)(6486002)(966005)(86362001)(41300700001)(478600001)(38350700002)(38100700002)(2616005)(186003)(1076003)(7416002)(83380400001)(66946007)(66556008)(66476007)(8936002)(2906002)(36756003)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QplUexHayuMoJZh1EJJYlsBvudiHi1ktyUWBU3V0aOD1DN2BsAOl5UCjvYI4?=
 =?us-ascii?Q?sDLLhAb+RPIyzICIdu/fARzaSGJtvFNW0swtl1ir2apbPRQYTpp6wKLMqQVf?=
 =?us-ascii?Q?5aSJeGLTagQS1NthCgQppetngXbp/W6O8jCBZ0HwJNRRT6/CWlZeykbfXbRw?=
 =?us-ascii?Q?lwR6Mq6mSu/vfdd+oGWTLNZCp+couPrvQL9vojrAB5d0Sq9JEBbNsn628CmZ?=
 =?us-ascii?Q?OXTAwnrSo/CqM8qx6WwlcEZcmH5aqraYOjngJnv1FqublFyb+dZZFzPWjDxO?=
 =?us-ascii?Q?M0yJPCyBzXr8Y3esp7cuQgeEcdfHKP86qztQgxc+f+m+T8kzMRWM964irhUQ?=
 =?us-ascii?Q?oB/MtLZuK7ComJpcDFZx/CMBpP4MvweHQ4iXkwZmF/7W5G1je1391j/YhWp9?=
 =?us-ascii?Q?Ua2Oi/tlxDpO1X5IOYhu+iMdgLogkPFBbtwsmcPFcrjeJ8Lwp0X7zNRKJPZw?=
 =?us-ascii?Q?5UQ9e3nZ9ac9E+eu17Yw+nD1sE1nEQxUKQQRd+s60OJqBs70pRezLJDVqHiT?=
 =?us-ascii?Q?83NYyCgeSrnqd1k1QLy6RptbTgY8Et0kF6EmgNLalTpOqFrM238HdCcQM+XF?=
 =?us-ascii?Q?3kI1ey1R1OHzRBfc8omu5fV9504Yh2x51F9Du8356eXn2phSutOpJ6dK943i?=
 =?us-ascii?Q?9T4Fk0Y2mZhP1eV2YyRwlNoSymddZw6ts8PLII76kY7KHL4Y0ScN/WHBVVk5?=
 =?us-ascii?Q?FzSsHD/yONOxQ9/QAkW3VF1mnkzmUMb7+bRhkydAJIfsXOSpwR3hVg5SkQWC?=
 =?us-ascii?Q?H5ZlSejiZ2GJoylMl8IjlqvfWld9s7sy++GacARp7iHhCN6hTy6iewmbU7m0?=
 =?us-ascii?Q?KDQg641MfLuXnfT4sZ74wKQeoXdj64KGQVzAQDLnkESX/3jKxhdvk+gBhywx?=
 =?us-ascii?Q?EZDu/DUljEKAPy9sQ46Zq5o8ICHv2DnB2D8wiGZKG+wC8R+dRewylqwCtk+g?=
 =?us-ascii?Q?a5A19y5zJtzxMWOnn0nhJZ4l0jxy7ekOVnc8fPVcnz/MjKSdEkO5cd36jPBz?=
 =?us-ascii?Q?0PBC97sowYZxl0Ir8t2C1oa4jI9Poan87Qh7MIqP3djRiAp1sqwMw5C9KOsn?=
 =?us-ascii?Q?q3RCt0509aIiXBXCJH8+H6JfGeNgKzVTh1imXABcA3P+V4VdDHByK3OFqlIp?=
 =?us-ascii?Q?XJq/Fv57v3GtyhruS2EUUHmgLI78dFB6oHtnphX1pGRdZ4kPlMOE31tC4pEY?=
 =?us-ascii?Q?5dAzkzm63MDGFmYRUn7eFARdeBgJ3mk24UOOIhUrnrc+8BvoACYsVd/51TZA?=
 =?us-ascii?Q?n7NQ0g9ME5aBr0c4vFMoFruoOdx4k+L7hq/m1Q+M4ne5s6KOp+NefUQH99/l?=
 =?us-ascii?Q?f0RcoSdL6VR7ch9KnoN5+xcJg8XZ/SX4xr8P27TrbJ1KEz7G1LmOHf82jhH3?=
 =?us-ascii?Q?KFONhvWMcyxPbHWoZYfuezS8G/zaWvlM2gieYmA1Ud65/hoBd1NPaIU6mKW1?=
 =?us-ascii?Q?RpSu+6hrr90/3O2DpaVAe3jg/C5+PIi7ZB3loUHM8cNWItXe9he4BFIR+Ys4?=
 =?us-ascii?Q?/Vllr5Xa0oatg4+3VBFlqv7GifS2dY510VsdaPmFnhUpAxfFnDyycX16PUCj?=
 =?us-ascii?Q?IXFqUu/BUVpMYfbEzs6QimsiqVV2/iVIAeq5zSUO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767f3215-f286-4c92-180a-08da84154c1e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 08:07:03.5535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgJHHBG0hLeqjwPsbUVV+vv5/n3dljVj0Pl5tbr+jlSggd3SrMIYSlTQH44yIOtNqxhg7q8cg4fSSVZhy1m8ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4865
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v10->v11:
* No change.

v9->v10:
* Add Rob's R-b tag.

v8->v9:
* Reference 'interrupts-extended' schema instead of 'interrupts' to require
  an additional interrupt(r_rtram_stall) because the reference manual does
  mention it, though the driver doesn't get/use it for now.
  Reference 'interrupt-names' schema to define the two interrupt names -
  'dpr_wrap' and 'r_rtram_stall'.
* Drop Rob's R-b tag, as review is needed.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../display/imx/fsl,imx8qxp-dprc.yaml         | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 000000000000..bd94254c1288
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.37.1

