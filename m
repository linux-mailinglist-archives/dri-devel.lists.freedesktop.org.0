Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DB841D5E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 09:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E72112C32;
	Tue, 30 Jan 2024 08:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24E1112099;
 Tue, 30 Jan 2024 08:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706602554; x=1738138554;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mLRURpRWIUpTzCQZTz+CcMOXUnz3YS2UV5Lmd697HJ0=;
 b=Cr6cG+QLTALxleTihg2zAVISjTSPsHqf7fSqv391ryEFwSoWh6aPck8H
 9hS9wCguu9aFLeC7lPnkofW7AMABOXR+k6eN0UCRrFkYhNKxP9wIUBCv+
 t0HTghJI/NG8ltFXVdYIfaP/Wa6pe1IR3GMw7YqP5Hg2ROQisi1509bLr
 Nkn7Kr1iIcJPBx7p1tNJokp+DOE3XzPMwCFFkfezSyHVyWwd6V975oxl1
 JCn4W+iYLg+k26RVZZzeUWJOZTEpo0hL4XAAYRiOL9cQ08gqWjfkplsYv
 tr3eDgM4SE0d2byI/WQWHGkRzFyC/f+ZbHmZyVVA4BNHm06YzS92tnOHU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="3079349"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3079349"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 00:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="858399032"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="858399032"
Received: from skofoed-mobl.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 00:15:47 -0800
Message-ID: <f1ad0bcb-c7e0-4c56-9982-38362bb70d56@linux.intel.com>
Date: Tue, 30 Jan 2024 09:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix a build error
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240127155327.423294-1-oak.zeng@intel.com>
 <21f2b595-0690-4372-bd81-86d23ac7498b@gmail.com>
 <0d1e2c15-c951-4c97-b242-a1231ae4f608@linux.intel.com>
 <SA1PR11MB6991072A876ED10A0CEE193F927E2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <SA1PR11MB6991072A876ED10A0CEE193F927E2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Amaranath.Somalapuram@amd.com" <Amaranath.Somalapuram@amd.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Oak

On 1/29/24 21:29, Zeng, Oak wrote:
> Hi Thomas,
>
> My patch was based on drm-tip.... because I found drm-tip is broken....

Yes, but drm-tip is rebuilt and force-pushed every time any of the 
merged branches adds a new commit, so any commit needs to land in any of 
the included branches, and when that is not possible because of 
interdependencies, it needs to land in a merge commit, or a separate 
"fixup" to a merge.

All described here:

https://drm.pages.freedesktop.org/maintainer-tools/drm-tip.html#

What was happening in this case was that the "fixup" Christian had added 
somehow didn't work, so I removed it and added a new one. We never apply 
patches directly on drm-tip.

/Thomas


>
> As long as drm-tip can build, I am all good.
>
> Thanks,
> Oak
>
>> -----Original Message-----
>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Sent: Monday, January 29, 2024 3:26 PM
>> To: Christian König <ckoenig.leichtzumerken@gmail.com>; Zeng, Oak
>> <oak.zeng@intel.com>; dri-devel@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org
>> Cc: Amaranath.Somalapuram@amd.com; De Marchi, Lucas
>> <lucas.demarchi@intel.com>
>> Subject: Re: [PATCH] drm/xe: Fix a build error
>>
>> Hi,
>>
>> On 1/29/24 17:48, Christian König wrote:
>>> Am 27.01.24 um 16:53 schrieb Oak Zeng:
>>>> This fixes a build failure on drm-tip. This issue was introduced during
>>>> merge of "drm/ttm: replace busy placement with flags v6". For some
>>>> reason, the xe_bo.c part of above change is not merged. Manually merge
>>>> the missing part to drm_tip
>>> Mhm, I provided this as manual fixup for drm-tip in this rerere commit:
>>>
>>> commit afc5797e8c03bed3ec47a34f2bc3cf03fce24411
>>> Author: Christian König <christian.koenig@amd.com>
>>> Date:   Thu Jan 25 10:44:54 2024 +0100
>>>
>>>      2024y-01m-25d-09h-44m-07s UTC: drm-tip rerere cache update
>>>
>>>      git version 2.34.1
>>>
>>>
>>> And for me compiling xe in drm-tip worked fine after that. No idea why
>>> that didn't work for you.
>>>
>>> Anyway feel free to add my rb to this patch here if it helps in any way.
>>>
>>> Regards,
>>> Christian.
>> I reverted that rerere cache update and added another one, so now it
>> works. Not sure exactly what the difference was, but the resulting patch
>> was for the drm-misc-next merge in my case, and It was for
>> drm-xe-something in your case.
>>
>> /Thomas
>>
>>
>>>> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_bo.c | 33 +++++++++++++++------------------
>>>>    1 file changed, 15 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 686d716c5581..d6a193060cc0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -38,22 +38,26 @@ static const struct ttm_place sys_placement_flags
>>>> = {
>>>>    static struct ttm_placement sys_placement = {
>>>>        .num_placement = 1,
>>>>        .placement = &sys_placement_flags,
>>>> -    .num_busy_placement = 1,
>>>> -    .busy_placement = &sys_placement_flags,
>>>>    };
>>>>    -static const struct ttm_place tt_placement_flags = {
>>>> -    .fpfn = 0,
>>>> -    .lpfn = 0,
>>>> -    .mem_type = XE_PL_TT,
>>>> -    .flags = 0,
>>>> +static const struct ttm_place tt_placement_flags[] = {
>>>> +    {
>>>> +        .fpfn = 0,
>>>> +        .lpfn = 0,
>>>> +        .mem_type = XE_PL_TT,
>>>> +        .flags = TTM_PL_FLAG_DESIRED,
>>>> +    },
>>>> +    {
>>>> +        .fpfn = 0,
>>>> +        .lpfn = 0,
>>>> +        .mem_type = XE_PL_SYSTEM,
>>>> +        .flags = TTM_PL_FLAG_FALLBACK,
>>>> +    }
>>>>    };
>>>>      static struct ttm_placement tt_placement = {
>>>> -    .num_placement = 1,
>>>> -    .placement = &tt_placement_flags,
>>>> -    .num_busy_placement = 1,
>>>> -    .busy_placement = &sys_placement_flags,
>>>> +    .num_placement = 2,
>>>> +    .placement = tt_placement_flags,
>>>>    };
>>>>      bool mem_type_is_vram(u32 mem_type)
>>>> @@ -230,8 +234,6 @@ static int __xe_bo_placement_for_flags(struct
>>>> xe_device *xe, struct xe_bo *bo,
>>>>        bo->placement = (struct ttm_placement) {
>>>>            .num_placement = c,
>>>>            .placement = bo->placements,
>>>> -        .num_busy_placement = c,
>>>> -        .busy_placement = bo->placements,
>>>>        };
>>>>          return 0;
>>>> @@ -251,7 +253,6 @@ static void xe_evict_flags(struct
>>>> ttm_buffer_object *tbo,
>>>>            /* Don't handle scatter gather BOs */
>>>>            if (tbo->type == ttm_bo_type_sg) {
>>>>                placement->num_placement = 0;
>>>> -            placement->num_busy_placement = 0;
>>>>                return;
>>>>            }
>>>>    @@ -1391,8 +1392,6 @@ static int __xe_bo_fixed_placement(struct
>>>> xe_device *xe,
>>>>        bo->placement = (struct ttm_placement) {
>>>>            .num_placement = 1,
>>>>            .placement = place,
>>>> -        .num_busy_placement = 1,
>>>> -        .busy_placement = place,
>>>>        };
>>>>          return 0;
>>>> @@ -2150,9 +2149,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>>>>          xe_place_from_ttm_type(mem_type, &requested);
>>>>        placement.num_placement = 1;
>>>> -    placement.num_busy_placement = 1;
>>>>        placement.placement = &requested;
>>>> -    placement.busy_placement = &requested;
>>>>          /*
>>>>         * Stolen needs to be handled like below VRAM handling if we
>>>> ever need
