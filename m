Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B027544408
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B89113D6B;
	Thu,  9 Jun 2022 06:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796EA113D74
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:48:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fy7i3bHHWAXBRoG8+0mPxZBEhMSyuCFtbZ9jZft7MUZWBR+R6RoODRdped91leCGzg1no8fNzP0FJjCs2z58Hn2xZ6RVACqaM+Y64p7U9E+HYjESK+TzOhSKuJfHaHZNPMkje9nRTemLTqQl+a2WcY5v9zXWwt3Nu+GYD7ysdg0cRiS7lIchkR3OwAUCZMYgCr33YCbcr1Py5sPCQdPjRSmJhMTuQpTUpdbH+F1bwIkoDDEGcQbfzTqZxtijKqVfvfrckuUUUYjIb7rDqm5QFI0AMP9LPdu0Qx8UKQJkE13R1t+K/JwxlF6o+xI4i7+oHtVSIPmgYFnPiR7vJLcAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rNVAC+RYQlN7zRVQrTTkR1w7THm94t34elr5qvTutA=;
 b=cIt5bYNBR0/uuEIXcadMzhzdCr4yHzNxO83I4pmsfk4esKOpRlw4h3KzOKs9ud7Dhz5wz36x32IKJPMngaUVFY2VlRgodJwhNWdfYI5mYREIFIMe7MYfooETl1O+VLz7+qOHjlVVk9kpZaqIiBz0UQQKcKGZKvIoC959yZ3pptJ1qhHvnByP9/kg9NVBE/VhsjM6BZBGQjj25DqdWYbv44W/ZLjpW1AIju4hbxFnviH2Imn2FE09Sd2glnS91PltXIe4aCAI45wpeJ8NvYWB67mGsiTSvU0ht6FwHAMaZng8eGKhqfmQDW+IRoYDWganpCJBE5OQktHeu5Hc+3MKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rNVAC+RYQlN7zRVQrTTkR1w7THm94t34elr5qvTutA=;
 b=LNjIu74HkzxR0mOEV/5AlBROL8mrHTQzePkmlTV7hUGaopRVx4h/y9E9U3Ikg7Brj39WjlYSv8DlYGazvLk7zboM5NTKGmBfFbpp0O/ecEdNRuhMQ0CKF5kTo1jJhs+fH/1pFMhhocH7eyzSFQy24EDQLhvnFV/Fkl6W0FEREyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB3518.eurprd04.prod.outlook.com (2603:10a6:803:4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:48:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:18 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 02/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Thu,  9 Jun 2022 14:49:19 +0800
Message-Id: <20220609064931.3068601-3-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 63bb2775-e7e9-4312-8fd3-08da49e408dc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3518:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR0402MB35183BBEE0B8D50A343FB49A98A79@VI1PR0402MB3518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FNrYVyBjyIB7evAtzoVluoV2Bf6k90fZYBHzcL2sH6Ow6JJUe+YqEPMB4iMENHVekjX9ycfUXZ7g52A6jE9V3kDeCG27Kuk+k7DVj+804rUPn1+nBa8iunvzSJfS2vPBEsy3OnwW0W/e4B2QF6ZW++NAc2l8UTmbHJ3NbmCse5bucclzRtcsPCB1vnHQx+VorQ1iW6gCY339PDIF8rde8xS5Y5qg8UyBjieFLD0mEhd6GFqk0fZPNH2Nden5b9t2116yKDdYNptMq8FWzwTQU2q35K6ckFsxnHOx4vxBHgwBEj+eqVH97SvJr7sAusK6LGhpawD7j+CaSy9+uKRpLjod/ihRa7NoMMNnbamyStl6vw4kk2KhVzPHKOdz8JzPghdt9QeRK1T+h7lYesuuPUulPNvD/9KKQDO16s8DX7+rhXz9VmyLtVwZ60f5dU0Wq+waNH1TnsS2LfhL3cxydPO+M1Sue34fm/Dh7kAtdF9JV0AnLfzlxLmZgyMqL+50QIiBj5hSdEbA7hAoEEAlyvVaeEB6D4Jlrsv8xTl6PK2K4614lIGooes+/vEGDFSGrRA9zFnTE+07BRAt6fbKSaC+28BexBW7lZh4pVELO9HpCCXYY3omHl9jz34yGEdnxt1RHTpT0I8WlwbGAr5L5u5BgQGgTmcyu5ekhUW34UCuq9k224qLGDclTh/F/hyI8mmdP1hFRHePKf4ffH5W+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66476007)(508600001)(86362001)(5660300002)(8936002)(66946007)(7416002)(8676002)(52116002)(6506007)(66556008)(2906002)(186003)(26005)(38100700002)(38350700002)(2616005)(316002)(36756003)(1076003)(6512007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x2yE4gm9O7Q2V7MWd8vIVSXAXP/JKDIZW1w1IVAm3DqTKKx029978FxLT84B?=
 =?us-ascii?Q?CdxlbCK0l2Xeufyh5pOGNIyG7DK9a3NNPENyZhKBfxYQua0/g6y+YV+/CNmO?=
 =?us-ascii?Q?s0Y7HCDSg89kH0Z0Az3MCO5OEU8QRLCHnhAnfj2YihpIqDnvhZFZQkvfFTd+?=
 =?us-ascii?Q?hYmsntsmBZgAIwaRkzRlsjREEPPcBCQLVYaA9GMzeY55rlVUHSGmeIwygYeL?=
 =?us-ascii?Q?6Iojkk0SLApLYkkFrVmDiL5yzzYYvm4vona1LjjFHcE73FD5pSQhjbsIZu8o?=
 =?us-ascii?Q?3nUwl2p/29+ojjoHPS76u5Xe+fArln0CKZVeuElLL+9bJcf2IbHU4J1/+nEw?=
 =?us-ascii?Q?iLfr69ArR00R9QLy72KVAlXnkn0sxeNm3kvQXIcU2440nsfFa0NqwexSXqyJ?=
 =?us-ascii?Q?G5nGltZLfRe+7i3lo/loNuMhYXfV3h9jBz5BJVqbLD3prPYT/5qSvAYC7Jk0?=
 =?us-ascii?Q?fKA+qWBZPk9+CI52jhDOZmtlejbRa4fPXDjYRw48qNoB8/8TwkIZlXPpoDuQ?=
 =?us-ascii?Q?X2jy/0HmO9LXa2ViJF+zCRfvKKlPAFlTG1CbVEGjoD9katMJoh2nHLdSsurX?=
 =?us-ascii?Q?pK/PiKqDsyouhEee26FcHRPKBl+wJOey5jT4zTCeitMdkqGqtn8YYOF7IGm5?=
 =?us-ascii?Q?iX8kzY3tuI3vWxLipEb2ufhzJxt6/fq7Tdg0Op9D1ZSGVISFYN+2ElMKHlXJ?=
 =?us-ascii?Q?+QjYNLtjsBR1doJd7Twpnk9f4JsmwsjDIM4Kkrv9TUYUZzTIvFVZUG0Hk93D?=
 =?us-ascii?Q?NPSlWnX4X7a7ssLMK9UzFKWiM3XktzNbnxQuwkfyTtKmzXDVnZ0VJhAUKUNp?=
 =?us-ascii?Q?keZi+sfeb0Kk0SkmPC3/LRM/FppiszAifK4OhsRpzYK/j0O2W7tYiH/At9+t?=
 =?us-ascii?Q?Bbzcm+yiRVAsCZv2D9+i4Fe3ThLbbgtTzpT2D7FgKGnzBGn99v75iCZ8N2fa?=
 =?us-ascii?Q?Fl5wPW0OGm0xrqOaUZgIRdC63TS4hiVHvXRhJM2XbWtSbA6CWjcXlnyNRCm7?=
 =?us-ascii?Q?MwnVme05wN6zduegjY9w4CBGHb/TJYLXqfrLtxSvnFt3WDfY8UTqQvIusWOs?=
 =?us-ascii?Q?oHFuBxBku1+koJwBq8qj73R0WQIbaq5/EjOSpldWWkJekpeHBvzsCidHbKCh?=
 =?us-ascii?Q?cHeMDhNq2ZT824JmGiU2OyTmaGpcZJTBVzUVgBqOOoTkX6QIuY3HOLPtH9EF?=
 =?us-ascii?Q?rJGFSfiotSLNKfUfdwB67BNz5DSwONc6lOQDJHIzUDZZP7N4QMtlJUcXYIh+?=
 =?us-ascii?Q?x3puiUvaBawhwcl5b50VY8uyiAfhjt0UbEL1G68T0xa+gZEpK+cNnNjiWhwq?=
 =?us-ascii?Q?l4V+g7Fkp4q1niOAO6MqGiKb19f4BSPGUdvhmepBKbkr8IYYgOUA7qbKfVEQ?=
 =?us-ascii?Q?PlpK2cCU1+7yd8IGjQgYTHLR9IsX8XeDRWcpiR3ywY69fz852Hk0wxA8Cn6r?=
 =?us-ascii?Q?RDVufUxNm+6W+UqIlsxWt5c3Orc5V00tDbCRPse42bcV+ir3IgEvVp6YET5m?=
 =?us-ascii?Q?yRoyHAIQPmSdZnTFXB48FcgZyKy8ezrlhrNxvTMdsL6N81ZLl/0SA4ARR1Ha?=
 =?us-ascii?Q?PZSZU//m8n2DS4qTIDR31IDMc6rgAyt/PqS+nQ0xr3UhJXrglWCFcTALl5ky?=
 =?us-ascii?Q?AD8ZonNorEhTwP01EWW/Jv+zDjRHsYapQ9nl4AjsKZIIng3E/gCbVVRN4UcR?=
 =?us-ascii?Q?tcaur5tlfFPVHbdrNFu6NbXSGTZV0dQ+r/HyAaaGeveQPr9zNlBdN+yd1vnq?=
 =?us-ascii?Q?hK0wXdKW1Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bb2775-e7e9-4312-8fd3-08da49e408dc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:17.9826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xCVYknOQaDl2sAn4JJ28nIw5kUjkfTWjOGopy2cb1CW/EmC/xqcp8qEy1E0hBCEU9TfUPTo7xjO3crThp6H/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3518
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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

v7->v8:
* No change.

v6->v7:
* No change.

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

 .../media/v4l/subdev-formats.rst              | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 0cbc045d5df6..d21d532eee15 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -1492,6 +1492,80 @@ The following tables list existing packed RGB formats.
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
@@ -1669,6 +1743,88 @@ The following table list existing packed 36bit wide RGB formats.
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
2.25.1

