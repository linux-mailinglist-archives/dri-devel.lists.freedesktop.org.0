Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA32FE572
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700906E530;
	Thu, 21 Jan 2021 08:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50061.outbound.protection.outlook.com [40.107.5.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3076E8D8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5Vtm0bDUcCg/8Pj+veV3U4beOyEIXkkUS1j33mMFg2n7ot+t0FxeZGWEGkWOieRpbE6NfICgfCUEtZOQRKKKlLyTqDg6alsHChORLPO67hfdgiCuGTXs+o8IyQzTslbjCMUQvnoHtaJrhOHJjzFw41S/B80+4y359G/eB/Dy0U4wT+12pMrBZCSbQxiD1sxuGqQ2fcWZuEUZ8PCL9ZcRIdffdh9jdKwbaE+LJnQHzClHgNlgn8zSaKCS/1Gd4w/oJOcV8LQlOjFCblGMl7SrIJTe+x5FMB3Ua7FCA6DX8NIqsnidmgGNZrl1w1vEUkNtzMM9dvfKcaCGnBsm3P6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlFSIcG5Ei4Mxd8wGUBn5rBrszATKOpYvSeszeHDS+k=;
 b=c+fc4Fl6ojXx0fQ9/s9W/HaBEKH3Qmhz3kMwvNMXkbiXHLHOsiUa5XveMCq2W4oYiuQuEbkJ+XclTbES5KMFHaQWdnfQGgZ3jicMHwU5KToaHe1TAZEN46H68J6NWRBjDGq9aEJV64kkZDtrS368LHDFMxexm+Y35GaC8m5aMFSC4UhMhkhiErHYiUyzWmXyOiclrCTXtVkLhe1KCJ6+RYQ8qKnTn0RoqzRF8DS2NCrVLFzvoB3FfZQAySRl8goZSC4SfztqI3QPiYrE75hGXkJaYDTa55UFNeC+6W9XkBsmHybekSprzA3pbYE8kRAcY+gctYz+MandSop4Q6R/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlFSIcG5Ei4Mxd8wGUBn5rBrszATKOpYvSeszeHDS+k=;
 b=K7U+sklj+LZ4S+qCa7iY4r8r3AWBB68mBb/TfTrH1OglKz6TCvwroXUMzFCIIv+HGZaRZ8jZeSCHhQcFh2J9AaHbJFo2Jv78syk506o3ee3sgg9xp42mHm1pyU6v+EsC27hOw0S0nTAGx/9+u08ArxwAYOwSMWpyAR/bZVb+LP0=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2880.eurprd04.prod.outlook.com (2603:10a6:800:b4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 21 Jan
 2021 07:25:41 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 07:25:41 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
Date: Thu, 21 Jan 2021 15:14:23 +0800
Message-Id: <1611213263-7245-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611213263-7245-1-git-send-email-victor.liu@nxp.com>
References: <1611213263-7245-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0123.apcprd06.prod.outlook.com
 (2603:1096:1:1d::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0123.apcprd06.prod.outlook.com (2603:1096:1:1d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 07:25:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20bab642-a1c0-489f-4ea3-08d8bdddc1b4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2880:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB288063126D8ED957A9C0F99098A10@VI1PR0402MB2880.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YZnfrtvpEkn3ygHExe4egxKldTY7wSWSvoHBMqvQ7cCHh6v+ygqYZIQqmzQ+HinCRFDsJz+a+D+oe532du0c978Ewy/MF2jT4e0vegK34AfESZNj0pW7o0YpacPij0Ckjh3/et00EmD2xgsyisDowBMXNbLyokOxAeSpiCCRl68ZMktPQBIOswLe3RG50dYFEnhLfdp8rKs7EYoShqq20fWG+W2pQh+l6ohPS5Ae5fxLtBrn2S0rxbTgIXUk4Wp/tmzdmqBwIw5fEO4wlDtxIQLG+A8YoDg6ASSh4vG+KkuQcca1C2X1Fxp66ONRDVUdbeJ7BXUDEz4YF5xUh62dFBK7NMSgMpvLhbqpW1ulaCp1WHQQzpQhcJyzdpJkMcR2zi7eakSMSyV2B0GfJ1IjMWguy9gIdyTly/7+dDUBBP4Tg2KcpJ8omPxaV2KaVm01LQr3wBYhYXQkf+j0ZzDkfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(6486002)(52116002)(66476007)(66946007)(36756003)(4326008)(478600001)(66556008)(86362001)(6512007)(6666004)(2906002)(8936002)(5660300002)(316002)(2616005)(7416002)(956004)(16526019)(186003)(26005)(6506007)(69590400011)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Fios2023ukv/5yb66Q4S2nX4Zou/bjRPKnZpYwks5Ta9W6Bi5htx7c9HAr5j?=
 =?us-ascii?Q?3nfLkXN+aqkqUZ3w7krE4neeJ4QH1X8SfpHh+RUImMKoAYiWdNfXugeSU6qN?=
 =?us-ascii?Q?fxfeeJM1F40GoC6wX3R0+82mhTPaXJCb2BmfuEMbo292/eSbQ1hYf3ALYR2P?=
 =?us-ascii?Q?fmmEBCC/I8OtTvasoxdPUtE3cXh4yzkVnJzc61EiBl/h6GYr8hkh1sJhV5d+?=
 =?us-ascii?Q?5J4eEm1f8dGW3QaciNig2UWusbrwA/KykGDjAhZ3YwMjadQ2m20QCFqYUmvf?=
 =?us-ascii?Q?tr1p69ao+bHzSL4Q0r09AFE1OrCFg3dsizCNRbEgm/vWfExkILZQl5HgtpXh?=
 =?us-ascii?Q?ic5d/RQq1P7EaN9dTXD4DXc9xasOyyNNwdxsSTLd8dlvZJJ6TdB5i3PxdAc4?=
 =?us-ascii?Q?BeSX+x3iyWNaV74l8mwlk/5yOgPX/IW6Ifbd5wzoGpxjK3i9Fcsfz2UC7XQI?=
 =?us-ascii?Q?SKkKWqBloogdgTi9iNmI6ztK4JarYg3ZK6UxPSTvrgA3jYuTPRw/7lVsQvKd?=
 =?us-ascii?Q?re54a3qWDPa9brPb91fwIT4N3dDYoFblxTiAJez7pqS6ReKP6hf2WgGzsXYS?=
 =?us-ascii?Q?hU2Pf5yK5c6a+hJacV0b9Zmz3856R8E2Z2Q6XTxyF4Jw73FeimuWruYAFG9W?=
 =?us-ascii?Q?wNJLuzTP4QkPMzyngFOFWIQM6L1AjSUsJxQYId4Sh+nkc68WPx+MFaQ1paBo?=
 =?us-ascii?Q?VoiM0OVsazUO6+P6Gf2ilYjStAMx4tA+4FKLBCfLGRgDMOSR5Lw6gKsl2ZSU?=
 =?us-ascii?Q?XJ8hwhYu6IPCZ/JAZsfJhXhKgeR6zXfWIdIyVTvP5VjK2f7Ne8wcVskYao6Y?=
 =?us-ascii?Q?L4gUe4XLC2LDKa0nnFXZxExnZJFcNcSBd7VG+BZxSZwle1RxkYXO7T/qjymF?=
 =?us-ascii?Q?wX5GZ0XPRBDh7GNMjN1x/JZXzMEErfj5Ul63AI1+g8Ubraja+YWP/OMRlrmU?=
 =?us-ascii?Q?7jD3iGuf4w4ueoKcj/a4SAwWaBLYKmXtJi77chuRUUsBkd/SJ+nNy4/VLLMC?=
 =?us-ascii?Q?Nhwn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bab642-a1c0-489f-4ea3-08d8bdddc1b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 07:25:41.2534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Y/ajF231i88Sj/vNDFvPBBzemOK54yDv/tArQU9uvJJaDvNpMc/LcEyKFPPWrfUSjSwZbifXR4v8aGJps90Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2880
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

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

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d082757..12c8e5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5892,6 +5892,15 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE i.MX8QXP
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
+F:	drivers/gpu/drm/imx/dpu/
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
