Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3686C7BE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D09810E463;
	Thu, 29 Feb 2024 11:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0EcV/IRa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67C610E463
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:10:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnnO2s+D7EQpMyFr0wwaeSlmBV51AhC/asrt2EfNbnnpHVge5iHPIURPkH4JN99ZY83hRmTFs5F9N4theGOgIw2qZNZz7tYAZvG1LLzwV03OI65qAg+wxxC/QGF3hk42YAVaHnrZX2vN0mPUkfF55V32a7UvvesdA7shbyRngegO6SlZgXFGJr5lBVPlDj8GO2y0deE2qbeXth6bj1VRYyJMRi4Zx1Hd56n7kzN/8ql1g9qqhm3vc6S+cHngTgOkiLm5kCuuJ98M0Ei2IpCXt8L0wbLaoUSkUOt70Bakfkhuh5eZEG1Hb8HuB1ZenI/NsAHvQAMO3KnPoyw3dnhXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBFgy4w7VGDjmHbLknlKKo22UacTvHx07DKjltitJJk=;
 b=MbzeHWsutIcF9XlYzUhN6kf9vFXUsyPPICbDqg1HX2fco2M/2QJrOWPLHPlZnlYHIMn+pjlUh9VT7Me8PCPZ1SDGIONG/qUy3MbbMhwyOfcVDMHpm3MGpKMpiQ95px8QO++/8GifmcCZLrUL85JSCByrxKOEA2e1MDrdPznHuZiddvYFHktCEjMSIapLipahrmhxhv5lqn+vp0Hnysd0raoBEZqWZERSTLWCsO104QPLGeXqZj72Ux+ny2WqhIjFh7Ylhsj+PBOXp3CAs0Nlk9bM7GwkwlPOmGgwiGHZAQM9w6UytIw5oird41QtO7QwRVSabJ6QsSUWrJ66722/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBFgy4w7VGDjmHbLknlKKo22UacTvHx07DKjltitJJk=;
 b=0EcV/IRa5C1jIFju24of3xvVMP5x94RTwBdoyJSrI4eRNt3BhSwjBZLRF4nmWhghjTi/sVSlC18Fw9Gn1ij5FzOEaiC2C2JPqMwMGCG8hBIprp7/TXfOaK4dJzz7+JAo+1N/TCVstys48hWboI4rZbbsbniMRY+TkC5BL6R81cA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM4PR12MB7598.namprd12.prod.outlook.com (2603:10b6:8:10a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 11:10:23 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b%5]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 11:10:23 +0000
Content-Type: multipart/alternative;
 boundary="------------DJMyZMVMwezB8rrVNVG2UL6u"
Message-ID: <d9f44ec0-3985-47b1-9217-d0c6eda56d9d@amd.com>
Date: Thu, 29 Feb 2024 16:40:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tests/buddy: stop using PAGE_SIZE
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20240229105112.250077-3-matthew.auld@intel.com>
 <20240229105112.250077-4-matthew.auld@intel.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240229105112.250077-4-matthew.auld@intel.com>
X-ClientProxiedBy: PN3PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::23) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DM4PR12MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 9145d864-552c-4463-4485-08dc3917065f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdHHHUhyZ5InRgz6IDnnjGKdGUW8aHhzzYrVnPsyT+Ol0zuwuFEFOxkcWgm1CiFu4EI3WS9iP0wr2e0tB15/AtMmenzU/qP/VIVLem54ZyZdgvCm2pLcI1TuaLyz0fH6M3OCHmv/mn04FJgC6AKQmGYPDrs3gwSYjSJjJ2PXy2Ht3oKjaC6cjrat0OhOy/CprtlUcZLi6B4Z3mH8Vz+1KUjEe5LoQyc560R7iDG3xePdazQvUkHLiy8O+zjRAVK+TlMxW/SfWIRfKh1lOdT5KWUWoyAq77peY8QaX9eBod6tPurcX1IqF8m98QPuAjpxVawD8AbpKCS99bSpVckMm99kd4BbTUfOgvP/NDwlxjZDdm1cMB/0gzBtoCf0WxDOhcIh1FzU3UmHKNLb0Yxq28neogKPTqhjqEwpVwKL541bj0SD/eHqQI+TSo4bowiMSL0SSsM8DeAIlwgD3qdrwJEvqF7wtlI0284Dz6TfCUOPaThx4a9NX+jljDDO0Fuh8c9HgxES72ttf8ldEAbLxx2sUnhG7BBN9Ini4ulPO6UugolBF4dPg5fFdynnLk7Hb3HEJUP8zo4kZiaLC7F0uQq8xyqgMN9j/vpkYsrvi6RHi7oNkBNaYoMAvf6D/84xKJ+6zeUzN6FQOFw5kNyHrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0xhcmI2c1l2ZzdEK1pGNFA0VzI4bjN4N1FXMVE2aXZLL09jWWNDOXhoRGtm?=
 =?utf-8?B?Qno4SjBlcFVqN2ovd1F4NlE0MDF1bFpqZFpMeE1vOFNaUlR1cTcrY09QaHUv?=
 =?utf-8?B?QkdTbHp3SnBoRU9BY0dZQmFBL0RsVEZvQjk0MkwyUWZoRWo4QVAzZ25qYlN0?=
 =?utf-8?B?UTBsR2xMTForbVd0T3Z4ekNWMDkrOGlsN3E0a1VOZkwvOU5QNEg5Wlg2WHFN?=
 =?utf-8?B?S0NxaENEUFk3eE9vajJGRS9ucjV3T0duaW5lY2JNeEY2TFU3MlJFRitSY0R0?=
 =?utf-8?B?TFFlQndSeWUwbVpOdHkxYU9qZ1BaWWQ3dktDUGdUSmdtcXhxV0lmMER6VFNq?=
 =?utf-8?B?N1h4dnl0QnRLMC9SQ0w3TjIzdmVVSnp6L1B1aWhXZWFOeWgxdllsZGc1VDFU?=
 =?utf-8?B?dVd5TEZmWlo1cTVJMldUWFVjU0NxNXluZFdCSjNuZHM0cEJFaFYyL1RMazZP?=
 =?utf-8?B?d2ZBSkpzTTFOaGxndEQxV0lMYTJDdGNERGZyOXVUL2pkZnZQNDNwSkdUMTZx?=
 =?utf-8?B?d2RLUlhpckVxVkFHQXlIVmVaUkx1WEtsQ3RiNEF1dlpxMVNkbGNlZEpQcnU0?=
 =?utf-8?B?OXc4M2htRmlvbm9iOGtrRi8rU1B6K0x4a0NOTVBpMWNLWTVRck80enBFWnNq?=
 =?utf-8?B?bm5yZEVaaHBORjh1TXc0ZW1iUDVpNTBVbEs4alZtM1FEZVJwSFd3aER2WjUw?=
 =?utf-8?B?bW14NTN3Smwwa1dGaThBZlJVSEJtWk1TY2o3ZU5rRTdwK2lPUXhhVjlsWU1T?=
 =?utf-8?B?UzFUTTJ5TXdjR3QwTlJzaCsyMXlpTkF4WTRPZDFMYlZaOU9JazZzN0JieVdC?=
 =?utf-8?B?UFlvS3ZwcHRRb0NYMU1MWXdwZ3k2UUpLclYxdkJTZHF1RThBTFlqamdUbXpn?=
 =?utf-8?B?UUNlLzJLZVhCNDU4RTlsSkwwTXpDeUFTK213VmRjK25GUnZsL2lMTkJtbUMr?=
 =?utf-8?B?SnZyejQvSUZzVDV2WnJwbzhSS25TcytyejRPNGVSazBPcGhlUDEweUU4SDBD?=
 =?utf-8?B?YzhMMkJteW41MjYrTXljNmZHN0d0MUVIdjNxMWs4ZzZpMWVIUGZOaW5CUWo4?=
 =?utf-8?B?alVEYUxVT3NudjkyaUo0MXpZa1Y4VFZyc2xWOVBtTkc5Y2xTQ3d5ME45VzBz?=
 =?utf-8?B?UTh6ZFk4VlM5N000SWdpMmVYOVIvYmFHZ2x3bFJmQ1BTMlVjWW5oQUhIUUlG?=
 =?utf-8?B?NWVObFlKUmFOcTBkbjBZOGRkSWhkRHJuNlRzMzdHM25hVXZCVDVxOE1hVkpY?=
 =?utf-8?B?bFBHYnlBUjNnbUFLbTZST0FMUVQ4d3JkcFV2SVBoNlM4SjNsZUcvSzdNeWkv?=
 =?utf-8?B?eFNLTUlTSjdxSXNNaEJsNEEyWCtTQWlDUWs4V1pNRmk0UGw2aUNiNitmdEx2?=
 =?utf-8?B?MGdSaDduZng1Q1FnKy9ZWCtvOUFsb2lKcjFxMGhaQVhlWWVTRWxEN2xVUmFX?=
 =?utf-8?B?djkrM3NlMm4rekJBNVNEUU56eDBBQWNHVUg3NldhN2hHU3o3cVo3NVFTUVFK?=
 =?utf-8?B?V2tmYkpGcDFtUGJ0d0tXa21SZlN4N05pc1hLU0pNTFRjM3B3VURWYmtPbW9W?=
 =?utf-8?B?NHNMZUVTTDN3dVBOd243QUFNR0FmK2J5ZlBPajM1cmJndmlFR3FpK0hhWEov?=
 =?utf-8?B?WDhaRzU5eDRQY1ZLVXNHaWI3YmpMTVpYTCtkcEhjckViWkd2Vm9ETVRIUG9C?=
 =?utf-8?B?elQ5My9LQ29yZTJFRWxTTlBOTDVNNEJmRnlCdEFVTDROVzNaUGxzR0RaR1RU?=
 =?utf-8?B?Y1JZR0wrV2FCMWVyUEQ1Z0VYejdncS9zRFM2WFJyOGRrTllteGF2cVNiSEJz?=
 =?utf-8?B?ZmRIaUJXbmpCR0pTQjFxZCtDT2FmUGlDbGJ4WkU5eW9ZMmJZM01EMy9zK3po?=
 =?utf-8?B?VDlnSTBYc0QwaGlBdU13WG5RK1l4NXUvNFBwYmU5UUhSUEplQkxhOTNCdEVD?=
 =?utf-8?B?S0o5bnVVdDdkbzB4QTY5ZVBJRW5EbGhOeTJyaUUyeGt5TjUvK0FlVm5na1Jt?=
 =?utf-8?B?UjRhcGlUN3BXaG40WTZKOTF1U2hkV09DSSs5aHpZWE1Vdi9oSkNFdTI0R0E5?=
 =?utf-8?B?Vjl1eS92WExEMm5JOFRHRXE1REVtd1c2U3FuYVgzcFEybklwaXJyUURUL0p3?=
 =?utf-8?Q?fBED+uHzauHwVEcZhBPLfcPIb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9145d864-552c-4463-4485-08dc3917065f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:10:23.4566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+FrVBCGDVxgZ3IlRQH+oJ/cfXjYJ+bCpVDW3I9TMMj9qrW9ee3Zzh8W4tuvNW+VsLfkO+7TDEjmpXsFe9N/FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598
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

--------------DJMyZMVMwezB8rrVNVG2UL6u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

On 2/29/2024 4:21 PM, Matthew Auld wrote:
> Gives the wrong impression that min page-size has to be tied to the CPU
> PAGE_SIZE.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König<christian.koenig@amd.com>
> Cc: Arnd Bergmann<arnd@arndb.de>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 42 +++++++++++++-------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index be2d9d7764be..8528f39a84e6 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -329,8 +329,8 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   	 * Eventually we will have a fully 50% fragmented mm.
>   	 */
>   
> -	mm_size = PAGE_SIZE << max_order;
> -	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, PAGE_SIZE),
> +	mm_size = SZ_4K << max_order;
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
>   			       "buddy_init failed\n");
>   
>   	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
> @@ -344,7 +344,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   		}
>   
>   		for (order = top; order--;) {
> -			size = get_size(order, PAGE_SIZE);
> +			size = get_size(order, mm.chunk_size);
>   			KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start,
>   									    mm_size, size, size,
>   										&tmp, flags),
> @@ -358,7 +358,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   		}
>   
>   		/* There should be one final page for this sub-allocation */
> -		size = get_size(0, PAGE_SIZE);
> +		size = get_size(0, mm.chunk_size);
>   		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   								    size, size, &tmp, flags),
>   							   "buddy_alloc hit -ENOMEM for hole\n");
> @@ -368,7 +368,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   
>   		list_move_tail(&block->link, &holes);
>   
> -		size = get_size(top, PAGE_SIZE);
> +		size = get_size(top, mm.chunk_size);
>   		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   								   size, size, &tmp, flags),
>   							  "buddy_alloc unexpectedly succeeded at top-order %d/%d, it should be full!",
> @@ -379,7 +379,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   
>   	/* Nothing larger than blocks of chunk_size now available */
>   	for (order = 1; order <= max_order; order++) {
> -		size = get_size(order, PAGE_SIZE);
> +		size = get_size(order, mm.chunk_size);
>   		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   								   size, size, &tmp, flags),
>   							  "buddy_alloc unexpectedly succeeded at order %d, it should be full!",
> @@ -408,14 +408,14 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   	 * page left.
>   	 */
>   
> -	mm_size = PAGE_SIZE << max_order;
> -	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, PAGE_SIZE),
> +	mm_size = SZ_4K << max_order;
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
>   			       "buddy_init failed\n");
>   
>   	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
>   
>   	for (order = 0; order < max_order; order++) {
> -		size = get_size(order, PAGE_SIZE);
> +		size = get_size(order, mm.chunk_size);
>   		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   								    size, size, &tmp, flags),
>   							   "buddy_alloc hit -ENOMEM with order=%d\n",
> @@ -428,7 +428,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   	}
>   
>   	/* And now the last remaining block available */
> -	size = get_size(0, PAGE_SIZE);
> +	size = get_size(0, mm.chunk_size);
>   	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   							    size, size, &tmp, flags),
>   						   "buddy_alloc hit -ENOMEM on final alloc\n");
> @@ -440,7 +440,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   
>   	/* Should be completely full! */
>   	for (order = max_order; order--;) {
> -		size = get_size(order, PAGE_SIZE);
> +		size = get_size(order, mm.chunk_size);
>   		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   								   size, size, &tmp, flags),
>   							  "buddy_alloc unexpectedly succeeded, it should be full!");
> @@ -456,7 +456,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   		list_del(&block->link);
>   		drm_buddy_free_block(&mm, block);
>   
> -		size = get_size(order, PAGE_SIZE);
> +		size = get_size(order, mm.chunk_size);
>   		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   								    size, size, &tmp, flags),
>   							   "buddy_alloc hit -ENOMEM with order=%d\n",
> @@ -471,7 +471,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   	}
>   
>   	/* To confirm, now the whole mm should be available */
> -	size = get_size(max_order, PAGE_SIZE);
> +	size = get_size(max_order, mm.chunk_size);
>   	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   							    size, size, &tmp, flags),
>   						   "buddy_alloc (realloc) hit -ENOMEM with order=%d\n",
> @@ -502,15 +502,15 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
>   	 * try to allocate them all.
>   	 */
>   
> -	mm_size = PAGE_SIZE * ((1 << (max_order + 1)) - 1);
> +	mm_size = SZ_4K * ((1 << (max_order + 1)) - 1);
>   
> -	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, PAGE_SIZE),
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
>   			       "buddy_init failed\n");
>   
>   	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
>   
>   	for (order = 0; order <= max_order; order++) {
> -		size = get_size(order, PAGE_SIZE);
> +		size = get_size(order, mm.chunk_size);
>   		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   								    size, size, &tmp, flags),
>   							   "buddy_alloc hit -ENOMEM with order=%d\n",
> @@ -523,7 +523,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
>   	}
>   
>   	/* Should be completely full! */
> -	size = get_size(0, PAGE_SIZE);
> +	size = get_size(0, mm.chunk_size);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
>   							   size, size, &tmp, flags),
>   						  "buddy_alloc unexpectedly succeeded, it should be full!");
> @@ -540,7 +540,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>   	LIST_HEAD(allocated);
>   	struct drm_buddy mm;
>   
> -	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, size, PAGE_SIZE));
> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, size, SZ_4K));
>   
>   	KUNIT_EXPECT_EQ_MSG(test, mm.max_order, DRM_BUDDY_MAX_ORDER,
>   			    "mm.max_order(%d) != %d\n", mm.max_order,
> @@ -548,7 +548,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>   
>   	size = mm.chunk_size << mm.max_order;
>   	KUNIT_EXPECT_FALSE(test, drm_buddy_alloc_blocks(&mm, start, size, size,
> -							PAGE_SIZE, &allocated, flags));
> +							mm.chunk_size, &allocated, flags));
>   
>   	block = list_first_entry_or_null(&allocated, struct drm_buddy_block, link);
>   	KUNIT_EXPECT_TRUE(test, block);
> @@ -558,10 +558,10 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>   						drm_buddy_block_order(block), mm.max_order);
>   
>   	KUNIT_EXPECT_EQ_MSG(test, drm_buddy_block_size(&mm, block),
> -			    BIT_ULL(mm.max_order) * PAGE_SIZE,
> +			    BIT_ULL(mm.max_order) * mm.chunk_size,
>   						"block size(%llu) != %llu\n",
>   						drm_buddy_block_size(&mm, block),
> -						BIT_ULL(mm.max_order) * PAGE_SIZE);
> +						BIT_ULL(mm.max_order) * mm.chunk_size);
>   
>   	drm_buddy_free_list(&mm, &allocated);
>   	drm_buddy_fini(&mm);

--------------DJMyZMVMwezB8rrVNVG2UL6u
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Reviewed-by:
    Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
    <br>
    <div class="moz-cite-prefix">On 2/29/2024 4:21 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240229105112.250077-4-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Gives the wrong impression that min page-size has to be tied to the CPU
PAGE_SIZE.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Arnd Bergmann <a class="moz-txt-link-rfc2396E" href="mailto:arnd@arndb.de">&lt;arnd@arndb.de&gt;</a>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 42 +++++++++++++-------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index be2d9d7764be..8528f39a84e6 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -329,8 +329,8 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 	 * Eventually we will have a fully 50% fragmented mm.
 	 */
 
-	mm_size = PAGE_SIZE &lt;&lt; max_order;
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&amp;mm, mm_size, PAGE_SIZE),
+	mm_size = SZ_4K &lt;&lt; max_order;
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&amp;mm, mm_size, SZ_4K),
 			       &quot;buddy_init failed\n&quot;);
 
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
@@ -344,7 +344,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 		}
 
 		for (order = top; order--;) {
-			size = get_size(order, PAGE_SIZE);
+			size = get_size(order, mm.chunk_size);
 			KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start,
 									    mm_size, size, size,
 										&amp;tmp, flags),
@@ -358,7 +358,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 		}
 
 		/* There should be one final page for this sub-allocation */
-		size = get_size(0, PAGE_SIZE);
+		size = get_size(0, mm.chunk_size);
 		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 								    size, size, &amp;tmp, flags),
 							   &quot;buddy_alloc hit -ENOMEM for hole\n&quot;);
@@ -368,7 +368,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 
 		list_move_tail(&amp;block-&gt;link, &amp;holes);
 
-		size = get_size(top, PAGE_SIZE);
+		size = get_size(top, mm.chunk_size);
 		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 								   size, size, &amp;tmp, flags),
 							  &quot;buddy_alloc unexpectedly succeeded at top-order %d/%d, it should be full!&quot;,
@@ -379,7 +379,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 
 	/* Nothing larger than blocks of chunk_size now available */
 	for (order = 1; order &lt;= max_order; order++) {
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 								   size, size, &amp;tmp, flags),
 							  &quot;buddy_alloc unexpectedly succeeded at order %d, it should be full!&quot;,
@@ -408,14 +408,14 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 	 * page left.
 	 */
 
-	mm_size = PAGE_SIZE &lt;&lt; max_order;
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&amp;mm, mm_size, PAGE_SIZE),
+	mm_size = SZ_4K &lt;&lt; max_order;
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&amp;mm, mm_size, SZ_4K),
 			       &quot;buddy_init failed\n&quot;);
 
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 
 	for (order = 0; order &lt; max_order; order++) {
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 								    size, size, &amp;tmp, flags),
 							   &quot;buddy_alloc hit -ENOMEM with order=%d\n&quot;,
@@ -428,7 +428,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 	}
 
 	/* And now the last remaining block available */
-	size = get_size(0, PAGE_SIZE);
+	size = get_size(0, mm.chunk_size);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 							    size, size, &amp;tmp, flags),
 						   &quot;buddy_alloc hit -ENOMEM on final alloc\n&quot;);
@@ -440,7 +440,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 
 	/* Should be completely full! */
 	for (order = max_order; order--;) {
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 								   size, size, &amp;tmp, flags),
 							  &quot;buddy_alloc unexpectedly succeeded, it should be full!&quot;);
@@ -456,7 +456,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 		list_del(&amp;block-&gt;link);
 		drm_buddy_free_block(&amp;mm, block);
 
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 								    size, size, &amp;tmp, flags),
 							   &quot;buddy_alloc hit -ENOMEM with order=%d\n&quot;,
@@ -471,7 +471,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 	}
 
 	/* To confirm, now the whole mm should be available */
-	size = get_size(max_order, PAGE_SIZE);
+	size = get_size(max_order, mm.chunk_size);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 							    size, size, &amp;tmp, flags),
 						   &quot;buddy_alloc (realloc) hit -ENOMEM with order=%d\n&quot;,
@@ -502,15 +502,15 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
 	 * try to allocate them all.
 	 */
 
-	mm_size = PAGE_SIZE * ((1 &lt;&lt; (max_order + 1)) - 1);
+	mm_size = SZ_4K * ((1 &lt;&lt; (max_order + 1)) - 1);
 
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&amp;mm, mm_size, PAGE_SIZE),
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&amp;mm, mm_size, SZ_4K),
 			       &quot;buddy_init failed\n&quot;);
 
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 
 	for (order = 0; order &lt;= max_order; order++) {
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 								    size, size, &amp;tmp, flags),
 							   &quot;buddy_alloc hit -ENOMEM with order=%d\n&quot;,
@@ -523,7 +523,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
 	}
 
 	/* Should be completely full! */
-	size = get_size(0, PAGE_SIZE);
+	size = get_size(0, mm.chunk_size);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, start, mm_size,
 							   size, size, &amp;tmp, flags),
 						  &quot;buddy_alloc unexpectedly succeeded, it should be full!&quot;);
@@ -540,7 +540,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 	LIST_HEAD(allocated);
 	struct drm_buddy mm;
 
-	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&amp;mm, size, PAGE_SIZE));
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&amp;mm, size, SZ_4K));
 
 	KUNIT_EXPECT_EQ_MSG(test, mm.max_order, DRM_BUDDY_MAX_ORDER,
 			    &quot;mm.max_order(%d) != %d\n&quot;, mm.max_order,
@@ -548,7 +548,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 
 	size = mm.chunk_size &lt;&lt; mm.max_order;
 	KUNIT_EXPECT_FALSE(test, drm_buddy_alloc_blocks(&amp;mm, start, size, size,
-							PAGE_SIZE, &amp;allocated, flags));
+							mm.chunk_size, &amp;allocated, flags));
 
 	block = list_first_entry_or_null(&amp;allocated, struct drm_buddy_block, link);
 	KUNIT_EXPECT_TRUE(test, block);
@@ -558,10 +558,10 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 						drm_buddy_block_order(block), mm.max_order);
 
 	KUNIT_EXPECT_EQ_MSG(test, drm_buddy_block_size(&amp;mm, block),
-			    BIT_ULL(mm.max_order) * PAGE_SIZE,
+			    BIT_ULL(mm.max_order) * mm.chunk_size,
 						&quot;block size(%llu) != %llu\n&quot;,
 						drm_buddy_block_size(&amp;mm, block),
-						BIT_ULL(mm.max_order) * PAGE_SIZE);
+						BIT_ULL(mm.max_order) * mm.chunk_size);
 
 	drm_buddy_free_list(&amp;mm, &amp;allocated);
 	drm_buddy_fini(&amp;mm);
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------DJMyZMVMwezB8rrVNVG2UL6u--
