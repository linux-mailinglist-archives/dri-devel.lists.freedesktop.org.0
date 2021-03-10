Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C2333972
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C701B6E9E9;
	Wed, 10 Mar 2021 10:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130053.outbound.protection.outlook.com [40.107.13.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110BE6E9E9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etL6pI5u9dqP4MK6RQx4xFmkgBu4iDRCDL7aaJeDmME7r5xDTnzWqlSoy9JRvB/edtTKBGkFwOXz4bETdWyV7/haocxApAvghHaEdMqDI6XGDxwnP3t0wglluqs5UjwP+AifGmjFEPnPMfE7cDzhSV+9ntHyge9t2H+Tzx253Ls2CspToH6FwRiEtmGfmpLxdDhDclmgttZBHYJIZuqGVaN+OQUFs+FXJav7S0RWkPrj4jub0X3ViVFXDawaWGETEIMvK/BUBBRdN+PArNqM+NNwvr5s0r6bKAm4e4aTGon+JqVGoVWgEi9/r6soz644uGJITK+bW+nOKV7Jkqh9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGjn0W3wUOt6y0dvsYlaJYJ1PMZyQiTucziOQrgohLU=;
 b=Jh0ZSTthfokfGV68iACuIbPQiKXugJwSd/97vM0cscP+C2Zf+kE9jkRx4xXA8rKXKZFjO2pH7OYwBZlq9Bf8HKbVvDZxDH8Ipg6D6U+IfbDkECcCArDzPhFJYEK0rZI3D48BVZeGKkv+6+MacI8uT7ek1bYGHVBNnhOJgd6mFGQRgl9Oz/GUC71FE16dYLmsPvYZZpUvXKpzhhXT8eCrOjrqcqbCIgJsF2fW1ZfIPJH6ApdhIjBc3yERcRqxKP4CnzPouzcWnprGXeFY5b4oUp3g4NCkZDs5OxHa9zX+DcohRTygpxLiqhXG8PsEqYYyfRktrAMrCZW4ULbnmp9vDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGjn0W3wUOt6y0dvsYlaJYJ1PMZyQiTucziOQrgohLU=;
 b=Q1CQ0gLyMFJl5cHmcKYRhxZVvdYYMPXz/PZ/VXZz/DTgNwfZrlqftpqK2ZA6w0DnXyrSLdHOUsUPs9IN/QuapYm+RBmMqvKiJtR7Lgs5xbF/Ma847DbWKnE4Eg4LnVxHmI+UkC/6Oc2ZdRkYOx59xIPa3kndlFH+TVZdmLVTQL0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 10:09:10 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:09:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 02/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Wed, 10 Mar 2021 17:55:26 +0800
Message-Id: <1615370138-5673-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:09:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c63e1a8c-267a-4514-6a31-08d8e3ac8c49
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2318788922D1DCE49340AF5998919@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +phHwmGOeSYtlBInHvvM3OW3eu0pfQltIMkeg2PPCzbFUIyu4F94RFTKZfCIpr0yz6HEtv6JFMzyS9Vtuuu4NDJcCZXvb8ICheQYohvgeMUqPfNHUTi6p3HtrUmvTPvWuLCcISjlH3uM8RIzUFqoBrVX9Q0ExbcyONwjDD9FCbUHZ/k+B5Nj6f24CPYDWumJkptq6wfo+sPP7P3TlfSK+0S+0POCF1TN6kZbLGMUWAHNRJ0E0xoKhkrYZI+pXFr4VP5Q/2Yhf1SApHzlklfgOxNZIF44tww84Nf+hpgHpxc/s39TQgFTk1BmXNQcYnehWuAc8UDFakPFjj9z/Gzw3YHHbWDxU7xfp3xWpp63EqkPcRyujQVsxSP+TNyOXT5voSS+X8OuKBmJzF5dsahYNsj52kHrzmu6m2AMhQUcj/9jrNFRpiV5mIsLh80iJLRoTq8TIepuSE+dO8jUc6/VRF/ONjrQHnA8wVWMmGuFCE/vb66SjKGcNF0u1aYSiPz1+vaQTx0trWH/j8ruoNLQkVv0zaRLdYGdEqT0ObobwTtupUaE6QdaFQkiIsPVfZcFZRTHDTafdTy7GJ4XJ3iHqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(6666004)(66476007)(66556008)(8936002)(6512007)(2616005)(36756003)(6506007)(316002)(66946007)(69590400012)(956004)(4326008)(86362001)(16526019)(5660300002)(478600001)(8676002)(2906002)(52116002)(6486002)(186003)(7416002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pp5y/8YiVz2AXQg4xtTx3jzFb/fJa316LsYBibQ5Z/Ot9iF89LSh0QnQMWhy?=
 =?us-ascii?Q?UxP5nibLOPcXusT5EaZES+VsFvkpX1LGV6WESFrN8+GtaA1wzYA8ueIsmrip?=
 =?us-ascii?Q?RxHlOWK/yvC4e/7yz0VSjGTmJQGsBwIHPtGooeTdEAT7kJx+L5GHyQXNFOJB?=
 =?us-ascii?Q?I5gJyKgzmLGONyqsXBfgkfL22Knc3Q6Fa9lNTjRez0qUSgIEXHVmFDMuiRUh?=
 =?us-ascii?Q?qdBTnGr3D49spkx5uXYp3LozgI6rrQWUPQviKkqOphtbpn/C9lWkiTZ4p8Ch?=
 =?us-ascii?Q?IA0qzv+ohpzLNehVQSLi6B9TM9a+ZDe4PRcqLJ//CVauWEYv0M50YUy0CvTc?=
 =?us-ascii?Q?EjSUlPKFBy9vgEqYRFYOfTT8bVQfEucJvbEEac8ORAEhmKqBxikL97ay5eax?=
 =?us-ascii?Q?uBZTDNzVaK92WxsLFdUCV+r0TLKJ9doylv+Cib7cVcX+LB9PohwHjAtA639w?=
 =?us-ascii?Q?Dno8j7dThFHxO1g+g675deViI0aj86SgQG8mZI2E3+cY7KrnmFMHFOJmCQLU?=
 =?us-ascii?Q?f/gCdQJVdVCf8B1ekS7jvld2Bbc8NeOte40kSywYFcHGDIkkId4r92CanlW6?=
 =?us-ascii?Q?xDf/6I5BnfYcfMySAzuh9CJrSTWkVcnsClDMzlCogWRS6/ze6tY4nouNXZ0P?=
 =?us-ascii?Q?Meb1qj4VAbS+qD0xloC2pzOi4AwialCHvP0HDgbMgoaEZsD8owBzXSthK6HW?=
 =?us-ascii?Q?dZ9LsldW0yD6jOX5J0G0KzHylWEO25ZN7Zi9yqbmUfvMERhHsBu9wjszpXGK?=
 =?us-ascii?Q?lZaFujr7Ckrt0PfpW89SeFyIzifn4C1BAlSOzXkZVy1x0WFTJz6bX/szNjJt?=
 =?us-ascii?Q?NiNWYYcJMWkvb+v37RM5KODthgYQqTR3eakRMKZeZ5LDvpp+2MG+LUekOxpk?=
 =?us-ascii?Q?A6sqnp27kny1wQdhlE+i7+jfUL5cGzlycNpKCn+Mi8QXUn0JMJ4Hxt2hZzXZ?=
 =?us-ascii?Q?jxmrB0eAVOjXhYhAY8V6KSggEbBUbWE9GSjMWvyQHeA4uDRMNs77fneuepeB?=
 =?us-ascii?Q?x/CZaYgXBKNpJUBNekNtNRn2tnTq/y1QbeE7UUmSSFopaZ8AwHejcyKFZj4e?=
 =?us-ascii?Q?W5fceysTwMutik8TgdRsriOo2bNMWx40IipegWND4igUU/0B1Lo3XMz7TrxO?=
 =?us-ascii?Q?7F2ME1QVcqcvMSRCFLwfNlTIfCplHTf3p/grgYUEi2huj5OVvwHZXA5Tm8H9?=
 =?us-ascii?Q?Oq7rU+BlOzf48SsNFLGK/KgDL+FeL2YGVRR3aQILPdNwKBp+SD2Q32gqr2EC?=
 =?us-ascii?Q?kvMCMa52YCJDYVhaEXiZtWEMztVkkvg8pIthpJjyViCpI1ZWtyou8ShyDsjv?=
 =?us-ascii?Q?otrR9LFLJ45z0D3tSZNBXheE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63e1a8c-267a-4514-6a31-08d8e3ac8c49
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:09:10.4364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBwrz3UHjSoRLoIfof3Z+onW/9E9OFz1NXJ20/6uW0kKqdObJ/wciIjheuKkziL5whK5iQ2sYHJ2mN2sZRinZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2318
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

This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
pixel combiner.  The RGB pixels with padding low per component are
transmitted on a 30-bit input bus(10-bit per component) from a display
controller or a 36-bit output bus(12-bit per component) to a pixel link.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v5:
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 7f16cbe..201c16d 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -1488,6 +1488,80 @@ The following tables list existing packed RGB formats.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-RGB666-1X30-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB666_1X30-CPADLO
+      - 0x101e
+      -
+      - 0
+      - 0
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+    * .. _MEDIA-BUS-FMT-RGB888-1X30-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB888_1X30-CPADLO
+      - 0x101f
+      -
+      - 0
+      - 0
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
     * .. _MEDIA-BUS-FMT-ARGB888-1X32:
 
       - MEDIA_BUS_FMT_ARGB888_1X32
@@ -1665,6 +1739,88 @@ The following table list existing packed 36bit wide RGB formats.
       - 2
       - 1
       - 0
+    * .. _MEDIA-BUS-FMT-RGB666-1X36-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB666_1X36_CPADLO
+      - 0x1020
+      -
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+    * .. _MEDIA-BUS-FMT-RGB888-1X36-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB888_1X36_CPADLO
+      - 0x1021
+      -
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
     * .. _MEDIA-BUS-FMT-RGB121212-1X36:
 
       - MEDIA_BUS_FMT_RGB121212_1X36
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
