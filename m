Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96A84C3B3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 05:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8D61130F6;
	Wed,  7 Feb 2024 04:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Xa2Ta4NK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2059.outbound.protection.outlook.com [40.107.114.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645BE1130F5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 04:39:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuLEPCHTUmDlVDKQIqjR033xrSUfD6vLl/M7QgH4x2wlcQfJQ2dsJuPr/yFGtGizu0W2Zf3nJ4BeoV3uMpJ+iS/m4o8SISX5NGqMsp57rkrtIKDtkCvKlBHFneo9WppIn47vZYatXslgim7mDDDKim8Ye9gaXNFpnSsZfs2f9QnMcSAPnzO/4Sy8BTpbDLeTwJ+eakAsUcZsx3krCOVUJMXh7pHri/CZMGBZYHraRDz5/Ozpp5xcIc2yYhGc//Fk46LiGzg7UVCC201Rq5niU0SL37q0nA+FNHa61fd95rsIxwvpf5z5C5tg4pBXWRh1nnyxHNzSKw/QT0d3TuEx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7lQcPCnpEicxp36lyHMSuSuqJ+WxW2JpXlU2FrAGS8=;
 b=jWuUqo4G0Oo4K6U/5Vsb3mSu6jH2NiwPub5J3ALk494MIdWN1xM5hBRxTjpnQNJVIIKqvMAOBZGH1QgPIbpT3DGQ1lyqIPJ/AINcxvLgxz1ZeUp+XN8LAjwqS/tIGHJlfbCE7kw0TfXyIXhjb6I9g84WABOGcGEpQW5055jVXvoAzUCBy8VBN1gWkvavKG97U4CgUbjWdZC6ZCI4MbB86cyu+ifGLNNW2N56oqw2HphVCpW82DsoIZkolxibeCFkpK3jt6/5ubUvz+W/3LWBLW69UhKLxN+67+v8HAHIX0Cii7egeD1M0XrxqSJ2kpE4vVSsiIQIFEJyhAVzyvExSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7lQcPCnpEicxp36lyHMSuSuqJ+WxW2JpXlU2FrAGS8=;
 b=Xa2Ta4NKc8lwIimc97EPwgbASu3wtTLqqZrNsbeCkoX2H1W5NKfNlTIE3dBQOWSVtP66B5w73hUNJThHgtJFIzidE8gzQEcyldOfkkBA3hn5nK25kZ4/ljbwh8mRDZL0vM1CVQ+x6xHnOfev1cu9fLQJ0SZPnJK5V259f+QYmbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB8022.jpnprd01.prod.outlook.com
 (2603:1096:400:f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 04:39:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 04:39:01 +0000
Message-ID: <87o7cssxay.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 2/4] media: i2c: replace of_graph_get_next_endpoint()
In-Reply-To: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Feb 2024 04:39:01 +0000
X-ClientProxiedBy: TYAPR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:404:14::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: b732614c-c7f9-42e1-a6e1-08dc2796b52b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsvH+XHCwT7QmyZ+957XGgZpj29DGoh45Gi/j4ZuG5W8y/fD9XOZPlAtpFVxHY9xXeCNkDmocSP4wDxF1aNM02aMZMiAJ2rRKco2JhCO/kr5er70ZVplUblBvtdh0YzFi4P9xHxjUN5MGdf8lsnUb7EfJ2TV0eGlb7PU1sSZ3iKv278uRzZSsV9j4N/3x+KJAeS9dkkKoeAbFoUTCyYIj+h7JeXhU2QnCA5LJkJh2ATGBjBIk/f8hSRHMRGK0YD2ot6c04sc4TKvUBIugDbUl7YC3ssVzN9hOLft6wU7fKAkh5XIXZ5pTyINnomAdRdSuVUS+63SKa0JkfI/yzWuCHzqGIoDNJYaLT0V5tOAMsx5L048y2HOU8jhlXsrtlnDMDepts6upFGPZcONePoz8U0M2fVm7ZLWsEnVvYhVekGAGKu9vZVcU5Zj4xqYxSpYgK4vXVfue0eM8xBzp9nJZCfm1Ce7k2dQLAMRQCTE0Kk5d0OwLWzRJiZGF6K/jtn3w8airwt512gX5uxfFuBdDKqTTi38OMd95NRwZ5F8ZXup3tBsPtPFOJvACxmkMgvIVoGn2BJhyzd46TDMqnmgz0N823ik6VFrMdFI3UFjxzchWMeB5ArQRrQ5WqYfBWB2AirO3/6nvLQRiHq2eNJX5Ej0f3aB08CAIgfhk3W9i8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6512007)(6486002)(41300700001)(66946007)(66556008)(66476007)(38350700005)(316002)(26005)(8676002)(8936002)(86362001)(6506007)(83380400001)(2616005)(52116002)(110136005)(36756003)(478600001)(966005)(7416002)(2906002)(5660300002)(921011)(7406005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?apwHb5LisBtty1Hb1k58GulSRYfc4Wv8q7DG3KGfUymuKn1jbMb61V4Bi/kY?=
 =?us-ascii?Q?4fYisJFSAqY8jtIESYIQkgCNmn29AINP6SGkjmii6adQDsUDO407sE0i9hUC?=
 =?us-ascii?Q?xdBIRjFxOodvHTe9UvVQ6Qbcq0uUYZ0FguZcYYnvtOuYf9j9bSOA4H9pmSU5?=
 =?us-ascii?Q?0OYocrN7nkroiPFM44FEuSnMI3jqnGuqgg6r+NsSv8MeUFmReA3hK+f82T38?=
 =?us-ascii?Q?5FD1BM0pf69FNQID+4AKFdKyTzqmtJ/hAc0MbbxyWg9zqaJnS2IOJXpGnZPB?=
 =?us-ascii?Q?A8cLOM5WA5ZbVmkMJA/7q5/cyc8+uUx0gGZtW3k6PEfZ7ewMN0ZpcMqaTC9/?=
 =?us-ascii?Q?JXBBqMbxI+of1okTn288ITP/s8j+G6FVMpInECTskB1TMIJuMiugsE89vin+?=
 =?us-ascii?Q?RRANrfYc/xlsHukUmP21z7CFv79Rwdp+fd6+FPstEzhdoreOjEyy0DVAy49M?=
 =?us-ascii?Q?Az11W/GHcfNvPJvSum45q1Ob9w0sfJdv93XJJICh/W2tOy6W23Q3nGSNznY3?=
 =?us-ascii?Q?m6frGIoVfxiAuSicGOkYrLgj+xf5ALzTuc7CvSPjKt9GNcLJyQEiXBCSpvU6?=
 =?us-ascii?Q?a6WLqEplTg+hTSmxe7QPWYNz611pjQIJZY5hsZ8Qo6F7lMeewFxmETUnfl8l?=
 =?us-ascii?Q?/XkpP9n+j/p1bFIBFQv1OJCm7chx5C9Bz6N3/8VuLMBDDPkMkaCyOm3hn07y?=
 =?us-ascii?Q?rKBbKrUAi2zYrlgmdSlS4rTVkW7u6f+cVUmY6DSeTyIXEjD1TqX3/DFUmMiT?=
 =?us-ascii?Q?gH4YuvXK2OFuNX+Ayw3OcBdOKZfdDHE/U3XriGH8L5uokch6oc2fQj0Xa/mG?=
 =?us-ascii?Q?fdb8Tn6QcokB31+VBGNjxBFOB+A/iXQ4g164MGtH4K9yOeHskpM2YwdsaFX1?=
 =?us-ascii?Q?piwdrtpdYXVJ7yxhk1ptsP2m+ywzMZivpsBDN7XuhBR4SeHm+0/RRmKgHySO?=
 =?us-ascii?Q?J0buIV5xwyQ79i0NmeWgOmVq5/rphzwsrGh7IW2T+QtRwOJ+reXarlLCdJyG?=
 =?us-ascii?Q?TKOqokUiHOmXnba3Encvn7OxtoWX+CT7rYeBIDdzqvUfR8KzQTyn8dhrnYRA?=
 =?us-ascii?Q?RtWdSYV/L3k1tnHPRNinkBv8B7H2D+aK17Z+R4RwqzMT+Crlj11w1wofYVoG?=
 =?us-ascii?Q?mSNI/ya2crnTnU7SgDffXp3eIz4uvcw0EZk+ErdUXWqvtcpjH6xDWrlvug7o?=
 =?us-ascii?Q?dmh/t0RpOtNt13URfxJwEHvq4yfsuH8KMhvm0msasyBUMns+/34IkygI1VUf?=
 =?us-ascii?Q?lXVeQpPBV7b1QEWqFxB7WTUmj2oIrQPjFHTQVfywnwooJ1LCOpX/MTDHkw9Z?=
 =?us-ascii?Q?djizf+5MxnAqpv778Z3oSQ4oNecPhxXY3EcdAMXK4yAYnQ+ggP2SlqUa+A06?=
 =?us-ascii?Q?paRa5JuIq/uT6AzNBUJ/YbNUgyB41h5ar8sYqPcN+5mwXiyZDZuHE0ZR9OMY?=
 =?us-ascii?Q?2pEMirwbOa2z47B+xSYcCnmOz4t0+s6G3uNrC9pjirAaayFDudkq9XcRCYmL?=
 =?us-ascii?Q?TtIgF5kARhjvO9QnLEu7BrArf2k6ZH4Yk0sKmM12YlG36OxzGKCQjE511AS5?=
 =?us-ascii?Q?2jfoPAN4TlY9mDrwa41g5ypQadzJhz9axUecw9J5UNn3xhlK0CJ0MnyH63I6?=
 =?us-ascii?Q?gBYv159MzznIgPkYz5qrb94=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b732614c-c7f9-42e1-a6e1-08dc2796b52b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 04:39:01.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uth2EA+pgGVKY/We9lkJyyKutlW6ohwJ02DymlA3zSjToKBNeo1uENmENI0djONXaFsbsfNvszZ+4L02Qc11ubAhTdnhy30x90JTAbAR0QRWzYpEohqqUxribmVsehwt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8022
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
Link: https://lore.kernel.org/r/9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all=
.nl
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/media/i2c/adv7343.c              | 2 +-
 drivers/media/i2c/adv7604.c              | 4 ++--
 drivers/media/i2c/mt9p031.c              | 2 +-
 drivers/media/i2c/mt9v032.c              | 2 +-
 drivers/media/i2c/ov2659.c               | 2 +-
 drivers/media/i2c/ov5645.c               | 2 +-
 drivers/media/i2c/ov5647.c               | 2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 2 +-
 drivers/media/i2c/s5k5baf.c              | 2 +-
 drivers/media/i2c/tc358743.c             | 2 +-
 drivers/media/i2c/tda1997x.c             | 2 +-
 drivers/media/i2c/tvp514x.c              | 2 +-
 drivers/media/i2c/tvp7002.c              | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
index ff21cd4744d3..4fbe4e18570e 100644
--- a/drivers/media/i2c/adv7343.c
+++ b/drivers/media/i2c/adv7343.c
@@ -403,7 +403,7 @@ adv7343_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	np =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	np =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!np)
 		return NULL;
=20
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 810fa8826f30..319db3e847c4 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3204,8 +3204,8 @@ static int adv76xx_parse_dt(struct adv76xx_state *sta=
te)
=20
 	np =3D state->i2c_clients[ADV76XX_PAGE_IO]->dev.of_node;
=20
-	/* Parse the endpoint. */
-	endpoint =3D of_graph_get_next_endpoint(np, NULL);
+	/* FIXME: Parse the endpoint. */
+	endpoint =3D of_graph_get_endpoint_by_regs(np, -1, -1);
 	if (!endpoint)
 		return -EINVAL;
=20
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 596200d0248c..f4b481212356 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1078,7 +1078,7 @@ mt9p031_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	np =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	np =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!np)
 		return NULL;
=20
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 3ca76eeae7ff..e9f5c6647f97 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1006,7 +1006,7 @@ mt9v032_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	np =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	np =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!np)
 		return NULL;
=20
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 1d0ef72a6403..d1653d7431d0 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1388,7 +1388,7 @@ ov2659_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	endpoint =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!endpoint)
 		return NULL;
=20
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a26ac11c989d..9daf06ffedf4 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1056,7 +1056,7 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->i2c_client =3D client;
 	ov5645->dev =3D dev;
=20
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint) {
 		dev_err(dev, "endpoint node not found\n");
 		return -EINVAL;
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 96c0fd4ff5ab..7e1ecdf2485f 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1363,7 +1363,7 @@ static int ov5647_parse_dt(struct ov5647 *sensor, str=
uct device_node *np)
 	struct device_node *ep;
 	int ret;
=20
-	ep =3D of_graph_get_next_endpoint(np, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!ep)
 		return -EINVAL;
=20
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s=
5c73m3/s5c73m3-core.c
index af8d01f78c32..cf6be509af33 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1568,7 +1568,7 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
 				     "failed to request gpio S5C73M3_RST\n");
 	gpiod_set_consumer_name(state->reset, "S5C73M3_RST");
=20
-	node_ep =3D of_graph_get_next_endpoint(node, NULL);
+	node_ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!node_ep) {
 		dev_warn(dev, "no endpoint defined for node: %pOF\n", node);
 		return 0;
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index de079d2c9282..6b11039c3579 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1849,7 +1849,7 @@ static int s5k5baf_parse_device_node(struct s5k5baf *=
state, struct device *dev)
 			 state->mclk_frequency);
 	}
=20
-	node_ep =3D of_graph_get_next_endpoint(node, NULL);
+	node_ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!node_ep) {
 		dev_err(dev, "no endpoint defined at node %pOF\n", node);
 		return -EINVAL;
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 2785935da497..872e802cdfbe 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1895,7 +1895,7 @@ static int tc358743_probe_of(struct tc358743_state *s=
tate)
 		return dev_err_probe(dev, PTR_ERR(refclk),
 				     "failed to get refclk\n");
=20
-	ep =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!ep) {
 		dev_err(dev, "missing endpoint node\n");
 		return -EINVAL;
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 1ea703a9909f..8e4a0718c4b6 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2310,7 +2310,7 @@ static int tda1997x_parse_dt(struct tda1997x_state *s=
tate)
 	pdata->vidout_sel_de =3D DE_FREF_SEL_DE_VHREF;
=20
 	np =3D state->client->dev.of_node;
-	ep =3D of_graph_get_next_endpoint(np, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!ep)
 		return -EINVAL;
=20
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index 5a561e5bf659..f9c9c80c33ac 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -987,7 +987,7 @@ tvp514x_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	endpoint =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!endpoint)
 		return NULL;
=20
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index 30831b4b56d6..6a04ffae5343 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -893,7 +893,7 @@ tvp7002_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	endpoint =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!endpoint)
 		return NULL;
=20
--=20
2.25.1

