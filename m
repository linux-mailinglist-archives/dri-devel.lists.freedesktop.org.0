Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F72D9C51DA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 10:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A944F10E1B3;
	Tue, 12 Nov 2024 09:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+vMzNUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796DC10E1B3;
 Tue, 12 Nov 2024 09:23:47 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3807dd08cfcso5135518f8f.1; 
 Tue, 12 Nov 2024 01:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731403426; x=1732008226; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKT6EMcyNljQFqDNJ747XasVXAIRKMWm7XD/hnLaTe0=;
 b=d+vMzNUPHzzdRWRXwOqp7QsM/TiVak9eI+ngB0sx9vqrZ5PRiPqyeJt1dTGGGDZdOq
 MtmQN7z9ljzeEsumXVvxrf+iOqjbK0b5pL53ChMH7cVn+INM2SBRvRKW2r7sm/kdWNGe
 rPYPMin4Mlx1NkQk7gGlOALpCcmQ57fPIzqcyIWTxuCNJRNCsQH1+sXoQvaLS0BMshzB
 +udLcW1KZlhgCvcNEX32ZQSav8Utk7N5Lye+nhTQPbovqd/2nWLZLK20JpybKpBjilXE
 8+5buTQbxFLH/PejlgN5gxhymL0x6zkra9IuZ3o4Z15olidLOJ1HP9vCaGahrNO4CK92
 Z0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731403426; x=1732008226;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QKT6EMcyNljQFqDNJ747XasVXAIRKMWm7XD/hnLaTe0=;
 b=mMaVXuxC28ql+d8RtI9FWhdD+eJvA1/kwHcDmafuADeP7DRFLXcRlhNkBnu9G4dbKA
 KlOwDuVcX1KVau17gdT+RQladC3CNnTWC9KOlcHSR8QoPA6197Ul68bwkbSg3dmxnYhA
 KHc2OVIm5F9DT3XD8YUEijvu9Jh9zu4FyCgVsIaq7olWHfisMQ4PjdK+ryHeQdqnsEvM
 kvRUJvSPD3JO/9oSWUia6SHhxHNiET7zoY4Hd5qjuLIS7FbZw++ov418nmsEeuhynLdy
 00fDfDmJXLbI3aWhnztTv2fWTjI3X3tanAHcpubucbiUs1bxKBH6T0p5qOipuQ6eyy2d
 1o6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjsLEN1fR2JxBrpJJUoHcHJaMmsE+G+HU7+rTH1ngcM0FCIxghsDrZvj765FnkKfR2VShhBU6wYcg=@lists.freedesktop.org,
 AJvYcCWptn2HxIlxxGTrEKDETLXkXsi5iaeoS5SntpHxpNUbxexKHFiPwFlNimJ14BvHg2+lhNaTQ7OXrv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK4198GzCTmTLorqdZHotRAOetXMuNU2z0qqvCcv+Fz1GmpCRS
 OHm085Va81DJzFeFGnK5p6wyGuNkvJQULY/XkO2cLwDAD7aNF7aR
X-Google-Smtp-Source: AGHT+IHW0pOKretboxZ7ODYiK7VvZvLT8m3SbcLVWF5Fh3fz7ckAx0OdzuVXzsOkf4f5p25alrvlnA==
X-Received: by 2002:a5d:5886:0:b0:37d:5130:b380 with SMTP id
 ffacd0b85a97d-381f186cbbemr14556115f8f.23.1731403425247; 
 Tue, 12 Nov 2024 01:23:45 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa70a2ccsm246040295e9.31.2024.11.12.01.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 01:23:44 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------DDsiqLYOgfnV8Gp0P0fpomyq"
Message-ID: <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
Date: Tue, 12 Nov 2024 10:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
 <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
 <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
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

This is a multi-part message in MIME format.
--------------DDsiqLYOgfnV8Gp0P0fpomyq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 11.11.24 um 23:45 schrieb Matthew Brost:
> [SNIP]
>>> So I think only way to allow interactive debugging is to avoid the
>>> dma_fences. Curious to hear if there are ideas for otherwise.
>> You need to guarantee somehow that the process is taken from the hardware so
>> that the preemption fence can signal.
>>
> Our preemption fences have this functionality.
>
> A preemption fence issues a suspend execution command to the firmware. The
> firmware, in turn, attempts to preempt the workload. If it doesn't respond
> within a specified period, it resets the hardware queue, sends a message to KMD,
> bans the software queue, and signals the preemption fence.
>
> We provide even more protection than that. If, for some reason, the firmware
> doesn't respond within a longer timeout period, the KMD performs a device reset,
> ban the offending software queue(s), and will signal the preemption fences.
>
> This flow remains the same whether a debugger is attached or, for example, a
> user submits a 10-minute non-preemptable workload. In either case, other
> processes are guaranteed to make forward progress.

Yeah that is pretty much the same argumentation I have heard before and 
it turned out to not be working.

> The example above illustrates the memory oversubscription case, where two
> processes are using 51% of the memory.

That isn't even necessary. We have seen applications dying just because 
the core memory management tried to join back small pages into huge 
pages in an userptr.

That the core memory management jumps in and requests that the 
pre-emption fence signals can happen all the time.

You can mitigate that a bit, Fedora for example disables joining back 
small pages into huge pages by default for example and we even had 
people suggesting to use mprotect() so that userptrs VMAs don't fork() 
any more (which is of course completely illegal).

But my long term take away is that you can't block all causes of sudden 
requests to let a pre-emption fence signal.

> Another preemption scenario involves two processes sharing hardware resources.
> Our firmware follows the same flow here. If an LR workload is using a hardware
> resource and a DMA-fence workload is waiting, and if the LR workload doesn't
> preempt the in a timely manner, the firmware issues a hardware reset, notifies
> KMD, and bans the LR software queue. The DMA-fence workload then can make
> forward progress
>
> With the above in mind, this is why I say that if a user tries to run a game and
> a non-preemptable LR workload, either oversubscribing memory or sharing hardware
> resources, it is unlikely to work well. However, I don't think this is a common
> use case. I would expect that when a debugger is open, it is typically by a
> power user who knows how to disable other GPU tasks (e.g., by enabling software
> rendering or using a machine without any display).
>
> Given this, please to reconsider your position.

The key point here is that this isn't stable, you can do that as a tech 
demo but it can always be that debugging an application just randomly 
dies. And believe me AMD has tried this to a rather extreme extend as well.

What you could potentially work is to taint the kernel and make sure 
that this function is only available to user who absolutely know what 
they are doing.

But I would say we can only allow that if all other options have been 
exercised and doing it like this is really the only option left.

Regards,
Christian.

>> This means that a breakpoint or core dump doesn't halt GPU threads, but
>> rather suspends them. E.g. all running wave data is collected into a state
>> bag which can be restored later on.
>>
>> I was under the impression that those long running compute threads do
>> exactly that, but when the hardware can't switch out the GPU thread/process
>> while in a break then that isn't the case.
>>
>> As long as you don't find a way to avoid that this patch set is a pretty
>> clear NAK from my side as DMA-buf and TTM maintainer.
>>
> I believe this is addressed above.
>
> Matt
>
>> What might work is to keep the submission on the hardware in the break state
>> but forbid any memory access. This way you can signal your preemption fence
>> even when the hardware isn't made available.
>>
>> Before you continue XE setups a new pre-emption fence and makes sure that
>> all page tables etc... are up to date.
>>
>> Could be tricky to get this right if completion fence based submissions are
>> mixed in as well, but that gives you at least a direction you could
>> potentially go.
>>
>> Regards,
>> Christian.
>>
>>> Regards, Joonas
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Some wash-up thoughts from me below, but consider them fairly irrelevant
>>>>> since I think the main driver for these big questions here should be
>>>>> gdb/userspace.
>>>>>
>>>>>> Quoting Christian König (2024-11-07 11:44:33)
>>>>>>> Am 06.11.24 um 18:00 schrieb Matthew Brost:
>>>>>>>
>>>>>>>        [SNIP]
>>>>>>>
>>>>>>>        This is not a generic interface that anyone can freely access. The same
>>>>>>>        permissions used by ptrace are checked when opening such an interface.
>>>>>>>        See [1] [2].
>>>>>>>
>>>>>>>        [1]https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
>>>>>>>        [2]https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2
>>>>>>>
>>>>>>>
>>>>>>> Thanks a lot for those pointers, that is exactly what I was looking for.
>>>>>>>
>>>>>>> And yeah, it is what I feared. You are re-implementing existing functionality,
>>>>>>> but see below.
>>>>>> Could you elaborate on what this "existing functionality" exactly is?
>>>>>> I do not think this functionality exists at this time.
>>>>>>
>>>>>> The EU debugging architecture for Xe specifically avoids the need for GDB
>>>>>> to attach with ptrace to the CPU process or interfere with the CPU process for
>>>>>> the debugging via parasitic threads or so.
>>>>>>
>>>>>> Debugger connection is opened to the DRM driver for given PID (which uses the
>>>>>> ptrace may access check for now) after which the all DRM client of that
>>>>>> PID are exposed to the debugger process.
>>>>>>
>>>>>> What we want to expose via that debugger connection is the ability for GDB to
>>>>>> read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
>>>>>> the EU threads would see them. Note that the layout of the ppGTT is
>>>>>> completely up to the userspace driver to setup and is mostly only partially
>>>>>> equal to the CPU address space.
>>>>>>
>>>>>> Specifically as part of reading/writing the ppGTT for debugging purposes,
>>>>>> there are deep flushes needed: for example flushing instruction cache
>>>>>> when adding/removing breakpoints.
>>>>>>
>>>>>> Maybe that will explain the background. I elaborate on this at the end some more.
>>>>>>
>>>>>>>                kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
>>>>>>>                failing to see the problem with adding a simple helper based on existing
>>>>>>>                code.
>>>>>>>
>>>>>>>            What#s possible and often done is to do kmap/vmap if you need to implement a
>>>>>>>            CPU copy for scanout for example or for copying/validating command buffers.
>>>>>>>            But that usually requires accessing the whole BO and has separate security
>>>>>>>            checks.
>>>>>>>
>>>>>>>            When you want to access only a few bytes of a BO that sounds massively like
>>>>>>>            a peek/poke like interface and we have already rejected that more than once.
>>>>>>>            There even used to be standardized GEM IOCTLs for that which have been
>>>>>>>            removed by now.
>>>>>> Referring to the explanation at top: These IOCTL are not for the debugging target
>>>>>> process to issue. The peek/poke interface is specifically for GDB only
>>>>>> to facilitate the emulation of memory reads/writes on the GPU address
>>>>>> space as they were done by EUs themselves. And to recap: for modifying
>>>>>> instructions for example (add/remove breakpoint), extra level of cache flushing is
>>>>>> needed which is not available to regular userspace.
>>>>>>
>>>>>> I specifically discussed with Sima on the difference before moving forward with this
>>>>>> design originally. If something has changed since then, I'm of course happy to rediscuss.
>>>>>>
>>>>>> However, if this code can't be added, not sure how we would ever be able
>>>>>> to implement core dumps for GPU threads/memory?
>>>>>>
>>>>>>>            If you need to access BOs which are placed in not CPU accessible memory then
>>>>>>>            implement the access callback for ptrace, see amdgpu_ttm_access_memory for
>>>>>>>            an example how to do this.
>>>>>> As also mentioned above, we don't work via ptrace at all when it comes
>>>>>> to debugging the EUs. The only thing used for now is the ptrace_may_access to
>>>>>> implement similar access restrictions as ptrace has. This can be changed
>>>>>> to something else if needed.
>>>>>>
>>>>>>>        Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.
>>>>>>>
>>>>>>>        This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.
>>>>>>>
>>>>>>>        The above function accesses a BO via kmap if it is in SYSTEM / TT,
>>>>>>>        which is existing code.
>>>>>>>
>>>>>>>        This function is only exposed to user space via ptrace permissions.
>>>>>> Maybe this sentence is what caused the confusion.
>>>>>>
>>>>>> Userspace is never exposed with peek/poke interface, only the debugger
>>>>>> connection which is its own FD.
>>>>>>
>>>>>>>        In this series, we implement a function [3] similar to
>>>>>>>        amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
>>>>>>>        missing is non-visible CPU memory access, similar to
>>>>>>>        amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
>>>>>>>        was omitted in this series given its complexity.
>>>>>>>
>>>>>>>        So, this looks more or less identical to AMD's ptrace implementation,
>>>>>>>        but in GPU address space. Again, I fail to see what the problem is here.
>>>>>>>        What am I missing?
>>>>>>>
>>>>>>>
>>>>>>> The main question is why can't you use the existing interfaces directly?
>>>>>> We're not working on the CPU address space or BOs. We're working
>>>>>> strictly on the GPU address space as would be seen by an EU thread if it
>>>>>> accessed address X.
>>>>>>
>>>>>>> Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
>>>>>>> system call, see herehttps://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
>>>>>>>
>>>>>>> The pidfd_getfd() allows to dup() the render node file descriptor into your gdb
>>>>>>> process. That in turn gives you all the access you need from gdb, including
>>>>>>> mapping BOs and command submission on behalf of the application.
>>>>>> We're not operating on the CPU address space nor are we operating on BOs
>>>>>> (there is no concept of BO in the EU debug interface). Each VMA in the VM
>>>>>> could come from anywhere, only the start address and size matter. And
>>>>>> neither do we need to interfere with the command submission of the
>>>>>> process under debug.
>>>>>>
>>>>>>> As far as I can see that allows for the same functionality as the eudebug
>>>>>>> interface, just without any driver specific code messing with ptrace
>>>>>>> permissions and peek/poke interfaces.
>>>>>>>
>>>>>>> So the question is still why do you need the whole eudebug interface in the
>>>>>>> first place? I might be missing something, but that seems to be superfluous
>>>>>>> from a high level view.
>>>>>> Recapping from above. It is to allow the debugging of EU threads per DRM
>>>>>> client, completely independent of the CPU process. If ptrace_may_acces
>>>>>> is the sore point, we could consider other permission checks, too. There
>>>>>> is no other connection to ptrace in this architecture as single
>>>>>> permission check to know if PID is fair game to access by debugger
>>>>>> process.
>>>>>>
>>>>>> Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
>>>>>> the DRM client would also pave way for being able to extend core kernel generated
>>>>>> core dump with each DRM client's EU thread/memory dump. We have similar
>>>>>> feature called "Offline core dump" enabled in the downstream public
>>>>>> trees for i915, where we currently attach the EU thread dump to i915 error state
>>>>>> and then later combine i915 error state with CPU core dump file with a
>>>>>> tool.
>>>>>>
>>>>>> This is relatively little amount of extra code, as this baseline series
>>>>>> already introduces GDB the ability to perform the necessary actions.
>>>>>> It's just the matter of kernel driver calling: "stop all threads", then
>>>>>> copying the memory map and memory contents for GPU threads, just like is
>>>>>> done for CPU threads.
>>>>>>
>>>>>> With parasitic thread injection, not sure if there is such way forward,
>>>>>> as it would seem to require to inject quite abit more logic to core kernel?
>>>>>>
>>>>>>> It's true that the AMD KFD part has still similar functionality, but that is
>>>>>>> because of the broken KFD design of tying driver state to the CPU process
>>>>>>> (which makes it inaccessible for gdb even with imported render node fd).
>>>>>>>
>>>>>>> Both Sima and I (and partially Dave as well) have pushed back on the KFD
>>>>>>> approach. And the long term plan is to get rid of such device driver specific
>>>>>>> interface which re-implement existing functionality just differently.
>>>>>> Recapping, this series is not adding it back. The debugger connection
>>>>>> is a separate FD from the DRM one, with separate IOCTL set. We don't allow
>>>>>> the DRM FD any new operations based on ptrace is attached or not. We
>>>>>> don't ever do that check even.
>>>>>>
>>>>>> We only restrict the opening of the debugger connection to given PID with
>>>>>> ptrace_may_access check for now. That can be changed to something else,
>>>>>> if necessary.
>>>>> Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
>>>>> thing, least because even today all the svm discussions we have still hit
>>>>> clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
>>>>> sections with offsets). Not even speaking of all the gpu usecases where
>>>>> the gpu vm space is still entirely independent of the cpu side.
>>>>>
>>>>> So that's why I think this entirely separate approach looks like the right
>>>>> one, with ptrace_may_access as the access control check to make sure we
>>>>> match ptrace on the cpu side.
>>>>>
>>>>> But there's very obviously a bikeshed to be had on what the actual uapi
>>>>> should look like, especially how gdb opens up a gpu debug access fd. But I
>>>>> also think that's not much on drm to decide, but whatever gdb wants. And
>>>>> then we aim for some consistency on that lookup/access control part
>>>>> (ideally, I might be missing some reasons why this is a bad idea) across
>>>>> drm drivers.
>>>>>
>>>>>>> So you need to have a really really good explanation why the eudebug interface
>>>>>>> is actually necessary.
>>>>>> TL;DR The main point is to decouple the debugging of the EU workloads from the
>>>>>> debugging of the CPU process. This avoids the interference with the CPU process with
>>>>>> parasitic thread injection. Further this also allows generating a core dump
>>>>>> without any GDB connected. There are also many other smaller pros/cons
>>>>>> which can be discussed but for the context of this patch, this is the
>>>>>> main one.
>>>>>>
>>>>>> So unlike parasitic thread injection, we don't unlock any special IOCTL for
>>>>>> the process under debug to be performed by the parasitic thread, but we
>>>>>> allow the minimal set of operations to be performed by GDB as if those were
>>>>>> done on the EUs themselves.
>>>>>>
>>>>>> One can think of it like the minimal subset of ptrace but for EU threads,
>>>>>> not the CPU threads. And thus, building on this it's possible to extend
>>>>>> the core kernel generated core dumps with DRM specific extension which
>>>>>> would contain the EU thread/memory dump.
>>>>> It might be good to document (in that debugging doc patch probably) why
>>>>> thread injection is not a great option, and why the tradeoffs for
>>>>> debugging are different than for for checkpoint/restore, where with CRIU
>>>>> we landed on doing most of this in userspace, and often requiring
>>>>> injection threads to make it all work.
>>>>>
>>>>> Cheers, Sima
>>>>>
>>>>>> Regards, Joonas
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>        Matt
>>>>>>>
>>>>>>>        [3]https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6
>>>>>>>
>>>>>>>
>>>>>>>            Regards,
>>>>>>>            Christian.
>>>>>>>
>>>>>>>
>>>>>>>                Matt
>>>>>>>
>>>>>>>
>>>>>>>                    Regards,
>>>>>>>                    Christian.
>>>>>>>

--------------DDsiqLYOgfnV8Gp0P0fpomyq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 11.11.24 um 23:45 schrieb Matthew Brost:<br>
    <blockquote type="cite"
      cite="mid:ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com">[SNIP]<span
      style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So I think only way to allow interactive debugging is to avoid the
dma_fences. Curious to hear if there are ideas for otherwise.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
You need to guarantee somehow that the process is taken from the hardware so
that the preemption fence can signal.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Our preemption fences have this functionality.

A preemption fence issues a suspend execution command to the firmware. The
firmware, in turn, attempts to preempt the workload. If it doesn't respond
within a specified period, it resets the hardware queue, sends a message to KMD,
bans the software queue, and signals the preemption fence.

We provide even more protection than that. If, for some reason, the firmware
doesn't respond within a longer timeout period, the KMD performs a device reset,
ban the offending software queue(s), and will signal the preemption fences.

This flow remains the same whether a debugger is attached or, for example, a
user submits a 10-minute non-preemptable workload. In either case, other
processes are guaranteed to make forward progress.</pre>
    </blockquote>
    <br>
    Yeah that is pretty much the same argumentation I have heard before
    and it turned out to not be working.<br>
    <br>
    <blockquote type="cite"
      cite="mid:ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">The example above illustrates the memory oversubscription case, where two
processes are using 51% of the memory.</pre>
    </blockquote>
    <br>
    That isn't even necessary. We have seen applications dying just
    because the core memory management tried to join back small pages
    into huge pages in an userptr.<br>
    <br>
    That the core memory management jumps in and requests that the
    pre-emption fence signals can happen all the time.<br>
    <br>
    You can mitigate that a bit, Fedora for example disables joining
    back small pages into huge pages by default for example and we even
    had people suggesting to use mprotect() so that userptrs VMAs don't
    fork() any more (which is of course completely illegal).<br>
    <br>
    But my long term take away is that you can't block all causes of
    sudden requests to let a pre-emption fence signal.<br>
    <br>
    <blockquote type="cite"
      cite="mid:ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">Another preemption scenario involves two processes sharing hardware resources.
Our firmware follows the same flow here. If an LR workload is using a hardware
resource and a DMA-fence workload is waiting, and if the LR workload doesn't
preempt the in a timely manner, the firmware issues a hardware reset, notifies
KMD, and bans the LR software queue. The DMA-fence workload then can make
forward progress

With the above in mind, this is why I say that if a user tries to run a game and
a non-preemptable LR workload, either oversubscribing memory or sharing hardware
resources, it is unlikely to work well. However, I don't think this is a common
use case. I would expect that when a debugger is open, it is typically by a
power user who knows how to disable other GPU tasks (e.g., by enabling software
rendering or using a machine without any display).

Given this, please to reconsider your position.</pre>
    </blockquote>
    <br>
    The key point here is that this isn't stable, you can do that as a
    tech demo but it can always be that debugging an application just
    randomly dies. And believe me AMD has tried this to a rather extreme
    extend as well.<br>
    <br>
    What you could potentially work is to taint the kernel and make sure
    that this function is only available to user who absolutely know
    what they are doing.<br>
    <br>
    But I would say we can only allow that if all other options have
    been exercised and doing it like this is really the only option
    left.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This means that a breakpoint or core dump doesn't halt GPU threads, but
rather suspends them. E.g. all running wave data is collected into a state
bag which can be restored later on.

I was under the impression that those long running compute threads do
exactly that, but when the hardware can't switch out the GPU thread/process
while in a break then that isn't the case.

As long as you don't find a way to avoid that this patch set is a pretty
clear NAK from my side as DMA-buf and TTM maintainer.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I believe this is addressed above.

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">What might work is to keep the submission on the hardware in the break state
but forbid any memory access. This way you can signal your preemption fence
even when the hardware isn't made available.

Before you continue XE setups a new pre-emption fence and makes sure that
all page tables etc... are up to date.

Could be tricky to get this right if completion fence based submissions are
mixed in as well, but that gives you at least a direction you could
potentially go.

Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Regards, Joonas

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Some wash-up thoughts from me below, but consider them fairly irrelevant
since I think the main driver for these big questions here should be
gdb/userspace.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Quoting Christian König (2024-11-07 11:44:33)
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Am 06.11.24 um 18:00 schrieb Matthew Brost:

      [SNIP]

      This is not a generic interface that anyone can freely access. The same
      permissions used by ptrace are checked when opening such an interface.
      See [1] [2].

      [1]<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;rev=2">https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;rev=2</a>
      [2]<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;rev=2">https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;rev=2</a>


Thanks a lot for those pointers, that is exactly what I was looking for.

And yeah, it is what I feared. You are re-implementing existing functionality,
but see below.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Could you elaborate on what this "existing functionality" exactly is?
I do not think this functionality exists at this time.

The EU debugging architecture for Xe specifically avoids the need for GDB
to attach with ptrace to the CPU process or interfere with the CPU process for
the debugging via parasitic threads or so.

Debugger connection is opened to the DRM driver for given PID (which uses the
ptrace may access check for now) after which the all DRM client of that
PID are exposed to the debugger process.

What we want to expose via that debugger connection is the ability for GDB to
read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
the EU threads would see them. Note that the layout of the ppGTT is
completely up to the userspace driver to setup and is mostly only partially
equal to the CPU address space.

Specifically as part of reading/writing the ppGTT for debugging purposes,
there are deep flushes needed: for example flushing instruction cache
when adding/removing breakpoints.

Maybe that will explain the background. I elaborate on this at the end some more.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">              kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
              failing to see the problem with adding a simple helper based on existing
              code.

          What#s possible and often done is to do kmap/vmap if you need to implement a
          CPU copy for scanout for example or for copying/validating command buffers.
          But that usually requires accessing the whole BO and has separate security
          checks.

          When you want to access only a few bytes of a BO that sounds massively like
          a peek/poke like interface and we have already rejected that more than once.
          There even used to be standardized GEM IOCTLs for that which have been
          removed by now.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Referring to the explanation at top: These IOCTL are not for the debugging target
process to issue. The peek/poke interface is specifically for GDB only
to facilitate the emulation of memory reads/writes on the GPU address
space as they were done by EUs themselves. And to recap: for modifying
instructions for example (add/remove breakpoint), extra level of cache flushing is
needed which is not available to regular userspace.

I specifically discussed with Sima on the difference before moving forward with this
design originally. If something has changed since then, I'm of course happy to rediscuss.

However, if this code can't be added, not sure how we would ever be able
to implement core dumps for GPU threads/memory?

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">          If you need to access BOs which are placed in not CPU accessible memory then
          implement the access callback for ptrace, see amdgpu_ttm_access_memory for
          an example how to do this.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">As also mentioned above, we don't work via ptrace at all when it comes
to debugging the EUs. The only thing used for now is the ptrace_may_access to
implement similar access restrictions as ptrace has. This can be changed
to something else if needed.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">      Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.

      This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.

      The above function accesses a BO via kmap if it is in SYSTEM / TT,
      which is existing code.

      This function is only exposed to user space via ptrace permissions.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Maybe this sentence is what caused the confusion.

Userspace is never exposed with peek/poke interface, only the debugger
connection which is its own FD.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">      In this series, we implement a function [3] similar to
      amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
      missing is non-visible CPU memory access, similar to
      amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
      was omitted in this series given its complexity.

      So, this looks more or less identical to AMD's ptrace implementation,
      but in GPU address space. Again, I fail to see what the problem is here.
      What am I missing?


The main question is why can't you use the existing interfaces directly?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">We're not working on the CPU address space or BOs. We're working
strictly on the GPU address space as would be seen by an EU thread if it
accessed address X.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
system call, see herehttps://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.

The pidfd_getfd() allows to dup() the render node file descriptor into your gdb
process. That in turn gives you all the access you need from gdb, including
mapping BOs and command submission on behalf of the application.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">We're not operating on the CPU address space nor are we operating on BOs
(there is no concept of BO in the EU debug interface). Each VMA in the VM
could come from anywhere, only the start address and size matter. And
neither do we need to interfere with the command submission of the
process under debug.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">As far as I can see that allows for the same functionality as the eudebug
interface, just without any driver specific code messing with ptrace
permissions and peek/poke interfaces.

So the question is still why do you need the whole eudebug interface in the
first place? I might be missing something, but that seems to be superfluous
from a high level view.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Recapping from above. It is to allow the debugging of EU threads per DRM
client, completely independent of the CPU process. If ptrace_may_acces
is the sore point, we could consider other permission checks, too. There
is no other connection to ptrace in this architecture as single
permission check to know if PID is fair game to access by debugger
process.

Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
the DRM client would also pave way for being able to extend core kernel generated
core dump with each DRM client's EU thread/memory dump. We have similar
feature called "Offline core dump" enabled in the downstream public
trees for i915, where we currently attach the EU thread dump to i915 error state
and then later combine i915 error state with CPU core dump file with a
tool.

This is relatively little amount of extra code, as this baseline series
already introduces GDB the ability to perform the necessary actions.
It's just the matter of kernel driver calling: "stop all threads", then
copying the memory map and memory contents for GPU threads, just like is
done for CPU threads.

With parasitic thread injection, not sure if there is such way forward,
as it would seem to require to inject quite abit more logic to core kernel?

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">It's true that the AMD KFD part has still similar functionality, but that is
because of the broken KFD design of tying driver state to the CPU process
(which makes it inaccessible for gdb even with imported render node fd).

Both Sima and I (and partially Dave as well) have pushed back on the KFD
approach. And the long term plan is to get rid of such device driver specific
interface which re-implement existing functionality just differently.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Recapping, this series is not adding it back. The debugger connection
is a separate FD from the DRM one, with separate IOCTL set. We don't allow
the DRM FD any new operations based on ptrace is attached or not. We
don't ever do that check even.

We only restrict the opening of the debugger connection to given PID with
ptrace_may_access check for now. That can be changed to something else,
if necessary.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
thing, least because even today all the svm discussions we have still hit
clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
sections with offsets). Not even speaking of all the gpu usecases where
the gpu vm space is still entirely independent of the cpu side.

So that's why I think this entirely separate approach looks like the right
one, with ptrace_may_access as the access control check to make sure we
match ptrace on the cpu side.

But there's very obviously a bikeshed to be had on what the actual uapi
should look like, especially how gdb opens up a gpu debug access fd. But I
also think that's not much on drm to decide, but whatever gdb wants. And
then we aim for some consistency on that lookup/access control part
(ideally, I might be missing some reasons why this is a bad idea) across
drm drivers.

</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">So you need to have a really really good explanation why the eudebug interface
is actually necessary.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">TL;DR The main point is to decouple the debugging of the EU workloads from the
debugging of the CPU process. This avoids the interference with the CPU process with
parasitic thread injection. Further this also allows generating a core dump
without any GDB connected. There are also many other smaller pros/cons
which can be discussed but for the context of this patch, this is the
main one.

So unlike parasitic thread injection, we don't unlock any special IOCTL for
the process under debug to be performed by the parasitic thread, but we
allow the minimal set of operations to be performed by GDB as if those were
done on the EUs themselves.

One can think of it like the minimal subset of ptrace but for EU threads,
not the CPU threads. And thus, building on this it's possible to extend
the core kernel generated core dumps with DRM specific extension which
would contain the EU thread/memory dump.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">It might be good to document (in that debugging doc patch probably) why
thread injection is not a great option, and why the tradeoffs for
debugging are different than for for checkpoint/restore, where with CRIU
we landed on doing most of this in userspace, and often requiring
injection threads to make it all work.

Cheers, Sima

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Regards, Joonas

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Regards,
Christian.



      Matt

      [3]<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;rev=6">https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;rev=6</a>


          Regards,
          Christian.


              Matt


                  Regards,
                  Christian.

</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------DDsiqLYOgfnV8Gp0P0fpomyq--
