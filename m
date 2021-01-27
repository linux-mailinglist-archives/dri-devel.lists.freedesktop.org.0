Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD743070D8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCFD6E8FD;
	Thu, 28 Jan 2021 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939886E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nv/jf/2VDtUaFkRPlsdJzvBcChslqTyp8O5sOUfZ1KV8Y2N1+vcKCsrhL5Nv2kyg03FS0jKt9YOIv+rwpUcMJjms4oPwqu132Qy16H/vJR0XXmQAGfYgKdPrz+govfPjWcTaUZh4ePzLL/ROyTvL4TTqqD5ItifrXP+SnoIxxSj/Sr/IcITWPrko50YiL5QA+VqFiZaBxPl7bxQYSB6VL7Xz0mtfAB3nygqMQZLgg5IgviAuhdDHTDnevoAp5M1etEIumYO/e+eBlQ+/hWY5rSSz3cIRLR/cO0NkDBPS3hQD39m9iuMpY+k0lrtLvm4RrJA9Ku30pb7jEjfqOZN78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K15mBtnRnlVhzeXRe6+V42y/axZrQX4RArbQmgb3gWA=;
 b=PBytOkvykbA73wATXx6M5exK9TXlIVSNbinPGBFviePutfFJ2vPf18oYSQihe9U7yy9z5IHghLfPzb8TtGUFYmpK5nFVJ3RzP/r/aPVo+4/WLw1sQ/KRmoCnEg6/AMFWw9hwFx7jq2SULso7A9WTBjg1D9pUFFWDhsHHSZ0HEQ+CrHRQ2tZRi541YUtydLaHY803l/gspZANauATT9ydBGsc5ubhh56gVxM2LckXVdAgmNubVq/c5lGAPbMVy9qzEz+PXBVylvm+6CMY6yakv3fLzUrzCVIvEG0oDk3xcOiD0inVICv8VVt4tOQX5Jgdlb3+tnObFupoioTbnYh2iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K15mBtnRnlVhzeXRe6+V42y/axZrQX4RArbQmgb3gWA=;
 b=kQ4O/Aewpuhi4flVlJBjLCY19YCEY83xnt9QUeHs3bQa+wL2/L/zQQELFWPNraPkcWgwpXdFp4l9FXoisNOUs+eWoNHw5czVKQ/lr2BRBNxbkO8YmAQ6cst2Om6r1TBU2AF5qRuISpEr8vTz32aNRgVuoiJJxux/qk1lq1geBdo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:02:36 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:02:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 03/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Wed, 27 Jan 2021 16:51:17 +0800
Message-Id: <1611737488-2791-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:02:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d10bfa1-7a3f-485c-9cb3-08d8c2a24a38
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297548D4E3CBADEE12517F7A98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M7GyieVA3pi0/LeoZRNOHAtZWJAhTkF5uQPXKgENcHWdStTouftDWYt3AcTBuzEVbAHoIO1RkKrL8t7TXN0wgnKJ0S7uvp7p+NPdF+zTxnq8gvhojAQPr7LSvK2nhzh9KolAg6AlNqDo+yOzXhWXM7DxFhgB1MVu0jw1KUGjH1v6YOrWSpBipBSJBKz6LKxJUItWzgbenWGoRs6z3BAP3V7MUz1LHD7h5lTsjLZZSv58rTgmWBF0XpDQmm5d5FTqPEMEIbMQHXYcVDpb2MHWfcsvYrIMohYosmckj7Nvk3ZqivZDmFcZ28t7f4Zd5aEkOremnVORsjpw0drPg4smMaekJQCKbdDcuPGYHU+3Dr9PGAXzV8bnB8JxjZKkjg/UaA+iVDZfWeFUg6CHkS/WiRY0A2WVOT57YGCMd1q6HFdqKSUhD8umQjl69iy2adz7/d3Pns7orUlfo58VCsHgNldOdNbI+ocTUL5AdLbmF93Y+sDjEiKv374kfnugooq4/5z/+cZLdliUXu6mNo8/VIyuZwCNsI+8grGLybG+TIt3HnfFrYmLGvehyG5KcsUAuiE533iX8WBBKYbZtMD9DA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(66556008)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zcgWR3rY67V0yLOKqtI5OblI12emwy6JMBumLMup/Jq9Tfb0+nPMbY+RpPzP?=
 =?us-ascii?Q?sNZXm4cx9hdY23Gk6upxOuYI8W9q6ln802sCbWAp46BZXyUA8sGUDu6hX/TC?=
 =?us-ascii?Q?FVtqZ+72qpPDovWDCW3Vi55bcss/KWhdHQz2tBq/dLhsyPw3sESZv5jmGWBV?=
 =?us-ascii?Q?ltGIst7qQGdpN+jcw7IjpSbbehPLje3lCqqFbFbCe2lfzWPpCAnatdZ5/0zU?=
 =?us-ascii?Q?3VjuOho+sbrdQAGS33plOXcMheqGQMdc71sdyeGVM/ckPAaTH8DyOZZogrFa?=
 =?us-ascii?Q?05ERbbMjzJHhsPchk4LQ+hjw0NIdRu8B5Zv49ktQ8Sstj3i4qOiI5h6qJuAc?=
 =?us-ascii?Q?IIUdkgugfi8WIbrU7QZh63/9er8uIEaGtrTxZ2y8MRBactkUfttyOUk+BDKe?=
 =?us-ascii?Q?LxfRObFd/Oc0FhJIw10Sh5J9mYiCBektbl4+W1G8Su1zN+nCsVwZ7B841XOk?=
 =?us-ascii?Q?HT/W7yUo1D/uW8NNz0uX6EL+AUj1gYQVdEpmJSkaOAkIq/T+Cmb4E9O3VcQV?=
 =?us-ascii?Q?xhyh5brSQsT+nZI4Zm8MeoZB21xxLb3D80ovg/agBSSIcHRG3PfNTKeKTcgw?=
 =?us-ascii?Q?TdxX0gp0NJZsTmg/T1J6wZAKy4nS1VZBjx2u8TA8f3YOsCjf4ak/CgXaevO6?=
 =?us-ascii?Q?azjlO8zSezGg5a2fIZCZudfqtb/UeYdEfIr8898i5rA/B3aCRB9cv2i/9Im6?=
 =?us-ascii?Q?wRQEWoo0huLYsHCjjzp3BwY3kWYFFy/L8vwwBGJNp2noxo6ldRcchb81QdQJ?=
 =?us-ascii?Q?NZ/3Lt3nFPPYHZIL+Q9oYKl2pgppnSaXrBFVWpLVQImtqtW3hH93PStLTtcO?=
 =?us-ascii?Q?A/DRAUIwQcpHEbSjA9Kw84QfQdY/G4DDIyOomA6BOyywVKnNmCt5ULu6ZgQw?=
 =?us-ascii?Q?gLhM/49mSCSrGY6YdFYa1/FCLujhXT2kDQ0NvgsKgLgt8xkg5uYFnPKItusv?=
 =?us-ascii?Q?U/Alo31IlBRQtivJFOX1L2JvZywf2b9s0s2mS3H49ojGvbNMIsVdl93E6KgR?=
 =?us-ascii?Q?a/a3EumKowaSfs0FnBk2CWRe3Nl19tlTIKSyb66YSKhG7Yx+KdCmG5QL9vde?=
 =?us-ascii?Q?mwhwovrO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d10bfa1-7a3f-485c-9cb3-08d8c2a24a38
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:02:36.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ul+OgVyAsysttYPy4az5ERZGYq5wDo2qKvHqpwPc/4qnw1tCS378bjElVIz2td7J0Z4WebigD4fspaFvI7fWPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
