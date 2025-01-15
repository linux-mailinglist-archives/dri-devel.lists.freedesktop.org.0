Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0EA11806
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 04:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDFB10E4A6;
	Wed, 15 Jan 2025 03:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kaVjZ7xC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15D410E4A6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 03:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+TzJ7zXCV9dYtZmZmL8kwb/7PceTUPX3pHPNhsQTKn2Q3jPHk/Gwhfoq738o8nNQ5KJvhfZgYYdUNdjlBdckJ6LIrgiG4F02i6Te3p+ikL4V5GZy/07Z2l9Yb5sv0ipBKfAthe0z6QBbVqII1/ywQi+obF5jTkpD3PB8RHdCpPDwhKiTXclwlzX0seerVRMlvr5QzN5yI4HLHVfV6Kz1rudVRV77NXZyeGEW4ESed2Pk2nz+ED/AKrmI07wxyw9RQKKoITdMY9GQNdKxe0qT9AwMrvuD77CypIp43Ccm14K5bv622ingRTSwVB7KPZMZ7PfhyNgEqhacgJFSk41Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Siun1V2JAmEP2N908YtrCYeZ2xE9czbh0WIGbqWZVFg=;
 b=uwdGhyQRpqAHLG8QrXJx1DHMbVOCjhoLD7kkfpZbvsHPd5r7ROmHS1Hyc/v6u80cT0ge+D2EkTrYUcQmrngs8ORw45PcdIkPtlc1arWcN3p12o9vnkiZ0BAO3MWyrmfbJ4MlmJV5LU9m2vgVj4WHKZoCYn+VmB0+dL/6c2WrIB0+FruwdRroL76b/ez3hO/ueihGOrcHvD/e6XyNfJ969mJ14IBcRVZefRDhtrR5yfn+JA/Vfdt6OB3lpX0CUt01iH6gZ+VvQt4FvkSAogUxvtusmJuAuYto9SiSgCjkTfqrq5JRhpEJYgCZgamW2+UIh7WaL8JKkaCIPssoMp/rBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Siun1V2JAmEP2N908YtrCYeZ2xE9czbh0WIGbqWZVFg=;
 b=kaVjZ7xCTBcWPGGgaTLsh+F8axxQU6pd7T3WX8nmnOWA14UDFf+T0KwUoQcpXU+j+h1/oiTpRyShXb6EwYdKlYpZPQSdccEG0SUiMGeYMi7xYnZTBBnX+mlxGDHLUeIocQCFGvQV1edSAbhijN0m90GLiEyV2MvpEokR6CWdUZoO3+gajs4CZ9uu6GdllwJBmn04A7nmsIrZUaMsnQKQpywwXm7yZ9NI0oVx4FCzck6DD8ms7R4sQYzyfxif0Wt2dQ6x+FriTsktvW+t+NpUlkUkHCBBfFsBMNG5Atp3LazzmG8q9RzVxtQDVSHtspaN0g4hlR78vc2rCvqYWaeBYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7680.eurprd04.prod.outlook.com (2603:10a6:102:f3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 03:46:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 03:46:40 +0000
Message-ID: <6c572aa0-54a5-41d3-9442-576208cc167f@nxp.com>
Date: Wed, 15 Jan 2025 11:47:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/bridge: ite-it6263: Prevent error pointer
 dereference in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <804a758b-f2e7-4116-b72d-29bc8905beed@stanley.mountain>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <804a758b-f2e7-4116-b72d-29bc8905beed@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 486ec38b-632e-4f88-85a9-08dd35173879
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L09oL09nUFcyTFYrNUVuQkt0RTJZWXE1K2hBcVZ5N3VLUVFlOFF4NmU4dStQ?=
 =?utf-8?B?bFFGdnRieCt4d1lNU0RpSWxmY1ZaZHBkUllCcFNLaUl5T3lWWUNVNkRuQ2hW?=
 =?utf-8?B?TWQyUU93QVZLbDRyek5paFhIVm1NanYzMFZ3aGlNOFlsd3ZuQjhoMTduV00z?=
 =?utf-8?B?dEQ4QWZkTTFyMTRROEVLLzZ3TkRxQnNXNDh4UEQ3NDhwZEJ0NWtnZ2hnL0M4?=
 =?utf-8?B?YmhTK2RXajNlb2NQTEhyK05WdW5maWU3dzV5eFlPbVJJcUxOU0RlczBDZlh3?=
 =?utf-8?B?eFEzckNMVHp2VnllWkM0dWp3YzZHNTNpblRZQUNXMGpqam9OK3paWlI0Z3FJ?=
 =?utf-8?B?KzBiTTlESmorenZxN0Y5MGNzTUZCVG9mTzd4bGRnQVRmeEIzaWorTkFSbVBY?=
 =?utf-8?B?cWNrSzNudVZlWFBVQVRDNE5jZEQwVXl0Wmx6dkI1UnVHWUg0eTlqOUk5UEtl?=
 =?utf-8?B?aXZ0YWg4VFhJMVNKOFppVGVKM2pid2tHTzVVUmJlQ1dxUndDTmpBcGh2VVov?=
 =?utf-8?B?LzFuSTFVcHJPWU5MVHJFQ0NoaHU1RmRHYW5OaHBIL2VxdWpPY1lYQlo2Mm1C?=
 =?utf-8?B?bEJNbzYyUTByWGpZUVM4WUo5eERoWXErUXBaTGNiNFhtVmpCQ0RuU25kcWto?=
 =?utf-8?B?dUNsd2dpSDBPV0xyN0xjQ0ZWVWtmeDN4bjVJTkloTHo5V1pCQk4xY3plWW1r?=
 =?utf-8?B?Rm9DdWx5RTBuU2VCRHRwOTdkOWxJUzhucFUwVXdwbGpUamxMQTZjMVZqaUpM?=
 =?utf-8?B?T05SMDJzNFRDSm8yeFJ1Q2lkTSt1VEIyRnpzeUdab2FESlFJM3pqQUlDVDdJ?=
 =?utf-8?B?VWk3VTA3ZGlUNkJHczdJSkxwbm5nQkdlbGhWUENldzBsdUx4cGZSOVU1dElM?=
 =?utf-8?B?RnBZcDdPRFFwR0dkbTY3enFTc0crMFI3YkppYlJQS0JSU2Y2bDRYWmlTWGY1?=
 =?utf-8?B?clhYaU9TS2M0TGs2MjBNUGkyTzVnelB2SjMyc0Q0NDFGdGp4cEJFVGRiWnVq?=
 =?utf-8?B?OWdOVWpSMW9IZDVsZW1XM0lpVmczWTYvbEZlQ1JhdGRUb3RCQW9nZUxGczlk?=
 =?utf-8?B?OFBRYXF1ZVd5bHFid3B2anpDdG5BdXU2QmY0c28yT1dXNWl0Y0NmanMxRGo2?=
 =?utf-8?B?dkp4Q0pYbW5MZ2Z5eCtISllXR3RaR1RsNWozTk91UUc3aXFNR050SUlaS2xw?=
 =?utf-8?B?UGprMGJ1U1Z1dm8vZGtNYmk2RVpzSHZlcUV3K2JEU1FhWGNVdno1SFhSWFdk?=
 =?utf-8?B?MlBaVkEyb1hMVWxlbkVSVW44YVZQMElPRjdMZXVUaVZHcVNxWVA2YnA1cU5B?=
 =?utf-8?B?ZjRvTkN6eUptWVk5RjJHQW1XMU93aEVhZHlucjh4Zjg3MXpsN0lWTUt4RGpx?=
 =?utf-8?B?MHNuV3Z1bnpZWjE3d2lTRktJcnJKTmZ1d0VnL3I0ZnBRMlR2cG0yVlJVTnd4?=
 =?utf-8?B?Nmp5WWJaTllqRUVtcmhCQk5LRkQ2NmU4eC9ZckN1UWIyWkJwZDZLcUFtZ0pK?=
 =?utf-8?B?WnlJM2tRQ0xtbWxiTml2S0l0SG44R01KZjRHZ3A5RVJDbkRJakJzTTZCNHdz?=
 =?utf-8?B?azIwSVNKSFVsUmFmUzNvT3Vsb0pSbm1MRlVoR0NEMVNMejRKYTlMM0F2M1pU?=
 =?utf-8?B?VW5YSHZiWXJRbUptNkFRSXFGc09sNk45QWNCY0ZHMjJHc1VmZTlGWEdIL1Nl?=
 =?utf-8?B?bzJ2b2tsd3FzTkx4TGFKUGVhNGYzL0dEc2lRZk0vR0tQTWtLckdWc0pPYnk2?=
 =?utf-8?B?ZUpFRnh1UnJybGNLVmkwM0hOY2dSbW9ibC8vY3VlbGpseUI4V3dYNzVkNjg3?=
 =?utf-8?B?RmpjZTkvVWJ6cHY4SnFabDdwU01TUHdJd1o4ZnBzV1ZxNjFyc3FZTlJMME1N?=
 =?utf-8?Q?1lyv4ggqe+I0f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXFmMWJHeGh5bjdTZEtVdmk1YUFoUHBIZ0RjQi81UEczNkNWcnZ0eDlRT2Uz?=
 =?utf-8?B?VHRZWWhaZGlXbDl6L1VlT0RkSWtFSmVXQzhMd3RyOGhDeGJtelA1Nktvczlq?=
 =?utf-8?B?a2daNzMzWkhiN0wrSzV3NkE2YW9aMmtEdTMzQWUrQ1YrN1Z0c1N3Q1lqWHh2?=
 =?utf-8?B?Ukpob001Wnd6U05sU0pNbmxHMS9aV1dIY1NzT3FrRVovZXBVamxQYlZsSkZR?=
 =?utf-8?B?OTk4Q284ZWJZc2FYZjBFNkJoZzVaSmwxSCt1Mm1PZGZ6TDNwTFNLVHlNNk82?=
 =?utf-8?B?U05CNFZuQkdGSXZKUVFWczhjK0poS3BNSDFnendyY0ZmMURUTzVzd2xmdXFZ?=
 =?utf-8?B?ekp4MEZiZVFFZDFSeGRwczBuUlpWcEJNQlF1TkVDempyOStxQU9rREtURWpU?=
 =?utf-8?B?WDgwWmNsMUpEV242WXp2K3ZIYS8zSlY0R0xvVXA4STdyNFpzRHZPdjdGWGw0?=
 =?utf-8?B?d2JFTmt1cHkwNkVaczRUOHZkU0I5QXFTUENsUlplRFgvd1JsRFhqMTdnbjcw?=
 =?utf-8?B?Ymp4anBvaFRGbEJUT0t2T3dCcXU5T2xHN0tmNnVjUVA5STlPT1hPOHJ6RU9r?=
 =?utf-8?B?QXJLTG5OZnVESmNWMk5RTUV4aEI0YTRadFVGdmp6RS9BWFlxaWxjY3dDWEM1?=
 =?utf-8?B?dlBMZTFaejU4b2t4SXhKNEh0NXNUanJHUy83YWUycHZYZDZjdG9MU20rbjMz?=
 =?utf-8?B?R2o4RkhTREZtazE4UGVFRnpzR3ZtdXhKc3d4UVg0a3dtajlJWEg1Sk0zY3hF?=
 =?utf-8?B?SitMTUo2NWFta0dJd0p3UWZpbnJ5c3Boc2dJWHQwelBJLzFrSmFIQTYxcTRV?=
 =?utf-8?B?eElhL1c4MnIxUzI3WTJpWmZJV3k5WXdHZWVZdzkwRmYxWktMUHRVR08wZEJU?=
 =?utf-8?B?cGpwSVU1YS9vTGp3M01ZV0pnR3BwMmluOTUrV1hXY3BQWE5GUTJNNzVlZEN1?=
 =?utf-8?B?TWZQeUdpN0FNV1ZuelB6OExSbElPUHlML0RlQkdNak83ZG1Od25MTWYvalEy?=
 =?utf-8?B?dlZmZUs0SHFRTDd5aXp0Vm5wSGMxZnVjdEN5MHQxL3pwTUxCR1g3M2hxK3ox?=
 =?utf-8?B?VlY0aFo1WGw0NXFNMXBRZ0FJeVNsMnI0aVUvNTV2alFrVndEWEw5cFkvbVZJ?=
 =?utf-8?B?N3FRTFpEeGJMLzJSbWhGQkZKNDhzb3RrUGZLQVp0QmF6bnAvZFdaajdaaUV0?=
 =?utf-8?B?VVBCbEkzYlNFZlJjZjUxYk11bmpweVdDUzZJM1hDUGh0ekZacnoxbm1EL2xm?=
 =?utf-8?B?YVlxNVVRVHBHZjMySjF2UjN0SklnbjdwK1BLOG8rR3hHRzZlZ0swRXNBS3kx?=
 =?utf-8?B?bkxSenBxc3VDdHdVVldFV0tNY2hSZE1CTWJzdGtwZGNDemN0ZWYweGVNdkhT?=
 =?utf-8?B?elJyMGpkZU9YQzEvemM3L0xPdzZjTEVFcVJIelpxcXNsL1c1N2JZKzYvT2VN?=
 =?utf-8?B?WThKdnJ2d25nTWQ3VU9WYTFnNVZ6V3Q5WUY4RnBJVllaRG1RbkU5anc0TUx0?=
 =?utf-8?B?eTBBaStEZmJCSkIrSmFocUlkUldJYVBzQWN2MTMySDAvKzFMbGhHNFNQVlFI?=
 =?utf-8?B?MmFzRzZZNFIvTmV3VzY2cG9nUDNTaDN4RW0ySzBGNVJ4TWsvRU05QXo4SEVh?=
 =?utf-8?B?Y0xSZkJnbm9sOG1BdVI3bHJJaHBKTVlPTUlHRXM0MXFGVHpqUWROYTdpTXBH?=
 =?utf-8?B?N3lOeC8xQW9yWlJLL3pVcVppM1BMNnVidzZtdW1sWXl5L3NobFhkYTFDL01j?=
 =?utf-8?B?aHpTUXVIYlM2TmdScWZ3TGtMZk9ZSEt4S3VNTnNkdGZpN04yL056aW1kSUJH?=
 =?utf-8?B?TGdUVU9qVEcxSGZwcDlqUHBiT2xVNFozWEdET1ArT2dyM1pJZnkweCszR1FC?=
 =?utf-8?B?bHplOXViVHdYZVhabVBUQmdnakdxM0ttN3ZET0t6ZnhBZ0xoMG15T2tVWUJU?=
 =?utf-8?B?cml0RXVuMHo4QXBzTUNRQ3JNVElHTHJEbitqSFZkTGg5dURqSGYxNkFiOFdL?=
 =?utf-8?B?WWdwVXJMQ3JIZmFNa3RsZVJ3dXYwWjNwZUxLWFBwd25pMlVIZXZwYnVGdGZK?=
 =?utf-8?B?L29mMlRXdHRCOVlRMXl0ck44NnZMT1lGeExhMjN1MDhFcGw3NkdiU2p5VXNZ?=
 =?utf-8?Q?nheTTnBx6IAoTFPVVmQkTzUjg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486ec38b-632e-4f88-85a9-08dd35173879
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 03:46:40.8193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To89kb4QOtJnvaeuKmp3rNDE+f+s40gTrSpc1ZJor8YFrph69AHsVEGAK9JkhICEl0PjbS+c1Nj9+O43hCE3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7680
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

On 11/12/2024, Dan Carpenter wrote:
> If devm_i2c_new_dummy_device() fails then we were supposed to return an
> error code, but instead the function continues and will crash on the next
> line.  Add the missing return statement.
> 
> Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to misc/kernel.git (drm-misc-fixes).
Thanks!

-- 
Regards,
Liu Ying
