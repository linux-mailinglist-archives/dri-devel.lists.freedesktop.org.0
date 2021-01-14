Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C20522F74B9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B516E1D3;
	Fri, 15 Jan 2021 08:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E6F6E174
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwvLy91fvOIc1A2S1z+XTvKS55Jw7otC12w+V/XuGhCHuRqI0cAZAyzq7JLXVcAu7Y5kZQuLtJma54cw29UQzxKiFMPDSAaHB6xbyff46H6sU3M7AL1pn2Vo8ai/rSUBPRGFEbVqunXQn7ut6vXl7gKDk7DFMpQ57PPxkibqxQGEaAbvh6qEzfiEP87+dL+wCVVwkHyoUPb2xuMVqTbYRshPWf1TEY21Xz/JCrFDpaM9OabJjGAOrSM4egHjt/vcBoSrKVkyGjtbYlg90/heHWFagZIeed+yN6OmYZsPQwIMPqh4E3ANesrVlEa7Ps3sV1zfM67CY0g3MzKoY1aKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPGwZZSneUfhDGZOeYNPLrTJdq7r/2K0LdPZzQLAvg8=;
 b=PeI7A6/RTmdEmBNN0uF7Gl/tPSgtWzOpe2aZBP/dP8i0lCFJenxRaI5C1CO5j8SMq6mYoFoyZh1Oe5PW2TS48QfHh+QMhnJclfVmzsHIUBHQ6vr8vWx3sft/3Cr9tyL7H2RnoMvYOWHCwDgm1gKKwK4sOAQX0xSqDXarTbrhVQlqH4E/0ezTLjeEu0TzHdlLcRLWft83cTADK3lD/x8IkkcYsJPvoY/kYEysc/5xYGQSoUx/3tzGdDlH80rcZkCW1LRr5hfDwRVS+y9RC2/Ph/yO9a2xAEoTsqA/Yr8kYHacPvPX5h+JYCwqMHil4pH6LyOFuQiLIM9sl8AurVcjGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPGwZZSneUfhDGZOeYNPLrTJdq7r/2K0LdPZzQLAvg8=;
 b=iGYpiu5lGOiW/vNf/51pUGv5Ilz+wb5zfgElFRKf4Cy2KPHTv25x9EHHJtUKHGnOKGhcEECcuixv+slApT+jbHyUUy4ejukZpq9UpaKucbr1IsSMH2zzqSiWUNP6pKJW4ZV87bcm9cWoMNjCnAE+JmbfRwQ/xkGlnesk1XJ4eCs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:33:57 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:33:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 14/14] MAINTAINERS: add maintainer for DRM bridge drivers
 for i.MX SoCs
Date: Thu, 14 Jan 2021 17:22:12 +0800
Message-Id: <1610616132-8220-15-git-send-email-victor.liu@nxp.com>
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
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:33:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 911eb7ed-3499-43ad-e742-08d8b86f8451
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB571003EDE0BF363CED1D9C6398A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e5KT5FHDF0hUvFRJkZORUegpjQqsEcMEGq8cGIJuTnwMas1v3v+WPJt+0841VjFx8gGCGVMpsXby9EEfUzDl194Y+NiCpDixm7LYoTG/ClUL6Lf5qRgnT8/uYqf7Ja6Xw4hP1thy11ST/q1WYSj20texafwQNMBJJMcE6PUNlaxeDuEhkziOZXzSY/zV5Aj8bFoQRY0sS6QNSrpCvIkVvaU/TDj4yFiD70j3Am0McJQ4aXDnKCjbtUn55Won05wDiX/6Y6D0e4MsrsqDWpZ1xfZZsOQ6su45JVcQmy5aA1wjtREppacujREI6EE8azwBLQXSQHp/hQDpPtHVxNmnqSAXYChqS/TdmYVvW1DE7uWMpIydmCSKh8gkPdtGCZIVSUkb4/xwX4Z8Zt1K10X5tK1ewibFInGhgZW3xmRSG9s4galLZaiJyq8qjmFVwjfJBTLvND9RjLPkz9MVCCBsEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(6666004)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(2616005)(7416002)(86362001)(4326008)(316002)(5660300002)(186003)(52116002)(2906002)(66946007)(69590400011)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NagFmmdJOOZFJSJyFruvSRZOC2ojITp7tCNbLJ+G2IpMsd0d3IAHh0mXUdNx?=
 =?us-ascii?Q?KZyqN368Y9aLeGdiOHaj2NsoXSYa4BgYzy+wrtVxbWw33Uo4f6+tp4IXvt2w?=
 =?us-ascii?Q?i4HquL9LSfGaMZ4gV+ahMmlEZdswdhFhcOCiofF9xPCuiRzVpbeTv3hhrISE?=
 =?us-ascii?Q?QMPofjRJeRpIdfX8CLox7IOK3OfgUTUOFn+3+9vKToilTmARqgXQ6lRoXoXP?=
 =?us-ascii?Q?I44aDZ3rpZW+YDtWqjv2CzGmI/O4c4a1GtzMXw27Es1y3ryDyAjyG+Q3XUUH?=
 =?us-ascii?Q?/1n8ya6mGjsqVrA2ohu6qZ9iBhg5jhRWOkO8cxaIeDxNp1KGkytj8U2BXgzQ?=
 =?us-ascii?Q?3kfRPPjdh3QQ5mq3B3zOXIMqr7u7gCzADXFKgInk39fIMxgY74DhSYjs3V6y?=
 =?us-ascii?Q?3I1xWPs2Or7sIlCiN3dkDG1Osx4mnvpx2heZadFtN/MCJsQlBk7nBT69NM29?=
 =?us-ascii?Q?X7INbnytSKKewNVG6LE5jYkrP6oMQpTGy1PJBGB/mBI5DxvfdCMSnNMhvoRW?=
 =?us-ascii?Q?3FcNZf10/v9qEojHgV/ReTOi8w2ZhwVr9i6vN3EfSjrvJodYyFl5tc2tifk4?=
 =?us-ascii?Q?ccKfPsO3QsF+nkCWQldQqrNuV7MNxp/GZweA5q/O08KYDMqIlMxy+l5ZFZUO?=
 =?us-ascii?Q?zYB3L/aTurPcNNlhqaCSZ3Q2Us6vX4uUSsEzShKuSzsZBZWR7J+ftaoKnT3d?=
 =?us-ascii?Q?OJIuShuwl7l9hcwjVDJtoVMnx2bvXTlqxjoRmPkjwck3Tqb6XcWzLBmM974n?=
 =?us-ascii?Q?23bz1YHhVJFpWK5+DLt12rJR0BdqOevUN1a3XO7oIDSZvuVc2tamCNDCIRbc?=
 =?us-ascii?Q?a9F1sc2wW8TTMp8DEl/MZdgnFEbZkN9SwbIObIZxLrn6Z9lQB4fzNMiINt4s?=
 =?us-ascii?Q?XuHPV1dHgJJuALMZ6T6/S+gduaRlwATeJtGLseRQ6dRZBwxpUXLJu7Mv0J01?=
 =?us-ascii?Q?trLK1MzukdEHe/gng3chpQAZrv0jhWlE1P7CBkU1FKE236N38XIeDi1tOWOm?=
 =?us-ascii?Q?3VyL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:33:57.2226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 911eb7ed-3499-43ad-e742-08d8b86f8451
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEQUQtNkPMlVu4MavPZcrboeOsFjbnInlBsdMZNoY7RBbj2jcnvR7tCxjfKWN4pp+reztbvl9PjnCkypvnWgmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5710
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

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 389abcf..539dc58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5891,6 +5891,16 @@ F:	Documentation/devicetree/bindings/display/imx/
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
