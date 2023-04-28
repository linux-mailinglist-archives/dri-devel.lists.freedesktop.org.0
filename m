Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4006F1459
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 11:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B0310E3C7;
	Fri, 28 Apr 2023 09:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BB710E3B6;
 Fri, 28 Apr 2023 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682675013; x=1714211013;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6JMYowT+3BNj7Tyvw43TWjHH9QzaxU2LV3yJgoolpP0=;
 b=Ihx6+d58fM1+c6vy5cl/JkaMaUnnb8/u/THOCaWCSB23Zp6Aw9dA4cAA
 BbumVRHer7WbjLRWO6BiRDyeSBIu9JZRSQUS0o0ED237PysEr+xoFkrKE
 MdPakGD9MGJGHG5P6EEk9OpypIVJAuTOshsCZWtMfVqeIL4o+TAiecAZL
 LQu+AtAYrt2ib4WGDVGYv6kvJ997pldwSbkrcg03GQ+jWCmlfMZxWHzxG
 UNvE8SCQBHBZtmc8cvqY7q/TCo8O6F+D5HAItNeA/VJOHMupVEiwnRefY
 Kl2EIV4UsDxjzEKl/Azy9O5mwqAsOHdYL0hhz0ig2h9WHZjeYHPAjWLEH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346469242"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="346469242"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 02:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="759593119"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="759593119"
Received: from ksathish-mobl.ger.corp.intel.com (HELO [10.213.194.196])
 ([10.213.194.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 02:43:31 -0700
Message-ID: <962c29c2-ca50-118e-4849-77324b510929@linux.intel.com>
Date: Fri, 28 Apr 2023 10:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v2 0/5] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230426062423.320519-1-fei.yang@intel.com>
 <c7cb1466-e698-ff3f-0572-4693c4b0025c@linux.intel.com>
 <BYAPR11MB2567F72C44D485E628A574069A659@BYAPR11MB2567.namprd11.prod.outlook.com>
 <7d5d497d-b552-d8d9-e58c-20f4b0ded76c@linux.intel.com>
 <BYAPR11MB25676FC11B8AC0045BABCC849A6A9@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB25676FC11B8AC0045BABCC849A6A9@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/04/2023 17:07, Yang, Fei wrote:
>  > On 26/04/2023 16:41, Yang, Fei wrote:
>  >>> On 26/04/2023 07:24, fei.yang@intel.com wrote:
>  >>>> From: Fei Yang <fei.yang@intel.com>
>  >>>>
>  >>>> The first three patches in this series are taken from
>  >>>> https://patchwork.freedesktop.org/series/116868/
>  >>>> These patches are included here because the last patch
>  >>>> has dependency on the pat_index refactor.
>  >>>>
>  >>>> This series is focusing on uAPI changes,
>  >>>> 1. end support for set caching ioctl [PATCH 4/5]
>  >>>> 2. add set_pat extension for gem_create [PATCH 5/5]
>  >>>>
>  >>>> v2: drop one patch that was merged separately
>  >>>>      341ad0e8e254 drm/i915/mtl: Add PTE encode function
>  >>>
>  >>> Are the re-sends for stabilizing the series, or focusing on merge?
>  >>
>  >> v2 was sent just to drop one of patches that has already been merged.
>  >>
>  >>> If the latter then opens are:
>  >>>
>  >>> 1) Link to Mesa MR reviewed and ready to merge.
>  >>>
>  >>> 2) IGT reviewed.
>  >>>
>  >>> 3) I raised an open that get/set_caching should not "lie" but return an
>  >>> error if set pat extension has been used. I don't see a good reason not
>  >>> to do that.
>  >>
>  >> I don't think it's "lying" to the userspace. the comparison is only 
> valid
>  >> for objects created by KMD because only such object uses the pat_index
>  >> from the cachelevel_to_pat table.
>  >
>  > Lets double check my understanding is correct. Userspace sequence of
>  > operations:
>  > 1)
>  > obj = gem_create()+set_pat(PAT_UC)
>  >
>  > 2a)
>  > get_caching(obj)
>> What gets reported?
> 
> I see your point here. nice catch.
> That should be handled by,
> if (obj->cachel_level == I915_CACHE_INVAL) /* indicated pat-index is set 
> by userspace */
>       return -EOPNOTSUPP;
> Will update the patch.
> 
>  >
>  > 2b)
>  > set_caching(obj, I915_CACHE_LLC)
>> What is the return code?
> 
> This will either return -EOPNOTSUPP, or ignored because set_pat 
> extension was called.

I see that you made it fail instead of fake success in the latest respin 
and I definitely agree with that.

> 
>  >
>  > If answer to 2a is I915_CACHING_CACHED and to 2b) success, then please
>  > state a good reason why both shouldn't return an error.
>  >
>  >>
>  >>> + Joonas on this one.
>  >>>
>  >>> 4) Refactoring as done is not very pretty and I proposed an idea for a
>  >>> nicer approach. Feasible or not, open for discussion.
>  >>
>  >> Still digesting your proposal. but not sure how would you define things
>  >> like PAT_UC as that is platform dependent, not a constant.
>  >
>  > "PAT_UC" in my outline was purely a driver specific value, similarly as
>  > I915_CACHE_... are.
> 
> Okay. Then you were suggesting to add a translation table for 
> pat_index-to-(PAT-UC/WB/WT)?
> It's going to be a N:1 mapping.

PAT index to a value, probably a bitmask, built out of bits which define 
caching modes. Like "PAT_WB | PAT_1WAY_COHERENT", or just PAT_WB. Would 
that approach be enough to express everything?

> 
>  > With the whole point that driver can ask if
>  > something is uncached, WT or whatever. Using the platform specific
>  > mapping table which converts platform specific obj->pat_index to driver
>  > representation of caching modes (PAT_UC etc).
> 
> Are you suggesting completely remove i915_cache_level and use 
> (PAT-UC/WB/WT) instead?

Not completely but throughout the most internal code paths, which would 
all just work on PAT index. Basically object always has PAT index set, 
with a separate boolean saying whether it came from gem_create_ext or 
set_cache_level.

> Let's say a KMD object wants to be set as WB, how you get the exact 
> pat_index to use?
> Note that there are multiple PAT indices having caching mod WB, but they 
> are different,
> e.g. do you want just WB or WB with 1-way-coherency or WB with 2-way 
> coherency?

Just use the cache_level to pat_index mapping you added in the series?

> Also, in case a checking of pat_index is needed, do we say WB with 
> 1-way-coherency is
> equal to WB or not?

You mean the call sites where i915 is checking the object caching mode?

We have two call sites which check for !I915_CACHE_NONE. Those would 
just check if PAT_UC is not set.

Then the one in gpu_write_needs_clflush is checking for neither UC nor 
WT, which also directly translates.

For the WB case there aren't any callers but if we just checked for 
"base" PAT_WB bit being set that would work.

So in all cases helper which does "return bits_required | bits_set" 
seems would work fine.

> BTW, isn't PAT-UC/WB/WT the same kind of abstraction as enum 
> i915_cache_level, I'm not
> sure how that would simplify anything.

As I wrote before, I *think* it provides a way of not needing to 
sprinkle around i915_gem_get_pat_index and a simpler "has_cache_level". 
Conceptually cache_level->pat_index is done only in gem_create_ext and 
set_cache_level. Lower level code does not have to consult cache_level 
at all. And existence of tables simplifies the pretty printing code to a 
platform agnostic loop.

I *think* at least.. We can leave it all for later. My main concern was 
that UAPI needs to be clear and solid which it now seems to be.

Regards,

Tvrtko

> 
>  > Quite possible I missed some detail, but if I haven't then it could be
>  > a neat and lightweight solution.
>  >
>  > Regards,
>  >
>  > Tvrtko
