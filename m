Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17556857B96
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63810E5F9;
	Fri, 16 Feb 2024 11:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zaoDTMy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDB310E24B;
 Fri, 16 Feb 2024 11:26:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cb01yTeSoVQlqxTfCLYZ70Zf5OFZxFpSPB8x/I8XME/ulowUqaXyMGpurqya8CI9arue85fiA1AtlTNwpIBM9F+x01WslDK/NMst+UFGMHYyleIRzdu0gRJrl2+mIC2D5dheCl7Zw5chD7ndf4zY5V0ZawmSgzmG0+dCNBvhbP90NA+JQwzMszh7GbTYozfXJwlyRE0IkTsXUHdRAmrPre1x69qjLPojCk7a23r3QHorHzyYxWUiteyXUJibl7oA99Wbndw5qsHD5oPmpjRVYf/bq93RnmjfHUOSh8x65zG8iFg3ISMXy9//9AUVrnrljiWotEp1pofkVQtqJcfHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM/KT0HyZi8tuOoYFAWD3U3S9XglfIWw+xpBCphX8yU=;
 b=So86rfHFQwBtvgmOsMtkFNjGqzS/P5dXWADQzyF+fylMOduppa4WRW9Ta9CGfPq54gsZs0gFALRE6P/9ZpSB73TF02tge48WngqVnsObyn48aqm8FuzeZ1zTPA7Ji39pMUmDn7rETjFCvBQt3vyP25WyE9fiSrKYuj57yP7CMyP39GU1kP5PNcgq97r+qzt3T93nPosnAfrvvLD6gNwgwds2MXwJ7uGtVtWWswhdJWKI9n1/ABuAc5BmqPz1BHrVbY2BInH8cUeCcz+5jkbAPU72Rkk/IM7PlwCGV8ZmLHtb3cIws0eLGaAvd6icoFLP1ejzS4QeBslsEedcrvsT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM/KT0HyZi8tuOoYFAWD3U3S9XglfIWw+xpBCphX8yU=;
 b=zaoDTMy9rsIgghUH2Qc4umw5G8XetqnCt7ZF5etsvjWVt7TvUq/l11j8cLp9Ksk4lVlxMqRw2b6jCF7xsBap/XNi46ZXgFgLY5S9PvjzbN1vXBe7tPt3ysCoPpA3gTmLJmj1cQhFj0KkIPbr1TQd95libn4vFnga/cnP7jQtlpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 11:26:18 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6%5]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 11:26:18 +0000
Content-Type: multipart/alternative;
 boundary="------------LdcvnyTkHWSBfDiPqnLgy2u2"
Message-ID: <233320c2-4644-520c-0238-39ca165c7a27@amd.com>
Date: Fri, 16 Feb 2024 16:56:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/6] drm/tests/drm_buddy: add alloc_range_bias test
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <20240215174431.285069-10-matthew.auld@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240215174431.285069-10-matthew.auld@intel.com>
X-ClientProxiedBy: PN3PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::9) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fca4f57-c28d-48ce-5c3a-08dc2ee21821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vb0rWkrn/37B2gArVpre8vN6Y/q2dwTluJ8/0lbCrMH7vTRCCDVNNN/Pq6Qz+OTBtXa0uDrQG0ZFm6uzfaU2DlapLPFpJnOLZPok9B3nQYbsaP3wNBV+6u0W7B45TWA6S6g1XZBss8AXruoEZhYRBnWin2KC6m5tmEOPlRKSjMelQGCjtJ/6/wabEvX6pFvSyHTWEbZOmFDrXr0MeQgPbTjrEt+0m1O62Am5G4VyZpgFpB5g01IKwy3wI8n+Frr5EmN8yhmBXJmU9atQFADC1gewRfhaIxDttzzEh0ne4Vq5xzj6r2Ymy916CIvAzB9qan29SRGcsmdxM9jaaMWjeFBA5tE3ufERSfub8SIQazHV1VpB5WrWIetnq6ksURFPf7plI88eetrLtibro7oXcJSsRo6/V9Ld9ICC7iLYtjV4PaASzS7VVABAuygd+boW6cOOibyA8ffcUS/WxPSN1Uvo2HEzVtx7gnDqDRg6x6PCB1WpqAI6n6UsZHTC3J0CiKvIe9OOcLoPPnjnsLmyvkRv7ELpITxMYwedSUzYN6LEhPEZEoBSopbdwiLub4hU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39850400004)(366004)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(30864003)(31686004)(2906002)(5660300002)(26005)(83380400001)(2616005)(36756003)(66899024)(38100700002)(6512007)(6666004)(478600001)(53546011)(33964004)(6486002)(66476007)(31696002)(66946007)(66556008)(316002)(6506007)(66574015)(8936002)(8676002)(41300700001)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXowT2N4UFVCM25PcjVuQk9zN3hmQXo4VWQvRVZRdHZtYmt3K0Jib1UrTVhx?=
 =?utf-8?B?WnZsRDQ1bkFzNjMyeGR5TzVpT0dCbjM1S1F0elUrUGdkU2xpRjNscnJhQUJw?=
 =?utf-8?B?SVpDbU9KSlZrbW9ZVnBaem0xMlh4S3RoZzMxUUVpallaeVAyVFpmWlFWWkhC?=
 =?utf-8?B?TEltTUpvbUZ6TnZMUWlseWlGeWZBckN5Tk5pRjR2MzQrazNzWmxZcmpLSk03?=
 =?utf-8?B?US8xd1U1RWIyS0MwRkdzQUpaYkJ4LzhoWFZLaG91RUJGb3djS3pBUW82d2sv?=
 =?utf-8?B?Qkh6bTBJTGlyODNRdHM5bTFCV2Mva3BVbTJvQUNySnhpbmh4UXNocGNoREps?=
 =?utf-8?B?Z2FrSDB4YUp6MThpV0x2cEp3aldJVkQ5WGJ0NStYZzBnYUF0OWtqNkRJYU9B?=
 =?utf-8?B?Ui9RUkZTbGZKdmdzS3U1b0hiUThGSXB6TVFHTHhUVWhsQVF3ZzV6bERwZ09j?=
 =?utf-8?B?OWNOWGJNSVd5TFJBbEVMNzNmaVlIOWxtTzBMUDVqNFBPY3N3RlNBVXRsbmkx?=
 =?utf-8?B?QlA0bVgzeEVJRWFpdTh3Nkl1M29OeDJKTVJ6Z1VkRU04VzhJbzMvUjhScFJO?=
 =?utf-8?B?c2txcXc4d1ZFL2pjTTVwcGlML0E0R0VjRi9uWU9vVkNNNk8yUHFJc1M0VFYw?=
 =?utf-8?B?cm1YcXVCa3dnWk1VeXladHJHY1R6ei9UdnlpZWxkN2tBWU81VXJvYzlhUVps?=
 =?utf-8?B?VnpPbHlDSFVzT3ZKWXUwMDNEYVFvSTBOUnZUcjBscUNIbVhhUndOUWg4QXZJ?=
 =?utf-8?B?RXF4NTRCR044UGdqVSt4M2VvanA2V1p6T2RIRytnSXFla2FheWxvT1QwVkdQ?=
 =?utf-8?B?Y2w3a1B4VGp0eStCdjdTbUljNE9XZ2xXeUw0VG01YitFN0l2eVRDMWhOM0VZ?=
 =?utf-8?B?N0djUzkza1dGcEQxOTd3WDRzaUE1QmF1OS9BZUtLMW9Gb3U3TE4yQXBKemZr?=
 =?utf-8?B?M3liVlNvM2pGSjVackYyWHU0VGxPaDAwdTl4dmJPLzVPeGVRcU41UHlaWmcr?=
 =?utf-8?B?RVp0Qzg2N3o2azgxZGU1R3Z4ZlU0dnl0SzVJRCt0amYvZnltY2lvYVFWQXU4?=
 =?utf-8?B?NThYcUYyY3hkWmc2VittTmJIcDJrbVRlRU43a0ZCNm55eE11bnE5Zy80VVc0?=
 =?utf-8?B?K2NvK3V1dGF6bmFVT25OYlV4TGtuRmI2OVlNdE8vMzdyeTFPWVZrTFZXa1RQ?=
 =?utf-8?B?d1JWT3NLVlFUWTBCcUhBd0k3MHBoWWxRcitzdFdHMkNlQ2J3aGZGdlFQbDR0?=
 =?utf-8?B?djU5SHRtYWdrZ2ZkaXd6NkdxalZiZG10V1ByRVRiZFdQckozRXBjbi8zRHVJ?=
 =?utf-8?B?VGFLRUQ1b0psYVdDandZUjF4SU5Sc1l0eDgydjZsT1hkRWVXYlNXOEtFVUoy?=
 =?utf-8?B?bFFiRk94Y0pweEZKRUp0Z2RCdWJkakFnRzE4Ty9pS1VxRnZJb01qMkdJbXVq?=
 =?utf-8?B?Rk1mNjd5ejVaSjVhb0N3dE5VSVgvTnZKQUgvZzgyZTd1UEx5dUJYMThVYWZP?=
 =?utf-8?B?MGFoTHIzYnVsb1dicFBaNElKc3poWEs5bUtaZzVMQ2hJOGNJWG9oZnlDeTJ2?=
 =?utf-8?B?TDVobnNJYjJ3dVJFNnJHcGtEQllBNUVleGFCOTkrV1FiUGZLVnZUWDBBdWRW?=
 =?utf-8?B?eUpCZ201NGpONjRIVmREVVFmSjBndkxuZytCS1hDRmhQOVR4dkVSRmNOOWg4?=
 =?utf-8?B?a290ZHlWWmRCVDQ2Y2IyWXJkM01lWENGVzJXalRYanFhQ2QxdDJVWDdiSG85?=
 =?utf-8?B?UVVVd25OVkFQOWtCS2dyQmFGdVJCSng1djdQRjcxekhSR0dvUzhJbHhkMXo0?=
 =?utf-8?B?bnlmVW1IckJkR0xBUWxnL09UeGFQSlBLTHhmazd1SzFqb0xqWWJvMklBdFVx?=
 =?utf-8?B?NkRoeXEwYzFDeWFPRU14S1hENlZOT1dOZkNYVlFTZXJtUkdORGUvMHhlVmNw?=
 =?utf-8?B?a0I1cW1id3J4dFFwMWMxMGxpbUo1SXh5bUt3Vmswd2MrcnJXRkJDUndIV1V2?=
 =?utf-8?B?cG0zV09lTjE5eGdLTktxMUJ2bCtUNTFhVUNvYzNWOFJaTGYvOFJRT0tRN3Zq?=
 =?utf-8?B?TWpaQjlYWTU2STRyQnpuRHdkb0tQK2MzTGM4Ykp0bVN3dlM3dXN0ZWExZnFz?=
 =?utf-8?Q?6TglNEZigUfSC3r2clYs8EZdV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fca4f57-c28d-48ce-5c3a-08dc2ee21821
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 11:26:18.3650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S39b20xyqLnwSvfPtKHihmWDD8QEpm7fcEM+LgAxrwWJ50/qN60qVaqRhT5UtQXQNFPVwxHZsHJkZuIEUAVPpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544
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

--------------LdcvnyTkHWSBfDiPqnLgy2u2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>



On 2/15/2024 11:14 PM, Matthew Auld wrote:
> Sanity check range bias with DRM_BUDDY_RANGE_ALLOCATION.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König<christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 218 +++++++++++++++++++++++++
>   1 file changed, 218 insertions(+)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index edacc1adb28f..3d4b29686132 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -14,11 +14,216 @@
>   
>   #include "../lib/drm_random.h"
>   
> +static unsigned int random_seed;
> +
>   static inline u64 get_size(int order, u64 chunk_size)
>   {
>   	return (1 << order) * chunk_size;
>   }
>   
> +static void drm_test_buddy_alloc_range_bias(struct kunit *test)
> +{
> +	u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
> +	DRM_RND_STATE(prng, random_seed);
> +	unsigned int i, count, *order;
> +	struct drm_buddy mm;
> +	LIST_HEAD(allocated);
> +
> +	bias_size = SZ_1M;
> +	ps = roundup_pow_of_two(prandom_u32_state(&prng) % bias_size);
> +	ps = max(SZ_4K, ps);
> +	mm_size = (SZ_8M-1) & ~(ps-1); /* Multiple roots */
> +
> +	kunit_info(test, "mm_size=%u, ps=%u\n", mm_size, ps);
> +
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
> +			       "buddy_init failed\n");
> +
> +	count = mm_size / bias_size;
> +	order = drm_random_order(count, &prng);
> +	KUNIT_EXPECT_TRUE(test, order);
> +
> +	/*
> +	 * Idea is to split the address space into uniform bias ranges, and then
> +	 * in some random order allocate within each bias, using various
> +	 * patterns within. This should detect if allocations leak out from a
> +	 * given bias, for example.
> +	 */
> +
> +	for (i = 0; i < count; i++) {
> +		LIST_HEAD(tmp);
> +		u64 size;
> +
> +		bias_start = order[i] * bias_size;
> +		bias_end = bias_start + bias_size;
> +		bias_rem = bias_size;
> +
> +		/* internal round_up too big */
> +		KUNIT_ASSERT_TRUE_MSG(test,
> +				      drm_buddy_alloc_blocks(&mm, bias_start,
> +							     bias_end, bias_size + ps, bias_size,
> +							     &allocated,
> +							     DRM_BUDDY_RANGE_ALLOCATION),
> +				      "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> +				      bias_start, bias_end, bias_size, bias_size);
> +
> +		/* size too big */
> +		KUNIT_ASSERT_TRUE_MSG(test,
> +				      drm_buddy_alloc_blocks(&mm, bias_start,
> +							     bias_end, bias_size + ps, ps,
> +							     &allocated,
> +							     DRM_BUDDY_RANGE_ALLOCATION),
> +				      "buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n",
> +				      bias_start, bias_end, bias_size + ps, ps);
> +
> +		/* bias range too small for size */
> +		KUNIT_ASSERT_TRUE_MSG(test,
> +				      drm_buddy_alloc_blocks(&mm, bias_start + ps,
> +							     bias_end, bias_size, ps,
> +							     &allocated,
> +							     DRM_BUDDY_RANGE_ALLOCATION),
> +				      "buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n",
> +				      bias_start + ps, bias_end, bias_size, ps);
> +
> +		/* bias misaligned */
> +		KUNIT_ASSERT_TRUE_MSG(test,
> +				      drm_buddy_alloc_blocks(&mm, bias_start + ps,
> +							     bias_end - ps,
> +							     bias_size >> 1, bias_size >> 1,
> +							     &allocated,
> +							     DRM_BUDDY_RANGE_ALLOCATION),
> +				      "buddy_alloc h didn't fail with bias(%x-%x), size=%u, ps=%u\n",
> +				      bias_start + ps, bias_end - ps, bias_size >> 1, bias_size >> 1);
> +
> +		/* single big page */
> +		KUNIT_ASSERT_FALSE_MSG(test,
> +				       drm_buddy_alloc_blocks(&mm, bias_start,
> +							      bias_end, bias_size, bias_size,
> +							      &tmp,
> +							      DRM_BUDDY_RANGE_ALLOCATION),
> +				       "buddy_alloc i failed with bias(%x-%x), size=%u, ps=%u\n",
> +				       bias_start, bias_end, bias_size, bias_size);
> +		drm_buddy_free_list(&mm, &tmp);
> +
> +		/* single page with internal round_up */
> +		KUNIT_ASSERT_FALSE_MSG(test,
> +				       drm_buddy_alloc_blocks(&mm, bias_start,
> +							      bias_end, ps, bias_size,
> +							      &tmp,
> +							      DRM_BUDDY_RANGE_ALLOCATION),
> +				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> +				       bias_start, bias_end, ps, bias_size);
> +		drm_buddy_free_list(&mm, &tmp);
> +
> +		/* random size within */
> +		size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
> +		if (size)
> +			KUNIT_ASSERT_FALSE_MSG(test,
> +					       drm_buddy_alloc_blocks(&mm, bias_start,
> +								      bias_end, size, ps,
> +								      &tmp,
> +								      DRM_BUDDY_RANGE_ALLOCATION),
> +					       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> +					       bias_start, bias_end, size, ps);
> +
> +		bias_rem -= size;
> +		/* too big for current avail */
> +		KUNIT_ASSERT_TRUE_MSG(test,
> +				      drm_buddy_alloc_blocks(&mm, bias_start,
> +							     bias_end, bias_rem + ps, ps,
> +							     &allocated,
> +							     DRM_BUDDY_RANGE_ALLOCATION),
> +				      "buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n",
> +				      bias_start, bias_end, bias_rem + ps, ps);
> +
> +		if (bias_rem) {
> +			/* random fill of the remainder */
> +			size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
> +			size = max(size, ps);
> +
> +			KUNIT_ASSERT_FALSE_MSG(test,
> +					       drm_buddy_alloc_blocks(&mm, bias_start,
> +								      bias_end, size, ps,
> +								      &allocated,
> +								      DRM_BUDDY_RANGE_ALLOCATION),
> +					       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> +					       bias_start, bias_end, size, ps);
> +			/*
> +			 * Intentionally allow some space to be left
> +			 * unallocated, and ideally not always on the bias
> +			 * boundaries.
> +			 */
> +			drm_buddy_free_list(&mm, &tmp);
> +		} else {
> +			list_splice_tail(&tmp, &allocated);
> +		}
> +	}
> +
> +	kfree(order);
> +	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_fini(&mm);
> +
> +	/*
> +	 * Something more free-form. Idea is to pick a random starting bias
> +	 * range within the address space and then start filling it up. Also
> +	 * randomly grow the bias range in both directions as we go along. This
> +	 * should give us bias start/end which is not always uniform like above,
> +	 * and in some cases will require the allocator to jump over already
> +	 * allocated nodes in the middle of the address space.
> +	 */
> +
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
> +			       "buddy_init failed\n");
> +
> +	bias_start = round_up(prandom_u32_state(&prng) % (mm_size - ps), ps);
> +	bias_end = round_up(bias_start + prandom_u32_state(&prng) % (mm_size - bias_start), ps);
> +	bias_end = max(bias_end, bias_start + ps);
> +	bias_rem = bias_end - bias_start;
> +
> +	do {
> +		u64 size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
> +
> +		KUNIT_ASSERT_FALSE_MSG(test,
> +				       drm_buddy_alloc_blocks(&mm, bias_start,
> +							      bias_end, size, ps,
> +							      &allocated,
> +							      DRM_BUDDY_RANGE_ALLOCATION),
> +				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> +				       bias_start, bias_end, size);
> +		bias_rem -= size;
> +
> +		/*
> +		 * Try to randomly grow the bias range in both directions, or
> +		 * only one, or perhaps don't grow at all.
> +		 */
> +		do {
> +			u64 old_bias_start = bias_start;
> +			u64 old_bias_end = bias_end;
> +
> +			if (bias_start)
> +				bias_start -= round_up(prandom_u32_state(&prng) % bias_start, ps);
> +			if (bias_end != mm_size)
> +				bias_end += round_up(prandom_u32_state(&prng) % (mm_size - bias_end), ps);
> +
> +			bias_rem += old_bias_start - bias_start;
> +			bias_rem += bias_end - old_bias_end;
> +		} while (!bias_rem && (bias_start || bias_end != mm_size));
> +	} while (bias_rem);
> +
> +	KUNIT_ASSERT_EQ(test, bias_start, 0);
> +	KUNIT_ASSERT_EQ(test, bias_end, mm_size);
> +	KUNIT_ASSERT_TRUE_MSG(test,
> +			      drm_buddy_alloc_blocks(&mm, bias_start, bias_end,
> +						     ps, ps,
> +						     &allocated,
> +						     DRM_BUDDY_RANGE_ALLOCATION),
> +			      "buddy_alloc passed with bias(%x-%x), size=%u\n",
> +			      bias_start, bias_end, ps);
> +
> +	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_fini(&mm);
> +}
> +
>   static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   {
>   	u32 mm_size, ps = SZ_4K, i, n_pages, total;
> @@ -363,17 +568,30 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>   	drm_buddy_fini(&mm);
>   }
>   
> +static int drm_buddy_suite_init(struct kunit_suite *suite)
> +{
> +	while (!random_seed)
> +		random_seed = get_random_u32();
> +
> +	kunit_info(suite, "Testing DRM buddy manager, with random_seed=0x%x\n",
> +		   random_seed);
> +
> +	return 0;
> +}
> +
>   static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_limit),
>   	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pathological),
>   	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
> +	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
>   	{}
>   };
>   
>   static struct kunit_suite drm_buddy_test_suite = {
>   	.name = "drm_buddy",
> +	.suite_init = drm_buddy_suite_init,
>   	.test_cases = drm_buddy_tests,
>   };
>   

--------------LdcvnyTkHWSBfDiPqnLgy2u2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Reviewed-by:
      Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;</p>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/15/2024 11:14 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240215174431.285069-10-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Sanity check range bias with DRM_BUDDY_RANGE_ALLOCATION.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 218 +++++++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index edacc1adb28f..3d4b29686132 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -14,11 +14,216 @@
 
 #include &quot;../lib/drm_random.h&quot;
 
+static unsigned int random_seed;
+
 static inline u64 get_size(int order, u64 chunk_size)
 {
 	return (1 &lt;&lt; order) * chunk_size;
 }
 
+static void drm_test_buddy_alloc_range_bias(struct kunit *test)
+{
+	u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
+	DRM_RND_STATE(prng, random_seed);
+	unsigned int i, count, *order;
+	struct drm_buddy mm;
+	LIST_HEAD(allocated);
+
+	bias_size = SZ_1M;
+	ps = roundup_pow_of_two(prandom_u32_state(&amp;prng) % bias_size);
+	ps = max(SZ_4K, ps);
+	mm_size = (SZ_8M-1) &amp; ~(ps-1); /* Multiple roots */
+
+	kunit_info(test, &quot;mm_size=%u, ps=%u\n&quot;, mm_size, ps);
+
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&amp;mm, mm_size, ps),
+			       &quot;buddy_init failed\n&quot;);
+
+	count = mm_size / bias_size;
+	order = drm_random_order(count, &amp;prng);
+	KUNIT_EXPECT_TRUE(test, order);
+
+	/*
+	 * Idea is to split the address space into uniform bias ranges, and then
+	 * in some random order allocate within each bias, using various
+	 * patterns within. This should detect if allocations leak out from a
+	 * given bias, for example.
+	 */
+
+	for (i = 0; i &lt; count; i++) {
+		LIST_HEAD(tmp);
+		u64 size;
+
+		bias_start = order[i] * bias_size;
+		bias_end = bias_start + bias_size;
+		bias_rem = bias_size;
+
+		/* internal round_up too big */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&amp;mm, bias_start,
+							     bias_end, bias_size + ps, bias_size,
+							     &amp;allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      &quot;buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n&quot;,
+				      bias_start, bias_end, bias_size, bias_size);
+
+		/* size too big */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&amp;mm, bias_start,
+							     bias_end, bias_size + ps, ps,
+							     &amp;allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      &quot;buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n&quot;,
+				      bias_start, bias_end, bias_size + ps, ps);
+
+		/* bias range too small for size */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&amp;mm, bias_start + ps,
+							     bias_end, bias_size, ps,
+							     &amp;allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      &quot;buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n&quot;,
+				      bias_start + ps, bias_end, bias_size, ps);
+
+		/* bias misaligned */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&amp;mm, bias_start + ps,
+							     bias_end - ps,
+							     bias_size &gt;&gt; 1, bias_size &gt;&gt; 1,
+							     &amp;allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      &quot;buddy_alloc h didn't fail with bias(%x-%x), size=%u, ps=%u\n&quot;,
+				      bias_start + ps, bias_end - ps, bias_size &gt;&gt; 1, bias_size &gt;&gt; 1);
+
+		/* single big page */
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&amp;mm, bias_start,
+							      bias_end, bias_size, bias_size,
+							      &amp;tmp,
+							      DRM_BUDDY_RANGE_ALLOCATION),
+				       &quot;buddy_alloc i failed with bias(%x-%x), size=%u, ps=%u\n&quot;,
+				       bias_start, bias_end, bias_size, bias_size);
+		drm_buddy_free_list(&amp;mm, &amp;tmp);
+
+		/* single page with internal round_up */
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&amp;mm, bias_start,
+							      bias_end, ps, bias_size,
+							      &amp;tmp,
+							      DRM_BUDDY_RANGE_ALLOCATION),
+				       &quot;buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n&quot;,
+				       bias_start, bias_end, ps, bias_size);
+		drm_buddy_free_list(&amp;mm, &amp;tmp);
+
+		/* random size within */
+		size = max(round_up(prandom_u32_state(&amp;prng) % bias_rem, ps), ps);
+		if (size)
+			KUNIT_ASSERT_FALSE_MSG(test,
+					       drm_buddy_alloc_blocks(&amp;mm, bias_start,
+								      bias_end, size, ps,
+								      &amp;tmp,
+								      DRM_BUDDY_RANGE_ALLOCATION),
+					       &quot;buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n&quot;,
+					       bias_start, bias_end, size, ps);
+
+		bias_rem -= size;
+		/* too big for current avail */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&amp;mm, bias_start,
+							     bias_end, bias_rem + ps, ps,
+							     &amp;allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      &quot;buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n&quot;,
+				      bias_start, bias_end, bias_rem + ps, ps);
+
+		if (bias_rem) {
+			/* random fill of the remainder */
+			size = max(round_up(prandom_u32_state(&amp;prng) % bias_rem, ps), ps);
+			size = max(size, ps);
+
+			KUNIT_ASSERT_FALSE_MSG(test,
+					       drm_buddy_alloc_blocks(&amp;mm, bias_start,
+								      bias_end, size, ps,
+								      &amp;allocated,
+								      DRM_BUDDY_RANGE_ALLOCATION),
+					       &quot;buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n&quot;,
+					       bias_start, bias_end, size, ps);
+			/*
+			 * Intentionally allow some space to be left
+			 * unallocated, and ideally not always on the bias
+			 * boundaries.
+			 */
+			drm_buddy_free_list(&amp;mm, &amp;tmp);
+		} else {
+			list_splice_tail(&amp;tmp, &amp;allocated);
+		}
+	}
+
+	kfree(order);
+	drm_buddy_free_list(&amp;mm, &amp;allocated);
+	drm_buddy_fini(&amp;mm);
+
+	/*
+	 * Something more free-form. Idea is to pick a random starting bias
+	 * range within the address space and then start filling it up. Also
+	 * randomly grow the bias range in both directions as we go along. This
+	 * should give us bias start/end which is not always uniform like above,
+	 * and in some cases will require the allocator to jump over already
+	 * allocated nodes in the middle of the address space.
+	 */
+
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&amp;mm, mm_size, ps),
+			       &quot;buddy_init failed\n&quot;);
+
+	bias_start = round_up(prandom_u32_state(&amp;prng) % (mm_size - ps), ps);
+	bias_end = round_up(bias_start + prandom_u32_state(&amp;prng) % (mm_size - bias_start), ps);
+	bias_end = max(bias_end, bias_start + ps);
+	bias_rem = bias_end - bias_start;
+
+	do {
+		u64 size = max(round_up(prandom_u32_state(&amp;prng) % bias_rem, ps), ps);
+
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&amp;mm, bias_start,
+							      bias_end, size, ps,
+							      &amp;allocated,
+							      DRM_BUDDY_RANGE_ALLOCATION),
+				       &quot;buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n&quot;,
+				       bias_start, bias_end, size);
+		bias_rem -= size;
+
+		/*
+		 * Try to randomly grow the bias range in both directions, or
+		 * only one, or perhaps don't grow at all.
+		 */
+		do {
+			u64 old_bias_start = bias_start;
+			u64 old_bias_end = bias_end;
+
+			if (bias_start)
+				bias_start -= round_up(prandom_u32_state(&amp;prng) % bias_start, ps);
+			if (bias_end != mm_size)
+				bias_end += round_up(prandom_u32_state(&amp;prng) % (mm_size - bias_end), ps);
+
+			bias_rem += old_bias_start - bias_start;
+			bias_rem += bias_end - old_bias_end;
+		} while (!bias_rem &amp;&amp; (bias_start || bias_end != mm_size));
+	} while (bias_rem);
+
+	KUNIT_ASSERT_EQ(test, bias_start, 0);
+	KUNIT_ASSERT_EQ(test, bias_end, mm_size);
+	KUNIT_ASSERT_TRUE_MSG(test,
+			      drm_buddy_alloc_blocks(&amp;mm, bias_start, bias_end,
+						     ps, ps,
+						     &amp;allocated,
+						     DRM_BUDDY_RANGE_ALLOCATION),
+			      &quot;buddy_alloc passed with bias(%x-%x), size=%u\n&quot;,
+			      bias_start, bias_end, ps);
+
+	drm_buddy_free_list(&amp;mm, &amp;allocated);
+	drm_buddy_fini(&amp;mm);
+}
+
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 {
 	u32 mm_size, ps = SZ_4K, i, n_pages, total;
@@ -363,17 +568,30 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 	drm_buddy_fini(&amp;mm);
 }
 
+static int drm_buddy_suite_init(struct kunit_suite *suite)
+{
+	while (!random_seed)
+		random_seed = get_random_u32();
+
+	kunit_info(suite, &quot;Testing DRM buddy manager, with random_seed=0x%x\n&quot;,
+		   random_seed);
+
+	return 0;
+}
+
 static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_limit),
 	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
+	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
 	{}
 };
 
 static struct kunit_suite drm_buddy_test_suite = {
 	.name = &quot;drm_buddy&quot;,
+	.suite_init = drm_buddy_suite_init,
 	.test_cases = drm_buddy_tests,
 };
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------LdcvnyTkHWSBfDiPqnLgy2u2--
