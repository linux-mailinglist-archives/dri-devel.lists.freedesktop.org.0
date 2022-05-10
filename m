Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC8152161A
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 14:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC0C10EE8D;
	Tue, 10 May 2022 12:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593C010EE8D;
 Tue, 10 May 2022 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652187405; x=1683723405;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+3Ckek3LMrpjM+KPPDKCaAk0aD6flGvGfcZuoeS1fk8=;
 b=kbjY+JmjI1e7gw8M5et3eZyd/yAYwwHXdgS8qzaaI4j32nlqEergDGSa
 51pcHcPsFZ/G+HbnBFQu7fc91vvHrx2MEQnON5RJchm3GkcAu0fsRat+U
 coJSeauQMmyKMVcA+N8BO5TbQUZnKnwbYz0fsCdQLbDsit1tfZeR9Jlvm
 1Yi0k54Z/de8eGJLlYGNv6noZ1fzYScIBxaQJiHT4UzgPrX0euh6rdXnr
 eYlW97b9k3eZNetgI4p+wHNSyc1yifKfw02fSVlLv9NHCwS140qoTMrit
 L7tKxeZLjA0Us2Now1HRujZDF7Y5zCpstfkAivyyPhSFdhkHpiesEDer3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249264382"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="249264382"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 05:56:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="738661558"
Received: from rcpalaku-mobl1.ger.corp.intel.com (HELO [10.213.208.196])
 ([10.213.208.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 05:56:43 -0700
Message-ID: <a8f8096c-5a4f-26d1-fd92-e24eeb52de77@linux.intel.com>
Date: Tue, 10 May 2022 13:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC] drm/amdgpu: Convert to common fdinfo format
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20220510082315.992296-1-tvrtko.ursulin@linux.intel.com>
 <ddcb244d-dfed-d571-1d54-5e1ed24a03b7@gmail.com>
 <8e197b3d-513c-0ee3-fcd4-e397794f0a79@linux.intel.com>
 <ab9f12fc-e482-42ab-cfd2-0a5f3e5d5109@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ab9f12fc-e482-42ab-cfd2-0a5f3e5d5109@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/05/2022 12:26, Christian König wrote:
> Am 10.05.22 um 12:50 schrieb Tvrtko Ursulin:
>>
>> Hi,
>>
>> On 10/05/2022 09:48, Christian König wrote:
>>> Hi Tvrtko,
>>>
>>> Am 10.05.22 um 10:23 schrieb Tvrtko Ursulin:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Convert fdinfo format to one documented in drm-usage-stats.rst.
>>>>
>>>> Opens/TODO:
>>>>   * Does someone from AMD want to take over this patch?
>>>>      (I have no access to amdgpu hardware so won't be able to test
>>>>       any hypothetical gputop work.)
>>>
>>> I can give that a try as soon as it is completed.
>>
>> And how to motivate someone on your side to pick up the amdgpu work? :)
> 
> Well if we could get more of my TTM/DRM patches reviewed I could have 
> same free time to do this :)

Yeah, we have a bunch of folks dedicatedly working on TTM and scheduling 
refactoring so I am hoping they will notice and get involved.

>>>>   * What are the semantics of AMD engine utilisation reported in 
>>>> percents?
>>>
>>> To be honest I haven't understood why we are using percents here 
>>> either, that is not something the kernel should mess with.
>>>
>>>>      * Can it align with what i915 does (same what msm will do) or need
>>>>        to document the alternative in the specification document? Both
>>>>        option are workable with instantaneous percent only needing 
>>>> support
>>>>        to be added to vendor agnostic gputop.
>>>
>>> I would prefer to just change to the ns format i915 and msm will be 
>>> using, that makes much more sense from my experience.
>>>
>>> As far as I know we haven't released any publicly available userspace 
>>> using the existing AMD specific format. So that should still be 
>>> possible.
>>
>> If amdgpu could export accumulated time context spent on engines that 
>> would indeed be perfect. It would make the gputop I sketched out most 
>> probably just work, as it did for Rob on msm.
>>
>> In which case, apart from the admgpu work, it would just be a matter 
>> of me tidying that tool a bit and re-sending out for review.
> 
> Could you push this to some repository on fdo and send me a link? Going 
> to pick up this patch here and give it a try, shouldn't be more than a 
> day of work.

Done, https://cgit.freedesktop.org/~tursulin/intel-gpu-tools/log/?h=gputop.

For extra reference the msm patch was this: 
https://lore.kernel.org/lkml/20220225202614.225197-3-robdclark@gmail.com/

If you can expose the same fields gputtop should work.

>>>>   * Can amdgpu expose drm-client-id? Without it gputop will not work.
>>>
>>> How is that determined on i915 ? Does struct drm_file has that 
>>> somewhere?
>>
>> It should correspond 1:1 with drm_file, since the purpose is to enable 
>> gputop distinguish between unique open file descriptors (aka clients).
> 
> Ah! We do have a 64bit counter for that already because of technical needs.
> 
>>
>> In theory it could be just a hash value of a struct drm_file pointer 
>> but that could confuse userspace if the struct gets reused within a 
>> single userspace sampling period.
>>
>> Because of that I track it in i915 separately since I wanted to have 
>> an incrementing cyclic property to it - so that when a fd is closed 
>> and new opened there is no practical chance they would have the same 
>> drm-client-id.
>>
>>>> * drm-engine-capacity - does the concept translate etc.
>>>
>>> I don't think we are going to need that.
>>
>> Okay, that one is optional for cases when there is more than one 
>> engine of a type/class shown under a single entry in fdinfo. So when 
>> gputop translates accumulated time into percentages it can do the 
>> right thing. Code can already handle it not being present and assume one.
> 
> Yeah, we have that case for a couple of things. The GFX, SDMA and 
> multimedia engines all have different queues which needs to be accounted 
> together as far as I can see.
> 
> E.g. we have video decode and video encode as two separate rings, but 
> essentially they use the same engine.
> 
> Need to think about how to represent that.

I think you have some freedom there as to what to export - whether the 
entity userspace submits to (is this ring in amdgpu?), or the entity 
hardware actually executes on (your engine?).

We have somewhat similar setup in i915 and I decided to expose the 
former. This makes it both (almost) match what our total metrics show 
(engine performance counters exported via perf/pmu).

So in case of your video decode and encode rings which lead to the same 
hw engine, that would mean exposing them as two entities, decode and encode.

But as said, my spec does prescribe that so it is up to implementations. 
As long as it is useful for users as first port of enquiry for 
performance problems I think it is fine.

Analogue would be hyper-threading from the CPU scheduling world and how 
top(1) cannot distinguish why one core at 0% does not mean there is half 
of the performance still one the table.

And then for a deeper down into performance more specialized GPU 
profiling tools are required.

Regards,

Tvrtko
