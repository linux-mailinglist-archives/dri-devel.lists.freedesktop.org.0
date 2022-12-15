Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B964D967
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF8E10E50F;
	Thu, 15 Dec 2022 10:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B865210E50F;
 Thu, 15 Dec 2022 10:19:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABi946mElyFv/oJGXqGTBY+WR0cKaOOkzm8XPxPUl82QdW4IKffuB1lLsYyE9zcS+WKh2uVIlLfZrrolTU6iVr0kGnvfgZipeA7wBb59xiGdrD/6yVcygW+iacspGQYh9KvkWuiYw6+4ShB5M5l5nEeZ60iOhI01tdgG+BRC5WkzXEa4mZX8AE4kjzwb/INmu3EXWDzweLbcfaexmUsIraoqwFSaFDzyk2U4VU7DieTLOV5iTEnYRcDmWCrDR8+T+UmLEgY5rkts21/eP2FoC+MbiPfMEoSnSxGtUJkPXhD5F3eJn3maKK5X6VnDrryuErxxnznz60mMWFFOirSl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uvf+jwMIWpzmvWDoqbBN+ME/iXKT8iAJnutI70FkYIY=;
 b=NGWPvWbESgv8K9cEbhfsL0kPG5w+bm9Z7Obr763Ai2mIRxAiTJpY3cFJYYnSWFmEhf1FpHjYalvdypKAnfw40EKFXpjF2QtB36/Sf613YFPt10V/96XEc9sbpe5uPJVkfen0+zj0o5m8AOnU5x+VA/gt8bh48NP5nJyYBrpy9Vw0zUsE1L92pI/3P1P1ao6R/InGEEqkhEDvu5EokLQHNIoZIrOAvp1jGHIl6vfEoi70ati4ZRiuSH6QUvxbJXpFJMhgIlFOayIWH4pvf6x/8D9SxBAebxJQSye0Y2Chc38Esk0dHQ5SnFg2LqQq0nDXJ4qGFlEZpY6Il6HlzcLXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uvf+jwMIWpzmvWDoqbBN+ME/iXKT8iAJnutI70FkYIY=;
 b=kQBbAa8LY0Ma/HoPLbHPbHwnsUzmkQKhG7qoqwP0fILT9VlZuutI8vwb94/K8L0krbTGcYjeaTgbZ2Ew3YWVCP2vLobuvrcypaCoTIJq0zRcCiSo4Oiy5ST9mvxgCDHcUsg4tlIFy3vvJf3mZwvl05+HtXd19coY5fv7l87BCAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB7796.namprd12.prod.outlook.com (2603:10b6:510:275::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 10:19:46 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 10:19:46 +0000
Message-ID: <de9bf189-c204-f499-f027-1320e2faaa20@amd.com>
Date: Thu, 15 Dec 2022 05:19:43 -0500
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
 <466c4ce0-9a13-7d99-768e-43f7027f4933@amd.com>
 <02c45581-f988-2c10-17c8-dca6836acb00@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
In-Reply-To: <02c45581-f988-2c10-17c8-dca6836acb00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::11) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ac0a25-4b82-412e-52c5-08dade85e3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CFBaD/eLOn6TXh07KFXjEV5X0iOXKsqQCYR44+f25sX9n50gCBVEhyHmOdsFC7oJYv76AHZYR/b59ebGkkTPU/UvMw371eTorZoTn2JtBkztmIqk5M67iXPhgCTRAsHUs5P/KjduH7F3W15QEc+xi65x4NsoMrrN/X2h2QOsniRnaxKlqDYldyO9bsb8GwfMfQA4zYcZXuB6GsWu9X6KQqoQ/mE5zEKVbEylmHkXzP7C9vdl5d3+jbC+CqNNZfaYy3ZhSIa+odQ+xR8XUQr3C3jxerdUMzuJk0pNpCKzJHMnGieW/Zx+BKXD84jT9mCJ0LgLiwhbPGOP7RU6mClyhxl+oYF6uc5SbBiLA6TBVVWKA0mLiSjfN63sTQ4u984VQ7g4QeM8/rp+cABkmm4m3WLbc3TmzmiA0PHNoyMs0For6YCedppLIqYT89ZqYYvto16QIm5ORiKBeE3XgJgroEdJ7eyOCBNT9F6YtxcrirgqUJg6UHRz0yYilxEbeydw42Jp3Rxzg4598RtXX2BLHmPcybAAUKpUVm1bq9p8aUVQ4rdiAzDyoy365tN8cckHByVXmLUBOexksY1Jgu0S2V768w5pxzaFkpgWAd5rIchZllph9MgE3vmB4pqPqYB+7fj0tyolFeOzTVb2JM09ym2lybzTa5qQa/4qIp3MCTUtYCdm4A745zaxlKVvLCyFhbp8Eh4msW8zNxJIeP5a2bIWd6pJLFaCdH5SCs9jNM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199015)(44832011)(31696002)(2906002)(86362001)(4001150100001)(26005)(6486002)(6666004)(53546011)(2616005)(478600001)(6506007)(66574015)(8676002)(66556008)(6512007)(66476007)(4326008)(66946007)(83380400001)(41300700001)(5660300002)(8936002)(38100700002)(316002)(110136005)(54906003)(31686004)(66899015)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGpSTVZOcGpZYkNOMVY3aGVobExXQVVWVldXQ01yWGl0Um5SSUJveHFiSnY1?=
 =?utf-8?B?QzlQUjFBamZJMFA1Um42Tms3ajIvRS9TdVVrclU4eFpuLzMvWTRwRWl4akhJ?=
 =?utf-8?B?cEkvQ2RDem0zTVowaG41NkFkQUYvRTJCSTJQV2owODI3WDdpa1NMSGMzL0Zy?=
 =?utf-8?B?dlZEdVRYRmNPZUVIbW8reXNPeWVQS21ZcTlaVWpSOVlVNS85bks2UXBOdnM5?=
 =?utf-8?B?OGR3UlRaSzhDUkhKYklwci9IRU05OG1BcmlsVFNCdHRReUx0UUN1bzFiNFNX?=
 =?utf-8?B?YnJNei9LUzBDTzhkUm5OQ05MMFNxdk1OdUlRaURtWXJDZk1uQnJDdndKbXZN?=
 =?utf-8?B?KzBsdTF1RjB4K2FOVklYbXoveEZ1TS9yU2ZDWlZmMi9PK2dRNTJOZFhlRnA4?=
 =?utf-8?B?YndtM2V0VHJCRi9PWEV0RWhkUVRKa1R6c0lGQlpoeWMxb0loakQ3YStHN2Jw?=
 =?utf-8?B?cFp0TlpzTjRoV1V1dlVnVGlLT1JjdmgvNUJnZ2dyUTJvYzdTNC9ranlOanYr?=
 =?utf-8?B?Wk5TWGhKeTFwK2pPSENSZHJBV2ErVnVoamVTbkdVdVY2MGtXeHp4RzQyK3VN?=
 =?utf-8?B?dlF5Q0RtdTZJOVlZd2wxWFZ5dGJVVldJWThJUVhFSDhlUnBQdC9FMWlldnZr?=
 =?utf-8?B?NmdJcloxNjVKdXAyUVYveGtXYXJOaU0reGQyb0pBZnZtU2lmYk1QM0FTRXpE?=
 =?utf-8?B?OUxyVXMvZ2RMbXRiK3pPaXN6cVpzU3Y3TFFmTUdNdjVLT2I4aGVWRWF2cytE?=
 =?utf-8?B?RnF4Q0s2aDdSYnV1MkozUzJ2cTFLb0U2Z0RVNDZ2eXBJS2VTUE1sdUZDQk1n?=
 =?utf-8?B?Z0lsa042UFYySlEzbnVVUWlVWmdxOHhWTVFEUXJQdkFhaTdRUkRkSkpyQnN4?=
 =?utf-8?B?am1USUoxQzgwY1Q1RERmL3VUMEM5UW9pSTdjWmRSZDhNQXJzVTk4S0NyZXdn?=
 =?utf-8?B?N0IrcVZOYlNJL1QyNitIZ2x0bnp5L1NnRnNqb3p0THc1c2xSNlNVVG1xMHBl?=
 =?utf-8?B?N3VHcHB1WXhnVy9NeW9FeVd4a2diL3RDazV4WE9DZURLaDdpemNUNWFtVHRw?=
 =?utf-8?B?d2V4c1NWZnBCYTlnK1krMU84Rk1sQ0U2aGhIeFhjNTd5aW1EMG5rb3Y5RC9y?=
 =?utf-8?B?UHhoQ1QreENkMVhPS2dyL0JlY2F2TXplQkhDNU1yNW9IWEFrNXh2YUg2a2JX?=
 =?utf-8?B?ZTBQejhQQnE1OGQ3akZ4cEw0YTBkMklaTmh6cGlheWVrbHNQK0pZYllCRWh6?=
 =?utf-8?B?dEZNbUtPcVVPWFk2SU5qeEFSeVZ3WnVPalJvRVozTHdZUUZXNE5OZWoxSnFr?=
 =?utf-8?B?RGdzMWt3TEpvWFNwdHpnajJGdTB3RWdOdXlmWGxIY1VHeXRLUFdHSGFpMC93?=
 =?utf-8?B?TTFwSGxjWFFOYkVDQW9EZk1kMXRnNzRiRHF6QSs2SEtzZ0hKZmRETVpGK3hl?=
 =?utf-8?B?eHhPT3hmRFdtSXJidW05R08zK1VaYzVySjl3UUhSaTRqdXRLdklDSXRsSE9P?=
 =?utf-8?B?R1U5MUl4SUF2aUJyc2x6Y1BaR05oOEdQN3M5OXB6NnBsTXBZck0vdkxnSS92?=
 =?utf-8?B?aHNvQjBVdmpJYmpObmlkUlJ1OVpNQllTZCtPRHErd1RzVGlJZHp0QUhVaHNJ?=
 =?utf-8?B?Q2VMNDZGNnFCelFvazJHbE9ybS80cGFRRWxpQVNqYnJ4WUsrRU9panh4RWEr?=
 =?utf-8?B?d3BHdmViQm0rS3lYeldMMTVKRTRZbUJlWHVXRjJMcXFpeEVSZkxiVm9YeFpn?=
 =?utf-8?B?T2RoTDkwVGlSMlFvd3Niclc3V2owTXRjM09ObmJERGx0bU1PeGZ4TWdvUlZ4?=
 =?utf-8?B?R0U0T1BZWmZtVmVKc2huZmlWTGlSVFAxR04xcThpdkEzSE9vV3pMYitLRERN?=
 =?utf-8?B?SHJTc25vRVZuNVdoMTR1VzBJbkt1MlZWTEpMOEhQNHB0cmZCeVdZeXFXeUxV?=
 =?utf-8?B?UDdRZEd2a1dISlVpN3JyNVJYVXpKTEplc0h1cVl1U0JoM3JmSXprMnp0WXVU?=
 =?utf-8?B?c1RITEF4ZDJwalBnaEhxd29lN3hreUFJZTdwZ2FOSlBDd3p5SDlpd1Rpbzdp?=
 =?utf-8?B?bjdjYVVEci9qMWcxb0pkbVYrWGg3V0xmTVpoeEVRaWdGY0dYVmhXSEVHNGNZ?=
 =?utf-8?Q?57yND8VZO4KSuT7yHgZlx9x4/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ac0a25-4b82-412e-52c5-08dade85e3f8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 10:19:46.4627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WUfL5mgjdxMHdZP62B/8Ob+A21rbTHEldE8UvgPNu/K7yBgn89+VlvwmIPiH91o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7796
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

On 2022-12-15 04:46, Christian König wrote:
> Am 15.12.22 um 10:08 schrieb Luben Tuikov:
>> On 2022-12-15 03:07, Christian König wrote:
>>> Am 15.12.22 um 00:08 schrieb Robin Murphy:
>>>> On 2022-12-14 22:02, Alex Deucher wrote:
>>>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com>
>>>>> wrote:
>>>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>>>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>>>>>
>>>>>>> On older systems with little memory, for instance 1.5 GiB, using an
>>>>>>> AGP chip,
>>>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is
>>>>>>> 0x7FFFFFF, and
>>>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>>>>>> false. As such the result of this static inline isn't suitable for
>>>>>>> the last
>>>>>>> argument to ttm_device_init()--it simply needs to now whether to
>>>>>>> use GFP_DMA32
>>>>>>> when allocating DMA buffers.
>>>>>> This sounds wrong to me. If the issues happen on systems without PAE it
>>>>>> clearly can't have anything to with the actual DMA address size. Not to
>>>>>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>>>>>> GFP_DMA32 would be functionally meaningless anyway. Although the
>>>>>> reported symptoms initially sounded like they could be caused by DMA
>>>>>> going to the wrong place, that is also equally consistent with a
>>>>>> loss of
>>>>>> cache coherency.
>>>>>>
>>>>>> My (limited) understanding of AGP is that the GART can effectively
>>>>>> alias
>>>>>> memory to a second physical address, so I could well believe that
>>>>>> something somewhere in the driver stack needs to perform some cache
>>>>>> maintenance to avoid coherency issues, and that in these particular
>>>>>> setups whatever that is might be assuming the memory is direct-mapped
>>>>>> and thus going wrong for highmem pages.
>>>>>>
>>>>>> So as I said before, I really think this is not about using
>>>>>> GFP_DMA32 at
>>>>>> all, but about *not* using GFP_HIGHUSER.
>>>>> One of the wonderful features of AGP is that it has to be used with
>>>>> uncached memory.  The aperture basically just provides a remapping of
>>>>> physical pages into a linear aperture that you point the GPU at.  TTM
>>>>> has to jump through quite a few hoops to get uncached memory in the
>>>>> first place, so it's likely that that somehow isn't compatible with
>>>>> HIGHMEM.  Can you get uncached HIGHMEM?
>>>> I guess in principle yes, if you're careful not to use regular
>>>> kmap()/kmap_atomic(), and always use pgprot_noncached() for
>>>> userspace/vmalloc mappings, but clearly that leaves lots of scope for
>>>> slipping up.
>>> I theory we should do exactly that in TTM, but we have very few users
>>> who actually still exercise that functionality.
>>>
>>>> Working backwards from primitives like set_memory_uc(), I see various
>>>> paths in TTM where manipulating the caching state is skipped for
>>>> highmem pages, but I wouldn't even know where to start looking for
>>>> whether the right state is propagated to all the places where they
>>>> might eventually be mapped somewhere.
>>> The tt object has the caching state for the pages and
>>> ttm_prot_from_caching() then uses pgprot_noncached() and co for the
>>> userspace/vmalloc mappings.
>>>
>> The point of this patch is that dma_addressing_limited() is unsuitable as
>> the last parameter to ttm_pool_init(), since if it is "false"--as it is in this
>> particular case--then TTM ends up using HIGHUSER, and we get the screen corruption.
>> (gfp_flags |= GFP_HIGHUSER in in ttm_pool_alloc())
> 
> Well I would rather say that dma_addressing_limited() works, but the 
> default value from dma_get_required_mask() is broken.
> 

dma_get_required_mask() for his setup of 1.5 GiB of memory returns 0x7FFFFFF.
While the dma mask is 0xFFFFFFFF, as set in radeon_device.c in radeon_device_init().

> 32 bits only work with bounce buffers and we can't use those on graphics 
> hardware.
> 
>> Is there an objection to this patch, if it fixes the screen corruption?
> 
> Not from my side, but fixing the underlying issues would be better I think.
> 

Have they been identified?

>> Or does TTM need fixing, in that what we really need is to specify whether
>> caching is desired and/or DMA32 when we allocate a TTM pool (ttm_pool_init(),
>> called from ttm_device_init(), called from radeon_ttm_init.c)?
> 
> Could be, but it's more likely that the problem is in the DMA layer 
> because we fail to recognize that the device can't access all of the memory.
> 

Right, I agree. Ideally, setting dev->{dma_mask, coherent_dma_mask, bus_dma_limit},
should be sufficient to tell the DMA layer what kind of memory the device
can handle.

But this patch doesn't change non-local behaviour and as such is local and safe
to apply.

Regards,
Luben

