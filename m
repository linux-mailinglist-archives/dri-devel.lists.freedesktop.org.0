Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA60B1C250
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 10:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3918410E2B5;
	Wed,  6 Aug 2025 08:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b9mGljeS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0910E2B5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 08:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BidS0rBP2UNYG67mMFjrN9UUf48IyMZqPFnWvxK1vTIi+IHLLeF4w6H9vE5GEQi65/GozYBWKJIINkuZMpNZS6+MT7Nu5UQ1XoPpnyz0MnHffekxaUApukou7Ca6olJ2Iw99u59cEd4Hsq1b/mwwYiRtBs+7omi7ZPFP3kNnSAeiyNU7srlmQ5blhZT90RGBiwC5OGXPaHR9yFnagI+6ke8ZdPP3m8ByfIPv6ynxq0/YbPwNfeAmVzlwrejGChkcLEVEbSCUhteE0nJfIWqQkVtfz2puZIDKShdPQtzK4F3JWLrps4voWCI4ZO8MQRKOcq7u/MaHM5iMgUhZ9yvc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dth88CEGW3XxtPeKz50G87Xuqoo7BY3O7Y1oHZ+CNmA=;
 b=xFC/ukV2I7DOUH9SN52OZQx7Lpq/PsW9GfqoZOlOHJHmnaA6oLmHhM4zlIf/1h3YpA/gxUVRG8ANHdUxL0N7eYEYTx/nGWXyD0WoVKjrK+sGehxjNde6ikfkYQ/yCS+kpeqPM0BKyD1+11DhaIv7NbxEc+iPYH6k7Psf6rRB3kfLOPOLsvAin2N5sgr7xllri5u4QUL1EOntF7gcQqyO42o9o3UPGZFa8eJF/TU/QcZUOyyL8800kommAXc07bkq1c2PpYyYqvABXb5SgSmugDGVeSqI5qIPWXEL46Tr0WRgSOlfCmmnAKP7MUWvzsIrzyydWzl1PtFGIBE/Qz2iqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dth88CEGW3XxtPeKz50G87Xuqoo7BY3O7Y1oHZ+CNmA=;
 b=b9mGljeS5a7+s/ePDI4Tjy3KH2oQ7BIZ8fS7QKx616pq1lvUl0Y9d2fqAtQBae4VN8PAntRCm7aYcFoxpvlRuCtYipYXSska7GYP6J1uQLYrmocZsb8ktJ949Nryc2VfIuiLokxhoIgbtcvoG3DiKPW/U+vR5+LyhMgV5Ow6S6QVMvK7MmeZSovzBwKVNdQIQWXhzkgYNBZg6372NuneehExzRtDc7yiJbwi6ch4icw2UfFIVWMYFYUsFww4oNLGTm8z6V/nfowP6ckY2rKvC9CNs7QhWh9G6k1MSQR4x/D/W3/G1k3RiRzTFGVkrEnqiMbGCzk9URVjHOzXgXZV9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB11005.eurprd04.prod.outlook.com (2603:10a6:10:587::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 08:40:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 08:40:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, qijian.guo@nxp.com
Subject: [PATCH] drm/bridge: waveshare-dsi: Fix bailout for
 devm_drm_bridge_alloc()
Date: Wed,  6 Aug 2025 16:41:21 +0800
Message-Id: <20250806084121.510207-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 842b96b9-ddf3-4052-4ba7-08ddd4c4dbe2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fUG47BzNAx/jRjAn9ly+hLqAWgvlRG763qw82lAj6GCMsEEU9rs/WH7MS/ZB?=
 =?us-ascii?Q?OMVnPnQIxlBsZOl49XITXEXFEHjJqkjKxOWekhd4w71VPrIAB1D13oLgWwfE?=
 =?us-ascii?Q?xFtlXduzlcKF+MpqO61mH+vDy+b/ZM2UHOasfK82eljsR3Bqcdxpj37E/LzF?=
 =?us-ascii?Q?OjCOBFRE/HLWH/LZjRxVoI5Ul2r0mC/w4OEOrtz9XpMR/GnrbWMbNBAK//fp?=
 =?us-ascii?Q?Pn6JepPYMMFF+jB/PpC0Mvo01f3BJBduIm1NqdZPvJdOS+DkLgP9FEm+aMoN?=
 =?us-ascii?Q?/HlM5uQszPrUdqx3Tt7Spq9iz8svunU4OsxakxWMsEpeRJydZRffXPugWokt?=
 =?us-ascii?Q?nezW1Xa/rOsz+UUWjMHOjT0xdxngdBenK/kbXOQbJzB3yrY8wY4aprJEHd6i?=
 =?us-ascii?Q?fvZ7jyh3u+nJACEGmdedh0ZqXVKjQM4Us533RifigEvf4+01o994O50OuuKH?=
 =?us-ascii?Q?kxR3bAMfJ44OnkvyO66xTUAFAu3OejReohzOYzigSsYomk/DKR6MgtZcoHka?=
 =?us-ascii?Q?Xn3fkR0lGlPUOeMlxmWtay4o+NBiLE/60t4Vda1ugOQOn4M7dp3ra4oWKc0L?=
 =?us-ascii?Q?jklpBn3aWIAxHhl4nSdcC675ot8hmojitbihAByMcxbq+1Y9Q518uZBf1kxc?=
 =?us-ascii?Q?seZZOAHc5DgiPSi1OIE/5FfrcTLZ9TfLv7lPA08HgR4f/P4De9/eUAXbiG9X?=
 =?us-ascii?Q?277VOhNV+ZB0RYsgDSprXFlPyi+zO92h22amrlDsuAyfDTMwco+ONjCxFumI?=
 =?us-ascii?Q?NtCz03XTIP6HxHNjBszzIQm3Em7+LswLJuczNyDMQR5eqdA/6wdGnsUlWTDL?=
 =?us-ascii?Q?7T+u2Ra/glTWZicPlHHKXqNQow7QkNMbgi484ZBuaImMwYt3ajhztYgLFzA3?=
 =?us-ascii?Q?7R5Exql/hz1y0bXwJxSsnq2vTx93jOCnQme3JWuRluIrn+HemZKHnVTBCCqd?=
 =?us-ascii?Q?ewA23zLUOr3iIa9lxz0zT4Rrsc22qmXqsJa23QNPThmfByyopZW6Y0joH9Fa?=
 =?us-ascii?Q?BPlJy4HpGgbQLv41QjnPyKzCltlsEE9U36wFyfkzhIhkT8lsrlp9nmkqgJJf?=
 =?us-ascii?Q?NOqxz+HhN0dJTocTOJIPXSnU4/YxTOiv/J+uyCc5nE2cFdQl7uSdQfapcu5j?=
 =?us-ascii?Q?jOpB+Pa0CfjmAu38hzlh9H01KEsZF9Iez0Za5kbqOdZ1Ogsj7Q8EODU84pfR?=
 =?us-ascii?Q?a02ZINOPnftb3F6+WLlD4kgp0p33fuxLxNHHJnkHKV9/loxJFImYIC7sadi9?=
 =?us-ascii?Q?iYdpACMb/1BMq9CzMOD2TZ2Kd6hVkdus4zwHZbvXl3XHBOJx76J+WEStE+cW?=
 =?us-ascii?Q?A1YWJBSikaVWf4OY8Z7og0b/x8N4kqFzyCIxS80Ne9dySc2eZ151TV9dSOKA?=
 =?us-ascii?Q?xn4ysV9HX9YsCltJYrT8/YIyQaqlMgsKugJGJfO1hCQn/Mifu3ImzxmYWZjK?=
 =?us-ascii?Q?Ch+w8r/bpTu2d+E/cdiAIIJMeKGt8SX3ijnUeUkhBSZlQ+amnfWbqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7uyh/74GmjzOQzVaIFzqQs4EYcYa2ol9K5b6ZVc5Ciseb5qWrbmw8Cblieaa?=
 =?us-ascii?Q?ibkPEdNgYDqljeUIidrMt26MgU5vWbvv3rxK26oqWgGzTS5ubDFHFbd7NKNu?=
 =?us-ascii?Q?rthI1ZqOzUZtqWTTQSPSSeFoS2QIWgLgvLB1HXI8yJw5CIqFb3HJ1r1PKL2B?=
 =?us-ascii?Q?OCiijHV8Nj//Wsdvc047u8HupLZuv4IoyzD8glC0NsO3OybXKaXIxGwwNHHU?=
 =?us-ascii?Q?ur81TsMNbV7wRMJo3Iwj0G2O/Y9EwqCpbtp4kYprQpSO3dh9Q7GY1EqF5jZj?=
 =?us-ascii?Q?bXjIKLu3fTCkr40olqjrhou0hQLCj06gCpvJu0F5qCTCpHMBgUqU/hHzcuQv?=
 =?us-ascii?Q?rORfGXKL4F2dYN6onU/B0IZ0HpXHRzyaEOd431K3wLZ88A9p0DoZ94Ba8Y2L?=
 =?us-ascii?Q?FE2wyCcU+ePC93ewBiw3t9pKMy9UyLLsJhYSBvM7crVesJdDxOFQtZebyYIw?=
 =?us-ascii?Q?QWQysHiPIOgu5EQ2zIdIxiKgftmi5gtlQF5m0IvTrmhYojwQHIwL3jTvH5Xz?=
 =?us-ascii?Q?bUnJPzDhs+lrkVtzceCc0X7KR2sDLU7QCZXpvsXn2is6+30qq7hBbn9qXcFK?=
 =?us-ascii?Q?z7mIIDjm67u+fJrLl5TUyiPhoctMF/b9/Z+MPvGXeh4Ad96hvq1JWG8FQ+Mz?=
 =?us-ascii?Q?LLfED8ND7641fMAG8wt0fn6jH6QP/dngswZs2yimAqoAovUrxZr3EM8iV3kY?=
 =?us-ascii?Q?vGqjza6gP3Iw+5Vdxu2hRI/MUEwBrzy2RcqyYVzj+a8LhpchozVTQk+ieVG8?=
 =?us-ascii?Q?4shvoqIhWucaaFXCWmZTnQO9HezhpOFWoXb0fSpbALqgcIyXOw0+QsuPkf3l?=
 =?us-ascii?Q?1f4Edhu6SZw35uoBJViuEKpWeTNEIpiVaXGo7XknhH8BMqP2HJXk5JbhEcv6?=
 =?us-ascii?Q?LOo36b0fi8VI5iCKvPHuu28hURiocopAJA+eAgoOP3dFNhlUlywyjUjOdsez?=
 =?us-ascii?Q?JeGmsRE59pLAEqjenv8IIWGrRCxU59WuN4wh9mhVxGYu6Q3i7DPDdfK0IW/O?=
 =?us-ascii?Q?FzEFRIqs3E0swP3m6S78T6kl3DsVSrNiuwcECjx0N42HvJGI2qf4thXMeLhI?=
 =?us-ascii?Q?8JPMboSE065KQVGe3T4uQLpcM7zf5YbtpP+ZtUBdCbWSClsi99iwzRsJFrFx?=
 =?us-ascii?Q?M/xRyOvQhiotulSF4EuNzcNIvpyMsijJyeIqnpLjxuPEdw59v1we6Ry7qKqZ?=
 =?us-ascii?Q?O3Ac+yxHNQuScs/NXAzbn579I8a7ofIShvG0uLUCvmr+UX8EpKKmz4f9JfPm?=
 =?us-ascii?Q?TJ+n2ScgDBHC/K5MCh1hZvHSHBg3nIbr4hRHBbdaqtVg5gY8nAijo8Ut77bC?=
 =?us-ascii?Q?xx51FDHsFXf2qyiqg1asFI841fOIsQRvRcTjQMKUHfLNzT3cxj8ZQDAXENRl?=
 =?us-ascii?Q?+4ej+ZzMIdh4a8gbjoe/oYhDZT1eUlFMnXz/6NZbmuz0Ny9oT2JvnxQ8S9gt?=
 =?us-ascii?Q?P5TZX/tPBTxFRTd6/4fE7/7qgbeX0pmbOud3Uvb/gaaVAWV587QyZROC+XZw?=
 =?us-ascii?Q?surPkWX5w9PgCiSk8QrAfEK1eJRVibAB2GXnKp20CIDxO4TYmSZPy9qnTc/n?=
 =?us-ascii?Q?GjMhagYbeWwc0GPfSmFplyc3jYjGDmhf0VsnzgXJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842b96b9-ddf3-4052-4ba7-08ddd4c4dbe2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:40:12.7665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51OLwHGeXmuk/N4X1ZFJ0mjSbM+KGhl8H3iXnMtKsRXfQVEoSCx9yXBgGV+6CVUBbaG9HxdyPSo7AptRj3kl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11005
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

devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
NULL pointer, so use IS_ERR() to check the returned pointer and
turn proper error code on failure by using PTR_ERR().

Fixes: dbdea37add13 ("drm: bridge: Add waveshare DSI2DPI unit driver")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 01c70e7d3d3b..43f4e7412d72 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -147,8 +147,8 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 	int ret;
 
 	ws = devm_drm_bridge_alloc(dev, struct ws_bridge, bridge, &ws_bridge_bridge_funcs);
-	if (!ws)
-		return -ENOMEM;
+	if (IS_ERR(ws))
+		return PTR_ERR(ws);
 
 	ws->dev = dev;
 
-- 
2.34.1

