Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621A8AC3E7D
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1581010E35A;
	Mon, 26 May 2025 11:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rNG6wGfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6015110E32E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 11:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqNjnbddE6pso6mKM9/nWtFs52PE8X/jBV++H9aoBpwC6nE3iSkdexJTp/8mSkHX97/MzC9EgZ6QaIKg8RVGPnm9sUVlllnWuSji6ZEdCRGQKpFMmaCwazQirQwfIJ3ZhLQC3wOLm4jbpLKoNQYaHKHvMYOFrkmbnMWfAifG3u2i9dzwlrqG+r8B2+mhKll5BFjDFr/GUdrRveif9J8bKZZSWpWHTBHVOSXxBw76qvx6p+jCDw7ARQ2s+qgnr7AmqCa4vUFVrM/BQ8nd7IKx8pBz5qAKYD7BrSFAD9oKvx7xuOb2eWa0LqKyRmuC4OoQTqIlvC0nOZuMSW7S6PTpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqOAqhGUmoNAe+okRcy/0wttFwyQPyEp39ANaFRCedU=;
 b=xSJsWWEhJsQB/FC3alfQKaQUy94stRm5JbIo1dowM1X2yyhJHQxQpxhve1Fs7Zf8jbkH2nVjpXpr8ORbDe9Rd4iUmlPGYEnNLdvVJV38sRcLm6jU3vvxEM5O7M8rRcPPDeGelEBfr0BtjgDzfnBHE1vcgoWXycn9hP/EvxOEem4p6cjmhcVIWdxPWDsMvnhJyk27Z3YFn20jfnF0KUe0e1eF+DmMwbHBIEnmoVdwgN0SiSMr67duu/JNwc5RISTTthkzo1uSjFtQ97PoEvrkF3E4G10SUupifBTwzhtn1VHZNDnGyEuq4AFApJmIbYo4pI/U3K6z1B4uxURjJQeZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqOAqhGUmoNAe+okRcy/0wttFwyQPyEp39ANaFRCedU=;
 b=rNG6wGfWHbYKn3aGwhEQB/mlF5QrdvjPR37YfaqjeGX8lAdD3wmmyzytWOJ+k5WX9210MCVNkyu9PeO0zp9vvm3u29rbTVFW1XkM+CJQX9oKYPegly8xQaVlLzhA72zCW2lImqz9jb5x9EyzRFrmM2yIOMupKaw1cE+2GFqsFU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB10020.jpnprd01.prod.outlook.com (2603:1096:400:1e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 11:19:35 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 11:19:34 +0000
Message-ID: <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
Date: Mon, 26 May 2025 13:19:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, tomm.merciai@gmail.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250526104902.GB17743@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB10020:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e7e262-2477-45cf-3c64-08dd9c47318b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?My9HZVpEMTFtZjhFYlc5NjlsQ2c5MTVQc202UE9MNnAzRWpQU2ErSTd0Qk04?=
 =?utf-8?B?cnoyMExJb2ROSHIzTUhZUkluY2VqaDVmSEhib0tBRjhOQUsxODJNejFuY3FK?=
 =?utf-8?B?RW84U2NKK00rM3Z6NFE1OVY0a0R5ZzlZdzROUVBYeU9jYXhPdWQybEVnODAv?=
 =?utf-8?B?TGxQbjFuYmlsK1p3QXF3WkhYQ2JVdExzNTNVdjhsTFFtdVhZUzNTbUNucXV1?=
 =?utf-8?B?c0EvaS9nZHFiTjBIaktCdG1FV2NOY3pPblBYbDZUKzNYWFZNVUl5TVBVV3Ra?=
 =?utf-8?B?N29URVZrZm4rNGozTHJkeGEzWDluazk4Vk5uT01TVW9WVWQ1Y3huYmpnU255?=
 =?utf-8?B?T2lEWjBwanIwY1hleU56RzdOY0svQURjSXV2R1Z0M1E3ODRVZjY3NGdCdU96?=
 =?utf-8?B?ZWZmVCtwUndSa3ZUbHg1YnlSNTAyT0dxQlA3VjBXcnF6S2hlTXk3T1dKYjRV?=
 =?utf-8?B?S2FpR0pFOHpPdFJnb0NkdWIxbHNxNmgwb1R3dVlzbnp3WGN6dkYveWlrUExt?=
 =?utf-8?B?bThwczFESFdEdGVNWkpmVHl4dy9KZ0RKejQ4bVpVWVFPcXRXU215UXRLallV?=
 =?utf-8?B?dlR3bUdMVzhRT3pDc1pjKzh0WEswUW52SVRmVm5udmRKQm9IQXNabjJOc28w?=
 =?utf-8?B?eDJiMTR1WVR4L21ET3pZN3lQOHBOblNTR29Tb3hFOWY0cFJXb2Q5NDJPQytx?=
 =?utf-8?B?Qkp1U0hJY0JGd3RlUkx1RWZWNWQ1aDMvUlcyN0lTSU1JbVY5RjRLRnpXYWoy?=
 =?utf-8?B?cVlvQkNaR1NXVUpQYkxFRzhaVVltTGttcFhsS3RzK2JhZnNhVUE3N2RFNnVH?=
 =?utf-8?B?aXUwZXJpeTliMUtrQVR3SmxWUnFpZUhjdGVHSkwzNHlEUW96Z3QwdWdRQmNr?=
 =?utf-8?B?MU5PenViSFdtQ3V6dlE0WVpwV1J0S2VWendKYkVFVWNLU3h1ZWEyWmxSdHBo?=
 =?utf-8?B?eGJON2luME1OVlJZM2RiQzUySU92TkFCS2VpUUNDTlMyV0hXM3I4NENUM1I0?=
 =?utf-8?B?YWNZS1djN05seUg3NGsxZ2ZVeGxHMmNxQndVeGVKUFBlSUlodlVqaklYd0xL?=
 =?utf-8?B?blpEcWZ3M0dzQmdpY3h4Tmowa2JRYVd3b09zRTh6anBIUTQybEluQXdXYkZP?=
 =?utf-8?B?TmhBNDR3OW5sNFJuQzVGYUhRelZzRkdMRmpmSmhYWC9oVGFoWENUbkpJUTNV?=
 =?utf-8?B?NTNYUzg1TmVWaDR6L2xueFFSSkJPanhBakhUcTF3a3VDOVZqMjJ3YjF3dkpJ?=
 =?utf-8?B?bTd3T1AxZWh6c0Uxb043UGVOdUFGUVNveGFnRUdnbDIxdUJDcThsNVlnbHpX?=
 =?utf-8?B?cUNhaUVrUzdmeXFwTXZrZkFlTTRxMk1DWThJcktBc2ZqMkNjeGUyMldzT3h0?=
 =?utf-8?B?Y0RDNzg1aXpIazNQVlQvQnI2VkhwZWE2Z3MraFFzTmpZbkZLRkMzcEdib2Mr?=
 =?utf-8?B?Y0tGR3lZcHNKanVUSXhXaURhVENaN1kxcHFSZE9IMG11cDkvWEpvd25hbWJK?=
 =?utf-8?B?RkdOOGFrdkRNYlRYQjJTckVibnVKTWw4SElmUWJjK0xFWnNpdWhvTEo0SWh5?=
 =?utf-8?B?d0hYSGtsYVUxVVZKdlBaM0IwTlRQR3JidVRicnZ3eHQvS0pzem9VUTRsQ0NF?=
 =?utf-8?B?UDdTakVvRlI0eENuRFZBVGg1ekVrUFZXUWJxeHB5VFJOZlJKQ1J0bFQ3eWVz?=
 =?utf-8?B?NXBvY3d1bjFOY29yMXR6TmxwVlF3TFRZbytLbktERmk3eWtmRHpwSXJyQXZl?=
 =?utf-8?B?cjgyZ3FwcUI2ejRJb0FVRHBjN3lPWDNGYm5ZdGJGaXBiQ1g5d0JkZlJlNlRn?=
 =?utf-8?B?OW5MUXFCc3RubXJ0eHQ2dTlYdmZ6eVVFWmZzMlYzNzZuSzRwdXA2YUl5cDlI?=
 =?utf-8?B?VEJ1R1E0THFLQkpBMFUvR3FBcFArNUZyaDIrcFhONnJXM3d3aTZlZklNSk5s?=
 =?utf-8?Q?ycG2FRErVPE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tnd0UHZUek9HVmtKeDRrNmIvR045aGJ5bWJzaG1ib3crNlFDN3o5em1tUitn?=
 =?utf-8?B?RFIwbWNFLzhLOStCbDdwUW8zQ3BnVVVqdnBIa0dpMG95MTZaV3Y5Z0ZFMlEz?=
 =?utf-8?B?ZUVjY3NWTUtWTUpWa2xBUXJXRFdhb3RXbEtITW5wNC8xNzVPWGRsRHB4R0Vu?=
 =?utf-8?B?bTF0clNuZFZ3QjVsVEllUjFrSHlHLy9ub1pEZ3BqS1h0RkRnaUdZN0E4RlBt?=
 =?utf-8?B?V1ZSNElNcENnRjByQ1pCWFd0Rk1Fb3BqT050c2ZWYnd1aDFhWDIydkhtQlJR?=
 =?utf-8?B?S1cyRmlJV0FwWnBRRmlzc2pBbU1OSFB4Z01hTTBrVThwWURkcjI5MWJkcktG?=
 =?utf-8?B?aU5teEwwcWc4d2gwVldSYm5CUVdGR2o3K2l6VGVySmpOVk0zQW5scTAvbVFm?=
 =?utf-8?B?RmRoNzlVU2lBYzlPL2w0TEh6YU5yUTR5K2pNeXViR2VadzliclNuSE5QVzNE?=
 =?utf-8?B?VFNraWxxZTZkS3JWYndrcTJoMnRYOExoMi93U2tqVWJUdnQ0dWJYYTV4WTU5?=
 =?utf-8?B?OGttTE5RZzdKOVV6eGF1TllNdWVrdnlPVXN1MGt3TWRkOUkzTzhaZ3BwSWE4?=
 =?utf-8?B?VnlRdVdqMEdneERKenAybWRmUmllSkF3R1J2aWVkU1E0OG9FamJDSmtQbEpK?=
 =?utf-8?B?QnlTbGt1ejJycUp4RXhsY254c3BzUXRjVHQ1ZkFja3hxZlAybVlWbUdDdS80?=
 =?utf-8?B?Ym1NcEVhZ1lsL29HL1c1eHJLM3Jxc3V5Umg1TllxOTBwWDd4ZmpVbEVDb0F0?=
 =?utf-8?B?QmZGN1djYzZyU0NPTUVSSDdyZmFrdkM3TVNIRFlES2trMnlJdWhJV1hROU5q?=
 =?utf-8?B?cU5iR29oRVBzN3A3QUxab2ZDaHp4NWZUSVRDaUtnN2pLY2s3T2VUcTlFZi9t?=
 =?utf-8?B?SjlzeEwxeVJVb01KZkk0R29nTmRKMlJISDFRa1E3S09XV1BRRDdmS2JXRTVO?=
 =?utf-8?B?Vk5KTTB2MjdZQ2tnOHVuQTkvZ2hvNldIaTc2bTRqdVdMQ0w5K1ova3p4V1Rx?=
 =?utf-8?B?UU5XaEx3aFZJQkcvdVdPenpLbXVqTDA4cFFlaFR1M2EvY1ZmNStpQXAxY2I1?=
 =?utf-8?B?Y3JEQkJkbzRRL04wNk5jejYrT0t3c1paMXp4UXBaWmVZTDdRcHc4YlNGZGht?=
 =?utf-8?B?a2dmMXJWT1hBU0c1M3ZhaDVmakRVNWxIWGNHWkhnaXl5V0JMUWtvSDJER0FV?=
 =?utf-8?B?KzFnckk2dWVGNTBJNUx4NC9iSEhjM3ZLdy9TR3VmcTlEQlU0VzRadno3S0FK?=
 =?utf-8?B?cUIwYjhmcFpTbFhpMURYNDdKcTdiNjNONXdmcW1jL0FkTlZ0NkxSamd3aVYv?=
 =?utf-8?B?TUtxck5iNmJCRkwrY3V4dVJvTFhtZHdidE5TdXZ2WkJESlErRTZkTEhacHlX?=
 =?utf-8?B?ajd6dFNJa0V5bnRsUzA1VUF1UkMzSWlWWW41L3l3RjRkb2hMZ3F4d3E4Z3J4?=
 =?utf-8?B?aHZEdjZxK2N6OXJJNW1nSklwWU9ZSkkwR2duQkU2UmphZHhSbG5RVmJieUx4?=
 =?utf-8?B?ekhBMkpqQjNDakJCVzhwejVJYTBwandjL2hRRUVlR216eWNvQzFjTldzMVJx?=
 =?utf-8?B?MEZyTmxmZE50WTl1bnIzcHJVSExEaUpkZEpCV2VscWtLbXVDeER3VGRXUXpv?=
 =?utf-8?B?NjRoUzMwVkJEUGJ2MldpODdCM21SNmRSblJlY05aWWkyVXFSNkFVRGVwU1Yx?=
 =?utf-8?B?eUpHQk5ucXJMVExGdWt2WFNiRlRBbVVhZTJYcHVUTEJiMjBZSkt6Qjhack1R?=
 =?utf-8?B?T3VSamxDYkdHNXFvZ2dCeVU3YXk2NlI1UVJRZG9QNVpjV1NpanFWcG0yajNK?=
 =?utf-8?B?VmZKTG9KOFFQaDVzY2VsVHZvMUFMQjk4eVd1NnU5YkVzeVFIVTFxR1kvSm9i?=
 =?utf-8?B?dGZieDdFZktJZE13RjBBVERjem05Q1h3alBtR0lsUVZZMmdPQ3FWaXZrUndQ?=
 =?utf-8?B?Vy9sdm9CN0M1ZUFheXlWWmVBNkZvUzRXSU54SzJhSWZQTFd4UzlIWlNZMXc1?=
 =?utf-8?B?MTlST2dqdlh6SmI3K1dSbW9qbTU0MDc3akxubUh5Q0dxbU5LQSsvYmZMdS9S?=
 =?utf-8?B?QU5oa2RrQ3hoNyt3UkN5d0M0VTdqRFlqZGdiTlJJUjlPbHFDV2JPMHo2dVRN?=
 =?utf-8?B?U2NUd0JIY2F1d0U2Z1RGa3FqZHo1VStFTVpXN0RIMVpYL0k2SURXNW1zTGJt?=
 =?utf-8?Q?ZPUjYYnrhff3xO9Nv5DY7Ks=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e7e262-2477-45cf-3c64-08dd9c47318b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 11:19:34.8242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Thr2beDNJMs5eUPReLiKiZlkNTzgYEVuz/cPgqmz+3j2HCt2L97TdQsoMmOJM88LJMdph0nbt3K5oyj0zFxGbsFExRQZln4i4IVCCXaCy159nEbkjm6Ad4qBt7NcpzlO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10020
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

Hi Laurent,
Thanks for your comment.

On 26/05/25 12:49, Laurent Pinchart wrote:
> On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
>> Hi Maxime,
>> Thanks for your comment.
>>
>> On 26/05/25 11:26, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
>>>> After adv7511_mode_set() was merged into .atomic_enable(), only the
>>>> native resolution is working when using modetest.
>>>>
>>>> This is caused by incorrect timings: adv7511_mode_set() must not be
>>>> merged into .atomic_enable().
>>>>
>>>> Move adv7511_mode_set() back to the .mode_set() callback in
>>>> drm_bridge_funcs to restore correct behavior.
>>>>
>>>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
>>>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>
>>> Explaining why, both in the commit log and the comments, would be nice.
>>> Because I can't think of any good reason it just can't work for that
>>> bridge.
>>
>> Sorry, let me clarify and share with you some details:
>>
>> adv7511_mode_set:
>>    - Is setting up timings registers for the DSI2HDMI bridge in our case
>>      we are using ADV7535 bridge.
>>
>> rzg2l_mipi_dsi_atomic_enable:
>>    - Is setting up the vclock for the DSI ip
>>
>> Testing new/old implementation a bit we found the following:
>>
>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
>> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>
>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>>
>> Same result but different timing (in function call perspective):
>>
>>    - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
>>    - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()
> 
> What is "old" and "new" here ? Is it before and after Dmitry's patch, or
> before and after yours ? Please be precise when describing problems.

Sorry, you are completely right:

  - old --> before Dmitry's patch
  - new --> after Dmitry's patch

> 
>> What do you think? Thanks in advance.
> 
> You're only explaining above what the "old" and "new" behaviours are,
> and claiming one of them is causing an issue, but you're not explaining
> *why* it causes an issue. That's what your commit message is expected to
> detail.
> 

Thanks for the clarification! :)
I will send v2 explaining better this.

Thanks & Regards,
Tommaso

