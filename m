Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D6234C39A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 08:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126D08825B;
	Mon, 29 Mar 2021 06:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DC36E255
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 06:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlaGQEy+EUByuBwtrXQgeV9OiGWFSaKbEBYq8V+fB5j9kEnlrrtw6SJl17G1BX5a+TIDEcKpre6OW/X2ympmX/0j4kq/wBvD7LEGjYVrPjCy9m0j3jFdNtcFhSGNkRA4vA9KNvCgiOdNyIAw592BGRoaaXuQVA63fdxr7Q60dsIBXm6y8pnK1ky03UoamikK0SsXRyHaJWYjhfguBfc+zIkyicFXtgOz3e+/kcXVUxHCYutjMv6o4SPcsN0Rhc5F2jEONAELs5LNa/JxYlulcNnYoxaI8JtsAYX1DR0y3tsEbXiAy49tKRxgkIt8vUMsbcRWoO2dkHB+dobnV5SFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVX0lIYsLDChNIQBo0fuaduG0WMwEGhI6WrcS5Txktk=;
 b=k7DTWnStYvuFqbDuuWzBh9vFCp+wQoiYNwXrsThps6HHBaGqgio6HOM5SKVpP75E92qF3M44hNba22VDinkbu2iyT5cbteBVa3sZdAlLbvRABOullQUZVqTWw1HpEugikbDG69xrKMSPaDacvFAUnHDCbgKCX2CvtcRTd/nVKlDD1Jak2zJbFBP6jM18HVMdLB/CRAqQiXuP5dp/BmxChHI3xwwXdYi+xo4Ck+4RyJo3ziLj0YqsxXCSeb6PPXHW4UdjmEEHSG5pNWomNahRDNBb3NKnHG2VjcmeF8lI4W6AT5Dqt5k06TG1vIkvlZ6j3eaFPUdagEkcm5+HfyoLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVX0lIYsLDChNIQBo0fuaduG0WMwEGhI6WrcS5Txktk=;
 b=MyXSoNh0pA8LmIO+Dvsc8UpyvmdcDpfzAPqZBDilyq+1+wvQ9ltOp9Bcaq+oi6mRVj498SvIK7tCdiJ0+yPipiUbLCcEH0FX8ERMHVl63o0HiuHqkVkVhIeGm2K/78EUbAyOhZWQb/aex9YGy091iXxnoJp3HAHn8qT1RpmAuCo=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2320.eurprd04.prod.outlook.com (2603:10a6:800:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 06:12:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 06:12:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Mon, 29 Mar 2021 13:57:22 +0800
Message-Id: <1616997446-8783-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
References: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 06:12:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a53ff18-3509-4e5e-838b-08d8f27999d6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2320:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2320D962411649A81A0D05DC987E9@VI1PR0401MB2320.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zdHb75UDVMD4WSAyxyQvGVoZ6zlH+Is7L9JxH9YWxbu2RccEBC2hdH++WgfzhmeCUq95ueKP4MfVtWlX6ALNTMCkRUvSX2MddO1rJ+ptgI15sosKXWTczCYskgKU+lb12LFuXcaYLFQ7Rq8vK1n3IxrdtonPJsS/RvqMtxYohWnhvtPfOBVT/gEd9a5hr/ZGlxoNJ1Yn9wNkrVBW9xiR5kqRFXcgTH2X0tjc9y5NNjOs0NlXqe08ZXkfmFMabnAIotZMbQCePs1WdOFfaje3mTYRrpV9SlmtmKLSDt1hvVIXEOh8QY9n+1WijnBsYnndTzhRQhUy92rmHyQulZDPVMPiF1Jvzp8xwmvMKj6r8gFrCCdl2ZjYBmViqzWmVd9GIQ6lSDcVwAQ1R8/Nj0ec7nBefLx0sXktlSOK3WG+40McLW+LFLM+2+i/kJh8wyqElB7enEzOJugO1ZolwfM8QRqXJxedUBGO10HpEnhK8IUFhUcF+7pvLcKSMbAaIpoZgu9JxXlsZaJNyjJ78XS3tiHzF2rHZr6Va2fUyLhPnWWbKeKUomtdQFMFH89y02lCRO96QyhIi26D5w0MDykQjwX4uVxEkDaAV4eW6dUdWeKv8leMiIJ/kMRlLVu3MoL1Pm7euthfDVtcsFj8qVAsPyGYe5QptDsyAUAw128DLyCZKYEqFs28YPyi1ROIPGDSoy2/esRv7H9S9ICYm9ZVlF43vcG1hySaKNOSODd6jKekXCCFu8u89HG/7c5ybWdZYtQqKWcj0zeWWJ9vatLo4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(186003)(16526019)(6506007)(7416002)(83380400001)(36756003)(2906002)(956004)(52116002)(26005)(69590400012)(86362001)(478600001)(38100700001)(316002)(8936002)(6666004)(4326008)(6486002)(66946007)(66556008)(66476007)(6512007)(5660300002)(966005)(8676002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BhAdP/rqVRk56MyrGcAFsQTVgIdMeYe4mm0+S+Q2WlTrkww2GNb8IzqzY+uC?=
 =?us-ascii?Q?EEUJ9rMZLjeMaSeZ4ku+GWUb6xBLvb/38VEVtSzt5ttv9Eamlc6H1PD/PxHi?=
 =?us-ascii?Q?ZTCI/PU7uZe7tSJ1dpTQAr4GrFlnIYAtr8Aom0v7KtCERJPz/hoaKOHzW+MP?=
 =?us-ascii?Q?5wyg3JdlZbxGsrgd0aptuL82moz98oPqAHn0RB5hywpAiel4b8lNkNS6wL2j?=
 =?us-ascii?Q?oWSUZULK6B2pv/f4wh+GItL9u5RDzmUz1e3Mg4FvnY67eunivO+PGjZwhOBV?=
 =?us-ascii?Q?nq52iHwGLlQY6thI+2Fr0G/Habms+WpsGaD19bLmjI1LrKb/QK80vA34QbqR?=
 =?us-ascii?Q?QYZh2xkCHdI9oFg5Tmp2JAUdehQYL3ktgo7y/6u1+frnoybLY0Zx9FKwj8iq?=
 =?us-ascii?Q?DqccU2DObIlqXK/D5+oK4l54qI4aQH3VgoRsGuPqtH0AMmdx8puhdLZohlN2?=
 =?us-ascii?Q?EiP5Mx7HOd1hr0OYgHBiDIOIvbuZ4qSMTO1Db8A+hXgYJsaW9QJpm3xQWhyk?=
 =?us-ascii?Q?AIwnD0s0ZSTEjN6dLjdcVO+gmIrMpR546e3g1eBkLPXQEOHoi2wwk0wX4KvX?=
 =?us-ascii?Q?mjts75xh+Cazzj24fyNcO60l90FWttvR7hvNJfm7LVe3t1RvwlOlPiF+vFwD?=
 =?us-ascii?Q?Tj2Y/0AGc+5ftUoLyJGMAxQtkCbgyK/eIBhsgWloiZg7lHE+L3J4GZfzwCIP?=
 =?us-ascii?Q?VxBEWXuSF/NbBkj6hQzxHpXPHODII0QF9rovlGXQSCH65TzEMB6SfjFSTsLD?=
 =?us-ascii?Q?MZBA6JUKfcGr0wbXIkr2P8YRIXQxMLD+/Zc9kfwiGs50L20d/0Sl/6Eg4H93?=
 =?us-ascii?Q?22julCMzeIpD1s8BxcJRd4kVMM3oCPiloc3Y1MCGRBmr1L7/1JvPl5VTlRk9?=
 =?us-ascii?Q?EYNMdjBAI0Z9CQXm2tKUDuJ5RfgsJeUYe/drlveI28TJWwY/gic1rT5JYbjB?=
 =?us-ascii?Q?/bNzG9IslOxXb5gxMqBUS1AKWNUzF/PWizE/ymyNQuI/OBGN3zp5CY7JY9xz?=
 =?us-ascii?Q?x8bjtsvvY9dVYDt+7Tq56xG+Tr0AfKOFu0p7f/ZW33oClj3OTrdwFnQ6jGsE?=
 =?us-ascii?Q?Q5xwQhvSI88q3gCjbAR/+xErPAadUntdjMjCe09cDVJ5EQe3Lg6hxeJSLCTV?=
 =?us-ascii?Q?z1WFQBVJJO/VdiPi1XgNyjuHA/D37byLya8KdhDGUpq6RSg+XOYnMzrNGZjN?=
 =?us-ascii?Q?hMXb9KONRN5nX0PhnlS7HypRLnpMVkoWbct8LjnUkDchUP3YordxlNKyxmTs?=
 =?us-ascii?Q?9nJ1vX8LU/NXKTTWS8KuV2yS2rZ97gY55R/kzXPmNPvPrVadm5ylCT0yGvGt?=
 =?us-ascii?Q?FFpCbIZzCm/7UaInvV1v22EL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a53ff18-3509-4e5e-838b-08d8f27999d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 06:12:16.0191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gzt3+D59YAJGJR0DhjOe5sMMu06XOCQ9tcddjZy1L/zkJittQFgHKm9AKjZYUYoXBkFBhzUTdsw85yhW2Kr1aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2320
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
 kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* No change.

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

 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 00000000..3ff46e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-prg
+      - fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
