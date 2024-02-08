Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19D84E422
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74BF10E90D;
	Thu,  8 Feb 2024 15:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5D3dCVqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD0A10E90D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTC6WzeW0QcFImQvqxOSunbeeGq/Yse/yet+DigxVPX4Pdu97Tdme9sHigojVtNk0zRwJRALH+chZ7FxCJuSEU500ESC3DPKlLvx5feNK0xKwXpQo2YgJ3r00GSkdX2N9hR8wmzNus2nqgxtI7GMZEsKlc1NegmFFiIDEjSMx9MCmuHW+dbQeIo9Mf3d5fBGVL2t8nUYVOHVTOM8i0lyUCaLPjAvPAGevWs9zZLhD4QuQJQJZXJhReOylMj0ojnZUjCzH/u+lFSa02bRiPVeqY7mgjaOUuL4X3K65DMBukfL9aX6PXiML5o5BbmNxUMpb0EHkn0nZcAPiZ16fwDjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIXaV49L8nG+LTGhx0e6bfxKavEMVvg6LGCZ9R5hmpg=;
 b=j6e/yjh382zCSiruvcRofluJHcxjcpXPVW7Sm7k7dYDEUDudNQKIdGMtq9K57of2QOgs9bPa2uEpe4chEI6qRS3phRi/eCHvd7yI7BREoRANlH3GeF5kKw1wPbQNhBSv8hUnb0AfETvGj0lf7TVw6PEhIXMwR3XbnLw0ktxQANhyfVNu4aaFTn/CSEtz6SOc6xo0JF/bI78Ofcy2SM+EGAtj4M90o3dX2cor9x29BZ4uYtcIOAaxChGNzfYPTsQ4lussc8GcfDND02J82nrZ5r4UXA0F7kCfjrisg+AYIbk1QF7TQ4pEpryYk01T0poG/JmqZ8VsjIu6LPX2jbByKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIXaV49L8nG+LTGhx0e6bfxKavEMVvg6LGCZ9R5hmpg=;
 b=5D3dCVqqGUBF2mhToy6O9KgvepdtoXZjonM0nGEnl3gQ3+v0b9HLKt8Dz1It5EaJZSHtPfIXtuNVlqtRgdm+OtYsne4IGoWZ5oPQpy/5iPG54cPTWRulEME+V4SAv2xCwQuX3V08e4g1jy1dDOVHzFNv8JWTeQ3btb0qHYOCrtc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.15; Thu, 8 Feb
 2024 15:37:35 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe%4]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 15:37:35 +0000
Content-Type: multipart/alternative;
 boundary="------------5cwwWiYZyQPHEt0KFo29XvRc"
Message-ID: <41b61d3c-4e4e-8c17-c621-e97b19e764a3@amd.com>
Date: Thu, 8 Feb 2024 21:07:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/tests/drm_buddy: add alloc_contiguous test
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20240208143618.247048-2-matthew.auld@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240208143618.247048-2-matthew.auld@intel.com>
X-ClientProxiedBy: PN3PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::22) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bb88fa-20e4-4052-3f22-08dc28bbde6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kXbkzX6bK4xJmpfxDQDC0Np9YgpVO8HYdG6bYfqHxob0z50rx6Hlqxxm2jHNMrFi5VxzKKuwcFa/1Ny/9PGyhgfETeHd4HBt9RN1KvBZKAFpcEtgc5+LvZYH+n3jbsxa3gNnJuvxTT8fiSblxuCHGtr3MmhNV3I0KShFXJSvlgKug+9F//7hYPKEu9P8Tq3YRFqFad3j1hoViRdKSjxgg2bEZdDNq9Yjn2SUUxZ22o8HAIEUGjgwxDLMFZeSvfInqO1w+4ZBQ23tBkeHGS6Nez3I4O3GsAD6gacIkhovSd1qNheaVip4szEPSJ5DqEAfk0uIzyzfPZy2D1w5o/Y9aT2m7wtXUGc9kj/uVtmPisMFPHO7OIbyEdklB/Z0mTxcrBfb4ymNb/E9JJqPzYkchGYC9Ex1bIrW21pHqJTLe9pXngnUc9O5zB+7V/lIlJosKXjDMriQA6iwFsPTfy0bcDP4vadOQXd/adEDFH2JUh2vCkNyPqJtNjJoge905R8HVy/1P9AOt0n2rndP6dn91z1m2+Wc86ZreDLhgx38wSo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(41300700001)(33964004)(26005)(6512007)(53546011)(2616005)(86362001)(6506007)(6666004)(66574015)(66556008)(2906002)(8936002)(66476007)(31696002)(8676002)(66946007)(6486002)(966005)(316002)(166002)(38100700002)(4326008)(31686004)(54906003)(83380400001)(478600001)(5660300002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0ZOQlUweHM3Z2pNLzRYR2xtNTFrSEt0bG40d244Y2RoTGphemg3OW1nMk0v?=
 =?utf-8?B?aUwyTHdtVEw1WGVIekZyNFM2SDRGL2I3V1dCZ3BTVDM3T0xGc1E0TUdJRG1i?=
 =?utf-8?B?VHV6OXh0SnM2M1JCenpidDZ5NlZrWTl3VlZnZUxiYTRPK1dNT1F3ZmJ6MER4?=
 =?utf-8?B?bno4RExJT2lYSWpid1lCd3ZWRlc2RWpiandCUzlQR0xnYzB1cERZUTJaYTc3?=
 =?utf-8?B?MW1yYWYzM0VzY05kdkFQRGJDZWR5eGJtRnVTOFZtSEZnMDl2S3ZGRTJSaXJj?=
 =?utf-8?B?L1NIam9ZaWZ3emY2d05ybUYwck1UbCtEblFEVDFsUEpodXZXUTBLL3FFQ1A4?=
 =?utf-8?B?dUxPOTdHYUxpZVV2Y1QyanZBeWpiU2VsNWg5UU1GcC9tNS9yS3dHRVJMNlpH?=
 =?utf-8?B?WlI2cC83cE9TNkZweFRjZUY3bEIvSVhLZVN0a2NvS0tzNWlRYVJwL0lRam9i?=
 =?utf-8?B?eHRLY3VtQXRYV2xsTVNXdnBtWmRVTG1FU2N3TDJNT08veVJsT29aUkMvbEhh?=
 =?utf-8?B?WnYrM3hyQnRnb2d4YmE3dzAwVmZjNjhLUVRhUE5hTjZmVlN5SmhXZUJqUXRF?=
 =?utf-8?B?SGVQaG5ZWkp1WmFqL3JsaHY1S3JrZzg3ZlQ1K1RhMHNreWluY0p3bUYxV0xt?=
 =?utf-8?B?TDZpazNXc2hpZjlMbFdqejZjWnptekptMmV3UkhqRzFUR3pzWTJISWJjcGty?=
 =?utf-8?B?NFROTEdzd3Fjb1lUbVhZZXdYNE13N1VsNTk2Ly9jMFVUZFdwRTluTzA3YUd2?=
 =?utf-8?B?bGxsNFNZelFkSnR3eC9tR0lxbUxXWS9nK3NocUUydjhscmRJeWwzSGtGQUJ6?=
 =?utf-8?B?TktTUVNUZnB2aC95ZWxkWXQ4cnRjQldCREZ5TXdNYXZiMUVuVkF0WWZlMjg1?=
 =?utf-8?B?M3hBTkIzcjF1bHZoZUh0cWxvcHo3c0VZTXdnTldaQjNHYVJjWHRaMDZXTWN4?=
 =?utf-8?B?d2NFd29WZUJyK09WWW1XOXlERGd2VFRFWVJKbWV6M1ZzUktGWTBpUWRqWXAv?=
 =?utf-8?B?b0ZWSUhSeFFTOFp2UkpQMlAvMVBJWmFBaUlxTE1uYmx1V2ZLNEtoRitRcjNt?=
 =?utf-8?B?aGQ1aUhrSWJxcUI1dGlNTyt3TE01OVMzbUhsdTlYSzJiZ21QNjcwQ3BoamUy?=
 =?utf-8?B?UWpoUjFyUDJpVEkxVFo5S0hUY0lWczBzYk5qMmVad0dFcm9sanl3Uk9VdXJN?=
 =?utf-8?B?YUFoOU5RV1ROVTNaUHBFNjhVS09NK3pRcUVwUFozc3V1amtDVkIzemQxNUc5?=
 =?utf-8?B?aEsxUVgxVlRrbjlQaU9paXlPMjJvM25UajhxVkU5aUw0b05NTVUvd0o4aXFq?=
 =?utf-8?B?c0gxNmFabjE5cTJCRzhTd25VMWhkaUlDUk9scUVLU09yaVlLK1FXc3ozUEhy?=
 =?utf-8?B?Zm4yQmVYYzRQSkFXOE1xZER3TGhzblU4VStTM3pNSE5Nd1E2SE9aeG92ZlQ2?=
 =?utf-8?B?and5UFZnSHdCaDRqcHRDRDNtRnFKeGEyUjNoWXFVTkw1K0t2QWdGRGJ2aE85?=
 =?utf-8?B?bTM4eFJydjMzZ3ZJTWxNZno0UE1USFZ3UmdsdXZoMUloSlhkQnYweEpwRXNM?=
 =?utf-8?B?Rko1dDVUbnB0MGJFQjVYc096VlF4YU0razVDa21WZWREOEZMMlBBeWpuNlp1?=
 =?utf-8?B?YmRSRzNvM0JLSldGTmt6MDh6eHllUDFPTGFCRU84ME1Md0diaXgxQjR3RnJW?=
 =?utf-8?B?SzhJa09OaFpSYjhrUGEwMUJmQ0dMRXFQQm9TRE9ZQm1xMHdDNHV5RE5QMjR5?=
 =?utf-8?B?dHFIN3pPWFhFR3BoeWFETmV0S0ZyZXVEQWFUalFwNWFzanFtT2FNMHNZVmp0?=
 =?utf-8?B?ZEtEWFEyUkNqWldyWTllMkNRNjdJMEJIcnlMTDV3aFlDRWU5ZDMyODNuY25Y?=
 =?utf-8?B?b3lOTkhIMk4xWUFPbkpmY1drY01SNGVVaG9sRVRUczVPSzlYZUFzam56bnJl?=
 =?utf-8?B?R1kvUkcxNG5uRHVicFNta1Z3TjJaMG5ybWlocDF4eU0zSUZsL2lKaWdSU1JQ?=
 =?utf-8?B?cXFMYXMvQmZOOXFCK2drMnpYN0ljdkJWTDhDZ2NZTUJxMkpaSm1UQnlIUDNu?=
 =?utf-8?B?ZDJmc2IzN1JoWFBTMERxM0dhT1pJQnc1ZzZtWVRVY29uMHpvUUFyT01HU2JV?=
 =?utf-8?Q?Cvm9g+akA+/NVTyI9JnJmV6Up?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bb88fa-20e4-4052-3f22-08dc28bbde6a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 15:37:33.9171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSdT3YlnX2uu1mcGTrAgoRlybMbCPLD+mP6NJ7SaO9qAE5QtBtWFYiRJ0y7zPBLfmstCHL9UPkURUOVLE5eMYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319
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

--------------5cwwWiYZyQPHEt0KFo29XvRc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/8/2024 8:06 PM, Matthew Auld wrote:
> Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.
That's really quick :)

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

>
> References:https://gitlab.freedesktop.org/drm/amd/-/issues/3097
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Cc: Limonciello<mario.limonciello@amd.com>
> Cc: Christian König<christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 89 ++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index ea2af6bd9abe..4215d8b5fcf0 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -8,6 +8,7 @@
>   
>   #include <linux/prime_numbers.h>
>   #include <linux/sched/signal.h>
> +#include <linux/sizes.h>
>   
>   #include <drm/drm_buddy.h>
>   
> @@ -18,6 +19,93 @@ static inline u64 get_size(int order, u64 chunk_size)
>   	return (1 << order) * chunk_size;
>   }
>   
> +static void drm_test_buddy_alloc_contiguous(struct kunit *test)
> +{
> +	u64 mm_size, ps = SZ_4K, i, n_pages, total;
> +	struct drm_buddy_block *block;
> +	struct drm_buddy mm;
> +	LIST_HEAD(left);
> +	LIST_HEAD(middle);
> +	LIST_HEAD(right);
> +	LIST_HEAD(allocated);
> +
> +	mm_size = 16 * 3 * SZ_4K;
> +
> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> +
> +	/*
> +	 * Idea is to fragment the address space by alternating block
> +	 * allocations between three different lists; one for left, middle and
> +	 * right. We can then free a list to simulate fragmentation. In
> +	 * particular we want to exercise the DRM_BUDDY_CONTIGUOUS_ALLOCATION,
> +	 * including the try_harder path.
> +	 */
> +
> +	i = 0;
> +	n_pages = mm_size / ps;
> +	do {
> +		struct list_head *list;
> +		int slot = i % 3;
> +
> +		if (slot == 0)
> +			list = &left;
> +		else if (slot == 1)
> +			list = &middle;
> +		else
> +			list = &right;
> +		KUNIT_ASSERT_FALSE_MSG(test,
> +				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							      ps, ps, list, 0),
> +				       "buddy_alloc hit an error size=%d\n",
> +				       ps);
> +	} while (++i < n_pages);
> +
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%d\n", 3 * ps);
> +
> +	drm_buddy_free_list(&mm, &middle);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   2 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
> +
> +	drm_buddy_free_list(&mm, &right);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +	/*
> +	 * At this point we should have enough contiguous space for 2 blocks,
> +	 * however they are never buddies (since we freed middle and right) so
> +	 * will require the try_harder logic to find them.
> +	 */
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   2 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc hit an error size=%d\n", 2 * ps);
> +
> +	drm_buddy_free_list(&mm, &left);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc hit an error size=%d\n", 3 * ps);
> +
> +	total = 0;
> +	list_for_each_entry(block, &allocated, link)
> +		total += drm_buddy_block_size(&mm, block);
> +
> +	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
> +
> +	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_fini(&mm);
> +}
> +
>   static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   {
>   	u64 mm_size, size, start = 0;
> @@ -280,6 +368,7 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pathological),
> +	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>   	{}
>   };
>   

--------------5cwwWiYZyQPHEt0KFo29XvRc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/8/2024 8:06 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240208143618.247048-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.</pre>
    </blockquote>
    That's really quick :)<br>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Reviewed-by:
      Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20240208143618.247048-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">

References: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/amd/-/issues/3097">https://gitlab.freedesktop.org/drm/amd/-/issues/3097</a>
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Cc: Limonciello <a class="moz-txt-link-rfc2396E" href="mailto:mario.limonciello@amd.com">&lt;mario.limonciello@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 89 ++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index ea2af6bd9abe..4215d8b5fcf0 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -8,6 +8,7 @@
 
 #include &lt;linux/prime_numbers.h&gt;
 #include &lt;linux/sched/signal.h&gt;
+#include &lt;linux/sizes.h&gt;
 
 #include &lt;drm/drm_buddy.h&gt;
 
@@ -18,6 +19,93 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 &lt;&lt; order) * chunk_size;
 }
 
+static void drm_test_buddy_alloc_contiguous(struct kunit *test)
+{
+	u64 mm_size, ps = SZ_4K, i, n_pages, total;
+	struct drm_buddy_block *block;
+	struct drm_buddy mm;
+	LIST_HEAD(left);
+	LIST_HEAD(middle);
+	LIST_HEAD(right);
+	LIST_HEAD(allocated);
+
+	mm_size = 16 * 3 * SZ_4K;
+
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&amp;mm, mm_size, ps));
+
+	/*
+	 * Idea is to fragment the address space by alternating block
+	 * allocations between three different lists; one for left, middle and
+	 * right. We can then free a list to simulate fragmentation. In
+	 * particular we want to exercise the DRM_BUDDY_CONTIGUOUS_ALLOCATION,
+	 * including the try_harder path.
+	 */
+
+	i = 0;
+	n_pages = mm_size / ps;
+	do {
+		struct list_head *list;
+		int slot = i % 3;
+
+		if (slot == 0)
+			list = &amp;left;
+		else if (slot == 1)
+			list = &amp;middle;
+		else
+			list = &amp;right;
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
+							      ps, ps, list, 0),
+				       &quot;buddy_alloc hit an error size=%d\n&quot;,
+				       ps);
+	} while (++i &lt; n_pages);
+
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
+							   3 * ps, ps, &amp;allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       &quot;buddy_alloc didn't error size=%d\n&quot;, 3 * ps);
+
+	drm_buddy_free_list(&amp;mm, &amp;middle);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
+							   3 * ps, ps, &amp;allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       &quot;buddy_alloc didn't error size=%llu\n&quot;, 3 * ps);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
+							   2 * ps, ps, &amp;allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       &quot;buddy_alloc didn't error size=%llu\n&quot;, 2 * ps);
+
+	drm_buddy_free_list(&amp;mm, &amp;right);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
+							   3 * ps, ps, &amp;allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       &quot;buddy_alloc didn't error size=%llu\n&quot;, 3 * ps);
+	/*
+	 * At this point we should have enough contiguous space for 2 blocks,
+	 * however they are never buddies (since we freed middle and right) so
+	 * will require the try_harder logic to find them.
+	 */
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
+							   2 * ps, ps, &amp;allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       &quot;buddy_alloc hit an error size=%d\n&quot;, 2 * ps);
+
+	drm_buddy_free_list(&amp;mm, &amp;left);
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&amp;mm, 0, mm_size,
+							   3 * ps, ps, &amp;allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       &quot;buddy_alloc hit an error size=%d\n&quot;, 3 * ps);
+
+	total = 0;
+	list_for_each_entry(block, &amp;allocated, link)
+		total += drm_buddy_block_size(&amp;mm, block);
+
+	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
+
+	drm_buddy_free_list(&amp;mm, &amp;allocated);
+	drm_buddy_fini(&amp;mm);
+}
+
 static void drm_test_buddy_alloc_pathological(struct kunit *test)
 {
 	u64 mm_size, size, start = 0;
@@ -280,6 +368,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
+	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	{}
 };
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------5cwwWiYZyQPHEt0KFo29XvRc--
