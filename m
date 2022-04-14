Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B6E50069A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC4010FBD1;
	Thu, 14 Apr 2022 07:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D5D10F237
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTDZ1cCotbZd0IydRa/S2wTNipNbYDF5z9GsgvvnRzjjTxuggEhPFL2cOGsEp5O77c8nktdzOwd/+BAzd1d1LB+zES+hV8gnfyM6Fiqg/p868b6wRkW3NDau5OHihqpstxJ4o7gh/WNfl43L+xf3m6ettrYwLelWyY1tlehiL7R+0NpZcB1nUzc+EmWYD52za0msAlap7QHsctb8aiWVMURX6Kly3wYEdut5eQt1jzoGb9upuYBPvEmvxWhp6Yt/4LoAKFqRASVE/Ki584/FVnkU/WBWIvlnKbuAoeCmBdb6pSZ4Z/FMr2obsRZqIC2V6DQzBQfZIhCJJVJRnxMjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2oGElILzCk+igiUTrOVzfcg+9IEz0ALDeKTJRlftv0=;
 b=oVBKG9lfzKYiLoAaOzGU3bsw1OqtpE5QGOwzo9CkjxXD2jU5TMtInuPoFtH6uUAInhMV/Gkrbh2eNVeXCEqgcYTkdVI3Gbock5pmukwDnJy88LuVkacEFOtD/qCdPra1q8Hun9aPEgD7I17MxL7fLeYI05TdHgqJRoatDnxYPc6DpRa4ac3JGD5uQIq5dRpuM4mP10M5gh0ejF4Kkgk9M8f2w1u0eDe8LVAZMnxuf36U/gb+AD4KDscSv5VGCXNvHnJdejHqrdXDrr1dX4jpF4yOY1g6k7kQE60aWUNeJLxhrsHbbIFMtSt8PEj1ExjLeCZgzsLOF9jQ5tVl2Njd1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2oGElILzCk+igiUTrOVzfcg+9IEz0ALDeKTJRlftv0=;
 b=E0rMaOWdOiZuXIiy8vZFLGScTMmEtjd4nD5h9yM/XiJMl7jtSDY77HZnQBW/dEvukqQ1X0GCHTtYXn7wl6wGT1gwhll9m3ie23fxJX0tWy9wi7BQ6mGVR8cSeObhDF96ddIrqdBPFIOp/w+FimUDqafb+c8UwsAZaZ8yizEdtrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6714.eurprd04.prod.outlook.com (2603:10a6:10:10e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:09:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 07:09:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Thu, 14 Apr 2022 15:10:37 +0800
Message-Id: <20220414071039.423271-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414071039.423271-1-victor.liu@nxp.com>
References: <20220414071039.423271-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a2d7bcc-db4c-4fad-865c-08da1de5b07c
X-MS-TrafficTypeDiagnostic: DB8PR04MB6714:EE_
X-Microsoft-Antispam-PRVS: <DB8PR04MB671449B9E53B8DD21557969498EF9@DB8PR04MB6714.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qE9My7+/runUOCq5/SMZOCu4wIFby4/MlKm0Fe9okNN6IYCnL+1txMcWwQdwn8FA/u/2yAtW5z5T5qxYmNSXxN0HatmpbU+qTtyQMzUp4vXW8sFJVWJM7JGv5CHgtDCKE+u8nMZPF/1cLtY3FyflMnZKvbWuOLAnGhrHGIhLFta5pgrhvnIehUCR8aWw76T747U2XDEXSzaKHxsbnztumpKo8oPwBupqv+PFdzQY/LUgDlGMoXyvOtcemEoeCA1Dd6/LHBbJ1A6ErYUdgeWZKZY4yZxbXoiE8A6LH9/gC4MK7QHMkXucnRGAeevezv4wf78vmuHNyjr+6xnAUftOfaYNldLMhLHE3g5M917yUCGrQiS2Y2iXvslI8JBAL83n+/wr1JNGTCDE5JVSQ6JCViGr9Jsiomlc2Rbj5quBfx1jmsR2r/oiC9kOFL4rJAIeQIPje/GqEUFEPVQ/D81VNwLtxstxFuaN952synGCwWC/kZda+Rdym2Ykx43wlYMNs2JVM5nEDqzPKTYfKp2Lc8Oqn2xxjZhvg+FFCcaP83G9qQS3Xq4LYK0ctSwTWjlk1cYw1Uklew0ZSJizZg2MrNdEHIbC/5mcIphlJu35An76J3c0MNeBAJ1SbVHmGLPRUJRSHSn2+JCkILoEPzLzHeBplJ7OKZ2ouqFyBBhIYw0fDeY0n6hHST83NpBNi2OkUjwpRFtdzMXR3FDmxYXyoM1A0l1achCWwJ6Efnd28aNQJyPv+UvwOz4IEVvG05k82zWYHqIkX7x1ARg5gqTlRjwumuFbVaptHfFGoD1EYqQWu5xNiylyZq93ST6Eb3KCpkCXcUvzAv6XDrCDzBlQLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(6486002)(1076003)(38100700002)(38350700002)(66556008)(316002)(66946007)(4326008)(66476007)(508600001)(8676002)(86362001)(2616005)(26005)(6666004)(6512007)(52116002)(6506007)(186003)(7416002)(2906002)(5660300002)(36756003)(8936002)(83380400001)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3NPNEdBTnR5TTUvVnZkOFlVdjhnUTY1WktKVHp3MVBVMEpWRndQcU94bUxJ?=
 =?utf-8?B?Vi9BZHVzM0lPMVd0RFY2TDFCNkNvNHdERUdOSnFQVHh1RDFXQzhuSUU2SkFx?=
 =?utf-8?B?N1BMeURXVStqcEUrcUZ2Umw0T1FUK0IrYU5kVW5WeFdJL2p6NnFKeWE0d1pL?=
 =?utf-8?B?QytjNWhvdE1GZU5IYTFjbG82dS9mUDRuOEJFRkVIK25vaFBJVzNFa0srOGkw?=
 =?utf-8?B?L3NoZjBwOGF6bGkxRnZva3N6YnRFVVQ5QmpwTUo2dmRIMWlqTmFpQWV3SGtS?=
 =?utf-8?B?QmprMTg5TjNDdnZaaDBZcU1Ka3UwWEV4UUljWjVEV0dHZGx1Rk1VN1QrQUs5?=
 =?utf-8?B?Z0kzMnhNNUU2cmxnclVUenM1QXFEK0tUUzN6YXhCempMZVFkeEdUQ0JYbS9y?=
 =?utf-8?B?VUFLV0ZIcXVXSWdlVWhlaDV6dFhrdzJpMHZjekQ4djU2NXY2SU9kdjREUDFh?=
 =?utf-8?B?RkVVR3Z5RVRjeThzb0pNVFQ3QmJ3SkFCQ0Z5eWRPSGV0MUJLQ3BYZEpIL3lM?=
 =?utf-8?B?SEM5bUZ6T294eFBMWHNSdmJsT3pLbk5KOVBRbEEveEFXZGg2M0VMaEFYbjZx?=
 =?utf-8?B?UTR0dUNuSkhKTEhQOWV4VWhpMGo4SGpRSmd6UW1pMDdBRVVuMGJaLzNmejlG?=
 =?utf-8?B?eE5hWjViN3V3dHExYURNZ2tGV0FuZ2M2c1dPN3ZpNWFEZm5zKzNYeklJMFR0?=
 =?utf-8?B?NjIrYWcwN0plbGVlWTdHVmdyczZtWTZvYk5EMHNtSFQ1VU5KQUJhZUdpWmsw?=
 =?utf-8?B?VjJUa25vYlFCWHlZd3YzTWFBRUVmWk5oU3U5aWE5WmdCSGtXSlhwY211TFJr?=
 =?utf-8?B?OGlVMWZ1TTNEVmRNRmZNaG1QbC81ek5ZVnBJcHVScCtET3pmbWxOS3RTd2Va?=
 =?utf-8?B?UStpSHR5elFpbGdwWXo1azFoVTBRUUJzVXZDSHhOZWtiNjBYRGpXaEtYS05i?=
 =?utf-8?B?SFZaV1FVL1VXcVFuU3JFaVpPRzBPTEJBRGJEV2d1cHBKMnNlYjFOQ1M4Q25o?=
 =?utf-8?B?SVhTcjRWVzUxT09PZDl6c0ZYZENkUnZGaWQrbHNNNkZMKzlVRmc0UTJ1eGFE?=
 =?utf-8?B?QVNLOVl6ZzhITTB2RWtkRTNCQmE2eFRCeThWc0cxMnlwSmk2cWk2bGFMU0Mx?=
 =?utf-8?B?UUNMVFczOVdlbm9WQXZoaGFRaXJ3THZJOFBQR2lDSVVuVmoxalFobkZDbnY4?=
 =?utf-8?B?L3Q3VXNxcWRjVmlFVVRFTHZCaXh1MnBHOEhGYUxNRmJON1liMnpVYTRJSUtj?=
 =?utf-8?B?VFJuaVR1RTZITEdncFNtWnlWcWNmejhwa0UxaDdVQmVBNXlVeWVsOCtNYVB4?=
 =?utf-8?B?ME5tZERxa1c3bHhUbUtEdGdaTCtENGoxSE1kSTRVNUhLYktoWVR4TDg3a1c4?=
 =?utf-8?B?QXZhb1d0Uks3bmM2V21wdm5uTWFQcGk0ME9VNWw0VEpTTWRmMU9mbEVKMjgz?=
 =?utf-8?B?bmhLNU5wWkdMa0JUcUEzbGlGOHJrbXV5dTVxS004OFVvQis4bWdWYy9JTk1Z?=
 =?utf-8?B?YjF0VXBlQXlRY05KVFZJQzQ4NDFFMHRPNVg1a2Frc3p0UnlYbjdmS3Q2MFNn?=
 =?utf-8?B?ejdSbjNEUnRGeFBlOWRtMUJCUU1rODhEbFNRSlc2SXBpdU02aXRoMG45UUp4?=
 =?utf-8?B?QU82eDRYd1pWcXFrM0JVdnRaSS9ZcExDY2NwMW8yZ3psZVVCVDRaOGFUSG5J?=
 =?utf-8?B?TE1pbGVCbHdaa2hvSzl1TzFqcmphWGtFS1JwNmpad3Q5cnBuZEV4aDd5WlRT?=
 =?utf-8?B?ZUR0RDdDOFd5QXlnM2YrN2N4MmxycHJRL3JWUUJnYS9ZcnBkd1E5RGMwMXZy?=
 =?utf-8?B?NHdLaFhFSi9rRTgzb1htSVVLMGlmby9nRFVyYjhuRWw4VTF4UFl1aXdBT01o?=
 =?utf-8?B?NjI2TTRPQWpLdnRTN1YxUWNrWlpTc3oyVTVybkJOcEZzeUI3S2Z4cmovNFQ1?=
 =?utf-8?B?ZEhoQjFrWVlpbEVEWXlyblNKZkg1bmNwaThCby91ZDVyczJqUXFZMFB6aGIy?=
 =?utf-8?B?cmVMbGhxeXY2dVdycHpQSFRsMlhBdkR4Vm1mRVJ1dUxrY0tHR2V0d1oyYU4z?=
 =?utf-8?B?aUZ0M1NYclRBQStiUzR0L0F1ay9DTEF5VEVzSGYreFB3b3E5OEN5TzltNGd3?=
 =?utf-8?B?YmZ2bGp6Ukx2UTJXdnFjc1VDNjYwYWRFNncxRFcrTjdYdUdsZW9wZEV4dlB0?=
 =?utf-8?B?NHFPdkJ0Y09yTE5NTTRkd2tBb0FyWWN4NGhKU1psUGl2bkJFMkNBdUd6ZDN1?=
 =?utf-8?B?ZjJKc0FwTEJ0d0d6NzhoTi9kbHlvT1FORUhqVmJ4cHA3YzZuOGU4VkpHUkxR?=
 =?utf-8?B?Y2lxRHlHMUY0M3Q4QytLYVhSdTlPOGVxdDJwQk5RaHMzT3ZHQ0M3QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2d7bcc-db4c-4fad-865c-08da1de5b07c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:09:17.3888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbCC5JmQ1gSmWSGMYgUYd4lph0heVRfW4Qc0uWmGlNFoOZxspTuhg9pr4bfZmziKpM34NrH9tMHUHllfxYTc7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6714
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch converts the mixel,mipi-dsi-phy binding to
DT schema format using json-schema.

Comparing to the plain text version, the new binding adds
the 'assigned-clocks', 'assigned-clock-parents' and
'assigned-clock-rates' properites, otherwise 'make dtbs_check'
would complain that there are mis-matches.  Also, the new
binding requires the 'power-domains' property since all potential
SoCs that embed this PHY would provide a power domain for it.
The example of the new binding takes reference to the latest
dphy node in imx8mq.dtsi.

Cc: Guido Günther <agx@sigxcpu.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Add Rob's and Guido's R-b tags.

v2->v3:
* Improve the 'clock-names' property by dropping 'items:'.

v1->v2:
* Newly introduced in v2.  (Guido)

 .../bindings/phy/mixel,mipi-dsi-phy.txt       | 29 --------
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
deleted file mode 100644
index 9b23407233c0..000000000000
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Mixel DSI PHY for i.MX8
-
-The Mixel MIPI-DSI PHY IP block is e.g. found on i.MX8 platforms (along the
-MIPI-DSI IP from Northwest Logic). It represents the physical layer for the
-electrical signals for DSI.
-
-Required properties:
-- compatible: Must be:
-  - "fsl,imx8mq-mipi-dphy"
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Must contain the following entries:
-  - "phy_ref": phandle and specifier referring to the DPHY ref clock
-- reg: the register range of the PHY controller
-- #phy-cells: number of cells in PHY, as defined in
-  Documentation/devicetree/bindings/phy/phy-bindings.txt
-  this must be <0>
-
-Optional properties:
-- power-domains: phandle to power domain
-
-Example:
-	dphy: dphy@30a0030 {
-		compatible = "fsl,imx8mq-mipi-dphy";
-		clocks = <&clk IMX8MQ_CLK_DSI_PHY_REF>;
-		clock-names = "phy_ref";
-		reg = <0x30a00300 0x100>;
-		power-domains = <&pd_mipi0>;
-		#phy-cells = <0>;
-        };
diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
new file mode 100644
index 000000000000..c34f2e6d6bd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mixel,mipi-dsi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mixel DSI PHY for i.MX8
+
+maintainers:
+  - Guido Günther <agx@sigxcpu.org>
+
+description: |
+  The Mixel MIPI-DSI PHY IP block is e.g. found on i.MX8 platforms (along the
+  MIPI-DSI IP from Northwest Logic). It represents the physical layer for the
+  electrical signals for DSI.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mipi-dphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: phy_ref
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - assigned-clock-rates
+  - "#phy-cells"
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    dphy: dphy@30a0030 {
+        compatible = "fsl,imx8mq-mipi-dphy";
+        reg = <0x30a00300 0x100>;
+        clocks = <&clk IMX8MQ_CLK_DSI_PHY_REF>;
+        clock-names = "phy_ref";
+        assigned-clocks = <&clk IMX8MQ_CLK_DSI_PHY_REF>;
+        assigned-clock-parents = <&clk IMX8MQ_VIDEO_PLL1_OUT>;
+        assigned-clock-rates = <24000000>;
+        #phy-cells = <0>;
+        power-domains = <&pgc_mipi>;
+    };
-- 
2.25.1

