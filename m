Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3304C4B825D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 08:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449C910E823;
	Wed, 16 Feb 2022 07:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9E910E823;
 Wed, 16 Feb 2022 07:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmfdxzbTxy27QAm3lWSFMvkG2EHV5aO2Jdc8p7auJ0odRUqtiVn1R6dcZA5Qu7pW7KKe59YdbYwlMETv7PwMlsV4DCT6m5f/Qp+XFsGXCfhMsiDhnWNlOEFB00Sn0AJm6eOCDIf/HRD0PAbuGJD4rrKHWTfTTfodjVI6wluPCHZ4yQSfZ1iM2QWUQYS4fWecpsb5EbIekKLiAe8HyIX96L93yCbPypCrAu55Tpb/6QiUHtkKxA/AcbSNtQhz0KkIfUHuYq5otBgUuZNd4KpzAaFqVV5k9usjO/dglMK2eyv7A7ZVC9AiSUJgpNit01W77BxlOz2a+NJZwpqWLZKycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OImgfBA8nb0w450wiRaPzeR1I7S9ldW/QFef9iVbOQs=;
 b=kX7OM2wW3ACnZ+01Hv7B4cqs/9VOYWUknbXl0Ap2r8zfyQjnDhIoLYVXemzTZ6MZLFOrwj8Tluo+S+Ay6tTdo5oRANrMJrt2d3lDFKvgFGjCSoyMLcKZZlVWy+nxnz2DXySPLmmEl/mfpdlKEe/koVsMQczMZa9FzmEgV6X05uGOMls8PvInAFMUSdGJI2XKl/XFa2NVHDMEro+Hch61EbnyQ5ZhPXeZ+MBWJEG+aQ5oFTbWKers6CfxaYpr1OVUJj0o3gaxwrla9WviaoM4bnYnYwO+vXyGDlHPUQKaq5tTcQNy/Ki8lvfpUdfTiOcL/I304X1Y0nWHT0eoZrwtBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OImgfBA8nb0w450wiRaPzeR1I7S9ldW/QFef9iVbOQs=;
 b=x9d1P7sGbymoB3fIjOoN2ovPFp1zmG6ugyj8kuS+0R1EBeADC4Btuc25epeXdzAdQafL218rBqPuxpszKn4vS15czkjHbP6U6SWAgw2BZ/BJf85PuqLzP5y/Mlk8qgQKLzNodav6E1P+TpImuRzYy0vVpWsgC1HBqkcFEvApXRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by CY4PR1201MB0053.namprd12.prod.outlook.com (2603:10b6:910:23::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Wed, 16 Feb
 2022 07:56:39 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e550:4514:bbf5:fd82]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e550:4514:bbf5:fd82%6]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 07:56:39 +0000
Message-ID: <aff37ec0-d13c-54fd-3f06-03953f7622bf@amd.com>
Date: Wed, 16 Feb 2022 13:37:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v12 1/5] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
 <32487d00-8ee2-b54e-cf5d-3b241ff19a5b@gmail.com>
 <CAM0jSHNAPYjX8cD48195fkM4CoLjMFu5P0i5g2anS3-YGzf2cg@mail.gmail.com>
 <b46a3c25-1f1d-2a76-53eb-c77f0b6eb31a@gmail.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <b46a3c25-1f1d-2a76-53eb-c77f0b6eb31a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::18) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcce693f-39fb-43b4-b592-08d9f121dc67
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0053:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00530C2A64918AB596200D26E4359@CY4PR1201MB0053.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfay6s13y+dEwVDBWl9G4VUdiJ5Z4w7wzMpN/+JXonE+NI2XCZwiSyUbd4fXxxgSpLUE1WY+uJlFqDfks8mFjEpLNdo55HmtVLYrLbp51IvlTI7OCnk7G2ClGPuNcDa2/wAo8dEE8A68db5OfutcXVxy/46dAjvvTwQT5KubAQp3DCsI++7NSQYliu4zmLojx9ZRiY009/KN0w6HDmDoF4SCqSogCj7aatmmaRyYGKdicg6i+xRkEoVr9OzxITKU8Z9lwsVFF8yFp7BSLdnaCycJiOmGHlcv62C8J5vOIU/CJpMuTgVx2q+HatcmMggvFG6hNhcRylfIWVlTSviOW9ZiXQlPO3pYD51Dy3J+jTzyi3zWwdKtBwMPzIUdtMwIjslMoRmI6G3WoDrK421Iaw2IZUC9gSqldouRnPA3X5yoZ6Fr0kMIpObQu8zqKTBsdOjCOKu/aRO+8/U6DnmKYDElYOMvr8Abrr3o1LPpn3AIbzKxRW/IMFjGJxqx3naWmlJYiFgzaXKY9AASTSX+T6wz1Yuqi4BAarFxILQaWHpzvmikypQgpoR7ANPtRq30zLct7n5ixbYjgnWixhl5uEXLScYyKf5eQjSzb/2EVMd//CmXtF50BoHemuVIkLxmQOhMxzqpdvOXg/YSWH1P0YaWh1kndlnYttwKAj6Fu4kIXIthQp6uIgxApF+AUeWC2lMv+OpDlBqEDC4om+iPBtn6XtOTv3IT1ZeJlxj3haE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(2906002)(31696002)(6512007)(6666004)(2616005)(86362001)(8676002)(6506007)(8936002)(53546011)(30864003)(5660300002)(83380400001)(110136005)(54906003)(508600001)(66556008)(966005)(36756003)(66476007)(6486002)(4326008)(66946007)(316002)(38100700002)(31686004)(186003)(26005)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlYQU1KaFp5eTdvTUFsYXJOWFEvU1pYbWFnSGlxSnFaQkFMSVdDUkk2TzUr?=
 =?utf-8?B?KzZmS28zQlhTSVQrWlZBNzM3TGpWYjdSYlJ5VVNUY3o5ME5CNXA5VkpyUGZl?=
 =?utf-8?B?a1hTT003b3pjUHJ5cFU5bXUyK201Y1FuNkZrenVkUHRFN1M4dTlGWUIzUHZU?=
 =?utf-8?B?dnJ0NE03V2x2MnIzVzkxY0dueDdpMVkzZlVqOFVpQUF0UzJuSElMOHA4ZzRF?=
 =?utf-8?B?L0hqc2xycXlwL3hvRjJMd21JbzFIaUdjcEVsSHJjeGxyOWZTT1pEcTQ0Nkwz?=
 =?utf-8?B?Yk9oNjZra0U5aTgzb2xhRGo1OEJabGltV2FLTXBuRlM3M1dXVzJKMkdBUkFU?=
 =?utf-8?B?Mm9EeXhkb0NqeVZibjd5MjRoTXUyem40MzI1UmR6L3NJUVJNUkJqdXRLWmI4?=
 =?utf-8?B?RVpMSTFVUWJFVWFsMGViWUxPaGJva0tUdnhHMEFITjdJVDN2c3RmTG15VzQw?=
 =?utf-8?B?Ym80eUN6aWJhcm56YzNHWmErNkl0Y3ErZnBaQmdRU2Vxd2hTRlZzU2ZHOENT?=
 =?utf-8?B?ODd3T29Uc1dKUU1qSkt2Q2tydlNneVg3aDZQQ2pxTEZCdUk3T2drOW5LN0Nn?=
 =?utf-8?B?TFZWbTJ3TDJwMkN2dTMxdzh4bm5OVkpob3VaamVnaGhvVXhMWmhBQWUrb2xX?=
 =?utf-8?B?WHIxR21MSnZFa3ZPME9Cc3RxZmlsbnF2R2lCN2FBSzFnWVE2dXFQZXpJekxp?=
 =?utf-8?B?dDVMeFJPd3BybERCcE9vbnZCbGFUYTVnM2cxdFRlRmRQMWFiSHNUYXBHdDdQ?=
 =?utf-8?B?TjZrMlk1QXJrT0FjQnh6eFFCKzdFQ21GRUZLQzA0UjVnc0haMk0rMjNaTHlP?=
 =?utf-8?B?anpMVkthNDdWVE5Pd25heWRITHhKazdXalVKdWVkOExnWmVCN244ODZRbURr?=
 =?utf-8?B?L0hwdVFzb1E2WGo3NFkxTjRIV1dUbHBUL3VYQ1FFcVJ3K3Z4dWhYMjhMcGlr?=
 =?utf-8?B?S0pJaGN2MXMyTkZkZ0VzcUJSV3Y2bng2SWJBZWpmOStBeldWTnZZUy84dVhE?=
 =?utf-8?B?M2plMHF3TEEwdXhoZTJ2WjQ1TVFOcXVNNkc2UUc0YUt0cGFSYUE0NlFjOWxq?=
 =?utf-8?B?UFMxMkpRNzI5T3hOSVhXMldrUHBCZXJMY2lLcHBVeU5TUFZDZTdCbHdlTXpm?=
 =?utf-8?B?QmtRWFpIR2JpWHc5RnhJOW1LN2NBSlJTUGdKRllnVnlYeWpRMlM1cXZTMElY?=
 =?utf-8?B?MGZRcStpR1grWlErckxkTWFHaXpFRWV2VDZNN1d1cHA0NkJ1cTNCeitzYkQ2?=
 =?utf-8?B?MGRZbHVEYUlLK2VTRDBZQmtoUkV2a3N5NVluK2N2c0dMb2ZsOU5EcnNLQUpi?=
 =?utf-8?B?cmN4MVdkeGlwRlN5NkZPWFdmazdJWWpUbE1OM0VJWUhJWTg5TzZuR25pbExJ?=
 =?utf-8?B?RmJydmVCT0ZrUTBLa0tiTzEreTQ1bm01ZXJqc2VPSGsrWkhTWVBIWVo1ZWNk?=
 =?utf-8?B?TitnZlB2OFpLdDJGdVVkNTVRL0ZVeVBQeDVqZCs0TXJvMXZKRFJLUUdnMUR4?=
 =?utf-8?B?bmtPdEk1ZUcwcGkzbWxLaHBzQTVCUno3aVYzUDBrclI0VUFQYXVtMDN0dVBV?=
 =?utf-8?B?Lzc2dVl5SlprVVpLSERjQ1N4VzE2T3gwNzVLeGdIZVQ2WUxPNnVTRXdCOVFO?=
 =?utf-8?B?WUpNOWowVXRyajJ3dVV4czRXSS9IRWpaN3dvek9leHd0OUlVaEgzQzB6OGF0?=
 =?utf-8?B?OWtxOUpRaE1adWhObWM5WDNEQVE3N3BnNjlnL0Y4V3Bsd1VRWk8xS1p2WUR3?=
 =?utf-8?B?WVRoVUllaUgrRGNzTDZ0ZmVXK0VnaVhTNWNNQm5FOUNjQll4R3hKaDlQWHdP?=
 =?utf-8?B?ZnNUaVB0NmV6RE0xdjJtUUJJRUM2bFVjT05RWmY1aVBHMlZncTFmck13Zk9z?=
 =?utf-8?B?SndxS2s1UkJTTHR5RmNNd3FwbHBtazFaTWpsc21uNzNYSklUY2dtM1VIVlRO?=
 =?utf-8?B?MFN3ZkdwMDMwQU9jMEhLT0wwcjNvWGdmdkJiZEh5V0c3dlNwSy9wODdlOGhW?=
 =?utf-8?B?N1FXZ1NWTDdVR3RVVTJIaFRGU3UxdFZWZGE0NGhoZFZLdmhBOTlSYVFBdFZw?=
 =?utf-8?B?NzRuUHFwZkVnSVQvUkxucXAzOXZheVFYNWNrZnB3dWYrRHFQTnFRRFBtM0xu?=
 =?utf-8?B?TWVhVWhURHRNMjRROWxMYTRPc0JYQWp2L0JkWmtYZUdkY0NPZ1VEa2EvTUpP?=
 =?utf-8?Q?IVE3Gu0q0Kt0Nv59n5oQaho=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcce693f-39fb-43b4-b592-08d9f121dc67
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 07:56:38.8477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ff9IobzSXj/70a+KpEZ//TYINgC6RJFpn2iQOCH/KLZvEfAnkDCZyE2uU5j19/s773bq5yib4wSlrX1V9dhOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0053
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, tzimmermann@suse.de,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/02/22 2:42 pm, Christian König wrote:
> 
> 
> Am 14.02.22 um 09:36 schrieb Matthew Auld:
>> On Mon, 14 Feb 2022 at 06:32, Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Am 13.02.22 um 09:52 schrieb Arunpravin:
>>>> - Make drm_buddy_alloc a single function to handle
>>>>     range allocation and non-range allocation demands
>>>>
>>>> - Implemented a new function alloc_range() which allocates
>>>>     the requested power-of-two block comply with range limitations
>>>>
>>>> - Moved order computation and memory alignment logic from
>>>>     i915 driver to drm buddy
>>>>
>>>> v2:
>>>>     merged below changes to keep the build unbroken
>>>>      - drm_buddy_alloc_range() becomes obsolete and may be removed
>>>>      - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>>>>      - apply enhanced drm_buddy_alloc() function to i915 driver
>>>>
>>>> v3(Matthew Auld):
>>>>     - Fix alignment issues and remove unnecessary list_empty check
>>>>     - add more validation checks for input arguments
>>>>     - make alloc_range() block allocations as bottom-up
>>>>     - optimize order computation logic
>>>>     - replace uint64_t with u64, which is preferred in the kernel
>>>>
>>>> v4(Matthew Auld):
>>>>     - keep drm_buddy_alloc_range() function implementation for generic
>>>>       actual range allocations
>>>>     - keep alloc_range() implementation for end bias allocations
>>>>
>>>> v5(Matthew Auld):
>>>>     - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
>>>>       as place->lpfn will currently always be zero for i915
>>>>
>>>> v6(Matthew Auld):
>>>>     - fixup potential uaf - If we are unlucky and can't allocate
>>>>       enough memory when splitting blocks, where we temporarily
>>>>       end up with the given block and its buddy on the respective
>>>>       free list, then we need to ensure we delete both blocks,
>>>>       and no just the buddy, before potentially freeing them
>>>>
>>>>     - fix warnings reported by kernel test robot <lkp@intel.com>
>>>>
>>>> v7(Matthew Auld):
>>>>     - revert fixup potential uaf
>>>>     - keep __alloc_range() add node to the list logic same as
>>>>       drm_buddy_alloc_blocks() by having a temporary list variable
>>>>     - at drm_buddy_alloc_blocks() keep i915 range_overflows macro
>>>>       and add a new check for end variable
>>>>
>>>> v8:
>>>>     - fix warnings reported by kernel test robot <lkp@intel.com>
>>>>
>>>> v9(Matthew Auld):
>>>>     - remove DRM_BUDDY_RANGE_ALLOCATION flag
>>>>     - remove unnecessary function description
>>>>
>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>> As long as nobody objects I'm going to push patches 1-3 to drm-misc-next
>>> in the next hour or so:
>> As part of this could you also push
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F99842%2F&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7Cc50a2b13b2a0425e596f08d9ef9a2d60%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637804268194961068%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ENxu%2BSquLubBYLkNYV1SIUau1u7aZMdjz22izvv3FvM%3D&amp;reserved=0 ?
> 
> Sure, but Arun said in our internal chat that I should wait with that 
> anyway since he wanted to sort out one more issue.
> 
> Christian.
> 

working on 2 issues,
1. I think we need to keep DRM_BUDDY_RANGE_ALLOCATION flag, some corner
case didnt allow amdgpu driver load

2. rebasing the existing amdgpu_vram_mgr.c and resolving all conflicts
as there are many changes merged in with the below patch
- drm/amdgpu: remove VRAM accounting v2
>>
>>> Then going to take a deeper look into patches 4 and 5 to get them reviewed.
>>>
>>> Thanks,
>>> Christian.
>>>
>>>> ---
>>>>    drivers/gpu/drm/drm_buddy.c                   | 292 +++++++++++++-----
>>>>    drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  63 ++--
>>>>    drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>>>>    include/drm/drm_buddy.h                       |  11 +-
>>>>    4 files changed, 250 insertions(+), 118 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index d60878bc9c20..e0c0d786a572 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -282,23 +282,97 @@ void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
>>>>    }
>>>>    EXPORT_SYMBOL(drm_buddy_free_list);
>>>>
>>>> -/**
>>>> - * drm_buddy_alloc_blocks - allocate power-of-two blocks
>>>> - *
>>>> - * @mm: DRM buddy manager to allocate from
>>>> - * @order: size of the allocation
>>>> - *
>>>> - * The order value here translates to:
>>>> - *
>>>> - * 0 = 2^0 * mm->chunk_size
>>>> - * 1 = 2^1 * mm->chunk_size
>>>> - * 2 = 2^2 * mm->chunk_size
>>>> - *
>>>> - * Returns:
>>>> - * allocated ptr to the &drm_buddy_block on success
>>>> - */
>>>> -struct drm_buddy_block *
>>>> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>>>> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>>>> +{
>>>> +     return s1 <= e2 && e1 >= s2;
>>>> +}
>>>> +
>>>> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>>>> +{
>>>> +     return s1 <= s2 && e1 >= e2;
>>>> +}
>>>> +
>>>> +static struct drm_buddy_block *
>>>> +alloc_range_bias(struct drm_buddy *mm,
>>>> +              u64 start, u64 end,
>>>> +              unsigned int order)
>>>> +{
>>>> +     struct drm_buddy_block *block;
>>>> +     struct drm_buddy_block *buddy;
>>>> +     LIST_HEAD(dfs);
>>>> +     int err;
>>>> +     int i;
>>>> +
>>>> +     end = end - 1;
>>>> +
>>>> +     for (i = 0; i < mm->n_roots; ++i)
>>>> +             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>>> +
>>>> +     do {
>>>> +             u64 block_start;
>>>> +             u64 block_end;
>>>> +
>>>> +             block = list_first_entry_or_null(&dfs,
>>>> +                                              struct drm_buddy_block,
>>>> +                                              tmp_link);
>>>> +             if (!block)
>>>> +                     break;
>>>> +
>>>> +             list_del(&block->tmp_link);
>>>> +
>>>> +             if (drm_buddy_block_order(block) < order)
>>>> +                     continue;
>>>> +
>>>> +             block_start = drm_buddy_block_offset(block);
>>>> +             block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>>>> +
>>>> +             if (!overlaps(start, end, block_start, block_end))
>>>> +                     continue;
>>>> +
>>>> +             if (drm_buddy_block_is_allocated(block))
>>>> +                     continue;
>>>> +
>>>> +             if (contains(start, end, block_start, block_end) &&
>>>> +                 order == drm_buddy_block_order(block)) {
>>>> +                     /*
>>>> +                      * Find the free block within the range.
>>>> +                      */
>>>> +                     if (drm_buddy_block_is_free(block))
>>>> +                             return block;
>>>> +
>>>> +                     continue;
>>>> +             }
>>>> +
>>>> +             if (!drm_buddy_block_is_split(block)) {
>>>> +                     err = split_block(mm, block);
>>>> +                     if (unlikely(err))
>>>> +                             goto err_undo;
>>>> +             }
>>>> +
>>>> +             list_add(&block->right->tmp_link, &dfs);
>>>> +             list_add(&block->left->tmp_link, &dfs);
>>>> +     } while (1);
>>>> +
>>>> +     return ERR_PTR(-ENOSPC);
>>>> +
>>>> +err_undo:
>>>> +     /*
>>>> +      * We really don't want to leave around a bunch of split blocks, since
>>>> +      * bigger is better, so make sure we merge everything back before we
>>>> +      * free the allocated blocks.
>>>> +      */
>>>> +     buddy = get_buddy(block);
>>>> +     if (buddy &&
>>>> +         (drm_buddy_block_is_free(block) &&
>>>> +          drm_buddy_block_is_free(buddy)))
>>>> +             __drm_buddy_free(mm, block);
>>>> +     return ERR_PTR(err);
>>>> +}
>>>> +
>>>> +static struct drm_buddy_block *
>>>> +alloc_from_freelist(struct drm_buddy *mm,
>>>> +                 unsigned int order,
>>>> +                 unsigned long flags)
>>>>    {
>>>>        struct drm_buddy_block *block = NULL;
>>>>        unsigned int i;
>>>> @@ -320,78 +394,29 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>>>>        while (i != order) {
>>>>                err = split_block(mm, block);
>>>>                if (unlikely(err))
>>>> -                     goto out_free;
>>>> +                     goto err_undo;
>>>>
>>>> -             /* Go low */
>>>> -             block = block->left;
>>>> +             block = block->right;
>>>>                i--;
>>>>        }
>>>> -
>>>> -     mark_allocated(block);
>>>> -     mm->avail -= drm_buddy_block_size(mm, block);
>>>> -     kmemleak_update_trace(block);
>>>>        return block;
>>>>
>>>> -out_free:
>>>> +err_undo:
>>>>        if (i != order)
>>>>                __drm_buddy_free(mm, block);
>>>>        return ERR_PTR(err);
>>>>    }
>>>> -EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>>>> -
>>>> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>>>> -{
>>>> -     return s1 <= e2 && e1 >= s2;
>>>> -}
>>>> -
>>>> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>>>> -{
>>>> -     return s1 <= s2 && e1 >= e2;
>>>> -}
>>>>
>>>> -/**
>>>> - * drm_buddy_alloc_range - allocate range
>>>> - *
>>>> - * @mm: DRM buddy manager to allocate from
>>>> - * @blocks: output list head to add allocated blocks
>>>> - * @start: start of the allowed range for this block
>>>> - * @size: size of the allocation
>>>> - *
>>>> - * Intended for pre-allocating portions of the address space, for example to
>>>> - * reserve a block for the initial framebuffer or similar, hence the expectation
>>>> - * here is that drm_buddy_alloc_blocks() is still the main vehicle for
>>>> - * allocations, so if that's not the case then the drm_mm range allocator is
>>>> - * probably a much better fit, and so you should probably go use that instead.
>>>> - *
>>>> - * Note that it's safe to chain together multiple alloc_ranges
>>>> - * with the same blocks list
>>>> - *
>>>> - * Returns:
>>>> - * 0 on success, error code on failure.
>>>> - */
>>>> -int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>> -                       struct list_head *blocks,
>>>> -                       u64 start, u64 size)
>>>> +static int __alloc_range(struct drm_buddy *mm,
>>>> +                      struct list_head *dfs,
>>>> +                      u64 start, u64 size,
>>>> +                      struct list_head *blocks)
>>>>    {
>>>>        struct drm_buddy_block *block;
>>>>        struct drm_buddy_block *buddy;
>>>>        LIST_HEAD(allocated);
>>>> -     LIST_HEAD(dfs);
>>>>        u64 end;
>>>>        int err;
>>>> -     int i;
>>>> -
>>>> -     if (size < mm->chunk_size)
>>>> -             return -EINVAL;
>>>> -
>>>> -     if (!IS_ALIGNED(size | start, mm->chunk_size))
>>>> -             return -EINVAL;
>>>> -
>>>> -     if (range_overflows(start, size, mm->size))
>>>> -             return -EINVAL;
>>>> -
>>>> -     for (i = 0; i < mm->n_roots; ++i)
>>>> -             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>>>
>>>>        end = start + size - 1;
>>>>
>>>> @@ -399,7 +424,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>                u64 block_start;
>>>>                u64 block_end;
>>>>
>>>> -             block = list_first_entry_or_null(&dfs,
>>>> +             block = list_first_entry_or_null(dfs,
>>>>                                                 struct drm_buddy_block,
>>>>                                                 tmp_link);
>>>>                if (!block)
>>>> @@ -436,8 +461,8 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>                                goto err_undo;
>>>>                }
>>>>
>>>> -             list_add(&block->right->tmp_link, &dfs);
>>>> -             list_add(&block->left->tmp_link, &dfs);
>>>> +             list_add(&block->right->tmp_link, dfs);
>>>> +             list_add(&block->left->tmp_link, dfs);
>>>>        } while (1);
>>>>
>>>>        list_splice_tail(&allocated, blocks);
>>>> @@ -459,7 +484,120 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>        drm_buddy_free_list(mm, &allocated);
>>>>        return err;
>>>>    }
>>>> -EXPORT_SYMBOL(drm_buddy_alloc_range);
>>>> +
>>>> +static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>>>> +                                u64 start,
>>>> +                                u64 size,
>>>> +                                struct list_head *blocks)
>>>> +{
>>>> +     LIST_HEAD(dfs);
>>>> +     int i;
>>>> +
>>>> +     for (i = 0; i < mm->n_roots; ++i)
>>>> +             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>>> +
>>>> +     return __alloc_range(mm, &dfs, start, size, blocks);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_buddy_alloc_blocks - allocate power-of-two blocks
>>>> + *
>>>> + * @mm: DRM buddy manager to allocate from
>>>> + * @start: start of the allowed range for this block
>>>> + * @end: end of the allowed range for this block
>>>> + * @size: size of the allocation
>>>> + * @min_page_size: alignment of the allocation
>>>> + * @blocks: output list head to add allocated blocks
>>>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>>> + *
>>>> + * alloc_range_bias() called on range limitations, which traverses
>>>> + * the tree and returns the desired block.
>>>> + *
>>>> + * alloc_from_freelist() called when *no* range restrictions
>>>> + * are enforced, which picks the block from the freelist.
>>>> + *
>>>> + * Returns:
>>>> + * 0 on success, error code on failure.
>>>> + */
>>>> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>> +                        u64 start, u64 end, u64 size,
>>>> +                        u64 min_page_size,
>>>> +                        struct list_head *blocks,
>>>> +                        unsigned long flags)
>>>> +{
>>>> +     struct drm_buddy_block *block = NULL;
>>>> +     unsigned int min_order, order;
>>>> +     unsigned long pages;
>>>> +     LIST_HEAD(allocated);
>>>> +     int err;
>>>> +
>>>> +     if (size < mm->chunk_size)
>>>> +             return -EINVAL;
>>>> +
>>>> +     if (min_page_size < mm->chunk_size)
>>>> +             return -EINVAL;
>>>> +
>>>> +     if (!is_power_of_2(min_page_size))
>>>> +             return -EINVAL;
>>>> +
>>>> +     if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>>>> +             return -EINVAL;
>>>> +
>>>> +     if (end > mm->size)
>>>> +             return -EINVAL;
>>>> +
>>>> +     if (range_overflows(start, size, mm->size))
>>>> +             return -EINVAL;
>>>> +
>>>> +     /* Actual range allocation */
>>>> +     if (start + size == end)
>>>> +             return __drm_buddy_alloc_range(mm, start, size, blocks);
>>>> +
>>>> +     pages = size >> ilog2(mm->chunk_size);
>>>> +     order = fls(pages) - 1;
>>>> +     min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>>> +
>>>> +     do {
>>>> +             order = min(order, (unsigned int)fls(pages) - 1);
>>>> +             BUG_ON(order > mm->max_order);
>>>> +             BUG_ON(order < min_order);
>>>> +
>>>> +             do {
>>>> +                     if (start || end != size)
>>>> +                             /* Allocate traversing within the range */
>>>> +                             block = alloc_range_bias(mm, start, end, order);
>>>> +                     else
>>>> +                             /* Allocate from freelist */
>>>> +                             block = alloc_from_freelist(mm, order, flags);
>>>> +
>>>> +                     if (!IS_ERR(block))
>>>> +                             break;
>>>> +
>>>> +                     if (order-- == min_order) {
>>>> +                             err = -ENOSPC;
>>>> +                             goto err_free;
>>>> +                     }
>>>> +             } while (1);
>>>> +
>>>> +             mark_allocated(block);
>>>> +             mm->avail -= drm_buddy_block_size(mm, block);
>>>> +             kmemleak_update_trace(block);
>>>> +             list_add_tail(&block->link, &allocated);
>>>> +
>>>> +             pages -= BIT(order);
>>>> +
>>>> +             if (!pages)
>>>> +                     break;
>>>> +     } while (1);
>>>> +
>>>> +     list_splice_tail(&allocated, blocks);
>>>> +     return 0;
>>>> +
>>>> +err_free:
>>>> +     drm_buddy_free_list(mm, &allocated);
>>>> +     return err;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>>>>
>>>>    /**
>>>>     * drm_buddy_block_print - print block information
>>>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> index 247714bab044..7aef6ad9fe84 100644
>>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>>        struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>>>        struct i915_ttm_buddy_resource *bman_res;
>>>>        struct drm_buddy *mm = &bman->mm;
>>>> -     unsigned long n_pages;
>>>> -     unsigned int min_order;
>>>> +     unsigned long n_pages, lpfn;
>>>>        u64 min_page_size;
>>>>        u64 size;
>>>>        int err;
>>>>
>>>> -     GEM_BUG_ON(place->fpfn || place->lpfn);
>>>> +     lpfn = place->lpfn;
>>>> +     if (!lpfn)
>>>> +             lpfn = man->size;
>>>>
>>>>        bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>>>>        if (!bman_res)
>>>> @@ -60,10 +61,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>>                min_page_size = bo->page_alignment << PAGE_SHIFT;
>>>>
>>>>        GEM_BUG_ON(min_page_size < mm->chunk_size);
>>>> -     min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>>> +
>>>>        if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>> +             unsigned long pages;
>>>> +
>>>>                size = roundup_pow_of_two(size);
>>>> -             min_order = ilog2(size) - ilog2(mm->chunk_size);
>>>> +             min_page_size = size;
>>>> +
>>>> +             pages = size >> ilog2(mm->chunk_size);
>>>> +             if (pages > lpfn)
>>>> +                     lpfn = pages;
>>>>        }
>>>>
>>>>        if (size > mm->size) {
>>>> @@ -73,34 +80,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>>
>>>>        n_pages = size >> ilog2(mm->chunk_size);
>>>>
>>>> -     do {
>>>> -             struct drm_buddy_block *block;
>>>> -             unsigned int order;
>>>> -
>>>> -             order = fls(n_pages) - 1;
>>>> -             GEM_BUG_ON(order > mm->max_order);
>>>> -             GEM_BUG_ON(order < min_order);
>>>> -
>>>> -             do {
>>>> -                     mutex_lock(&bman->lock);
>>>> -                     block = drm_buddy_alloc_blocks(mm, order);
>>>> -                     mutex_unlock(&bman->lock);
>>>> -                     if (!IS_ERR(block))
>>>> -                             break;
>>>> -
>>>> -                     if (order-- == min_order) {
>>>> -                             err = -ENOSPC;
>>>> -                             goto err_free_blocks;
>>>> -                     }
>>>> -             } while (1);
>>>> -
>>>> -             n_pages -= BIT(order);
>>>> -
>>>> -             list_add_tail(&block->link, &bman_res->blocks);
>>>> -
>>>> -             if (!n_pages)
>>>> -                     break;
>>>> -     } while (1);
>>>> +     mutex_lock(&bman->lock);
>>>> +     err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>>> +                                  (u64)lpfn << PAGE_SHIFT,
>>>> +                                  (u64)n_pages << PAGE_SHIFT,
>>>> +                                  min_page_size,
>>>> +                                  &bman_res->blocks,
>>>> +                                  bman_res->flags);
>>>> +     mutex_unlock(&bman->lock);
>>>> +     if (unlikely(err))
>>>> +             goto err_free_blocks;
>>>>
>>>>        *res = &bman_res->base;
>>>>        return 0;
>>>> @@ -268,12 +257,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>>>>    {
>>>>        struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>>>        struct drm_buddy *mm = &bman->mm;
>>>> +     unsigned long flags = 0;
>>>>        int ret;
>>>>
>>>>        mutex_lock(&bman->lock);
>>>> -     ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>>>> +     ret = drm_buddy_alloc_blocks(mm, start,
>>>> +                                  start + size,
>>>> +                                  size, mm->chunk_size,
>>>> +                                  &bman->reserved,
>>>> +                                  flags);
>>>>        mutex_unlock(&bman->lock);
>>>>
>>>>        return ret;
>>>>    }
>>>> -
>>>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>> index 312077941411..72c90b432e87 100644
>>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>> @@ -20,6 +20,7 @@ struct drm_buddy;
>>>>     *
>>>>     * @base: struct ttm_resource base class we extend
>>>>     * @blocks: the list of struct i915_buddy_block for this resource/allocation
>>>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>>>     * @mm: the struct i915_buddy_mm for this resource
>>>>     *
>>>>     * Extends the struct ttm_resource to manage an address space allocation with
>>>> @@ -28,6 +29,7 @@ struct drm_buddy;
>>>>    struct i915_ttm_buddy_resource {
>>>>        struct ttm_resource base;
>>>>        struct list_head blocks;
>>>> +     unsigned long flags;
>>>>        struct drm_buddy *mm;
>>>>    };
>>>>
>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>> index f524db152413..1f2435426c69 100644
>>>> --- a/include/drm/drm_buddy.h
>>>> +++ b/include/drm/drm_buddy.h
>>>> @@ -131,12 +131,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
>>>>
>>>>    void drm_buddy_fini(struct drm_buddy *mm);
>>>>
>>>> -struct drm_buddy_block *
>>>> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
>>>> -
>>>> -int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>> -                       struct list_head *blocks,
>>>> -                       u64 start, u64 size);
>>>> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>> +                        u64 start, u64 end, u64 size,
>>>> +                        u64 min_page_size,
>>>> +                        struct list_head *blocks,
>>>> +                        unsigned long flags);
>>>>
>>>>    void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>>>
> 
