Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0EE2DDFE6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4949489FF7;
	Fri, 18 Dec 2020 08:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6FB894E3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU4SHK2WEJ2FwYxk+Tof+e8g/P853R55iS33KKoa090glJbMDLFzfLRdpx+Z77i/illhjTm96qcpF/6UrEQDzwXGGyjQu3hq5ZHJZmAO8WyZt79VY6YdVL64QfQ0JKLtBhgVOMm5CPK8eYmPaloZFqT4gYOfzVKN6j5XxGa/9XGXYLbJqHyIzSciSiZbaJ4zro+LunrupGJjjhsDzLfWw7SF+ROg96a3gYschjWTf00iWPjZPbGyDKi0YruD9DQ4ovo//fNdX5mFeO/kR9XEr6YdFHRsJdpAuuJnLghWEtpIVkK9/8xbw+b0EZtDTe2OMlV6V7NwTiaFx0WYK8tPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdzNYvia50mRF1gLsp69qvTOcFU0l4c1UdeuGbWgCQE=;
 b=my76eP3taDJZibjc8PWXJSfjOfUa+A9RkKiK6MB0UFVLvBGKCShflb72cxMDmuLgMdyR/IIXkYFSdbd9Jtv1WjGLQrYODo5TqY/vWENv7yPiHWR/v5swFMc/upXyN8awcR/YP1P2Is+nBrwkv0uuZPqjsgcPTSPMdB8ICeLOo5Vrh6g5HCIIiPD5BvfglqtfzHK2XBYDekLuK5juVpeGE6F5XmpPprxNKSxj8oDhfLVm9R4ZRcV0uRLXVnMWIenZOPq2UWMsrrmhse1Dx2SBagCW+qfnssj+s9v6xlnNxsa+LA1dIGXp4zUQSCu0x7tDrETW11hOPnkUOKgxrM5Zrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdzNYvia50mRF1gLsp69qvTOcFU0l4c1UdeuGbWgCQE=;
 b=sKsX3vpq51+td1RGuMfVEb8mr4LFax6mJ47sjsAGA43jwffZkmUVnxFnMedd8n5IHH7zWe75vPA9IBFJba30fthAO0wRKKYNubjMcbCrPOvnG+eKwPgRZp4gI3nXITtp16w8ulSmctP0w7YLLQWvrj79boR/MdOqdG40FZw/ajo=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 03:32:54 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Fri, 18 Dec 2020
 03:32:54 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Fri, 18 Dec 2020 11:23:49 +0800
Message-Id: <1608261833-24772-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
References: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0118.apcprd02.prod.outlook.com (2603:1096:4:92::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 03:32:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d74b631d-098d-4aad-3125-08d8a3059aff
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2816:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2816956FE73A820080EB219698C30@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFsSjqiGEk/EYBHZykwHVT9ppU4JvUIm9RmhnpyjYotic58RyDGFcwIP4K/js5RvZytKAW+sPqD1sejRXZnWJN49HMwT96Rn5uw+3Qfibik29C1IpQ/9PY8UtiEarQhECKPNnP8fDrh4DLjjliLbLsrliA3+S6UV7V9pHk7tmCZTmrYbvfJqE8Tvd/5wtbsbm2BC7rAYBxugvU6eq1CsnVeorWHplnzZ9rmMLhifaOG9Yh4K+zavRmEn8mVeDr/Ka/1EYvliAielWnSGwdPjBtKc2TqqpAVg0GHvajQn8QNcVnasY7WZADRwqNb/l1fuuSsl2BgRZW8i6PYyb67Wh4YM9/86N0b2SS79zuB1GrL6uEygJN1j0iVpGl7Tz8r9jeKB23+RKkgLrDty+Gr2K98lwfF/Jsrup0jK/Xu0joirN7SZJqspOLIhn3ORzJQy3CGnUhS+r8Lb7WSVgueXMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(66476007)(52116002)(478600001)(5660300002)(36756003)(316002)(2906002)(6506007)(4326008)(2616005)(66556008)(6486002)(966005)(6512007)(16526019)(83380400001)(69590400008)(66946007)(7416002)(8936002)(8676002)(86362001)(26005)(956004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?regSSSyo26KB+OKwtb20Xh7bv2x8vGfm8YZaJuGwNJ0hW3sNz3tp4QEeMusg?=
 =?us-ascii?Q?mFmp0B08/rWnr6m7uMXAMuStdZFJtXmqnlxZHdaTMdWrsl8DE9psL6N/AwjU?=
 =?us-ascii?Q?e6rxob1i/EjE9NHTlI5xAQQl2pQ/fnIo92JONpP7MzOs/XuOHq3H48khzXZV?=
 =?us-ascii?Q?ziZUazFhYAbXR3+oYTZRz6ULaflmV/RfgPUABxCQD290qZys/xJLRlnMKCiJ?=
 =?us-ascii?Q?2xVdSqSGZOeQX1VVkxMAfOZdNvrDBmuUjT+fPHAT4PQh7fp6fgHbJaASgvQf?=
 =?us-ascii?Q?4lhFki39RVjRMpEBY6nwzkSX4rciqN+oSmvlyfA5TiI267eGEiv41tT2lj8C?=
 =?us-ascii?Q?4NiK+DkZrLHrB2XeGtRrLOXNMiiq+D0FirIqufOCo2sLzNmIEC+hjFp+m1YF?=
 =?us-ascii?Q?IJZTkAZinN7l0klrsBGqahJZFn1jRA6EbY4cobMnGhNmbACcoet4QNQMaOtu?=
 =?us-ascii?Q?qsLGncGyCkcUTRqcxx/hxADxKKTcXkRY9d6AdE6QzVrNRWEOqL99+1Y+Htu0?=
 =?us-ascii?Q?96YuknDfEkUuz5tgkYbB8cNShj8gKzIX5HehQIH9s6NmUcwuNXj7Ksybnq1L?=
 =?us-ascii?Q?G1/Qee9wez9tAtJxiG5Q0Er8PXQb0FKkLoR1t2VPruES+a9B3K3DL7D5esfT?=
 =?us-ascii?Q?TXQw+Yrlffu7+Uj9vJqk+eWbJjAi964vz+dFA6JGaUD51GIBZumCQ7OyCjRc?=
 =?us-ascii?Q?fqlKJODZD54ormLjxX79/ld1VXADmOz7DBWCEiZ0i5L6ImExRpKOPJx/KUZw?=
 =?us-ascii?Q?RBX3BIWviVnP8kRX6BRjxHTOce3tiPUDeXNkeGvvSid6c54GA55ggcJ83ebb?=
 =?us-ascii?Q?5J2mVB/NM3wqY0w8WiQeXLkz5U3D8MEFrfSIpkcLFrRSJ63PExmeY57OequD?=
 =?us-ascii?Q?4p6amJR2xdmrWcLbo3q9d0756qYZ8j//e0mWDGj/3ETOQx0vF7k2npxJlKH/?=
 =?us-ascii?Q?dVph3ayGIwQnev0JH2KT0FvFcR/uh/S2Dz7qcGFyM8kDVsEEJz8JTX+7TNZw?=
 =?us-ascii?Q?HWIo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 03:32:54.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: d74b631d-098d-4aad-3125-08d8a3059aff
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFOSA4FqLEVxh+K5EOLOr3nBcEhJDnTOF2U5J31KGtKfW30g71Oo0LBzCZ9AmlZPufOSD0llUk9fjWHvHWEPkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:32:02 +0000
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
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

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
