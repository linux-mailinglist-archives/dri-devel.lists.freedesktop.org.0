Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9E31E49F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B846E2A3;
	Thu, 18 Feb 2021 03:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3A56E817
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSF2IP95iGjE7hfLpJuW5+Jh+hlScrFwlr/9jIv1jl7F1c0VL9VguDllHgwqLqqqD4A/Gj1qXQQSiY2iYEZ9kIiNe0vaL+oFT3gdDX5tycojZzdpRvutBDWuAHVSsOR+OKj6K3fzCaA52ZZv302+QrQUx8D7EKW8ujN6Yvlh53B0L5PVJQahFvY1N7TwpBemkYZxIe8eVnCZU9nGrfTwet2GqVEEvoxODOvfot1N81EDModx0JUs+G9M+K5eevZCAf2zQY8Ddi495J3t5xWSpelclRL8bRtj4SwTb0TMPGdShmUFWurzX9fUxkex7Js4YkwN94cg5c9X+wMSGOc/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBLpnyQXozBOiZ3w6WWKHGZZIWO3RE9c38VTBvFtUmI=;
 b=eNHiK4YhepW5TX/lqc+BUUU7CVhVtbCWO87dtHpEVM1iGSFIOnh0klsGMBvkO1UnXvM16NaQPPyt1fW1vqyN261Kwf/cTPKMpCq00FU55vlQGZFTYyyOJ5VspExxM6VofCidNpETDub3b1oLfRXeQ9ZxuWpALdc4vR5wqL2ErxjsjDBmCEWVu/KALyhEbl5G9IwqbIst1k2vSAUTBSyBLLUWByacC4CnH/UHPvNDYMP10Zl6C8iVizzlcLVSoDDgnDbvxTKARhWS1srIpwjXi8W8YNaE9joz7zl2OpqxQfzRnm5M3dwMUfoaB2dT/cbKM1JJ69rwWp+kmuwjMf67mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBLpnyQXozBOiZ3w6WWKHGZZIWO3RE9c38VTBvFtUmI=;
 b=qCfZXxv9n8+Wuz8Ug9az86pKwmkQiJr8axx3ozO74XYLpzaaViYWc4Mz9wfj4bcDmZGQaF3c1XkMkVX1NeH+606pW0O4KhuM1OozgZvQw73TeSxsHAfL+gDsT3S1QTvfFoTopsKFEM5htUgsUHClHJV532GYdcWSWs7b3Qr8nww=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:23 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 03/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Thu, 18 Feb 2021 11:41:44 +0800
Message-Id: <1613619715-28785-4-git-send-email-victor.liu@nxp.com>
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
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:54:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 010bd0e3-9c5f-40a5-3b5f-08d8d3c0e0cd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3421ACEAC1E1575D9937CB3698859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuFSelYJPFWZ+Ksn69fI0LE0l8LRx2xydLj2/35CMjzg59npo1SVGxXyg5T+OEJONuQmsFn3/fpCVcWjhB550yeU3dHaCDFjmKbzpYf+K3qpalz7CmRwPtE1CwXE6dHn7e6FOsUjRcsABybXcPJO1h2ZBnAm0UVBrGwBZRekfz+BH6iXZSkUrVctiN7khXuYogPa1Dryb5AlcXrSbjprHYmJSpeu7CqD0AsfhAEG1nnGKCO2Y4FBhbWMTPYPhpsYyCv55ascK9wHP0aKZ2gHm/IpJPgo4bR8VjmhGDJzsTdf470W2CYTuv4Bvsmjm/GLqKBYAqnqptHhIFSxQod7f82XStVbGqv8AOdAwYln0TKDXavm6sNCUL/nyqsMvKfXWmvbwTvU6LnAKspmCwujaVWofTfG4aQ4u/k75bjQXJd6KC7QXma7nxFzmmui3luiVi0fZ1fH7kmuAEj2St7VEQVYNjO9F9phiv9m4Q4VC51oA0aatgsGdPtuKbOIYVB8HZhBNrRCnmK4Wq9KCL80WfkuUxDTUGpwq77n6iBlKLDHfdm5hsVAwCO4jGSEQNIreyXQCico2zaFFF9Zl7dl0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(52116002)(478600001)(86362001)(5660300002)(6666004)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YLEz25wpKrbbB19z8/aFp7FrA7PF5dgr9wS1hq+JR9Z3BykvsRpRI3YdYidV?=
 =?us-ascii?Q?zL3rS/kULhT9alrJ/Fm2VGf8QFLFDQyAX7H/XHdWNTk7w7i3zKDf2TLolRK4?=
 =?us-ascii?Q?jAqVOxkKFeeL74IPA65pnzbRgUaTCPYGOvu4NCUlX8hurTkTJHUwO/J3Zesr?=
 =?us-ascii?Q?NplqwZ5m4oQzbjQ6VwtANnVfh5YZn3+P/v5EbjuT9QTHOy2eJCm7T9Bj1LjN?=
 =?us-ascii?Q?IANIihrrbJZtwQ78h6yKpVxa/CS24yOHDTQ08tLLQAyFAMoi9xLHapd7Jc9U?=
 =?us-ascii?Q?aLNuyKlS0zZQGK5dUuSK6egYLb0s/lrRGO926oDqWVhQl9JMkzLI+pPr6Kog?=
 =?us-ascii?Q?HegpPpsBePSf85uYp8c5/gYUtbWAnc0kOQVHNPYxEyaxe/W51EdpvaxW24B5?=
 =?us-ascii?Q?sNSvQxEFkvl9yENuOTIBT33CRM28ovZiKRMPSkHXBmYzx5pXrl9zZJzPNChx?=
 =?us-ascii?Q?K5IbhvfTDdZkPWLD5XK5CSucC7EGpcnZfi3BvObzrnS1gmck5GDdAI5Xn9cB?=
 =?us-ascii?Q?8gwNkhCuUX703Q7xPiWV/gkbq+myax/FDbgbUWJ66dkSoMmjJEjRO3KUfotO?=
 =?us-ascii?Q?JXkBoB5RqhvBJ+x0S66Xx/n8jDyFubx1Jmwd5z+xGBbyFAzHzcLE+brGtC/x?=
 =?us-ascii?Q?M0k91FrYiojDsXO4Q2VdcpXlH6lS+6NvVAWiXR+a3u9VKGz1EL/8jhc7D3Qb?=
 =?us-ascii?Q?at7iqvgKQV+IqjNX4pucUE9+thzqCVrFok+pqpdEyuEFIW+hbG6FooD//oDs?=
 =?us-ascii?Q?YXdfHz4brk4arLrhpUiKJloE2okLWoNEbpAM7d0c83oeNJdRzF3xZHIoBjD7?=
 =?us-ascii?Q?zikCnLY1ayiHJTcPApCNt1gU5HdQvjVCKjqjHE+Qb7OMfuVA0hePwIKnIe3h?=
 =?us-ascii?Q?XN/2WkSQsJ2omGzrDa3pU3jhR9Z1bFTZMrn9XcQHNL6pgVZpSU+9TD/qT1XZ?=
 =?us-ascii?Q?zgw/HZoGUxgLRFyrBxDyWb5ew2sxRvF51ErftNKNf82dkzqVx6ODLhvSuPdP?=
 =?us-ascii?Q?8zeRTTYqah7ihzR6xl0vor+wHrPOLQV0H3MhHi4HIhp75DX5TRlDHpS/WASq?=
 =?us-ascii?Q?snsZzqlDXTdMgMvG5uHNLi8B27m8ZeT+KXRWWOaOBGN8wm6S2fnpV5T26R2V?=
 =?us-ascii?Q?R1XGh/iiFdshEiQ2s6mwGXCQ9sH+ySbkha/jKT9kl6CZSzAEdztx+CXUDsgt?=
 =?us-ascii?Q?aMB1zU/0Mh5QAW5evEveNwMLX1DRfHeGnq5UurNvTCJ3xtAoSzGnKWE2guG9?=
 =?us-ascii?Q?tbPp0AiY/nnsO45ypIkWK5fP086SaNfc5teEeRyxDC+aGrtRGC+KUipFq23I?=
 =?us-ascii?Q?c5AlT4ApUo8Mh7gsm/SeuwzO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010bd0e3-9c5f-40a5-3b5f-08d8d3c0e0cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:23.5650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQwfzMh26D/bTVMsV4k2u7WdUdV1K7DBwFc6py74jbNTPul+CX7jWD9cXAWHUP8Z+t/P42s+rE+1dLQZPFoI7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
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

This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
pixel combiner.  The RGB pixels with padding low per component are
transmitted on a 30-bit input bus(10-bit per component) from a display
controller or a 36-bit output bus(12-bit per component) to a pixel link.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
