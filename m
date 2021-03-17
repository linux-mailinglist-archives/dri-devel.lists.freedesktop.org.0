Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3728633E7ED
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CF56E0C5;
	Wed, 17 Mar 2021 03:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2EB6E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdtcZU2U0tfthlgF7GTTv8G4jfICLJW/6q4pSA46EIIoG0sOcoAgnQv+Q5eg6mztCOiIeKQMwS/SVA32/HHRbSpJFryunq+2kFvqSdFW7OZO+leg7n+JTy4c4peDFLqjdLLvI9es8Q7DNW7eAgy1o2zMuR+a3vz+Y0CeG38lu13mbXxYzRHwpasKkUVRd66lXdW296EmlSmar5I7gHLmP0wjQF65JWo/NIeiysDbtKQDPpd1rXwCCkTErY6LQd3NPks/rfAoa+7rAnWW7k8YYTDfzUZ6SppEYaOwLKf2J56JkBs+vHOJWI82WFKEjeKX7mAjOOq9mY1fO9zmshvXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTblj47XDiM8RhiLf0oxGWcs1MrldZv/sUQ8Wh2ZSsQ=;
 b=RGrPjdzquxN9sbqny3inLbn0/9XuKrH3rk9zIXcnUjVW7XBo4oJpPSGNSPTEuPVBIJG4VykARr+F782fFCuKEiXquW5z2B7zg20yiXuBouIJGrHq+aqkgh7RA1JGfxjqRYKmn5FS4vDMxtQiF3cY4GagamqqhRBmPmzluxUQ2d0acwI/lcQrGm8TXlW1Cf0LTZAZLLbC5xYztRQ2hd+TkdcQdY2b+jHvB3kB6hCc9OZZ1yhA14sPpClbL6/ZA5MeeSaFmXGmOIVqsESNQYsvwqWTitTzn4tQJOy5a0wFtzr3gxZe55czZipMBNAztuPJLku/H96ngGy0e2xpRh9eoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTblj47XDiM8RhiLf0oxGWcs1MrldZv/sUQ8Wh2ZSsQ=;
 b=ZGfgeA5eeJnv6/aqjCqy2+LuZ0wbzBcxyDLLZ9KdeckaCel6NC8s2gopIqqLZgzMQRFRXeTL7CrtF/sMpj9e9g04h8pAe2aZVzWlLn/RQC1+8Cug/k2KV0xqiki0S+k0qkP/kwQR1cGhVzQw/w7NqBvsgIIOLeWr07lKFPWFMus=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:56:29 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:56:29 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 02/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Wed, 17 Mar 2021 11:42:37 +0800
Message-Id: <1615952569-4711-3-git-send-email-victor.liu@nxp.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:56:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 59993908-4a37-44d6-2881-08d8e8f8a51b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB61411D5D586695EBE7708DB7986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nu9bnRP81aeZb7GLk78RYifedTsL2x++FYYgif4CVsH03NIgmDPwx7WJqGX13XfttFkdAJ96aDp3JcUTCscHHwkOL8bledmWr13hfDNv4qCRiYttz6t7+8ofVSUfBvYHiDF9SVYf8n5hGqgLani4Rej0dp/oP8UELKIOtzyMAzkAyQ6PUl8b4oKCxcWomwwPV7vxq+anTjjQh1OIO/j97vb5JY/Tcn1vhU9Yz6/fy5uAkeOGYd81Z4nUrhv/9czARkYUKm2sY79U1WCpakY5nXGAx42QHbK+QQqv3PH5CukR9uSsSEYPDRdHVUvgtMcw9N+5lp6ad1kfh4oRP1vmScg79dtr5Ibf7mGJx+5lEFAgIr/Jt8VLrdJvaoOAYEUW7GR/h1xq9AICv+kscB3ZaMEvnVQu58xqSD7CEAX1NkrR+d4lyGyzWsC/ZTgDJoiz2/hUi7OywvTdBdwTCqT2e2z7uGlXacX5XDCA/j5FvSmx0GgG/Mtz0Eto0uyznBOZi/51ICDxMMqmLMyAaoS0rgRbFdbN4anQCezA9mU9VirR/3tz8e5n1c34+6SHi548g73z8Hej/01cwIOkqqHXut+B1VM5UZC1sFOdkeJMQut6hJwyBdvnBo9l09N/ri1f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(69590400012)(4326008)(956004)(2616005)(2906002)(52116002)(6486002)(6512007)(6666004)(478600001)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?92rwX29U0nE+9zxl70Nl0PgVnzlz0mWSa1qWqXyNKLKwosSNwTWezBVXW6iL?=
 =?us-ascii?Q?KnvOBU5+vwuF1qNJWsCNKLVUK/Z832c3j75YYCsF+dSqDu4bNrCoS/5MBjae?=
 =?us-ascii?Q?PGpBkD5pGL96+DA9H3//Ir/PW11eTbJ7ZYcqJRH33vWwyd7Y4UlW7RzyaFJ5?=
 =?us-ascii?Q?xiO8HpKKg/fwyGS9xAsa2Nm2B5hJpYMKaPUh4tj8516TmfTWBxFk9zadjVIS?=
 =?us-ascii?Q?rYD9qqtXCbFhvlMt5/wK5KrBMbvXyZOiXDBQyQCKJelGCV8xGr+xH1G23Ge5?=
 =?us-ascii?Q?YcmjSKdHbbTwIF+5gf1sSZ4abvjI1Tv1nmwE6OOMAo04TLgRpZoofmCK94xL?=
 =?us-ascii?Q?PlOEhq0Gj74tjdkCERi5cMTm2erm8XGDXmEHOPcC+sczHOgPQotMrjRgkFi2?=
 =?us-ascii?Q?puPy/2yn1Pgz+MPIZFxqdATDipk+q+XdXspEAunI6IgOHUklXElYBMfDzmZN?=
 =?us-ascii?Q?vSz1W4ZdDsC4A3j8/YXiXte8K8IRGEtCSqbtJ66kYIHApZJPKvuCmVnlJqG0?=
 =?us-ascii?Q?+5T7LIUMN5xNGvrcJA85+JzwGBZwcFURFpMFj1f7qZvk9dGGiLo+wRQ60N8M?=
 =?us-ascii?Q?r2dR3hyPNy77C02xq69i5hJ8UcDBLsEtkUPlVb7LdAhK1SQeeujPI7JQrjO8?=
 =?us-ascii?Q?W9w4r0WgE9bOMUOcXvJZ7sLUvA8CsQYOJoos4efyvLT2iYdH+hn0IJk+8wsR?=
 =?us-ascii?Q?XrsR6wQ2gDNOmT6gg8G79KL5gi24lraqoMU6lpAJ1hpJsiPqR45l+MUIYNo1?=
 =?us-ascii?Q?bcPvQCCCmeKmKjxGy4vMJreqIowu85lyR+Qp2+LHYKkkEvvK34rxFAwOr6mC?=
 =?us-ascii?Q?8U7Pi0PYZs1cx8bD6T4rzE47/IGYredrordIWFRvGhCUgCdj5puiAhSgzbpT?=
 =?us-ascii?Q?5iP8oOpjQoJYSecYQVgfGH0JqvLWAwaG/FfJAGCUGRDEWs5YsDwzrmP8rVOk?=
 =?us-ascii?Q?Mh2pPE4/jyPYejD+dTA+CsuFGIjR2DVSV41nDD4yMIcwd9rGDX0cENX8GXy1?=
 =?us-ascii?Q?gCfm4D7wmkUxlwldTkVHKlcKLDqiND6nyJ1HVCtJmUbcCc4oWZNO0jywyhyr?=
 =?us-ascii?Q?2DsYN9i5oe2PF1ypWsCpAHfVwXcRXOKnP7SKZpM9HDrUaztO0gKc9+CjDJWZ?=
 =?us-ascii?Q?Wd0cLMUwhFliXs3pHXVbkrpofBMwEr69LmrHk58r1FsRLKCv9Dv1WripIFUI?=
 =?us-ascii?Q?Dok14j9c1PX3hbVDYTL1y/09rjL6V7fv3rH8k5dAxRGCABRonKG7NnkgHFYn?=
 =?us-ascii?Q?0epbzUkrgLwX6EzU1TBrsRhcT0n4RN/+OXFicXNLqCLmKETd8FH3foM/f4LS?=
 =?us-ascii?Q?03LzAxntroOC9KMCe3r9jIUQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59993908-4a37-44d6-2881-08d8e8f8a51b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:56:29.4547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TuX+Lwv6Np+E2v7QT5zKpY8X2MjIWZP4cxqPZZZar2rW1d4sSkiwZufxaM25ydWLGDZwS3w1FOYbvBCJNIeEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Robert, I keep your R-b tag from v5. Let me know if you want me to drop it, as
v6 contains a fix.

v5->v6:
* Fix data organizations of MEDIA_BUS_FMT_RGB{666,888}_1X30-CPADLO. (Laurent)
* Add Laurent's R-b tag.

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
index 7f16cbe..1402e18 100644
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
+      -
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
+      -
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
