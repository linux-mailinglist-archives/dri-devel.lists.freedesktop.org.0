Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B790031E4AC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A746E9F2;
	Thu, 18 Feb 2021 03:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10087.outbound.protection.outlook.com [40.107.1.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177A36E9F1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuAIJJS75Hm22IH2w382XBqlYDLC2SYqcgh9j2nrsr38wUlUcBmFLlzf38huAECjVS6MDwt1Ja9CjDNOEXtHIhnMw7ZQFnpKkwq6TYGAaaXnU1dE9/ryC7SeHdbFnw093Qw034o3t8uHCFi+nY5d7bWhQ3in1AP6slnJrmSmfGDZPQ4osht2kfgtO2c0u/FE3Lry/6TOZ9sgyvnYuBH3NpTpQMc693dJnTKkVMVqFGEghNwQgz4fGrXnaWc2aF5me+JfjKQCU6RkUtdVRphm/5bRleBWR4XUMxuqLbL4MsamnBCqqZ5WoV4y/M/zdGl8mjJjYzTwV3QWyCS/EyZrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1FAawTRS5//5BJvZYZ0c0B8mPY4+tNQeamXe5zvyTk=;
 b=jNQl2rwSjNYAoVd9NXrjw0EJ6GjnIxFDl7qOq/5rdYIXHBRa2nCQGcWsjFEiO6Vjy6bLM2Gl6u5G5DafWjmMOXq1wiLg/1KbWkZz0zrdQWhblbI2BerUnr3BI4pohYQm/gwb3KxvulBaK+6Gj7IrvfeBzOhPq5aKNzJ/8gsQ6usEDZOskegLcDgadACG0ODR/kXmkzIrKTdp+im9kU7CPIe2ygvKhNE5kW9C/YfIctYDQnbE96bapll//evhWji3TWRm/41qaUSTwi5v46PJJsytVjAcX/nMlFKbH4QCWrC110CqhPJQNPHqViyXXpGUy0vlB4/JeZ7/4nI7ZDxsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1FAawTRS5//5BJvZYZ0c0B8mPY4+tNQeamXe5zvyTk=;
 b=L+qM+EAUkeursmQkI9gy57rDNwMGdEI5Xv53MbB6i5Gm6XtBzyS3H0nH3prRqttmxCa5NKIg51GMcpHHmoLznM9uZ7FQ6+o+ctZbhCPPx7qs174MBXs4d057Yhghq/cM8vb7nNhQg07oIUakzMSOUsDtRxIxQlnQwlps/ex7B/s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5709.eurprd04.prod.outlook.com (2603:10a6:803:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 03:55:32 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:55:32 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 14/14] MAINTAINERS: add maintainer for DRM bridge drivers
 for i.MX SoCs
Date: Thu, 18 Feb 2021 11:41:55 +0800
Message-Id: <1613619715-28785-15-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:55:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe0dd624-7f5e-4dfb-670e-08d8d3c109b7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5709:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5709A053062AB1F9DC2C48E098859@VI1PR04MB5709.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntflbRiHFVok3O8faSADbQNDOogmfVcu0xzU9spsqLYX/vAyYkfxjdQ1/FTlySEpXTLTJl7aEJUX2o4qdmB851RmxK+5N0fTlcYSVXS6PmnobCdZS6W6MI4VrAujZqu7GRihV8TQAhK6EYx8Cy1L+7GUuldlSy/uHd+DI6MH7/7CFabpswWS4kGbCa7Y9+Y+Y86L3DXud9C1vv1/OXKw9QthQRTb8I0pIxm8ORe5hrSpc/1UA6wQyl+Akfb/4Sa7VmU1015x1LQTqiYRH43p1cczfCw3JD0fzwNiUzNtzRtkj5zt6BbWil3zEG1HVxJ1/1swBQgYhjfStQkaoDl+MsAM1SfJT3K/RoYeJk/Z0D4DhwfuL+54on3lRTdIS441JiVeNdEhkTkrfgaco8lYtcSEj4pYMdYim7vCdOdFkN9HaJbjDUfKaU0RxCX4GeXfdff2ZFHjHmS7YiboowT3X3qpYAr8ZHNek8HSOYjALQlhUicAQ36sbpJWHj7cxl3TWnmpFduiVUCdZXrlbEBFmm0FYDJAhsnCf3qP3HseTaaEHbw5cbzM1fFimTP69VJ4L4xZxkeyyipuSs+j7sG4FA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(7416002)(956004)(2616005)(6666004)(52116002)(5660300002)(316002)(6506007)(2906002)(66946007)(6486002)(6512007)(66556008)(186003)(16526019)(26005)(66476007)(69590400012)(86362001)(478600001)(36756003)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l8oTLrGoQq2MaEiCCA2JL7tK9dAlIeBsRY2g3SPd1/Yp/lMXY9EdYcsNUGMq?=
 =?us-ascii?Q?2maC6Y8Db+gmSKkI7w1PGJ2JQP4In2IRkWaC1tMGiQKIVnhjfZbdZVyj1M6M?=
 =?us-ascii?Q?0b7VAvUgYaMtLI60Jai8wTsB0z8w9wAAtT0mhkNuxUceK9HsC6a3fZPZ2PK3?=
 =?us-ascii?Q?FgCxoM8Tw3ZZwp41knSppB2j2kT/jkgcgKina6tbTgnPVVpU3EI4ZKTYjlzK?=
 =?us-ascii?Q?wjYeP7Zb+r4IFBNh67xN38RJXsHlPKcw3OpfSJmFy+QTm2GPKZfROAWAKOAM?=
 =?us-ascii?Q?5DgIyhqjJuGOadCf9LwuHzPKsNRQEcmaLElO8AiM59iZxPQeSyZKMKPdTVxG?=
 =?us-ascii?Q?tzDbwu6xDqQBu+MiiY79DO6OHbyN3ALBRlb9O/hzVgpEGS3dMIQwOtZvh0v5?=
 =?us-ascii?Q?AoU3TD1UdNfyR2EK1xCkFL33rKohadxI8nf4UMTl8mc4JjDRETHbL2LvzHyS?=
 =?us-ascii?Q?VaM+v+WxP6/FZrPWTyEytLJ7Ouxs9iWQCuxS8H5R3yCT0J8LoVlksJ1jhfP2?=
 =?us-ascii?Q?oXyVEcu6o/WhxpNkoQipNYtjAwdQ2JwWAZPO+Q6+S0bPyke/H0o3LRFo6c7Q?=
 =?us-ascii?Q?w6Lpxmd91Q4565JPyteII8Mg+ujfQinGT3uPo5dkTvdzshAnZwcWZPBKdZ+d?=
 =?us-ascii?Q?VhiTJfar5Zx2wI9WcsKx46BtVrf+2lTo0H3qZ3GszC92P0F70DzLCbOEsTWx?=
 =?us-ascii?Q?/swX30BlPleTtG/ugQkwphs+Kl//VKBrLZHokydL9DAFnzP4QB7Vv8lyW1cm?=
 =?us-ascii?Q?CV9YTrq9pQpr7wiYfWgoFtEMYUC835xNQoG3EQSWRSBKFRpps+Y4kT1bfql9?=
 =?us-ascii?Q?SFVbGE4VsSb66jbfnPMc0yu7zA/N71ACfcr2QIpq9CPPxaC6n9H85VAfLqV7?=
 =?us-ascii?Q?IR6Z9C27n5XkQGn9IxIlAYZMwJzQ9Szu3zaGmyXnmJrAMQn1k3Rj/6o9WBw/?=
 =?us-ascii?Q?7b2bqKYeVBmwA/1BZiBqrJ4LzpGatAd43/nH/vskWpOF7MAGR2Y1eDGvD31F?=
 =?us-ascii?Q?/9j/p8R7mjo4xzICH9Byvu2ruoAH1T6hGXw4XTXE7xsd23Ed32uKl9E2TBmL?=
 =?us-ascii?Q?lwOgORVFhj1AzJPsR/+f/IALj4AsdsLWAop4ydVhylbegvvGmxIJEDhBdtLm?=
 =?us-ascii?Q?JAsuXbKjumQ6mRu+uH7KroV9LVSXm4/rAp0gCou9LMe6fu1KJvzHBC7pxJm8?=
 =?us-ascii?Q?pjHvgCQp7/SDv2mVLuwvCgNhBmBqgaqXUL5Wod1HmtOBorh7k3T20vBmwdV+?=
 =?us-ascii?Q?uHqWp57xQBHpbaOoEYujZpz1sl1ckhDHjElOBRdDtZ/jbSVIXqA9B++8OFkl?=
 =?us-ascii?Q?XfmBQDfZQOjv7OjA81fjLFTY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0dd624-7f5e-4dfb-670e-08d8d3c109b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:55:32.1746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vRJfo0iicJ6OZYeU9HG4oH0AK/n5n2DRCAp6mvfGR7Yn0LbndGDuZmOxrRcvsMnIyc0RUHhhZbM6bkK1aNRQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5709
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

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d241b8..d96c917 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5892,6 +5892,16 @@ F:	Documentation/devicetree/bindings/display/imx/
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
