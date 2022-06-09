Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65347544429
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE317113DEA;
	Thu,  9 Jun 2022 06:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50067.outbound.protection.outlook.com [40.107.5.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524E1113E01
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:49:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwchLStUN8FgCegQKk/5c+Kj7qeOXwvIeiZS8M+YYU94yBC4Ggotx9f9byP5Do2kFkOn2CXaph86wKu2lQYvNNXPrqFAAe2+RH6oA8Q4aommjNhZfyshAGlxnzCONMCEmTwGSNEytdw72SOTQ2NQ81/pZeqfK7HTzYhnbHc7GpQSuzTXQu6I5kbP3KE2EXPqK7RzsN0zOhk2H+pp8/H2qMLSTe/ck3dsvXrGHHd46ldQfY1QhxeFlVTKtpJR9glkIbaEJXaQmt+dEJmAQJ32jGYyCxFyQYSL3JnM2BY4D2oVdPeUcmM3Ooq7q9A4kEYjjPmMQFRWbATLalVz/pmzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVxre4AWA+IrSerFD3kYGHhiFn0XUGSgjF2pv/MAWhU=;
 b=cYhRGIF3wSXVmNoYfTxhE7+ExhoyBsFdk8NLfr1Zyg1GOGOMVZ5xxx1kcRV7whtfCWq5nFIcGDEhicFHikbwZdceJnmA0eBSTA1B0YqJvI/lnhnwQVcdEZUULv0u6GI4P52M/lsWOhhZi71B/SYxU+OTrW3Q3I3zm0D7YTZ7X0R228bk60cuhrbNeQPEEJwO7PjJHDZ4kybUCbqE4mB8Gwk2RNGcPRHCFRy1ITBA8JcQ6Zc1Rbl130Y6mbGYv5ZyP7s46s8YJrLHfiR0cBGQtST0YQYRa2yHwVnKLqM6NDnvUFOw0g/i067Fd4JZ2JPZWD2CSSe3r9UTV84nUovpNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVxre4AWA+IrSerFD3kYGHhiFn0XUGSgjF2pv/MAWhU=;
 b=J/FJORQQubFJ793Cbd7QrlydttDYi1DvNCmP9smnOrbA3HHe1VD4JAzSw0XXZPI3Um+QvvMYd29Kt7WbGmF0uYrKtUj11gu5CXpmF/RFzUvSV1+RpIdj3XPVZL6ERgBdLs3ELCjXCpgf8vVZscJD+EOiX1yRONInsejv1Be+3dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB5280.eurprd04.prod.outlook.com (2603:10a6:803:5f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:49:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:49:40 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 14/14] MAINTAINERS: add maintainer for DRM bridge drivers
 for i.MX SoCs
Date: Thu,  9 Jun 2022 14:49:31 +0800
Message-Id: <20220609064931.3068601-15-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ea5f6af-5fd9-4598-b888-08da49e439d3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5280:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR04MB5280131EF45276487891146198A79@VI1PR04MB5280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDP8EJuHywL+QZS+72jailp2KMBofJcW+DdMa18azomBSl/R/tfAkUEJ5o+Y8nt32zCVbtzACvMIm+fXBaYz64UcY2b9ycQDJ22OlSqCPWTMrL7yFlNPtitgkJHkzy4d8Ew4TqOHqNZ46n8BIMxA0kXRDvIIPMmBjeoXFz2MvSfbUKBeQ1cDY70+vaJOOwD0plR8Xdz/+2GC4P9PH47mpdXYYa0aOh23M3h8Xts9kR+ZWiJQcMMlQcq0bikDkahBTI+zKUnnzTNfmvOg3kuzbkfs/+HDwlYDgngMMvBdnbPR7EQ3QIyDNO8tPH/cyj4kHhGwZIjNJdFF/d/B0fDMtkL+okoxi2ZMMZr00aU++rFdamaFdCMOny/rRDIB893HeMHn6BRPKmiZA+gXzSrq+7MVphsb4h++Cv1YjlWmHzcAqxXRYOqNduIwfPAaU5+tmW6COdgH5idHHgrFJlZeX6/vQcUTwwVCHkmRcnexu6HchhWMS5zHxWhqmdpTDJeCO+E/PYlZUMi+5Sw/l6N5luzVoip/nJFy3wP+HPw9EOu/eek0noKvOFN3PJuYJqa9dZOSUdtipUm4GUXwpvl6lyIqUHbobri5oJQb5oogtt8UHlJZqxT+TlUpw15uFslQb+8K18OD26n16wkNe8i5SVMax5RTtsk7+FMFZlMdGLyNKFXXDJ1FbG/CaBlxo4uRQyW0pcht3eycytWjz+5Cow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(6029001)(4636009)(366004)(1076003)(186003)(38350700002)(38100700002)(6506007)(6666004)(36756003)(2906002)(52116002)(316002)(6512007)(508600001)(66946007)(6486002)(2616005)(66476007)(66556008)(8676002)(4326008)(7416002)(5660300002)(8936002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0adZu0KPYLEw4ky4osbI5L/WYtuu7OfAH4T5yIGJD7lratTJ3nFrBgQFIuaf?=
 =?us-ascii?Q?4Uz1huOMf270Cam6GOzVtmDqUK4AvxSt7SvSGlMX4Ey4ejr/F0Rtgpb9Z9Vc?=
 =?us-ascii?Q?LqZl5rdOvqz8jWlM/wYEJd8E1CTh7VBAMailY/mOltmQ0o2E7DdfPzBVxuhD?=
 =?us-ascii?Q?TmUHX7Ekx8NkScqtgkEpHRxyKT4h37YlidTWQsGHkwaGPl4tvRF83aeoCDqm?=
 =?us-ascii?Q?myGFl6F5rW98SG7f34KXW3tF8m6ZApfJeOyo52kRoXIZXXWyUgO201avbPhK?=
 =?us-ascii?Q?4qyn1LsXNs4gKzLFcB9TZbCxRanHUmBGUh2cKnZAUQ+7H+Ybgp56nP7yM7V4?=
 =?us-ascii?Q?e2mcbE5Wk7s1hBiYW2CgjE5+zzfdXRfqY13jOwLrurXWtt/lyEiDdToau9yK?=
 =?us-ascii?Q?MxWaie+Ps0LCGy9F2MFIP0DgDB65iDDRft22180I5LwOi3xlAQwoy7OPTP8y?=
 =?us-ascii?Q?xzDQh6cSju7HpnMAyeDGX88QMwEcRZ1WIYHKAmbwf6Gqd3ahkR0mSx0tQ8t8?=
 =?us-ascii?Q?6kF5+09gDrVBPQQAP3l1xUtfP5Z0l/H4DxveDT70mfVUNljr7iIa8KwkYufX?=
 =?us-ascii?Q?vB+8KexXcd0BPFO59W2M/Hq+Qh1grH+XJmiV+cBzknZKJuicaK+riVegF8yN?=
 =?us-ascii?Q?xT1Q1BJFO8D03wHC9/WcVhPT4RjlAbdqPkSj/vfPv9hEnGW0zPwtX1Snh8Ot?=
 =?us-ascii?Q?8D/1zFhdx5rXwmY5JfNqCtdrF6qKeTR1CYVPiDkDiO4xhwKjqCVUgTa0rabD?=
 =?us-ascii?Q?oMx+T8OMLms5E8a7FIyrVmFMdGtIq1TpvD+lbMtYEtySi49UBnmGBVdu7Cpm?=
 =?us-ascii?Q?cNlTZMFhpzT2gVQ/ivDB5XIk+NXmjETE2UspomJ45dBlaMZ6qs5fJQ1rS4uY?=
 =?us-ascii?Q?o66RyQV4vwUFyzTJZYcsYucq+3N9jXrp5I7mhxS6zjRcf5/mwvs74xNzu4wG?=
 =?us-ascii?Q?Pzv95fk6D3cvToPE6Lgl8IHSVbdo365fZF5LGKrU7Arq96YXc7LWIdOFdK4i?=
 =?us-ascii?Q?qM9hK2gisSewjXFZAh5gufRmUMQWBBqwAUGTUKHrmzCB6lvAikICKrAF9/bH?=
 =?us-ascii?Q?w5/dFhb66dQMSksjgPumUydF89UqZ90ZO25M8SIN/R90yqvN1TSV60hYuHsH?=
 =?us-ascii?Q?RBl8XPDCDARs8Iqh9FnDz+IDcZoWrJg58pANE/ltZky+KrD8ztDspL5HkwgG?=
 =?us-ascii?Q?c35+T/kGZxVN4iVutRUYiMi+c961D4E5wCNBgqiNv9oU0OO/yLnpTz/hmtyQ?=
 =?us-ascii?Q?s0p5nXjEc9nNUHgeQdo2x7LSME1V3VwourYOYjrWHJz7+OYCpYeDZPesQ8wC?=
 =?us-ascii?Q?JN95zoU8UMAAgf0fxN91KPyRGooKWH4CFE0HhgsHy5mgEYfHT1zjxHLbTCVw?=
 =?us-ascii?Q?xZcgYQFElOMPLK42/fa0XjKajny6D9N2ImLrm0zOBj16yDeWdo0L6bw2Ja30?=
 =?us-ascii?Q?VspbeC8PRZeI7fde6QIIW4NYF9Quv9xjd5EAdTqOhDD5V8CEeTFp4mWdOA2s?=
 =?us-ascii?Q?9dpmEvVTQLVaw/JFRR3YbBNjY2xh+vWsx6yHqRAZduyuJZFKP8kozAkcbBAa?=
 =?us-ascii?Q?quARj6UrJ+sDC78figyj3X0qmGPHjSjIsEBu8nlwYbRqnI/x5lgnKVaQ2u+q?=
 =?us-ascii?Q?9gAfRYZ7n4fe7rcozTzdifOwEDJliH7lfmWZC1ogvitZagTmup9tL1zagUDe?=
 =?us-ascii?Q?QnZLO/0s9Pva37kRy8Z6UqnjN90+5OfK+xAdPkpzFn4kWMSGGot0UmSZ3xRK?=
 =?us-ascii?Q?H1rBIDM55A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea5f6af-5fd9-4598-b888-08da49e439d3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:49:40.1956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pr5YZtpm0J66xLdOn/LRkxlZQneUP1nKvo3M0BOURbRF0F2D7bz4hTiqSS9MxYvzwmxYMdrWhSTOwXKfMcMT/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5280
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* Add Robert's R-b tag.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..033d4e8b838b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6654,6 +6654,16 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX BRIDGE
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
+F:	drivers/gpu/drm/bridge/imx/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.25.1

