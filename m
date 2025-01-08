Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0AA05184
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 04:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5DF10E0FA;
	Wed,  8 Jan 2025 03:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GOBmUkqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2059.outbound.protection.outlook.com [40.107.103.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BAF10E0FA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 03:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+6n5H6crwCBGKFUILgVpQzlEHCLNo4UTGfd0TMC2NiSrSsJFFfAc0eJ/RQBi52G6O9T6rFEhiDL+42yI/UyYpki2tLgkWFsnjCFwYGi4j9I0DJ6GNF7nq+izr5/5DMfR83JNbITOioVtCW08rofggIbsFb8a1KfSkp8INdFKnPfclIPaHjA8/sSXBLiIUH644y+hwvSPBjOAhAbyIGdCDxL1A0c64PcV7NCcbbFM4OBbqONn8SUXhh+qS44FRlopSMT7YHBHx7xvzTKZDHtH1Ku3FF13j8H2xdcZAcru69vuG+NUK/rk+P3TiJrZZ/bd5sdyAi15qFeSFS6UsvglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWIbPkJ19VViiyLeiweKfAJoGp2hWCmpH01yXg8I/gg=;
 b=h8m6m8rHq6y9QHU/6KtAxfsblKofTxw/O1MUnX425DK73WvwtZoBX9VxC6Sa3jQ7u9LaVCotVPZQPJGPi6k2zVHsJwtp4bPqM07kYItHxxZxkRJumQBExOf09JAUzALXTOhx7FX3Y701sO8ZayKJFhKgbDb6VPZM9Sc0qrbeMZq+aM9Cxmql07qoAWNFJgnJiJV6sGK5ijx7joB8EaFuzJStSq6zlIV/pbRJ6nKsd2viAy37zBMjwYXoz/1I7GzczwvdboSi4iZLS7ZXmsBy8/2+a5ydPxTYxEoVvxJtLyaVcm9UX1jfEIZV4Garj3Xp6kmu2QPDmFSjoq0vxSgG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWIbPkJ19VViiyLeiweKfAJoGp2hWCmpH01yXg8I/gg=;
 b=GOBmUkqIOzZMcP9hRYhhQMPAgFYohd6wpMV90v9VVyPzY181j+6MDshMTQEhZrT7544lTMM4NHeVmn4Sty2ZCeWTHpH2y0Z07751MERt5WVsgc/YfKvcEoChQum8jkdfTGkQZOa3QFUeGil7glBdcYT+NyL5zTTkAd0+xySNoVtpf6Avt/Tb1SJexg2tzSSGSdFmo9hMY5vBXSHLmGzp74WCDUByx+rxLkEeheNYmPgZDPHVQZupGbFGQYnkZX8vlIO1gkU/8u7j+/0FGPrmetw/z3H+FJLiPn0AKJVqthByIlN70ujtt8tggNIym80qP2lneAGiF0qtu/iINdfUGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 03:21:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 03:21:29 +0000
Message-ID: <add11437-4fa8-489a-9cde-9c08cfd71db3@nxp.com>
Date: Wed, 8 Jan 2025 11:22:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
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
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
 <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: e405602c-8bf1-4b25-c2f5-08dd2f938aea
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zml2WnQycDVXc0hlc2V4UVpoekY1Vml0U0lHT3VhcEIxZUtRRkVwUmJxZGxi?=
 =?utf-8?B?WUsvVkxmdGV4QWJENExnTmsrS2RxbklIdkcyNDNrMXZMbzRYR2JqNkVyUWsx?=
 =?utf-8?B?Qm81ZSthUTQ2cnFIWXVHa1BlWHRSejBnazNldHNHUEFEZVh4MVZtR3dDMHpV?=
 =?utf-8?B?OEtpTDFUbXI2eXY4UFFjNnJJOWNINXlBVHRDTk53bFVKd1RncE52ZEkrRlVa?=
 =?utf-8?B?bjU3L000bzNnUGVtTTg2RUd2dHc0STNvVUQvVy9UL3pZRkowSUVoUnJWU21C?=
 =?utf-8?B?RzBlaFFaLzNLd0NSMFF2dTVwZTdnZVJuQ0twVTFScmNYZTRTUmpKd0lMVXcz?=
 =?utf-8?B?cEJLcGx3b1l1WE52VlI2TXQ0REozSEpPMGNqc0tKdTBqenV1QnVtc1hkSXNG?=
 =?utf-8?B?V0VidFpzenlPTTc3WkVlWkVHY0RrV3cwL0pEZE1uNVJtQWxuV1RqQ0ZvUTZ0?=
 =?utf-8?B?bTlUa0NzVWpMc1NUREM1WEpoc3k5cmVXNHV2MzBhSW1mV0k1YmdQTWVVSVhN?=
 =?utf-8?B?bko1YW9oT3pMcVhmbjJyaDMvbFdpVHkrQVl2NWE3bzZrb08xeE12akRxaTFT?=
 =?utf-8?B?NjdPRGppeTRzR1N4QkJnaG4xWUVuenBPVkx4cDF3WnpBVXFMSHdMOVJ5ZjJZ?=
 =?utf-8?B?Q1hMZzdvR1hQQUE4OWlmY2NlSGRwYnM4ankxaTd2T1pqdkNpODQ3MzFLWm83?=
 =?utf-8?B?WnVRNjVjSlZ5dXBlanI1R2NzZWNxY0NleUZuM2pNWTNwcmpmNzFja1plNk5u?=
 =?utf-8?B?em4rdkdaMFpjcy9pTkhLREMvVzRxdXVDejJmcVE3UXh3ZERUWXNrVzZIM01a?=
 =?utf-8?B?a0J4Z09tWXBvTXU2RUNJMXdydnhhYzN2ODkzUXZHZmlvM1VuZjRJN1NhV0Fv?=
 =?utf-8?B?RzlaWFJzekNQbWFIcVp1L1p4d2JQNStlbFNpdTBJZmpEcThMOS9PaS9ERk90?=
 =?utf-8?B?SWw3ekZUZG9yRytxYVBldlduL1VCTUhMbTBwN0lHa1A5M2I5Z0xTOUI3VDlk?=
 =?utf-8?B?c0I4RGowUmw1YmhQY3A5czhYdkkwVXoxSjRaQ2k0WXVhQWhWYkhGSEJvaVdx?=
 =?utf-8?B?SlR2N3NEUmJ6eVhwNkNMdE0yamlYMVQxa3RuWTVyZFpIRFNzelJxV1dVMGZW?=
 =?utf-8?B?WWE3VXNaWDhXMFZsbnZ3RGJWWkVKeXgxcjAzZ0dtUUxkRHluYWxadEVqUFhs?=
 =?utf-8?B?RC9qTWd2bnFkcFJrZzB1RDl4K3FtdmdUa3lQYXNCTTJSSXo1dnB5MWdPMFdm?=
 =?utf-8?B?WUExKzE0a1lOclZQaVdjb1JzVXYzYjNSYmtncktkejAyN2xZeEcrdTUySnY5?=
 =?utf-8?B?TFowdGlKc21RaGxScndnOFF6cE91ME56dUU5aFVlNGhtNFlrQlh1NUpDcXU2?=
 =?utf-8?B?a1kyVWIrckxLUG1MMXRMTlNoTlR0L0xySERBTkxibGxiUWpZNlVLcWdTMURF?=
 =?utf-8?B?cTNtRDVsQzlrNHhKZzdyZ01JeFdYNjRvSzVUOGRiV3NoZ0JNTFp1YjVXMkJM?=
 =?utf-8?B?ZG5TbkV5YVhOQnlsZ0Rpa1puL1FQU3Y1UFBkcENsOTVQL2FrcnZidGhFUE1z?=
 =?utf-8?B?cXBFK2dOZXdBdk43eFRBdHFGcjlBQVhHRzl4dmpqSkltbFJ6b01qcjhSMmVn?=
 =?utf-8?B?VVJqWG4xaXA2TW5GRldXUlVORno0YXJLNS8xdG5nMmRTbFRiVGhTUUVaTkla?=
 =?utf-8?B?K3FjYzh1azdsM3BWZE15QlNRRFBGTEdMYmx5M05EUkdzRW1zdFlEdERDNzFF?=
 =?utf-8?B?RlJuSmhvTkRSWFlRZGFWcWJudzlpYXdaN2F4REFXTUZGK2NnZGljc2JORGwz?=
 =?utf-8?B?dXJHNEhPTnJSa2labkI3RWpoamluMVZRZDNnY21KODVwSW5xdXlIcktPOEt5?=
 =?utf-8?B?NWZPQ2dOcURyb0dlc3ZlNkF5TFRoWUN4NThUNGNkb0RNOHNkVlJqWjd6ZTlz?=
 =?utf-8?Q?lk8Zq9z7pMw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0R3VDNadUJXcU82UTFrYVpzTitZUGp6dEFxUFZzdVNTNlhEV0FlUUtXTGxO?=
 =?utf-8?B?SXJDMGtVRGEwSlNsWURWSGtLYVlEbml0bWJ0SXhPYlVVL2RSclN6L0UvTzBw?=
 =?utf-8?B?eTh4aWxJcTNQT0kyejl4akZlZ2NVaDJYZmdaUllCVWlyTlZrYitKN0FzQzMr?=
 =?utf-8?B?QzRraUJwazhYaklDRER0VnpwZVFXcTlRRnE2WlgreFVHOFVTS1VVTFgrYmUx?=
 =?utf-8?B?RVQwTkVEZmp1VDBUR2VvZi9kVEJMakFIclpObmhWRVpDVmxNNWhKVzFtc3RR?=
 =?utf-8?B?dVNqMGhpNkR6SXBlZFoxQmJWWFRoL25wV01oSUJ0MzFGM0lDVlp6WnJ5RVFR?=
 =?utf-8?B?S3pNMnRsK3oydUdicVowMCtpSTFiVzhQRXYvVzRMZWU4dlFDWWJ0TFladlJK?=
 =?utf-8?B?S1BRcnlGM2VPOW5uK3RJL0hVempqS0Y3VVZtNXdKODRZa3U5cXdQYTB1by9t?=
 =?utf-8?B?MXFVbWl0aXZPZUx4QXMrQkpUTTR4WUFpU2JYbWRtRlo1RWJDOFNrTXlpL2kz?=
 =?utf-8?B?eG9palpCRmNxV1ZDUWZ3b0ZXblZMMWgwQW81WkZxZU9WWHB2U2pLdHB0eEJl?=
 =?utf-8?B?OGs5cFIway9JUHBVS0RJKytmbndmaFRBMTdOVlJCV3Fjc08yWDEyMzdJZ0Fr?=
 =?utf-8?B?WUxKNzZldXVrUGFyS0tpZ3p3VGdwQlVxSVlQMDVVTTJiQ004MkhTR2lwK3gw?=
 =?utf-8?B?S2JrRmQvYlYwUnBWOFJTQkxrNlRoazlGcVkrOTRTY1g4bjRNY2xwSTV2S2xq?=
 =?utf-8?B?YXEyUGljSGZKc0w0WFdMRG52Qk9KYXg2R1k2MzViZWFyV252eXdobXpKWXFx?=
 =?utf-8?B?ckdoVllXNlVGYldmdVFPc3JxV25CRk5NZGVuT1RRSUpxYU1xKzZ0eDJ1L2ZB?=
 =?utf-8?B?SVNIUW16KzJpZ0pRa2NhT09MajBhaUlWRW1zT1hCWFVDOXNZSW40d1RoOHJY?=
 =?utf-8?B?WGxvQll5ODQxUzdYZldDR09CakhBeFl3dWNRNFFZaDNHQ3E5MC8zS2VuT09T?=
 =?utf-8?B?dmJRUGV6dWFpZ2xoT2FnM3Y4aFhxWFZrc3dpYVNTZHBLRDlXeXUybVI1aXlC?=
 =?utf-8?B?ZE85S3BCN3Z0bEZkOWtNQWxLYUJxOTlRNDhZaG1ZTFQvZkN6SjRaVDNFNy9w?=
 =?utf-8?B?QkwwaHBqWEJxTWRnTzBLOFc3Q0theVdRa3hTbVpkdStWa28vNkNiejR3S3ht?=
 =?utf-8?B?WmNVMEJKN1RINEFNdjlQY0lKb3hYVXBhcFMxbXN6aEtPcGtJSUp3WDNoK3Ns?=
 =?utf-8?B?MEtNRjdDc05MWmFHYUQxb2tld2I2bnpjck1ab1hUZEJHL0VaS05ySldDd2Nm?=
 =?utf-8?B?U0JyZ05Nekovb2pYN1R6dEQzcG9lakVHcmswcWkxdDNrV3Erd0ZDSmw3cXpy?=
 =?utf-8?B?cmZBeDFzVEZQVk04MTd5RlpFSEdWOEpyYWI1QWUvcWJQeHdTOHkzdjVZSVFw?=
 =?utf-8?B?c3RMU3VwZ1BaOW5TZnJJY25oZ05SSStFM3FGSElwOHlINFhWQ3BicHBCRFJY?=
 =?utf-8?B?R2ZUNk5td3JEcDdXR2J6MGdVeVBSMmJ2azRMYUJkUStvWXNZVEQ1d1dYTDhZ?=
 =?utf-8?B?aGpWQ1VhRWNqOVZPSEJKN2hsK2ZGbmZ2UGdGc2FwY0xoZnk0WUVDbmdTVU5J?=
 =?utf-8?B?M0Q0eVhYbkc4MGJ4TVA5ZGlqV0dwQ2dWVzE4K24rUURYVlViSWZocmtYdDdB?=
 =?utf-8?B?MjVrTGZYNHoxUWxRYmY5dytpZXhOL2hTMHovL2ttdFd3Y05JM0tNNWtpK0Q1?=
 =?utf-8?B?NTZvWjZhL0JpYjZBNjFPZFBUNnBWb2czVzNQek40TldCVVdua3dYQUpmOFkz?=
 =?utf-8?B?UDVCZWZOeko0eWF2NXQrcXh0cXdhMldiR2plaGgwZ3ZJREUwM1IwSXFUaVNx?=
 =?utf-8?B?cmNXRkRkdFN2MnZoWEc2VmFyczh5dm9lMWl2R3pLSEpma2RSQVB3WUdsZ0Vh?=
 =?utf-8?B?STNDeUl4WFIzUHNIa2JTVndBb1Rsc0RIT05PK0o1eTdicmNkSFRGWjM4QktO?=
 =?utf-8?B?bTM1ZzZmQnVWVUJnL1FhVnFOYVlyVzliRExzN3RITjg1VTF6MGFHa1F5NTFq?=
 =?utf-8?B?aXZ2bU9OMkhub0NuVEpSdkVucGFGVnNkY0lwRTAwTEp5SFB4U3N6Y3djeWti?=
 =?utf-8?Q?fOkmIToFk47Ca0JzovGtfg802?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e405602c-8bf1-4b25-c2f5-08dd2f938aea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:21:29.4934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeRJDbLkLrPXXv9etNqE63qq603fjsDIKdRN6t+S5dkYpg2YrVUt3nEdhzKQfWDf+wpqh54dBLuR2Fzwvzj1FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041
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

On 01/07/2025, Alexander Stein wrote:
> This simplifies the code and gives additional information upon deferral.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 26 ++++++--------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> index 65cf3a6c8ec69..038eaff889bb7 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -398,20 +398,12 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	p2d->regmap = syscon_node_to_regmap(np->parent);
> -	if (IS_ERR(p2d->regmap)) {
> -		ret = PTR_ERR(p2d->regmap);
> -		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(p2d->regmap))
> +		return dev_err_probe(dev, ret, "failed to get regmap\n");

s/ret/PTR_ERR(p2d->regmap)/

>  
>  	ret = imx_scu_get_handle(&p2d->ipc_handle);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> -				      ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
>  
>  	p2d->dev = dev;
>  
> @@ -422,13 +414,9 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
>  	}
>  
>  	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
> -	if (IS_ERR(p2d->next_bridge)) {
> -		ret = PTR_ERR(p2d->next_bridge);
> -		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
> -				      ret);
> -		return ret;
> -	}
> +	if (IS_ERR(p2d->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
> +				     "failed to find next bridge\n");
>  
>  	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
>  	if (ret)

imx8qxp_pxl2dpi_parse_dt_companion() may return -EPROBE_DEFER too, so it needs
to be changed.

-- 
Regards,
Liu Ying
