Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C39685B058
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 02:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BFB10E06F;
	Tue, 20 Feb 2024 01:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="YhRd8sPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2081.outbound.protection.outlook.com [40.107.113.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F222D10E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9kwTEE1DCnjV6Q3Cqc8HZIarRZt4VzpYlMCZKkFgTU5KnqMVNtN6S4Me14LScmE9C3OEBOgRwkHA8466xhTbp/qDNEplL/TCt/BO2iaZGd82JXRMoohYfyuCs53yEPCedRCOa53YVjQse1+M4am6rVUqer+rwvggyG0XNl4eS3PDYWXbpGaxJgUQZxKK5J5lcqTaCgm+hJDBkhVh2yinGByxd+XLnRhljUeFKo7QU/iLraKn963orQb5v6Q446s2ygIl4c69vUazp9H2QFW1+48D8Ujx1HheB2BKsM64BmdT7rA+hWDlEZPcB84devDQH059asNPTiScqx9Xkizlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7lQcPCnpEicxp36lyHMSuSuqJ+WxW2JpXlU2FrAGS8=;
 b=Ch8og6o7lzGG4NF59n1pchYpehpu+UOVX6YNQJf1zDA31b53fAHfdixpwLvDxmQnyeTO5QTTqhkWry/7WHubTW4wdyU5APcGNMy6pMPHvHUOsKI4y5E2KJbnjOHkFh7jHKYYd+lYI1d5/8ju9oO727usAoin4BqEIbMyKDIVEV3xoWSXKdYuEGcVQzxtUaE7Jb+zl7awesGQKIQR6xPgMWiqtNUnahBJFTS3SbYg1ug+lBHvCYxV8NnU3jUOTogFh4e/gvp3w3rKIvyKOfPopaBjiO2WiLW8DhmHOleyOqY01vxZW8SiUH2Y6sygJYv8/VRIkszy6d9a8jgFzjdQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7lQcPCnpEicxp36lyHMSuSuqJ+WxW2JpXlU2FrAGS8=;
 b=YhRd8sPzYARE6V3YiySA+dDS42qUsnQuuqX+Bga10Tr/0HBwBhUI5XatGyTKUHl+lcgLXy6VHRG8X137eKUOYZgSBEfNBkAxp+zb6DWKOSsoRv9uOK1VtdxrOppiMGh9rblOmh+1cPjxLZcRhVrfIv7fnIrEG8FRt+nXtlQdhSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10730.jpnprd01.prod.outlook.com
 (2603:1096:400:296::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 01:16:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 01:16:21 +0000
Message-ID: <871q98kk9m.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,	=?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>,	Alain
 Volmat <alain.volmat@foss.st.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,	Andrzej Hajda
 <andrzej.hajda@intel.com>,	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Daniel Vetter <daniel@ffwll.ch>,	Dave Stevenson
 <dave.stevenson@raspberrypi.com>,	David Airlie <airlied@gmail.com>,	Eugen
 Hristev <eugen.hristev@collabora.com>,	Florian Fainelli
 <florian.fainelli@broadcom.com>,	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>,	Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>,	Jessica Zhang
 <quic_jesszhan@quicinc.com>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Maxime
 Ripard <mripard@kernel.org>,	Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,	Sakari Ailus
 <sakari.ailus@linux.intel.com>,	Sam Ravnborg <sam@ravnborg.org>,	Sylwester
 Nawrocki <s.nawrocki@samsung.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>,	dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,	linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org,	linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,	linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
References: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 2/4] media: i2c: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Feb 2024 01:16:21 +0000
X-ClientProxiedBy: TYCP286CA0334.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10730:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3f2ac5-f0ea-41e5-d4c5-08dc31b18c7c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lgL1Mkw6zGLSdeMpQ1KC9RT62i4MXcYnqXqAWzU0VvTDnFlj49dMBAw4OOMS3xSK8MfIKUTjIFjNWsIK0BsPhaghivWoh0PwbZejfSlQSRRoQBNJJ0If8fddMl7nMIbp5ASck1QBRCpJd1aQIBFCRuyf8YoX1cqIvcaMErcZRVqX+Ti/xvvThq6z8oXaVJ5cmUkIKRQaEvQfW69Duu88M3HLmyaros5+d3j4uo1jfIXAfXFMSWtjP22tUCZqmNJ8MoCG+j/ZUpdx5pV80Wx0BnKnrko0EvfnIyqG26PHRoHcxhm2ksVWn8U8vNUowFAMhxGbrnHf/NPpVca3qURpGN/d3ygOkPAqW3KiuGby9vxgliQbX/n8ZfF+pTmjuUup8nVKOiMjgaTtZn7OAQUrBQWDAUfVYFMPsCfR+UYc2GKeFyrqm/qbkwdpW7qmg3xD8pfAbPuL6kXD82kvpoK+2B8ddobuzSWBDncDm/bL/ZFIWdFDP5Og/spXdWsSRQwlrulwRu5tAwoR2+5TU9jiuTg1ONUWffPksTFtfeANuxwi+ibei2Gv20eI6vUM0aLIBtGECo5N1pvtryDIdizc/Bea7X1AfLQGn560gtWjQte4fhXBJEPDodJKT4rvoO/H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38350700005)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgr70iuoPHML9wJZ6u0YxeKxF6ezAuFvVTgJ5+kQG6wFUzodPhmZpKwvcWdq?=
 =?us-ascii?Q?MsEGCpwhV6VK3SdWAxj1JkvcCJj5F+z5Q0MTN9pfeAFsBv6R12igNx9yCuF+?=
 =?us-ascii?Q?QOUXVy3lK1Nhcsgmm/b3OSJGU6vyiWfkkWtqt82fguxmzqzTfW9nxUlg3WwA?=
 =?us-ascii?Q?7sGELcux7Xp7NskByVPCvRfrDhFvBOFBLgl/1589JxKz0ZiFOH8LfxyY1slL?=
 =?us-ascii?Q?AWcDNQbabcVZLF8ROf85k4+HHLhI3xzcJiC2EK8e84ieTzR4wJf5FrTCzKw8?=
 =?us-ascii?Q?fnLrP/7TO17uEOPD88ERmjkKc8nrX9umuvE9YukWEXwI9d5sT8+a1dvKfxb7?=
 =?us-ascii?Q?44H9LFDrOBP/Su/0k6H3cZrldOtO3+T/8QBTGD6TVfGGMINYJhH5gAVPhi72?=
 =?us-ascii?Q?U8rl92XzgubMDNRDWZ4FCPoKVwW5S8qMKBNPyx63kpQy1mRB9pBbjZ6wvzWd?=
 =?us-ascii?Q?ZfHHFm5qUPHfc/T/3NV2eFPAdFZ31dDdITVm4b88FrlxfeZCHCqb7NzHiv2/?=
 =?us-ascii?Q?Qzyp8LR/oTsUW6hLZq4lH6kWMjgdhhnM8CCWGevJ5+pFYNMiT+IYe996cHTi?=
 =?us-ascii?Q?nLHJpW8zMV+z8rqmvhGtE+7ax9hx05i3KLhj0l1nyel/vF4EubSP8Mh03Qfz?=
 =?us-ascii?Q?pcfRu9PaAEnW2egukxUZaFSF4giL7Ggqspw9wR8SfDEhEK+hEeWXKHStCaE1?=
 =?us-ascii?Q?sH237FMrnQErXfba7yz318e/kzeego4atP8S2nKeYzA5Gnf9SDvHpO1EnJAO?=
 =?us-ascii?Q?4TjmbXrizIHceFdmXGLV2PrNx4zkmEYQT2mqslurRXKtcnmYv1gHbud9DLZU?=
 =?us-ascii?Q?zfdyPg2ss9oKGhnp0rvN7vafeMv1KFx6hfnUPO5w1Q/QlqciUoF2FTRcg4pj?=
 =?us-ascii?Q?y+KqpgT1KDrb00JsFOJ6Wz9oSMMIttT+uX1r8G/YHgFNr3PsifCP8YVm11YK?=
 =?us-ascii?Q?FuE5GfwPRc64Bn8Hbjlwirc2Ekoh0g1uLUhXWVIqjlxcdvgCdVOLWgaVVv5I?=
 =?us-ascii?Q?VF0sboc4C4pU5YtQd9OvL9GADMNXpa2MPWfQ/naBboSsvkh+/scYBSApLndM?=
 =?us-ascii?Q?lHA4hys0QeBBPd7bOwGZxJJVozh/7DV3EaTHmnUJIGlBjigMBtzfeemdGRZl?=
 =?us-ascii?Q?UebsTFFg8CD2iN9uPX5kb3f1KAZzmpZe3oxPmieK+A01ido2frxV4dtvzXzS?=
 =?us-ascii?Q?8PpQIHfjoILkGegm+UGdbjnqE9D8UUQE9yp+Yt1dqXbaDRRxLsHMG1LcJSY3?=
 =?us-ascii?Q?VNxQhocPhu6iKkcc4NrEQEnn3dfkixTABOx7oE9e6msUVIzxPYUdXnNaHtKG?=
 =?us-ascii?Q?/tWYqKIxSXd51yiTVcmNtLu4zzS3fBCgvq4z8el/dIpMeoOx0MGfkHdx04w3?=
 =?us-ascii?Q?EWaQO/MWSX5CR4ssmu8g8shs25xGZ0v+v2qQGWbIGXvvLYrCSbIH92EKm9K9?=
 =?us-ascii?Q?jJYHYIUQOywqlVMQW9SIq3AVtvPuJd1qFCjce561W0WNt55YR8nmPCNT4CEu?=
 =?us-ascii?Q?+HrXH4+7O34EyltSYyv7T+f4DHP3JkAUh1EVSJRSRLViUps+AHFnN/LZvO5E?=
 =?us-ascii?Q?EasSQG8lxi3IX4eOLz/Gr5zaagvWV/N5by1AUCkTSMNRSEDjPeIjub6W0TPT?=
 =?us-ascii?Q?D+Ranhd+pLfQhRijK/ukUOc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3f2ac5-f0ea-41e5-d4c5-08dc31b18c7c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 01:16:21.6682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFlkXyma6O4KGBqbKn2apHRSgZuxGoO8G4mBzm2sMSdlzy2yL5cETvSMoRCHsskc+Ildw9xzynlymMbLMW0KNDDryenzVuFjvYrPf/kZI6udd8N40onIEqKBfposQdv2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10730
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

