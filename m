Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95459C514D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 09:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16FE10E32B;
	Tue, 12 Nov 2024 08:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IuA/NiU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1030D10E316;
 Tue, 12 Nov 2024 08:58:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-37d55f0cf85so3591009f8f.3; 
 Tue, 12 Nov 2024 00:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731401902; x=1732006702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/3zonpKksdXaEtv38XOwXdYvQIm9QBMj0v16GMue7zU=;
 b=IuA/NiU0YA/ppy8lh5ln9DBKkKWcmNtVnIoAErG+xIKX7pFy6cfUnuNtKKFZFB3EfQ
 BOTTFvW1FcDaWKNCB/xaG06hxzjuSzsw+F7SNaE2+wKXnHY+1UdVZDXdL/HBLzL0KUA1
 58x8IVGe2AhqWz+cxexTqphzkLh8854lCa0TL+YdWQ/hs+aa3yZc9t7vM4athSbvnJQb
 pPssCj1+IvD8wDdr2vczIOKFLYkriVYNxEQObSBUeFH2Dqy1lT/EHX2b3EzvaKveCY4n
 W1EUlSutEB6FrsvcDdUfZUVwAYlMs1UEzFGARbzQC8oG3gHKTWUAsXLfpALZZuKFS9k2
 2yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731401902; x=1732006702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/3zonpKksdXaEtv38XOwXdYvQIm9QBMj0v16GMue7zU=;
 b=gs4ZW0BPSAeUreMiR9S5GQt0X/gDfznGDqIOuusShLEYZeB8a47j6E0MMzfCYeGKSM
 dwV3PDoXPlbYAzupa2oq1dKyo+cYQC8SOnykofJ/fiDsrMmaG6TbfPBflE5h8xtBLpQ0
 Ymg8PFiw7Ok8oX0QqsR+TYsZBrUQ4L2udNhhtmRH+81z23nKRyaExb4++E41OlZYlcjm
 9UW1BJOBtZwhqS/sppRCbZ7UDuwQGR03r/qhHR2V8XkNap8IfwJHzXWpapTzL7GEiUD/
 JCqW35/TAqopVLsbOVNcRBz09dGjwq3Szf2ZCeyPsVKELVBkVTpR/gWgkLKvCxIkQKhK
 +BVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsxHHVNUFqqXw+Evjg0KU0hKt/5zBkroCps0cIdlucojD7uoOE6mvVH48jYpEV7zP6Ik56OOI2YZ8=@lists.freedesktop.org,
 AJvYcCX7WK0F1fuyh37oki/pYfQztnmr2MQbTdOxkGNASgkZtY74WeSMMzNqWi+vJiOBbwJLKqXXbCvdJqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9s8e4Y2ie1A3DN6Ax8n1GF5o0Sh6AWmxTzrkq+HSk3mBpgyp+
 SBZ5+PDHT+VM8+cE8HuI0g318z677xp60ucK6ehCV06+44onzKx5
X-Google-Smtp-Source: AGHT+IGMgBEM20I4NpVBcSCxLC9FAX3A7YsvU+nJZIe9C0yXyQtqn4xhhGzNAIIXA089ZBQSmdFoXQ==
X-Received: by 2002:a05:6000:1f86:b0:381:cffc:d40b with SMTP id
 ffacd0b85a97d-381f183f7c7mr12740295f8f.39.1731401901756; 
 Tue, 12 Nov 2024 00:58:21 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda1433esm14760848f8f.111.2024.11.12.00.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 00:58:21 -0800 (PST)
Message-ID: <aecad60a-aba6-421c-8e0c-51c2baaca36d@gmail.com>
Date: Tue, 12 Nov 2024 09:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
 <ZzMRk_KVWzYwr-VI@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZzMRk_KVWzYwr-VI@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.11.24 um 09:28 schrieb Simona Vetter:
> On Mon, Nov 11, 2024 at 04:00:02PM +0200, Joonas Lahtinen wrote:
>> Quoting Christian König (2024-11-11 13:34:12)
>>> Am 11.11.24 um 11:10 schrieb Simona Vetter:
>>>> On Mon, Nov 11, 2024 at 10:00:17AM +0200, Joonas Lahtinen wrote:
>>>>> Back from some time off and will try to answer below.
>>>>>
>>>>> Adding Dave and Sima as this topic has been previously discussed to some
>>>>> extent and will be good to reach common understanding about what the
>>>>> series is trying to do and what is the difference to the AMD debugging
>>>>> model.
>>>> I chatted about this thread a bit on irc with folks, and I think an
>>>> orthogonal issue is the question, what should be in ttm-utils? I've asked
>>>> Matt to type up a DOC patch once we have some consensus, since imo the
>>>> somewhat lackluster documentation situation for ttm is also somewhat a
>>>> cause for these big threads on various different topics. Aside from the
>>>> fact that gpu memory management is just hard.
>>>>
>>>> On the uapi/design aspect, I think this would serve well with a patch to
>>>> drm-uapi.rst that adds a debugging section? At least once we have some
>>>> rough consensus across drivers, and more importantly userspace in the form
>>>> of gdb upstream (at least I'm not aware of any other upstream debugger
>>>> patches, I think amd's rocm stuff is also gdb-only).
>>> Yeah that seems to be a really good idea. Similar design ideas came up
>>> AMD internally as well but where dropped after pointing people to
>>> pidfd_getfd().
> Maybe not yet awake enough yet, but how does pidfd_getfd() sort out
> debugger uapi fun?

It doesn't sorts them out, but it is a good helper to have in the toolbox.

The key point is it allows a debugger to not only suspend the CPU 
threads, peek/pook into the address space etc..., but also interact with 
the kernel device driver in the same way as the debugged application would.

So you can for example do things mmap() KMS handles to inspect scanned 
out images, or do things like command submission in the context of the 
debugged application etc....

At least for us that made in unnecessary to work with a parasitic thread 
injected into the debugged application, e.g. it avoided the need for the 
debugger to run code in the context of the debugged application.

You still need to define the approach, UAPI etc.. but you don't have to 
worry about access restrictions any more because that is already check 
by pidfd_getfd() and can implement you debugging UAPI just as normal 
driver IOCTLs on the DRM render node.

Regards,
Christian.

>
>>> But the bigger problem seems to be that the design doesn't seems to take
>>> the dma_fence requirements into account.
>> Where would you deduce that?
>>
>> We specifically limit the debugging to Long Running contexts which don't
>> depend on dma_fences.
>>
>>> In other words attaching gdb to a pid seems to stop the GPU thread of
>>> this pid without waiting for the XE preemption nor end of operation fence.
>>>
>>> I mean if the GPU threads are preempted that could work, but yeah not
>>> like this :)
>> For us, hitting a breakpoint inside the workload would always violate
>> any dma_fence timeout for the submitted workload, as the HW context can't
>> be switched out while in the breakpoint.
>>
>> For any dma_fence workload the guarantee is that that it completes
>> within reasonable time after submission (guaranteed by the submitter). I
>> don't see how you could really allow interactive debugging of a
>> breakpoint under those restrictions anyway even if pre-emption was
>> supported as the workload would not finish in <10 seconds?
> It defacto amounts to being able to kill a gpu process (if your debugger
> is stuck for too long), which is random because of memory management
> dependencies that could happen anywhere in userspace execution. So
> definitely not something we should enable by default, at most it's tech
> preview level or robust.
>
> But as long as the tdr is there and still works even if a debugger session
> is attached I don't see a fundamental issue. But should document some uapi
> expectations for sure in this area.
>
>> For i915 we did have the "pre-emptable but indefinitely long dma_fence workloads"
>> concept at one point and that was rejected after the lengthy discussion.
>>
>> So I think only way to allow interactive debugging is to avoid the
>> dma_fences. Curious to hear if there are ideas for otherwise.
> Yeah, if gpu debugging holds up preemption then no dma_fence is the only
> way out. Which means allowing gdb requires that the gpu context uses hw
> page faults for everything, so that we can still nuke away memory from
> underneath it.
>
> It probably also means you need exclusive access to the gpu, if that mode
> holds up other workloads. So that's maybe another access rights question
> the uapi doc patch needs to sort out.
>
> I think finally we might want to have some really tainting debug module
> option know that lifts some of the restrictions, for playing around or
> people who know what they're doing, as in, they're ok with their
> application under debugging occasionally just dying in tdr because of
> timeouts.
>
> Cheers, Sima
>
>> Regards, Joonas
>>
>>> Regards,
>>> Christian.
>>>
>>>> Some wash-up thoughts from me below, but consider them fairly irrelevant
>>>> since I think the main driver for these big questions here should be
>>>> gdb/userspace.
>>>>
>>>>> Quoting Christian König (2024-11-07 11:44:33)
>>>>>> Am 06.11.24 um 18:00 schrieb Matthew Brost:
>>>>>>
>>>>>>       [SNIP]
>>>>>>
>>>>>>       This is not a generic interface that anyone can freely access. The same
>>>>>>       permissions used by ptrace are checked when opening such an interface.
>>>>>>       See [1] [2].
>>>>>>
>>>>>>       [1] https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
>>>>>>       [2] https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2
>>>>>>
>>>>>>
>>>>>> Thanks a lot for those pointers, that is exactly what I was looking for.
>>>>>>
>>>>>> And yeah, it is what I feared. You are re-implementing existing functionality,
>>>>>> but see below.
>>>>> Could you elaborate on what this "existing functionality" exactly is?
>>>>> I do not think this functionality exists at this time.
>>>>>
>>>>> The EU debugging architecture for Xe specifically avoids the need for GDB
>>>>> to attach with ptrace to the CPU process or interfere with the CPU process for
>>>>> the debugging via parasitic threads or so.
>>>>>
>>>>> Debugger connection is opened to the DRM driver for given PID (which uses the
>>>>> ptrace may access check for now) after which the all DRM client of that
>>>>> PID are exposed to the debugger process.
>>>>>
>>>>> What we want to expose via that debugger connection is the ability for GDB to
>>>>> read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
>>>>> the EU threads would see them. Note that the layout of the ppGTT is
>>>>> completely up to the userspace driver to setup and is mostly only partially
>>>>> equal to the CPU address space.
>>>>>
>>>>> Specifically as part of reading/writing the ppGTT for debugging purposes,
>>>>> there are deep flushes needed: for example flushing instruction cache
>>>>> when adding/removing breakpoints.
>>>>>
>>>>> Maybe that will explain the background. I elaborate on this at the end some more.
>>>>>
>>>>>>               kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
>>>>>>               failing to see the problem with adding a simple helper based on existing
>>>>>>               code.
>>>>>>
>>>>>>           What#s possible and often done is to do kmap/vmap if you need to implement a
>>>>>>           CPU copy for scanout for example or for copying/validating command buffers.
>>>>>>           But that usually requires accessing the whole BO and has separate security
>>>>>>           checks.
>>>>>>
>>>>>>           When you want to access only a few bytes of a BO that sounds massively like
>>>>>>           a peek/poke like interface and we have already rejected that more than once.
>>>>>>           There even used to be standardized GEM IOCTLs for that which have been
>>>>>>           removed by now.
>>>>> Referring to the explanation at top: These IOCTL are not for the debugging target
>>>>> process to issue. The peek/poke interface is specifically for GDB only
>>>>> to facilitate the emulation of memory reads/writes on the GPU address
>>>>> space as they were done by EUs themselves. And to recap: for modifying
>>>>> instructions for example (add/remove breakpoint), extra level of cache flushing is
>>>>> needed which is not available to regular userspace.
>>>>>
>>>>> I specifically discussed with Sima on the difference before moving forward with this
>>>>> design originally. If something has changed since then, I'm of course happy to rediscuss.
>>>>>
>>>>> However, if this code can't be added, not sure how we would ever be able
>>>>> to implement core dumps for GPU threads/memory?
>>>>>
>>>>>>           If you need to access BOs which are placed in not CPU accessible memory then
>>>>>>           implement the access callback for ptrace, see amdgpu_ttm_access_memory for
>>>>>>           an example how to do this.
>>>>> As also mentioned above, we don't work via ptrace at all when it comes
>>>>> to debugging the EUs. The only thing used for now is the ptrace_may_access to
>>>>> implement similar access restrictions as ptrace has. This can be changed
>>>>> to something else if needed.
>>>>>
>>>>>>       Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.
>>>>>>
>>>>>>       This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.
>>>>>>
>>>>>>       The above function accesses a BO via kmap if it is in SYSTEM / TT,
>>>>>>       which is existing code.
>>>>>>
>>>>>>       This function is only exposed to user space via ptrace permissions.
>>>>> Maybe this sentence is what caused the confusion.
>>>>>
>>>>> Userspace is never exposed with peek/poke interface, only the debugger
>>>>> connection which is its own FD.
>>>>>
>>>>>>       In this series, we implement a function [3] similar to
>>>>>>       amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
>>>>>>       missing is non-visible CPU memory access, similar to
>>>>>>       amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
>>>>>>       was omitted in this series given its complexity.
>>>>>>
>>>>>>       So, this looks more or less identical to AMD's ptrace implementation,
>>>>>>       but in GPU address space. Again, I fail to see what the problem is here.
>>>>>>       What am I missing?
>>>>>>
>>>>>>
>>>>>> The main question is why can't you use the existing interfaces directly?
>>>>> We're not working on the CPU address space or BOs. We're working
>>>>> strictly on the GPU address space as would be seen by an EU thread if it
>>>>> accessed address X.
>>>>>
>>>>>> Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
>>>>>> system call, see here https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
>>>>>>
>>>>>> The pidfd_getfd() allows to dup() the render node file descriptor into your gdb
>>>>>> process. That in turn gives you all the access you need from gdb, including
>>>>>> mapping BOs and command submission on behalf of the application.
>>>>> We're not operating on the CPU address space nor are we operating on BOs
>>>>> (there is no concept of BO in the EU debug interface). Each VMA in the VM
>>>>> could come from anywhere, only the start address and size matter. And
>>>>> neither do we need to interfere with the command submission of the
>>>>> process under debug.
>>>>>
>>>>>> As far as I can see that allows for the same functionality as the eudebug
>>>>>> interface, just without any driver specific code messing with ptrace
>>>>>> permissions and peek/poke interfaces.
>>>>>>
>>>>>> So the question is still why do you need the whole eudebug interface in the
>>>>>> first place? I might be missing something, but that seems to be superfluous
>>>>>> from a high level view.
>>>>> Recapping from above. It is to allow the debugging of EU threads per DRM
>>>>> client, completely independent of the CPU process. If ptrace_may_acces
>>>>> is the sore point, we could consider other permission checks, too. There
>>>>> is no other connection to ptrace in this architecture as single
>>>>> permission check to know if PID is fair game to access by debugger
>>>>> process.
>>>>>
>>>>> Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
>>>>> the DRM client would also pave way for being able to extend core kernel generated
>>>>> core dump with each DRM client's EU thread/memory dump. We have similar
>>>>> feature called "Offline core dump" enabled in the downstream public
>>>>> trees for i915, where we currently attach the EU thread dump to i915 error state
>>>>> and then later combine i915 error state with CPU core dump file with a
>>>>> tool.
>>>>>
>>>>> This is relatively little amount of extra code, as this baseline series
>>>>> already introduces GDB the ability to perform the necessary actions.
>>>>> It's just the matter of kernel driver calling: "stop all threads", then
>>>>> copying the memory map and memory contents for GPU threads, just like is
>>>>> done for CPU threads.
>>>>>
>>>>> With parasitic thread injection, not sure if there is such way forward,
>>>>> as it would seem to require to inject quite abit more logic to core kernel?
>>>>>
>>>>>> It's true that the AMD KFD part has still similar functionality, but that is
>>>>>> because of the broken KFD design of tying driver state to the CPU process
>>>>>> (which makes it inaccessible for gdb even with imported render node fd).
>>>>>>
>>>>>> Both Sima and I (and partially Dave as well) have pushed back on the KFD
>>>>>> approach. And the long term plan is to get rid of such device driver specific
>>>>>> interface which re-implement existing functionality just differently.
>>>>> Recapping, this series is not adding it back. The debugger connection
>>>>> is a separate FD from the DRM one, with separate IOCTL set. We don't allow
>>>>> the DRM FD any new operations based on ptrace is attached or not. We
>>>>> don't ever do that check even.
>>>>>
>>>>> We only restrict the opening of the debugger connection to given PID with
>>>>> ptrace_may_access check for now. That can be changed to something else,
>>>>> if necessary.
>>>> Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
>>>> thing, least because even today all the svm discussions we have still hit
>>>> clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
>>>> sections with offsets). Not even speaking of all the gpu usecases where
>>>> the gpu vm space is still entirely independent of the cpu side.
>>>>
>>>> So that's why I think this entirely separate approach looks like the right
>>>> one, with ptrace_may_access as the access control check to make sure we
>>>> match ptrace on the cpu side.
>>>>
>>>> But there's very obviously a bikeshed to be had on what the actual uapi
>>>> should look like, especially how gdb opens up a gpu debug access fd. But I
>>>> also think that's not much on drm to decide, but whatever gdb wants. And
>>>> then we aim for some consistency on that lookup/access control part
>>>> (ideally, I might be missing some reasons why this is a bad idea) across
>>>> drm drivers.
>>>>
>>>>>> So you need to have a really really good explanation why the eudebug interface
>>>>>> is actually necessary.
>>>>> TL;DR The main point is to decouple the debugging of the EU workloads from the
>>>>> debugging of the CPU process. This avoids the interference with the CPU process with
>>>>> parasitic thread injection. Further this also allows generating a core dump
>>>>> without any GDB connected. There are also many other smaller pros/cons
>>>>> which can be discussed but for the context of this patch, this is the
>>>>> main one.
>>>>>
>>>>> So unlike parasitic thread injection, we don't unlock any special IOCTL for
>>>>> the process under debug to be performed by the parasitic thread, but we
>>>>> allow the minimal set of operations to be performed by GDB as if those were
>>>>> done on the EUs themselves.
>>>>>
>>>>> One can think of it like the minimal subset of ptrace but for EU threads,
>>>>> not the CPU threads. And thus, building on this it's possible to extend
>>>>> the core kernel generated core dumps with DRM specific extension which
>>>>> would contain the EU thread/memory dump.
>>>> It might be good to document (in that debugging doc patch probably) why
>>>> thread injection is not a great option, and why the tradeoffs for
>>>> debugging are different than for for checkpoint/restore, where with CRIU
>>>> we landed on doing most of this in userspace, and often requiring
>>>> injection threads to make it all work.
>>>>
>>>> Cheers, Sima
>>>>
>>>>> Regards, Joonas
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>
>>>>>>
>>>>>>       Matt
>>>>>>
>>>>>>       [3] https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6
>>>>>>
>>>>>>
>>>>>>           Regards,
>>>>>>           Christian.
>>>>>>
>>>>>>
>>>>>>               Matt
>>>>>>
>>>>>>
>>>>>>                   Regards,
>>>>>>                   Christian.
>>>>>>

