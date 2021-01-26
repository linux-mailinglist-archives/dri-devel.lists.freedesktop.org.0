Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F462303817
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2146E43A;
	Tue, 26 Jan 2021 08:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F4289BDB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 06:25:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUOvQPHwOulBhlt2XLokFdJ0F13G0wXkXGT+pr+Rm+QUhNTS8PpEWyjK4/rdDtKfoKnaSjeWTJu0n1DubQqsLCtu3GFv3q5jDBdbdCwmz9voKvyrBE91tcbSGRLDWdjWz57yCVtgEiZy5OkL/MbszD1uLPrU4GVIg/66l1Ef5VNMXNiXo7bKomVHVYGJ7wblNkYKf5+isGz/XFD29EPJdHpV3a08cb/NZz6y9nRWL9tZbd8jyXOcCGYJzRzER3oME2X6OT+avs5T1kN2NW3ut1SnT2i2taT2fzZYex3MQMYQlC3Pk2qxECqHWtpJTOneE9k6rmZrYoc5BwHWsE36dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9fPPnFzkJWIqM55LxLZRJYO8EpcKOFsM97CMqD0qxM=;
 b=lgV/yCELkdmGy+SXlhLDv9voqOh26AxHTDkB6x6j/Xhst0eIN/dlL8zggakHAHFuESLAcxGk0Qb4WeTw5hTbfc478Bp0jj/ocqbYnY8eTCLkfPExS3rRQlfeIfWhSQjG3nd4LeYdhtEA1EWAk7U9pWVLDXC40kQ1Gn9H1zXZOPnutlgGCZen4T2n0kNuedm1s3DORmo85rKFYMUdfpwcohn4nLpXtIDOs7xm4vFyj7AahHenvIWP1nVphxLgqiM3IHp9CPuguOvDTp6ODxk8qYQgfpVFQ7XkxPryrucPaoIX9OM814CNSWWATxykPvo1V7PY3h5zrTMzjNFEVd1qBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9fPPnFzkJWIqM55LxLZRJYO8EpcKOFsM97CMqD0qxM=;
 b=W67YddkAPGHee4yLsId8mMfX5Fvyh7xaEu1zI3AbRSyuC1K1hJKnx5XErJ0Xhl/7MeBu/FgMYYAIPGlFi7BvKtZuNAARdnYxlCckae+X0T6MDziKjpKXUuJs72DAcDANOWyZY5lYm9alFuvZIMZVA7+DqDIhchtv1tJdtYrT45A=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3134.eurprd04.prod.outlook.com (2603:10a6:802:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 06:25:45 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 06:25:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Tue, 26 Jan 2021 14:14:47 +0800
Message-Id: <1611641691-17554-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
References: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:4:7c::36) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR03CA0108.apcprd03.prod.outlook.com (2603:1096:4:7c::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 06:25:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9fc1716-5028-4b78-6e81-08d8c1c33677
X-MS-TrafficTypeDiagnostic: VI1PR04MB3134:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3134290B4AF0629042B0F4A498BC0@VI1PR04MB3134.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GzOjV6nqOYPiGGTls8smZ9bOid4aafV4eRS6HGjuQJFRTjRLINpGKqHFboXR8kI+MbSHoaqyG4I7hwVNiScdUaQKiYJkIetVu2TDrRE1hFkEeGbBS4gnxaUohyK9mHWWZatUE8RmebAjIuvlEIeQeIWlKEWF28y1M5Ion+9oWHyL/e4p3KqCGqgoXode/6MIOFeh1a6sp79f/BrUgKiX864pVzVFvZ7TIqSkgof1FBGi/gX2lA0I0bssxjpCGU2XWEhlC/2H8H7cLV1JU0zhTM8aAJtnfXAPTdMz2vQif/WwImX4yR/r5o8inzvMiNlaZPjX58gLcunjyC3gI+9CPkA6N7ODlFjBhLDz3ABJ5zd4Sy7Y2YuuBzSUXczAfOLrql5L4n8pSqvBaw8z6JYY97KL8RLicYaGxwwmj9uZWB2zytkbZPL7GUPmLiGoDhWg4sbsPJvZ9Zh5goaCYxzo7VtugHPPvWNCgU/fBY7sZXh7kjtbEljIxH6xtHb5IeVAFuWXZOvIcLBXdS1C21ijE7O0wLIFZ0hr0i+vesL8K7nLGKiLoGfzdodqWagidDgQD27dlYn6onuqa1FH6jn/lfCVNfSI3HQ+jhn4K/2EIrcIZw/VV5rFTPkejOGxJRStAZjxJ3qchvGxyJ0wRoN4eI8NY91lwVEi3CHvZRiC8XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(7416002)(69590400011)(36756003)(966005)(66556008)(66476007)(86362001)(2906002)(66946007)(6512007)(4326008)(5660300002)(83380400001)(6486002)(956004)(478600001)(6506007)(26005)(16526019)(186003)(8936002)(8676002)(52116002)(2616005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s0cBTO4YYhB15QjGZrOvP4YrJ4sCJm0Px9cLAjgf/NSHkVxuP8kB0ar1mMXE?=
 =?us-ascii?Q?f8+Bg+uHXlngEnGVNa9GdfdPhQ6d/Uvlc+t667SPnptnm3CCx6X/5dx7TATk?=
 =?us-ascii?Q?3ymctcq5D8mGjMZ6ahzrIaf7QYQgnjhFGKXSf6izlqQRS9Mq/HTarl7Jwuun?=
 =?us-ascii?Q?qDj0iRQGfijKm7ZBFWXIZQBJ+Kvt8rn6N9bmEnBOf1VNhNbZGtPW3wRGxj05?=
 =?us-ascii?Q?7H5KUIeqxj4zV8/G/1a5CqHaTo/WUvqGgpk1K6FAQ/OAZS30Jt76Q8s8RVLj?=
 =?us-ascii?Q?y6sEo2SlZxhXnD2ypXZTVIeK6gVXREegVrlweL1/vf93IL5CDMLPa2y/Aucv?=
 =?us-ascii?Q?pW4qH999EZCc7i1+j1XmyyOSncegeqHrBOpKzQMH5MGZ0KU1JU/8dPIh3iUG?=
 =?us-ascii?Q?aDhEOeklwEmDM34T/R+LYqupoy8W7m9UUuLaBHWO5SY/e7M/Sz6B/Mn4AOJd?=
 =?us-ascii?Q?AG0eZqZh4Jut8CfFptQf3N2ycLTT1HzVbNGTb0KJ4+1+X+jw2jNahAPd1yKv?=
 =?us-ascii?Q?mZCTlt8afhdeliCyWvB6n285yCQgvFc4tJKjL0WAofe28tpyWnGc60iXht+s?=
 =?us-ascii?Q?WyxSsw5KBOTemQLStKLiZ237ZPO2vuXXSk3kLPKOok3vqJG0uElXYC9AR3RU?=
 =?us-ascii?Q?kM8hMVuq1NsF4t6h8VkQtAhmWj08BkFETPTuEwDvhnwqfHzs3ruUZ+584emq?=
 =?us-ascii?Q?hXs7WHq+/wqPo4msuQQeCjX0ZO3IAvDM5hUBbXOnZ8mOUEXDQrUeQ1lcXkDl?=
 =?us-ascii?Q?kbIw1C3t6Wn6UZOZRlDHtU3tm4PTrouLFTspZPQ9rfWyTQIvpSf0g6Op2cyd?=
 =?us-ascii?Q?eBgYuqwiyL/9iuqOM0kK+DRLacvXFeKFw+PCG120E6Oi+kmKHJvvDT0YZogO?=
 =?us-ascii?Q?ykTuGf4klxjNpanYo4wtv2bnXH0ZZWJfihcSWeBEdB1kHoC/m4+myJTkmXf7?=
 =?us-ascii?Q?ssF4W5jlxYmpRnNNEPrdmem6UjAqaujxnLuD23qhyuHzMBYBvUI4E46CpnKF?=
 =?us-ascii?Q?jPkMcAvvBLxgJf9WvAV3UkHyJmWFNWo+WKgrVIF8cGZrrbDLlnX8BAdomafJ?=
 =?us-ascii?Q?3JZ8vszJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fc1716-5028-4b78-6e81-08d8c1c33677
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 06:25:45.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7U1ReT1mIjS2XFRYa6TpGmO5Adup1OBKEAF6eH7BUOg2k7MeIEYp4J5nA4sQDSQyfgM9qPYSPNrk+QGmZlBxeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3134
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
