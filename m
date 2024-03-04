Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7418386F981
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 06:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACCE10FC71;
	Mon,  4 Mar 2024 05:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="or0Vxr1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072.outbound.protection.outlook.com [40.107.113.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271A410FC71
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 05:16:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXNC6Ymy9+EccVWrKT7pbpUo2uECKO/4HHmsu+F5hYr6ecKVuigkV6hkU9TTuup+UAxfjrTFeTkTkcm2eqPTKYRKNDslS7Tx9UMecH1dzUbTExXlDF7M0eYhZoqK3gkfhfIjcpQDxPNpD+20Z/UQZqmYoK2v8G08Y2pHybO+lEkB5tmNFUY7TRqYmFESVvMg1ZH+aHWEAzKrgzmhoNUBYOM3iJQo5OROVDa1IcWI/fjCXAEqZaPxjpjbKSiijZeNb855yYMcxFxuzI8r1eUoQvEfvm50C2dUjGbci5tdMVoMFLGbf7jlvSjhT/lgZ29CgXaTzSIHqGuG1bXl4S9YIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXY+gyUBLqHr5OVGylRo6rD1OZwlsUDCqOi/+/20yMc=;
 b=JUYz6fWUaY+A0uGqgclzfvrCEd1fyVLY9UUFx7mCWO+7plAVLK4Xg7iLI9N1k4pMhH1Ker/jZ6Y25ziMOBNf0wWyWPuzUqzHF71UueTQorFiSXn9Ga+csux+UPOVyU3+yPx3b8CyQUyNrVrdsy7jjDu/lKvqVUjNlfrFh1SZsh54xQMFCR/KOwzkmy4AgJmeQFqGfqLNgoBbkC7JcLLSmAaAuV5v+xf591LrlY3tGDldqin6DtDrHpExLRpZRXk+Jej8Jl16mjqwKiS6MTyWDFYUSpNDLuI2Q32d9Bm7prQDbm8oByrwBUrb84pKaZDjtb8yFQaDjiCxIpHdI5c+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXY+gyUBLqHr5OVGylRo6rD1OZwlsUDCqOi/+/20yMc=;
 b=or0Vxr1cbVd9jasMSzCnvYWaw2rj1Px9v2i8CcXFP/v3KSrashu5lZIA1ZgFln3OVOHN+6flJ74e5n0QsycJ2JO1nuhiaHpMEn1JjKimu/eIwOZ4d9T+2ojdzUTKUPOKHvwBl8pP2c6qqGucmBBLx8pEi8qFqCh06hfyoUHyTTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6616.jpnprd01.prod.outlook.com
 (2603:1096:604:fe::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 05:16:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 05:16:27 +0000
Message-ID: <87le6yh905.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87plwah92n.wl-kuninori.morimoto.gx@renesas.com>
References: <87plwah92n.wl-kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh+dt@kernel.org>, "Lad Prabhakar"
 <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Mar 2024 05:16:26 +0000
X-ClientProxiedBy: TYAPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:404:28::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 578608c2-f880-4dc6-c265-08dc3c0a3e1a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/2aGs2unNCwc3kcdfhOgmzryeK4fysWVvWfOgG3a50ypBWyqX7BqQ6/+CExk6VBzrZ8CH8VwuKTsrT7hM3eDgjdb5hSuUlSAq02Sg1gYO52vGJnRj2/JhNTOj5pbkDaO9jbOeuB3gj5Nr1r/Kx7zwBqb4Wu98P27lPxqtzVqFR0TnINB809GaCNCQoeSmiIh3TTd4LWMBsC3vJ4RRGk/xZA7OptJnqunR+MhiRWXsGAq8+jV8WOI3zZT4jCfhjOtTJotYY13wsn4Jjch3FfUaPF2y52LRxt0ITW5tz7F5yc0/pQCHMhHY4PSMNqa8DT1GH0eAN8ZTVgO9DHOIK35TYf9ZOqTZk1SnHOPvXVRx6g/mLtkwCsvTg1881tFgoRkZF2+J3ewxdPIvFJeGmOdZzUVXqIXRgLEEX30O1pgt5Ivbvby9Z+aByZYSk3mVDDPyLkVin/uMq8/0CIkMYd65yjxnmwfweLwqHmJR++UjaSC7qNfnb00VNrP6aKL/otWJ0vIMfiqnn6peumTE1zCwY4G6Mfdtpu42KY8W845aZE60ewHak9iiiwCHjQEmC7FKH3XeRT01zgE3s+otosb2Ir0HGPvstlkwknm13zf+Y1Zx3KM9JbyMhaqJznk3LR3Tr3pTwAqHLpBtKAbpGpxW8GLvyPAj7lyRKxER16FvgA9NxfOVq722FmXABJMQ79
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+PcMLEJeq1866ACdnbANXcBqTQQVxTmkWzJ3rh9ibiIj5CPnsfr2Ob61thZ?=
 =?us-ascii?Q?gbnFaDEGSIZtG0w9XvJZ6CpwU3RQycD40rUlYhqIXsNRqkxWC4vthpFFmPBa?=
 =?us-ascii?Q?FFDJvqCC7HnatrtdSTRbfrxYB3atwfIH6XT1/x4Ik2rA6jTRqJBKBUewOWnN?=
 =?us-ascii?Q?yZEXWGWv/gQiehDYuGjFGK2C+hX/XEHwL1vfiQHWVKbLnCFitTP9YEIt1Nhc?=
 =?us-ascii?Q?p2jrqPnDHGBKDXDdfZgEPqQOtYftu9zawmMKTzXwEAlTCZPA5NE59WgD82bF?=
 =?us-ascii?Q?BJPU5nm6LxPY4bzSasRLBb7b4jVNHLsStRKk/j0Dijn4nJ4yFEGMxoOHs0i1?=
 =?us-ascii?Q?u5a5glYg8CSl5qIQe4glY9WATriIPAxXeFQfSMyMhoH+WbrBFpjTtg7tWo1P?=
 =?us-ascii?Q?+9cKPiHN87ouXe59PmMO8EeXZYosHYu4zVG+/CYb2SIlzkWXuaLYEmo6QycD?=
 =?us-ascii?Q?udOZEtkrzsky+dLjJaOJt5Segprf4KPJVu9whmMgljwd5VS5qDLe6ceOsjks?=
 =?us-ascii?Q?HLwzF6/lwoD/ctrK9B4ibciQ+7vacq6aqhchWLgGTS5L3/jQ1yAMkhFmiuST?=
 =?us-ascii?Q?GLXyoFrjUPVI6DtcR3sls/KTa9i8ZTt4ObhgnJFrjI1XCUQSSMjHv4aSliw6?=
 =?us-ascii?Q?Pm9iS02MHNLojKDBIbSghWeHw+RKSVo0/KapJfJ3uslIQdKKTd0tXh/+sfeC?=
 =?us-ascii?Q?vu8YoorWEYdXEBxwyJnvAZ/3uVzQVtF4R8P2CMYXj2OYO4WQbZJsGOJGBHs6?=
 =?us-ascii?Q?SOq3UVgM43igvVlDMhhy5LgtFjWQruy4+Ej882AmrazVUD7PXx9VnOvLSa/5?=
 =?us-ascii?Q?jpeqV+CTUFhv0XV+1Ir0j4jBO59eE/KgJWm60bA2oG+0c/y/zYTvFcHVwqAE?=
 =?us-ascii?Q?Y54tV9+UpkLIRbF9q9W8L5Mc5xkqREaAS8YKFzCl0ZWTERi2ofv4FwwXs8k5?=
 =?us-ascii?Q?Mt566y8gqRm/WkgHbRQrbJAPTr8OeTKsuzkEbaKwKsXFsjWNKV4+dGZQBCcf?=
 =?us-ascii?Q?JX5lw7KkJjiFGE821wmpZvSKqmzT7Iet6Aug3E+30FiW9bptf8mv3H4eQ1J/?=
 =?us-ascii?Q?rgIMs3I3QuKgiIW9b9IZLSnB89URiYRQb461qWYcjB4D79gLGNHC1ToKvG0F?=
 =?us-ascii?Q?9yRk4RrRGpU8465vA8lie3ADs3X8tTuLgRxXoQNeIPZs7OVQOLGTeVH6d3g6?=
 =?us-ascii?Q?DyWzuTkT9Cwh/xV/dwuIFpQBybr5CES8oWmxK/PLs2I4Hc4SM92/NlfWUGhr?=
 =?us-ascii?Q?DvhjJnK6EX7IsGkeIUNrFwk3wZPdQ5bl480RjSYZlue1sJERxcREFQuk6Imo?=
 =?us-ascii?Q?eJoVuHUV3qQWlk8nqM9z+P+Y5pQrjv7ci8E3sl/8zJcTfkNb4DIPEYBfE7Nl?=
 =?us-ascii?Q?5z6YRXzCZLFHbDLMw7Mb8pqEDHSm129mIb7/wtYlng7W83k4/6A9meaT9WOa?=
 =?us-ascii?Q?VY47RQ/WwDpPzJkabtbDGuvFyV4ts2+R/Hb/cZzUCreRWxdt5hI5PfIuMSFb?=
 =?us-ascii?Q?HRSC5QCBSAbUrVbbPAu5+MriS8qnzdO9LGZG4Y7+pWbTerGVeo4W3TT54pNM?=
 =?us-ascii?Q?GJw5dhiUCB4kjAuMJOeaJ/JjntWtES2Xw2E13zq8I8PN7Ep/3sivo5Xp0n1W?=
 =?us-ascii?Q?l/6xQ8160iMwoLwgoziC+g0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578608c2-f880-4dc6-c265-08dc3c0a3e1a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 05:16:27.0195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhSSEKTnx/dgyVDNFjDJWpSbLmGk28UrA6ogWsI4dE2rx3Cg9JTojAEGG5kyDga/r0NFCwykNKOEmnjKFXykJ44zJQ/t4cJoGROvUuhVRC0Wig0g+d2+N3nhyjjQLEq2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6616
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

