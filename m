Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D80600A6F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE6710E3B7;
	Mon, 17 Oct 2022 09:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2553F10ED03
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:22:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc8m6uQKFTGc3ucW8lZCFlVPmCz/DKOPNWZBkcjrnrxYn1l9dMhFPHf11ONt7qLCArpSPupk7bw8a0ON2kGZl3s29O4ppvhalShwhNEibEQch2af0uhZcumdP2k8NRH/nRds0z6Q3xz1MwftIMz3tuYui6gj3ulr3kmN20bmFmSmV1uKkz1pNRyt6gugrqpMUt7uwo/LjNZqEtsstKDIXkHjuzYdIRQM27PiHDNdiG6dKuiJUGfLprOqdNKSAUy93deou0oYemjmuzMP27194+8V1wkKjtkpTSiHzK5LOBYDUFXCd2RYICTbNt31pMSlGuWmXNDRPyiaWzqs/BNWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0jTvZwd7xfqcQvA3vapGijmw6j86BPtjxw+rIl15cs=;
 b=SmRKB6GaLiRVjbVWeqxfj94UtYJCUYW3pmqJiDIri/keXl4UO27a8te2i/0UniA68ijOhStQIl5wcRGaFxrLuLyXbaSFj8A6icGDe2ZdGieY00pu/qED/ioefNlfrj8ZtjkKjKncREGKZyrdPhGWaVNFhXCxnPYYgIFioq3M/78HoOG1lYeYRI/CxtTVtEItrkKQ0Hjs49GcwMwx/OS/6aF83OYbwPmnGfPFo8w4XZsjJqb9TR74IBl7ikhINJngysWter9BwUiObCSlq+66QLw4ZMXjZ4dGBEjqipYtzfty5+JbT6xItzS0rkfn0gRLqm4EWKQEbD+hDeOPPrTHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0jTvZwd7xfqcQvA3vapGijmw6j86BPtjxw+rIl15cs=;
 b=dQDV6gI8dasIK0Ry00BPn4oQdN3KOHCMVSBxIWS3kdUV5x/QNd9YXYHTzqaJIXHtM8eWHtdOEs5HJHMP6HFfgoZQrrnt0Rjim9j+u39dXo2pi4b6birjgN3Gbtda7FRdduHFaTecUgXBlpmQ7UEJCDPmcDNEm/NhF3e3ihnOFaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:22:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 09:22:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM
 driver
Date: Mon, 17 Oct 2022 17:23:08 +0800
Message-Id: <20221017092308.249665-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221017092308.249665-1-victor.liu@nxp.com>
References: <20221017092308.249665-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: ad36166f-da25-4c31-ece7-08dab0211a2d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W5/rKXCHjuYS1PmD6LyfsTMi6LrZzcryFXjuXkxk4YKTTpPtS/JA58fohEfPZ7v4PS+UiFVS4WEz/T8Ay0hjbxazNs1kfRbipFWIpkF91it7D0q50yBkoX5Xelh8jMxyx90wIFcHCzrydRfvt4jpsXnhbcQKir1OyPR83kvJCqAyM7gVEGDkP/izeb8z7Yc5BtBVaVgJA8UvTUFN6+EuqayrcJQ1BLkcmMPs4XZr6YNHZwIfYDWMNXdwvcJ/frO2ue2cdzKT9cC3dFmicDcfxnWEZuRwbwp198Fxnvy6zhlqekMG7Os0DDSkZeOb8ln1iqo+s7FzOpr+vR6AWAo/XyrLA38HnAIwEVr2jimzd05qK6y24b1yaOc0k7z/UVE8I76dS/N+Isw0U1h0wDcvBRskpl5Svb9kHiFdyxaHCmAN6Ca6NPctY07EwAyIhcyEIhrUvdn4SOET9OJ2zH/+ABL4mUtetxUqIaDFZ9E/Qy9O3qIHjo7yrrmdzecuZZHax7Lp3KKwFUDbKaCIAgPYfIE8s16nwsKdZ29epWYgcMLa21ZIbk8/tZD2EliN3W2IDD4P4+h0KyKTYkHY3Qhmbzh7Fpyx8Y1WMZ7h0yUAhZC9PcDw+YgYgB+c3yGIzH/Rew8wLTCttjlAJRUiyFXgLEZ5hbEQ9b6piIrFJKU5VGy8Bx0FJ31T6XUrT3VYV4vXPL17PijrC0uVXWQHCAx5k8SAkdv1JWnAb7iDcpCHBSjQYQYsTou/wFI2REJcPSJPYoc07XFd4R/QGg6BlUa+OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(36756003)(38100700002)(38350700002)(8936002)(5660300002)(86362001)(26005)(6512007)(6666004)(186003)(1076003)(2616005)(66946007)(7416002)(478600001)(6486002)(316002)(66556008)(66476007)(41300700001)(8676002)(4326008)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UpQeRwdir/Dcd8/aGav4xwPoWHLwHoXX/cMyMUyspV6v4A3rZ8vMRoHPEnIC?=
 =?us-ascii?Q?33D5jia4unQksDVxloZdUfEfsgyBpLaMJWLQqfOSVoQGgW2pEzlAjtgOm4uz?=
 =?us-ascii?Q?PT+9z8JafmphC+4Kcf8JVgO40B7mlrulMbBHbuvEmdnRKUUGJA4/+/fv+hTM?=
 =?us-ascii?Q?+9v2oqVNw3+vP3hEZBRhblT6S9xGC6WYAInuBwiyVqPyeuW0G2JV953rtRG8?=
 =?us-ascii?Q?/bReAJfXKK/enQyvOoVGD1AuafTR2xKaDTbj1kqOTZN3kzUqPSogHI+ZwKnP?=
 =?us-ascii?Q?tPh+0vakR9T8FPe1Nn2W3LDvSaNYnNfIlA2ssl2y6iGP34t8AuLtg6LVSO1G?=
 =?us-ascii?Q?ktKzHU4wVtCZ+PySL7dAOqiqC7CJkDASCZyLuIF5L0ur5nwya3PxoyFp6j3A?=
 =?us-ascii?Q?DOedCVisUDaGNS6ch1Y6kM48D6a0tQMnlqlA2SGosgqi8ZrMZzCT3U3dE1Fn?=
 =?us-ascii?Q?iTiYYAu1aU3u4wufDaCAMMRnpbpSK9Vf7flqskO+wScgbTJt9lck6jD85enW?=
 =?us-ascii?Q?8cuAraMXhNWj9ISN+ej1KlKvD/C9wmgYeYTxV6/uMpvEs9an4J+ZqZL4MCHA?=
 =?us-ascii?Q?Cymd6YAxOTt+cKSJVG+DfmgNt7eItLZlwHDWqFAieqz/npSuYHLVet5gj+Ej?=
 =?us-ascii?Q?YQGAfzYxXY2cobksdfU8gm8EhO8ep8VkSuduUYA410OAJamCIUjLI5CGOD2a?=
 =?us-ascii?Q?faPu2j80ZOakNaN5ZjHpbOBrwoLXEHmqeD4pHCN9gdSW2fh1d64oQXbf3Xnk?=
 =?us-ascii?Q?FNPgfLZeMBQHLNgn1ftfV7/bIxwY7M03hI5myN4v9GH+se7YxeCjwXAltl8V?=
 =?us-ascii?Q?hhrY26kP84Q05Y4X8cpxC/jQoZZvypPk4/W3OXoi05uz34LU3y367toR4KSZ?=
 =?us-ascii?Q?4OcYGyC8PYHQpK7/IH62m9YHvWhqr5FStfSlvSGWvQGf98wmiL0YQ7kNPtoo?=
 =?us-ascii?Q?daMfEz6KF0QXNwx0UBSc3Gc3IxQ250Mj4bIRNyQAI5X6YTQt6pJoRNE4uxha?=
 =?us-ascii?Q?PWyNO4B8QiG4A99TSBvgJz3LmActqpYSS5c/OWjmc+Ku/1JFK/vFBPBz4trw?=
 =?us-ascii?Q?+PRLb5y/3/uwKnkaqllHDR0NVQDlJbuP+m2vy9cgWdFUP8LoSkpcn/pTt9pr?=
 =?us-ascii?Q?n3j9YX2m78XeqZgtGQR5Hw7e2a/Xe83Kl6t/vuUIh3eAzJx01CWFFkqVUp9r?=
 =?us-ascii?Q?7ECpjXJ7aQt7ydAI/kwcEioWyRr1zutIN1PEeewXkmgT5JGp1vZcr3JTm9qx?=
 =?us-ascii?Q?vQgZvjFyN1FsV7KF9S9Jh7cH9+dA0muvtGkrzX7t0xiSCPXssb7ovCS+uX1B?=
 =?us-ascii?Q?gIS4OLQWqa9ybRSJCCIk1XQHtOiaq+CAnXh6nNOEY4RV9KC7xQ5mtR/brqpV?=
 =?us-ascii?Q?Ep5nx/66DkLxBUPD5lDk9Odm+tcf9g7xv2Z89UqEcllSeuFWVam5mt/GiYa+?=
 =?us-ascii?Q?ARgpW5tpMy+LB5o4q492E0HXg7vWGmySoyFoKEdUJtglPn6d+JJ0U7FZOiHO?=
 =?us-ascii?Q?+ztRv8DMLaz83RBShkGjpA3DJ2C0yXBly7eVZHBHnGhiVPRLgWdCYvrp9brI?=
 =?us-ascii?Q?H0ypdqb7vwFY3/JkeiuV0hbQgBbwB8aR5rzZKmev?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad36166f-da25-4c31-ece7-08dab0211a2d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:22:24.9253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ip7+88PbBSCaHPTAaBjyA7ZKmsF/oajUfgdl9Klvr0XzCObvTjHru79n+/W2quDUN5kXz+ulv0DY6UPNQpQIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v11->v12:
* No change.

v10->v11:
* Rebase upon v6.0-rc1.

v9->v10:
* Add Laurentiu's A-b tag.

v1->v9:
* No change.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..a882de9ed4cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6902,6 +6902,15 @@ F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
 F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 F:	drivers/gpu/drm/bridge/imx/
 
+DRM DRIVERS FOR FREESCALE i.MX8QXP
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
+F:	drivers/gpu/drm/imx/dpu/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.37.1

