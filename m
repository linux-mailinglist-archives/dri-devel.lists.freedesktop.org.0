Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73E387926
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C2189467;
	Tue, 18 May 2021 12:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579AF89467
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:49:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b17so11004630ede.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=d+S5eEXwNJWJwpktgmuIHjCfPUJzpIW2TWTNXlCY1GM=;
 b=itlRdVH8NwEU+cWAdNyzuvNDWVFPlqDNFBFY/raxuv5jyWf69/CxOIPvhYsXEEQrnN
 oTciT3xHUiqhN+vEV7iSSwUr09hE1DoEAp+voA5OgRssPUYJhU285CWixZ/WN10upqgA
 xMWkCg4XeVPdb2tnlYy3U8Y1LX+roGau/+RCZFBnkLpEFVbg2c1pyUa497RL7nbpR9gF
 VvBX0sP+bdmP0Gm1mKhKDDzIhVVgT5gwBGO/0SmDaHWR1SZfm/R9wA1QtDQCU4FS3MH3
 Eu2/2ZWriE+oVB2MlOIlUn49IxL4l5uWAWcJmFacVkrRO1Wj1YpQSUXTwmarBPdUo3yd
 DFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=d+S5eEXwNJWJwpktgmuIHjCfPUJzpIW2TWTNXlCY1GM=;
 b=GzmwsQ3BEodziX0HSTl+K7PkMqoGf8N+GCp5Lmw1ikwtY7VMDpn1ark7+vEGsAkZ1s
 4S+1ZSODj9cad0vcQZMxwg+QAjyIoeA0o+Rzmhziju+SK0fmvzoBSrk7TFTeEEmbQROi
 W8kVud5ZMhrdckEPTEgvWSZf44JY1qkRKSbfO/G9piXmrzw+G5DzNDuG4ZEEguaH2XKs
 CdualRlFigHQFYjn3EU1g2LTZTy7Yn7pXML1n+N1bqrwdl1oJtfa9XaxALXV6cj1up8A
 Sgr8BZ5s5+Fr2+vub4QDn7n3YxKqbLGbnymYqsv4p47thCcKGe5i1SiCQeEwvAJ05mKp
 2iTQ==
X-Gm-Message-State: AOAM531WlouGcfhotZXSlSRscPkCl8mTKdS1GB7+nIH1tIa8ZefFOlID
 pWZqWdK89jcTm7Jf7Zodg00=
X-Google-Smtp-Source: ABdhPJzKXGIitLphNHGJOzVpwRQqstM84acv6LHhiWCXR+YERKYoxz5oDQvFol/MBG7RyCoJrJFLDQ==
X-Received: by 2002:aa7:c152:: with SMTP id r18mr6832866edp.266.1621342164841; 
 Tue, 18 May 2021 05:49:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4?
 ([2a02:908:1252:fb60:8470:36a5:2010:f0c4])
 by smtp.gmail.com with ESMTPSA id e6sm1341242ejd.31.2021.05.18.05.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 05:49:24 -0700 (PDT)
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Vetter <daniel@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
Date: Tue, 18 May 2021 14:49:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason & Daniel,

Am 18.05.21 um 07:59 schrieb Daniel Vetter:
> On Tue, May 18, 2021 at 12:49 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>> On Mon, May 17, 2021 at 3:15 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Mon, May 17, 2021 at 9:38 PM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 17.05.21 um 17:04 schrieb Daniel Vetter:
>>>>> On Mon, May 17, 2021 at 04:11:18PM +0200, Christian König wrote:
>>>>>> We had a long outstanding problem in amdgpu that buffers exported to
>>>>>> user drivers by DMA-buf serialize all command submissions using them.
>>>>>>
>>>>>> In other words we can't compose the buffer with different engines and
>>>>>> then send it to another driver for display further processing.
>>>>>>
>>>>>> This was added to work around the fact that i915 didn't wanted to wait
>>>>>> for shared fences in the dma_resv objects before displaying a buffer.
>>>>>>
>>>>>> Since this problem is now causing issues with Vulkan we need to find a
>>>>>> better solution for that.
>>>>>>
>>>>>> The patch set here tries to do this by adding an usage flag to the
>>>>>> shared fences noting when and how they should participate in implicit
>>>>>> synchronization.
>>>>> So the way this is fixed in every other vulkan driver is that vulkan
>>>>> userspace sets flags in the CS ioctl when it wants to synchronize with
>>>>> implicit sync. This gets you mostly there. Last time I checked amdgpu
>>>>> isn't doing this, and yes that's broken.
>>>> And exactly that is a really bad approach as far as I can see. The
>>>> Vulkan stack on top simply doesn't know when to set this flag during CS.
>>> Adding Jason for the Vulkan side of things, because this isn't how I
>>> understand this works.
>>>
>>> But purely form a kernel pov your patches are sketchy for two reasons:
>>>
>>> - we reinstate the amdgpu special case of not setting exclusive fences
>>>
>>> - you only fix the single special case of i915 display, nothing else
>>>
>>> That's not how a cross driver interface works. And if you'd do this
>>> properly, you'd be back to all the same sync fun you've orignally had,
>>> with all the same fallout.
>> I think I'm starting to see what Christian is trying to do here and I
>> think there likely is a real genuine problem here.  I'm not convinced
>> this is 100% of a solution but there might be something real.  Let me
>> see if I can convince you or if I just make a hash of things. :-)
>>
>> The problem, once again, comes down to memory fencing vs. execution
>> fencing and the way that we've unfortunately tied them together in the
>> kernel.  With the current architecture, the only way to get proper
>> write-fence semantics for implicit sync is to take an exclusive fence
>> on the buffer.  This implies two things:
>>
>>   1. You have to implicitly wait on EVERY fence on the buffer before
>> you can start your write-fenced operation
>>
>>   2. No one else can start ANY operation which accesses that buffer
>> until you're done.

Yes, exactly that. You absolutely nailed it.

I unfortunately also have a 3rd use case:

3. Operations which shouldn't participate in any syncing, but only 
affect the memory management.

This is basically our heavyweight TLB flush after unmapping the BO from 
somebodies page tables. Nobody should ever be concerned about it for any 
form of synchronization, but memory managment is not allowed to reuse or 
move the buffer before the operation is completed.

>>
>> Let's say that you have a buffer which is shared between two drivers A
>> and B and let's say driver A has thrown a fence on it just to ensure
>> that the BO doesn't get swapped out to disk until it's at a good
>> stopping point.  Then driver B comes along and wants to throw a
>> write-fence on it.  Suddenly, your memory fence from driver A causes
>> driver B to have to stall waiting for a "good" time to throw in a
>> fence.  It sounds like this is the sort of scenario that Christian is
>> running into.  And, yes, with certain Vulkan drivers being a bit
>> sloppy about exactly when they throw in write fences, I could see it
>> being a real problem.
> Yes this is a potential problem, and on the i915 side we need to do
> some shuffling here most likely. Especially due to discrete, but the
> problem is pre-existing. tbh I forgot about the implications here
> until I pondered this again yesterday evening.
>
> But afaiui the amdgpu code and winsys in mesa, this isn't (yet) the
> problem amd vk drivers have. The issue is that with amdgpu, all you
> supply are the following bits at CS time:
> - list of always mapped private buffers, which is implicit and O(1) in
> the kernel fastpath
> - additional list of shared buffers that are used by the current CS
>
> I didn't check how exactly that works wrt winsys buffer ownership, but
> the thing is that on the kernel side _any_ buffer in there is treated
> as a implicit sync'ed write. Which means if you render your winsys
> with a bunch of command submission split over 3d and compute pipes,
> you end up with horrendous amounts of oversync.

What are you talking about? We have no sync at all for submissions from 
the same client.

> The reason for this is that amdgpu decided to go with a different
> implicit sync model than everyone else:
> - within an drm file everything is unsynced and left to userspace to
> handle, amdgpu.ko only ever sets the shared fence slots.
> - this means the exclusive slot really is exclusive to memory manage
> issues, which side-steps the issue you point out above
> - for anything cross-device they unconditionally wait for any shared
> fence which is by another process
>
> Works, except it's incompatible with what everyone else is doing, so
> had to be papered over by the current massive oversync solution.

Well actually it is only i915 I care of which is working differently.

Radeon works the same way as amdgpu by waiting for everything before 
doing command submission or pageflip.

> First step in fixing that is (and frankly was since years) to fix the
> amdgpu CS so winsys can pass along a bunch of flags about which CS
> should actually set the exclusive fence, so that you stop oversyncing
> so badly. Ofc old userspace needs to keep oversyncing forever, no way
> to fix that.

Exactly that is what we don't want to do because the winsys has no idea 
when to sync and when not to sync.

The kernel on the other hand perfectly knows that.

> Instead what Christian patch set here does is move amdgpu back to the
> dma_resv contract it prefers, break everything else and then fix up
> i915 atomic path so that the one use case that originally highlighted
> the mismatch here works again. Which hrm .... no :-)
>
> I think the reason this wasn't ever a pressing issue is that amdgpu.ko
> only does this for buffers shared across devices, so in most cases you
> don't suffer from the terribly oversync. Conceptually it's still all
> there.
>
>> The solution I *think* Christian is proposing is basically to have
>> four categories of fences instead of two: exclusive, weak (shared with
>> no r/w), read, and write.  (No, I didn't include r/w but that's the
>> same as write-only when it comes to hazards.)  Then a bunch of flags
>> and helpers to be able to handle the interactions between the three
>> types of shared fences.  Honestly, this is something I've considered
>> as I've wrestled with these problems in the past.  That said....
>>
>>   1. In GL, we can make the read/write information accurate and never
>> over/under sync.
>>
>>   2. In the future ANV model I described earlier, this isn't a problem.
>> It throws in a write-fence exactly once per frame.  It actually
>> under-synchronizes but in a safe way.  I think that mostly makes the
>> problem go away in practice.
>>
>>   3. If the core issue here really is memory vs. execution sync as I've
>> said, maybe we really are papering over something by continuing to mix
>> them.  Do we really want four fence types or do we want two orthogonal
>> fence types?
> Now once amdgpu.ko is fixed, we still have the problem of mixing up
> the exclusive fence for implicit sync with the exclusive fence for
> memory management. And for that we can and probably should figure out
> what to do there. But that still requires that amdgpu CS first learns
> what's actually going on from userspace, and secondly, that we do this
> addition in a way which is compatible with current dma_resv users
> (i.e. all drivers currently asking for an exclusive fence need to pick
> up both types of exclusive fences if we decide to split them).
>> I think I've convinced myself that the problem is real, but not that
>> this solution is correct.
> Yeah there's definitely some problems here, but Christian hasn't
> really explained which one he's trying to solve, so we're also running
> a bit in a circle trying to guess what's what :-/

Well how can I help with that?

Jason seems to have the perfect understanding why we have those problems.

And as long as we are all inside amdgpu we also don't have any oversync, 
the issue only happens when we share dma-bufs with i915 (radeon and 
AFAIK nouveau does the right thing as well).

Regards,
Christian.

>
> Cheers, Daniel
>
>> --Jason
>>
>>
>>>> That's also the reason the Valve guys came up with a solution where each
>>>> BO gets a flag for explicit sync, but that only works for exports and
>>>> not for imports.
>>>>
>>>>> I915 and iirc msm has explicit flags for this, panfrost was designed to
>>>>> support this correctly from the start (also with flags I think). That's at
>>>>> least what I remember from all the discussions at XDC and #dri-devel, but
>>>>> didn't check the code again to give you the list of uapi flags you need
>>>>> for each driver.
>>>>>
>>>>> The other piece is making sure you're only picking up implicit fences when
>>>>> you should, and not any later ones, for which Jason has a solution:
>>>>>
>>>>> https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jason@jlekstrand.net/
>>>> Yes, I helped with that as well. But I think that this is just another
>>>> workaround without really addressing the underlying problem.
>>>>
>>>>> If amdgpu isn't using those, then you will suffer from
>>>>> over-synchronization in vulkan and pay a price. The entire point of vulkan
>>>>> is that you pick up sync points very explicitly, and we also need to have
>>>>> very explicit uapi for userspace to pick up/set the implicit fences.
>>>>>
>>>>> Trying to paper over this with more implicit magic is imo just wrong, and
>>>>> definitely not the long term explicit sync model we want.
>>>> I completely disagree.
>>>>
>>>> In my opinion the implicit sync model we have for dma_resv currently is
>>>> just not well designed at all, since it always requires cooperation from
>>>> userspace.
>>>>
>>>> In other words you need to know when to enable implicit sync in
>>>> userspace and that information is simply not present all of the time.
>>>>
>>>> What we have done here is just keeping the old reader/writer flags i915,
>>>> radeon and nouveau once had and pushed that out to everybody else making
>>>> the assumption that everybody would follow that without documenting the
>>>> actual rules of engagement you need to follow here.
>>>>
>>>> That was a really big mistake and we should try to fix that sooner or
>>>> later. The only other clean alternative I see is to use a flag on the
>>>> exporter to tell the importer if it should sync to shared fences or not.
>>>>
>>>> Additional to that I'm perfectly fine with implicit sync. Explicit sync
>>>> certainly has some use cases as well, but I don't see it as an absolute
>>>> advantage over the implicit model.
>>> Ok this stops making sense. Somehow you claim userspace doesn't know
>>> when to sync, but somehow the kernel does? By guessing, and getting it
>>> wrong mostly, except for the one case that you benchmarked?
>>>
>>> Aside from silly userspace which exports a buffer to a dma-buf, but
>>> then never imports it anywhere else, there isn't a case I know of
>>> where the kernel actually knows more than userspace. But there's lots
>>> of cases where the kernel definitely knows less, especially if
>>> userspace doesn't tell it about what's going on with each rendering
>>> and buffer.
>>>
>>> So here's the 2 things you need to make this work like every other driver:
>>>
>>> 1. A way to set the explicit fence on a buffer. CS ioctl is perfectly
>>> fine, but also can be seperate. Userspace uses this only on a) shared
>>> buffers b) when there's a flush/swap on that shared buffer. Not when
>>> rendering any of the interim stuff, that only leads to oversync.
>>> Anything non-shared is handled explicitly in userspace (at least for
>>> modern-ish drivers). This is the only thing that ever sets an
>>> exclusive fence (aside from ttm moving buffers around ofc).
>>>
>>> 2. A way to sync with the implicit fences, either all of them (for
>>> upcoming write access) or just the write fence (for read access). At
>>> first we thought it's good enough to do this in the CS ioctl, but
>>> that's a wee bit too late, hence the patches from Jason. My
>>> understanding is that vulkan converts this into an vk syncobj/fence of
>>> some sorts, so really can't make this more explicit and intentional
>>> than that.
>>>
>>> None of this is something the kernel has the slightest idea about when
>>> it happens, so you have to have explicit uapi for it. Trying to fake
>>> it in the kernel just doesn't work.
>>> -Daniel
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

