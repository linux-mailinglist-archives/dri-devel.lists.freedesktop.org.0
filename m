Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6669D3C022
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 08:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCA610E562;
	Tue, 20 Jan 2026 07:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HDkj4vfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013047.outbound.protection.outlook.com
 [40.107.162.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832F310E56A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 07:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGP1DroFnd5vEoL7E8jRRqz3sESsme+KA+tjAEpFHObA1UKkS5diVK5vxViNVQBKyAgDL9y0bO+B2sGCtQ7dX57f7R7RpK/qu4rQs6TZ/05giYAt9bFHJffbWRSlE5RX33DBeTS3PKZALQrtYD6SefbS7E/sOVDGqloge0Ejec6ljz7MuBSxs1SybRKFiIhmzC/ImI4MU7RREomyUvf0l65tGNKPFs/0EPsPJyylryK7zjwYoQ6vCX5JWlSHcbuF+JOy/73upkD/8WcQLGXuP09L1GymHlJoNzVROc51A1FJgC3kKTPAw2xcH5LsIpnvA9CTibBXGywzY5GmtXNh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi51lcor39tAlIxEjB7lptBxOIgHmS6qQ6KsspS1FSg=;
 b=PFPOtOCnge7MUdHMLyarT/q4BNIh2rAcnVQVFwHihsnJ3HM/WJC+kva4xWWS7qApIbBJ/an6CKBFp/+ZnNAbdsNJy/1swJIeeLFV0dXzLIRpfZPhvwHZ2Q4caXpZbxLH2kMRqRMM3Y4O7noR4gN/7ppA+Jik4d1oO/qACOhB7t1xg6RHeanOP4KP1trGZ+axbgfwl+nnwR5DwGyPu3MR6pDicEBcru8lES5rhJmkESPCxn9D0/BvljNf0u5AW+TwZSDZwL5pEsamemTmgfnFaycRtxSAkE60g2+rf1EGFeWSKu0P6yKiJ7BIn6piqJSI9Jy9LaUK+mLzuCNYY3QqGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vi51lcor39tAlIxEjB7lptBxOIgHmS6qQ6KsspS1FSg=;
 b=HDkj4vfhBfhAiy5yYUjhFOA1mvsYGP/KcNx4AUvebbmTh8p8Si3dlzjsv9911Tvsk395gL77AVaWjtHbRG5wedGLOFgVVcVYfgxa0f42dD7YrYeJ8iuElNEgYy13es5yQaw9hzlqgc024sBTDmitm69Odyu772bD0hSic8B2NwWhAE0nZ860EM7LkMbqieB1Gz0DxpfD9XzjuDVZkrJUGtFutTghwj7rF7D5Qdp919d9CnMFCdNVrvAtFEhUyXvRZl9Nati1fvOoQcSghkoguNpRprzDLwdLTWwdXdN34M1iIBV4E2rIt8KCjRokbMaMa87Ah7PQ0rKqC6MTeSZIkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA2PR04MB10373.eurprd04.prod.outlook.com (2603:10a6:102:416::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 20 Jan
 2026 07:15:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 07:15:57 +0000
Message-ID: <ef68dcc9-6a3d-40e2-bcc4-3d3e3bb2a011@nxp.com>
Date: Tue, 20 Jan 2026 15:16:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/2] drm/bridge: fsl-ldb: Allow the termination
 resistor to be enabled
To: Fabio Estevam <festevam@gmail.com>
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20251218110626.605558-1-festevam@gmail.com>
 <20251218110626.605558-2-festevam@gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251218110626.605558-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA2PR04MB10373:EE_
X-MS-Office365-Filtering-Correlation-Id: d39d953b-106b-4336-030a-08de57f3c1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|19092799006|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTNkSFhuZlhzbTVSMWxFb1E3Y2I4aEhpbEZjWjQrZjVBUGpxZkFiYUpKTTU4?=
 =?utf-8?B?TTNvQ295TmdML2t5UThjQVAyaXVTQXdxUmF6OFlHREwzNFg1M1cvZFhQWFZU?=
 =?utf-8?B?RktyNk9rb0k0MVNPZGdMSWdRbW5RNmxCSmdwVXVMdFdjQzIrR2dkSmNyMmp4?=
 =?utf-8?B?a3JlV05tUHNDa3lUZXhLL2VJNGpMc09VbEhzTlA2bXMwcGNZN3hMRXpIUkx5?=
 =?utf-8?B?VEgxYlFyZ0R2dnp1aTY0Ym9mcGZRYVpWQTBkb3ZzZEZzbUx5YUxLUDd3RU5L?=
 =?utf-8?B?V1R0azR2L0tHL3NNUEpBUkUzdmxmKzkyeW9TUHQ3K01BY1M1UGI3RE1vWms3?=
 =?utf-8?B?UCtESjY4Nk9GUEpwUVdodE1CVDg4Wk9OZE9DUGdZc2ZrL01YZUtvdDk2aTNn?=
 =?utf-8?B?Z0UzRTJLZ2lqSE5OSmJSQ2IyN2pRZ2JTY0oxMFRqaEpJUGc1akxSNFFTOXRy?=
 =?utf-8?B?cHFxdk5ERXdGUmc3VTIyN3h4VlFGdkJYVEhMeE5vNkpoRkpkWnAyM1Zic293?=
 =?utf-8?B?b2JUWC9MU2ZCL2lvVDhoTFcwdHpvSU54dC92T1JsQUttRVJFNWdYUUlObzVv?=
 =?utf-8?B?cUhnYnNvNy8wRCsyZGU0NVJHNXJkZ2lxdHdmWUFYdUh1YTZBa1VjWVN5UHB6?=
 =?utf-8?B?bEE3dWJZRDgzNDlueDZ4R2k2SjBsbG51MXhwWTRYanRwNHFJTWcyODlhN0FL?=
 =?utf-8?B?c0k4VnpJS2VsNU9kbWF4RFFvNldNbkdiN0V1ZnpXc3BrcVByd3h2bU1nOXRS?=
 =?utf-8?B?bnNpYWpWTW1rN2R3Y2hkVTF3OGR1WkVzOWFmMUd0TlJkUmozdVlYaXh2cTl3?=
 =?utf-8?B?VEl2amluMFA5TjYyekpQME85RjRsL1MyNGRjblZQbTd4UCt4R25PZzNXUktD?=
 =?utf-8?B?V24xbEJVSmF4T1BsR0YyZWE3Y0lqeURmUi9ZcFBxNmtaN2dJSjJQZlc4dks5?=
 =?utf-8?B?a3VWVE1rb2RtQnFaQm0xcDZJRkdxK1FLUjlFSGNpT0R0c2xxZWZ3UitaS3ZG?=
 =?utf-8?B?cFl2YVNsQkNhNkQwRFl0VTNWd0tsMzVzaUpzek5mN3FiZFQ2bmpORklxazV4?=
 =?utf-8?B?L2lWSFZGRWh0ZEdqTHdJU1pzVHZhM0RhM3g4SEpVbjYydzlBTS9kaHREN0E1?=
 =?utf-8?B?MlVDa1Q3d1R5Wlp2OFVxK3I4TXpKYW9ZdzVySFVid3pDaXlIaVpJbExiNFJr?=
 =?utf-8?B?bTIvQ25DOXJteFNnekUwSnhsVUNVS3U3OUEvd3pGK25NVlFKOTZNcHJ0NEUz?=
 =?utf-8?B?bUpOMVErWnVheldxRmZOVFJIV1R2SGhVVzgxL3BkU3NaL1pxdytUY2RXSkdX?=
 =?utf-8?B?ZVlNTG1pYTB3RnBTYjUzREpWcEpYRmFCM1J0cEUrYlY5RkdUcEpSN0QyOTJt?=
 =?utf-8?B?WG1KZTRxMC82VnZ4aEt0bktrMzg3L1hyU0pFejhodHdUNEhBditaK2xobHU0?=
 =?utf-8?B?NXBReE85K0YrdW5aaDRiY3pvdk1zL1dHalZiQlAzYUFrMWhobFNoWW5PL3pI?=
 =?utf-8?B?ZWo1TWRLZ2UxdkxoZGNSeG5vclM1UUgwYU9wRnF5UmtmQXdhR2pobDJFQ0Vp?=
 =?utf-8?B?b2dvYlRnTTBnMG1iSEhtdDlveDZqVk5vVEpzVW1vNTRSN3IyNDAwbm82Unhn?=
 =?utf-8?B?anFuTjF6K3Z3OU1YOGpMRkhpekxsVTlPaWVoc1QzMUdnOGRyQ1p3aE5pN1g2?=
 =?utf-8?B?OEFzQkNIQW1RTU9SVEVhMHRnM042eURZanhKaXZqRVlqcncweDJRRjdXb2VD?=
 =?utf-8?B?NWIvQ3BYOEtLRGUwUUhsZ3Ntcys2dTByWUJNN3RtWFJ3MlZ6WFk2L0xYak9K?=
 =?utf-8?B?TXYyb2hncUI3L0FXcEU2a213bzc4WDNrTVhEcEZuZ2Z4NUJWOGF4T2ZrNGxa?=
 =?utf-8?B?dTJrSGY2TXVMWHN3cXk0QUFnaE9FM2swYlRNZ0pzTEtQY09hK2ZKNmJ6anJt?=
 =?utf-8?B?Z0hhaWw5MnFHU0tYZzB1WHZQcG4za1N0dVNOK1Z6OC81K0dHa1JDQnprUzR0?=
 =?utf-8?B?aHJrVzRwanR4OHQyekpZMzhMRDhWZ2hnSGk4RFZaVHc0YUQ0VFJ0bDY2d0JP?=
 =?utf-8?B?REdGbExWN2xKa1hIUkRTSWhUQ2VzM2txeEM0VXA1YzJacklwa0pKOGRWdzZL?=
 =?utf-8?Q?p1s0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGtURWQ2dWwySEd4K1pOY3hQcTZaWUx2LzVvTng1SkxzOGZwaEFWemozSVky?=
 =?utf-8?B?Sm13bEx1TVR6b2w0L1ZGYnc1THhoLzJlb3BEWjFablMvZEYzMUhTNVpaTERz?=
 =?utf-8?B?SXI1VWl1M2JXdDEvTWRYY0FuakVIQVJodGkyR1RTRWQ0UEFKWFdlN3BudFhu?=
 =?utf-8?B?bUhkZ3Q3dzNxWVhXR2hQYUlMTm5GOHZMdFY5NXFweStZUUtkSzhMVkFiN0tN?=
 =?utf-8?B?anB3eWlYczlKU3hRVEZXenNhVFJ2R2pQVjlsWnkxVkhHMUlVdEVLcnYyTzdK?=
 =?utf-8?B?UGdCbVhUQXorNTJuaTJiUytBcTlPVWJNTlo2T21lRlk1NHhsTTFsVnd4N1Yw?=
 =?utf-8?B?cWkybVg5ZlVwL21pdzFjUHhpaldwUFNrRGFZSnhKRUhoSWI4Q1VlQStDbmoy?=
 =?utf-8?B?Nk9uS3RCbDBHNTR1VlJaWFQxWEpUbzFiNFB5TUpGM0h5VFBad1NHYVp0R0pS?=
 =?utf-8?B?Qy8yc05JV3F2WlNjL2hQY1NtdzBHYitkeUVTaHRIY2V0OG9DM1JJSUczME10?=
 =?utf-8?B?YVlkQU1TQ1RqWXd4cWRlYWJXYXo0NmpkUFIvWXVWZllYV3d4SDB5bUJOdGln?=
 =?utf-8?B?eVd0SFZWY0tZdnZaczZoeldKTEtQYUZxd1dSbDRQbGEvUk9PZnRXM1ZJNklq?=
 =?utf-8?B?RFo5NHkwMVduMnoxa1p6ZC82RWNCYkZYSWlyUmJYenpXdkFFUnpNNmFjTFAx?=
 =?utf-8?B?ajZaNVNmbDZBb1NGMkZlc3JJMzRlaUV3M3FYdmJNY1o3Kzc0N3pqU3VkSkw0?=
 =?utf-8?B?VHFDaG5tMTVHb2Zrckx1OE1QWmJoWHM3N2d2UWx0Qkk0Y283V3dLUzFMYkVs?=
 =?utf-8?B?MmY1anNwUWg5SzdzcjZUUnJsdkk0eXRIQzN6OXp6MUw5RUlUakxyTml5REM0?=
 =?utf-8?B?STNVblJmUUo0bHF2YVpmZFg5UnJoZkF6NW9aMnFXekJGOGNYc3Q0NFlGK3U3?=
 =?utf-8?B?MDk1Q09KN0pOTTFKd3BQTTc5TlBvVlhjWmtlb3FqUzUyRlhOWjZ4M3V3bFJW?=
 =?utf-8?B?QmFaNjh0ZzB1eXowdHFkNkEzeW9pV2tWZm5GczN5VU04OEx6bEphSjBrWFVa?=
 =?utf-8?B?STRmZ1hoV3dFeHlKNmpzdncxTkxFUnpIeVJkMUR0SzNsOVJEcW5aKzhRQkFQ?=
 =?utf-8?B?cXl2NUhIa05zWlFWaVA0RVBUcUdwY1BLSWt5UTNRWkJtSzJLa0swYnFOaERw?=
 =?utf-8?B?cWdYMDd4aTRlTDFPM3lrblFOOTBlZEk3aFJvRGpUVlNuVzlraHpTN0krcFpm?=
 =?utf-8?B?SGNBV283TEJEb054cTlWN3NaWVVaeVFWMVFzdDB2Umd2ZVlZREZMcng4WlJR?=
 =?utf-8?B?OURXWGJieURrMXNmTkV5a2NpdFI1ZEI5SndnTkVVT0NOSXFJOUI2VXJITWlq?=
 =?utf-8?B?UXBZVTBJLzI5Ly93djVYNnpzTVFNL2lnM0RXMHg4M0hYMDAxL3dCMVZqQTRO?=
 =?utf-8?B?eTlBZ0dKcEJBcGNsbkc2WnNkRHlUUHd6bjNiRzBYQm0vcXBYZ0puQ2FjaHB0?=
 =?utf-8?B?dVlQbEc5Y0VYYzJJK1pBS3I2YkFlTWlRUjgyZFdxbFRhYkI1am5qalpOWndG?=
 =?utf-8?B?R0VUSm9lRVI5YVpmaG04ZnFZRGNCdE9DUEVINmJORXFyZjA2dnVhVVNhbUFC?=
 =?utf-8?B?a2ZNcDQrTE1NSFo5ZzJvUCtDMUNEd29nd2JSNkc0WWxxVDNFcmZDS2NYU3Z1?=
 =?utf-8?B?U3JaR2MwRE9LY2xrQkdvY2NEdk1uYS8yeTMwQnYxRzVSVjFOUmcxdzhPOGFU?=
 =?utf-8?B?aHo2aUttbUtHUm1pdkdRaVNMc05hMkY0Qzh5UThGRFFxdlA3NzY1TklHdnE5?=
 =?utf-8?B?QzI4MFoxcWpNRmZ3eEt0TU9xVHUvNUx0OGRRNW9ValBTVEM2Z0xzVFhiYmsx?=
 =?utf-8?B?WXBMdXF6UWN2N2s4QVV3WG8xZ2Q2UDByNGUyaGUyaWY3Zm9YbXV1aTBBRGc5?=
 =?utf-8?B?b2RJNFR5ZHNvcWt4TVdrYm5MajA0NlM4M0xzQzhqVERMNHAyOWluNWp5RnhI?=
 =?utf-8?B?OEcwY1F5RFBDRXZ5ajdObmd5MmR2dGVQeC9RNTRZSW1hSkpSUys4MnhFcm1G?=
 =?utf-8?B?ZlduNUVEVVV4VEg0dGVMZWUyVEY3SlVRbTUvUlpMcWtHUjJNdHlWSTlsRGln?=
 =?utf-8?B?T0k2WHlvZkIrY2hiZEFqRmlGeVp2WS9aek9BTTlqQlJRelJTN21HRnYrTHFD?=
 =?utf-8?B?THVaYmF6U3BmcnpMUi9pZUhEWmVvNFl2UEQzMGRyRmZPREU5amk1N3hDQmY4?=
 =?utf-8?B?aTc4elBXbWMzMklXZEdsSFZoRjFTcHFRU0RrdmJVWFdVV3M5VzJXSGJjMnJn?=
 =?utf-8?B?TzE2V1ZTZ05uUlZKMXlpL2dSV1dmVCtHR0xwVWQ3dkk0NTBaTERaZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39d953b-106b-4336-030a-08de57f3c1b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 07:15:57.5741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7mjyAk7VSHClboSQ+31VfnWRSF6TMFOF5yx/i1azOINn8M19lH14gbTq8XMrGmljzDtt2fRet5f/rbawzS1Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10373
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

Hi Fabio,

On Thu, Dec 18, 2025 at 08:06:26AM -0300, Fabio Estevam wrote:
> The LVDS Control Register (LVDS_CTRL) register has an HS_EN bit that allows
> the 100 Ohm termination resistor in the chip to be enabled.
> 
> Add support to setting the HS_EN bit when the optional property
> "nxp,enable-termination-resistor" is present.
> 
> The motivation for introducing this property was a custom i.MX8MP board
> that was showing visual artifacts. After enabling the 100 Ohm termination
> resistor the LVDS signal quality improved causing the artifacts to
> disappear.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Change the property name to nxp,enable-termination-resistor (Frank).
> 
>  drivers/gpu/drm/bridge/fsl-ldb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bc..b4b9130de32c 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -92,6 +92,7 @@ struct fsl_ldb {
>  	const struct fsl_ldb_devdata *devdata;
>  	bool ch0_enabled;
>  	bool ch1_enabled;
> +	bool termination_resistor;

Nit: To make this flag a bit more readable, I think it'd be better to
rename it to something like termination_resistor_en or use_termination_resistor.

>  };
>  
>  static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
> @@ -212,6 +213,10 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	/* Program LVDS_CTRL */
>  	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
>  	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> +
> +	reg &= ~LVDS_CTRL_HS_EN;

This is redundant since reg is set without the LVDS_CTRL_HS_EN bit just
beforehand.

> +	if (fsl_ldb->termination_resistor)
> +		reg |= LVDS_CTRL_HS_EN;
>  	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
>  
>  	/* Wait for VBG to stabilize. */
> @@ -292,6 +297,7 @@ static const struct drm_bridge_funcs funcs = {
>  static int fsl_ldb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;

'dev->of_node' is already directly used by function calls in fsl_ldb_probe(),
so I'd suggest to keep using it, instead of introducing 'np'.

>  	struct device_node *panel_node;
>  	struct device_node *remote1, *remote2;
>  	struct drm_panel *panel;
> @@ -340,6 +346,9 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	if (IS_ERR(panel))
>  		return PTR_ERR(panel);
>  
> +	if (of_property_present(np, "nxp,enable-termination-resistor"))
> +		fsl_ldb->termination_resistor = true;
> +
>  	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>  	if (IS_ERR(fsl_ldb->panel_bridge))
>  		return PTR_ERR(fsl_ldb->panel_bridge);

-- 
Regards,
Liu Ying
