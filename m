Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF8169B023
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE7810F04D;
	Fri, 17 Feb 2023 16:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4E610E1CB;
 Fri, 17 Feb 2023 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676649820; x=1708185820;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WiB0X1ihwJUMKWm7e++DwSRhSyNb+C0l2YdUvMZGT6c=;
 b=E6k9PpND+aRMb7dnJcs9oFXuNjfmOaJ9rN8b1rXVMXAE4yli7mQmMDaJ
 e8Vnx7ghkoXAOKoHeKlaYmquQI9tYNi13tsOmgx2IpIOIecK31yKkfe8U
 OPmoBMpjGmvzqAo2PqgT3zO/BJEHKtDB+quLjA/PYRTwZlHsifFngKVv+
 zpReXE+WmQW8ZHagtg+dcq/mSAE8GWST7IhYiz2wBFClvVycXmUvMMyWR
 qXfzbI1muDe9npmupvZw5aFh23QnRpomfrwHxciqGi9WN71GRZfbE/zYP
 2XLXwwK7Br5C28d0WWQE+XT3j/MBXr/OHTOQKKw1MZH+/ZH3UF6C/qi41 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="396692413"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="396692413"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:03:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="844619662"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="844619662"
Received: from scurtin-mobl.ger.corp.intel.com (HELO [10.213.210.155])
 ([10.213.210.155])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:03:37 -0800
Message-ID: <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
Date: Fri, 17 Feb 2023 16:03:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
 <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/02/2023 14:55, Rob Clark wrote:
> On Fri, Feb 17, 2023 at 4:56 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 16/02/2023 18:19, Rodrigo Vivi wrote:
>>> On Tue, Feb 14, 2023 at 11:14:00AM -0800, Rob Clark wrote:
>>>> On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> In i915 we have this concept of "wait boosting" where we give a priority boost
>>>>> for instance to fences which are actively waited upon from userspace. This has
>>>>> it's pros and cons and can certainly be discussed at lenght. However fact is
>>>>> some workloads really like it.
>>>>>
>>>>> Problem is that with the arrival of drm syncobj and a new userspace waiting
>>>>> entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
>>>>> this mini series really (really) quickly to see if some discussion can be had.
>>>>>
>>>>> It adds a concept of "wait count" to dma fence, which is incremented for every
>>>>> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
>>>>> dma_fence_add_callback but from explicit/userspace wait paths).
>>>>
>>>> I was thinking about a similar thing, but in the context of dma_fence
>>>> (or rather sync_file) fd poll()ing.  How does the kernel differentiate
>>>> between "housekeeping" poll()ers that don't want to trigger boost but
>>>> simply know when to do cleanup, and waiters who are waiting with some
>>>> urgency.  I think we could use EPOLLPRI for this purpose.
>>>>
>>>> Not sure how that translates to waits via the syncobj.  But I think we
>>>> want to let userspace give some hint about urgent vs housekeeping
>>>> waits.
>>>
>>> Should the hint be on the waits, or should the hints be on the executed
>>> context?
>>>
>>> In the end we need some way to quickly ramp-up the frequency to avoid
>>> the execution bubbles.
>>>
>>> waitboost is trying to guess that, but in some cases it guess wrong
>>> and waste power.
>>
>> Do we have a list of workloads which shows who benefits and who loses
>> from the current implementation of waitboost?
>>> btw, this is something that other drivers might need:
>>>
>>> https://gitlab.freedesktop.org/drm/amd/-/issues/1500#note_825883
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>
>> I have several issues with the context hint if it would directly
>> influence frequency selection in the "more power" direction.
>>
>> First of all, assume a context hint would replace the waitboost. Which
>> applications would need to set it to restore the lost performance and
>> how would they set it?
>>
>> Then I don't even think userspace necessarily knows. Think of a layer
>> like OpenCL. It doesn't really know in advance the profile of
>> submissions vs waits. It depends on the CPU vs GPU speed, so hardware
>> generation, and the actual size of the workload which can be influenced
>> by the application (or user) and not the library.
>>
>> The approach also lends itself well for the "arms race" where every
>> application can say "Me me me, I am the most important workload there is!".
> 
> since there is discussion happening in two places:
> 
> https://gitlab.freedesktop.org/drm/intel/-/issues/8014#note_1777433
> 
> What I think you might want is a ctx boost_mask which lets an app or
> driver disable certain boost signals/classes.  Where fence waits is
> one class of boost, but hypothetical other signals like touchscreen
> (or other) input events could be another class of boost.  A compute
> workload might be interested in fence wait boosts but could care less
> about input events.

I think it can only be apps which could have any chance knowing whether 
their use of a library is latency sensitive or not. Which means new 
library extensions and their adoption. So I have some strong reservation 
that route is feasible.

Or we tie with priority which many drivers do. Normal and above gets the 
boosting and what lowered itself does not (aka SCHED_IDLE/SCHED_BATCH).

Related note is that we lack any external control of our scheduling 
decisions so we really do suck compared to other scheduling domains like 
CPU and IO etc.

>> The last concern is for me shared with the proposal to expose deadlines
>> or high priority waits as explicit uapi knobs. Both come under the "what
>> application told us it will do" category vs what it actually does. So I
>> think it is slightly weaker than basing decisions of waits.
>>
>> The current waitboost is a bit detached from that problem because when
>> we waitboost for flips we _know_ it is an actual framebuffer in the flip
>> chain. When we waitboost for waits we also know someone is waiting. We
>> are not trusting userspace telling us this will be a buffer in the flip
>> chain or that this is a context which will have a certain duty-cycle.
>>
>> But yes, even if the input is truthful, latter is still only a
>> heuristics because nothing says all waits are important. AFAIU it just
>> happened to work well in the past.
>>
>> I do understand I am effectively arguing for more heuristics, which may
>> sound a bit against the common wisdom. This is because in general I
>> think the logic to do the right thing, be it in the driver or in the
>> firmware, can work best if it has a holistic view. Simply put it needs
>> to have more inputs to the decisions it is making.
>>
>> That is what my series is proposing - adding a common signal of "someone
>> in userspace is waiting". What happens with that signal needs not be
>> defined (promised) in the uapi contract.
>>
>> Say you route it to SLPC logic. It doesn't need to do with it what
>> legacy i915 is doing today. It just needs to do something which works
>> best for majority of workloads. It can even ignore it if that works for it.
>>
>> Finally, back to the immediate problem is when people replace the OpenCL
>> NEO driver with clvk that performance tanks. Because former does waits
>> using i915 specific ioctls and so triggers waitboost, latter waits on
>> syncobj so no waitboost and performance is bad. What short term solution
>> can we come up with? Or we say to not use clvk? I also wonder if other
>> Vulkan based stuff is perhaps missing those easy performance gains..
>>
>> Perhaps strictly speaking Rob's and mine proposal are not mutually
>> exclusive. Yes I could piggy back on his with an "immediate deadline for
>> waits" idea, but they could also be separate concepts if we concluded
>> "someone is waiting" signal is useful to have. Or it takes to long to
>> upstream the full deadline idea.
> 
> Let me re-spin my series and add the syncobj wait flag and i915 bits

I think wait flag is questionable unless it is inverted to imply waits 
which can be de-prioritized (again same parallel with SCHED_IDLE/BATCH). 
Having a flag which "makes things faster" IMO should require elevated 
privilege (to avoid the "arms race") at which point I fear it quickly 
becomes uninteresting.

> adapted from your patches..  I think the basic idea of deadlines
> (which includes "I want it NOW" ;-)) isn't controversial, but the
> original idea got caught up in some bikeshed (what about compositors
> that wait on fences in userspace to decide which surfaces to update in
> the next frame), plus me getting busy and generally not having a good
> plan for how to leverage this from VM guests (which is becoming
> increasingly important for CrOS).  I think I can build on some ongoing
> virtgpu fencing improvement work to solve the latter.  But now that we
> have a 2nd use-case for this, it makes sense to respin.

Sure, I was looking at the old version already. It is interesting. But 
also IMO needs quite a bit more work to approach achieving what is 
implied from the name of the feature. It would need proper deadline 
based sched job picking, and even then drm sched is mostly just a 
frontend. So once past runnable status and jobs handed over to backend, 
without further driver work it probably wouldn't be very effective past 
very lightly loaded systems.

Then if we fast forward to a world where schedulers perhaps become fully 
deadline aware (we even had this for i915 few years back) then the 
question will be does equating waits with immediate deadlines still 
works. Maybe not too well because we wouldn't have the ability to 
distinguish between the "someone is waiting" signal from the otherwise 
propagated deadlines.

Regards,

Tvrtko
