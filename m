Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B937B611
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 08:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7369D6E483;
	Wed, 12 May 2021 06:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AD26E483;
 Wed, 12 May 2021 06:26:38 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 16FEB5FF7A;
 Wed, 12 May 2021 08:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620800796;
 bh=scMQI+xbLM2DxXFhrOpxOzMkyuEvE95DfdUbq0fy/4g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OgZcg0RLThpfZ3Wit8ZHruIkwFgafCuLyWAqFZeTnPf6ELoluDCcR4a3Tm3Nfa3eE
 SfYIXzynxloVF5lIS4uhw5IBT2n3LE9Ik+3iT7W/FCppVEi8q1CEVYpXdGZIBQbwto
 EJ893aUnZZWnlv04N/93N6ERquaJvvmj59u1M0XGAs2RSnPqHLYDsPQTDLJLE6QDQW
 GztRi1rP043u70wz7cod8HSoePokArU2lNh5zKKw2MvdK3OKKUZHK5mPS2GIlDKR28
 DWSNGmWm8a8hhQbYi988CncPMQNU+wwAZLt09EVR4acLXtKEnHtMd+FIoTaTpdDJv/
 59K4z5AsLS2aw==
Subject: Re: [RFC PATCH 00/97] Basic GuC submission support in the i915
To: Matthew Brost <matthew.brost@intel.com>,
 "Bloomfield, Jon" <jon.bloomfield@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d22437bd-8bb6-d7cb-c017-89cdc7da560d@free.fr>
 <17953669798.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <546e4ee4-9aa4-1967-cdcb-a561cac582ef@free.fr>
 <CAKMK7uETcM38sjPYJLdxpGcZcx=tHdGUPe0WTgnGoZfPQvEJFQ@mail.gmail.com>
 <08c22bc8-aa35-43d2-ad4c-7f489dfc585b@free.fr>
 <d382a41cacbc44ee96b9602f3473b5c0@intel.com>
 <20210511163930.GA28794@sdutt-i7>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <bb701cab-a68e-08ed-80e3-61be160bdc02@free.fr>
Date: Wed, 12 May 2021 09:26:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511163930.GA28794@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Ekstrand,
 Jason" <jason.ekstrand@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2021 19:39, Matthew Brost wrote:
> On Tue, May 11, 2021 at 08:26:59AM -0700, Bloomfield, Jon wrote:
>>> -----Original Message-----
>>> From: Martin Peres <martin.peres@free.fr>
>>> Sent: Tuesday, May 11, 2021 1:06 AM
>>> To: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Jason Ekstrand <jason@jlekstrand.net>; Brost, Matthew
>>> <matthew.brost@intel.com>; intel-gfx <intel-gfx@lists.freedesktop.org>;
>>> dri-devel <dri-devel@lists.freedesktop.org>; Ursulin, Tvrtko
>>> <tvrtko.ursulin@intel.com>; Ekstrand, Jason <jason.ekstrand@intel.com>;
>>> Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Bloomfield, Jon
>>> <jon.bloomfield@intel.com>; Vetter, Daniel <daniel.vetter@intel.com>;
>>> Harrison, John C <john.c.harrison@intel.com>
>>> Subject: Re: [RFC PATCH 00/97] Basic GuC submission support in the i915
>>>
>>> On 10/05/2021 19:33, Daniel Vetter wrote:
>>>> On Mon, May 10, 2021 at 3:55 PM Martin Peres <martin.peres@free.fr>
>>> wrote:
>>>>>
>>>>> On 10/05/2021 02:11, Jason Ekstrand wrote:
>>>>>> On May 9, 2021 12:12:36 Martin Peres <martin.peres@free.fr> wrote:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 06/05/2021 22:13, Matthew Brost wrote:
>>>>>>>> Basic GuC submission support. This is the first bullet point in the
>>>>>>>> upstreaming plan covered in the following RFC [1].
>>>>>>>>
>>>>>>>> At a very high level the GuC is a piece of firmware which sits between
>>>>>>>> the i915 and the GPU. It offloads some of the scheduling of contexts
>>>>>>>> from the i915 and programs the GPU to submit contexts. The i915
>>>>>>>> communicates with the GuC and the GuC communicates with the
>>> GPU.
>>>>>>>
>>>>>>> May I ask what will GuC command submission do that execlist
>>> won't/can't
>>>>>>> do? And what would be the impact on users? Even forgetting the
>>> troubled
>>>>>>> history of GuC (instability, performance regression, poor level of user
>>>>>>> support, 6+ years of trying to upstream it...), adding this much code
>>>>>>> and doubling the amount of validation needed should come with a
>>>>>>> rationale making it feel worth it... and I am not seeing here. Would you
>>>>>>> mind providing the rationale behind this work?
>>>>>>>
>>>>>>>>
>>>>>>>> GuC submission will be disabled by default on all current upstream
>>>>>>>> platforms behind a module parameter - enable_guc. A value of 3 will
>>>>>>>> enable submission and HuC loading via the GuC. GuC submission
>>> should
>>>>>>>> work on all gen11+ platforms assuming the GuC firmware is present.
>>>>>>>
>>>>>>> What is the plan here when it comes to keeping support for execlist? I
>>>>>>> am afraid that landing GuC support in Linux is the first step towards
>>>>>>> killing the execlist, which would force users to use proprietary
>>>>>>> firmwares that even most Intel engineers have little influence over.
>>>>>>> Indeed, if "drm/i915/guc: Disable semaphores when using GuC
>>> scheduling"
>>>>>>> which states "Disable semaphores when using GuC scheduling as
>>> semaphores
>>>>>>> are broken in the current GuC firmware." is anything to go by, it means
>>>>>>> that even Intel developers seem to prefer working around the GuC
>>>>>>> firmware, rather than fixing it.
>>>>>>
>>>>>> Yes, landing GuC support may be the first step in removing execlist
>>>>>> support. The inevitable reality is that GPU scheduling is coming and
>>>>>> likely to be there only path in the not-too-distant future. (See also
>>>>>> the ongoing thread with AMD about fences.) I'm not going to pass
>>>>>> judgement on whether or not this is a good thing.  I'm just reading the
>>>>>> winds and, in my view, this is where things are headed for good or ill.
>>>>>>
>>>>>> In answer to the question above, the answer to "what do we gain from
>>>>>> GuC?" may soon be, "you get to use your GPU."  We're not there yet
>>> and,
>>>>>> again, I'm not necessarily advocating for it, but that is likely where
>>>>>> things are headed.
>>>>>
>>>>> This will be a sad day, especially since it seems fundamentally opposed
>>>>> with any long-term support, on top of taking away user freedom to
>>>>> fix/tweak their system when Intel won't.
>>>>>
>>>>>> A firmware-based submission model isn't a bad design IMO and, aside
>>> from
>>>>>> the firmware freedom issues, I think there are actual advantages to the
>>>>>> model. Immediately, it'll unlock a few features like parallel submission
>>>>>> (more on that in a bit) and long-running compute because they're
>>>>>> implemented in GuC and the work to implement them properly in the
>>>>>> execlist scheduler is highly non-trivial. Longer term, it may (no
>>>>>> guarantees) unlock some performance by getting the kernel out of the
>>> way.
>>>>>
>>>>> Oh, I definitely agree with firmware-based submission model not being a
>>>>> bad design. I was even cheering for it in 2015. Experience with it made
>>>>> me regret that deeply since :s
>>>>>
>>>>> But with the DRM scheduler being responsible for most things, I fail to
>>>>> see what we could offload in the GuC except context switching (like
>>>>> every other manufacturer). The problem is, the GuC does way more than
>>>>> just switching registers in bulk, and if the number of revisions of the
>>>>> GuC is anything to go by, it is way too complex for me to feel
>>>>> comfortable with it.
>>>>
>>>> We need to flesh out that part of the plan more, but we're not going
>>>> to use drm scheduler for everything. It's only to handle the dma-fence
>>>> legacy side of things, which means:
>>>> - timeout handling for batches that take too long
>>>> - dma_fence dependency sorting/handling
>>>> - boosting of context from display flips (currently missing, needs to
>>>> be ported from drm/i915)
>>>>
>>>> The actual round-robin/preempt/priority handling is still left to the
>>>> backend, in this case here the fw. So there's large chunks of
>>>> code/functionality where drm/scheduler wont be involved in, and like
>>>> Jason says: The hw direction winds definitely blow in the direction
>>>> that this is all handled in hw.
>>>
>>> The plan makes sense for a SRIOV-enable GPU, yes.
>>>
>>> However, if the GuC is actually helping i915, then why not open source
>>> it and drop all the issues related to its stability? Wouldn't it be the
>>> perfect solution, as it would allow dropping execlist support for newer
>>> HW, and it would eliminate the concerns about maintenance of stable
>>> releases of Linux?
>>
>> That the major version of the FW is high is not due to bugs - Bugs don't trigger major version bumps anyway. 

Of course, where did I say they would?

> Only interface changes increment the major version, and we do add features, to keep it relevant to the evolving hardware and OS landscape. When only Windows used GuC there was no reason not to minimize interface creep - GuC and KMD are released as an atomic bundle on Windows. With Linux, this is no longer the case, and has not been for some time.

AFAIK, Intel has been shipping GuC to customers since gen9, and upstream 
has been supporting command submission (albeit in a broken form) for 
years... until Michal finally disabled it after I asked for it to a bit 
over 2 years ago[1], when GuC was at major version 32.

So... not sure I would trust your word so blindly here.

[1] 
https://patchwork.freedesktop.org/patch/297997/?series=58760&rev=2#comment_559594
>>
> 
> Jon hit the nail on head here - there hasn't been any reason not to bump the GuC
> version / change the interface until there is code upstream using the GuC. Once
> we push something that totally changes. Once SRIOV lands we literally can't the
> interface without breaking the world. Our goal is to this right before
> somethings lands, hence the high version number.

Good to hear! But Intel will continue to change the interface as new 
generations are made, so what is the support model for older GPUs / 
kernels which will be stuck on older major revisions?

> 
> Matt
> 
>> We have been using GuC as the sole mechanism for submission on Windows since Gen8, and it has proven very reliable. This is in large part because it is simple, and designed from day 1 as a cohesive solution alongside the hardware.

Exactly, the GuC was designed with Windows' GPU model... which is not 
directly applicable to Linux. Also, Windows does not care as much about 
submission latency, whereas most Linux users still depend on glamor for 
2D acceleration which is pretty much the biggest stress test for command 
submission latency. Also, features not used by the Windows driver or 
used in a different way are/will get broken (see the semaphore patch 
that works around it).

>>
>> Will there be bugs in the future? Of course. It's a new i915 backend. There are bugs in the execlist backend too, and the runlist backend, and the majority of real-world software ever written. But the i915 GuC backend is way simpler than execlist, much easier to understand, and therefore much easier to maintain. It's a net win for i915 and Linux.

I am more than willing to accept the fact that the interface would be 
easier to work with, and I welcome anything that will simplify the 
driver... but not at the expense of regressing the user experience. One 
has to prove more than *just* code maintainability.

Feel free to iterate/land the code, but enabling guc-based command 
submission is waaaaayyyy too early, no matter how much you want it. This 
patch will remain a NACK from me until I see more of the plan to support 
*users* who are willing to use a proprietary firmware, performance 
analysis, what's the plan for users who will not want to use it, and 
what are the capabilities of GuC which could be used for privilege 
escalation and what is done to mitigate that.

Thanks,
Martin

>>
>> Jon
