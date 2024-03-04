Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33986F97B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 06:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C4210FC6E;
	Mon,  4 Mar 2024 05:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="N5EPfGSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2052.outbound.protection.outlook.com [40.107.113.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A649310FC6E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 05:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4sCZqc+KjXNPuZQWAi+uva8+E6krowfYosXTJpRYWzJKsO15dWKKuTux8sn7c++00eZ+4UFh50Jy/55QtdX0qbOx5th2qT8UjixXjTDzH2Gu1gBDhTXu11MPVJZdRQPTKx++45Jg229G9MN71iLldUN+vRz94MNmF9fU1M6E41VWkreUG/aVJcjCEz2eyGhyvwh/UtU7oguSVAc1lsOj8JhSALihUGpJ7NGkL4cEyt0zTNCavEzNd4VSLmQGxAojL0Afzmz8Hl1RUJKkiVXnVHeR/1MsvnuUiJNUDWbIVcNy/v56ZdWrIXArJDh5Mb7JPdsRY0c3VpVs82/5PYYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7lQcPCnpEicxp36lyHMSuSuqJ+WxW2JpXlU2FrAGS8=;
 b=LHSxpSJFiaasUmo5ohk9AL/DlpRsGvpUgoJ0p9kO19CGQncRoNxv4kjlPX9YlXownuzjjY5WLdozl9evncKCCCPc+aMMfv5BkMbzAJQSoI2DQR2drAHivYrntzh1ceMdmXo2okdDu7H6Hn3bB8sldOgTbhpAb+s9zjtDs7cBucdbSzVf9RmXq4wozMyYpaTqi86Gz7RkFa+n1LYJRZrhXDbSM7zPqhKO7Wu9WpRbLFyxYNcLXhUEbqcrmPyc0wqPkCtWPWmxGRfCQLs7ggxlr3n4DO1BBTpJ0MRiIy3yhDt5IuKLO1BrgT1PcYOeQMc4fOkLPyG0FHeEPQ8p2P6Lew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7lQcPCnpEicxp36lyHMSuSuqJ+WxW2JpXlU2FrAGS8=;
 b=N5EPfGSq/blXTa5/njJulfBb5IZmZTlpM3dYZfd4OQHUMZT5FjzyO0fhAEV/v6OQ0veTIcyHEKcstM0Rat/UfPxX4CTt3LMktwCmKjCbqpFA/BHLalsgL+YTtftuh6Q8rj+ChR5jjn7wsVhXrKhJp3l5ewJ0AE8tkAYWdVM9yUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6616.jpnprd01.prod.outlook.com
 (2603:1096:604:fe::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 05:16:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 05:16:06 +0000
Message-ID: <87msreh90p.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 2/4] media: i2c: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Mar 2024 05:16:06 +0000
X-ClientProxiedBy: TYAPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:404:28::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfc520e-d541-46b4-2f39-08dc3c0a31fd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMQgnG0E2+Fg7Xx9hs1EciMqsd4hE6/ZRy9ED+wMk/NOsIzipLur5RhVErB1W0vgY6C9Uf35kaK3n1c5rR3QE6Sx4xuLhNzusNOrG1Ztl65K+z5vnQEYXL+9gzDka0eGvoZ/a/Asiygm2uzkBnLf0+l7bUEQnGtRskMzHWoxz3T0gRR4XlSJ2PKkTXjg5DdfMhkVOa4WgELd3dKcFM/E3QZfxUBkcJA+GA4pBcvcyllAmMTWc/nQancksOA8kJ0VXegJiDH8HMo+IKNAzLBCPKgArFXxINHk1U8jaA4L2s+nsCDMFU/hNIrfnKt1WVR1UOyh6FFoVekH7b9pMqMqCLqHFYsES+58gfCQWu82UM965VTGRZ/XlGI9lvLzm/jT0z8ahOmM2s9YnXiNkPBSV4Dqu5Q12a3tS6JMLprfBlq1YrzjZJBti+R5v8nLN33mZqnZs20PGQPV62Xt2WFKJsbOJgpZ3lAVS6HPoEN8QzWzUZvRmjWwTWBuH2a9ZCizix7zFi6lbFQIfcginZdzsryIYMUklBSpCJQg43y2/Wun/PiPXmISJnTWiC27n64vpSG1En6vUWJBiIBTOOhMlgnjFKuyaU2VxSBckhEu3WuVy/itLVCwJFye7DNAaPSw+/gn7TbQMkfUuIwk3hQciZbaQXkGjfLYHxw6dP7005Uhkdph5yi7saEZhDnyGDNC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UXqbD4MipEzUTLVcsVsncL99vRmxLqQjAoaiEcNqUDfjEzCry7NK8RD7/gzk?=
 =?us-ascii?Q?Fx2S/6KUMCa7nY+hASSICr0Hz8BpWine93SJg4J8JNn4yVl/YhMuDuTVj5+H?=
 =?us-ascii?Q?Hh1J4DHZ9xJ4x0xIBXt88a6B85k7lr305jVGVHY/ojF43ZqGWaQ2PH6C8VJN?=
 =?us-ascii?Q?Qz7gP7XXeFBjBOtst7CfwjkDWD3I21SXI5rgRLsMSmBiV3YzSWdV98htfbpu?=
 =?us-ascii?Q?IhQiG1KdXQvgUkYAYTA10/bffmtMoyeU4+4n7JunuMIzDgk18A9+Y8wLZBeD?=
 =?us-ascii?Q?nCpDwuzf+EX7aIJBy3JA4EQfNyUZqp6NQGgWyJHLvRbiTeVn2qI/J62kklk9?=
 =?us-ascii?Q?rKOunH+Eewcf1bK3ci+SqGWPH3YiJiIqw4DZpLGmaJuzTSDuBEyGz7n3l9Ii?=
 =?us-ascii?Q?0BmU4HXPD++iuJULlWmqrRv+wuYGgagHyak9V9iA56rz8yjdy+cVfu7IM2pJ?=
 =?us-ascii?Q?go7VV6vYgJX56OW9NJ476EHIFR/jhIqp8Edb3eWYpNV6cpfVqHs4g3GRvtUm?=
 =?us-ascii?Q?v1G+WKkVeoMLGFHCjVr989S24j2ZQ700wmuVrLWw1Ft4TfazPF6BGm9580oz?=
 =?us-ascii?Q?fG6upq+lhuikueQAmdN4XFly28MX4xJAsq818ghe014mzQtH8/flcYsrH3OY?=
 =?us-ascii?Q?rVN5YkizlrjEl6xlMBE8QtqBem6/nYn+JE+DKIy3od9JxSF4fu5Fz3AcBae0?=
 =?us-ascii?Q?TJZJwp9JGPpunPGWvAWaaRKSR5ZiE8eZ9kX+kDLY3ZzXt4pTkv0QMUyYzGqv?=
 =?us-ascii?Q?nz84/G6er6itRleOZ++urNvG7ueSCPeAfI+F3e8Qb3uAgYuO4Uw6bYkumBZt?=
 =?us-ascii?Q?u3MEFnL32HZeuIB8HujEK0VDdLwSYe83uhZRZr9vCBbfDwYvU4Fs28vwqMm/?=
 =?us-ascii?Q?8BIEThL5dCE2H8ISMf57VpjdThxEHP0iASIlASFByKHfu5NXNbBY/k6h2maG?=
 =?us-ascii?Q?8xPtjQ8EygvOBQQ5uz0rDaJkcqpWOgxBmK+den0NJwnsKnJOOpU0gNd9JERU?=
 =?us-ascii?Q?fw0OEXpUPEJhaxbhjrHPdL1ynDe6hZDDa/gSoUoEfEgeowO+WMXSlHs5xH5H?=
 =?us-ascii?Q?L+TkGN5sg8B5Iquy9mQtNvS5vWizX1qA37aPa8pWYGe+UssvYrCK9W67xYEj?=
 =?us-ascii?Q?5UWumjzfaPOtcB1LcT+uaSXz3gqVOmuM0INWO2HgG176NE/NO+i6Q/JzcuqH?=
 =?us-ascii?Q?N5Fno5ThP/q/3O0UGLDhJG4n+6Sjt4WrYS365Ra2h2vgie7EcWNY+rtM6sif?=
 =?us-ascii?Q?IIzR+hy0bbOF/Fq4GQcLutCStJSSjDtSWTsl0F1i2WYSBYIyYFKzXkExSDBD?=
 =?us-ascii?Q?ZVCvrMjQbKQHrjdycdOMZxUkEkPMH3ZDpDK9Ko76ZbZsR0FOtuAl8LsvEqJt?=
 =?us-ascii?Q?8w4WiqS3AhO0GF+b88wq2oWTXhidXFXpCgdYDwsGlh9SU9APi14Dn1++dwGI?=
 =?us-ascii?Q?2bRnUWiDxND5IkuYG48ddt8VjG8AFWxdQafvZbzjcw5ZCjdt7yekQynon7DN?=
 =?us-ascii?Q?BHmBTnkQMSebi+8jT7Ee/I8AhYPw8fwURS0/wTDxgwdaHCAc3q55ctuNIT2r?=
 =?us-ascii?Q?nTazTTKYH9qUtitQlLNu14bjb5538GxPmHQ4k/gSIYVaX810Qx/aVb1vaSGR?=
 =?us-ascii?Q?GxUBDNfoJasauvRQU23UFls=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfc520e-d541-46b4-2f39-08dc3c0a31fd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 05:16:06.6957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxCmLzoyJofO0FH/kVpjPHZJjf/dNripP3SiH/vZHCfgJ8teAKn7lOLTMCig7SykywsUgQm1yG+mNoYNe1QGn6HMItJ5aNgVgyTUv7xC+L9Pb5reya9eM0gd8WkZ27Bm
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

