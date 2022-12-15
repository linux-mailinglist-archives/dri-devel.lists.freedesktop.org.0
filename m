Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4164DAD9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 13:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5AA10E542;
	Thu, 15 Dec 2022 12:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC5210E540;
 Thu, 15 Dec 2022 12:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpYaOrNbVAFClfs+CxqwIIfk0AbDO3m4VU8hmJFdjq3CC2b+yyjKnt8rbkDiEBzgcfPcvujNCqVTBzCvS+JIS7LLY7xKjhiiy6LssLI339YSvDvHxZzF+68TTb5YqJCN85P7AcperkpBIY0M/RM9oXMoxhL276b0hvZ/CmubjJ7n/YIX+pQr5JX+PtRkfe1KGzx89PUwqiZN5MLj/CwVu9SlYUs8VnUGtw3u9AuNpWCPzHxMCcD20Oy4xzn4tw1UZcOKm+iPqnqi69P7IRL3Wy6O+6nQboVAxpzT5CFF9O6il8mAP7qtpXqh7vjKCC8B0Rzt3CftKNFxgORm6adYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02iEdrll8Jcdu8nEC3EYswPW+i45nvQfzDlvYkPgtzo=;
 b=beP8scJxHXWeboXjPTxZsIKSKuGJIwm4FsDK2+D6oGtwuRQHrmcVA7DM7aDmJRYX7XIPUo+Q8eYU4jfmY/agPwnK5Ub6I+lVEPA8mDjVkSVDCBl6usM5Lz5N+05CbhDk7GaNw7Zo2uvv9x9azmXfsUqFvASyKbpHaNLWhfjEgGlOYNfC0Zyz7eaRzZvHCI3ZQcxmafkE5t5fbgL4fUhENt3NWAFZtfENiW75/h6o+XS10PuJZwNKaCGh3VrfpTctlb5gFDSdLqU0CCxpj3HlSt+/thP3Xqvg8Su/WdFDGatL4MMv2bzOi51/fCBabuMk4f/xOsQ8+l/gsCfuG0OVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02iEdrll8Jcdu8nEC3EYswPW+i45nvQfzDlvYkPgtzo=;
 b=FmXjXxenbEwovf0vnOtol2I2mpIClCUpbJHAWFaWV+1cVCkGqU/5VGjGmFDxWhZgmB8rG1CXi9qOPVNPS7kbNs+kF1BewdjYgMJjzz5m4o2y7FBxfeJm8wRDjWyv3G7fa2oFJ8G+C2goaMuod0xG5xlt9pSW+QHcUFARurdQUyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 15 Dec
 2022 12:07:36 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 12:07:35 +0000
Message-ID: <658a9226-98df-fd09-957b-14fa7fbb9f87@amd.com>
Date: Thu, 15 Dec 2022 07:07:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-CA
To: Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
 <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
 <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
 <5b5a731b-0208-58a9-cb6f-2614efadbab2@arm.com>
 <9f18f970-98c5-649a-5f2c-dc4bc26db1e7@gmail.com>
 <466c4ce0-9a13-7d99-768e-43f7027f4933@amd.com>
 <02c45581-f988-2c10-17c8-dca6836acb00@gmail.com>
 <de9bf189-c204-f499-f027-1320e2faaa20@amd.com>
 <20f15c8d-fbe5-8dca-39dc-dc67fff2eca9@gmail.com>
 <80e10a8d-275f-8e3c-8b91-f5f6d6729dee@amd.com>
 <e15133af-d3d9-de47-b01a-bca9053b0d8f@arm.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
In-Reply-To: <e15133af-d3d9-de47-b01a-bca9053b0d8f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc6347a-c108-4d03-3a83-08dade94f414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3+mh0V54HpwHfl6cCwspcT2AlN5nXdWq30geOVSqWGmdrHvhKp3MqgKzlcto3iekl/s6QhKsW6cDRd67pmqxWp+hkLwTs+HiFMFBBk3t3rceW+3WFuOph0KulgEjQeITIZoI3NtPud1xl2lA1A0I5fC4eDwR6tIJMhRhTYYRhi/ah7u3SaOFpTq9GwCAGm9nIiSyvYUy/LJutA7JI5aOwDvArHblmxQ6FtwF/Fu3GzMxOe0eKqfzUwdl24CtTQo5SQXiedOdLoT27BqKzHp1LtihHY3qnFfpgqh8sVO0DsafYaJM25aUX/a73TAQafQl/9D8emYnDrOpUGMK4OzmL0mv06BUvSXJPSslDoxxo/jQs+16mx4JEQqe3JiQ+k7yCv/t4brzD1nfv+Q0kOEbGSU32vO6NwPjSBgCwzGWszI9lFjUVTFt34PdKlbtANG+4aS+F0lXOsu2JyadkCi7Vv6+v58xRCVKY5Z7/IVN2buMFXZVXvx3leGm31Mi2nnMc7xXPD9Dz0c1wUAkq602gsai8cNYY6l/zldvvOHRdhExJOIVKUerhF4KW6eR+J7EOuoTzOnjKFyql5VGwqcLQVKS7vjAFpVngK4vqdDetAMHnYYEl8yvikAZj0nHAlm8oswWyxQRTqNV/ouPEf/rnIsIwLhfH4XUk0KnkTj9XFHfwuxYqST4kpOObCGFDE8gTQwTE9XnRzdhF+B2jqerUwEh5P8wq/cAT3aGPCavZZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199015)(5660300002)(36756003)(86362001)(31686004)(44832011)(53546011)(2906002)(186003)(83380400001)(31696002)(2616005)(316002)(66556008)(38100700002)(4326008)(110136005)(8936002)(66574015)(4001150100001)(6506007)(54906003)(66946007)(6512007)(478600001)(6486002)(41300700001)(8676002)(66476007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3Z1bmRDNXRjZUxBcFAxSUd1bkp6Nm94TWpaY1UyeVg1UjZDZFBsNzRTdmly?=
 =?utf-8?B?dE9mTnpMNldhWWsySTlGcmcwU2V4bitnazNwQUNoeDlpVkF4dEp3cXVMelIw?=
 =?utf-8?B?TlI0Ympnam0vNlFvZ2V1aE9hTmNIMnlsQ1NYMzBxcGFJbFVmYnRLalk5ZTRV?=
 =?utf-8?B?OHIzWFdIMWxnMStURVAwZ1hMc29qdVluSWJESkNKTG50UWVDVFA2VmdUZ1h4?=
 =?utf-8?B?SWU1QURMYjhsMEZwZ0hGZW1HbE83ejZuK1htRWorc3YwOUdQSWo1UXI1b0NW?=
 =?utf-8?B?bGhEQ3B0SW85UUkwNWdhUnorOTRsV3hTUFpLWkx5K3gvVmlXRzVpV3NPaDl2?=
 =?utf-8?B?NFAzdnFvcWpjbjFySjlFcGtiSlIzczJ0Q09CV0g3T0pGZG5ZZ3JhSEtDR0Vp?=
 =?utf-8?B?eHJlZ3U4a3cxV1llaGNQWnUvcllUZkZkbUplZkR2UkN1SW13QWxzL3pVNTBw?=
 =?utf-8?B?aEJNSVdTTFZUU1FrMFBTeDUweVJMV2tiZXErRGNUV1QyZUpGRkxjcmlpVThr?=
 =?utf-8?B?cnpIcGF1bXBBaWtWcVVRRk1LMExqN25yZ3ZQeFoxRUFNTGFDRTkyL003anQz?=
 =?utf-8?B?OFZyRUVuTHNTUlcxaUlIZjI4aVpGbmtxMi90ZXNWTGtCdk1FNzJyOStkL0ZP?=
 =?utf-8?B?WU1wdUwzdjZaeFdFUTlLOTFVa1hYM0FySyszaVBXdXcrUTFTenFINjVVQldY?=
 =?utf-8?B?L2hxNXM2TWF3V3RVenN4OUxFckNxOGFMblRocG85SjFmUW9xdHJaYXMyQ2Va?=
 =?utf-8?B?aGhKR0V5bGc2dXFjSEg5Tm1oN09NbE1qYnowZ1pQK2FtZjBpNXVIaWJQaSsy?=
 =?utf-8?B?TWN3N09WbXppNmFiQis5UFg0Nll0dm5vZkFRdTcvSmE4M1RrNS9VMXZSVG5p?=
 =?utf-8?B?UWdnWFVLRm9oeEJmT0xMMkJ4UXZDLzI1OXJXbzRUK0loUGVuWjFsS1QrbUVS?=
 =?utf-8?B?cUczeDlGRk9pcWI4UHpUa3ErdTRZNGg5b3RkYmk0cCtPL0JKMG8wRUZlVFhq?=
 =?utf-8?B?OG81S3prSzc0OUJIcXZUbnBiTk03ek84UnRROG1PZmVOMlAzdFlycDdjT01Z?=
 =?utf-8?B?bXR4Z1l2emt2TERLM1VrNVJvODJEMFV0RS9yY3lZSjRxM01SNDhYOW5VSWpM?=
 =?utf-8?B?dGlwbmFmdC9BbTZnK0UxL2Z4WnpLNWxQSHpOSjdmeW1JZm41Uk1UMGJWeEw4?=
 =?utf-8?B?UmI2eVl5c0VuNDdDWXdBbEJRdjNyQ0UzMC9IbWUvRjJYZDdDMzYySk9SYlJt?=
 =?utf-8?B?SFhibUdJaXJYMjdYWkRGQjBEcWdmdDZTc3VNeUJhdVNkR3NZV1B1NGpYbzZS?=
 =?utf-8?B?cU12eVFUb0xnUUs5OHNMVExvK0dESGxVd0xzZG52Q25ENGFrTXM5cnNQeERh?=
 =?utf-8?B?Zks3VmhJTUtISnpNWCs5UndvVjF1NjBPQ0xIUWpLTStnZVkvUTFCWGI2cTM3?=
 =?utf-8?B?di9BQ1I4QmoxSE82UmtJTnV6Sy9jaS84ZjlIK2k0QzFlcWQvYjBiWEFPNS9t?=
 =?utf-8?B?QVRVVGlOK1RWdXJaMkc0ekdPb0RrQUEwQ1NoODB6MEx6YkJjc1Eya2FrS2Qy?=
 =?utf-8?B?Mk1qN0ZjUkxENWFrVjNZc3FFaGhBd2phVzB6RldRQTJXR2VxT2VDRDVFcExH?=
 =?utf-8?B?UnN1Um5NOVpFdFNKWmZRaW9TZkFrOHY2Mmw2OU9nQk0wYTk1QzlKSDBNc200?=
 =?utf-8?B?U1hwd3dYcGNhdGNUbE5Xai9lakM3OGhjVFRoWXpJVTJnM0pnelFJMTM5OUpl?=
 =?utf-8?B?ek15cFRROWdzWjFHQVJuNldESm9UbmFJUnZsTzhmcHV3a0NEMDBqelpJYUMx?=
 =?utf-8?B?anh3cERTZWpZUnNrSlJ2cUE1d0hZa0xvaVRNMXNFTjFsTWVBU2xBYkZSZVN6?=
 =?utf-8?B?MGM3bnl5MVBJa2N5cnlBZFZRWHZHRHY3ZmNkYytYTzEyNERUQTl6TVVFdGF4?=
 =?utf-8?B?Nkd6R2UwTndXb1ZwYlRHM2ZiWTdGZlZYUXJnSUhGYWVnM3BFenJZZzg3WlZz?=
 =?utf-8?B?T0gwQ1M0d3g2WkgzVUhBKytZWDl0Vmk3R1R1Slg2cFh2VHhnZlk0L05pSERi?=
 =?utf-8?B?cDRLVG5uL29iaC9ReXB5SkVkODNpbXcwR3VMdWJORSt0TytKOWVyTzAzYTZU?=
 =?utf-8?Q?401bQS1D5cDa7NpMc78ADgzV0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc6347a-c108-4d03-3a83-08dade94f414
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 12:07:35.9088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wHkDD+dBdLiuZPUVwkKUrlMu2gLBw96rQUVAf32H6YBqzKfOKYLrIB51klkNzqE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079
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

On 2022-12-15 06:53, Robin Murphy wrote:
> On 2022-12-15 11:40, Luben Tuikov wrote:
>> On 2022-12-15 06:27, Christian König wrote:
>>> Am 15.12.22 um 11:19 schrieb Luben Tuikov:
>>>> On 2022-12-15 04:46, Christian König wrote:
>>>>> Am 15.12.22 um 10:08 schrieb Luben Tuikov:
>>>>>> On 2022-12-15 03:07, Christian König wrote:
>>>>>>> Am 15.12.22 um 00:08 schrieb Robin Murphy:
>>>>>>>> On 2022-12-14 22:02, Alex Deucher wrote:
>>>>>>>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com>
>>>>>>>>> wrote:
>>>>>>>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>>>>>>>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>>>>>>>>>
>>>>>>>>>>> On older systems with little memory, for instance 1.5 GiB, using an
>>>>>>>>>>> AGP chip,
>>>>>>>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is
>>>>>>>>>>> 0x7FFFFFF, and
>>>>>>>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>>>>>>>>>> false. As such the result of this static inline isn't suitable for
>>>>>>>>>>> the last
>>>>>>>>>>> argument to ttm_device_init()--it simply needs to now whether to
>>>>>>>>>>> use GFP_DMA32
>>>>>>>>>>> when allocating DMA buffers.
>>>>>>>>>> This sounds wrong to me. If the issues happen on systems without PAE it
>>>>>>>>>> clearly can't have anything to with the actual DMA address size. Not to
>>>>>>>>>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>>>>>>>>>> GFP_DMA32 would be functionally meaningless anyway. Although the
>>>>>>>>>> reported symptoms initially sounded like they could be caused by DMA
>>>>>>>>>> going to the wrong place, that is also equally consistent with a
>>>>>>>>>> loss of
>>>>>>>>>> cache coherency.
>>>>>>>>>>
>>>>>>>>>> My (limited) understanding of AGP is that the GART can effectively
>>>>>>>>>> alias
>>>>>>>>>> memory to a second physical address, so I could well believe that
>>>>>>>>>> something somewhere in the driver stack needs to perform some cache
>>>>>>>>>> maintenance to avoid coherency issues, and that in these particular
>>>>>>>>>> setups whatever that is might be assuming the memory is direct-mapped
>>>>>>>>>> and thus going wrong for highmem pages.
>>>>>>>>>>
>>>>>>>>>> So as I said before, I really think this is not about using
>>>>>>>>>> GFP_DMA32 at
>>>>>>>>>> all, but about *not* using GFP_HIGHUSER.
>>>>>>>>> One of the wonderful features of AGP is that it has to be used with
>>>>>>>>> uncached memory.  The aperture basically just provides a remapping of
>>>>>>>>> physical pages into a linear aperture that you point the GPU at.  TTM
>>>>>>>>> has to jump through quite a few hoops to get uncached memory in the
>>>>>>>>> first place, so it's likely that that somehow isn't compatible with
>>>>>>>>> HIGHMEM.  Can you get uncached HIGHMEM?
>>>>>>>> I guess in principle yes, if you're careful not to use regular
>>>>>>>> kmap()/kmap_atomic(), and always use pgprot_noncached() for
>>>>>>>> userspace/vmalloc mappings, but clearly that leaves lots of scope for
>>>>>>>> slipping up.
>>>>>>> I theory we should do exactly that in TTM, but we have very few users
>>>>>>> who actually still exercise that functionality.
>>>>>>>
>>>>>>>> Working backwards from primitives like set_memory_uc(), I see various
>>>>>>>> paths in TTM where manipulating the caching state is skipped for
>>>>>>>> highmem pages, but I wouldn't even know where to start looking for
>>>>>>>> whether the right state is propagated to all the places where they
>>>>>>>> might eventually be mapped somewhere.
>>>>>>> The tt object has the caching state for the pages and
>>>>>>> ttm_prot_from_caching() then uses pgprot_noncached() and co for the
>>>>>>> userspace/vmalloc mappings.
>>>>>>>
>>>>>> The point of this patch is that dma_addressing_limited() is unsuitable as
>>>>>> the last parameter to ttm_pool_init(), since if it is "false"--as it is in this
>>>>>> particular case--then TTM ends up using HIGHUSER, and we get the screen corruption.
>>>>>> (gfp_flags |= GFP_HIGHUSER in in ttm_pool_alloc())
>>>>> Well I would rather say that dma_addressing_limited() works, but the
>>>>> default value from dma_get_required_mask() is broken.
>>>>>
>>>> dma_get_required_mask() for his setup of 1.5 GiB of memory returns 0x7FFFFFF.
>>>
>>> This 0x7FFFFFF mask looks fishy to me. That would only be 128MiB
>>> addressable memory (27 bits set)? Or is there another F missing?
>>
>> Yeah, I'm missing an F--it is correctly described at the top of the thread above,
>> i.e. in the commit of v2 patch.
>>
>> 0x7FFF_FFFF, which seems correct, no?
>>
>>>> While the dma mask is 0xFFFFFFFF, as set in radeon_device.c in radeon_device_init().
>>>>
>>>>> 32 bits only work with bounce buffers and we can't use those on graphics
>>>>> hardware.
>>>>>
>>>>>> Is there an objection to this patch, if it fixes the screen corruption?
>>>>> Not from my side, but fixing the underlying issues would be better I think.
>>>>>
>>>> Have they been identified?
>>>
>>> I'm not 100% sure. I think by using GFP_DMA32 we just work around the
>>> issue somehow.
>>
>> Right. Using GFP_DMA32, we don't touch high-mem. I was looking at the DRM
>> code trying to understand what we do when GFP_DMA32 is not set, and the immediate
>> thing I see is that we set GFP_HIGHUSER when use_dma32 is unset in the device struct.
>> (Then I got down to the caching attributes...)
>>
>> It's be nice if we can find the actual issue--what else would it show us that needs fixing...?
>>
>> So what do we do with this patch?
>>
>> Shouldn't leave it in a limbo--some OSes ship their kernel
>> with 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations") wholly
>> reverted.
> 
> Removing dma_addressing_limited() is still wrong, for the reasons given 
> in that commit. What we need is an *additional* condition that 
> encapsulates "also pass use_dma32 for AGP devices because it avoids some 
> weird coherency issue with 32-bit highmem that isn't worth trying to 
> debug further".

Yes, you had a patch earlier which did exactly that--why not push that patch?

Q: If host memory is 1.5 GiB, i.e. mask of 0x7FFF_FFFF, but the device's mask is 0xFFFF_FFFF,
shouldn't we use GFP_DMA32, instead of GFP_HIGHUSER?

Regards,
Luben

