Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8A64D846
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 10:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3752010E4FD;
	Thu, 15 Dec 2022 09:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12DC10E4FD;
 Thu, 15 Dec 2022 09:08:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dT2/BJIm4mxZ23/KYQG26eE1owiCcYsef9ZSyAdlz6An+MAv8ZvlmfW068KbyXDNmu14Cn3gYmNojA7q8hMiCoxOqCkfI/nE05BpgVB6rbQjEptgek7rqDgaNRM3L08Qj0eUZw6JQrnLI2BDHFa2D3aV0UvcglAS1ZQiik6FYhz+kbkZ0yI4/KeNp9nmP5aEmYUGwKtlMEGvr7n/sTMuB67xYgsaGmPKvMHe3S30psruvdNbzvGhSy57NwjCx/2wkv57FJ8TlN2ZeRtH5XVNWx9fOGcAMiz/A/ytipSsutxJKkHKExX4NdTG43nWC/uO+T++lMcnWq1KYMC/mIGDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBdAJNSN1KYnWFsw/UKrMxGcNfowxHIjpL+oXGlueNM=;
 b=XvGVg/b+v6foQXj/meUV2xGdE/9nBzkEHrskYDLoal2DP9OVRF9f8dLmzrEuIwsfdoHBYbvR5jTQUbvdkOCtBBRtW7GmxgaMU/wyaymZToyBywq81mRwYCiP37RopKkbtQe5tRYLko4qrEmlN1iizp+Odn7g5Gu2TRGCX4boRDC5WOneHfEdMdeMpJHdOAwYgSQf7XfrX5iX57PJbi4kcyqQ3djtvWx7MaetwgC/oa8cTQLS/56HokNf9NB3EdTLx/ybBF0gpnZqyJ2VSfrWg5EC+x0IpPGQ/6JcGY3NaSUHPY+Y9Wpww8SsUgcEHFYe/K1ibDfrJc/l57aHdX2+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBdAJNSN1KYnWFsw/UKrMxGcNfowxHIjpL+oXGlueNM=;
 b=Tego26ZxguI/Gziw4kFwzfsizzzH4V4CJ9KJoz9EN7zz55wXYfzYIDSVeCViVEnrF1GMGX2EwTXDqu/abjV0kT47VlkgoM33Rayvm+MD10DKlDgc2B2ORremyh7qNW/70FO3GE0bWVS+2rI/FylnP8rX4+rOfcGlDf6y02SMk8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS7PR12MB6310.namprd12.prod.outlook.com (2603:10b6:8:95::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11; Thu, 15 Dec 2022 09:08:08 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 09:08:08 +0000
Message-ID: <466c4ce0-9a13-7d99-768e-43f7027f4933@amd.com>
Date: Thu, 15 Dec 2022 04:08:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
 <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
 <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
 <5b5a731b-0208-58a9-cb6f-2614efadbab2@arm.com>
 <9f18f970-98c5-649a-5f2c-dc4bc26db1e7@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
In-Reply-To: <9f18f970-98c5-649a-5f2c-dc4bc26db1e7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS7PR12MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f5b8f2-76b8-4eac-0869-08dade7be200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dq1AIBHwli9uYg/hNvnu1GN1Suf9icWkS4AoVNTZuUD7sm2wJtzR0TR+eVGuEzxywimI792My2yow6/HyfgG85Ig1Y55AvF70skmxh0pM7kYSw9MkK1DGCxdRrkU88jKgqXUachMBD8uspWzlaUFWsNGv796Za7W3a9qF6x50fhwTdjYEzaiYQ+IYNe/h5tXmU2nM9P4Yap11v9U/TUHm7/9J4W2c5eyk8OjLnKuQAsOWC2bvCCiaDS2muBiJsc08aDrYq+gutOPi5K+Stw9v+KQzRAWOqWRdtxcoh/amCiwhxom+TrBVGz8H4xh0kDNReMxrZSK//MR4bbMVDKS8qiYniB8d2KSZS9bXyDha94PraVJxDap84JWszMW1Q4po8sYPv6CiU8tTFdfO2OUvyV/hRBiVVcZ0Z/9AWY3SywITNJjHyZWTgeOj+vmdS+PaAFLH5HQkjc+Ew6zSHpfV353HI0pIA32HExRpDjZnf2QOdq2eSDSVIPUkxditcNo/zmOGzSrqm+zu+qjKW3xC21M7MC9l5qG1LJgSToKNi7a+83L4cFooMS68+VyidZEph8QjjqQzbFut2IkPZskm/ygFYGpff6XIYliylOIiYino8i5sNN56KxkRiERyyV6C7JLYPGUQoTkl4jSTG3siCNslBLaJYD8M+l03wb5cV8KgnLi5rOOIFY7OrCGibkYMshh2UoyTtMfR3C0b7iDD67VWpOr+KYsAJ6/pDBPoQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(31696002)(31686004)(478600001)(86362001)(6486002)(38100700002)(6506007)(53546011)(26005)(186003)(6512007)(8936002)(2906002)(41300700001)(4001150100001)(54906003)(110136005)(66574015)(83380400001)(44832011)(36756003)(316002)(66946007)(2616005)(8676002)(66556008)(4326008)(66476007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGt3Mm5GV3dDZjExQXo2SEx3MWhYSlFuSjVabG9KUDlodEZWRlNmVERNRkYw?=
 =?utf-8?B?amZwM1VoTTlRTUFqcy9XYm9hbGw5Wnh3RS8xK0lZdTN2NVhLNXlxdUtOdkla?=
 =?utf-8?B?MVg0SmczdjV5K20wbVErRTl6L2JDYW9KbEpLSldQcWZHK2ZWS3o5c2lnZWI4?=
 =?utf-8?B?U3RzNlVXSGdoekdIUXZHV0JyVUxwK0pmcm1KQ2Rxa000eURlTXVVYzIvWEpI?=
 =?utf-8?B?ZGswVWxMVzE2MmpmcjlkaVdpTzBscmp6aXEwR2JXM0xQcThGZlBtL2N5Nitl?=
 =?utf-8?B?ZDF6eWV5RDVZc21UUzNIOERaZENNYmU0WnVhZ3NzZml4L05teWpFVDhkTUJJ?=
 =?utf-8?B?SzdEV1FLTlg3UGFXYkxZWUw3ODI4OFFHbjc4SDliWGp0TWpJT3F6VnFCeWZK?=
 =?utf-8?B?N0NVOUxTVDJkNUxwZzRxQVhQTVhrMWVENE9TYjViOHRCaWEwMlZGcFFwU2xh?=
 =?utf-8?B?b09ZeG85eGVjM0JBYU8xdjc4OWtFYkU5Zm5GTDRYck4wcHo4bHZ1RkFXbDcz?=
 =?utf-8?B?SGZKbHhjUlByM0JNOG9BZHJ2bWN3VW5DNFFOM2V0NC9jUnNCMzl3dzlGUVo5?=
 =?utf-8?B?RkFZMDdKNVhIZXVKN3F4YitodG9DcTMrZWl3aVVkTFlpWXlSNnlmbzNXVWRE?=
 =?utf-8?B?UEY2U1BDQk5DMHMzbXRyVWxCMnV0T3d5VS95azRJR2RNMWFHRlowVlRSOVcz?=
 =?utf-8?B?Z2ltQ2E4NjNKMTY2NTcvT0JqT3ZtRStRTkVUaVJ3TnVBdi90dXVHZkxzSFZp?=
 =?utf-8?B?eUdkRFJOcnFpR1NsRTlISVpvOEhFa3l5VEppWXA4Y201Zy9JK29qWFhaWXNP?=
 =?utf-8?B?NmpTU0dlUDMzOUpJOHhvWE95Yi9kMTN3aHpZU0NLQjZMcXZxVUFVcVFTYzBu?=
 =?utf-8?B?OHZ5QW5nK2t2b3JSZ2U1R202cFpobWw3Zk9wc2ZaU3BzOXp5SVJBZnp1RUtG?=
 =?utf-8?B?L2RocWVVa01jaGsvQll4RUdaNGVvRGRrNzlPaU9DQmhFSWtTRVU4Z0ZzbXlO?=
 =?utf-8?B?UThaQmNwSG8wT05BZWtCTlZrZWRwM20yU1R6MmFkVi9lcHpkbTNVdGxmSUcz?=
 =?utf-8?B?dm1BcTNldHFKUDMyNVA4Si9kcGIzc3J5Z2o5WjRXNC96bFhjc3hPTXdhbGsy?=
 =?utf-8?B?ZStPUXhsTkJ1U05NMFViSWM2Rkc1QlN3QnFjckdQbUw3cVJmVWN0UllFNkJ4?=
 =?utf-8?B?TThsWXQrVjh1YlZVV0wzcUQrNUd2UEVKM01rM1ZQc1QzbzZNaUhVNXRoay9x?=
 =?utf-8?B?cEZDVzllTWd3ZXpvZ3o0b3plNkdiUmJSN1RuSm1DclM5S1o2S0pKWkVkdW5q?=
 =?utf-8?B?SjJzNUpBYjlxSEZEK3JVb1I1N0VXeHVTcWxMa3FNUER6ZHMxb1Q2SnlwazE1?=
 =?utf-8?B?U0U4K1ZKV2xxOVRJaXhjZ3dkSys0TDQzbzQvU0EvNGRqT1VoSllCa0pzNTVI?=
 =?utf-8?B?ZzdHQTBVeXBHSlVoS3BnVThyeURwU1A0Z21JYTJqSE15aWUvMVViMXQ3VU1B?=
 =?utf-8?B?VnA0cy8xVzk4TkRuY0RqMTJDMXZiVTlzRU9MZTdRYzJodFlyTi9BYTJweEhl?=
 =?utf-8?B?SmxkcTgxampZVHlOR212TGREV1ZNRERhZjJ6VWgzWVkyWnJISloyN1VwaWFG?=
 =?utf-8?B?QWhqOG41S0NJdU1BSDNRV25OQ2cxVVp5ZHlETnVhd3RyL3M5RXJUcGV1WnNj?=
 =?utf-8?B?emRsMy8zVWVqa3ZjQytTenFKOGVHUWZ6SExhc2RpUENqYnJYSXhiN1ZzTWNp?=
 =?utf-8?B?LzVFemRNWWN5Ny8yajhYalY5RWxpUjRwUjZ0allLcjdScFBmR3lMRHVHRlVN?=
 =?utf-8?B?dFhHUitJOFZNWnROOFkzc0FUdmc1bmptVm9zRXZpNjdWT2wweHRKbGM2U0pR?=
 =?utf-8?B?KzFWTk9LWU1PK0lZYWZZbVo0MEZkSHI0RncreTQ3UUVtV3hNL2hwWVZyOHdX?=
 =?utf-8?B?M2I1RGphSkw4aTVhMGt5OGpwbTlta3JzYlNYZFVpYzM2Uk1pdDFXU3Q1aWk2?=
 =?utf-8?B?K09tU2ozQU1MTjNTTWhJSDVNR0FFVWpsYUxTYkdQSmtzdTNoWWdsMmJGYWFP?=
 =?utf-8?B?Q2JaMEE4WVdmcU93RFpwMDFEUEhIeUs4dm9OaXhMR0NyS2g2OWNlbWl5MVVu?=
 =?utf-8?Q?ggdLcQcQJB3E7IyixY4kS5cND?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f5b8f2-76b8-4eac-0869-08dade7be200
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 09:08:08.1436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 574xkQTwtvsjMKkSu6U5uQpz8iJv10jEJ3jN3P1EdwuKLxrKDMI0s3ZsbjKxy2lt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6310
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Mikhail Krylov <sqarert@gmail.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-15 03:07, Christian König wrote:
> Am 15.12.22 um 00:08 schrieb Robin Murphy:
>> On 2022-12-14 22:02, Alex Deucher wrote:
>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com> 
>>> wrote:
>>>>
>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>>>
>>>>> On older systems with little memory, for instance 1.5 GiB, using an 
>>>>> AGP chip,
>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is 
>>>>> 0x7FFFFFF, and
>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>>>> false. As such the result of this static inline isn't suitable for 
>>>>> the last
>>>>> argument to ttm_device_init()--it simply needs to now whether to 
>>>>> use GFP_DMA32
>>>>> when allocating DMA buffers.
>>>>
>>>> This sounds wrong to me. If the issues happen on systems without PAE it
>>>> clearly can't have anything to with the actual DMA address size. Not to
>>>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>>>> GFP_DMA32 would be functionally meaningless anyway. Although the
>>>> reported symptoms initially sounded like they could be caused by DMA
>>>> going to the wrong place, that is also equally consistent with a 
>>>> loss of
>>>> cache coherency.
>>>>
>>>> My (limited) understanding of AGP is that the GART can effectively 
>>>> alias
>>>> memory to a second physical address, so I could well believe that
>>>> something somewhere in the driver stack needs to perform some cache
>>>> maintenance to avoid coherency issues, and that in these particular
>>>> setups whatever that is might be assuming the memory is direct-mapped
>>>> and thus going wrong for highmem pages.
>>>>
>>>> So as I said before, I really think this is not about using 
>>>> GFP_DMA32 at
>>>> all, but about *not* using GFP_HIGHUSER.
>>>
>>> One of the wonderful features of AGP is that it has to be used with
>>> uncached memory.  The aperture basically just provides a remapping of
>>> physical pages into a linear aperture that you point the GPU at.  TTM
>>> has to jump through quite a few hoops to get uncached memory in the
>>> first place, so it's likely that that somehow isn't compatible with
>>> HIGHMEM.  Can you get uncached HIGHMEM?
>>
>> I guess in principle yes, if you're careful not to use regular 
>> kmap()/kmap_atomic(), and always use pgprot_noncached() for 
>> userspace/vmalloc mappings, but clearly that leaves lots of scope for 
>> slipping up.
> 
> I theory we should do exactly that in TTM, but we have very few users 
> who actually still exercise that functionality.
> 
>>
>> Working backwards from primitives like set_memory_uc(), I see various 
>> paths in TTM where manipulating the caching state is skipped for 
>> highmem pages, but I wouldn't even know where to start looking for 
>> whether the right state is propagated to all the places where they 
>> might eventually be mapped somewhere.
> 
> The tt object has the caching state for the pages and 
> ttm_prot_from_caching() then uses pgprot_noncached() and co for the 
> userspace/vmalloc mappings.
> 

The point of this patch is that dma_addressing_limited() is unsuitable as
the last parameter to ttm_pool_init(), since if it is "false"--as it is in this
particular case--then TTM ends up using HIGHUSER, and we get the screen corruption.
(gfp_flags |= GFP_HIGHUSER in in ttm_pool_alloc())

Is there an objection to this patch, if it fixes the screen corruption?

Or does TTM need fixing, in that what we really need is to specify whether
caching is desired and/or DMA32 when we allocate a TTM pool (ttm_pool_init(),
called from ttm_device_init(), called from radeon_ttm_init.c)?

Regards,
Luben

