Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CCE66BE82
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 14:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A4D10E298;
	Mon, 16 Jan 2023 13:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6696B10E298;
 Mon, 16 Jan 2023 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673874070; x=1705410070;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xIJ1hv6ZQwIGUeEC5LjZpLgGbF4YVQDa1JdHq8H8/Gg=;
 b=IH9zsoyWnImeKm23KnDLV3XICJpL9Um5zZxSIFIRqFisn1vAkYCeuRJC
 4JaBwnU3qIGcaoM3755fSB9lKKbxHdZyebgW4RhH+cxN5dfPHhWOOL9TT
 Sw6O9NNMo0q8IUqetYth4cSla3bbR4Fi88S6H/hP4RmHKHP+xzqxDBzjl
 hwy/+E5uFN1rfWNtIN4f+VdzieaPQduaGWs7XDcYxLGzm9u5RGx+v2Bi7
 HPWOmAxuKzDMU0CEcbZ6vGn2VCg1Y3ATb+qQawjy3D3Ky7yz5O6wsG+hT
 DntfCeEBzhzYtfp+AvCQrK88K9yAshs4kVZDQ0tevN0+WV01IX6Cv0TH5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="323156365"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="323156365"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 05:01:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="832830810"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="832830810"
Received: from hgacquin-mobl1.ger.corp.intel.com (HELO [10.213.212.173])
 ([10.213.212.173])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 05:01:07 -0800
Message-ID: <9a7e910b-f546-2999-80ab-494d606942c7@linux.intel.com>
Date: Mon, 16 Jan 2023 13:01:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/gt: Remove platform comments
 from workarounds
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
 <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
 <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
 <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
 <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
 <2641f51d-8b79-0d47-90f5-b60e9f6edf33@linux.intel.com>
 <Y7XUvMUDYEHwX17+@mdroper-desk1.amr.corp.intel.com>
 <3a5eefc2-aad7-f22e-e54e-6f9af00edb48@linux.intel.com>
 <20230112214243.45exhnkfwsikxddj@ldmartin-desk2>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230112214243.45exhnkfwsikxddj@ldmartin-desk2>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/01/2023 21:42, Lucas De Marchi wrote:
> On Thu, Jan 05, 2023 at 01:35:52PM +0000, Tvrtko Ursulin wrote:
>>
>> Okay to sum it up below with some final notes..
>>
>> On 04/01/2023 19:34, Matt Roper wrote:
>>> On Wed, Jan 04, 2023 at 09:58:13AM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 23/12/2022 18:28, Lucas De Marchi wrote:
>>>>> On Fri, Dec 23, 2022 at 09:02:35AM +0000, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 22/12/2022 15:55, Lucas De Marchi wrote:
>>>>>>> On Thu, Dec 22, 2022 at 10:27:00AM +0000, Tvrtko Ursulin wrote:
>>>>>>>>
>>>>>>>> On 22/12/2022 08:25, Lucas De Marchi wrote:
>>>>>>>>> The comments are redundant to the checks being done to apply the
>>>>>>>>> workarounds and very often get outdated as workarounds need to be
>>>>>>>>> extended to new platforms or steppings.  Remove them altogether 
>>>>>>>>> with
>>>>>>>>> the following matches (platforms extracted from 
>>>>>>>>> intel_workarounds.c):
>>>>>>>>>
>>>>>>>>>     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>>>>>>> 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
>>>>>>>>>     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>>>>>>> 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
>>>>>>>>>
>>>>>>>>> Same things was executed in the gem directory, omitted
>>>>>>>>> here for brevity.
>>>>>>>>
>>>>>>>>> There were a few false positives that included the workaround
>>>>>>>>> description. Those were manually patched.
>>>>>>>>
>>>>>>>> sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'
>>>>>>>
>>>>>>> then there are false negatives. We have Was in the form
>>>>>>> "Wa_xxx:tgl,dg2, mtl". False positives we can fixup, false negatives
>>>>>>> we simply don't see. After running that in gt/:
>>>>>>>
>>>>>>> $ git grep ": mtl" -- drivers/gpu/drm/i915/
>>>>>>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>>>>>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>>>>>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>>>>>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>>>>>> drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c:       * 
>>>>>>> Wa_14017073508: mtl
>>>>>>> drivers/gpu/drm/i915/i915_reg.h:/* Wa_14017210380: mtl */
>>>>>>>
>>>>>>> I was going with the platform names to avoid the false
>>>>>>> negatives and because I was entertaining the idea of only doing 
>>>>>>> this for
>>>>>>> latest platforms where we do have the "Wa_[[:number:]]" form
>>>>>>>
>>>>>>>>
>>>>>>>> Maybe..
>>>>>>>>
>>>>>>>> Matt recently said he has this worked planned, but more
>>>>>>>> importantly - I gather then that the WA lookup tool
>>>>>>>> definitely does not output these strings?
>>>>>>>
>>>>>>> Whatever it does it's true only at the time it's called. It
>>>>>>> simply tells what
>>>>>>> are the platforms and steppings the Wa applies to. We can change the
>>>>>>> output to whatever we want, but that is not the point.
>>>>>>> Those comments get stale and bring no real value as they match 1:1
>>>>>>> what the code is supposed to be doing. Several times a patch has to
>>>>>>> update just that comment to "extend a workaround" to a next 
>>>>>>> platform.
>>>>>>> This is not always done, so we get a comment that doesn't match 
>>>>>>> what is
>>>>>>> supposed to be there.
>>>>>>
>>>>>> Tl;dr; version - lets park this until January and discuss once
>>>>>> everyone is back.
>>>>>
>>>>> I'll leave my comment here since I will be out until mid January.
>>>>>
>>>>>>
>>>>>> Longer version. I've been trying to get us talking about this a
>>>>>> couple times before and I'd really like to close with an explicit
>>>>>> consensus, discussion points addressed instead of skipped and just
>>>>>> moving ahead with patches.
>>>>>>
>>>>>> References:
>>>>>>  3fcf71b9-337f-6186-7b00-27cbfd116743@linux.intel.com
>>>>>>  Y5j0b/bykbitCa4Q@mdroper-desk1.amr.corp.intel.com
>>>>>>
>>>>>> So point I wanted to discuss is whether these comments are truly
>>>>>> useless or maybe they can help during review. If the tool can
>>>>>> actually output them then I am leaning towards that they can be.
>>>>>
>>>>> I consider "can the tool output xyz?" asking the wrong question.
>>>>> "The tool", which is our own small python script querying a 
>>>>> database can
>>>>> output anything like that if we want to. The database has 
>>>>> information of
>>>>> what are the platforms/steppings for each the WA is known to be 
>>>>> applied
>>>>> *today*. And that can change and do change often, particularly for 
>>>>> early
>>>>> steppings and recent platforms.
>>>>>
>>>>>> Thought is, when a patch comes for review adding a new platform,
>>>>>> stepping, whatever, to an existing if condition, if it contains the
>>>>>> comments reviewer can more easily spot a hyphotetical logic
>>>>>> inversion error or similar. It is also trivial to check that both
>>>>>> condition and comment have been updated. (So lets not be rash and
>>>>>> remove something maybe useful just because it can go stale *only if*
>>>>>> reviewers are not giving sufficient attention that changes are made
>>>>>> in tandem.)
>>>>>
>>>>> I can argue to the other side too. We don't have comments in the 
>>>>> kernel
>>>>> like
>>>>>
>>>>>      /* Add 1 to i */
>>>>>      i += 1;
>>>>>
>>>>> This is exactly what these comments are doing. And they are misleading
>>>>
>>>> I'll file this under "Reductio ad absurdum", kind of. :)
> 
> which actually proves my point?

I don't think so, but lets move on.

>>>>> and may introduce bugs rather than helping reviewing:
>>>>>
>>>>>      Wa_12345:tgl[a0,c0)
>>>>>      if (IS_TGL_GRAPHICS_STEP(STEP_A0, STEP_B0)
>>>>>
>>>>> One might read the comment, skipping over the condition and thinking
>>>>> "ok, we already extended this WA to B* steppings, which doesn't match
>>>>> the code.
>>>>
>>>> That would be reviewer error to assume B0 is the last B stepping, 
>>>> without
>>>> actually checking. Equally as reviewer error would be to assume any WA
>>>> adding patch is adding the correct conditions, again, without actually
>>>> checking. Which leads me to ...
>>>>
>>>>>> From a slightly different angle - do we expect anyone reviewing
>>>>>> workaround patches will cross-check against the tool? Would it be
>>>>>> simpler and more efficient that they could just cross-check against
>>>>>> the comment output from the tool and put into the patch by the
>>>>>> author?
>>>
>>> I think this is the source of the confusion; the comment lines in i915
>>> are not something the 'wa' tool outputs directly; the comments are
>>> written manually by the developer at the same time the code is written;
>>> the wa tool is just a quick python script I wrote one day to dump
>>> database information from the command line and avoid needing to fire up
>>> a web browser and click through a series of slow website links.  Also,
>>> since the wa tool queries internal databases, it spits out a bunch of
>>> Intel-internal terminology that doesn't match the terminology used in
>>> i915 code, and it also includes a bunch of garbage data that needs to be
>>> filtered out (duplicated records, mangled/incomplete records, etc.).
>>> Exactly how things are expressed (platform name like "DG2" or IP name
>>> like "Xe_HPG" also varies from platform to platform according to how the
>>> hardware guys decided to categorize things).
>>
>> Right, I was going with what AFAIR Lucas wrote earlier in the thread, 
>> to paraprhase "tool can be made to output anything we want". Maybe 
>> wasn't confusion but misleading would be more obvious. :)
> 
> I stand by what I said.... the tool is just something that queries a
> database and spits data in a better format. It can print anything you
> want. If someone wants to print the exact code and comment to be added
> in i915, it could be turned into that with a fair amount of look up
> tables to translate platform names/steppings/etc, adapt to terminology
> changes as they come, etc. The fact that would make someone's life 
> miserable
> and they would probably quit their job is implicit here. Next time I 
> will be
> explicit about "possible" vs having a good ROI.
 >
>>> Since the code and the comments are both something written by hand by
>>> the developer, there's no reason to believe the comments will be more
>>> accurate than the code.  They'll likely be far less accurate since they
>>> can't be tested like the code is, and because the existing codebase is
>>> wildly inconsistent with how we even format/represent them.
>>>
>>>>>
>>>>> see above. Someone cross-checking the comment is cross-checking the
>>>>> wrong thing. As I said, it happens more on early enabling of a 
>>>>> platform.
>>>>
>>>> ... my point which seems to have been missed by both, well question 
>>>> really,
>>>> do you expect every reviewer to cross-check against the WA database 
>>>> when
>>>> reviewing WA changes? I don't see that was answered.
>>>>
>>>> I guarantee that it won't happen and people will rubber stamp. So my
>>>> argument was that we could make it both easier for reviewers *and* 
>>>> decrease
>>>> the likelyhood of misses, if we kept platforms designators in comments.
>>>
>>> Yes, reviewers are absolutely supposed to be checking the stepping
>>> bounds of every workarounds change they review.  That's one of the most
>>> important parts of reviewing a workaround and it should be very quick
>>> and easy to do.  If people are giving rubber stamps without doing that,
>>> then they're not really doing a full review.  But I'm also not aware of
>>> any cases where we're getting rubber stamps; most of the non-comment
>>> review misses we have seem to either come from misunderstanding the
>>> semantics of platforms (especially cases like DG2 where different
>>> G10/G11/G12 variants have different stepping schemes) or technical
>>> misunderstanding of the implementation details (register reset
>>> characteristics, masked vs non-masked registers, context membership,
>>> etc.).
>>>
>>>>
>>>> Yeah it is much easier to rip them out that to find and fix the ones 
>>>> which
>>>> went out of sync but that shouldn't be high on the list of criteria.
>>>>
>>>> Argument that it is easy to overlook during review that comments and 
>>>> code do
>>>> not match I don't think holds. That describes a very sloppy review. 
>>>> And if
>>>> review is assumed to be that sloppy, do you really trust review to 
>>>> check
>>>> against the WA database?
>>>
>>> It's the same reason people who write prose can't find their own
>>> spelling/grammer mistakes.  The mistakes are "obvious," but since their
>>> brain already knows what it's "supposed" to say, they just can't see the
>>> error themselves.  Once you've reviewed the code, it just gets really
>>> hard to see where the comment doesn't align, especially for the
>>> workarounds that apply to a bunch of platforms.
>>
>> To be pedantic here - that's a writer's handicap - shouldn't be 
>> reviewers. But anyway, carrying on.
> 
> it's also a reviewer's handicap. At some point, as illustrated by the
> example below, the comment is harder to review than the code itself and
> the reviewer is already biased by their review of the code itself.

I find this:

/* Wa_12345:tgl,dg1[a0],rkl,adls,dg2_g10,dg2_g12[a0..c0) */

Much easier to mentally parse that this:

      if (IS_TIGERLAKE(i915) || IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
          IS_ALDERLAKE_P(i915) || IS_DG2_G10(i915) ||
          IS_DG2_GRAPHICS_STEP(i915, G12, STEP_A0, STEP_C0))

Let's call it a difference then.

And I really think writer's handicap cannot be used to discharge 
responsibility from reviewers becuase then you kind of nerf the whole 
concept of proof readers and reviewers. Yes mistakes can happen, but 
it's those people trained mindset to minimize that. Not to say of lets 
not bother becuase writers handicap.. Anyway, irrelevant, moving on still..

>>> For example, if I'm reviewing a patch that adds:
>>>
>>>     /* Wa_12345:tgl,dg1[a0],rkl,adls,dg2_g10,dg2_g12[a0..c0) */
>>>     if (IS_TIGERLAKE(i915) || IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
>>>         IS_ALDERLAKE_P(i915) || IS_DG2_G10(i915) ||
>>>         IS_DG2_GRAPHICS_STEP(i915, G12, STEP_A0, STEP_C0))
>>>
>>> I'm always looking at the code first and comparing that to the
>>> workaround database.  If I then review the comment second, I'm much less
>>> likely to catch the subtle errors (there are two of them in this example
>>> where the code and comment don't match!) because I mentally already know
>>> what the bounds are "supposed" to be and the comment all just kind of
>>> blends together.
>>>
>>>>
>>>> So my argument is that it is trivial for reviewers to spot comments 
>>>> and code
>>>> do not match. Trivial and fast. And it's trivial (I hope) for the WA 
>>>> tool to
>>>> output the right format for pasting in comments.
>>>
>>> Given how much terminology mismatch there is between the internal
>>> database and how we refer to things in i915 code, it's not trivial.
>>> It's also not super easy to even figure out which platforms to include
>>> in the list.  The workaround database is going to include platforms for
>>> which there is no i915 support (e.g., LKF) stuff like CNL (support
>>> already removed from i915), and future/potential platforms we can't talk
>>> about yet, etc.  Finally, when there are duplicated/conflicting records
>>> (because the people inputting the information are just human too), it
>>> takes a bit of human intelligence to read between the lines and figure
>>> out what the reality is supposed to be.
>>>
>>> Sure, these problems could probably all be solved with enough effort,
>>> but given how often the internal formatting and behavior of the database
>>> itself changes, it would be painful to keep it always working properly.
>>>
>>>>
>>>> Those are the points I would like to have explicitly discounted before
>>>> proceeding. Maybe to be even clearer the workflow would be like this:
>>>>
>>>> Patch author:
>>>>
>>>> 1. Runs the WA tool for a WA number. Tool outputs text.
>>>> 2. Pastes text verbatim in the comment.
>>>
>>> This one isn't correct today (and as noted above, not terribly easy to
>>> accomplish).  It's
>>>
>>>    2.  Developer manually writes code comment based on interpreting wa's
>>>        output.
>>
>> Given everything above lets say we concluded it is too costly to make 
>> the tool output the exact format wanted by i915 and we decide to 
>> proceed removing the platform designations. Two final questions.
> 
> agreed
> 
>>
>> Question 1)
>>
>> Is everyone okay to remove from _all_, including old legacy platforms? 
>> ROI vs churn considerations? And yes it wouldn't be ideal either to 
>> have separate rules with some cutover point like Gen8 maybe.
> 
> maybe we could land first a patch changing all the Wa_<number> ones and
> later if we find the lack of consistency is bad we extend to all of
> them?

At this point, since that plan would affects the whole driver, I think 
you need to get acks from other maintainers. My view is that on balance, 
every potential option has pros and cons, and my main thought is that 
focus should be on any solution which minimizes the amount of missed or 
misplaces workarounds per platform. Be it during initial enablement or 
code base maintenance.

>> Question 2)
>>
>> For Xe you still intend to have it a manual process and not have the 
>> tool output the macro section which could be directly pasted in the 
>> code? Would ROI of extending the tool be any better with the 
>> data-driven design like there?
> 
> I don't have any plans yet in that regard as the source for all the
> workarounds in xe actually came from i915, not from the database.
> We may play with the tool in future to output something close to the
> macros.

Cool - so you'd agree the thought about someone quitting their job in 
this scenario was really a hyperbole, yes? :)

Regards,

Tvrtko
