Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55D369D102
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835FB10E164;
	Mon, 20 Feb 2023 15:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D728210E144;
 Mon, 20 Feb 2023 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676908615; x=1708444615;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HXKX2oVyu/frP/c5pbB5qBGS4B85tGlEAmAiZ/9TLWY=;
 b=P1O+JlfAhokK0FQhd9hXxH6HT01VnnAqFIgh/XAFpPAItRvbHNJ+WuM0
 hTMRmSC+dJIKG9PbVXEB8hcu+IjyjB+RkGqHT6gGD3+9UJXGh08kdhBwO
 3jfaD8JR6KWQcme/KR4OXPZhE/nZxxNlkxYYYF2nPG25ziAfj+2XSVGcs
 PDTcL0tFJCLMb7QVt20y4RCLyY9s+giIJLrmrM8+HHWcnceo0A1qEPYSS
 hM4wR8JyX4vxvGkN0lm1k6/D0DDH3r8wJAcxc7H+PBzrAJT4ICyaRfOxI
 Ly9r3nzjTE6w0lls8JPiBQtjBRjhO8TaKKzLClVouyXB4XjbJ0GrnS0Rw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="394912922"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="394912922"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 07:56:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814179430"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="814179430"
Received: from mochoamo-mobl.ger.corp.intel.com (HELO [10.213.211.126])
 ([10.213.211.126])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 07:56:48 -0800
Message-ID: <ce91d2ca-6720-d4d3-fbc6-e211d03addc5@linux.intel.com>
Date: Mon, 20 Feb 2023 15:56:45 +0000
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
 <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
 <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
 <9fa6b49f-376b-f9e2-bce7-e58b04628822@linux.intel.com>
 <CAF6AEGvudvuQE1Uze8od-Wmgz+i02=EVEbeaa-9Muc1bXp+duw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGvudvuQE1Uze8od-Wmgz+i02=EVEbeaa-9Muc1bXp+duw@mail.gmail.com>
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


On 20/02/2023 15:45, Rob Clark wrote:
> On Mon, Feb 20, 2023 at 4:22 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 17/02/2023 17:00, Rob Clark wrote:
>>> On Fri, Feb 17, 2023 at 8:03 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> [snip]
>>
>>>>> adapted from your patches..  I think the basic idea of deadlines
>>>>> (which includes "I want it NOW" ;-)) isn't controversial, but the
>>>>> original idea got caught up in some bikeshed (what about compositors
>>>>> that wait on fences in userspace to decide which surfaces to update in
>>>>> the next frame), plus me getting busy and generally not having a good
>>>>> plan for how to leverage this from VM guests (which is becoming
>>>>> increasingly important for CrOS).  I think I can build on some ongoing
>>>>> virtgpu fencing improvement work to solve the latter.  But now that we
>>>>> have a 2nd use-case for this, it makes sense to respin.
>>>>
>>>> Sure, I was looking at the old version already. It is interesting. But
>>>> also IMO needs quite a bit more work to approach achieving what is
>>>> implied from the name of the feature. It would need proper deadline
>>>> based sched job picking, and even then drm sched is mostly just a
>>>> frontend. So once past runnable status and jobs handed over to backend,
>>>> without further driver work it probably wouldn't be very effective past
>>>> very lightly loaded systems.
>>>
>>> Yes, but all of that is not part of dma_fence ;-)
>>
>> :) Okay.
>>
>> Having said that, do we need a step back to think about whether adding
>> deadline to dma-fences is not making them something too much different
>> to what they were? Going from purely synchronisation primitive more
>> towards scheduling paradigms. Just to brainstorm if there will not be
>> any unintended consequences. I should mention this in your RFC thread
>> actually.
> 
> Perhaps "deadline" isn't quite the right name, but I haven't thought
> of anything better.  It is really a hint to the fence signaller about
> how soon it is interested in a result so the driver can factor that
> into freq scaling decisions.  Maybe "goal" or some other term would be
> better?

Don't know, no strong opinion on the name at the moment. For me it was 
more about the change of what type of side channel data is getting 
attached to dma-fence and whether it changes what the primitive is for.

> I guess that can factor into scheduling decisions as well.. but we
> already have priority for that.  My main interest is freq mgmt.
> 
> (Thankfully we don't have performance and efficiency cores to worry
> about, like CPUs ;-))
> 
>>> A pretty common challenging usecase is still the single fullscreen
>>> game, where scheduling isn't the problem, but landing at an
>>> appropriate GPU freq absolutely is.  (UI workloads are perhaps more
>>> interesting from a scheduler standpoint, but they generally aren't
>>> challenging from a load/freq standpoint.)
>>
>> Challenging as in picking the right operating point? Might be latency
>> impacted (and so user perceived UI smoothness) due missing waitboost for
>> anything syncobj related. I don't know if anything to measure that
>> exists currently though. Assuming it is measurable then the question
>> would be is it perceivable.
>>> Fwiw, the original motivation of the series was to implement something
>>> akin to i915 pageflip boosting without having to abandon the atomic
>>> helpers.  (And, I guess it would also let i915 preserve that feature
>>> if it switched to atomic helpers.. I'm unsure if there are still other
>>> things blocking i915's migration.)
>>
>> Question for display folks I guess.
>>
>>>> Then if we fast forward to a world where schedulers perhaps become fully
>>>> deadline aware (we even had this for i915 few years back) then the
>>>> question will be does equating waits with immediate deadlines still
>>>> works. Maybe not too well because we wouldn't have the ability to
>>>> distinguish between the "someone is waiting" signal from the otherwise
>>>> propagated deadlines.
>>>
>>> Is there any other way to handle a wait boost than expressing it as an
>>> ASAP deadline?
>>
>> A leading question or just a question? Nothing springs to my mind at the
>> moment.
> 
> Just a question.  The immediate deadline is the only thing that makes
> sense to me, but that could be because I'm looking at it from the
> perspective of also trying to handle the case where missing vblank
> reduces utilization and provides the wrong signal to gpufreq.. i915
> already has a way to handle this internally, but it involves bypassing
> the atomic helpers, which isn't a thing I want to encourage other
> drivers to do.  And completely doesn't work for situations where the
> gpu and display are separate devices.

Right, there is yet another angle to discuss with Daniel here who AFAIR 
was a bit against i915 priority inheritance going past a single device 
instance. In which case DRI_PRIME=1 would lose the ability to boost 
frame buffer dependency chains. Opens up the question of deadline 
inheritance across different drivers too. Or perhaps Daniel would be 
okay with this working if implemented at the dma-fence layer.

Regards,

Tvrtko
