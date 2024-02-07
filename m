Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8591B84C3B5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 05:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7C71130F5;
	Wed,  7 Feb 2024 04:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="l93jM7wT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2042.outbound.protection.outlook.com [40.107.113.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D24C1130F5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 04:39:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfq1ARk8Z5+PJRhQZHGVHVvqzy7s13p10G7Ss92+5ONLfujRJxSct+cQ5ykiMUa2GVXf66hCygUIsvdknI3olpi7qKkLe36hkMAmTKT9QOQsFvrTJG0/LJp4pLU5UZsyy55Zg4u0RkbCVW9kUC+Px+wIaFBoT6OA7R0Q6Ro4yT6tgVBtV0cE9gF/ZWLVp6Ed235GE196Zl3fImsTCaAnRTWcbeZMyjmL6KyspT7ffleYQGrRNhSs6INgZc4boObIV3ahZQLu5znkhTb6qLRuy4C9THh6XqyrYMRWnXIK0FRBRf0FsWS+3pXz6lLNi5HPFbgTzClzGpDCX7qdfk/5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXY+gyUBLqHr5OVGylRo6rD1OZwlsUDCqOi/+/20yMc=;
 b=lZO4Dz/GNHo1h09jBNGewKP5aTros4FOvOWP26VM/UB6in1fjCX1Ydzt04DcQ1oNOWsaU/fh8FdOLX1Y0fIIFgUKrLs2RKGc/ABHp2JXP2BVYr9A5aD3rSmvqZVGyY3MVjhIUIomDXsaflbsIa9pvwvYf6TEAPk4SmhEvjtCbTkGXQ/0m1jqaI/D14VnUnYM+g5+w83biBTjs6pxzdKS8Aq5WxGOk7tj46pW+KuXEydwUCQv1osw6JiTFOFMzKF8ieFNrrlMNOF0iSuFI4NpI3GJj4bv9vO9Vy2rgedx3omovxCWVNrOl6y1AnzdgYYEf4y149jVYC6153fcYoZUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXY+gyUBLqHr5OVGylRo6rD1OZwlsUDCqOi/+/20yMc=;
 b=l93jM7wTF2zOE8TTd556QYt99eVQ3n2ES+gvDh1vespfIi5OHnjKfOFShMU/jupikKXayEhInajhApocMmnm7UvCk/JKe4TkEmGbVzumvAEGPJ/BfZXpJRnMFPdnHqVPLr4fu/vfCe46zpjwTt6qjcDVSDTV0A013Z4qvKerKQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11031.jpnprd01.prod.outlook.com
 (2603:1096:400:398::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 04:39:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 04:39:08 +0000
Message-ID: <87msscsxar.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Eugen
 Hristev <eugen.hristev@collabora.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] media: platform: replace of_graph_get_next_endpoint()
In-Reply-To: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Feb 2024 04:39:08 +0000
X-ClientProxiedBy: TYCP301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11031:EE_
X-MS-Office365-Filtering-Correlation-Id: f349be94-96f9-4da1-f038-08dc2796b92e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9NwH1vAjm0A7H+A7RaQVlgY7l38Wfr4bBws6+kSnFLF1dfcY+TVzL1BlCfcdbnmBizMmfz3tI7tz3e8t096MqPAk/ET4pfpSLwt12LqmnQq0oBJrBX1Mycmg8USG/9p4sAe5Ro0VwWiA6N48xu5uJIWXSQalED+ylV07tg1D+By44dbmouW2drdIJAbCvVoK042RkA/LyNDTF5mYVxj7NdNh3lWk16EVRikUK2/3Rme7uc6YZ0DFT1tucWD5EgbFsRJMPTVyljjemujlBjo+Mfko59HlYJsnZFSqpzK28er16Ren+7dXT3NaWbGHJBHJKEftqQTejKJ5m2MAeFR6gGCHavmErw7bX+YuTAhlqiBWPZzbVmwLT4nkAfKe0dre43m4HcwNBl8S6qLjNZY3mWARqYPITDCt3PFzbIXYB/c49oqlwJaWwd5SerNJLnw0087Oavmn1bwuRfM7aKFVRKubDPK8Kz7HNFaRO9cg7IGtTjVlN7GVMRvC0yM4LE8dQcxavBH9Qv6fPJAHJKte00i04b10FFquJ3O8lQvhY2d2GWJ9NjMYzKKg2CnAFfcv2OAQv9Jp64K6bb6g0g3JogGyEYT8xLaP7k6Y8C60X75h2/5yFawSfxANIfyF+mN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(38100700002)(66556008)(6486002)(66946007)(52116002)(36756003)(66476007)(6512007)(6506007)(966005)(478600001)(8936002)(110136005)(8676002)(38350700005)(316002)(26005)(86362001)(2616005)(83380400001)(7416002)(7406005)(921011)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RFE/dNmfzErAHBAAKAC/pFNwX2iCwdoPxYNv/pj8Qk/0/IGqria6sA4BHPCm?=
 =?us-ascii?Q?7bAcY0RErjwbDLWU5K4qPogjPtd4ilgTa2f4TguwZ9/npcrccGMrjIOMtSPF?=
 =?us-ascii?Q?T3wFXfLTncPYpe+DcBS8OktHOQi1/A2zau6ibZRO5bjzyL/tBmfbeU0es9MB?=
 =?us-ascii?Q?2wEaiV7+RIsRFxQRrhb8tUHRnU8nj5vNpYiMovcB+DqTFWBqpSe74xjAZFWU?=
 =?us-ascii?Q?ecNNbOtrlPZ1wWO3IesPWXJmc9kWtzd3RWbiorOX9zMjoxvpx0XXQIqTbUDd?=
 =?us-ascii?Q?nQJ6HJKlIJrN52Q916C6UWAtvDG39W7pSrmsfroKX5aJxfF1J8Z09dpHxHe6?=
 =?us-ascii?Q?hyf+GnnCUSvEBwVUDsnxPggFdY8OM8edVUwRUaFQ624dyrwcNmMZAWv9O3bK?=
 =?us-ascii?Q?MIwUbAdVZFm2g2dUZg3LvvsZJzYUxnJ60DbaW2mZSy2Xdz4pUZs1HV1apXbD?=
 =?us-ascii?Q?D1aRdp9dohyC+804aFThQX/CPqGEE9t3SpzMtWE+/BM1hjT0AxdvTNRtG7aa?=
 =?us-ascii?Q?fp+QYXE+H9h0TR0RvXlofLqK3M0mRBeA/36yQRKxJp+k/2CbDR9wIHM0sr6+?=
 =?us-ascii?Q?JZPQE/soaTPLIAORCNwFDoYBzinfkTsl1kVLzhhMMw5k3atzZCd3qU4gtcea?=
 =?us-ascii?Q?Zxz7hvxHPHoNrDplIkLQ9ZsX9bTX6cP6f3O1F3HHKscEfT94Tu/xJ/nrVqhz?=
 =?us-ascii?Q?ZSwo5rj7JcZHe+6wWDtJUWPVJaUsqUn0XO37DruuqvwSvLuvV8Tm960KTFWU?=
 =?us-ascii?Q?S9CLsnPuDuyyx/3ue1GdOrK2EEBLjT0wp6+EqCPReJD3FsPueGkWKZ+xJq2/?=
 =?us-ascii?Q?zyhPxauX4xETi0D2d4ACqvDwR8zTElvDPiCn2k5jhP6MFWGV8EiWBwa2ND+D?=
 =?us-ascii?Q?4DqllEw3O6QkHpn02b3vKbhvkmIJBz8ltt9FBsqKSrkAKfZiEBak7OmaodCF?=
 =?us-ascii?Q?2LoeGtLiBR6uZnsl3OJKuu5EKeguO20D08Qo6qQE+eV9FOo7sBHezOwt8FIj?=
 =?us-ascii?Q?dG477bKltUi5prM2HJCvOgogrvvUOb9Sb98df5XBr7j+V5/OZqYekpLH2ft2?=
 =?us-ascii?Q?5UmFlAzC+w8hhGcZKK6zMx73g1GlEmJT/QAVPwfv+Y//GbFQ0W6Y9q5o2Zeq?=
 =?us-ascii?Q?35Yl/XNeAwQxzsPmy9fMuFdu7YrLEhhD/6SvNBTMlTkt4a0fgGhFYyuU0+ES?=
 =?us-ascii?Q?zzvNJRNg0YTv9Dbo0J9tX7zkhxOrppy9iLeRBJp6HNSEtj4wiwqrhEtKi0II?=
 =?us-ascii?Q?9FXNvC1tTEFaSx1n4YV8aegE0XBQkV3e64veSwCPGEH9/ZIORNWOPA25XlEU?=
 =?us-ascii?Q?OFKir2SQtjaPBzGtYvVnUYbdliAdMXluA04OxgvWfmKgrz578y7hZoxTuxOg?=
 =?us-ascii?Q?cs3TDW70f5Kl/GkavH1DXQnqM+I9uzhn9ZNKc5eLudFiTQ+5eR9H1l3fYZBQ?=
 =?us-ascii?Q?bX7r18rsP9pr3M9n7kYyL17MV6nEg53akzKm+03y1h1yJ2rcgtgoOcdN6Qoa?=
 =?us-ascii?Q?Ou/uvDdGOBdeMc3iEzSOQAdgk3sYgE6OJLSxea5K0UxTrrvypLxOU265k5YX?=
 =?us-ascii?Q?SrUxJdw/F2A/mD02ETNQdBDnXJxEdTTEhRpjogzcQpa2BRDU4VNjvAPRdFEF?=
 =?us-ascii?Q?mgAJF5EOR3lXWil4oyO2Wl8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f349be94-96f9-4da1-f038-08dc2796b92e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 04:39:08.6159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3Rxc9V2OMKCYUyLwFnZrx/DwGM0yCB2sxjpATGniPoQybu0GQe4p9rPfpumYj6rS0YFA/EiYkbQqnwjCOuTLvhKgmQ1syS3FHJh/Jp64FuVU/L019kEDFFSxxTjM4fs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11031
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

	- of_graph_get_next_endpoint(xxx, NULL);
	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);

Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/media/platform/atmel/atmel-isi.c              | 4 ++--
 drivers/media/platform/intel/pxa_camera.c             | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is.c   | 2 +-
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 3 ++-
 drivers/media/platform/st/stm32/stm32-dcmi.c          | 4 ++--
 drivers/media/platform/ti/davinci/vpif.c              | 3 +--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platf=
orm/atmel/atmel-isi.c
index f8450a8ccda6..c1108df72dd5 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -834,7 +834,7 @@ static int atmel_isi_parse_dt(struct atmel_isi *isi,
 	isi->pdata.full_mode =3D 1;
 	isi->pdata.frate =3D ISI_CFG1_FRATE_CAPTURE_ALL;
=20
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
 		return -EINVAL;
@@ -1158,7 +1158,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 	struct device_node *ep;
 	int ret;
=20
-	ep =3D of_graph_get_next_endpoint(isi->dev->of_node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(isi->dev->of_node, 0, -1);
 	if (!ep)
 		return -EINVAL;
=20
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/plat=
form/intel/pxa_camera.c
index 59b89e421dc2..d904952bf00e 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2207,7 +2207,7 @@ static int pxa_camera_pdata_from_dt(struct device *de=
v,
 		pcdev->mclk =3D mclk_rate;
 	}
=20
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/=
media/platform/samsung/exynos4-is/fimc-is.c
index a08c87ef6e2d..39aab667910d 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -175,7 +175,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *=
is, unsigned int index,
 		return -EINVAL;
 	}
=20
-	ep =3D of_graph_get_next_endpoint(node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return -ENXIO;
=20
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/driver=
s/media/platform/samsung/exynos4-is/mipi-csis.c
index aae8a8b2c0f4..4b9b20ba3504 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -727,7 +727,8 @@ static int s5pcsis_parse_dt(struct platform_device *pde=
v,
 				 &state->max_num_lanes))
 		return -EINVAL;
=20
-	node =3D of_graph_get_next_endpoint(node, NULL);
+	/* from port@3 or port@4 */
+	node =3D of_graph_get_endpoint_by_regs(node, -1, -1);
 	if (!node) {
 		dev_err(&pdev->dev, "No port node at %pOF\n",
 				pdev->dev.of_node);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/p=
latform/st/stm32/stm32-dcmi.c
index c4610e305546..ff3331af9406 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1855,7 +1855,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 	struct device_node *ep;
 	int ret;
=20
-	ep =3D of_graph_get_next_endpoint(dcmi->dev->of_node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(dcmi->dev->of_node, 0, -1);
 	if (!ep) {
 		dev_err(dcmi->dev, "Failed to get next endpoint\n");
 		return -EINVAL;
@@ -1907,7 +1907,7 @@ static int dcmi_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
=20
 	/* Get bus characteristics from devicetree */
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
 		return -ENODEV;
diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platf=
orm/ti/davinci/vpif.c
index 63cdfed37bc9..f4e1fa76bf37 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -465,8 +465,7 @@ static int vpif_probe(struct platform_device *pdev)
 	 * so their devices need to be registered manually here
 	 * for their legacy platform_drivers to work.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(pdev->dev.of_node,
-					      endpoint);
+	endpoint =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
 	if (!endpoint)
 		return 0;
 	of_node_put(endpoint);
--=20
2.25.1

