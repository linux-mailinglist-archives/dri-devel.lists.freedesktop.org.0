Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB8D08571
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A7E10E864;
	Fri,  9 Jan 2026 09:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="niTrJOXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B8310E864
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 09:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkNHZtJUEiM4OJ3pi8H7kD+YLz8bE2Y7I7a9fuBoVNxb1hdzrSk051HgDSoN5cUZ5yJM1YHFvHnqvJsYN+lgfSUUAwdpTUfkIAIbd+VbPLgVPMfT213K5rqLk5kAp4GI0z3UVJAgC1JwQrLr9OmkU3n0F6qIhInDbnHYmaOju2wxF2cXKzP3evm52h74sMG/k/Ed48YySSIfQNdFc1/xHNscR5lu7BXF+m5qHGCqaMUhhihHslJkoDKRvlpx2w1SbFqpBeAqvCPt9N7vluGbxpcZacmh+X6k05HtlzgEwcqvg4P3ZuAOFVRGgMX8i9cmWF2ss/azRCiGZjkIqCcOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ExZ+zkVvCJjndQkuCQZgTezQPV4mKu7ZsZRAZ6qC78=;
 b=MY/USBnUH5VN7zd/9S2eCa+wS8EWid/1VLfBada4XNRP4I5P7cniczXWj+NUTsq0eedrgQhKbwC6qz3e9QhS3BCbNTiG0G11numt5cESWBNGeamY7ogDBr6MSkR9GtrIuJVnaJxq9fpx/cI9pJgR8aq7D5fBxEh8zKClx2N9vXK/I4JHy6DOcBmBnZi3f/Xz4DPGG+1Jr+6jfcaewV1KONT9h1eIE53VfMvBebNBvnTX4m9/U5H8hQytF+n0IU8PMX33TSHNSf6YxP+uHogoQOkZ6zyzeiXzi/+VCiSJhNRgC7kI4RNYEysqtX8T9vupV4Wf+92+Lg8pgweCbwZ8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ExZ+zkVvCJjndQkuCQZgTezQPV4mKu7ZsZRAZ6qC78=;
 b=niTrJOXrbPMhyrXqerdjcFJ3Av2CTfzqf3QCb2+G5uV2oGdhFcMYeD3RYSDVHHugClaB1ARbhL0lmm5snZwCSFyBn9RoKd1lRvbzAgOMi0mvKrFQA4FvPpB+YlFysXKKECqC41k9v78T35Dk7PpOKWO45QICa0pTiVyp2NLjCdG19l02VCrEuegibYL0LM7PcmYHEwl0AmPnOPZVXL6WKC54+VHy1NR00fkbQOcBpyKNGeLrvhMoqnZxSda2jqvb0ArrqOUzbDXH1UjKecYKAQ/nk9y1dFy8ag9hnmYmZ9nIg2PvK9XwNDNXG2QfyWv9OuIx8HXoG0ziaPDa1Ij0Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB7166.eurprd04.prod.outlook.com (2603:10a6:800:121::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:52:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:52:35 +0000
Message-ID: <7d937ad1-dd7c-4a68-9af7-f386ca2c27dc@nxp.com>
Date: Fri, 9 Jan 2026 17:53:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] drm/bridge: add of_drm_find_and_get_bridge() and a
 managed *next_bridge, deprecate of_drm_find_bridge()
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: a711797c-96a8-45f2-b2fd-08de4f64d128
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVZ1UDQyQ0laT1BlVEljUkNjdEpBaWUrWUozbU5Jc1lxTlIyOWlCcFdxYVBG?=
 =?utf-8?B?Nk9tbzJhY3dBaGFwMFM1cERadnBEUlp6UlFCNDVUdWx6bmtOVDJZMlBpR2RK?=
 =?utf-8?B?bWsyN2U5TVhrNHJ1ZllRYytGQ2VOSzJwSWVUVUxNUStjY2RFR0NMRzUrMUtp?=
 =?utf-8?B?OENSeUt2b3owditNQXhwRk9ZeTZGUlNBOTNHYWJMcHlqZ2dQclhuVTNwcFhX?=
 =?utf-8?B?SkpMSmtxQk1jdFlrK2dGcFdiK3RiSnpVZW1JSkFGdlQySVJSVTVJNFhtajlk?=
 =?utf-8?B?NnJmcm9LaDJXaG5GSi9pUHFONFBZV0xRMTRuaGhnY2Zlc21iaDQwaWx4Nllh?=
 =?utf-8?B?dGdValJGZG5kYlliajRBNHBYdDc0eFQwcjNpdUd0a0VSQm5uTEIvRk5GckNJ?=
 =?utf-8?B?SWE3QUdXbDU5R0t4MjZIVFZrcFA5dEw1Q2dGUnJvUGdMZVEzZ1A1VkRldjVz?=
 =?utf-8?B?M3NVQy9SWHdna1RaZnQ0NlRlUm5BRGI3RElSWlp6TG9tQ0l5T2V3dzdyN2RY?=
 =?utf-8?B?RDAycHdBN2RZYjYrSEZSOGFVOXZMVC9mMmFYT1FKbkpRdVNKMVpxOUd4SFFZ?=
 =?utf-8?B?K29MZTg2RnJnb3hwVnlnS1I0TUZIMzE0cUJBaFA3dUY0NkJHS3ZpVTFkL2JV?=
 =?utf-8?B?elZtQ2RESHNiaVA2MUNTejczR0pRQ2xmYWI3eWoyTytTWVZoeEFXc2lic1g3?=
 =?utf-8?B?Zm5oWVVUZjMyU3MxRTdhcnhvcktSYXFMYnVGZzJlVEFjL3NZa3dMMXNkdy8z?=
 =?utf-8?B?MFd3LzBjTnR4RDZxcGNyMFBsRFgvZ2dPcHNlTUxuR1BsME9hdlJqY3JJbzYy?=
 =?utf-8?B?NGJNeXZBR0g4TUpqU2drUHZMMzhuczNnZk45L1BwYVFuK3Bkb1h4Q2pWb0VZ?=
 =?utf-8?B?a09TNnI4TFkrUzVhTFlpRXQvc1dOYk1GWnhTSm80V2JtYzJpclp1TEFVSStr?=
 =?utf-8?B?M3IwN0NhdUYya1lXcm9KZldmSVNvZk9lekUrZFhPWStJWTNSOXRTd1ZCek9E?=
 =?utf-8?B?bnpwTjdTTk5QbEpFZEpoTFlLWS9nQ2pFeEdrZ3ZiR0JnVTNCM0lub2lDaWJw?=
 =?utf-8?B?K0RmeTNlK2hOZzBvYkE4cTF2VitSZ1FYOXFoazNBYTJWTXNDbjgwTWpKYTJt?=
 =?utf-8?B?cjhqM29nMWtNQUlzRUJJWGVhdkZWT1d3OHdkenBpb2YrNUJmaHlnaGlOVE1u?=
 =?utf-8?B?RmNBRE90U0JIWHdJNE5aQ1dWRjlYVHRIalB1NUI0OTRsTXFNUytaczBrQUtX?=
 =?utf-8?B?SXB2TUVWTHAwZFdRSTNDTzNvWkp5eTNtQ3pIUDJrZTBYVWRCWFZqU1VWQXpR?=
 =?utf-8?B?T05zRGNCemtqZmtRV1p6M1NtcGMzZzJ0bVNuZjVqVW5TQUJ4TW9KcjRLanZv?=
 =?utf-8?B?OHM4NHo0M1pRWWlTcHgzNkFaVWRzVmhCMk9CNDZ0dXZ4Q25PTzFTZ3JDbTZl?=
 =?utf-8?B?b3lTTXUyTjhZMmttU3pTRFVNeWNQUEJranVvQ05kZFZvdC9ONmJzWm9kbEtD?=
 =?utf-8?B?YUUydm5FclZEVDNNdVRCUXdacmxjTDd4WGVteEQyZ0hWQWJwbG9rTFFqT1cw?=
 =?utf-8?B?bUUxYlVpWDh2bllUckRFbUJIUkhyNFJRSGs0MEk4cSswWVpGOHcrcjFKN2Vu?=
 =?utf-8?B?UklDT0tUYlQwMVRVU3JXdEZ6NUkxS0lyZkhodEF5andFNFZUeEdzWDFmbncw?=
 =?utf-8?B?UFgwK09vTHdkTmdrYmQzeVVobU1VcnFsNW1tSWs1bURwTWpzbWJYNmd5RkZS?=
 =?utf-8?B?TjNCNFRkbFVjOG55Z1drZXhCRUpBZkhqWXh2cEYyb1NJdG9jYU5ZWUE4OGUy?=
 =?utf-8?B?N3JJM0pzSE05ZkU1K2NvZHR2L3NhSFNmNzU3NS8wNk5GcWRCZndlUjB4b3BP?=
 =?utf-8?B?ZzdOSVhsT2tIb3cwM0pYdktIMEE2bUdiNVltaWlCUUF2a1gyd1Jib0xVc2dC?=
 =?utf-8?B?U1l1b0ZWRlFsUW1qWWM1T2EyNVZCdVFyUVVoNjRRN0MvOGs3ZTg2L3FpeUZQ?=
 =?utf-8?B?VUxkeVhkU0NLRzdHQ2RPSmlnd3JpeVZxOGtqa1FuR1E2N1AxNVd4K3drQnJH?=
 =?utf-8?Q?ge0UOE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWs0L2ZRdXhRdlBjWWo1cGhzcDd3ckpLWHRvSW1xT2FxUlpzRjV6YktXdUc4?=
 =?utf-8?B?STlvbjFoaGNjNUV1Zng3dEVpZTV1eU56TnNhckwzTlUySnYxTXdOekRoOXpa?=
 =?utf-8?B?MDNaVjZIeldHZGRQMGpLQllBUUZLTi96TTNuNzlCa2hGcnBBN2tsejRlN0p3?=
 =?utf-8?B?ZjhMdDhxY3M5ZThpWFc3NjJtTXdzbGtSMFhGdG11UjM1aUF5bjhKUHl4dUZZ?=
 =?utf-8?B?NnlRRmVjcit5SzJRRFk4T1hyRnJvbEx6aG8wQ0IrTXdaUTdLdEZRMmVLWEhQ?=
 =?utf-8?B?T245MGVmbnlzZTcyWkdRaVlvc0pvc2IwWkRDUzRaQ3RaSVJMVHRESHA5aFJV?=
 =?utf-8?B?ZldpK1hBazU4UmtxTk1QTXI0cFB6VTJuOEtwRlplekZpb3JuLzY4RExqZHlu?=
 =?utf-8?B?VlZKRDBJeitJaElURVQvK1poUmRlNTBtTUFHOE9hNjk3QkN6b0c0d3ovN2Z0?=
 =?utf-8?B?elA0MWMwdjFXZVdlZk84SFpvc2JOMEkxSllreFVUNHFGWk14UGEvYXVsL0Y5?=
 =?utf-8?B?dG15aFNaMDBRc0p3M2U5Ukh1cUtrdHkxSi9JRlp2eERwUG42SnZORDZPb1hI?=
 =?utf-8?B?K3FZN1o4eGNXbURiQndKZzBFQWxhYWNGNVRpWjJkVGE5Sy9TOVNYdFJvN1Ux?=
 =?utf-8?B?UDJlemhLM0svOHlwYStVRm1sSTUzSEw0MHFSbWdqWjV4MVpydWQzc29RUjFq?=
 =?utf-8?B?amVOLys0MExaZ1Q0b2JkbHpiVHRJbm5KY05MK2dYZ2JMSm1paStBakVXdEdK?=
 =?utf-8?B?cER1Sm9kcUtTRGhsaWYvRldqR1dMQzlaNjdSYmJmODF1ZXFqdEFMTXJNS1pl?=
 =?utf-8?B?OTZ4ZTVidFkrYm1mdHJZcDI4TVd2V3k0SElXL3FmSGNEVDhlUzVqTGhXRk5p?=
 =?utf-8?B?Z2dKcU92aU4wR3BUNDN4dEp4eWI0RmxBOUhIdjJneHRyQnlyWC91V1ZwRm9q?=
 =?utf-8?B?V20waVhMYWVjVmFZeU52UmFEektUaHYzaTkxN3o5dmx4WnNNU3NmM1hiQ3Ns?=
 =?utf-8?B?alRLL3N4b3QreTl0VXpoeEs5c1N3U0VQZHRYVExocWh6cWJMR24vdHc4Vy8v?=
 =?utf-8?B?S1pnZTNFc2JQYm1sSkJEOFkrcFZVSjU4dHlaczBpQ2FBTzcyMXFmbVdyMi91?=
 =?utf-8?B?MFlxMXhicG9oendtTnUyWHM3VUYzOHEwbHA5RkVqL2ViT3BJWnBRQUV2bzdu?=
 =?utf-8?B?Qit3TElTZlFRbFNjVnY2RXhIRUxQQ1U3MzcybWJCYjhFMkQwVVVzazl2RzlL?=
 =?utf-8?B?OHcwbFpRTkk2VThDMU5nRUdYOVgwRUhtNklnS1IrZ29WNVIxSlRwOFBleExj?=
 =?utf-8?B?Vzc4Q3djQkkzMXlpUTVYQzNTSkYrWU9rZlpYSXZGSkZ5T0pPaldreFVPZ0VD?=
 =?utf-8?B?eGRXTU91SElYaTV4Z1hmK2ljMDlxa2gwaVh0ckZUTElTWGxDR2pTMkpMUWFi?=
 =?utf-8?B?K2wxK2xFZkk1Ym5GUVJTbU9nUEpUeHdPclpNME9OQWpTcUZwc1pOMzNZVmhq?=
 =?utf-8?B?Sjd1RGhraFpZbXZ0dE5TZW5TdnNhbTJXOXB1TUtuV2ZxWWkyOHhraDE5MDZs?=
 =?utf-8?B?WVlhc2ZWUFpENGtIa0J2RllBVGdWVXNweW5BU292Q1JieTBRa1JCM2s5QjQv?=
 =?utf-8?B?VGttWEgyNlU5TkFTMEFxclFiWjdCam9QWi93M3VTazJaYTJ5TDB3S0V6VHN4?=
 =?utf-8?B?ZCtOUC9uQmpiQ2pIdlBpb0NZWlFEZVNyYjlONzFkanE0Rzh0N2p0WTR5N25a?=
 =?utf-8?B?K1NmNXplOGorNzFMK3YraGlnT1NKbHVOcklDN2xwS3hPMGxRVFYzUS8zaVRF?=
 =?utf-8?B?cWU2NDM2Q0JoZXpuQTIyTFRLRy9MaWxSZDhTbkovcmN1VkJHcmV0dXVDdE92?=
 =?utf-8?B?NDRGZ1Q3NDhvM1BvVTFEU1llR0JtOVIyNUxCUU5KNFcwVDhBYkY3N0ROakNT?=
 =?utf-8?B?TlBNcyttS3JnSzJzYlNTM2wrcUR4a0RNWXBMUFFEVkVUMFRkK1lPUHY5WUEv?=
 =?utf-8?B?WGpZR0NsQVFZL2RqdEdWeURHTTB2dVMxRTFRSmI5UVhTUHFMcXBwVUR2Umhu?=
 =?utf-8?B?WDVSNkNENXJ0cmZKSE9POUFGMEhPcU1FWFhrdE9KVGVxa3I5UllEM1NGdlBq?=
 =?utf-8?B?VnFWMXVYQ2VDY1V6anRvVVorOWdveDNTaEhTUnB0ZkdJalBOVmZVVHorZ0Nw?=
 =?utf-8?B?VE9CRmQ3dGs2bitJbDFEVTZqUEZzTzUvTU41cTl6YVBiMU90V2ZZSmx2UU5Q?=
 =?utf-8?B?aWVCUUVzSFdWa3EvTGhFeG1yVWV3ZGdVb1NpakJLaDRPdzdteVcyVE9LcFRq?=
 =?utf-8?B?NUVhMEtZK244QnB5SUFtZlUzWlYyc0RZWHorZlFoQ1RHVkFnQVBDQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a711797c-96a8-45f2-b2fd-08de4f64d128
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:52:35.8999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuQGWcEzNL5h9pEL9TMR7dDsKJT2wkI/zQqJM2VNqdV7QkKLv3GG/XkJvaGi+aW8N3cuajk8y1OA0soyD7MQ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7166
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



On 1/7/26 17:56, Luca Ceresoli wrote:
> This v4 contains the leftovers of the v3 series that deprecated
> of_drm_find_bridge(), added a replacement which handles bridge refcounting,
> and converted some of the direct users. All patches have been applied
> except the imx8qxp-pixel-link ones, which still need a review for the first
> patch.
> 
> @Liu, patch 1 is waiting for a review and it's non-trivial, it would be
> nice if you could have a look at that one at least.

Luca, I'v been too busy recently for tasks assigned by my employer to
give an in-time review, sorry about that.  I'll try to review this late
next week if not sooner.

> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> Here's the work breakdown (➜ marks the current series):
> 
>  1. ➜ add refcounting to DRM bridges struct drm_bridge,
>       based on devm_drm_bridge_alloc()
>     A. ✔ add new alloc API and refcounting (v6.16)
>     B. ✔ convert all bridge drivers to new API (v6.17)
>     C. ✔ kunit tests (v6.17)
>     D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
>          and warn on old allocation pattern (v6.17)
>     E. ➜ add get/put on drm_bridge accessors
>        1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
>        2. ✔ drm_bridge_get_prev_bridge() (v6.18)
>        3. ✔ drm_bridge_get_next_bridge() (v6.19)
>        4. ✔ drm_for_each_bridge_in_chain() (v6.19)
>        5. ✔ drm_bridge_connector_init (v6.19)
>        6. … protect encoder bridge chain with a mutex
>        7. ➜ of_drm_find_bridge()
>           a. ➜✔… add of_drm_get_bridge(), convert basic direct users
> 	         (v6.20?, one driver still pending)
> 	  b. convert other direct users
> 	  c. convert bridge-only drm_of_find_panel_or_bridge() users
>        8. drm_of_find_panel_or_bridge, *_of_get_bridge
>        9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
>     F. ✔ debugfs improvements
>        1. ✔ add top-level 'bridges' file (v6.16)
>        2. ✔ show refcount and list lingering bridges (v6.19)
>  2. … handle gracefully atomic updates during bridge removal
>     A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
>     B. … protect private_obj removal from list
>  3. … DSI host-device driver interaction
>  4. ✔ removing the need for the "always-disconnected" connector
>  5. finish the hotplug bridge work, moving code to the core and potentially
>     removing the hotplug-bridge itself (this needs to be clarified as
>     points 1-3 are developed)
> 
> [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v4:
> - Added review trailers
> - Link to v3: https://lore.kernel.org/r/20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com
> 
> Changes in v3:
> - Completely rewrote using the __drm_bridge_free() idea to prevent
>   use-after-free of the next_bridge for the common cases
> - Added needed cleanups to the imx8qxp-pixel-link and imx8qxp-pxl2dpi
>   drivers
> - Removed various patches converting simple cases, to reduce the number of
>   e-mails sent; will be moved to the follow-up series
> - Link to v2: https://lore.kernel.org/r/20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com
> 
> Changes in v2:
> - All patches: renamed drm_of_find_bridge() -> of_drm_get_bridge()
> - Various fixes and improvements to patches 1-6, see individual patches
>   changelog
> - Removed bouncing recipient: Edmund Dea <edmund.j.dea@intel.com>
> - Link to v1: https://lore.kernel.org/r/20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com
> 
> ---
> Luca Ceresoli (4):
>       drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
>       drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
>       drm/bridge: imx8qxp-pixel-link: imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
>       drm/bridge: imx8qxp-pixel-link: get/put the next bridge
> 
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 53 ++++++++++++-------------
>  1 file changed, 25 insertions(+), 28 deletions(-)
> ---
> base-commit: f12ad2e5233a1a30b3bd6fe1e784b3544caa2383
> change-id: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d
> 
> Best regards,

-- 
Regards,
Liu Ying
