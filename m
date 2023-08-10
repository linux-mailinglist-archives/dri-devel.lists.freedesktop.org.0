Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC07781CB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 21:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DE110E5F9;
	Thu, 10 Aug 2023 19:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0783B10E5F5;
 Thu, 10 Aug 2023 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691696957; x=1723232957;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VAaBgDJLhBWmi/GvbFglmzyFahCHaSJI/9S17GpRxzg=;
 b=W3quRB4CzH3DI5mlQQEQ0dhfTL/7EbNPs/IPgbUtBDk7XZOHaoqo8Sat
 3N9TiWRAx5cYBljS6BiD64zvNK901F/0S3xIhW/xSiZvr3F40Ik9r38+N
 v8uifS2nkm4Bthzi8QsqGLoCj71GNaqBjf8MgpYs+hKZqXjY6+d/6BZC2
 ihX1rblJKP55tDzhpFoNMUZEvSvO3PY4rn0qdEIlvxTx6luD2awbwSqvf
 InaIOZi527bnDrNdAYHlTxGfPbG4cX9AZ+9FYtD1AETrWRi9Nu0n3d13i
 ElS50xYSYuEEZey1rtFW9fyEviwf2sWRLoNNjK4lMxhcwfcl1YQ9q+Cxd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="371513058"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="371513058"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 12:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="856024486"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="856024486"
Received: from chengdey-mobl1.ccr.corp.intel.com (HELO [10.249.254.166])
 ([10.249.254.166])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 12:49:08 -0700
Message-ID: <68891fe4-7bbb-be0b-d022-5772bc45d15a@linux.intel.com>
Date: Thu, 10 Aug 2023 21:49:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-xe] [PATCH v5] Documentation/gpu: Add a VM_BIND async
 draft document
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20230715154543.13183-1-thomas.hellstrom@linux.intel.com>
 <50419f5bf1e3e5238cce2d71fd2e100cb7bc3364.camel@intel.com>
 <ZM1ZS9ZTU154Eyah@intel.com>
 <fca40ff15732627ec4391d1b6277388505af1bb7.camel@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <fca40ff15732627ec4391d1b6277388505af1bb7.camel@intel.com>
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zeng,
 Oak" <oak.zeng@intel.com>, "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Paulo.

Thanks for reviewing. I'd like to try give some answers below.

On 8/4/23 23:30, Zanoni, Paulo R wrote:
> On Fri, 2023-08-04 at 16:02 -0400, Rodrigo Vivi wrote:
>> On Wed, Jul 19, 2023 at 07:50:21PM +0000, Zanoni, Paulo R wrote:
>>> On Sat, 2023-07-15 at 17:45 +0200, Thomas Hellström wrote:
>>>> Add a motivation for and description of asynchronous VM_BIND operation
>>> I think I may have missed some other documentation, which would explain
>>> some of my questions below, so please be patient with my
>>> misunderstandings. But here's a review from the POV of a UMD person.
>>>
>>>
>>>> v2:
>>>> - Fix typos (Nirmoy Das)
>>>> - Improve the description of a memory fence (Oak Zeng)
>>>> - Add a reference to the document in the Xe RFC.
>>>> - Add pointers to sample uAPI suggestions
>>>> v3:
>>>> - Address review comments (Danilo Krummrich)
>>>> - Formatting fixes
>>>> v4:
>>>> - Address typos (Francois Dugast)
>>>> - Explain why in-fences are not allowed for VM_BIND operations for long-
>>>>    running workloads (Matthew Brost)
>>>> v5:
>>>> - More typo- and style fixing
>>>> - Further clarify the implications of disallowing in-fences for VM_BIND
>>>>    operations for long-running workloads (Matthew Brost)
>>>>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   Documentation/gpu/drm-vm-bind-async.rst | 171 ++++++++++++++++++++++++
>>>>   Documentation/gpu/rfc/xe.rst            |   4 +-
>>>>   2 files changed, 173 insertions(+), 2 deletions(-)
>>>>   create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
>>>>
>>>> diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
>>>> new file mode 100644
>>>> index 000000000000..d2b02a38198a
>>>> --- /dev/null
>>>> +++ b/Documentation/gpu/drm-vm-bind-async.rst
>>>> @@ -0,0 +1,171 @@
>>>> +====================
>>>> +Asynchronous VM_BIND
>>>> +====================
>>>> +
>>>> +Nomenclature:
>>>> +=============
>>>> +
>>>> +* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
>>>> +
>>>> +* ``gpu_vm``: A GPU address space. Typically per process, but can be shared by
>>>> +  multiple processes.
>>>> +
>>>> +* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
>>>> +  an IOCTL. The operations include mapping and unmapping system- or
>>>> +  VRAM memory.
>>>> +
>>>> +* ``syncobj``: A container that abstracts synchronization objects. The
>>>> +  synchronization objects can be either generic, like dma-fences or
>>>> +  driver specific. A syncobj typically indicates the type of the
>>>> +  underlying synchronization object.
>>>> +
>>>> +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
>>>> +  for these before starting.
>>>> +
>>>> +* ``out-syncobj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
>>>> +  signals these when the bind operation is complete.
>>>> +
>>>> +* ``memory fence``: A synchronization object, different from a dma-fence.
>>> Since you've mentioned it twice in this document already, for
>>> completeness would you mind also giving a definition for dma-fence in
>>> what it relates/contrasts to the rest of the text?
>> Maybe worth a link to the dma-fence doc itself?
>> (somehow making sphinx to point out to driver-api/dma-buf.html#dma-fences)

Will respin and add a link to this. This document indeed assumes the 
reader is somewhat familiar with the dma-fence concept.

>>
>> But the differences are written below Paulo:
>>
>>>
>>>> +  A memory fence uses the value of a specified memory location to determine
>>>> +  signaled status. A memory fence can be awaited and signaled by both
>>>> +  the GPU and CPU. Memory fences are sometimes referred to as
>>>> +  user-fences, userspace-fences or gpu futexes and do not necessarily obey
>>>> +  the dma-fence rule of signaling within a "reasonable amount of time".
>>>> +  The kernel should thus avoid waiting for memory fences with locks held.
>> ^
>>
>>>> +
>>>> +* ``long-running workload``: A workload that may take more than the
>>>> +  current stipulated dma-fence maximum signal delay to complete and
>>> Where is this delay defined? Is this the same as the gpuhang timer?
>> dma-fence defines it in a very "cool" way: "reasonable amount of time":
>> https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#dma-fences
>>
>> so, in contrast, long-running workload is *anything* above that
>> "reasonable amount of time".
> That answers it but doesn't exactly answer it either. In practice, how
> much is that "reasonable amount of time"? This is documentation, it
> should avoid using vague statements or hypothetical cases. The
> documentation you posted suggested this may be the same as the GPU hang
> timeout, but doesn't give a definitive answer (because multiple drivers
> may define it differently, apparently). In practice, what do drivers
> do? As a user-space developer, how long can I wait before things fail?
> Is there a way to figure out, maybe query a parameter somewhere? Which
> driver waits the least? Which driver waits the most?  Is 10 seconds
> "reasonable amount of time"? My grandma thinks 2 weeks is a reasonable
> amount of time when waiting for things.

We can't do much more than point to the dma-fence document here, since 
we can't have a vague definition in the main document which is 
overridden in another document describing something completely different.

FWIW a reasonable amount of time is ideally slightly shorter than the 
the time where a user thinks the system is hung, gets irritated and 
presses the reset button.

>
>>>
>>>> +  which therefore needs to set the gpu_vm or the GPU execution context in
>>>> +  a certain mode that disallows completion dma-fences.
>>>> +
>>>> +* ``exec function``: An exec function is a function that revalidates all
>>>> +  affected gpu_vmas, submits a GPU command batch and registers the
>>>> +  dma_fence representing the GPU command's activity with all affected
>>>> +  dma_resvs. For completeness, although not covered by this document,
>>>> +  it's worth mentioning that an exec function may also be the
>>>> +  revalidation worker that is used by some drivers in compute /
>>>> +  long-running mode.
>>>> +
>>>> +* ``bind context``: A context identifier used for the VM_BIND
>>>> +  operation. VM_BIND operations that use the same bind context can be
>>>> +  assumed, where it matters, to complete in order of submission. No such
>>>> +  assumptions can be made for VM_BIND operations using separate bind contexts.
>>>> +
>>>> +* ``UMD``: User-mode driver.
>>>> +
>>>> +* ``KMD``: Kernel-mode driver.
>>>> +
>>>> +
>>>> +Synchronous / Asynchronous VM_BIND operation
>>>> +============================================
>>>> +
>>>> +Synchronous VM_BIND
>>>> +___________________
>>>> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
>>>> +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
>>>> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
>>>> +for example swap-in or clearing, or even previous binds.
>>>> +
>>>> +Asynchronous VM_BIND
>>>> +____________________
>>>> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
>>>> +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
>>>> +before modifying the GPU page-tables, and signal the out-syncobjs when
>>>> +the modification is done in the sense that the next exec function that
>>>> +awaits for the out-syncobjs will see the change. Errors are reported
>>>> +synchronously assuming that the asynchronous part of the job never errors.
>>> There's a small degree of uncertainty here, which I think we can
>>> eliminate. Can you please make the text clearer? Do you mean "some
>>> errors will be reported synchronously but some others won't"? In what
>>> conditions can the async part error?
>> "assuming that the asynchronous part of the job ***never*** errors"
>>
>> Errors are only reported synchronously.
> This is documentation, that "assumption" there really throws things up
> in the air. We need a precise statement: can things EVER fail after the
> ioctl returns? If yes, how can user space know about it and how should
> it proceed? If no, please adjust the text. Is it the case that some
> drivers can but others can't? Which ones?

I'll change that to "errors are only reported synchronously".

>
>
>>>
>>>> +In low-memory situations the implementation may block, performing the
>>>> +VM_BIND synchronously, because there might not be enough memory
>>>> +immediately available for preparing the asynchronous operation.
>>>> +
>>>> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
>>>> +the in-syncobjs needs to signal before the first operation starts to
>>>> +execute, and the out-syncobjs signal after the last operation
>>>> +completes. Operations in the operation list can be assumed, where it
>>>> +matters, to complete in order.
>>>> +
>>>> +Since asynchronous VM_BIND operations may use dma-fences embedded in
>>>> +out-syncobjs and internally in KMD to signal bind completion,  any
>>>> +memory fences given as VM_BIND in-fences need to be awaited
>>>> +synchronously before the VM_BIND ioctl returns, since dma-fences,
>>>> +required to signal in a reasonable amount of time, can never be made
>>>> +to depend on memory fences that don't have such a restriction.
>>>> +
>>>> +To aid in supporting user-space queues, the VM_BIND may take a bind context.
>>>> +
>>>> +The purpose of an Asynchronous VM_BIND operation is for user-mode
>>>> +drivers to be able to pipeline interleaved gpu_vm modifications and
>>>> +exec functions. For long-running workloads, such pipelining of a bind
>>>> +operation is not allowed and any in-fences need to be awaited
>>>> +synchronously. The reason for this is twofold. First, any memory
>>>> +fences gated by a long-running workload and used as in-syncobjs for the
>>>> +VM_BIND operation will need to be awaited synchronously anyway (see
>>>> +above). Second, any dma-fences used as in-syncobjs for VM_BIND
>>>> +operations for long-running workloads will not allow for pipelining
>>>> +anyway since long-running workloads don't allow for dma-fences as
>>>> +out-syncobjs, so while theoretically possible the use of them is
>>>> +questionable and should be rejected until there is a valuable use-case.
>>>> +Note that this is not a limitation imposed by dma-fence rules, but
>>>> +rather a limitation imposed to keep KMD implementation simple. It does
>>>> +not affect using dma-fences as dependencies for the long-running
>>>> +workload itself, which is allowed by dma-fence rules, but rather for
>>>> +the VM_BIND operation only.
>>>> +
>>>> +Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
>>>> +select memory fences as out-fences since that gives greater flexibility for
>>>> +the kernel mode driver to inject other operations into the bind /
>>>> +unbind operations. Like for example inserting breakpoints into batch
>>>> +buffers. The workload execution can then easily be pipelined behind
>>>> +the bind completion using the memory out-fence as the signal condition
>>>> +for a GPU semaphore embedded by UMD in the workload.
>>>> +
>>>> +Multi-operation VM_BIND IOCTL error handling and interrupts
>>>> +===========================================================
>>> What do you mean by multi-operation here? Is it where I pass multiple
>>> addresses to a single vm_bind ioctl? If yes, where is the section for
>>> single-operation errors? What differs between multi-operation and
>>> single-operation?
>> I don't feel that we need a single-operation mode, because if it failed
>> it failed by itself without dependency tracking. The problem comes only
>> on the multi-operation.
> That doesn't answer my question. It would be good if the text precisely
> defined what multi-operation means, what single-operation means and how
> things behave during single-operation.

Will improve on this. Multi-operation is where you combine multiple 
VM_BIND operations in a single IOCTL, rather than supporting just a 
single operation per IOCTL. Will double-check if any of the drivers 
support the latter.


>>>
>>>> +
>>>> +The VM_BIND operations of the IOCTL may error due to lack of resources
>>>> +to complete and also due to interrupted waits. In both situations UMD
>>> Earlier you talked about two classes of errors: ones that get signaled
>>> when the ioctl returns, and ones that happen during the "asynchronous
>>> part of the job". It seems here you're talking about the first. But
>>> then, what about the second class of errors?
>> there's only synchronously errors.
> Do you mean "there is only reporting for synchronous errors" or "there
> can't be errors in the asynchronous part"?
>
> The whole description of "when things fail, the system may be left in
> an undefined state where only some operations were done" doesn't seem
> to align with what I would expect of a "gather all resources earlier,
> fail if we can't, then do things asynchronously later in a way which
> they can't fail" mode, because "some things completed and others
> didn't, but you got an error code synchronously" kinda suggests that
> the operation was synchronous instead of asynchronous, unless there's a
> way of  traveling back in time to give the error before the ioctl
> returned, or I'm way off in my interpretation.

This all boils down to the "multiple operations" IOCTL. Say that we do 
100 vm binds in a single IOCTL. Implementation-wise we could do either

1) Gather all resources needed for all 100 operations.
2) Submit for execution.

OR

for all 100 operations do
     gather all resources for a single operation
     submit the single operation for execution
end

The text deals with the latter case. If 99 operations already were 
submitted without an error, but we error on the 100th.

>
>>>
>>>
>>>> +should preferably restart the IOCTL after taking suitable action. If
>>>> +UMD has over-committed a memory resource, an -ENOSPC error will be
>>>> +returned, and UMD may then unbind resources that are not used at the
>>>> +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
>>>> +IOCTL and on -ENOMEM user-space may either attempt to free known
>>>> +system memory resources or abort the operation. If aborting as a
>>>> +result of a failed operation in a list of operations, some operations
>>>> +may still have completed, and to get back to a known state, user-space
>>>> +should therefore attempt to unbind all virtual memory regions touched
>>>> +by the failing IOCTL.
>>>> +Unbind operations are guaranteed not to cause any errors due to
>>>> +resource constraints.
>>>> +In between a failed VM_BIND IOCTL and a successful restart there may
>>> Wait a minute, the paragraphs above just say "if things fail, try
>>> clearing resources and then try again". What constitutes of a
>>> "successful restart"? Is there some kind of state machine involved? Is
>>> this talking about errors after the ioctl returns? Why don't errors
>>> simply undo everything and leave user space in the same state as before
>>> the ioctl?
>> This is exactly the "Open:" documented below.
>>
>>>
>>>> +be implementation defined restrictions on the use of the gpu_vm. For a
>>>> +description why, please see KMD implementation details under `error
>>>> +state saving`_.
>>>> +
>>>> +Sample uAPI implementations
>>>> +===========================
>>>> +Suggested uAPI implementations at the moment of writing can be found for
>>>> +the Nouveau driver `here
>>>> +<https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6>`_.
>>>> +and for the Xe driver `here
>>>> +<https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
>>>> +
>>>> +KMD implementation details
>>>> +==========================
>>>> +
>>>> +Error state saving
>>>> +__________________
>>>> +Open: When the VM_BIND IOCTL returns an error, some or even parts of
>>       ^ Note the "Open:" here.
>>
>>>> +an operation may have been completed. If the IOCTL is restarted, in
>>>> +order to know where to restart, the KMD can either put the gpu_vm in
>>>> +an error state and save one instance of the needed restart state
>>>> +internally. In this case, KMD needs to block further modifications of
>>>> +the gpu_vm state that may cause additional failures requiring a
>>>> +restart state save, until the error has been fully resolved. If the
>>>> +uAPI instead defines a pointer to a UMD allocated cookie in the IOCTL
>>>> +struct, it could also choose to store the restart state in that cookie.
>>> Ok, so there is some kind of state machine here, but either I don't
>>> understand or it's not fully explained. This whole "restart state" part
>>> is confusing to me, please clarify.
>> It is an open that we still need to define...
>>
>>>
>>>> +
>>>> +The restart state may, for example, be the number of successfully
>>>> +completed operations.
>>>> +
>>>> +Easiest for UMD would of course be if KMD did a full unwind on error
>>>> +so that no error state needs to be saved.
>>> But does KMD do it? As a UMD person, what should I expect?\
>> it is an open question. I believe we should rewind all the operations
>> in the same ioctl. Possible? Easy? I don't know, but it would be good
>> to have UMD input here.
> As someone who's writing user-space, for my case I don't know if
> there's anything I can do besides undoing anything the Kernel has done
> and return failure hoping the upper layers of the stack run some kind
> of garbage colletor or just have better luck the next frame. So either
> the Kernel does it for me, or I'll have to write code to do it myself,
> but the Kernel is probably in a *way* better position to revert state
> back to the point where it was before I issue the ioctl, assuming the
> error actually happens before the ioctl returns. And if errors can
> happen asynchronously, I just have no idea how to fix things, perhaps
> there's not much besides doing what we do when we get a GPU hang.
>
> You suggested errors can only happen synchronously, but if that's the
> case why do we even have this apparent state machine? How does it help
> to be put in a restricted state where you need to deal with unbinds in
> a different way, instead of just allowing me to do unbinds normally?
> What do we gain with the state machine? What case does it help?

Personally, I'm for KMD rolling back everything on error. Nouveau does 
that. Benefits it gives a clean understandable user-interface without 
ever putting the vm in an error state the UMD needs to know about. There 
are two main drawbacks, though.

1) Gathering resources for VM_BIND operations may take time and 
restarting will be faster than rolling back and retry.
2) It will be a bit painful to implement KMD rollbacks in Xe. A 
substantial code refactoring.

>
>> Should KMD rewind everything that succedded before the error? or
>> have the cookie idea and block all the further operations on that
>> vm unless if the cookie information is valid?
>>
>>>
>>>> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>>>> index 2516fe141db6..0f062e1346d2 100644
>>>> --- a/Documentation/gpu/rfc/xe.rst
>>>> +++ b/Documentation/gpu/rfc/xe.rst
>>>> @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
>>>>   possible ways.
>>>>   
>>>>   As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
>>>> -various flavors, error handling and a sample API should be documented here or in
>>>> -a separate document pointed to by this document.
>>>> +various flavors, error handling and sample API suggestions are documented in
>>>> +Documentation/gpu/drm-vm-bind-async.rst
>>>>   
>>>>   Userptr integration and vm_bind
>>>>   -------------------------------
>> While writing this answers I had to read everything again.
>> I agree with Danilo on ensuring we explicitly add the 'virtual'

I'll double-check on that as well.

Thanks,

Thomas


>> to the gpu_vm description. And with that:
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
