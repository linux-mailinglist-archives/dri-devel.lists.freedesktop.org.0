Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPhpJgNklmmtegIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 02:14:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE46F15B566
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 02:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B1A10E213;
	Thu, 19 Feb 2026 01:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LP0hCU90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861D110E213;
 Thu, 19 Feb 2026 01:14:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvNg0fzRYhICPHStUb0TcC95LiBE3bKmTtCjektxJRBpXFB1/mu+bnn/8FQK5GXSgS8wzGRFUsTEwuGlnPla2KDNhenX7Y/TKKfA1uYmdSwJXBeznYKVUcvwP5cG3s9hrQ2s4SM+RsqEahiCJ1EZDukEiHFBsHtM5i8rDpLWWwpbULeu5wD4z0gLYc6bxImv+EC7jo4VZHbuV6OMhcstliobkx4yrjt2vagWUgXU4U+gcBe/kKOzvXdpyTgZmgf3Mdp5ldsNE9umqHlpcQPG5Bv/6QZEaHaYxgjexgs4sZYUG4LvkO0V+D2ta6VJ/tEVZpHq0I0PFDbMlqiRrfaq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZGNw8DuCPTlLuoq9vvPhFUWu+74tVS81zJN+ovqf88=;
 b=Rr7OAUIidfnyUk+OoE8+b1nqhz8P5cucEZ+Sl/LUBQAFvwgWnfxYg9+Bqwt8/owyChecnapFjP0s6k3AGnzkjNTR01amOLx1j7UsMYVtJ8zJbfQvoHOpbi/0l3HUXQPwCItHzKfrQzZvRlqCr0EqlDZ8Nr29l4dV2P0ZaP02/0dNCYMp5Oqe3bl8XrxO7qJ+GIEK95nHukiaEPxZbd9oOXUBM6cZ3ZZePGMVTSrWpTSL/SgpNxAbTPsL85K1sp4OfLvRNNE32dsoKEVcbBdz5HWYknWl5QDqT2hzHTzuQuXgLbMnim+qvjI9XOIaa5VJ4FyIwOXFkLXykO+Ixd0zTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZGNw8DuCPTlLuoq9vvPhFUWu+74tVS81zJN+ovqf88=;
 b=LP0hCU90FTcn5rkQKr09xhjYybsLTsm1aGljg4jaNa6aBbKFbd9jklGB5OBvJTWNhJp08/y+q6EVT2d4YDcCVOH4mXi2sQiYuuYqljjSgFOCuN1o+3mbpn/3qTYeLXtdFGhD8VCdQ5TpQsork7EedxfodXJOlkM1L8vBh2DO6P3vRsWRoJJZnwSYtsP/BsdUrn8wCdusIaK4ohjDt7s7+4ik8ox1ESFuCtoBe04SKcFLom5zepjjZmr23Kcs9SEmkaZ27wq1hivcfQYexQJOdtIXCgsoX5roQ9MiH/y+t/Cbk9nKFJNB+yc060+xG/6EonzQ89XZBKP+AlE8UGdlYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Thu, 19 Feb 2026 01:14:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 01:14:33 +0000
Message-ID: <74911663-f4d3-406d-b58e-50cd4bb865d2@nvidia.com>
Date: Wed, 18 Feb 2026 17:14:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/8] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-8-joelagnelf@nvidia.com>
 <DGIITNWQG26Q.VN7FUL89C5D5@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGIITNWQG26Q.VN7FUL89C5D5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 6faa62c1-960d-42c8-2f55-08de6f543d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjFuZ3dnbUJUUFZaUEZrWVNzSEIvbmovaFQrSDBjdFM0VDBDUU8vYnd6ZVN1?=
 =?utf-8?B?SVAwOWhNQTZlRFl6RVZUeU9nU1hYY0lPUUxpVEk4SEtsSlhmc1hWaEhDd3BR?=
 =?utf-8?B?NkEyMkRqQStsZjc0MXlaUzhjY21JQVZMSGc0cy9DTUlRYWZVVDk0aVRlMnlI?=
 =?utf-8?B?enQxQ0JQOUhlOUtKditaQVR1SXAxRmRYa3FwS1FJTVU5aEg2VG53YkVPaHRk?=
 =?utf-8?B?MG11UkxLV2JwRFk5aVViVzdBMGsvQ1VOVDgrVGJxdGRsTUZHcVFOdWp1YkZD?=
 =?utf-8?B?WkVSamd3OVZiVGJJTXgvV2FlNnIvWmlSazR2NWtZZFFFUlR0RFVHeVNlVHRN?=
 =?utf-8?B?MjUvNnAvVnFBR1czcG5xZ2ZqWjBZMDJBWTBudklmeDAyQzdKcnNubDAyU0k2?=
 =?utf-8?B?eDRRb21qbG5VZ3hKaCszWjdMenUrNW5JL3dZalJyQVFmOFd3YTg2cXdXUUs4?=
 =?utf-8?B?QjQ5bGlDa0FkbnZaMmtVTGUwUEhmMFV5bGs2NlQ2ekQ4OStNdFB6emU1U0lN?=
 =?utf-8?B?NWdEeFk3aGVaNGx1VFRPckFjSnRabm91YjcvazVJUFdGMTRVODlBNUdCNkNy?=
 =?utf-8?B?bUYrNkdQY0NlWncyLyt3ckNzeWt6RFRtU3ZQVW9NQndIMXdUMytRakk3SVpl?=
 =?utf-8?B?T094cTJQOEh4UkNaa2RacFJ1ZzAyTjJZTFMrS2p6ZVp1cThFTTc3NWh5a2kv?=
 =?utf-8?B?VW1mMGZudHEyZ0xCRjcxVEYxYldVTHZaWHhwV2Z6NnpGSjEzWlNCTXlVMTF3?=
 =?utf-8?B?bUtMbkZISnZwV1NOOTZvWWJSS0N0YWdPYlNIMHRIVjFxWloxQTFROFUyZEpj?=
 =?utf-8?B?TmJmN0JRbFl5RkZXbGpQODc4NXZQQUQyNkJ0eDNCeityZTJKUkhoWkgzcm5x?=
 =?utf-8?B?YnFIdWtvUjZNd0tTdVBiRW5GRFl1YWxLOW84eW8xcE04UVpQRmwzOS82cVNn?=
 =?utf-8?B?T1huVkpzeDlvTDlMOHRJRE9vS1VzUWJLZm11YUhtc2d0N1ZYNFN3MFYyWmtZ?=
 =?utf-8?B?NnhRbDExOGpIRWVsdkZQY0VTUE1GOWM5Ri9sRWtBUzVoZ2d1NVJqaDduV2Jx?=
 =?utf-8?B?WGdzK2gwRlJibnBqMFg5bFNPUW0yVDQveXhLT0ZySFQzRWVQUXdDZm1yRnB2?=
 =?utf-8?B?K2RTVzlWdCtlVnJUaENwcGVCVHEwbHdKMzZ2by9ZUFU5UjFBRE5CUTlTNlBv?=
 =?utf-8?B?K3duN0pNZ216UUpxS2gxbUZvODZtYjRsRGJwTXpUWXV6VFZJNmRFTEp2cEc5?=
 =?utf-8?B?bEt2ZFR5Tm1XQStqZUNzek5PVUtqY1BoaWpWNm9GM2xIWXF0VEZFWG8rVXcx?=
 =?utf-8?B?ZzNMekxqTVU5cE1CcysxYkc5akUzZTlWMDJxOWNGeG9uQU9pSDRCbXVReEVI?=
 =?utf-8?B?ZlAwaHdJcVZ5UjdFdFFMY3BuWTZkTENHSWFkY3ovRndJMFAreFlpK2c2S3p5?=
 =?utf-8?B?WWlCMkFsYjVpMUtmSlRMVVhtNm1ZZnJ2OXRkYzE2VjR4L3I0QUV0SndXVlFr?=
 =?utf-8?B?SWJSbWZyT1BneUx3YUZmbTg3TGtmM3c1L1NuMHdIemZ3TW9ja01LQmtRbmFE?=
 =?utf-8?B?SVRLOWVKY2lEbEUzTHBhMDlQbkNHdERQakxNSHpNY1NybXJ2VlNha0M0cmF5?=
 =?utf-8?B?R3d6Q3hqbzl5RktxMkFITDlZM01TbzBRWTFhWWpKeEkvejY3Q0ZkcTR2ZXFS?=
 =?utf-8?B?c1pjQzJha0psM2pKdHk3MitSeEtRc3I5UHU3R1h4cU1RQ0d2OXdJeHpMNkRp?=
 =?utf-8?B?VEp3bDZMUEZ2WlU4MWRLTVN0NTFmT1F0QlRKVmsxK3VqbEJmcyt3SHpybE85?=
 =?utf-8?B?V0dZT0V5bUs2cTBPUzFNYnZzSjRYVmdXcExib1ljc1M0T2dMZ2QxV3g1ZDRB?=
 =?utf-8?B?VDY4T1VBWlRQbXlRN0E5U0pwdTZ6ZVpKTTFZK1JialVYRFZvYmlhRmE1QWVa?=
 =?utf-8?B?eGdTaDVZUU9DZTBVNnBQWEdtc0orNW5JYUlteVhRUlRNOGJ3SXVabTRnUzF1?=
 =?utf-8?B?TWFjUDJ4RU9hUjd4RHFWclhIUjhWSnNyZno3dWZ6Qk9nN3lOMEFBRmZQZU9I?=
 =?utf-8?B?d1AwMlN5RVMxNlUwVENIbTFnRjRNTVNHcTQrZ3A2clhaOWlOMm1CeFNLd0RT?=
 =?utf-8?Q?euSE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3VFb0l5TENHVmxjMFp1d0MwVVlvbHdTUm1SMlR4akJ3bDhPdm0vajFTL2V0?=
 =?utf-8?B?M0xTUm1ud2xvTGhjdGFkb2tLZU1uRkhMcjRHdlNhZDZoQWJBcUlkNk1TVGJF?=
 =?utf-8?B?NzBkUVk0bEluNmVENU9sL0F3MFJTM1BEcWw3MzJ2aVJ6VmZjenI5YlZ0RmdM?=
 =?utf-8?B?Q1VKNWswd0hIRmhYSzRweGYxcXN3cFh6NzBSV1FENUUrckdSOHd6eGxsMGxQ?=
 =?utf-8?B?Um1CZngrRU9kSGVzRnV2NGZBQUNhejdsMWdMZktHbjNUWjRIakpIeGs0T2Fw?=
 =?utf-8?B?a1A5R3hpOFNocExuUENJNTlyN0FBdHRBZGtMYy81ZHhBajVyb0Q1c2x4UTNw?=
 =?utf-8?B?SHJqM1JoUkRBK0dzODdmc1p3VlNzVEozd3YwK3ZSSk5tc3lnblRVVEhmSjBY?=
 =?utf-8?B?Q3YyQ0tNUmZJWG1xUTIzSDBpMitMaHB3NnVkdkwwWFRjNWV2R3FIOGhUUzUx?=
 =?utf-8?B?dktWS1ZIUVYxU1dyWjN1bm96NHdtMUY1Q3ZYYmQwaWU1TEVvSy9pN0pVelRZ?=
 =?utf-8?B?NXlvRHpRNXpDNFc1Z0hLVDZKdTU5MnB1OWJLM3RWOThSWVE0THdTcGhFT2x4?=
 =?utf-8?B?cDlMRHl3cUJNQkxzcHcvZlhRWXhZa0ZWMTh0b1JOMnlkOGV2Tk9YL2Nkb1Ax?=
 =?utf-8?B?YWRncmRCTGpLY254ZDNkNjBXWmpYd3d3RUdFejhEY3hOVEhpNW9YSnRMak5j?=
 =?utf-8?B?QUJrUmUvS3FlaXNjWkVobWZjNGZHQ1FyT09nWEV6dmZJcXRNODM1Zy84dTdq?=
 =?utf-8?B?Uk9BbENHVmlYVFhQSTBraTE3bUJPWlkzc1B1UEVGUVE3ZW5WTFdOMXVkbVlM?=
 =?utf-8?B?TjFHUDBTMnNVMTRsTTJyT29UWXRlRmVnc1dzUWVvdmlJZUl2MEZGMGtmT1ds?=
 =?utf-8?B?T2FURVdkRytjTGdSN2xOd1B0c0FCc0docDRNSzY0LzZmVzJqbWdhYVVhK3ZT?=
 =?utf-8?B?R2VWWWhaY0gxYzU3cjc1RkNRS1MxSHFNY0xhOHd0Yk5XbExOSjRBdE5ua0pa?=
 =?utf-8?B?VGpVTlFXclNQYVRCNGJVTmNRUlhVVWRyM21pRGI3UDRoMk45SFBkblpicVhR?=
 =?utf-8?B?d2xtQWRGNlMrK1VocTZZQnJVZnhKQURmNG0xR3hTMWxFaVVnOHpBRDRuMWVt?=
 =?utf-8?B?Y3ZtRzNjZThSd3k1QnppV0pJRTVQK2hLekNBdmc2dXpvckVnK3ZoN2owOVNK?=
 =?utf-8?B?aXlSY3lkbklpdkpXUUlBSFJ5Zko1alA2MlRGbUVTMzB4TitISU0xdXhGa3Q3?=
 =?utf-8?B?ODY2dU1qdTJFZVl1dTBCdGNMV1B1ZzB0aFhkcGdwREFlSHJuMEVtL3RBeVdN?=
 =?utf-8?B?UXRXRnJEcE1rOW90a1BwVjByY21Cc2E0V3c3bzJsQTUvT29tQzNyaHFHYmt4?=
 =?utf-8?B?Qmc1UVJnbzRxRVB2N0o0Q0hqcGVrZEJiMGJZNktMZmpiRHJkTjh0Sk56elN4?=
 =?utf-8?B?bzVyeURlOGRoSjl2OGpRREt5ZnB5S0ViT211bDAzRC9oVHRaY2RxRThXcmRy?=
 =?utf-8?B?dGZIY2grN2tySzZIajhWUnh0UVJKSFhLT00wbWdNRTh2T2xZV3M4cXFxMGV2?=
 =?utf-8?B?RWxMRGc2bWNtTHlyODBLRWVWNWo1dElPTVIxZzN3Q2FyaWZaaFZmNWVlUkg0?=
 =?utf-8?B?eDVseTFYcGJURnp1QXNVMHFvWFQzbDBtS2NXeGUwOHdnd00xcWxENVJhV2pM?=
 =?utf-8?B?aDh0SEd5aVk1THFWMk1IQXNzUmNCZ1lOQnc1ZGRtaldHNThRdTFqaU45ZzZ3?=
 =?utf-8?B?NWhlNlNkMmNsajlUVkN2TGg1WlpxOEVOeDBBTzUrRDhTeW1kWUF2R3Z4Mkpk?=
 =?utf-8?B?YUVlMW9vRVREenlKTWk4ditOMnZ6OUhQMEVoalNlNTVwbmZ5SVJuYWdWK2VX?=
 =?utf-8?B?R2Z3K0k3bDNWdEpSZWd1K1lUcnBJYm52VU9TYlZpVHhIZlFmZEd1N1FHRW1T?=
 =?utf-8?B?Y0xHYWVrSzVaUUJMalJMcDI0WmNLMmJKaHhlZHcwZTRSdWk3OTgvdFB6Ty93?=
 =?utf-8?B?WXJSNy9xckwrWWdQREYzUnVPb3hLZ2lQcXhpakdCemd5ZjhpbmZUczdCME5o?=
 =?utf-8?B?ZGpyVzNybFhCMkpYQmdxNThJYmdGVUc0dEFLZnF2OVlVWG10WXVveHAxNWdG?=
 =?utf-8?B?WDR1WCtjWUxZc2psSWFqL0xGdDZxYTloYlloQWUvWkdiTVlROXV2Rm5Obkcx?=
 =?utf-8?B?WCtIWUQ4SHdlQ3E0ZXIrSnhlWkpScHMxWU9tNWRlVEhVUW0zZUFkZm5MYXND?=
 =?utf-8?B?QnE0WFRkMFVERnFHWW1ZVi9ndGkyeVB0S0FHR0NZSVNVY2Z6N2hhN2tUUzdW?=
 =?utf-8?B?UXBlNFZoUjdyYk1lQWRScnZod0hlN2J3VWo4WGVvc1JKY1loWEduQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6faa62c1-960d-42c8-2f55-08de6f543d6f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 01:14:33.4134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHBD4r1+ITJtzRTSh8Vr6HOZ8Eu6l7TsoqGgB7IZdHVA9jedjHhHxsrue79JTrv4/FIteojJyGABLNK822TNcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,gmail.com,ffwll.ch,redhat.com,garyguo.net,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: EE46F15B566
X-Rspamd-Action: no action

On 2/18/26 4:44 PM, Alexandre Courbot wrote:
> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>> nova-core will use the GPU buddy allocator for physical VRAM management.
>> Enable it in Kconfig.
> 
> Subject prefix should just be `nova-core:`, as this touches the module's
> configuration.

Or "gpu: nova-core: ", actually.

That's the convention so far, where applicable of course.

> 
> I'd also suggest to select `GPU_BUDDY` in the series that actively
> starts using it.
> 

thanks,
-- 
John Hubbard

