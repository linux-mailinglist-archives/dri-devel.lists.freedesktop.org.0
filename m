Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496664DA93
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CD510E538;
	Thu, 15 Dec 2022 11:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A94710E538;
 Thu, 15 Dec 2022 11:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6+a+QoN42bGfbRMiLsmyfGAgw7tMspkU+SMHkr/AbqL4dtRjRI/1+t47PlKVgW8gWzQiy8ZVIZwHVZOHFOQlZiuPt/xEK4xnzFSeG7WGs29hw8n4hP9pyYsR8hUb/PcmIclHcB35t2srdyn6hEkHVzLe4TLRGZbFjeBdNDAHg6Hzg7v9tQumub+4/fL9BmIqt4hUhdwyX6kNCmChHz5hDOedXX0I6JI2NIdd7EoOEWspcXQHmqKdn9e/nCMJpFBpjrqWR3AvLoYYhl2/oJJ5JIldhawsIu478MQuK3yMKJTFR1V2M8Ia3KKCI2QxceV4WQgBn/pvz0qVSm9WEyTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbYZGrBn2l6t1anaRKl+JoMTuPs/DhlfKpjtZPHdNV8=;
 b=SrRJJ6wAaeAqMNxTRWgGoXkInraxM86dTS73hpGqqiL0dHE1NKebgYxOEHpONSusNH3edyUxhNduZiqda1V3pMI4U8jDOn0XmV/2xNFTDp6pkFxsLQ7rB6TFHm2St+YVxMeeUowqltaybJ0tSDrakH81U63S7Tpwm+g6FBrTDLVmyYX091vI81gMMXyf+k7/XJcuHR8ER7/v3cKDnW1f2NB8Ovy6giJiz7HFP+2wehflFhJVLLPHejegNMbul1Me5nFrWv/tQPqVtIJUmvSllTwcv+ZuZnW/jKvG14nIr7diXgfdJZqVzf4iLH0R8DPu2fp+vI7C0RAdYQ89jEvA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbYZGrBn2l6t1anaRKl+JoMTuPs/DhlfKpjtZPHdNV8=;
 b=ce0PO2Hyf+a8MbIgXWqXrZivZZP7w1nTMrdIO7JkXrtzuGjHdJE2u+6/AsI3heMdYrbErO2ViVIK5S3DpQIbTEamwHRzj+sUjtq7v67A45/h0GpSH3CiCT/Zb3RNyr/kwcqVZ2EWJMwcutmomJdm3QzbI+68Uiou8a1nQBTf18A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL0PR12MB4914.namprd12.prod.outlook.com (2603:10b6:208:1c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 11:40:38 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 11:40:38 +0000
Message-ID: <80e10a8d-275f-8e3c-8b91-f5f6d6729dee@amd.com>
Date: Thu, 15 Dec 2022 06:40:36 -0500
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
 <de9bf189-c204-f499-f027-1320e2faaa20@amd.com>
 <20f15c8d-fbe5-8dca-39dc-dc67fff2eca9@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
In-Reply-To: <20f15c8d-fbe5-8dca-39dc-dc67fff2eca9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::6) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL0PR12MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: fb645a89-18b6-4a51-a4c6-08dade912ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IF2hk2WcK2EmjukssAbv+IHjlZo4+KdNklidu03+yW2VK8UMfbPy12YJKGU8T5SvfOAmSH1RZetTprpQ7s/iZoUlhPyJ1emUfBwjiG3dimxf1T3K693K4uRUyiNCTkBZ3N3XZuk/V24T8l3H/jtqPQ4/tBLNmGy2YVr1tA5tETERhvxDPJbzjgKNJCOJfYQCGrey2UOiKzi9Dh+qwt2StAWDHyXJjg3HpukaWo2eMc0okvIuou/7B1XvMDUXJfc0WOY8A+QcjDxSINQtaLjo0zLwDRuW9+8U4UHytEFqAitrhU1mKw/Sklzh8mTHv9cy1ukSDuPb8duSRsICsandUFxKREnKaPWXx0OExND1rRMbP+8E2ndPY/Zhy1AXvpMPsprTA4tUxTvZE2fOBkiYZFfOqjgMmoJnmSRIaSvWq33O2la4zHEVkehXv5QuDb6JN1dBmZ0i05toJt1+M/fKZ99e6KX6mAe6kYXgPZ9aMA8PO2k57d5wwM9djp+2y6NTNJYYRaskotTt056z26BOikNIH+FpHY/sS5mL30OUMb8NJqjMaifIUsmhd2vX6vPfncjSVpdqpWyPNp145waJow7Gm4G61UtJdqXw0TcxyBdFGbvdppodkGAzA9ywxdoujDG1uFVfbrn5ypJfnJkIhjZUp3scVCnmxsFfstiPo73gxukfYBKcUY/psBnOkSZAE4swELvppDHWDMsKj5+na7LPTRkgBzTkcGmSbobgDa8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199015)(36756003)(4001150100001)(2906002)(5660300002)(66556008)(4326008)(8676002)(66946007)(41300700001)(83380400001)(31696002)(86362001)(38100700002)(66476007)(478600001)(6486002)(31686004)(8936002)(44832011)(186003)(6512007)(6506007)(53546011)(26005)(110136005)(316002)(54906003)(66574015)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2VERXlRUnZ3ek9EL1c1NVN2bFlVRUNURHRYdkJ4dmtROWIvVjRUM01kRTE5?=
 =?utf-8?B?cUdqS0UwSEx5bnh3UGZYOExBbTl3d3lrdkpqNjFWdUxHRkNIZ3prMGFkSHQ1?=
 =?utf-8?B?Vm5TbHBzbnF5RFVUVWwyTDIrbFhDcXViMForNXlibGRUUStNTWVRa0dXTzhO?=
 =?utf-8?B?TXlTVVp3RGZqYmlhOEh5RldsZGlycE9veUh5S3drWTErYTU2U1J1eFNyaFJW?=
 =?utf-8?B?d0NjSXlic2FXRTU3K1RpZmp4MmkvRUhTUVE1Rkd0UHZZWERRcDZOclllMkp0?=
 =?utf-8?B?RjZFUG5zbi9rOUZuNWo1VXQzdjFrcU1BV0JqbDAyYkQvSHQ4R05BcFVEUUI1?=
 =?utf-8?B?N053NXlkOFZ3dmxCR3hrVU12V0krdWVmd0NPYis0OEVOaVJjUGVvV1RCbWxG?=
 =?utf-8?B?L2FtRDdMM0p3OGRxMEpSQnorbWtkbnIxcjYrOWR0ay9yTU9TWHRpWVNCVUJ2?=
 =?utf-8?B?V1IrVmZYdFUvSmdMTGV6QzY5UW15Wk1Pa3Rib0xFb253TEIxOGkxRkdxZGoz?=
 =?utf-8?B?anM1b1NqeTk3aDVJeGcyNHBUaHJrSUR5WUxQMUxKUWx4bzRGWFZzbnIrY0Ra?=
 =?utf-8?B?VGg1OGg3TFVScXBZa0w1Rk81VGk3SE1ENzIzUXhWNG1VcUlORXpzdDM3Vm1m?=
 =?utf-8?B?OFNGODBvSjlWMGNWN1FCQTB0QU4yVkVDZnEyeXlTbHlBRVpQSkJHeE43QmR4?=
 =?utf-8?B?cGdNZVI2ekFydlhESTZYbUduQ0c2bW4wOGNCRG5kdy9jYWtmVTN6M3hoTURr?=
 =?utf-8?B?cmE0NTNlNkVESWF1aWQzL0hiNWQ0NTBlc1oxMlc0NFIwQjNCU0MyUHVRamZO?=
 =?utf-8?B?RDVKalBvUCs0bzRTQmp6b3Y4TTNnTW43SGk4ZERQUGwyMmE5WGRuWmlwVXpp?=
 =?utf-8?B?VGxkNmd6clJmRFNNK3dqQ21KS21Ba0pTVDA3bjBEbG9SckVjaWQ0QlJuSHY4?=
 =?utf-8?B?SlpiQTZIa2dLTXpjSU1wMXJzdXJkd096L2tpdzFLSjFKdVZXekkyaUxPd1du?=
 =?utf-8?B?dDZZSHArSnVFT1hpSWNENWJkZlVraWxaSWQ2Y0p0NlNMVmJLdEFkYmk0d0hH?=
 =?utf-8?B?Z2w2MkhLZjd5T3N2RXQ0WGFYNWo4dmQwUVp2WWhidWg3eUEzY254cEdQYnc3?=
 =?utf-8?B?clBacERzc2FicitrZFEvV2NEcHFaeEdqc2R4OUt1Rlp3MGxUY0xLbkFnMXRG?=
 =?utf-8?B?Qk1VVG56dXNIMFk2aGEyRTM2bVMzVkRIVXVzWEUwODJCbkF2aG5NRFF5Mi9N?=
 =?utf-8?B?ZG94YzNydXhLZHZmSStkWlZsaUw3OXh2VDhwNXhBaFJqQ1dvdkxlMjB1SG45?=
 =?utf-8?B?bEtHUVIrMDhodGVqQUJiWEFxalVWWkdtV1hTM2d6YnZmbG5IUXVjMVpwVHhR?=
 =?utf-8?B?c1BGZm0zZGFiMmNlZlo4QmVLbDROV3hlWjNxM0xwN3VGOE9TVXBtOEJXaXd6?=
 =?utf-8?B?V09GSGpiNUNtWXo5S25YVEczak1SL0ZjaVp4cHQ2TW54c2hKSDkxTzZUYUxU?=
 =?utf-8?B?ZlVvMVplMFhNKzN6SWJtQ2lleE5QZkRKeXVSN0p0b25rNjJFa2xnL0RIN3gz?=
 =?utf-8?B?Qm95OW9LU3B5c3FmY1Nrb2prbkZ3bkRBQlJ4bFcyeWs0VjhYa1Zic1B3ck1z?=
 =?utf-8?B?NHNRR3pUMys4S3hOVlh4UVdCTS9PdTZmVnR3cGM2K1FSaGJWdy9KYTJkQ0xr?=
 =?utf-8?B?VmpObzVQT0M3cWxkR3ZYN3VkcUV6b2JrVEpBc1R5S3gwTm4weER4NUlQWk1B?=
 =?utf-8?B?S1cwWnRGUDJkTjhrLzlZcW9ieUhBQjZnM0d6N3p0b0p1TlA4UmNLcjlVVE9T?=
 =?utf-8?B?MmI1czRFWGxWVHVNRnZsZVBGQ1J3WWErZEV3cXE2VFlsejdaMXgzM2k4Z1N1?=
 =?utf-8?B?OEFCeTdFU2YwbnFSd3k2UWxzdXdBQXo1eVl5aVJCbnlhQ05jbElaWnJrcWVB?=
 =?utf-8?B?bFk3VTRuYjdVUVNINjlUckxic2M4V3dGU2xyS0JTUXEzVVhscDQzczlEOEhJ?=
 =?utf-8?B?cjU5STV0eG0wQmU1Nzg4V1BLUTUvUElJRkZGUkRUd0V2VHdVR29pVWsvM0pD?=
 =?utf-8?B?K0hMeXJQL09MRWRrNUFVWGE0MUdVWW5KK1F5WkE1WUI1K3RjSmJTL0ZFcEUz?=
 =?utf-8?Q?c6eRixGq+/0R9LPKKuayUa9MF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb645a89-18b6-4a51-a4c6-08dade912ff6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 11:40:38.3757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHUOlVK3nl02O37Ktt4ZtJL0p0dcWd97qjjFyumrUQ+S0QDwc6DYrbPCJ+daJjW4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4914
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

On 2022-12-15 06:27, Christian König wrote:
> Am 15.12.22 um 11:19 schrieb Luben Tuikov:
>> On 2022-12-15 04:46, Christian König wrote:
>>> Am 15.12.22 um 10:08 schrieb Luben Tuikov:
>>>> On 2022-12-15 03:07, Christian König wrote:
>>>>> Am 15.12.22 um 00:08 schrieb Robin Murphy:
>>>>>> On 2022-12-14 22:02, Alex Deucher wrote:
>>>>>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com>
>>>>>>> wrote:
>>>>>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>>>>>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>>>>>>>
>>>>>>>>> On older systems with little memory, for instance 1.5 GiB, using an
>>>>>>>>> AGP chip,
>>>>>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is
>>>>>>>>> 0x7FFFFFF, and
>>>>>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>>>>>>>> false. As such the result of this static inline isn't suitable for
>>>>>>>>> the last
>>>>>>>>> argument to ttm_device_init()--it simply needs to now whether to
>>>>>>>>> use GFP_DMA32
>>>>>>>>> when allocating DMA buffers.
>>>>>>>> This sounds wrong to me. If the issues happen on systems without PAE it
>>>>>>>> clearly can't have anything to with the actual DMA address size. Not to
>>>>>>>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>>>>>>>> GFP_DMA32 would be functionally meaningless anyway. Although the
>>>>>>>> reported symptoms initially sounded like they could be caused by DMA
>>>>>>>> going to the wrong place, that is also equally consistent with a
>>>>>>>> loss of
>>>>>>>> cache coherency.
>>>>>>>>
>>>>>>>> My (limited) understanding of AGP is that the GART can effectively
>>>>>>>> alias
>>>>>>>> memory to a second physical address, so I could well believe that
>>>>>>>> something somewhere in the driver stack needs to perform some cache
>>>>>>>> maintenance to avoid coherency issues, and that in these particular
>>>>>>>> setups whatever that is might be assuming the memory is direct-mapped
>>>>>>>> and thus going wrong for highmem pages.
>>>>>>>>
>>>>>>>> So as I said before, I really think this is not about using
>>>>>>>> GFP_DMA32 at
>>>>>>>> all, but about *not* using GFP_HIGHUSER.
>>>>>>> One of the wonderful features of AGP is that it has to be used with
>>>>>>> uncached memory.  The aperture basically just provides a remapping of
>>>>>>> physical pages into a linear aperture that you point the GPU at.  TTM
>>>>>>> has to jump through quite a few hoops to get uncached memory in the
>>>>>>> first place, so it's likely that that somehow isn't compatible with
>>>>>>> HIGHMEM.  Can you get uncached HIGHMEM?
>>>>>> I guess in principle yes, if you're careful not to use regular
>>>>>> kmap()/kmap_atomic(), and always use pgprot_noncached() for
>>>>>> userspace/vmalloc mappings, but clearly that leaves lots of scope for
>>>>>> slipping up.
>>>>> I theory we should do exactly that in TTM, but we have very few users
>>>>> who actually still exercise that functionality.
>>>>>
>>>>>> Working backwards from primitives like set_memory_uc(), I see various
>>>>>> paths in TTM where manipulating the caching state is skipped for
>>>>>> highmem pages, but I wouldn't even know where to start looking for
>>>>>> whether the right state is propagated to all the places where they
>>>>>> might eventually be mapped somewhere.
>>>>> The tt object has the caching state for the pages and
>>>>> ttm_prot_from_caching() then uses pgprot_noncached() and co for the
>>>>> userspace/vmalloc mappings.
>>>>>
>>>> The point of this patch is that dma_addressing_limited() is unsuitable as
>>>> the last parameter to ttm_pool_init(), since if it is "false"--as it is in this
>>>> particular case--then TTM ends up using HIGHUSER, and we get the screen corruption.
>>>> (gfp_flags |= GFP_HIGHUSER in in ttm_pool_alloc())
>>> Well I would rather say that dma_addressing_limited() works, but the
>>> default value from dma_get_required_mask() is broken.
>>>
>> dma_get_required_mask() for his setup of 1.5 GiB of memory returns 0x7FFFFFF.
> 
> This 0x7FFFFFF mask looks fishy to me. That would only be 128MiB 
> addressable memory (27 bits set)? Or is there another F missing?

Yeah, I'm missing an F--it is correctly described at the top of the thread above,
i.e. in the commit of v2 patch.

0x7FFF_FFFF, which seems correct, no?

>> While the dma mask is 0xFFFFFFFF, as set in radeon_device.c in radeon_device_init().
>>
>>> 32 bits only work with bounce buffers and we can't use those on graphics
>>> hardware.
>>>
>>>> Is there an objection to this patch, if it fixes the screen corruption?
>>> Not from my side, but fixing the underlying issues would be better I think.
>>>
>> Have they been identified?
> 
> I'm not 100% sure. I think by using GFP_DMA32 we just work around the 
> issue somehow.

Right. Using GFP_DMA32, we don't touch high-mem. I was looking at the DRM
code trying to understand what we do when GFP_DMA32 is not set, and the immediate
thing I see is that we set GFP_HIGHUSER when use_dma32 is unset in the device struct.
(Then I got down to the caching attributes...)

It's be nice if we can find the actual issue--what else would it show us that needs fixing...?

So what do we do with this patch?

Shouldn't leave it in a limbo--some OSes ship their kernel
with 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations") wholly
reverted.

Regards,
Luben

