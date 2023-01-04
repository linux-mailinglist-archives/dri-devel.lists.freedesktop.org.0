Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47465D011
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D3F10E524;
	Wed,  4 Jan 2023 09:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3170410E524;
 Wed,  4 Jan 2023 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826297; x=1704362297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rOa9H4gmBvjM+pb1wqyo83z9QzIY7bryT1AL4rjLBtc=;
 b=JqtLdRy7vILw/Pl7RXDO/gPPiVgZwMrKKxwaMTF3YIVtWTmNXYXWwq+7
 tFsjzV9lp6Ujc6nP8OvU5Fb6QebdavD7/5sqK1g9TaYg7s0/TwDAKaYMb
 ERuakdYxMS00hHpjjmucGLILO3GMscb5onb1bxOhEjpOi0C20TM0MwHng
 9Y37EpicHdU/tj25qRsRMRgIctQC7kVJO+dxKvB87Sj5PJodv5c5+8gIN
 3vCn5tRCJIQ3Uh3O2Y2C6MFW+nF2AbRi4xOo+ICs67nJCwDYIS9UwtamP
 fwOjn4XKcpYFejFmNaW8EuKKjtt9H498ojOxPDY5PKQXX9Hs2Od+5Gai3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="408155288"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="408155288"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 01:58:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="723589330"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="723589330"
Received: from wfurtakx-mobl.ger.corp.intel.com (HELO [10.213.223.45])
 ([10.213.223.45])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 01:58:15 -0800
Message-ID: <2641f51d-8b79-0d47-90f5-b60e9f6edf33@linux.intel.com>
Date: Wed, 4 Jan 2023 09:58:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] drm/i915/gt: Remove platform comments from workarounds
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
 <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
 <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
 <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
 <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
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


On 23/12/2022 18:28, Lucas De Marchi wrote:
> On Fri, Dec 23, 2022 at 09:02:35AM +0000, Tvrtko Ursulin wrote:
>>
>> On 22/12/2022 15:55, Lucas De Marchi wrote:
>>> On Thu, Dec 22, 2022 at 10:27:00AM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 22/12/2022 08:25, Lucas De Marchi wrote:
>>>>> The comments are redundant to the checks being done to apply the
>>>>> workarounds and very often get outdated as workarounds need to be
>>>>> extended to new platforms or steppings.  Remove them altogether with
>>>>> the following matches (platforms extracted from intel_workarounds.c):
>>>>>
>>>>>     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>>> 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
>>>>>     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>>> 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
>>>>>
>>>>> Same things was executed in the gem directory, omitted here for 
>>>>> brevity.
>>>>
>>>>> There were a few false positives that included the workaround
>>>>> description. Those were manually patched.
>>>>
>>>> sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'
>>>
>>> then there are false negatives. We have Was in the form
>>> "Wa_xxx:tgl,dg2, mtl". False positives we can fixup, false negatives
>>> we simply don't see. After running that in gt/:
>>>
>>> $ git grep ": mtl" -- drivers/gpu/drm/i915/
>>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>> drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c:       * Wa_14017073508: mtl
>>> drivers/gpu/drm/i915/i915_reg.h:/* Wa_14017210380: mtl */
>>>
>>> I was going with the platform names to avoid the false
>>> negatives and because I was entertaining the idea of only doing this for
>>> latest platforms where we do have the "Wa_[[:number:]]" form
>>>
>>>>
>>>> Maybe..
>>>>
>>>> Matt recently said he has this worked planned, but more importantly 
>>>> - I gather then that the WA lookup tool definitely does not output 
>>>> these strings?
>>>
>>> Whatever it does it's true only at the time it's called. It simply 
>>> tells what
>>> are the platforms and steppings the Wa applies to. We can change the
>>> output to whatever we want, but that is not the point.
>>> Those comments get stale and bring no real value as they match 1:1
>>> what the code is supposed to be doing. Several times a patch has to
>>> update just that comment to "extend a workaround" to a next platform.
>>> This is not always done, so we get a comment that doesn't match what is
>>> supposed to be there.
>>
>> Tl;dr; version - lets park this until January and discuss once 
>> everyone is back.
> 
> I'll leave my comment here since I will be out until mid January.
> 
>>
>> Longer version. I've been trying to get us talking about this a couple 
>> times before and I'd really like to close with an explicit consensus, 
>> discussion points addressed instead of skipped and just moving ahead 
>> with patches.
>>
>> References:
>>  3fcf71b9-337f-6186-7b00-27cbfd116743@linux.intel.com
>>  Y5j0b/bykbitCa4Q@mdroper-desk1.amr.corp.intel.com
>>
>> So point I wanted to discuss is whether these comments are truly 
>> useless or maybe they can help during review. If the tool can actually 
>> output them then I am leaning towards that they can be.
> 
> I consider "can the tool output xyz?" asking the wrong question.
> "The tool", which is our own small python script querying a database can
> output anything like that if we want to. The database has information of
> what are the platforms/steppings for each the WA is known to be applied
> *today*. And that can change and do change often, particularly for early
> steppings and recent platforms.
> 
>> Thought is, when a patch comes for review adding a new platform, 
>> stepping, whatever, to an existing if condition, if it contains the 
>> comments reviewer can more easily spot a hyphotetical logic inversion 
>> error or similar. It is also trivial to check that both condition and 
>> comment have been updated. (So lets not be rash and remove something 
>> maybe useful just because it can go stale *only if* reviewers are not 
>> giving sufficient attention that changes are made in tandem.)
> 
> I can argue to the other side too. We don't have comments in the kernel
> like
> 
>      /* Add 1 to i */
>      i += 1;
> 
> This is exactly what these comments are doing. And they are misleading

I'll file this under "Reductio ad absurdum", kind of. :)

> and may introduce bugs rather than helping reviewing:
> 
>      Wa_12345:tgl[a0,c0)
>      if (IS_TGL_GRAPHICS_STEP(STEP_A0, STEP_B0)
> 
> One might read the comment, skipping over the condition and thinking
> "ok, we already extended this WA to B* steppings, which doesn't match
> the code.

That would be reviewer error to assume B0 is the last B stepping, 
without actually checking. Equally as reviewer error would be to assume 
any WA adding patch is adding the correct conditions, again, without 
actually checking. Which leads me to ...

>> From a slightly different angle - do we expect anyone reviewing 
>> workaround patches will cross-check against the tool? Would it be 
>> simpler and more efficient that they could just cross-check against 
>> the comment output from the tool and put into the patch by the author?
> 
> see above. Someone cross-checking the comment is cross-checking the
> wrong thing. As I said, it happens more on early enabling of a platform.

... my point which seems to have been missed by both, well question 
really, do you expect every reviewer to cross-check against the WA 
database when reviewing WA changes? I don't see that was answered.

I guarantee that it won't happen and people will rubber stamp. So my 
argument was that we could make it both easier for reviewers *and* 
decrease the likelyhood of misses, if we kept platforms designators in 
comments.

Yeah it is much easier to rip them out that to find and fix the ones 
which went out of sync but that shouldn't be high on the list of criteria.

Argument that it is easy to overlook during review that comments and 
code do not match I don't think holds. That describes a very sloppy 
review. And if review is assumed to be that sloppy, do you really trust 
review to check against the WA database?

So my argument is that it is trivial for reviewers to spot comments and 
code do not match. Trivial and fast. And it's trivial (I hope) for the 
WA tool to output the right format for pasting in comments.

Those are the points I would like to have explicitly discounted before 
proceeding. Maybe to be even clearer the workflow would be like this:

Patch author:

1. Runs the WA tool for a WA number. Tool outputs text.
2. Pastes text verbatim in the comment.
3. Adjusts code to match.

Reviewer:

1. Verifies both code and comment were changed.
2. Verifies code matches the comment.

If the counter proposal is, patch author:

1. Runs the WA tool for a WA number. Tool outputs text.
2. Adjusts code to match.

Reviewer:

1. Runs the WA tool. Tool outputs text.
2. Checks patch matchs the WA tool output.

I will accept it but I strongly believe skipping of step 2 will happen 
and it will be impossible to know. Rubber stamping with the options of 
comments+code at least leaves a trace of comment and code being out of sync.

>> And point here to stress out is that accidental logic errors (missed 
>> workarounds) can be super expensive to debug in the field. Sometimes 
>> it can literally take _months_ for sporadic and hard to reproduce 
>> issues to get debugged, handed over between the teams, etc. So any way 
>> in which we can influence the likelyhood of that happening is 
>> something to weigh carefully.
> 
> yes, that's why I want to remove the comments: from my experience they
> are more a source of bugs rather than helping.
> 
>> Secondary but also important - if i915 is end of line then an extra 
>> why we want to rip out this for ancient platforms. Is the cost/benefit 
>> positive there?
> 
> yep, here I agree and was my argument about using the platform names
> rather than a more "catch all" regex. I think doing this only for tgl+
> platforms or even dg2+ would be ok.

Okay this is something to have as a 2nd option indeed. DG2 is out of 
force probe so maybe try with MTL. Although different rules for 
different platforms I don't know if will work in practice. Could be 
justt too complicated to be practical.

>> As a side note, and going back to the question of what the tool can 
>> output. Long time ago I had an idea where we could improve all this by 
>> making it completely data-driven. Have the WA database inspecting tool 
>> output a table which could be directly pasted into code and 
>> interpreted by i915.
>>
>> For reference look at intel_workarounds_table.h in 
>> https://patchwork.freedesktop.org/patch/399377/?series=83580&rev=3 and 
>> see what you thing. That was just a sketch of the idea, not complete, 
>> and yes, i915 end of life point makes it moot.
> 
> now that xe is announced I can talk about this part... this was more
> or less what I implemented in xe: it's a table with
> "register + condition + action". There are the most common condition
> checks builtin + a function hook for the more advanced ones. During
> binding the driver walks the table and coalesces the entries creating
> a per-register value that can be used at the proper times, depending if
> they are gt, engine, context workarounds.

Cool, I support that high level approach.

Regards,

Tvrtko
