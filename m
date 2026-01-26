Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FM6EN4pd2lzcwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:46:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983488598F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EF910E17F;
	Mon, 26 Jan 2026 08:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RU1KzL/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973BE10E17F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBnwRvXrE9BSH/8/0W5QcHZQ7QxWPsehocoGqI4QiYsFXS0+b9v9F6QqvX/Sxy7I64Gk9A3BKa2heIxA8L86dnQAWHHAD7SNaZCXRwiIu4HlcfUeWAUTDiHs0CjaEILNkSVY6MOTn7F6GwlKmVVuoVYnuXFSDjUU2gEH8EpdPnZvHHMpGPSpOltK4IraxVmqjW6sSON+ra/C89tJoXabhaTQnRDBk0UmM3io0wE1/MxAxizhJMtcHeN2I3x58xItqcuz+45GWM2QF4wAkvcL3frR3SaT9cco4Z3mA3D36GhI/gnvUQKK4RUVTQ5UZQgT0cvnXeGwHTbZi43YhOJXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkfH0efiVjHrwBLgEVjzcj2SMXbJKM9E28bQ1W5co9Q=;
 b=jtaPZhxVR1nuuLw+ykvk/JUo42vXneOdEruAXONp9NzRlruTjyq2hd+KK8ZYvTqbyJD7bq3pYfLlQMt6B/vSsVt0cvRIKmTa6DRXvtu821tAyPNryGL2KHiyQnHdqSKnKv4qBxNFf6syeeld/M6WwMUZ4DD/S8frAaw7p2Uv0prUMlOM3ZXDjSWGnUiC1Yyo1/yx7OlfzEVyWeX3MUR14vAdJVnC+3X3Go+tgm3CRe3nfENQHXEBRyoYHmJwhf1jlQmgM7TlK4InjcSW0+OCg3qnkL1EC7s1RVkqhM3YFP5qLkvpxmEYNava3PwWdgtoljVuadVC+/1ZBSho3IG5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkfH0efiVjHrwBLgEVjzcj2SMXbJKM9E28bQ1W5co9Q=;
 b=RU1KzL/wmGrcwltvJJDgXo9uK15A7RTTkOJ0b8nJBTtPOgznkGD9kQtKtgJGmBNYJwPX1GgNKTsRGKPoBPBegbRFrt0eL1ofBMKTog3Xp4gn3doWvKi1t4OYNvuvo1hfp9Q6wawLpQyGdVEl8RO3qmz6xqgD3q7WRFiyghNSsimPggAcV8Phvrb99mVwJdURtL0HZSFbUpCAssqdjcPkVNikuC26by5XTs/CQ3g6LPQzyd4RoNAZ4wW3KCbG9oA8VKaRkJGYCirNr8F2qo9GGPpMw8IPVx7HD9e1rSkGNImXAI5GLWYWPmAPVnR/z3NaFmrmOAggwffpeBVzvZzgPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10896.eurprd04.prod.outlook.com (2603:10a6:150:204::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 08:46:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:46:13 +0000
Message-ID: <42f86084-5200-4dc0-86a7-4719d7d19cf7@nxp.com>
Date: Mon, 26 Jan 2026 16:47:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
 imx8qxp_pc_bridge_probe()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
 <DFYDRSZBQBND.QSY119QND1GE@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <DFYDRSZBQBND.QSY119QND1GE@bootlin.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10896:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a12f1e-f13e-4038-c65a-08de5cb75c24
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|19092799006|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlpucTYxN3g0K011NE1uOWErcy9sdXBsT0l2TjR5SytoQUVkTzg0ZEd5MkNB?=
 =?utf-8?B?ZCtTaVpkZkZ2c0dHTW4wbmlabjgvKzJQSU83Z000Tkg5bitHU1JFRnFVdWhz?=
 =?utf-8?B?Mk9GME82MHliNk5kZUFFY2dUNk1ZbjhraXJwNUE4UWI0VkRMcHdsNkI5YzFt?=
 =?utf-8?B?dmhRTXVGeHJYaXlCMnlaVUpONnNIU3VrVnFvUi9TNlByckd2Lys5Nm1jams3?=
 =?utf-8?B?Nm5kdHVkT0o5M2lRb1pXY25PeUlNeWVBaUZTdy9OeURrVVNiTjczcGZwNU4y?=
 =?utf-8?B?dXh0S2NueU1qZkF0anc5VDhaZFJzYmYxRHFzeGF6RkpLNDFObjRENXgrK21F?=
 =?utf-8?B?QndVbjVyZjVRVUJ5WWg3WXdFSDR4YTM5TzJ5K2pyQW4vbVpQV3BaQWxnc2Rm?=
 =?utf-8?B?VEd2YVR3WFZJb1c3UjlwdjA2RG5Ib0N5V3VQSWJQRXgyOTUxY0NMeHZ5UTJL?=
 =?utf-8?B?WlUwUVFXVkZkaWpkV0U0Q2dNVG00cVBKWjMrc0Q1dzhna2kzczEzcSs2OWNG?=
 =?utf-8?B?T0M5OXlCeFprU3JnaXFTNHMrTFQ3Vmx2QXJCc0wxaDlncWZ3S2VtZjExckpa?=
 =?utf-8?B?QzhWWTVPNlFKWkU4UlNodEZPWGVTK0hsTkpraDdOcS9YeXA1S3Rrc0E5djhR?=
 =?utf-8?B?ZE1qUkh1M2lybGp3TjUyZllBWnExM1R0TitmOEhRTG54MUJsSy9kc3U1dFYy?=
 =?utf-8?B?M0FqcVVqdThDYnl2b0hzdEFicTJSckc4OGQ1bG8wajZtZlk5eWRVb25SNDdx?=
 =?utf-8?B?VjhnbWZLbE9LUFMzcVphRVY1RXFoUDUzMG0wZC9IeEdWY2toMWo5WXNYVzdR?=
 =?utf-8?B?dS9Cb1dHMG5hbEVhU3VUMCswWEdUS09qbndybW4xVUg4ajBiWkNQMm4wNW9K?=
 =?utf-8?B?WGQrb1NwbjBkMnMxR00xU1N0Z0JxS3lOU2tmK29sK2tLUXJ0MkZFYVVkaHp0?=
 =?utf-8?B?QWEzY0VOMzlxRUZCUmFjK01Nd28xcWdsK0xpZ2x3VXdseGFMRk4yMG9wcnNh?=
 =?utf-8?B?V1lmb0t0ajJJZFNvNnBJUHBnblhnQVZtTmQyOU9jZ2VCazdrMUhWQnBYSFp3?=
 =?utf-8?B?bWhZakhZdEVBQ0M5NmtoSmxxWUVldXhvdHQrbXM3SDNoRG5IT0hjRWUzVmZQ?=
 =?utf-8?B?cU1nMTd3UWp6T2tJMTRPRTA4UThrYU5TK3NUL0oyYlRGeTVNNTArOUp1THZ0?=
 =?utf-8?B?WmFuS0ZEVFlmUTl5T2YvbDVkM3dWZHdFWU5kOUp2YXpNNkxENUJxSE9wekxS?=
 =?utf-8?B?V0lNTmVlc2hxdFRVR1A1NnR0UEFoenBuL2szVERCczhpYk1UWDNRWEZJa3Rk?=
 =?utf-8?B?OEV3cFlmVUN6ODRObEdiSEJaTHU3NzBLVnVMcldWSTNjdmREcTRXMjNpWVpo?=
 =?utf-8?B?WGdWYXZFS0ZHRm9JLzRHMTl5cGZPUXcwcHFLVzR4S0RDbkY0c25uN0lNMFNi?=
 =?utf-8?B?MzZBbnBKVENsVDBkcHlPOW1QcDlaYnFxUStVM01NNlV4a2ZTT3IvTHJDL29W?=
 =?utf-8?B?bUlDVCs0ZVJZaDRhMVF2d05paGVyUlppL0h5MUhOZzZGSTZ0cXBiT1M4dmt4?=
 =?utf-8?B?aElEYWtMOHlwUldycERsMVF5S0plVjRiU3J2VVdRM21YWTRXb0lBRFllOTNz?=
 =?utf-8?B?Wm1mMGxUSXZHUDJHZ3J3cHFFZG5sWE5ZcitzbUkwM2dsR0EzUGZNZkVHVUlU?=
 =?utf-8?B?aXZnMi9qWXRoK0hOSGNTcFJqaTR5RkhNdEFVc2tXeFZodWxSamttY3MwK1p5?=
 =?utf-8?B?ak1BWDgrbllPOE1KSHhoQXlJNjNEazlhNkwyYktQUmx6bUwwaFNwTlFwRzZO?=
 =?utf-8?B?K1RqQ0FjR2d4a3ZCV3RkR0UxNmpYcjRZb2VjSXdLamZ2VVhNWUVOUjFRemk3?=
 =?utf-8?B?emRxZDZ6bW5MV3BEQlZ6b3Fwc2dXUlZoaFZTaDVIYnFoUTQydENPQllKWUxJ?=
 =?utf-8?B?MEE1U0V5cG9hNkVrWStNVktsbGFVWUxrc2FiZFpTbFRjblVzaHBYMVdKKzR5?=
 =?utf-8?B?THN3Smd2RWRVK1R1TFlFdVZFY0hxYmVkRGo3U3h0ZVNJNml1U0VMWDZyaVAy?=
 =?utf-8?B?V0trS1dGR2lGS2xvYWdZTEl0ZzJUQWRHaXZxSUlMTHlraUtvOTE2ZmI2Mlc4?=
 =?utf-8?Q?6f9w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUVkVE5FQ3FjOUYvQ0o2ZnJuK3lhMHRERDFwWTJMNitkSTRzWTdqV25CdE9Y?=
 =?utf-8?B?T1FuS1JhS2daei9EOFJYV1EySmtSNTZUbzR1WHY2U3lZVW5LODBINkNGUUFP?=
 =?utf-8?B?MUJueWtBRnIyMCt4N2I1YmlWVThCRE5pdXJSdGJxcWl4b2VId2l5UncyazlZ?=
 =?utf-8?B?TGowMTUwR0YvRDhYb21HVndhdEJ0b1BnamxGMFZIeU5iKzdJc1UvUHNYTS9p?=
 =?utf-8?B?ck8rRzRWMVByY2pNQXhuektOTFAwbHk0MUtMRmtrRXRPZExEeGVDNDlVUWNs?=
 =?utf-8?B?R01IektiejlQRzYvbW1qNHNmNzZIbjdPSW9MeEt3MjcvZm90NFQvaTZCOWcr?=
 =?utf-8?B?SGxpbHNabG1PTndMUjhvUEVrcUIvOWt0ZWowekhrQzlVSzd2a1VZR3oraTdl?=
 =?utf-8?B?bUZsOHh1dm9mTkRMaitkbEJpVWJwT2R0WThONnRWNG5EWllyL0xQdWlhYklk?=
 =?utf-8?B?bDNGN2pac2ZUMDZFaEpoYjZGVFVTZGk3KzFQeitHZEFPTllMV21sOExkYlB6?=
 =?utf-8?B?NkpYazlRTVJTR1hHMkZXZm9GRFBlL29paGRZWmtmeVltbnZyQ0xKQUxESkt1?=
 =?utf-8?B?anRSZ1ZEaWhmU3VmUGs4VGJrK3d6ckg5ZlhVMFFSTXh4TDFKa1JHTU9Kek0x?=
 =?utf-8?B?VHhQS05KeUVCVE5IQkpySHIxU3NJVUtSSzM2cjdJU0ZaSUVlWTFydmNqSFJZ?=
 =?utf-8?B?dUJBZStCUnJlbUhNY3BpQ21WbWdhY3o1TDMvdkJHTlI5ZHZKUk5ER0U4ajdY?=
 =?utf-8?B?U3J6Rnd2aDVUbWNpN2dyTFRsVnNnamt5NXpBcmpiaG0ybCthVTZPb0EybWxU?=
 =?utf-8?B?eW5ueUUvZ05YcVJ2NkhMcUYyaWxxRkpnRWVudUh5UTNrN3I3R1cyYW5JMjNP?=
 =?utf-8?B?TzBURXRhMjRDWmJMMjJVcW53MW0zMXFXQU9qaURocGtOWWU0Yi9qRCs3dkNu?=
 =?utf-8?B?NWlLUksvYmlxVWZPNStrR2NGbklwMWlJSDNWRjh4OFB1M0phcFdBUGpwTUNW?=
 =?utf-8?B?SFNUaHlicEhabG5ySjlCREEvWHB2NXpDejFLaXlsZjBiYThHNHlUVWlsM2Zw?=
 =?utf-8?B?bGovVEVkdmt6TE9paTc5MndBL3hSUkZZZC9sQUdqbEg5anIwcW9TZFBuU2NL?=
 =?utf-8?B?eUdTTjBWaUs4cEU4YjY0RkFmQVRHb3N3cWNYcEdsZUxEY0pYV1UrNFkvRlVk?=
 =?utf-8?B?cWpyNW54NklROVNodCtZWFpyMzd5aFJnbnNkTmxhcTdSd3JEbG9RRUhuV25j?=
 =?utf-8?B?d0FjZDBFOXlIL2NpT1VYSW1MdjNzMVZ4Wkx0NjJ5RVNuSVExUXVDb3JKL1li?=
 =?utf-8?B?MUlyNU1tZll1ODdVVVVLcmQ0UDE1YnkrYklkK3VKSTd5Vy8zSUlhc0pZbTlz?=
 =?utf-8?B?N2RsdWhqc3Q0OXhFb3YrRllSZVVEdWswREpkc3VOYnppT1NKbytXSXlZRHla?=
 =?utf-8?B?dUFLTm5wdFdkbitJOTc0M1Ixb1ZNckhSdWhwc3diNndjWDEvZ3V4UzJtdTUy?=
 =?utf-8?B?cGR3aWhqVUhKL1VRdFp1S2NSRkZ6TXFySEZ1akxtbGtvWmNROEorVFlEa3dW?=
 =?utf-8?B?ekhxWUE4aEh1WEhUNjdoZEZGQkIzdG5obmpTYlFPK3U3Y3FtNSs1WjdKTEhr?=
 =?utf-8?B?aklqdnZBVVpGSEhJMjJhaXhCMFpZbnVRNXJxVjFxVnBUeHJTTW9lR01oZkYr?=
 =?utf-8?B?eEhLaG5Hb0pPOVZGbkJFeHdhUGIrRnBXUEFvNlVjN2ZCRk5rRFY4QmJRallL?=
 =?utf-8?B?WlBBdDBCOXgzeUtTYnpaSkNLTzU3Z1FOSWFFeDNQZDdBcjRMRXBWNUN6MGtT?=
 =?utf-8?B?UU1yQVVOdklOSnMzMEx0ait4Wm9aVnBabFljT3NBd0FKK09YL2R6SVUwRC9N?=
 =?utf-8?B?aEFvN0tkNzhMUmpWU2NDZDhqNzd5VE5FanNrN3ptNk1WRnZCbkZmWGVKMVFk?=
 =?utf-8?B?aDM3eGtYUGpzTkdGVzQ2WURqTFFKSWdueHdSRTZHQ3pyZnBJY1FKOGpkeTd2?=
 =?utf-8?B?Z3VvdElzbHhtK3hFTGVvNktUNzFzM1dPS3gxQ01QOFVxTFREemJONTNUYzln?=
 =?utf-8?B?d0N3WW1pL21CUXl0R2FmTmllcTBUS0s4dG90bU91WVQ0dG5qRVlCdjd0dmp4?=
 =?utf-8?B?c203Rmp3L0RrK05ITGpnb1JuWTdCWmFtcmlNdkpUZW1KcXgzWUNVRVd2bVQ0?=
 =?utf-8?B?STI2UXNYUmZKVWQwRTRma21mcllQcEhXSFZXcUJnVDVpb0ZwWnRpcUs5cldS?=
 =?utf-8?B?Q0Q5YURLR1BpaVpDV3Zibmpsc3d1V05BSmtsYXFQK05RZmRySXJpWmJhWk1Q?=
 =?utf-8?B?MnhleXltWmM1VWxJMUtBck9HUE52bDBLdUpMQVRKMkZOUXV6TFVtZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a12f1e-f13e-4038-c65a-08de5cb75c24
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:46:12.9707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gY4nABIh2D0l/e3ELdCB3u1RVmWts8MQxjnybwYtek1BN9PbOzZ4vYdbo8zomhDzVKp6xdKCiirqGTTrqhPssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10896
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 983488598F
X-Rspamd-Action: no action



On Mon, Jan 26, 2026 at 09:33:38AM +0100, Luca Ceresoli wrote:
> On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
>> In case the channel0 is unavailable and bailing out from free_child is
>> needed when we fail to add a DRM bridge for the available channel1,
>> pointer pc->ch[0] in the bailout path would be NULL and it would be
>> dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
>> pc->ch[0] before dereferencing it.
> 
> Thanks for checking this code and providing fixes! These drivers have a
> complex code path so I had a hard time in following the logic without neing
> able to test on hardware. Apologies for the issues emerged.

Thanks for your quick review and hard work!

> 
>> Fixes: ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge")
>> Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API")
> 
> The bug was introduced by 99764593528f, while ae754f049ce1 is not changing
> the bug, so for the sake of precision we can remove the first 'Fixes:'
> line.

I added Fixes tag for ae754f049ce1 because it is the first commit which
this commit could be applied upon properly.  Maybe this helps some tools
apply this commit or maybe tools are smart enough to find ae754f049ce1
automatically?

> 
> With that:
>  Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I hope I can have this R-b.  Please let me know if I need to drop the
Fixes tag for ae754f049ce1.

> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/

-- 
Regards,
Liu Ying
