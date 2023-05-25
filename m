Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618477118CF
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 23:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB06210E072;
	Thu, 25 May 2023 21:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6757910E072;
 Thu, 25 May 2023 21:10:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK8ZSCepihEqnJ8TTWxU4oLfYH3cMhoPh3+oqioMcn2/NBRyKHqWbiDezU+5h07rqrW3g1943vm8Jnag+8dXg3dyvQPmCpagk4RZvYEelwc229XOSi9ZrkyasqnzZCzeoCI9o1JXGEXfOM6Cymq1sMLVewn1t42mjOrnKH6dMpw08SS5aVWVmDHeIv5oHzM05cksPxWlNdEjRVi8ifQuUG6w2g+C444uC7azhPHqHArS61swgleUtWXChj4w6CErpuEPC8pTlJitVMuCuehGckE0obbw0ug182spkikQFlwmjxxQ3zo+ltvlHqaJdlenScgLFXfTW3s0b3QV26QpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kVw0slFKWd5YNM4QbZgJjnwJsnRya0EWp+yLsbqioU=;
 b=gACX8ZIssYoVTvyJRVpkhr/Hhb6n67zsqLnM5pJ2J5//T6dcTzSoqL3Ja14W3ouxWAc5ABV6eF9/7MZXc7rCQTev73JU0NievzZZB6+tIA+bpM/lYN5TQYX76FPNQxS2h23B+93TSeV+UFw92wNtDpGL/LlUyyrz9MT1eZOJ8JOh6QZljx2ifrEN7vQwD85RO30L7M4CRdOP6XJ0ePYqWi1WRpjIZ5VHdtJUzyAJzOFzuM7ibMHk/cC9dAOzv6nj+3lH8VZP70myv5bpdhwn8AKDgsiPd8NkSxyHTkgCV2PXIa+gxkAyc3nwDf/cPpk/7rE2x+IGgtrNXfuaukjqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kVw0slFKWd5YNM4QbZgJjnwJsnRya0EWp+yLsbqioU=;
 b=dMhDjCqKZ8ZioPBAiM5WFGB7QF1wF0sHhDEOhRTIcKYw7DbRwZXLZ2QL9fJe3zbFRgnL7cTxqciQFO9pvaXFLRjEVbo3BKzGd+5xOzZ5Y9I2kZntRODXqtsVGgGFGnTh9bkUFJHexy8sOV+bmAwGFKI39OY9ETWLUZwPWPZd9J8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 21:10:12 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 21:10:12 +0000
Message-ID: <af7eab96-fc2b-0bbc-107c-35f83dc46022@amd.com>
Date: Thu, 25 May 2023 17:10:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdkfd: remove unused function
 get_reserved_sdma_queues_bitmap
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 "Joshi, Mukul" <Mukul.Joshi@amd.com>
References: <20230525200759.3214525-1-trix@redhat.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230525200759.3214525-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: QB1P288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c6b1c3-0339-4673-6f0b-08db5d646db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zz0wm02GUSKupkI1Ee9YC3OPr7lwhjRS9jIypWwwWdbmzLaRzQPe90/nObrR2e4TKkwZ7ARmN3Zj6dX9GaNbKIGW5hw7QIlp/aIDesb4zx2Ws+3oQfv0e1xacCSWhOW2PdIi6DKKdl9n8abo9NlmjWdkIQHkik6qWlJz8nbVSSisQy7F9eckzGQ5j2L8pREIIAIMgVphvFMHV1iPLyObU7FgL9wiU0NU9cNhm2/iEXLqMD/EfeEX66cqnEppSt4e6tFoFC7566s/bX1sYoIgGC4T6nJK4gMHQqWiEa7gZdqJ72H5CrpeOy7SDvp+W6tFgyvkAH5Ix87bJNKNUOnSVj/ZRsOMq8TD4Cke0YL9oEU0j4gho7NAREsQd1+cQlpZHJs9xUb6Y55qjURnA8q+N+hudddEFmvX79ZcbbAQ4tASWg4a7W1mdInnEn7rlPJtsfOr5rWXt4c+kgaeJ0y7DVvQIB9qb2Np+aSraHbAignZ/eUo4hziCXLm0abtNXn+ymvwRbj00ezNwxJkaLuSXR1A3JzfYlRgm7DZmCaAfMcxqpVjUIGgP721PnOxMJHuc3wiL7sP90hupb4vRScO7CSnt5w6GajnXkCz6M0RpM2QechIWinP88TgUPoQ/idRtS9WDLDjcan8FHR80Ti1Kr67skId4RMT0h2+RNUlPSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(31696002)(86362001)(36756003)(36916002)(110136005)(4326008)(6636002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(5660300002)(8936002)(8676002)(2906002)(44832011)(38100700002)(921005)(53546011)(26005)(186003)(6506007)(6512007)(83380400001)(41300700001)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1JINWFRMWpROUkrS3E3aWlRSERVejVJdStLVU8rM3M1WlBIbTIvNjFHQ0Vh?=
 =?utf-8?B?Z3hHNXZGaFM2NE10UVZjZFBBeVlHdW1lNldJTTNOeDJQc3A0QWF3dlUyVDdQ?=
 =?utf-8?B?ZEJrUGZsTVoyUVpQYVhlcFY0Zkp0YzNNNjhMcWw1b3o3MG45REtqblRYckd6?=
 =?utf-8?B?Vys4V1dVdmlDRk5WYnRWRVIwVTZIcWQvNFZYM216OXJ5b0JhU1c2dzZFeU93?=
 =?utf-8?B?MUNpRU1FeEEvSzRlL0ZZYS9BL0NSZk9ZZWtnTzNEVUQ5Q1RJK1ZGelJuc3hp?=
 =?utf-8?B?enpjR1NQK05Ic0RjR29mYmtPdSs4ZjY4NmIzRGFwUm92VlAzVlFoR0FndVd4?=
 =?utf-8?B?RlNsY21zYVJLSEdOWDJQcTgvSktLMVJjNFg5TTcvV29SSVhVOEw3cTlSUjNK?=
 =?utf-8?B?d2dxSXpqVkZKMEFHcVRQdzBpK0hvOWM2Q2ZKMkFOb0tyL280RE1OTmlrL2V0?=
 =?utf-8?B?VmEyd29DRVlKaDVqeDVaa1hnRWU5RzZyY0dGZ1J5OTNqY3lIUGlCYzltZmJY?=
 =?utf-8?B?OE9tQzhCZU1oWnd2ZzYwVjUrbW9MLzh0ZUQwdDRhTTZNMlV6Zk9waVFwMVJJ?=
 =?utf-8?B?aUtDdWx0YU9oZVRxc0NFTnRzUThqTFJXd1Z5cElrK25UWGRxdGFwclR4cmkr?=
 =?utf-8?B?VlROQmpqSng0QmFjOTZEVHdrbHA5aXI4QUlXZndUZ1JnUW8rUk9udEZCa3Fy?=
 =?utf-8?B?b1lWcG10T2ZvTFl5WXd6WmIraHBEOVU5clFtNnhTMGpkZUNBMVhLdERHZ01k?=
 =?utf-8?B?Q29Zd0NySDNod3kzSElQdmFHcmlqS00yZFl4K2RkK3Jsdm5KNExFYlhnRDh5?=
 =?utf-8?B?REhiQ3lyZmQ5ekhScC81eXcrTzBZVXhxbmdoWDRqbTdNY1JrRlAyLzhqQXpu?=
 =?utf-8?B?NUtuQi9OWldjK0FLSjRPWnQzTTEvQXlwVC9qa1ZoeTNFSFBsdDFMZEZ0RHM1?=
 =?utf-8?B?WkV3OWx4enZoVnlOMWFKZTRpT2NNVEV4Z3IvRlAwcG1HT3BvSUVCajRtd3ps?=
 =?utf-8?B?SDJqY3BIKzFGd0ZiWExXNkNHamtRNXQxUDIvOGhLRTZGb2Z5Qk1FK1pRRGlI?=
 =?utf-8?B?UEI0UXcyalRVTlgyNmo4ZHVFdFF4MEVrRSswUjFQOXpoblcrbGRYbHQ5SHlQ?=
 =?utf-8?B?RVgxKzNrLy9zbGNVOC83cXc5RVF1NjB0K1FaL0oySHoybVMvaE1sRWYzOVpI?=
 =?utf-8?B?blZESlhtd2o3dnYwalk3N0RybFBiNkE1c3VMdWRTS0F3U2VRcFZ4WWxoWUpm?=
 =?utf-8?B?V2VYaDByQStrdmVzTHc5YnhHY2NiQnoxVEg4Q1BDSUNqemJKY0s0NWdWRitC?=
 =?utf-8?B?alk0T2pzZXp4SlRRK1NmUm9peWQyVDhZRHJzU1RKcFArZVNES1hHUzlxdVh6?=
 =?utf-8?B?LzNCQjNrNkJSK0kzRXlDYmpVNzl2UE9IbXJhMElKczc1RTlMN1I4NSsrQkJy?=
 =?utf-8?B?ME1rYis3UlFvUnIwQTJ0QzdDMDRVb3UrdmNjdW1uTDgrZ1lyTW9WTThDaVd6?=
 =?utf-8?B?OGoyRHB5bVNuZHFBa1Z0OW51MFhrL1c2VHY2bms2SVlZTzhab3JQUFdpek9t?=
 =?utf-8?B?bmsycHhDYnorTWhxbEx1aW00RXd3b1ltelN2NEw2VVZjdW1NdkJtbkR6SWJ6?=
 =?utf-8?B?dWRtRC9CS1NUeDFwejBFTHR3ZDA1dGJYd3NSVGZLQ0czeTA4c3F2MTFONDFO?=
 =?utf-8?B?ZjN4ajlzWTJlbVZuLzlTYTdDR1FZdWo3VnlwTmRUbGtkUjB1dEswWklKZjkx?=
 =?utf-8?B?MGUvdit6SnNaR1VQeCtmdkptYzl1d0FDd0tUcEJOaG1XZndiWG9VVk81dUZ3?=
 =?utf-8?B?dTEzV3BFVXdCc0NhN2JWa3h3Z3RvV3c5dGlZWjVsdXo5THJIalBaUDFpeWth?=
 =?utf-8?B?NzJjdTFUTmxnU0VzanRTZEs5MlFuM2VKcFEzcXdWZEp1ZnVkK3JkM1BWN1ZU?=
 =?utf-8?B?TE9XbENDZElSS0VYZmtjOHZkdm02TnNnODNLSzJlZVdBblpIZnVuaUlrcVhj?=
 =?utf-8?B?Y04yWEc3ZXY4QTdjV2lxd0s5NjBWaU9kcTJLcTVyQXlaUEdkTGlWaEdHQVJQ?=
 =?utf-8?B?eHIxY0crWGNKSGJYSnJvN2xUeVJpcVRZT05mZmNBU0Z4NlJndWJOL0RkeHNl?=
 =?utf-8?Q?keVMKUF/VaijCe8Lerd6wwSRF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c6b1c3-0339-4673-6f0b-08db5d646db8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 21:10:12.4855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65+RxHWmUskL282OaMEdORB4crFeTRBWjoCT0LjU3/wrDmAFzd9XGiHfFfrEQjIjDSaVQ7b4l13IueF9m0opdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+Mukul]

Looks like this problem was introduced by Mukul's patch "drm/amdkfd: 
Update SDMA queue management for GFX9.4.3". Could this be a merge error 
between GFX 9.4.3 and GFX11 branches? I think the 
reserved_sdma_queues_bitmap was introduced after the 9.4.3 branch was 
created. Mukul, you worked on both, so you're probably in the best 
position to resolve this.

Regards,
   Felix


On 2023-05-25 16:07, Tom Rix wrote:
> clang with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:122:24: error:
>    unused function 'get_reserved_sdma_queues_bitmap' [-Werror,-Wunused-function]
> static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
>                         ^
> This function is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 493b4b66f180..2fbd0a96424f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -119,11 +119,6 @@ unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm)
>   		dqm->dev->kfd->device_info.num_sdma_queues_per_engine;
>   }
>   
> -static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
> -{
> -	return dqm->dev->kfd->device_info.reserved_sdma_queues_bitmap;
> -}
> -
>   static void init_sdma_bitmaps(struct device_queue_manager *dqm)
>   {
>   	bitmap_zero(dqm->sdma_bitmap, KFD_MAX_SDMA_QUEUES);
