Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE4133E809
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0136E4C7;
	Wed, 17 Mar 2021 03:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80058.outbound.protection.outlook.com [40.107.8.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C756E4C7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcpPu+kRim028pyfTJEo78nZqCD6VDBSPwCdwEdF7K2S3IZESWPqRmhkKiUFfLZjuhB5qPcIK1gGApx/D4yqeRZ6j7ge3D6s8t3HTX/9oXh/g8D/QuLUsQnxoMx0COHvGECnZRaX9V08eVqO0Cbs7YwjfNokxYm5FmgEUvL8/cAE+1Fv1vgfv0Ft9p9sNTLhGUt6NtYqUVwoseeFbqAbcAJZqYO74ZHY5CA6zQveBTrEIZqNuqUPNW/TakvqD0dvw+Nn/8l+mvb2mzeJ8BhBgEz7BG84u2CgV6zyxbMZtyzivnmH5QIvJZjDjVqB2+npFMLhG4n2v3kNrMPnUvAycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2gKC906WdIFlqRL+Z34rwX/zHZ0DcNJIZ2s7eZMXT8=;
 b=QIYq2ivnvDik4YastI6W++pzhK508Pnn//sgwVg/OjnJV5NynKnbyMWa0pEYvTNsjIpEVprW+YfzvfJezoqChjkvL6pOfyPERJU7fR1yeFdt2jJfKk5id0ClonJqgCMKWukw91UbjWCdI3DP9XJ8ETuXe9byzW22NUx+aGc9XMlYX/ElYuv+GhsBJics+YJxzpc9fdI3YFmJjEANZHJOsMiyseA7573FzOAdZ8yqM7MNG1srs/RknO5UeNyAQ0ceOy0wI5QfFNa+cAulxKuHC5pAL8vON5iig7/EZuaQXBQC9A5t5Q+TL4+ZfzlisZVR0iS+4vIkcB4DyH+F3N1QcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2gKC906WdIFlqRL+Z34rwX/zHZ0DcNJIZ2s7eZMXT8=;
 b=J/PIW7zkhXFYFjAZYauj4cijNWX4udtZa86vEhrIU4Xzr2fOJOzjXd3XSINP5OrgV6gB44J5dfLTXdVTRjqadIUMFVD5IZBRqsjDjshVa20ueFalR+cJS9xSBUccObMXnx+jtKirhF2awIPdixV7FHPRe4Y8Yo5mbyK5kGVk9AA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6991.eurprd04.prod.outlook.com (2603:10a6:803:12d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 03:57:45 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:57:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 14/14] MAINTAINERS: add maintainer for DRM bridge drivers
 for i.MX SoCs
Date: Wed, 17 Mar 2021 11:42:49 +0800
Message-Id: <1615952569-4711-15-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:57:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5388acd9-247e-476c-e007-08d8e8f8d267
X-MS-TrafficTypeDiagnostic: VI1PR04MB6991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB699178A7E9F0562B35976EF0986A9@VI1PR04MB6991.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NyzELOxnSZCDF1Z9e4lkqbEbQBGHRNaAqZOEurhBXKfNY92PgLK2ktsO1iF/HnyGL+6w8Kn4aZKXXg5R4NIfGAQc+qy/8GFhAZ88H11YYdL1KEIdittulUa+nJBJRIdOLkTPCWlCPw1asgNuw2rU2PUewci2ylIed0aTkkXhuT/SgZXaJcxQTdk+fLnqK/azZ+OfTlzRbfl1WGa9KchZgeqtkHdNSUAtJBxHm38T0LyngcL6K8uWj607tLKMJYnWmRtv5T3T1fO4eDyUazCyHcNYm7IGA6/WeaJsFQi3DBOGbncAtQhEDDTtCUv4D7bSELEgTYDOSTitICUiUAfs/LszPDyvGoc074Psub3nyIGNUIFbhEkVGHxdov8/YmfHTsnXMhcLJ19HzUjRLusqXTlHyx8W0UqS/KIbnixtxQrXoL15d5VYtSmv6EGHJjhFdVyQkgLO4oWwxWv3JCHyekDMVWK+LpS/ozBnZgZWOWLgW0vyJNWV2QFZUq4egA3oB+2vbJpLgj/RiVcOM49Pzm3xznqwlxO7f+IScJVHdv6h7/hD2E8VOBe9W5gZOO31bdikReq5bO8H1QsF8/h0omTYRw8d2axIGIbjO90agiX56oKLboiOfg5mRhorPFyq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(6506007)(36756003)(2616005)(6512007)(86362001)(6486002)(478600001)(69590400012)(52116002)(186003)(66556008)(66946007)(4326008)(66476007)(6666004)(8676002)(956004)(5660300002)(316002)(26005)(2906002)(16526019)(8936002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HSu9/ITuoAcsHmVUVoY8JrfsRjkvShvJtu2XaTIjL9ezq7zYK2GjM9ujd78X?=
 =?us-ascii?Q?lHoWvE15UfLuYMhpMrVH5w6Ov3QghQGv6rAR3dRLkOjVHIZ0NRaoIW3T0/Z7?=
 =?us-ascii?Q?es3WiFQ5UtYvF0s7xLnRM9fbgCwO2Vlu7SgPpriGG9hiMDCKXuK+6zFlO0ZJ?=
 =?us-ascii?Q?+IHb6/S63DEmXSPXMiYfiw14idj+dUPNucU18mYyOQEEXZf3CLrxCalHWRxe?=
 =?us-ascii?Q?psONsX64XzEnYTHGbfDepE5XmeZiQVq+qYIhLQI9TTJUppATpzXW5Kkz+gfD?=
 =?us-ascii?Q?EmlPRy4Rmx89obefTUHq/FsoBSWctN/ibZqck2r22tCrlrHllnOUa1C2mUf0?=
 =?us-ascii?Q?Aqp0MJunKZHH9Kmvmp8V5SWnxqV6sqj73gS11tG9ykR32A57OlL+oXYEkrAf?=
 =?us-ascii?Q?02GJwLe5pA3QM9kBGlGt/KKSnbsP1+JadUOtQahyfXWeR0c2tOfLIcOdNz+j?=
 =?us-ascii?Q?XSVNs2/KhEIr6+3X2wCvS0iO17AGcMfVVSvCIDpzYFBiZktfiM5Fa8MDOTCS?=
 =?us-ascii?Q?Bw/Qtdb4x0nCUd96OIIWDYF2pT52hRol5pbhRqKyF5nIbvmL+XJ8qiAtFreS?=
 =?us-ascii?Q?bAY404lXeY75o//mheQV7PeiTW5v7ipp+JZ/GbgASbv21jtdPZIE6h4l1GXm?=
 =?us-ascii?Q?3gIuELfriaG2XWnrrcY9+7drdUzjTe1dYG0pBy0u/FhQ+FX+CPfFhtsRjHTT?=
 =?us-ascii?Q?NvQqncoPk4YYaFFmfrLTlhbTqeOLVaUzHQ4/ntxxQnH93jSpsJFJxUO/aTWW?=
 =?us-ascii?Q?6S97/wPPsApodLHwDRfhrF9mcutp4vyjHfrhXm1pE5k1Msze01B7EVkHPwxH?=
 =?us-ascii?Q?+c2ssm4ahKUB0j0TtjmVMe2WcAaqIp+LkIlGL+GywU/q7eBzwxEudAdjuoZ1?=
 =?us-ascii?Q?+BCCnkaq98/0FgiiIFEGIVa2D/Z8JCqA6r6Nx8888efGJxBgRpeGHwjZQNsd?=
 =?us-ascii?Q?9AxeHzkuntgmuG67KrWP/vjPUgCuYf5pBuGZ//75c3Ibf3D3WiVuOZOE0zcp?=
 =?us-ascii?Q?YQIiU1oKj/nd7qmyOnxsz4QpTPfz+QdrioVDzEHJrR2oMFl+NL5Ayj5fG9Md?=
 =?us-ascii?Q?jvHj7AWkKRI3nNKLUjjJyR0eZ5pT6T6Ld5gxF91/LO74a5ROp7SyCqo00Pvt?=
 =?us-ascii?Q?GAoTLC+IiB5CHr+fRpWEli0jk6/4dRODG8kg7SOFg0KDPdRtHX1PihfCm0Mu?=
 =?us-ascii?Q?WYuRJ+mu9i6jK7LbAbwa5oAqyPX8sD34msw6IJZhQ+Xz3oyd+Jf0vSjXu+I7?=
 =?us-ascii?Q?0/9rRnPAKnIagLwJwwwxWFhXzOGFIQ74HmE50Uv+GRsl0cV7yf5QrhfCeOUK?=
 =?us-ascii?Q?fg5+D4TzOwh6mM6gvPcF2j6E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5388acd9-247e-476c-e007-08d8e8f8d267
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:57:45.6479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCiHarbLOlIbrzWMSR3MzdV4XIGNbHJ6peO1PlG0YSvCkLrq4blmBa5TNcyMOPoGKAd87k1BaJlxOtKiKz0/og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6991
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
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
index 4b705ba..488e0ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5939,6 +5939,16 @@ F:	Documentation/devicetree/bindings/display/imx/
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
