Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A502F74AB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC6C89C6C;
	Fri, 15 Jan 2021 08:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130047.outbound.protection.outlook.com [40.107.13.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA836E151
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g83IvqN6Ou+QrrgWIk0teHTBnIhQjR1F42l+K8Piw1ZZLxYOuZDzaCecaTQLGuxGBTItxgp/xAnTu0NXve/5TR2IxDpxQg8dPje5X5iTd908vrHU3J0v2u+Qw3KmMbFCGB0k9mR8f+huY81b4CXGYnp7gFZTu2UP49MTL885okTNgfpicrfTV+k5Q6BF/Sm7wzY0OKm6472xYX7VWxBtc90O6N7EFtPttpm0it6MSvtRFP3JbHkZiSlLDdDy1wLJA6ParbVrpmi++ixn39pUpGAZvsvrR2LJTIdc3Ln67ELX/BsXxAJlP6dmr2FT94Me3ahvaFrhtTO2Uq7s7q+9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hBwZbAX4TcDQyoWJHnCe+1w+mBuZAeRiAiLvj9Ow9w=;
 b=YtDP70IxehFeftrTSgis/N4ljItLc++zg+rHYqqIDvHWbybnKB2JdR5yuJ14prvDaVO5h8A86OjzqGIVunmXu3ZTiA0XTHq4M6TrbaoHY24bbXu4pVzOn2Mxvl07WTosrPXiO995ExCPZsDcG3i57H5MBvwznyg4kqOL4YaaA5fsDr6pEdxuVhReL1YfrmesvIUORKwUynlRn0snFIQd0Of1sz2FA1xhppo6SlGDR4PJYI+/BwM34hsLvqpnK7gkQmGDu5020u5dH2McGviRa8reWdistlLWFTjPWoCEkKZ+H9pithJm5fR44wTitG08f/E4NnDhEhwNZCrS7IgCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hBwZbAX4TcDQyoWJHnCe+1w+mBuZAeRiAiLvj9Ow9w=;
 b=ZIKhhUNTKMFdyAqA0KY3OfRM5s69GAnKCG0HIj0KEWjq/25pYwGkchsQbLzKfThROAeC+Pt/NVlPw5FQ+jA7yvMtVfKi8+NlOH629ZO88DWbzz/tADoff06hLSVz0UcJpymSSGKT06im85KO90RGYVhrlv7x//e3eYfboXYgVUI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 09:32:39 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:32:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 02/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Thu, 14 Jan 2021 17:22:00 +0800
Message-Id: <1610616132-8220-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:32:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 106eadb1-a2da-495a-f726-08d8b86f55c9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4893D8C987CC239BBA52087B98A80@VI1PR04MB4893.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EMKhpUcKJsou3+yl27h0pJXKzOJn5djYpdOlhh/DEZTFpTzS22jrjtxfNfvPd3sJT5Y2Nkt9kc/fMUTSRCM+xsAzH2yILfGWTWXqKoK6xfXB/AKYUfqkEx3bSXp4/zTSz3Ay6e1HLP37f/+eQ70clMYXLRABVo+oGmAHCxF2jMq+j68nNDPCWR4Sl3+TsfsyDz4WwG0h2vFmd7rBZDbF0HeOYIdp8Lxf7hPga+oFIUoDmmsRpOEFIxDb2Koxq40FQf4rBhFUvZyYukFcVkAh43N5q3kZ8x9QW21Z5XlghWR2xzcqRIoMmGzWzmQhNvg3skX2ZBjyFNL3JYSKK1MYZVqaamqx/4xEvXB3GKfEapnLtoioDrKNRmEv/zSikRBqzwDcArkYb5TwlxlIS+smqp2QxsMGTtw8PkCMP6hCe1l0TrJRd0DMR5f75sV29cwXprbZaSUZvlNsAuey/ieXPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(36756003)(6486002)(16526019)(186003)(5660300002)(4326008)(478600001)(83380400001)(8676002)(26005)(66946007)(316002)(52116002)(8936002)(6666004)(6512007)(69590400011)(66556008)(6506007)(66476007)(86362001)(956004)(2616005)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L1IhlsJVl+ia9OMZ0BBdR1NUFy5EBhnbv+cbcDOpohY/yyjCfBPXOrignERH?=
 =?us-ascii?Q?cPhgCN4pATe/GIgoGSD+JeuDoJek8S2qAhNv9w0O6pxdW6t79IVQaceV4wsf?=
 =?us-ascii?Q?HCMkVy1zd+5zVU7o9gG1HqGGZm6GPUIwt8iGS+ikhi1Yp6ZB/yhoWa3ds8JQ?=
 =?us-ascii?Q?bMr8K0X7mN6wlfBJGOdsQZPS91sTI/kWGNveHUwNTpPGEdAdbS2GujAIpK74?=
 =?us-ascii?Q?x8BSLXcFWdzVfE9lEvJ5SsWXVmKNCDnUzwOiFv8lpcOCGUeKy4FFCNV03kRh?=
 =?us-ascii?Q?ZAp9FGUCCQwS4+Mc9BzwArr7fueNalMOSILE+ltcJGFzJFSF1EHvE2MS6Q3L?=
 =?us-ascii?Q?GiTpBs//Y/IYtoR/2bdHtGI/8aJ4CUn68dAWPovYwdW80K96Au4iNB7irVov?=
 =?us-ascii?Q?lEcyJW0LDBJx00abgVnDqITQKf+WGMG89jPeHyVlxHRh+vg+T4rDDfhdkWhZ?=
 =?us-ascii?Q?hKmYsuncdYd0CGplubM+8YGasCchqPmKKMUWIooy17treb21TmTzkmYaCHK2?=
 =?us-ascii?Q?/Br6CkppUHDSAiGewbuSCPqdeZEglhh2p56VD1/L4VY+5ugW1tK2kF4iUYTm?=
 =?us-ascii?Q?fhsb83FS6yGjWXCLg7dwIy74QNLc1LLBacvWArA1mf0suYAgKGHhPG2sG2qT?=
 =?us-ascii?Q?ehM8qYNJSupGSxDYhdsuUd7nnipMpWKQQATwO2asPNKwh8YY1wPaYGQ+Uizi?=
 =?us-ascii?Q?W4TddX8Pgqlm5422uWPJYu/5fcfpDXtmVYzLmL8d83EtB5dK7rYEQ7pd38bZ?=
 =?us-ascii?Q?KTt0aWcmt41NyJ10+ZuQn/raocv+KVqjtEqJQ0HaDH78RuEm5KTobeRLVRIe?=
 =?us-ascii?Q?SwnU6ySuAEqWhFxOwJ3FVDfPjz2fNwTvPEJlRwDlFsX4LDBPj58ch4cGidoX?=
 =?us-ascii?Q?A9dB1lwgQqhnGnT+2oLSsrOrk7krAhbPmydR51ZaGDUSRFSlm1WA7tbeCVNJ?=
 =?us-ascii?Q?4cIYfz3xAl8uKBxgOO8qcqsR5MQ573O8pMIAthEHvxL+MjmuWUr34IcXyo4z?=
 =?us-ascii?Q?o7IV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:32:39.1306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 106eadb1-a2da-495a-f726-08d8b86f55c9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihiIa/ZB6QDkd3cdMnLyfLWnZi9HWzlrJymtQPW1s4O9/zoE1Bu0aVAIDYRW/26ZW1gQUUs6kCgjUumRkpzEMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
The RGB pixels with padding low per component are transmitted on a 30-bit
input bus(10-bit per component) from a display controller or a 36-bit
output bus(12-bit per component) to a pixel link.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 include/uapi/linux/media-bus-format.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11e..ec3323d 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x1022 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -59,9 +59,13 @@
 #define MEDIA_BUS_FMT_RGB888_3X8_DELTA		0x101d
 #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
+#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO	0x101e
+#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO	0x101f
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
+#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
