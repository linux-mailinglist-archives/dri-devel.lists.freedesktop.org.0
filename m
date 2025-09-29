Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C56BA7CA7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9FC10E1E0;
	Mon, 29 Sep 2025 02:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="S4smOOXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFBC10E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:15:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI0b3GSRIZzkwpP+kuEFO5Q/bh1piiQX6HvYSkKbOiKZj9TtTvGcH6wFqRj0RZgBmyDcWa1zOqJIpEgiQxmdIvEacCnCtI1kKi+1hWojzSo9Nss46xdYI99pIGYXe+P/SR033SHUgkm6fggkfCjaNCuDoUeQ+rq+QXIJ5rfFOn1IA3CS15QR4QpcwTvjCgnQmf7BRpWo1ME9T3C7Oc4gDuL6lzJNeKukvIfNQRXOFCuqFkkKjORhOwN5hr9rY06Uacmt/Kze3uHu2emFYzmA2UvtbznPQGrbdYftEkzqlMceSTWEM4kTQrayatP6yP7rM+Lm3/kKgVnJlPHL6FAuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuqzWlBi/WOee/Te6ttUuJ7x+1T7mEdCNTkmDZ1m1bk=;
 b=BT7k46K591RMldJk7pzvwIF9jQjp9dqkTXiSFtwtOPdHB4mHC4QUGtw3nKFMcvlsGHTrf89gdkU8URqRtc+y6ZQNcJxHmgAyyN7BpBHa9xoI2Fpf7Yi9px5s1FRlX6xH1Gu3MUccPq1hd2JVcYotaq6UNMdoVfCl4CJX2lqffJ9ElbP16W3myHBjHY6RNA5NI4NLPQ+mzX1MYPZqKBFT7q4cbwwLD/Q1g05/oc7oc8ghqxdd96eQSlMb7hmDtl5Quu/R0T33G/y3kiYBamDnRuS6j03Ult1gPZbMh0xlZ4BBtvkjmVQ1sxXjiA0hgJgFr5I9tjgObWmDfsdBBJjCXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuqzWlBi/WOee/Te6ttUuJ7x+1T7mEdCNTkmDZ1m1bk=;
 b=S4smOOXjL8TpBJEWxxRpOWP5oaoZNTSoWYLwUjQErFxtfd2a8wEPhiMFT1WqXUplRwczyHzuew+Q/fpe1apFmHv48cq5YbbBL+MRqb4f1RjlkZfg+qB7pi9dc4qEO6NqjPOePXh4ah1f/qZLc0skqdhFKcSVh9PNoGOooMyOAHiS2hSKdhEig45EEwnJVxyOOqvxAMinmbqQ1K6Ofdpqkeq0AwOrzByOp6UJB8Qbp8A962iu5bIFnVqVzXQrTaH4x/+aIF4mNFEfg/IiW4JNWN+N64DYuz1t44J3tKGGFGC87Y1KOQEEHw7BNlCa4GyYDsCSyB3s75ZDT0yndODHFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAWPR04MB9720.eurprd04.prod.outlook.com (2603:10a6:102:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 02:15:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:15:48 +0000
Message-ID: <10bf0b21-cfb5-4105-b274-38483a38e6c1@nxp.com>
Date: Mon, 29 Sep 2025 10:17:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAWPR04MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bc560c-e8d1-43c4-2f3e-08ddfefe1a8f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDlCdlNGZ2c1RDlxMWhXcHIvdkpneHhlT3p4b3M3emM5RXZUMlBFYkh2Yld3?=
 =?utf-8?B?QTVoazF1TXJmelArQ0dPTW1JSjlPRWc4T3ZqblI2dUdZekozUmplbUR3UUNF?=
 =?utf-8?B?NzVUZGZHU0NNeHdwakxwM1lWMVRZcXFrS0R1UHJHS2dlWEtCQnJ5Z3Y1RENX?=
 =?utf-8?B?SWJGQjZ5T1QzNzA3eGc3czVydTdhbDVBazVzcUdodVNUUzcwdVZ0dlhmOGJC?=
 =?utf-8?B?Q05Yc1ZrWGpIL04yUjZPWEphQkxIOWp6Z2JjQnFBZEhzNTBlOStIcWNueWpl?=
 =?utf-8?B?dlRpdFFFbzllUjIrTTlqNUxFdzFiajBzMlEwRStUcEs5QUpTcjRzNnlnRmh5?=
 =?utf-8?B?VUMwRjd1UHZZZHdjUU1FcW5ET1hmU0tpNWVtK0tMblIxY0JJSWFtSmgvNnhY?=
 =?utf-8?B?eCt4SDVQL0RLR1ozOU9ES1R6VEkxUVhrOHV1NGloR0F2LzhlejhtSGtNT1R1?=
 =?utf-8?B?YkJySGJkMnh1Q01sWVRodWhCbHh1bGF2ZWpLTFh1ZFNrT0YxZ09HdjRGcUpm?=
 =?utf-8?B?ajhhNFcyMzNEMEx2N3JLNUxJRlpiRHFLUHI0N3pYc3ZSZ3hsTXBsend2VlFC?=
 =?utf-8?B?dGtEMUpCMExhWEZDV3kveTkvREU0S0Y1TzJsVStOUkhiL0Q2RVZJVCtNWFdw?=
 =?utf-8?B?MnF4V0VhWFhVZ2wvTE4zODNKaVV3MHJCZ1BPQjRIK3FyOWllWHU2amUwdWl0?=
 =?utf-8?B?SjliTlZmUFZMbGt6OWxaWlVVU0hheWZDenNUS3FLNFdjWUsrWkRLSkdCdWdP?=
 =?utf-8?B?bXBzN0hZcHcyWnlJT0VyT1AyRDBEUmxWeFNoejFSdHZCWmxHL3RJUS9lN3hD?=
 =?utf-8?B?Q2tTREFSY1RDcjJYeDYrM21nKzBQOG1mNjFyaG9mL2hqMWZzUCswV01QVzFI?=
 =?utf-8?B?eXJVeUtadlk3aG5iN0Z2SXJpdmh1S1NvYU9zQ2wyYWM1RkorSE5ySTZHU3Rr?=
 =?utf-8?B?NS9EVTBaTWpkdjlkbTJzOFBYM0NUSnZ5SUh1dU5VNlEzWTE3cjBWMTFSMkdv?=
 =?utf-8?B?Wi9oMGh3UEZ5dGdyakEwWEZQUG9yT0RvSjVmNWcyY2RaSlhUVElMTkR3TE9w?=
 =?utf-8?B?OHhYaVFKT21nbEpLYzZTUWZjbjFZQjYzdHc4YjdYNlFTb0QvSUFDTVM4ZDVZ?=
 =?utf-8?B?WFBzbjBlUTVTNUNXd0gxbHMreWVGWFQ3elJlN0pIRzJMUnVIUkgyT3ZXRXlL?=
 =?utf-8?B?a0tESWZOa3RDTXBhcm9kT3JlekhYemNwaCsvd0FzZVJGVnd4VGYvUEQram9B?=
 =?utf-8?B?UFIrN3U4c0J3eWJ0czkveWVNS0dGRnRkOXRnTHJnQW9zeVlJYWYxZEtVek4y?=
 =?utf-8?B?YktyM2MzSHpEaFFEam10eEVaS2xvRFJwcDJzNFFaS1ZycUh4WHhVdVNzb1Rm?=
 =?utf-8?B?THJUWC9QUTFnTkZnc2Qxb3JjZTkvSWk5ODFIbUUrdHJreWFkTlkwcDdISXNB?=
 =?utf-8?B?cHNucGMybUFjVXpJUHZMTm1BL09NdHBVeHBBWVZENWo5d2RxL2JQaHNwMWc2?=
 =?utf-8?B?L1loY2NJYm1mSi9TaHRpdnNzcmtLeE0xUHE1NUl2SHZPUHVFUnpCdDNqVHp2?=
 =?utf-8?B?Y0FBeVkwVG5HS09IMHdxditucXpiYTJKQ0Q0R2Y5dE80MWl0d1lnMjBoQzgv?=
 =?utf-8?B?Q3VYcnUwYlB1dkJJR0l3RldGQkRud2hRb2UxOG5hRC9DNnBtQjdROEFuWmpP?=
 =?utf-8?B?dG5kV2RZZlh1MFo3emQwNlV6T1FZZENKbUFYZEZZeG5pRTFOdnRxR0pDaGZv?=
 =?utf-8?B?d1liZ21sM29YVVFRaXJVWjNzeS83VEE1UEs2RE1oOTI1bjdvREdEWjVDRjRF?=
 =?utf-8?B?UXkyL2N4K2pWNzFhRlJuMzRqM2g4eWlkWlpIWlhGV01VYkZNQURoeDAvTGFH?=
 =?utf-8?B?TlB6aklyYWpsVk45OFVITkpNcllScmZhUUxvNFBQZXJITXc1aW1LR0FpajNI?=
 =?utf-8?B?OXJaelo4Zzh3NUJHQ2ZvRmNzWFJBRHQ5R2JDaEVvazNOMU82ZE5FYjIzR1pi?=
 =?utf-8?Q?BKf8u9M9+nW32CmYnlVIxMFwOi8h6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWRKWU9kc1pUOGdPVFQvWnl6elBkNXZwN293R2NNbEZSVzdHbG41UzAvRHpI?=
 =?utf-8?B?MlBxN3FLU2Z5K1I3NExiODZTcldCSlgyejNyQy9DNzdSYjdrWVZaUEF2U2tL?=
 =?utf-8?B?MEZMYXlsUEFJYlNBWUVWdlV4bisvUXdBTTg3UXIzcm1FWEFkamtyZDJPemJs?=
 =?utf-8?B?a0NsbVpheWJPMjdrQzIyZTZaTE9FZnFMRk5JbWkxb3RFZ2NqT2YzRktyd21r?=
 =?utf-8?B?bGRIMlNVNTJqV3JadzdiQmxVQ3QrMmxIV3lja0l1QlBVeWlzT1R4Y2Jhamd6?=
 =?utf-8?B?aC9WWXNXZUZwZG5YR2E2c3RIZ2M5WE9ZNVl1V1lPQ25sRE4yeXFicVFXNjBC?=
 =?utf-8?B?U3JGeEZESzFweXdiOEJiV3JGODVtZ2poVkpvYUhubWtKZjdpMjFaclo4T2FP?=
 =?utf-8?B?SkFkZ2RGblBHZWRjU3pxWS8yVW0zTHArK2I0T0V0QVlRK0RJYU05cURlbUc5?=
 =?utf-8?B?SGc5ZFg0dUpkdHZxSnNaRmxDTzMyemFLdGozRjU2TFpNcm1PZzJnZXhjL2Vj?=
 =?utf-8?B?MUtuZjl4WXdyU3NzcVFQMzRIcG14anRHMDR5SjM0cFZyek0yMk01VUpCSENK?=
 =?utf-8?B?OXE0a3BlMHlGT0hmM2Q4L0U2VURycEZOTVlwa0swaWhocTZXWERKelNVZ3V2?=
 =?utf-8?B?ZjZrb3VIbkNRNzJLMlhUVDRGRlo2ZEMzeFo4ZXB1UkVLb1l5a21KRVhsYjBI?=
 =?utf-8?B?aTBaSm9EZkdZS3dhVU9COENoTTgwLy9IcGplaVJFWFZXQWlRUTdkdm9XQ1hX?=
 =?utf-8?B?Sm1pQlI4V3hkOXVNYVRYMjZDcERXV1lMMDFLdFdjeG5OakZWMEhBbDZzQ2dV?=
 =?utf-8?B?TVFKWkY1K0k0UjY4OEY0UDhQcmxScU5GOFFBK1c2T0kxQlE2Q1dDeEU0TlFZ?=
 =?utf-8?B?azQ3YW1jdkVKaElBclVFVTFCS0J1c0tFOEgrZmhXbGFkb0R5R3dDM2txSEhS?=
 =?utf-8?B?WlFNZ1RsQXQ2OEFFM2tVYnVUdnNuS2NOcEpiSXd3M2NkQnRpb2tpZTJjWC95?=
 =?utf-8?B?T3JUYnRTUlAzcnhIL2daZjNRek9sMFg0QlN2NXd5UTRQaVZNYnRPbTRWNXZr?=
 =?utf-8?B?bjd1RWUyK2gxV1RDUVY1Q01ienBIeDdzVloyWk9GT1BuVS9VMEtDUitDSHB6?=
 =?utf-8?B?YXo0MFBWREtSYXczdHNDU1d2T2RieGJzS2hjZHc3ZGx6b1RaSURZMXFhMCsw?=
 =?utf-8?B?YU8zQ3VBYzlMRnpPS3QrSUNhZk81dEU2WEpzNXc1cmIySjlLS3dSNTFOUFJl?=
 =?utf-8?B?OVpKZWs0Qy9KbDZzTjhFRkRmMU9UV0NZZGQ0Ny9oRFk4eURLcWdIVkhXMzBF?=
 =?utf-8?B?YU91SlR3K280ZFpKVmwyZVNNZ3plU1p2aVpjaFBCSHdlaGxhRWwzbGdFWWxp?=
 =?utf-8?B?RE91WFJ6ZlZqVVN1SzdnRlpMVmRuL3l4QksxQjNCQnFRcitSN2hISjU0UFVQ?=
 =?utf-8?B?d016UHl1ZGpkcjh5NDIwUWFEeGdkVTRxUXJBaU94ZmlkZGx0UDIvci9lckUw?=
 =?utf-8?B?aFNpS0RhQkN1YnJCVVVIYUxkVFlwL0wyMDNWYVhHbW90eVJzTmFXU0NhVU1W?=
 =?utf-8?B?TmhWRVlpZnMvc3pHL1ByTnA2djJNNEM0U0JidXpndERrOHEwaUtwd0hUWjQy?=
 =?utf-8?B?N2t1RnVZVk1lb3RFVEhkL1F1MGlMVzBtQUpVTjErYlRERzIrR1J0UkNOTndt?=
 =?utf-8?B?emtid0V5VEtqcnJoeE9kbnZwR0l2cXEyQ2VvVm5MVWFtZCtlcG5UQ3VKK05m?=
 =?utf-8?B?VVo1eVpPaXNoUjhKRHM2bk1SdEg5NHNyK01VQnZmS2F0azh2WlJPMWJMcGhw?=
 =?utf-8?B?dk8wU1ZzYkhTdmFTUlhOU3NyUGpic2xaNGZlWlF4eEtMdlh3aUxGMHBudFJh?=
 =?utf-8?B?cUtZcUxHSzAzWmoxbHI2MktINDF1aGZ4RXM1ZEFEejMyQ2NMc2NBSGV6Y2Nq?=
 =?utf-8?B?dEVzb2hoZGFPMklhMGJ2UC8yV1lWSDA3bW1TRmRFWDZJeGZEU0U4WFBXaHBI?=
 =?utf-8?B?cEw0dE1rUFhGSXFCeXVnWGYvNzBKRmtSOFBMSnF6TjJZTC9xbU15elRJOU5D?=
 =?utf-8?B?TXhOaGlnTy9UcHRkZW54NnFvVzlsQTN5UGJwN3d6d2JzbnVkcCtaUVhra1RS?=
 =?utf-8?Q?mQtv2j5Gx7mWuMjM6SRBMg56X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bc560c-e8d1-43c4-2f3e-08ddfefe1a8f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:15:48.1854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igSE0S+n+5x4vhuI7yHHWdaXVBrkmW5KGSnlhbWn9Kmf2WjKnbj5mwtB3I0IO4I/PzlJLzHjUw+ITVz22Q3Z9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9720
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

On 09/23/2025, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> 
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.
> 
> changes in v7:
> - add back the mutex which removed in v6
> - add Tested-by tag from Alexander.
> 
> changes in v6:
> - remove mutex in dw_hdmi_set_sample_iec958()
> 
> changes in v5:
> - add empty line commit message for patch 7
> - remove blank line in dts node
> - add component_unbind_all when dw_hdmi_probe return error
> 
> changes in v4:
> - separate dts for soc and board
> - bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
> - add "select DRM_DW_HDMI" to fix build error reported by test robot
> - remove unnecessary code/definition in pai driver
> 
> changes in v3:
> - add space and 'U' in asoundef.h
> - add more commit message for binding doc commit
> - add bitfield.h header for fixing build error
> 
> changes in v2:
> - address some comments on commit messages
> - add two more commits:
>   add definitions for the bits in IEC958 subframe
>   add API dw_hdmi_set_sample_iec958() for iec958 format
> - use component helper in hdmi_pai and hdmi_tx driver
> - use regmap in hdmi_pai driver.
> - add clocks in binding doc
> 
> Shengjiu Wang (7):
>   dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>   ALSA: Add definitions for the bits in IEC958 subframe
>   drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>   drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
>     format
>   drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
>   arm64: dts: imx8mp: Add hdmi parallel audio interface node
>   arm64: dts: imx8mp-evk: enable hdmi_pai device
> 
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
>  drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
>  .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
>  include/drm/bridge/dw_hdmi.h                  |  11 +-
>  include/sound/asoundef.h                      |   9 +
>  12 files changed, 382 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> 

Since patch 2 has Takashi's R-b tag, I used 'dim -f' to get rid of the
below error when I applied patch 1-5.

dim: ERROR: be0bd958cedd ("ALSA: Add definitions for the bits in IEC958
subframe"): Mandatory Maintainer Acked-by missing., aborting

Applied patch 1-5 to misc/kernel.git (drm-misc-next).  Thanks!

-- 
Regards,
Liu Ying
