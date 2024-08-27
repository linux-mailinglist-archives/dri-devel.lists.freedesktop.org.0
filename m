Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA499602A4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 09:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D15A89067;
	Tue, 27 Aug 2024 07:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="Qb/oW4ii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2102.outbound.protection.outlook.com [40.107.247.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5439D89067
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 07:00:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgDTSvfTcZutYIhvODLY6lgIfge2EEJ+KDHb5/CoJhQ1ZktbfQr5NB6qIgcQAq4fDONEaClSQo3a5j0COQ69+iUpqKLAGQR+E87DkMO7S3hKoAH484elAVdeKteC8Ic7g88+aORSGyBH7oMAD2AICtt7pTXdZ+SKmE0USwSWiGIUGNhBaxMweqoc9VOjVqbn0si/9q9X0gpRwtr4GNMXfNGDUBXMNei4OhmocdraGgEFU/Wdtx1JJKOLoYe1v7lU3YS5BKu+xcFjgmfBc8pR9qQ12ex1F3siEcZYw0jrLhShESbAEROPAyRkC2FeR425w8zEEzIOxospRU9eXjIAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgmTmg7NN+I9otYHtMXChTaXwrLBIbNMXWwdovqVp4Q=;
 b=j1qhzOtWAPYg79yAKUp8ZRRjYJpGPsRCLvaAgd7TTng21tTXvXDya0ZIc0bOfl8NldU5YkCEQGbRQpgdv8sQwT/poRFGZRWm/gpjjgDmjfzxaqfnP/Q9Q1KFPBTU98kaQ+nNGymrV51H6r6kc2BBkk2TrscorI9zVsq/kz/bj2Nod0yNY3b04un3qzquhH+93BOGE+JIVD5FwK412hNx/LCpOWPZ1nJ1aFAtWl/4N9kncEZdNouhnhdvILG+0nW4F08n2B1tyPjHwmZhcbdfWAqrraeLnjE9OHmu8mokzBWs831MyXeJC0rsHYnYKEEstoTLxm97WTLXkDR3Nt6jzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgmTmg7NN+I9otYHtMXChTaXwrLBIbNMXWwdovqVp4Q=;
 b=Qb/oW4iiZ+6/KR2RJMRcpikZgLTVtYT9Nc1SEqVnJBomn32fBlP5glFr1yd/SyKZLJ9xxsyECcYXNQUayC710KcS/3gB98e+BJKGDbbNhLHsd38HIFs3I6b7dSxHzlKRqgCc06G43WZxHEfBLI4K1AQedEj46FR5zmR6YrthEkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PA1PR10MB8871.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:451::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 07:00:37 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 07:00:36 +0000
Message-ID: <2d877963-e2be-4090-a86f-aadccf8f5e69@kontron.de>
Date: Tue, 27 Aug 2024 09:00:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
To: Adam Ford <aford173@gmail.com>,
 Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, marex@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Makoto Sato <makoto.sato@atmark-techno.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
 <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
 <CAHCN7x+bh_ka250hOCenO3Et6re4EJ=5TG8=kpG1hs-PV0dQxQ@mail.gmail.com>
 <ZsVluV50NvuGGHFX@atmark-techno.com>
 <CAHCN7xJnjfjr7HfKF+4pwbENP+p2=vvMXWW1AQShNy87vfQ=-A@mail.gmail.com>
 <CAHCN7xKgpqfRf_2p1z5NyKiOYubbcDA7YE5ML8G56pVmcV+1xA@mail.gmail.com>
 <CAHCN7x+HgasGG_v-PdtmRszhJn5odHzfV6ddeeT10_1yCOS+DQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAHCN7x+HgasGG_v-PdtmRszhJn5odHzfV6ddeeT10_1yCOS+DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PA1PR10MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fa67e9-f408-4abf-6a40-08dcc665f3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUtnWmlqQnQwNWNGa3QzNDgrcW11S3VpWWxpMEhNTUtReDI0cmthSEw4bXoy?=
 =?utf-8?B?RkpUUzQwS0xzekd6M1ZQOGNEN2dOSjBsTlVYd1g4Tk53OUtCbWsydnFZMVZr?=
 =?utf-8?B?Ry8yU010UTk4bkVQQmExSmc4dWx3REptM1dkQlV2VkJhSjlObkhHckhURnFi?=
 =?utf-8?B?V2pMY1lCbEZiVjFWWWhKS1NmcGpiT2NDalNrTXdhaDNsenNHOWlvdU91STJs?=
 =?utf-8?B?S2lRZHp3aVpGV01uVXdKT1Z4K0ttbmIrU1dBNWxibmZ2QjlOT09SRDFVTG1Z?=
 =?utf-8?B?b0ZTN0ZSN3FNc0lJVG15WW9Qc3IyNmpSYzJsV2pwRVhQMGo5bGJTN0JHMG5S?=
 =?utf-8?B?V3JpeDlnZ1Jma2tpQjVhWlR0cVRsWnErQ0s5YkhTUjVkK0F6TVJBV0FSaGhW?=
 =?utf-8?B?dHVnVE81SUZiSlovL2NlSmo3dUc4WDFjTEJQaHB5WXNXTUNUWEV5Zzh2SFFV?=
 =?utf-8?B?V0VVVTFVcVJ4N21aV1k1eTlVMUM1dW5qT3JhWWZJV2NkV0xwZElxTytYYzFX?=
 =?utf-8?B?S3BEZUpEMGR6MlVHUVBLWHJHK294T3pMdCtpeDhXV1NCZnU5bFFwNTByWkth?=
 =?utf-8?B?NFVPL2c1a1hXa2thUVpKaVZKdE9tZ1ZCNGVQeGxsdkxBTlhIQlVVNEJkMUlt?=
 =?utf-8?B?WG0zbGN4eUo3eDVYS1pvRlhXZ0FyRE5TYzNjeHJZd3ZNRFU1VUJQb0pXVnZ1?=
 =?utf-8?B?VzVaQVBqR25NQnRNSVNXU0pUeFEyZTRQSjBFeVFrVjd6Q3Q5YXFCcmt6NW0z?=
 =?utf-8?B?SUdBbHZWVUpxQmY3U20zdnNpbXVYR0xwRWIzQ2J0Wko0NW9tWHNoU1JDdVM0?=
 =?utf-8?B?WCt1T3JkdThLUnNXenU2Z1NzcHhTVDFlcFQyVE5qcFdkbWFjVDBkSXFMUXo0?=
 =?utf-8?B?dnVJWU9hNzRhM3lTWCs1WmszWVVqWEQvYXVMUFNEOWFMV0NSMitWMEpxcUFK?=
 =?utf-8?B?V1FnazhjZ0E3U21lOCtsdE9sWmZJaXJUcElWcUJOU3p5MGIyQWcvRXNTa29C?=
 =?utf-8?B?TGFPREk0SUFoNDVWMjVFK3MxV1Q1ZE1jbEFHQUVGOWhtMENsMzB4djl2eVp2?=
 =?utf-8?B?NzhhNE9BbFI1eXVkV29VR3h3MEF2S2E3clBKNkgrdUxLcER6aW1hQi9FS1ZV?=
 =?utf-8?B?YWZNSnNEOFg5RGthSEZoVzhxOFJQNzFlMU9RcDVFU09PaHFlQjdMMW1KU0Q2?=
 =?utf-8?B?ZlBCUWpiQitYVXBJeDA3QldRTWYwalpWOFR4TEJwZ0c3cHZLOTRteVd5ZHd2?=
 =?utf-8?B?bnFKcVFoUGdCV2dQMlpXM2ZYQUZJRzRpTzRlakJ0dGYwVFJaNVBISXlpWW1u?=
 =?utf-8?B?NDZGQmVLblRaS1B6NUpnWmdNZXk1Y29GWUU2eHJRTDVIN2ZzMDQ5RU5IQ2lB?=
 =?utf-8?B?Z2k3QUx0WmE2MmlyQXJlNC9sd3pteWlOamQzeVd2YTNZNEtwYTRTRkNGaFR2?=
 =?utf-8?B?NzlXSUgwNFcwbkxmZWVKbktxUjhIVTkvc2VLcHI4bG0wblh6N2FSL1NabElr?=
 =?utf-8?B?VzRSWDFOMW16Qy8vS1RMYXVLNWh4blcyelFSYkRCTkpVRVdSbGJoME5KZUYw?=
 =?utf-8?B?dEp2MjBxeWlzNXpIeTVIU293Tm1uaUZmdUtsQlVXa2J3WDhsTG9oYjMxNzU2?=
 =?utf-8?B?NU1mQW84ZSszaWpCQ2VvNVRFR3dXaHhZalBTWHIzbUZsYlk4bEU2TkhITnlH?=
 =?utf-8?B?eFE4Q1k0RUE2cHZDdmV4N3k4akU3NWJyLys1VGVxN09UWFlweHRXUDRlK2ZT?=
 =?utf-8?B?UFY0eDM4T2pMUjVsaU9IUVVpS0pGUElXYUdqazZ2eUJ2OTBLaElkR0l2MzJy?=
 =?utf-8?B?Q0dHdXZHeDJSaTYxcTFmUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGQvdnJ1b09pNyt2Mkc1TmJzUktacDlxaGxveExYYzM0UHFPSllHbXp6WEJW?=
 =?utf-8?B?WWdFbEFEMlNXY05ZRFFmbWxOMFVJQ0lzemdySWQ0ZDMySXFMNDlGcDYybzJr?=
 =?utf-8?B?eEVmSm1mbzRHSGljODVIZHE0c2V3RExNUEhPSzdqOGs0TmNia1ptT1dudXVW?=
 =?utf-8?B?R2tsNFE3bUNJa2Rwa2hnN1kralExTituRzBqRXBGR3VKdTFndVNtK2Z5V0ZM?=
 =?utf-8?B?TEc2KzJURzhyMUV5RUpIU1FYTktJc3pPRURhQnNXbWNQd0FhUUp6T2E0UnZx?=
 =?utf-8?B?dnY0Ymo0NjRxd0pOY3pQbUNYWHBLaUNmV3hZNEVBNnZuOU5oRUJOYU91bmZX?=
 =?utf-8?B?WktyeDdpSGt4ZWQ2Ym0xUlJ0WnNqQ3laamVYblNQQmxOeFJycm5SZFduZ21K?=
 =?utf-8?B?a0NTaU03OGtyZ0hTUVB1MGJoSW9hN1diUko0c281ZlRaSmpSTGJUSHpJMU1a?=
 =?utf-8?B?V2xDT0Z0NkFaNGlRd1c3RTYzeXMwZE1LT3gvY3YwOUN0VVFQS3ZWVmorODM0?=
 =?utf-8?B?K2hGRTlZUkp1T2ZHcDNBMXFPRjBCNHNJOVVPWU9Scy9xclQ5Z3JkYnhCSzJZ?=
 =?utf-8?B?dlVEZWF5SExlOU95L2NPRk5zT29ZeGszTUIxN2FkTlN2TjZtT2d5bU8yYnJV?=
 =?utf-8?B?TmhOTllhU29FdjNjaENMWWZpYnBkLzdaZkVWQXdzUXJZdkEzZTFhb3hrY0Vz?=
 =?utf-8?B?QS9QbEREcVhUdWdBcEcwejBUL0MrT0RIazVNZDU2eld1U2JjNFo1TFlPVFBU?=
 =?utf-8?B?YjBCQVBNUi9IWXJFYjJVK3lHS2NLbzF5NzJtU2VxTWVBNUl5aVlLVHJxaVVG?=
 =?utf-8?B?a3V5ZHovWUdaOWxLSjlneWxLTmRaTEp0SjI4b3hvazZxbGw1UUtxSk9iZVJY?=
 =?utf-8?B?bWNSOGhJc0tzbDluQ0pkbndQT05mZm1SNitPWG1Kc2pTQTZGeCtCNGprWHMr?=
 =?utf-8?B?ZGJ6WVpxSVJTeU9kck1zeWFiTHk3MWhEY3BEVU4rVUhOT2J6SmFveUFSMzdJ?=
 =?utf-8?B?WmcvMkQ3NjYvWjcwcG9VT1NpQlZlL0kzTjJ1M0xHVzQweDNzbFV2WUsyR2xx?=
 =?utf-8?B?V1FKa0tySUc4eFl0ejlyYnZnaHJmWTZiK1AwdW5jT2dvWlk5cVRmSzE4ajFh?=
 =?utf-8?B?d2RJbTJwYlk5Zm9zanlHZGNCKzZTZDBTMDhmc05zalBMcE9DaXkvQVdwN0h0?=
 =?utf-8?B?MWpmdzdoeER1N3U5MXFpS2gvbWo3ekg0NzJwRGIvOEYydEt6WVlaWlYzc1pB?=
 =?utf-8?B?TllsTUhFQmJXNUZ0dytKZUUrOW1KcnEzUFhrTEFNTmMrMGhMdjRUWTZBcndC?=
 =?utf-8?B?MU1zV3M4Qy94YjdWcDdBVEZCZ09tS2h1Mm5WdS9sdVAvZDVOL0lvdkY0NS8v?=
 =?utf-8?B?MEs0OW54SW1aRkdaUmlEcGFpZDBCNDJqUGx0Tm9mMlFGMXZZN3B2alpyblZJ?=
 =?utf-8?B?Z1k1UWNYNFpEMzRaWG9LQTdtYURMdVZHbXdCSFhqSER5dE1UUVoxUmxuT3Vx?=
 =?utf-8?B?NTZZTDlwbGtibzVMQXpVdXF4Wlh2VHJuZWE5WENpT3F4MVhXT2FGL2JQQzlz?=
 =?utf-8?B?YjdLU2xXVjh3UmZTenZ1WUFSdjlqaFpudXZDYXdhalRvN0QyenRzSjJMZWhW?=
 =?utf-8?B?WXluQXV2RXVweXlpSTF2SXJGMGJ5QkIyTFZja1l4S1FLOFRVcEwwcWR5a2Z5?=
 =?utf-8?B?aXJZS1Z5ZkljS1krYW9qZGZSVTZJWGlRb3o3dEloNktrNm5VcnF3VTRNK1F3?=
 =?utf-8?B?NExrczBXN25PVjVrK3pvdjNYOFpKTTdhekhBS2oxdWFPdEV2U3llNjVVRGFV?=
 =?utf-8?B?ZVB6bzF3Zi9sSU9jR3FIcXhXVmx4aFRjaUpBSlhZWUxJdFhjZnlUTXBiQkZu?=
 =?utf-8?B?cll5MmkybDJPOTFXYTU5RVlSWHV1WHlkMkJvSEIrSnhncFhJc0l6NG5GQkJ4?=
 =?utf-8?B?dXdZZEZmVy82Uy9JZGJQQlh5ZkdaeHJlS1Y0bkcyQkFPQkJPc2laTFAyMjFU?=
 =?utf-8?B?cE05bE1adTB4dlRwUzZXaXkrQlpVclNFWXNFRFlDblBoQSs0UEt4K3BveUNx?=
 =?utf-8?B?QW8zSWRQVGRsSlc0VHRNcWxOMU9EUkduS0RnVnZFQjg1MG1BWThXTU1hV0R3?=
 =?utf-8?B?TUdDNWMxQWx0R05acDlJK1pCYmhIb0Myc01ucHNRQ1Ayck9ObVdvUHNpNEp3?=
 =?utf-8?B?cEE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fa67e9-f408-4abf-6a40-08dcc665f3de
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 07:00:36.6723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dN34k0cWSXAy8CiY7CmITylJ6q8mmWP447nbn+fFM9xWx3aq4rjUZDJU0+InY4PkrnvrK8UHcQj6G06c5p3+9CYoaDXisl4QafyWsqXgUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8871
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

Hi Adam,

On 27.08.24 2:25 AM, Adam Ford wrote:
> On Wed, Aug 21, 2024 at 8:59 PM Adam Ford <aford173@gmail.com> wrote:
>>
>> On Wed, Aug 21, 2024 at 7:45 AM Adam Ford <aford173@gmail.com> wrote:
>>>
>>> On Tue, Aug 20, 2024 at 10:58 PM Dominique MARTINET
>>> <dominique.martinet@atmark-techno.com> wrote:
>>>>
>>>> Adam Ford wrote on Tue, Aug 20, 2024 at 09:49:03PM -0500:
>>>>>>> However, this check is a bit overcautious in that it only allows exact
>>>>>>> rate matches. IIRC HDMI allows a rate mismatch of +- 0.5%, so this
>>>>>>> check could be relaxed quite a bit to allow for that.
>>>>>>
>>>>>> I checked with a 1080p display that reports 23 possible modes via EDID.
>>>>>> Out of these 15 are accepted by the driver with the strict check.
>>>>>>
>>>>>> Two more would be accepted with a relaxed check that allows a 0.5% margin.
>>>>>>
>>>>>> For the remaining six modes, the pixel clock would deviate up to ~5%
>>>>>> from what the display expects. Still, if I remove the check altogether,
>>>>>> all 23 modes seem to work just fine.
>>>>
>>>> I can confirm the displays I tested also seem pretty tolerant in
>>>> practice (up to ~3-4% at least), but I agree with Lucas that this isn't
>>>> something we can rely on for a general purpose driver as having examples
>>>> of things being tolerant doesn't mean all hardware will be as flexible..
>>>>
>>>>>> I'd really like to be able to add more PHY PLL setpoints for displays
>>>>>> that use non-CEA-861 modes. Unfortunately I didn't manage to figure out
>>>>>> the fractional-n PLL parameter calculation so far.
>>>>>>
>>>>>> The i.MX8MP Reference Manual provides formulas to calculate the
>>>>>> parameters based on the register values and I tried to make sense of it
>>>>>> using the existing register values in the driver. But somehow it doesn't
>>>>>> add up for me.
>>>>>>
>>>>>> Lucas, did you already work with the PLL parameters? By any chance, do
>>>>>> you now how the math behind them works?
>>>>>
>>>>> I spent a little time trying to understand it a bit.  I created a PMS
>>>>> calculator similar to the one used on the DSI controller,
>>>>
>>>> Great! I'll admit this also flies over my head and I don't have the
>>>> time to study this, so this is much appreciated.
>>>>
>>>>> except that
>>>>> the M seems to be fixed at a value of 62 per the data sheet, so it's
>>>>> more of a PS calculator.
>>>>
>>>> Hmm... PHY_REG2 in the datasheet only lists '0011_1110b - 62' as
>>>> example(?) values, but it doesn't say other values are reserved either,
>>>> I'm not sure what to make of it.
>>>> In the current driver PHY_REG_02 (driver macro) is assigned the first
>>>> field of .pll_div_regs, which goes anywhere from 0x4b to 0x7b -- pretty
>>>> far from 62(0x3e)...
>>>
>>> OK.  I will experiment with increasing the range of M from being fixed
>>> at 3e to a range of 3b to 7b to see if my PMS integer calculator can
>>> get more accurate.
>>>
>>>>
>>>> Since other frequencies have been adjusting this main diviser ratio we
>>>> actually tried copying neighboring values and adjusting only that reg 2
>>>> (so the M if I get this right?), but the end result ended up not
>>>> synchronizing properly every time... We didn't have time to check with a
>>>> scope if the generated signal was ugly or if it just didn't lock
>>>> properly, but the display worked when we just re-used the neighboring
>>>> values without changing anything despite being ~3-4% off, so we took the
>>>> easy way out here and didn't dig much further.
>>>>
>>>>> Anyway, When I run my P-S calculator to generate the 'best rate' I get
>>>>> a value that's usually 0.2% variance from nominal, but I only verified
>>>>> a handful of values:
>>>>>
>>>>> Several which were +0.2%
>>>>> 297600000 vs 297000000 (4k@30)
>>>>> 148800000 vs 148500000 (1080p60)
>>>>> 74400 vs 74200
>>>>>
>>>>> One value was -0.16%
>>>>> 24800000 vs 25200000
>>>>>
>>>>> If the M value was a bit more flexible, we might be able to reduce
>>>>> that variance more.
>>>>
>>>> Yes, I think the M value could be more flexible, but that'd require
>>>> checking if it actually works, whereas having slightly off frequencies
>>>> will most likely be OK so I don't think it's worth the effort -- happy
>>>> to stick to what the datasheet describes.
>>>>
>>>>> If / when I get some time, I might play with trying to disable the
>>>>> fractional mode and just use the PMS calculator for simplicity despite
>>>>> the inaccuracy.  Maybe we could fall back to using the PMS calculator
>>>>> if the desired frequency isn't in the look-up-table.
>>>>
>>>> That'd be greatly appreciated, I don't have any strong opinion on
>>>> whether that should completely replace the table, or only be used if
>>>> there is no exact match in the table as these are values we know will
>>>> work; but we can definitely test any patch you can throw at us here.
>>>
>>> I can't promise it'll be quick.  I am not fully certain I understand
>>> how the whole thing works, but as a rule, I don't generally like look
>>> up tables if they can be calculated dynamically.
>>
>> I updated my PMS calculator, and I randomly selected 5 resolutions and
>> they all returned an exact clock match, so I'll attempt to use the PMS
>> integer clock instead of the fractional one.
>>
>> It'll be a little while longer before I can do anything with it.
> 
> Frieder,
> 
> Using my PMS calculator and Rev 2 of the Tech Ref Manual, I think I
> can generate you a table entry for 51.2MHz.  I don't have the ability
> to test it.  I am still working on figuring out an algorithm to
> calculate the fractional divider, but 51.2MHz x 5 does not' appear to
> need the fractional clock divider, so I think I can just get away with
> the standard PMS calculations.

Thanks Adam for all the efforts. The initial request for the 51.2 MHz
clock was from Dominique, not me. I was just jumping onto the bandwagon
with my own use-cases.

> 
> My algorithm showed:
> HDMI PHY Best P = 1
> HDMI PHY Best M = 64
> HDMI PHY Best S = 6
> HDMI PHY Best freq = 256000000
> 
> I'll try to generate a patch to get these values into the table if
> you're willing to test it.

Any chance you can share your algorithm, so I can try to generate some
table entries for the missing frequencies I encounter?

If we could figure out the calculation of the fractional divider, we
could generate table entries for arbitrary frequencies, which would be
an easy way to add support for any strange displays out there.

> 
> All,
> 
> I still think it's a good idea to fall back to the PMS calculator if
> the fractional stuff isn't found.  We could then determine which clock
> frequency is closer between the nearest table entry or the PMS
> calculator until someone can come up with an algorithm for it.

Yes, I think that's a good idea.

Thanks
Frieder
