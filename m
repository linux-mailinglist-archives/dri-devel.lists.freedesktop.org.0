Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3B84AC7A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 03:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B123112836;
	Tue,  6 Feb 2024 02:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="NAr3Vr4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C0B112836
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 02:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1bHpwruqJ0OOZuDSty6mwCooyYXCJ0xqCh9VuO+eKakUpStSuXNy/6BD6HnQ62gcNm5ZmjWh50rkCBcaE0/CP0IhfMlAdT/5sNqLMGansaxN7WRhQjMcrttUQwjJjCgGB0a4gNOUyd7zdflKBaVpIrXvJ9XXQt6Obi2bRf4mA2mBzR/AwABoxtqhD4u8Qii5d3X0qIlcJsNE/FaBQN3I4HJ27MMduc+Z8xBbmDknckyUEIeRGwbuQjsxgi7PahoIMJ3DNF/emExTNL8WeyXKML2NVp+OR1Ijz+GGFzodX7DTJHfNmRSKi2lsnUImanMluRAgiL2gEJvtX5QE56HGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VV4/ffkqO/ev9swuxYLRk7E6rz5r7KxK+E6dLyxICk=;
 b=h0CEE6cYMm2o7PPhz9jNedR7sG0cPcDNN+YscGKv0hutBMp94GwVgM04rWGt2f/JKV3voNjJuTT+274MTKaAJ9HAsE2zHOFj9QnmmNuIhGG4n55/9B/dVjsNFP2bFWmwmVJbfhs8I4Vj6Rvq4YBakEzwn/6sE7RnybH6ulA5aDSt2ZSmT2f4Opkz40A/z99RfyUYg/j1KUUOkYHFXUmQXgBBlnoVpip0EIs9kv/Y1sPJY1xb5hwtMWDw5Um5WpTBTH+dk6FjCNUg6FJA90j75dN3N8lvwy6ACPI0wbFPzWX7FPdtYGWB8r4pf05In4MGR6VO0h47jMwbwlF3Bbtg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VV4/ffkqO/ev9swuxYLRk7E6rz5r7KxK+E6dLyxICk=;
 b=NAr3Vr4CmsBtFM/AykJxkPKtd0sExk/LMWLF5kWNU6zV+7RkwXNsTQfc4/ZfUoPMUMcQWUbBfiVYMRsLY9eniH9Bavk4c8qZ0ZAnmpTNnsSrDxLC6fj6vZ09vIZuhxtHrLukCjHh1Muy5ND5ccsoj8HJFs9lRBijxdYtbZQsxps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6229.jpnprd01.prod.outlook.com
 (2603:1096:604:ea::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 02:55:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 02:55:28 +0000
Message-ID: <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie
 <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Jacopo Mondi <jacopo@jmondi.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Russell King
 <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sam
 Ravnborg <sam@ravnborg.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey
 <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
In-Reply-To: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Feb 2024 02:55:27 +0000
X-ClientProxiedBy: TYCPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:1::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 175882e9-a46e-402c-133c-08dc26bf12fe
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I9CG1AY4LPhmLxU1AF1EcNppoDbuXCN+jyR/tar3bGOMeAleqIgn5ZEFPVgWjCGY2ahA2V3Bt18ChK5+SmpJKt6VzIWdApyQGrjGWUiwNRlOD9l1XKDc2ZWUdpBkCG5Jy7UA2SzFyKOG+HcMF/w4EUQ/O8nByzBKo5Zc36SategG0juNKSenvJ1DmgoRpXVdmampw566+pSzqwP+Tq46QE0bizBVJ6mes/4JO3Yu9RB6PdkI9vDuHayQ8Qfl73eJVCTipWQJEy7SCwMSjRcs5zXGcQT7lqkAA5fQAkEeKMQUY78mTwVllbuz7ypVRU5x+8BFD1IhPpr+Swt/VmbDKix0rbMz8Fg0pCJjTgmh2XHidt72JnfG1aPouYU2ZyaATwwRQ/QsvJWddSelOJY9U4gzoyz2pVvaQoPzBKvT5PMYGlZEC8GIMMhbl/jDLKAXvWn5WdCvvDhLctEuTH/mhmTxlQjV+HTNww7CIfzvt0RfKPrTI0tNOSqnx1BLM4gR7mCSAitRl9eSzKCAsKm9VKGJQuIY1b9qzmHpxjcumrQfmMI0dRXYjNIzLR8Lz0EiozFwVbU/xKaGKhYmuHOogmneQ5OCbEfEE+/JR/jHZpSWUzRE0GYsbVF6Hms5MTUW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(52116002)(6506007)(316002)(83380400001)(26005)(86362001)(2616005)(41300700001)(8676002)(8936002)(6512007)(36756003)(921011)(2906002)(478600001)(6486002)(966005)(7416002)(7406005)(5660300002)(66556008)(66946007)(66476007)(38350700005)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XQfCkq7sVUFlm3rLzOx2aK/Ifw1fo0aMCW/vY/p/+L5s2uPtrWyLqjRhzD1b?=
 =?us-ascii?Q?KRlFCyBADdzJNOTprmolRqG2AYkyFQfnDO/vTU23hCsTAu5bpbWC+BFp2ToB?=
 =?us-ascii?Q?WSVL4CaRE3yI39KtbwwSg0iodyVEcUHUTV6CDnBfFk08NNwLVA5NZSr2zFHW?=
 =?us-ascii?Q?6nBgwbK4oUcoXpO6MUyncg/jJ42cUykFKNdsEKeWTbMWzOISqWJNwnQfHGAz?=
 =?us-ascii?Q?f61k3OGRzmysC35ewiOXswPq0vx5375UgOMFUr6TGiEpSG1H4VX/tlqkFnc8?=
 =?us-ascii?Q?/NKRCvoviIPyaZTCgh3TEgu5aHyx5pIrt94jjDDYCkz+5aY1ZuD35OJVoTw8?=
 =?us-ascii?Q?NhxvDf3ATeTMq3BFFM1SNtU6ts/HHnjxq6SNcA3ppHkvZCT2eksz3/ASI/cx?=
 =?us-ascii?Q?07bOyFUqaBdBDzqa2yK8mjuaaOFKPhpyc9sYxbZfVW4vebgUYIXjaD7EySJn?=
 =?us-ascii?Q?V6Xrse8l3BNhuIPxJyQzFCzZXnRe/T8idIl2Q6YwI5AYfHMMY+s/+5x8pUc4?=
 =?us-ascii?Q?hikU3t1Tw30kC3wpobreVjWVIyialLPKObzSlZfbR4HbY/mMuyrlwl5NiKyj?=
 =?us-ascii?Q?3GkZ0wXsIi7VGEhanoWnpQSKl1WK2h050BQwh4GFy5SjQ8QraxHGJe5L0r5e?=
 =?us-ascii?Q?muv2MA8faLDOdh/HKDbVcT5/Um0LrEXJGYoKNkx+YQIwSdRshkV+d2NcwI//?=
 =?us-ascii?Q?2OCFY4ukiVwrE9rWG+KBW4qnnJJKKZYKGibPrbigOOz7RDiZQscftM1ewsbU?=
 =?us-ascii?Q?e8JYHZeyragCyRdn7/8sJZLadPvQJV+Xbfrnu7XBtisrsS/PGmJNu57Thj2w?=
 =?us-ascii?Q?EVTplUT0+0lO66gEEhfJYjK/Gq0qvs5U12ZvY4BHmIm1CAna1j5YYcU+S4De?=
 =?us-ascii?Q?NCB84hN5gfwLnmOfpkj+btre9F6Vw9dMQszc9VE2pMfTZIouI6WaKwEveJUQ?=
 =?us-ascii?Q?pUSpyIiN95UliHOSF7rNqW/sKckGDovBgI8QopU2pftPFRN1/EJnJXnwn83b?=
 =?us-ascii?Q?AkfHqKWDSppfDwCesyoVsQuN03GfOHypD1xMdtZdsUfwcI+HQDezd6Ao8p+n?=
 =?us-ascii?Q?uK/hRHHgAKbJhg84NjT9nE9Z9L5RQ/9uVg4J7o06lt4V6zFOaO87yeeFv2iN?=
 =?us-ascii?Q?Ncp9jKgo/gMYXytossYuw7h8alLITi6NPAVUblbgE9d6wbXpdO7k+c22AWkm?=
 =?us-ascii?Q?UBohl/uP2tjrgikNv14b7ZdnYDJOHKdmNI5Gj8TmsHJXTCtX58obEDIjN+s6?=
 =?us-ascii?Q?ef9vuFPXw/v0kr0Jihqhp1i1l3PJ/Gy2dpNiI/ajFQYW4whwcLUHKR0cdTjI?=
 =?us-ascii?Q?mewWfMouWia2V41eMR+5ZbajdaYPlUUuhGqw4RY/UQh7SuFZF4LVrTSliP8Z?=
 =?us-ascii?Q?Fqlo5PW7liGGL52uMj6TpvjeepqPPCDoyGCdFkmbUTS1KqI/eQDQKHX1zzfx?=
 =?us-ascii?Q?5VhGPoRJvs4Db4gVeGmcRjyrD04VEyG+/l/xaoTr7GxPytM7fcPCzcTwTE5p?=
 =?us-ascii?Q?dqgM7CbDahUEUlNnLfCi+4tYbrxgWbvf+49Ngm/x6U76QqM3C5O7/1NZX5Ud?=
 =?us-ascii?Q?RVhS9j/vloa97IwupF1yfaM+pZHD0ldojLK4Iav1vmZR0saf5n11dI9ij9q3?=
 =?us-ascii?Q?PDtXV1VF1PiQrJ4ken2Gkzs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 175882e9-a46e-402c-133c-08dc26bf12fe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 02:55:28.0183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/3adFv4Da0JJ6VZpzYovWRMrwR0SHnM95jHfC9dAqtjni0siTPdGstDMZ1inWe6nxvFN1pMkfUe0a8aM4J/Y2k29z9fv7M48Ijc2K8KeHNmqOq6u4KZfebzJ414NUWl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6229
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
 drivers/media/i2c/adv7343.c              | 2 +-
 drivers/media/i2c/adv7604.c              | 2 +-
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
 13 files changed, 13 insertions(+), 13 deletions(-)

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
index b202a85fbeaa..dcfdbb975473 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3205,7 +3205,7 @@ static int adv76xx_parse_dt(struct adv76xx_state *sta=
te)
 	np =3D state->i2c_clients[ADV76XX_PAGE_IO]->dev.of_node;
=20
 	/* Parse the endpoint. */
-	endpoint =3D of_graph_get_next_endpoint(np, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!endpoint)
 		return -EINVAL;
=20
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 348f1e1098fb..c57a0d436421 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1080,7 +1080,7 @@ mt9p031_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	np =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	np =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!np)
 		return NULL;
=20
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 1c6f6cea1204..14d277680fa2 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1008,7 +1008,7 @@ mt9v032_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	np =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	np =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!np)
 		return NULL;
=20
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 2c3dbe164eb6..edea62a02320 100644
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
index a70db7e601a4..31d214bd4a83 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1053,7 +1053,7 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->i2c_client =3D client;
 	ov5645->dev =3D dev;
=20
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint) {
 		dev_err(dev, "endpoint node not found\n");
 		return -EINVAL;
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index dcfe3129c63a..beab2813c672 100644
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
index ed5b10731a14..aaec5f64f31a 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1555,7 +1555,7 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
 				     "failed to request gpio S5C73M3_RST\n");
 	gpiod_set_consumer_name(state->reset, "S5C73M3_RST");
=20
-	node_ep =3D of_graph_get_next_endpoint(node, NULL);
+	node_ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!node_ep) {
 		dev_warn(dev, "no endpoint defined for node: %pOF\n", node);
 		return 0;
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 67da2045f543..af7e49e6cc5b 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1836,7 +1836,7 @@ static int s5k5baf_parse_device_node(struct s5k5baf *=
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
index 325e99125941..662efd5e69b9 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2307,7 +2307,7 @@ static int tda1997x_parse_dt(struct tda1997x_state *s=
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
index c37f605cb75f..b1630a6c396b 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -988,7 +988,7 @@ tvp514x_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
=20
-	endpoint =3D of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
 	if (!endpoint)
 		return NULL;
=20
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index a2d7bc799849..8e58ce400df2 100644
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

