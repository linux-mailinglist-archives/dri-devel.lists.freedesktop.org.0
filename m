Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0311674AA1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B4310E042;
	Fri, 20 Jan 2023 04:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D39D10E042;
 Fri, 20 Jan 2023 04:32:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cntILcuxdgAM3ME+EWXkr9eTH8pteyjLwP5nITjEaLuDWuUUt+p6+GWrRPx52Xh0/tPgtt84TtKD+/ReukSOeszeqBnGvZyeVnIJpj8nQQATtumoxvsIsnOP5jewUK8KKWknUqFcUwsD2SkCZzj2G4hVKKJWIzCkeRwUJJE/myaUjS5LGFZ8+IL2GjGrA8Lbo2f/x5okevAfN7xmJcZWXAJUtbP/BKS0MIZWxTuV64QWZPAFTyWuOJoH4oaGp50cAb47GF8AxHnQlF2CRgY3GGKNCbmdnonOuaocQ3hHXxJ2ZX8ZPq8fsqyGjYPtTHYJ24jCOPtZDpJEGAtk8qEYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg2oDMX3BgKuhsYWdybHzm82tipbx8On3ZCCgz8eVEg=;
 b=dyDegadz58iwtT8bDdmrVt9WXAlLYN1G1+0zcw9TtnNKI9zSGMtPtej5xMJlcqjkFVc6gitX0/MpQeULsjyZaIXitiyXy920+a0oE/ygRW2vvH2tOop84r79Fq656Y40t+YUy7dxMXcwaNv4QzSwozF9STlp4qQ04NeDSImIrByVscpdyKdrdD/DsMpKkJz7Cx6p0h1GWZmZ9k88CWLePyGkxepmfQEd+CVJsQSNd3jZNNAiZH1rVG5miRaaIAtwRC+X6jD89sg9GS6w9ZNdbF9XLgz0tjfHCFcSlUmpaKJhQw3bMi90D6aw2EStc2YGp31mdyme+etH/Iu9a5cObw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg2oDMX3BgKuhsYWdybHzm82tipbx8On3ZCCgz8eVEg=;
 b=NVAJhhzf8KmQHugRR3JSPTXlznlUxfjBHu4ZM7GOrsx9fc+OmeGLF0okbveBzMPqcTbCuK1z08Qyjfm57j6eCdaU2nn8668jFlt3k/I9i+3JV+GSI0SygRq3wXpz6FR49RRNuInyZhNTb+LocwpLeEXGjBSN7lYryjyF10GDOrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Fri, 20 Jan
 2023 04:32:08 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 04:32:01 +0000
Message-ID: <1c69a5c5-98da-90e0-f7a4-00d04dd52f23@amd.com>
Date: Thu, 19 Jan 2023 23:31:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-CA
To: Krylov Michael <sqarert@gmail.com>
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
 <658a9226-98df-fd09-957b-14fa7fbb9f87@amd.com>
 <20230119195638.021757e5@laptop.sqrt.uni.cx>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
In-Reply-To: <20230119195638.021757e5@laptop.sqrt.uni.cx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1P288CA0030.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN2PR12MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: 293d4d33-7acf-47e5-88e0-08dafa9f4658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5G58/fTc0hCX4MOe/Fhiwmxwfuu0vqIq1qO1sNK6KCsgEHBJNuadWbNZNwQfr5z9kbDzJn3S1AVy+6aMYkulWKEB+EwXD1ZfnIZBfnD1TuzEOirzRSmk/82W0olQoQ0/9gPtq9MvpuZFSSGGUh146T3AEuxDltHted8gZz/nDzi8h5jijE0suKnVamylQXgMPc2k6Ezzk1cEVDQIgBgtSl6Atcb5+1Uoah941yJ7Cf21IvjAsfeVYiKFsPp3DpGlNkSvSTRj87C1miqTUHUYZvIN7D1Nrm7WCXqFsMQkthimWMxAZVtuY1vQbP4Gi9TeeKas3oWGiHhWN6jMUU8jsN5hYnHpECACHMVPI4JQ8ybapmQCkXZsOMfS8MORJuS4i/8tKBMlj4ZraEb7rtAMPYjLLIg7MEI+25oT4L1aiKosYZT5CeBJABI9dT6cdu1bLcW5Snq5asxJpEaNydbZsNygwGmnKY1jwBDYMsl17NKHoFU9sCIdGQLN9In/ypQjhOfi3HeMDZNqc1hHrBOuyey/ei+WivMhmsJXkBI75Y1txpku+oEruYjodug0Fgp8n+chOIebonfJxIlfuOJuKYmir6pn8B6WKI5cBtGXPckP+NCGY6lC2LPBrLZHrAUF+aCF3D1GJidIkKBETRqadZUHq0QUfJwSgJfaaUzGwHhuTrqIejdPU/dxsRzuqLLFVtKpG7LrFrBgGSMkRnxSAbB6FR2NthVH3MQ1sfn85Pc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(36756003)(38100700002)(31696002)(86362001)(26005)(8936002)(41300700001)(44832011)(5660300002)(316002)(2906002)(66476007)(66556008)(4326008)(66946007)(6916009)(66574015)(8676002)(4001150100001)(2616005)(53546011)(83380400001)(6486002)(186003)(54906003)(478600001)(6506007)(6512007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHZ6N1BaMGUvc056MWpPUWh2eHJKWWxvbHd4ZjZRbktnOG5aUElraEdOOVM2?=
 =?utf-8?B?Rmgxc2JKYmVJcGxyeGFpZUJtRU01cC9PWnFFckhQNWl1b0JNTkdyNWZ6M0VD?=
 =?utf-8?B?eGdoaTZaVW53cGZjMUFpWjFTR29XNEd4SUZBTW9Nd0ZYdXR0OVlPZXZGbDFS?=
 =?utf-8?B?K0xlWEt0L1E5UXpoeEtJV0xGSzM2bjNUMHp5T21ySkF5NkhsQjFXZXZGVVps?=
 =?utf-8?B?SjRnZzZEZk5SMzlMYTdwSFVGMkFNNGFhRDMyMm54em1DV3k4TS9PSXB0SUNB?=
 =?utf-8?B?d1hBQXRaUXZ6dE50VG9NVnBqTkhuZUdSY1BIbERSUlloS0lqTlNudmJNM0ZU?=
 =?utf-8?B?bHE5Z2pvSGozdGM2c1dWb1ZETERDd20rdDMwM3RReWF3eVNwNi8wRFgzbG5O?=
 =?utf-8?B?bVFvb1Q4V2J6ZXp6UDEzeWthNzVhRG5pQ2JPMHd5VGxYZ21kbkRUNTREMlNZ?=
 =?utf-8?B?QlpqQXJvUG9xakN6ancwdG5RZThoV0lRaDAyUU1EZmdJcFNFYkF0aXVad3NW?=
 =?utf-8?B?N0pkVFVQbDZRRXlBdG9GWXU5Y2lnNVRJUDl4MjBQaDc1aUs3d2l3bkFXQktk?=
 =?utf-8?B?SldJZG1LMnMreGlwRU9LSEE5bGpHbFB6NExoM2FuS1Zna0hNU1NVY2pncFpG?=
 =?utf-8?B?ek12OUpwOVBvai94MVk4cVpmUkJ2TzVmeDVDZjhoVzJ3aVlndHdVOWRQUk03?=
 =?utf-8?B?RnBRSzlkVkYzd2t5UGJrYWd1aVdMWWRtU05JWm5YeFJLS25SZWZGRHpsREUz?=
 =?utf-8?B?aXp1MFBPemhOSFBEWlRNdnBCbXk5NFhLUUNwSHVubVBFenFnZXMxanFEOTJp?=
 =?utf-8?B?Y0h2SkVvc3c3Q3E2aHlDcDNaazN3bVk4ajh0djQyd1JKY2pEL0d1TnZWVm1Y?=
 =?utf-8?B?MGN5MmhMUWNST2R3SHFSdXRsMHNPWEZGS2pGMjdNa2RzTGNFeEVxNVJud0hl?=
 =?utf-8?B?UW1WOTM2a3NhcG5GNG94Yk01ak1HVDJ2US9TN0VmcWp2VWptdW1GVUtNT1ZU?=
 =?utf-8?B?aDJ0NXNseFlnZ0RINTUyVUIwUlUwY2N6Qm9EWGl1YTNaM3JmclJZMDdpU0Fi?=
 =?utf-8?B?eSsxTkxNZklrdXpFVnhoeDdyS1hwcFZXWDd2dnUyZU13b1lEb1lCRUNzUk1O?=
 =?utf-8?B?YSszOVJvYTlkeXl4MFFqV1dyc25NT21tRFFCdS9wNFNTdHZycHY5YmtoTXgx?=
 =?utf-8?B?RVNXMWpUMTB4NkkxMGdaZ1hkZFdPUE8xU0RXa1RWTS9lUUYybEF1NURZNDk0?=
 =?utf-8?B?ZURSZUZYdGxpTlJzcDFiVjlzU1N6cmFXaHFBeWV5dzFQdDh1RTBHUmtPSGhP?=
 =?utf-8?B?NDZna0RKUm14UStmakhiOGpFWnROZzZnN0VyZGE3U3dQQ1FVeFhwSmZxT21J?=
 =?utf-8?B?b2JSaFZBUXRYc0VSK0pMMjBPZkRoaFVwaGVUaDM4RzhJZzdYbVByVDdzWTBI?=
 =?utf-8?B?YnlmZWQ0YU50elJMSDBTQ3ZScmhYSFQxQWpUQU9TWWhKaytzUVd6VGFad3JJ?=
 =?utf-8?B?Mzk4dWc2VXl4Q3BvUXNiQXBKdmp3aERadk9FWE5zMUdMS1o2dEIwZ3lIaTRH?=
 =?utf-8?B?ZURwZHNaTmRnRkVZQXcxOHhSNy9mNUZlVjhwSWxvdkxoTFRWVEY5enVIdXB1?=
 =?utf-8?B?ZFczaXdDWjlJR0U3c3pzL0lvUWMxRWxEbCtxTGo5alBTbUNLQXF1eXZOdFV3?=
 =?utf-8?B?VWZpd0dJR2Nwc0VuR3pVQkxWMmFEM2svdHpoM0I5VHltUTlxVTJmUHU0cU1H?=
 =?utf-8?B?dU5wQzZRaGJEQ1duajZwZndqcHlUcnRTb0M0Z3YzaVZKTThRWjZBM0xUaVZG?=
 =?utf-8?B?aVRxWmVxejJyOXZoM000bE52eEhPQUpTOFBabWlmOXZueE9BOUttS1Q5TXJP?=
 =?utf-8?B?UkNXZWZTU0pjTmd5OGM1eDBHOGJJYkk3Vkw1OG5oWVd5VmZnZjQyemR2YUVG?=
 =?utf-8?B?ZnczSDJxaHNkWnY5aHVsVVlPUm45WkhNR01kM2xRaWlrMEtUeTFZRGJ2U29j?=
 =?utf-8?B?S0ZMb3VhV1BTSlFQVlBTL2M4b0JJOHNLV1RpeDhwVGU3eXlabWxNOGFGd3Ja?=
 =?utf-8?B?RUUwUER0YmpxbFB2c3NIamUwNXVZalVZVHdtWHJETDlsblFPdHJUZVZJM255?=
 =?utf-8?Q?+/MSHOWDWj30O4uy9eUVOgggv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293d4d33-7acf-47e5-88e0-08dafa9f4658
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 04:32:01.7516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +h2axAlqPh8FSxIp8Va9IYVuFgHUXq5x6lqNZ4HAlquy0Qsd9wOgZB0AJyGUfa6d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-19 11:56, Krylov Michael wrote:
> On Thu, 15 Dec 2022 07:07:33 -0500
> Luben Tuikov <luben.tuikov@amd.com> wrote:
> 
>> On 2022-12-15 06:53, Robin Murphy wrote:
>>> On 2022-12-15 11:40, Luben Tuikov wrote:
>>>> On 2022-12-15 06:27, Christian König wrote:
>>>>> Am 15.12.22 um 11:19 schrieb Luben Tuikov:
>>>>>> On 2022-12-15 04:46, Christian König wrote:
>>>>>>> Am 15.12.22 um 10:08 schrieb Luben Tuikov:
>>>>>>>> On 2022-12-15 03:07, Christian König wrote:
>>>>>>>>> Am 15.12.22 um 00:08 schrieb Robin Murphy:
>>>>>>>>>> On 2022-12-14 22:02, Alex Deucher wrote:
>>>>>>>>>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy
>>>>>>>>>>> <robin.murphy@arm.com> wrote:
>>>>>>>>>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>>>>>>>>>>> Fix screen corruption on older 32-bit systems using AGP
>>>>>>>>>>>>> chips.
>>>>>>>>>>>>>
>>>>>>>>>>>>> On older systems with little memory, for instance 1.5
>>>>>>>>>>>>> GiB, using an AGP chip,
>>>>>>>>>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask
>>>>>>>>>>>>> is 0x7FFFFFF, and
>>>>>>>>>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF
>>>>>>>>>>>>> < 0x7FFFFFFF, false. As such the result of this static
>>>>>>>>>>>>> inline isn't suitable for the last
>>>>>>>>>>>>> argument to ttm_device_init()--it simply needs to now
>>>>>>>>>>>>> whether to use GFP_DMA32
>>>>>>>>>>>>> when allocating DMA buffers.
>>>>>>>>>>>> This sounds wrong to me. If the issues happen on systems
>>>>>>>>>>>> without PAE it clearly can't have anything to with the
>>>>>>>>>>>> actual DMA address size. Not to mention that AFAICS 32-bit
>>>>>>>>>>>> x86 doesn't even have ZONE_DMA32, so GFP_DMA32 would be
>>>>>>>>>>>> functionally meaningless anyway. Although the reported
>>>>>>>>>>>> symptoms initially sounded like they could be caused by
>>>>>>>>>>>> DMA going to the wrong place, that is also equally
>>>>>>>>>>>> consistent with a loss of cache coherency.
>>>>>>>>>>>>
>>>>>>>>>>>> My (limited) understanding of AGP is that the GART can
>>>>>>>>>>>> effectively alias
>>>>>>>>>>>> memory to a second physical address, so I could well
>>>>>>>>>>>> believe that something somewhere in the driver stack needs
>>>>>>>>>>>> to perform some cache maintenance to avoid coherency
>>>>>>>>>>>> issues, and that in these particular setups whatever that
>>>>>>>>>>>> is might be assuming the memory is direct-mapped and thus
>>>>>>>>>>>> going wrong for highmem pages.
>>>>>>>>>>>>
>>>>>>>>>>>> So as I said before, I really think this is not about using
>>>>>>>>>>>> GFP_DMA32 at
>>>>>>>>>>>> all, but about *not* using GFP_HIGHUSER.
>>>>>>>>>>> One of the wonderful features of AGP is that it has to be
>>>>>>>>>>> used with uncached memory.  The aperture basically just
>>>>>>>>>>> provides a remapping of physical pages into a linear
>>>>>>>>>>> aperture that you point the GPU at.  TTM has to jump
>>>>>>>>>>> through quite a few hoops to get uncached memory in the
>>>>>>>>>>> first place, so it's likely that that somehow isn't
>>>>>>>>>>> compatible with HIGHMEM.  Can you get uncached HIGHMEM?
>>>>>>>>>> I guess in principle yes, if you're careful not to use
>>>>>>>>>> regular kmap()/kmap_atomic(), and always use
>>>>>>>>>> pgprot_noncached() for userspace/vmalloc mappings, but
>>>>>>>>>> clearly that leaves lots of scope for slipping up.
>>>>>>>>> I theory we should do exactly that in TTM, but we have very
>>>>>>>>> few users who actually still exercise that functionality.
>>>>>>>>>
>>>>>>>>>> Working backwards from primitives like set_memory_uc(), I
>>>>>>>>>> see various paths in TTM where manipulating the caching
>>>>>>>>>> state is skipped for highmem pages, but I wouldn't even know
>>>>>>>>>> where to start looking for whether the right state is
>>>>>>>>>> propagated to all the places where they might eventually be
>>>>>>>>>> mapped somewhere.
>>>>>>>>> The tt object has the caching state for the pages and
>>>>>>>>> ttm_prot_from_caching() then uses pgprot_noncached() and co
>>>>>>>>> for the userspace/vmalloc mappings.
>>>>>>>>>
>>>>>>>> The point of this patch is that dma_addressing_limited() is
>>>>>>>> unsuitable as the last parameter to ttm_pool_init(), since if
>>>>>>>> it is "false"--as it is in this particular case--then TTM ends
>>>>>>>> up using HIGHUSER, and we get the screen corruption.
>>>>>>>> (gfp_flags |= GFP_HIGHUSER in in ttm_pool_alloc())
>>>>>>> Well I would rather say that dma_addressing_limited() works,
>>>>>>> but the default value from dma_get_required_mask() is broken.
>>>>>>>
>>>>>> dma_get_required_mask() for his setup of 1.5 GiB of memory
>>>>>> returns 0x7FFFFFF.
>>>>>
>>>>> This 0x7FFFFFF mask looks fishy to me. That would only be 128MiB
>>>>> addressable memory (27 bits set)? Or is there another F missing?
>>>>
>>>> Yeah, I'm missing an F--it is correctly described at the top of
>>>> the thread above, i.e. in the commit of v2 patch.
>>>>
>>>> 0x7FFF_FFFF, which seems correct, no?
>>>>
>>>>>> While the dma mask is 0xFFFFFFFF, as set in radeon_device.c in
>>>>>> radeon_device_init().
>>>>>>
>>>>>>> 32 bits only work with bounce buffers and we can't use those on
>>>>>>> graphics hardware.
>>>>>>>
>>>>>>>> Is there an objection to this patch, if it fixes the screen
>>>>>>>> corruption?
>>>>>>> Not from my side, but fixing the underlying issues would be
>>>>>>> better I think.
>>>>>>>
>>>>>> Have they been identified?
>>>>>
>>>>> I'm not 100% sure. I think by using GFP_DMA32 we just work around
>>>>> the issue somehow.
>>>>
>>>> Right. Using GFP_DMA32, we don't touch high-mem. I was looking at
>>>> the DRM code trying to understand what we do when GFP_DMA32 is not
>>>> set, and the immediate thing I see is that we set GFP_HIGHUSER
>>>> when use_dma32 is unset in the device struct. (Then I got down to
>>>> the caching attributes...)
>>>>
>>>> It's be nice if we can find the actual issue--what else would it
>>>> show us that needs fixing...?
>>>>
>>>> So what do we do with this patch?
>>>>
>>>> Shouldn't leave it in a limbo--some OSes ship their kernel
>>>> with 33b3ad3788ab ("drm/radeon: handle PCIe root ports with
>>>> addressing limitations") wholly reverted.
>>>
>>> Removing dma_addressing_limited() is still wrong, for the reasons
>>> given in that commit. What we need is an *additional* condition
>>> that encapsulates "also pass use_dma32 for AGP devices because it
>>> avoids some weird coherency issue with 32-bit highmem that isn't
>>> worth trying to debug further".
>>
>> Yes, you had a patch earlier which did exactly that--why not push
>> that patch?
>>
>> Q: If host memory is 1.5 GiB, i.e. mask of 0x7FFF_FFFF, but the
>> device's mask is 0xFFFF_FFFF, shouldn't we use GFP_DMA32, instead of
>> GFP_HIGHUSER?
>>
>> Regards,
>> Luben
>>
> 
> Sorry for being pushy, but given that we are so close to the finish, is
> there any chance that one of the variants will be merged to the kernel
> sources any time soon and if so, can I help with testing? I would really
> benefit from this patch making it into Debian 12.

Well, there's a couple of patches addressing this problem here in this thread.
If consensus is reached, perhaps one of them could be picked up by upstream.
-- 
Regards,
Luben

