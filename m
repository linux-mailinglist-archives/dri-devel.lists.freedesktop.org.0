Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CE2DDFC0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA7F89B51;
	Fri, 18 Dec 2020 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150054.outbound.protection.outlook.com [40.107.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4A96E239
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHj6TfWuv/KIiYmiADL1bi6k9LvSDumWYisM8lJ9EPN0gYcfrhXN3cuFMDWmWcAql/AcBowrM4B5bpQddoFCoAZbGlma9//Qz5IxCYbn2XxAhJG2JRxiwVAXg3kGVIyz3p3NNNERFMuDL0sWNSZZrVN5B+4iwTxqrt+y0ojpz3rdyKd3iLLwYGF4WZZd++srPArfc5eJ/fzKUKXFB2MRL1TvPPErPzf6+4EOrbumHFICDz327H8h16EJukYu94i6vmruffKnjBKNLnwNjj1CwOSTfM/oY5ENNH2GXBfAvUfK8U7s1IzV/QupgauWzhW+pa6O4UGJ9xARbWmz0zmDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGhGT/Ur8JBHqhjPNkRNPWL20LYLdYNQgPSp/fbuee8=;
 b=h5vWW91OJXb1fKuC6o4h4w27MVqubNNNjXg9OkNuXWKbHqZX0SzxobKbhXTu+FalW7cntO+KOkOsfD9ro2BUqyVb5goQnCuoZVrZVm5FWFKiH9COmfua5HpExiwn4OyiCKbcq2yD3sx6wFNTgTn94zH8pG1Zj80C8Kf+NTKr+evCEOtqcAtNEytgNY4rP3M3BICNRd7Z2Erxy9jpNJb3U8A/NHyQ0WYuhkp6cYdvUuGOWmyjr4BxEXSbTbGR/pSE7Dahgm5r6rMp61NQwkjNM/5xt+DY+YwZ8s4gn02N7cXyMdNO+WdW82Mvpd2odpavLPVXnOCSYdArazCeT5jSLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGhGT/Ur8JBHqhjPNkRNPWL20LYLdYNQgPSp/fbuee8=;
 b=c6lUGE4QIDNrbfZmx/OrXgazDCON095t8JRNXrYylsX5xxfKWAKeykn9nD5bZKkVUShhNW13xapXdmUxBSY7xlPx8Y0ZkQW8iFXM7IwEbwHI0UkFqHzKu5jmGEzfI0rnAOsyYYihFdMF7hFwGgTXElUb4BygRg+dTlS43CD+Fk4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:08:38 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:08:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 03/14] media: docs: Add some RGB bus formats for i.MX8qm/qxp
 pixel combiner
Date: Thu, 17 Dec 2020 17:59:22 +0800
Message-Id: <1608199173-28760-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:08:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6bb1f441-2ed2-4d6a-cd26-08d8a273b8fd
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73129D7423ADEB4FD774739F98C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: em4lc334P80rcbvAnddaz4OXVRLlUxWRwtJDCeyJbMHfrt2jy19IKPWJwj6s1Y7ZTOC8xOpWRkiChjdu3V4LRCFtJV+Aj8jzjvAyWslEpmVees15+ohPp1SgxGLYcwXWRy7PiS0V2azwUcy6zMk+dgw1UGd85OMuRESryXoS/gadI/3wya0WYoerwwaZZb/DcG+EMcBGuRjJshh4NWuAxyw/C9F2DmDEgXafhKIvGoMWYVjtvakZ68pZW0NIxRrqF+3F/5sS92biks4qF290fM244xI3moLLw1Zzvs0jkZCKOiEH9LD5p6Zo1la1c758FfTGC+S+BQrmsslXrkOhLFb4Q7WvvO+/ycmaJgaMP/Ojsb3gQAs6AMTB/aPH+RP9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7wga8NyvAb5qYU/o9wIc6MDGS5rDi0Hq1QmVhCD33vfdriUbHTsOB1OBjbpn?=
 =?us-ascii?Q?caWBenMwwFtSoT+gL2J5NY2En80d02MKEyiLV8Y87zWkFegcN6QW6IVzXt6b?=
 =?us-ascii?Q?w6wUzxN6HzaRzfKTfVk0S71g51OGo0AfHZWWI0++GhLn8SSBhtJG0SEVGIxW?=
 =?us-ascii?Q?xMxUrkGN9oJpoMOF2AmfYcXHkapWgIdld5+AyCZO7rU/nV5+7W/tJsJq3/Sl?=
 =?us-ascii?Q?hwoHdp/HkWBqCofgCJP/5ZwjDqKWjImaX39VVuARkU9kWrR0gR4UCXcEM9TK?=
 =?us-ascii?Q?TI5kT0eoSSrZhPRiWtNqaE/l5c0Y+C60LLRf8xBaRFux0CQmUCi+32TZMOMm?=
 =?us-ascii?Q?m4darft/dgdnEuTTJPYsskYxbKJEZODhVXSxat4D63/rfqFEz1Oavdgn+JgF?=
 =?us-ascii?Q?E1rlIvDFK9FgOHknnJwnht8Grzde6Cp8y6sx/n78IaeMmNrP81ISOT07FVXu?=
 =?us-ascii?Q?u1bRuW/sUptKnk+7sNIFE2KypHjxESvrlzEsLw84rviVxkxecse3sawVwR+5?=
 =?us-ascii?Q?mTKYtzykPMPHQpH7W0NH5+cPJSyVmefJMguWHwf6mb/cZyTg2l04t4KZRpJP?=
 =?us-ascii?Q?sV8GXomMt1H+PU5Nstc4fzdDDvrnCUpqT5KP6Ve4o+Q0zoK5dsIf2sFTYVrf?=
 =?us-ascii?Q?r3USGv5VM7mxJe2Y35VEixBndqiZhyZp5D2c/8vbRGLoZFXJK0LK6iTsKhfo?=
 =?us-ascii?Q?tLnzFtjuJ9Cz0WWYswlLs4rQ4mqFNO9RgUccSYPmGWc5WdNMCMzqtSN6km+l?=
 =?us-ascii?Q?D7ecmxD1zhH3SWsIAJZ5xdN8vBNFEwHqFsOl70YfVjrOtok04mouyLGANw8b?=
 =?us-ascii?Q?G68XGuh3cvImsS1WL39fl/RdnMxOiSXWk0itFFA8nvDR99pj7wWxBbOE+3Hj?=
 =?us-ascii?Q?dn8WOjsGokeu0Zc/he9/SRyEBKvHs77leZRzz5jiLMxlXQbphfflCU9Snp5k?=
 =?us-ascii?Q?qHO/rXfXGYLqWK+NG927t1poiI1+j1Dhjf+B6rzGyGyEmiqtfnx8ek9NC+Jh?=
 =?us-ascii?Q?Y2CF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:08:38.0295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb1f441-2ed2-4d6a-cd26-08d8a273b8fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rw5PeJal4Fk6nfYRZeM8HGUmjmOg0vGQGvvuhsta2H+etAZ5XZfAM6M9FmDr/OWoms3c2zTR5lAz/Y0WdP7CyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
 .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c9b7bb3..e02b92b 100644
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
