Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C92F74AC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D424A89BA9;
	Fri, 15 Jan 2021 08:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60078.outbound.protection.outlook.com [40.107.6.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F64589872
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:32:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTdBzlzxpLkKA6z52l8GI9tQdEXlgrc4ZrS/dnXqB+XUCy3kJKtUhD6tv0Q9pEijBNQBHgGCfAaUrnpAi9EzHfHCrBpRrsnSHV+moiu+iUk6G6zjKmzeWjWwRBCHajmttrc/rjiKP6ItOqq7vTJQPfCm3EibPj35waUBnnNVEYvOUkCR2Lv6jSmuv9flDc6D1+Xd+Nd8BJ4+DYxqwljRz7Dl19z4EGSANOQq3DDqAr9ol0AwfdpSeDb5RwjOXXoIcDnaDbByzaWaLlVPLB+PoJRSr4CmVKIMC0xV3LPrfmcwmliWPYtBdXZ/yaKm6I1D0npWAzGMk2pkFlmarvFvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7/zwEo1MvPdRjQkK9+/CRVUYd7ExqhC7lONOCXFvgI=;
 b=cU1OnXuYrbiHu/80sb7Pmjdt9ZF2C+foJ8CspUgy95pLHJHol8Gc20ZCn6utOCNDm6L1GgO+ecvCJaEvz+BfkfCGybV8pu+9M985qVp7u4vZd5vv4oHmD3WfZfJwvd0RXlZQkRNxl7bXlM6q98Mc9Kg0WTkhS65qak89sFycHJYCbk2OS06K77u1XUT+60juKvL2JFUbJzkDfAQlmZfeBqEH6BnP2VvYNacAnMuXrdz8PuKu4g1F1dXt7rWC1Fg+DOKaq5PTRbEe1KAZmwtKm3hsBkO45isqOQfqnb9qE5D8ZqSzdnfA06UfQsp5gK2JK/R1l1lyO2tB6lFLB8M9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7/zwEo1MvPdRjQkK9+/CRVUYd7ExqhC7lONOCXFvgI=;
 b=nb4CeNj8+42SUZnP6S9TqfntOr1pN5UmDgWjX7FRFSIA+IXKJMaQb5ZqlKZJGymbSGWNI+3R1ycQAYfSVMZTwt323z4NbIzlhQz7eQrkodeeBiAkRFyjWU3M6PWwfl+P/c3njWcyGTjmhwD+E7YaPlKD3SufF9t8b6SzxH2ms/A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:32:45 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:32:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 03/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Thu, 14 Jan 2021 17:22:01 +0800
Message-Id: <1610616132-8220-4-git-send-email-victor.liu@nxp.com>
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
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:32:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01cbb298-ba18-4a73-22e4-08d8b86f5998
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57106B8A2EB9241C9CAB2CDE98A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZjJeQ77uXjKXq8o5T0AO1ydCb4ghzVN8EhF5lTrpZetBsiZCXqIMOWfcxn6/1B1rleLQBUSSDRf2brRlI9Fg9ykCKcA1I63d6CAZa13TP3ZuwLcLlB5LcYcYmfqqPyHTI1PjE2XhRLM6Izgnxk7AyM21R4uzOCWsbGm2EXH0ZsNpgc0IxAdzlD5Ipnn3SItKjUuuv2eNZN3SH5L6HPff8IXDOb0wRelv7GgpzoSglNPBqq9eMr1+jYR1g712ngjRBiIg8SCmiQGMhi12HZqQLYlJcWcC4nc7meN9fHoacyAL8YHjqp1TULd/7Q5OhBXumZEjUd0uEVWFG0xvO0MbZ0iqKdIh2KyjHFdnJa5heLhik0E1MD2uvMCJMh6CNJvJpjBm/HfASmLDNOE6+lRzyeBGspx73cBqoxeMyUcslUj9t3XTRiOg1QmxcIVjRoUL7dgMswEvAmJwWt52SVKQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(6666004)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(2616005)(7416002)(86362001)(4326008)(316002)(5660300002)(186003)(52116002)(2906002)(66946007)(69590400011)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?n7MuYD0fUglQbzs1aawjwlwTkqqjnriMfk3xGlhjuYXrwomUS4I7wdZkOST0?=
 =?us-ascii?Q?j1bS+h23zCdPt3xW1Tm9u99K+2QaGvZIVab9AsePR/aJaXjJYCt6qFGR7Zon?=
 =?us-ascii?Q?2fzYOyJ85//+OOT/ph4TNLl4UxRDvdQE79MgVLRjj26Y14KASzJkVQpPImnT?=
 =?us-ascii?Q?JwHiPZgS7+8BonIyqcIetWgdfxF1ye1QqAQSpyL6imSe0QLcIlkYs7qi11+o?=
 =?us-ascii?Q?Pdz+JSz/sP5XKb3AIcsEZqdrFLZgj76lj5Dxo3/kDojSuU7A2cLRFYw/Go0w?=
 =?us-ascii?Q?aIvmGj6IyFBw3ouF4ZDm7z0jQUb944x60xllRKyU5tRkCzt+g5VhDu+vTl9K?=
 =?us-ascii?Q?IXvKj9nk4ztV6cpe8oGqZh2YU6DLuD34TR2AGnH70qRmXDyr+J5a4qoGepDO?=
 =?us-ascii?Q?dPkyI2YurU6ehMMKrF9cFGqBIvPq+ZvsPqqPO/s82oYgr7pQRe2Mv4vpMgUc?=
 =?us-ascii?Q?JRvf0SAEGjUhzTU+BLVISt5emoOdHANGfG7abS3qFFIXAuNc4TfifWaJGc32?=
 =?us-ascii?Q?JnS4DhSBwRKs3s9WJvaO4pX+6ZEusVeJk+tadCf75MdKOfOFqGZ1TiwjVBJw?=
 =?us-ascii?Q?Af0EZsJWdZqSa3bt8ogu1bcJwrj4sPmX52p3Cq+iMryiK7js1bzGSqEhGRq4?=
 =?us-ascii?Q?nj+54PIAZZN2/WdYfMdd3x4A8SeGnQVUaE2yxxGg0nNMDxY6ZomeuYrMzuyp?=
 =?us-ascii?Q?oomOS5Jq6DzXlvuU3XUaVPSFtLDj/NyOyQ14mvNv/eeVkMF2O0snWOtfVhIt?=
 =?us-ascii?Q?Sf3/+qP+61VSSPXbsAjCZmi4P8I5ZN1LHbS8uM/KG/otavHpPkz75PSLVjfr?=
 =?us-ascii?Q?C9gLZGCFaZWSgkoULDLvQ4EaFUDViVq0qOHyJC4bGI8J+5//cOm8sOKi+f9v?=
 =?us-ascii?Q?6EQOter16hpY2G5NjrfhCVegP8VuS2nAqaBfwM3887MXXkzQOrI+OW9l5BiO?=
 =?us-ascii?Q?7JAKFhDUyqN7Ou/Lo5hC1xjgkNXgvehGunI2ydyg4mXBkCOQfu8u8AUZE8Lj?=
 =?us-ascii?Q?sbl8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:32:45.4110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cbb298-ba18-4a73-22e4-08d8b86f5998
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqG6692P8zrD3G1Kw/VoFNrj5VqPItMJ8v/1cnWkh4EaXOUWTnw0SRc+BloY+BhqrYuJg4ZSCZxFkNKbxl3fcw==
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

This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
pixel combiner.  The RGB pixels with padding low per component are
transmitted on a 30-bit input bus(10-bit per component) from a display
controller or a 36-bit output bus(12-bit per component) to a pixel link.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
