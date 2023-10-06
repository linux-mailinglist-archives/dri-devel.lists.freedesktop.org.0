Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5487BBF6A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 20:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2C310E560;
	Fri,  6 Oct 2023 18:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0B310E556;
 Fri,  6 Oct 2023 18:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696618665; x=1728154665;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gEq8BLyhqEM908jCi6eOTWN0hzGrQ9GQEQPdlpKCGKI=;
 b=kE3u1VQowuzRuJ5u+2TZiNQVgrJ9dmgP0swZ4YqnXVyWIgfwfb2d3LaA
 K7cV5XFdheA5ylqBVZjjhDcz6TsIC1LDev+zmOsjQWYFZ7gBb75x4J3ii
 b2TNCAoB6eU/zkL0TnjAHtL3iGFxe02hwYYASfUUqFAZjEWaX5Iju9/lC
 FHD2Uvhbb/esbVa2XdoeAs5GAufWJ0J+fgYDGWWcMO3HLG/HyTlA4mZG1
 rCHOBTecB15GIpwdyX19S1yCicByoBqGL/EJ0Wq7B2Rhz5sAy45Ow+RfA
 38pYEgZ65sCNoHjiDl1i/0IMTaVLZvYx0mev2KH9IqgD3h7ThAKNHTVPX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="2416847"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="2416847"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 11:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="926054450"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="926054450"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.151])
 ([10.249.254.151])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 11:57:30 -0700
Message-ID: <b0dcfd30-7c28-822f-c452-f22c953b6c03@linux.intel.com>
Date: Fri, 6 Oct 2023 20:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7] Documentation/gpu: Add a VM_BIND async document
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230911124746.39149-1-thomas.hellstrom@linux.intel.com>
 <7dbb6926e2efbdcb8acbc02feb6ba78b58f23e27.camel@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <7dbb6926e2efbdcb8acbc02feb6ba78b58f23e27.camel@intel.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zeng,
 Oak" <oak.zeng@intel.com>, "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/12/23 20:33, Zanoni, Paulo R wrote:
> On Mon, 2023-09-11 at 14:47 +0200, Thomas Hellström wrote:
>> Add a motivation for and description of asynchronous VM_BIND operation
>>
>> v2:
>> - Fix typos (Nirmoy Das)
>> - Improve the description of a memory fence (Oak Zeng)
>> - Add a reference to the document in the Xe RFC.
>> - Add pointers to sample uAPI suggestions
>> v3:
>> - Address review comments (Danilo Krummrich)
>> - Formatting fixes
>> v4:
>> - Address typos (Francois Dugast)
>> - Explain why in-fences are not allowed for VM_BIND operations for long-
>>    running workloads (Matthew Brost)
>> v5:
>> - More typo- and style fixing
>> - Further clarify the implications of disallowing in-fences for VM_BIND
>>    operations for long-running workloads (Matthew Brost)
>> v6:
>> - Point out that a gpu_vm is a virtual GPU Address space.
>>    (Danilo Krummrich)
>> - For an explanation of dma-fences point to the dma-fence documentation.
>>    (Paolo Zanoni)
>> - Clarify that VM_BIND errors are reported synchronously. (Paulo Zanoni)
>> - Use an rst doc reference when pointing to the async vm_bind document
>>    from the xe merge plan.
>> - Add the VM_BIND documentation to the drm documentation table-of-content,
>>    using an intermediate "Misc DRM driver uAPI- and feature implementation
>>    guidelines"
>> v7:
>> - Update the error handling documentation to remove the VM error state.
>>
>> Cc: Paulo R Zanoni <paulo.r.zanoni@intel.com>
> I was asked to give my input (ack or nack) here, since I'm working on
> the Sparse implementation for Anv, which makes use of vm_bind (mesa MR
> 23045).
>
> I understand that this text is mostly "implementation guidelines for
> drivers". While I understand what's written in the text, I think it's
> way too vague for me - wearing my user-space user-of-these-interfaces
> hat - to make sense of:  I still don't know what exactly I'm supposed
> to do with it, especially the error handling paths.
>
> I was waiting to see if a proposal for xe.ko implementation would
> appear before I could actually make full sense of this text and then
> ack or nack anything. That's still my plan. More below.
>
>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/drm-vm-bind-async.rst       | 155 ++++++++++++++++++
>>   .../gpu/implementation_guidelines.rst         |   9 +
>>   Documentation/gpu/index.rst                   |   1 +
>>   Documentation/gpu/rfc/xe.rst                  |   4 +-
>>   4 files changed, 167 insertions(+), 2 deletions(-)
>>   create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
>>   create mode 100644 Documentation/gpu/implementation_guidelines.rst
>>
>> diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
>> new file mode 100644
>> index 000000000000..f12f794408b9
>> --- /dev/null
>> +++ b/Documentation/gpu/drm-vm-bind-async.rst
>> @@ -0,0 +1,155 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +====================
>> +Asynchronous VM_BIND
>> +====================
>> +
>> +Nomenclature:
>> +=============
>> +
>> +* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
>> +
>> +* ``gpu_vm``: A virtual GPU address space. Typically per process, but
>> +  can be shared by multiple processes.
>> +
>> +* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
>> +  an IOCTL. The operations include mapping and unmapping system- or
>> +  VRAM memory.
>> +
>> +* ``syncobj``: A container that abstracts synchronization objects. The
>> +  synchronization objects can be either generic, like dma-fences or
>> +  driver specific. A syncobj typically indicates the type of the
>> +  underlying synchronization object.
>> +
>> +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
>> +  for these before starting.
>> +
>> +* ``out-syncobj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
>> +  signals these when the bind operation is complete.
>> +
>> +* ``dma-fence``: A cross-driver synchronization object. A basic
>> +  understanding of dma-fences is required to digest this
>> +  document. Please refer to the ``DMA Fences`` section of the
>> +  :doc:`dma-buf doc </driver-api/dma-buf>`.
>> +
>> +* ``memory fence``: A synchronization object, different from a dma-fence.
>> +  A memory fence uses the value of a specified memory location to determine
>> +  signaled status. A memory fence can be awaited and signaled by both
>> +  the GPU and CPU. Memory fences are sometimes referred to as
>> +  user-fences, userspace-fences or gpu futexes and do not necessarily obey
>> +  the dma-fence rule of signaling within a "reasonable amount of time".
>> +  The kernel should thus avoid waiting for memory fences with locks held.
>> +
>> +* ``long-running workload``: A workload that may take more than the
>> +  current stipulated dma-fence maximum signal delay to complete and
>> +  which therefore needs to set the gpu_vm or the GPU execution context in
>> +  a certain mode that disallows completion dma-fences.
>> +
>> +* ``exec function``: An exec function is a function that revalidates all
>> +  affected gpu_vmas, submits a GPU command batch and registers the
>> +  dma_fence representing the GPU command's activity with all affected
>> +  dma_resvs. For completeness, although not covered by this document,
>> +  it's worth mentioning that an exec function may also be the
>> +  revalidation worker that is used by some drivers in compute /
>> +  long-running mode.
>> +
>> +* ``bind context``: A context identifier used for the VM_BIND
>> +  operation. VM_BIND operations that use the same bind context can be
>> +  assumed, where it matters, to complete in order of submission. No such
>> +  assumptions can be made for VM_BIND operations using separate bind contexts.
>> +
>> +* ``UMD``: User-mode driver.
>> +
>> +* ``KMD``: Kernel-mode driver.
>> +
>> +
>> +Synchronous / Asynchronous VM_BIND operation
>> +============================================
>> +
>> +Synchronous VM_BIND
>> +___________________
>> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
>> +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
>> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
>> +for example swap-in or clearing, or even previous binds.
> As of the last time I checked this, xe.ko had a lot of restrictions for
> synchronous vm_bind that async didn't have, making it impossible to
> implement sparse binding with synchronous vm_bind. For example, partial
> unbinds return -EBUSY unless async. The text does not mention this
> distinction. What is the plan here?
>
> I was told these restrictions would go away, but plans have changed
> since then and I'm not sure that's still the plan.

Those restrictions will go away. The distinction between sync and async 
is more explictly detailed in the latest version of the doc.


>
>
>> +
>> +Asynchronous VM_BIND
>> +____________________
>> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
>> +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
>> +before modifying the GPU page-tables, and signal the out-syncobjs when
>> +the modification is done in the sense that the next exec function that
>> +awaits for the out-syncobjs will see the change. Errors are reported
>> +synchronously.
>> +In low-memory situations the implementation may block, performing the
>> +VM_BIND synchronously, because there might not be enough memory
>> +immediately available for preparing the asynchronous operation.
>> +
>> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
>> +the in-syncobjs needs to signal before the first operation starts to
>> +execute, and the out-syncobjs signal after the last operation
>> +completes. Operations in the operation list can be assumed, where it
>> +matters, to complete in order.
> The above is clear.
>
>> +
>> +Since asynchronous VM_BIND operations may use dma-fences embedded in
>> +out-syncobjs and internally in KMD to signal bind completion,  any
>> +memory fences given as VM_BIND in-fences need to be awaited
>> +synchronously before the VM_BIND ioctl returns, since dma-fences,
>> +required to signal in a reasonable amount of time, can never be made
>> +to depend on memory fences that don't have such a restriction.
>> +
>> +To aid in supporting user-space queues, the VM_BIND may take a bind context.
>> +
>> +The purpose of an Asynchronous VM_BIND operation is for user-mode
>> +drivers to be able to pipeline interleaved gpu_vm modifications and
>> +exec functions. For long-running workloads, such pipelining of a bind
>> +operation is not allowed and any in-fences need to be awaited
>> +synchronously. The reason for this is twofold. First, any memory
>> +fences gated by a long-running workload and used as in-syncobjs for the
>> +VM_BIND operation will need to be awaited synchronously anyway (see
>> +above). Second, any dma-fences used as in-syncobjs for VM_BIND
>> +operations for long-running workloads will not allow for pipelining
>> +anyway since long-running workloads don't allow for dma-fences as
>> +out-syncobjs, so while theoretically possible the use of them is
>> +questionable and should be rejected until there is a valuable use-case.
>> +Note that this is not a limitation imposed by dma-fence rules, but
>> +rather a limitation imposed to keep KMD implementation simple. It does
>> +not affect using dma-fences as dependencies for the long-running
>> +workload itself, which is allowed by dma-fence rules, but rather for
>> +the VM_BIND operation only.
>> +
>> +Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
>> +select memory fences as out-fences since that gives greater flexibility for
>> +the kernel mode driver to inject other operations into the bind /
>> +unbind operations. Like for example inserting breakpoints into batch
>> +buffers. The workload execution can then easily be pipelined behind
>> +the bind completion using the memory out-fence as the signal condition
>> +for a GPU semaphore embedded by UMD in the workload.
>> +
>> +Multi-operation VM_BIND IOCTL error handling and interrupts
>> +===========================================================
>> +
>> +The VM_BIND operations of the IOCTL may error due to lack of resources
>> +to complete and also due to interrupted waits. In both situations UMD
>> +should preferably restart the IOCTL after taking suitable action. If
>> +UMD has over-committed a memory resource, an -ENOSPC error will be
>> +returned, and UMD may then unbind resources that are not used at the
>> +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
>> +IOCTL and on -ENOMEM user-space may either attempt to free known
>> +system memory resources or abort the operation. If aborting as a
> Since previously we were talking about what appeared to be some state
> machine related to error hanlding, the words "restart" and "abort" made
> more sense. Can you please better define them now? Will we have like a
> "restart" ioctl (or flag) and an "abort" ioctl (or flag)? Or by restart
> do you mean "try again the same ioctl" and by abort you mean "just give
> up"? I do see XE_VM_BIND_OP_RESTART in the header file, but I can't
> find an abort operation.

XE_VM_BIND_OP_RESTART is going away. Typically UMDs have  a

do {
     err = ioctl();
} while (err ==-EINTR);

"abort" is meaning "just give up". This is also more clearly specified 
in the latest version.

>
>> +result of a failed operation or signal delivery in a list of operations,
>> +KMD may choose to unwind all operations in the list or return to
>> +UMD in a driver-defined manner the number of operations actually
> The "may choose to" is what kills it for me. Will it? What if it
> chooses not to? What else may it choose to do? Why are we mentioning
> only this specific possibility?
This is an implementation guideline thing. It was expected that the 
driver-specific implementation would add relevant docs for how the 
specific driver would implement this.
But I changed that to be clear in the latest revision. Xe will initially 
unwind all operations.
>
>
>> +completed. In the latter-case UMD should be given the option to restart
>> +the IOCTL from the operation immediately succeeding the last completed
>> +operation.
> This gives me the impression that "restart" will still actually be a
> specific ioctl or flag. Is that the case?

No. Just relaunch the same ioctl without changing arguments, like in the 
loop above.


>
> Will user space have the option to say "if you can't bind everything,
> please fail and leve us in the same state as we were before the ioctl"?
>
No, not initially for Xe. We'll unwind everything.


>> +Unbind operations are guaranteed not to cause any errors due to
>> +resource constraints.
> But may it cause errors due to other reasons?
>
Yes that's also detailed in the latest version.


>> +
>> +Sample uAPI implementations
>> +===========================
>> +Suggested uAPI implementations at the moment of writing can be found for
>> +the `Nouveau driver
>> +<https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6>`_.
>> +and for the `Xe driver
>> +<https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> Is this claiming that the current xe.ko implementation is what is going
> to be definitive interface? I was told it was going to change.
>
> The explanation on top of the definition for XE_VM_BIND_FLAG_ASYNC does
> not seem to reflect what's written here, at all (or I am severely
> misunderstanding everything). It async ops can fail even after the
> ioctl returns, although it doesn't teach us how to check it. It
> mentions, drm_xe_vm_bind_op_error_capture, but I have no idea how it
> works. It has a RESTART flag and describes the error-handling state
> machine thing.

The latest revision is now self-containing WRT to the above.

This might mean we need to make the document Xe-specific rather than an 
implementation guideline but please get back with feedback if something 
in the uAPI looks awkward or incorrect.

Hope this answers your questions.

Thanks,

Thomas


>
> Thanks,
> Paulo
>
>
>> diff --git a/Documentation/gpu/implementation_guidelines.rst b/Documentation/gpu/implementation_guidelines.rst
>> new file mode 100644
>> index 000000000000..138e637dcc6b
>> --- /dev/null
>> +++ b/Documentation/gpu/implementation_guidelines.rst
>> @@ -0,0 +1,9 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +===========================================================
>> +Misc DRM driver uAPI- and feature implementation guidelines
>> +===========================================================
>> +
>> +.. toctree::
>> +
>> +   drm-vm-bind-async
>> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
>> index e45ff0915246..37e383ccf73f 100644
>> --- a/Documentation/gpu/index.rst
>> +++ b/Documentation/gpu/index.rst
>> @@ -18,6 +18,7 @@ GPU Driver Developer's Guide
>>      vga-switcheroo
>>      vgaarbiter
>>      automated_testing
>> +   implementation_guidelines
>>      todo
>>      rfc/index
>>   
>> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>> index 2516fe141db6..e095b23e3dfd 100644
>> --- a/Documentation/gpu/rfc/xe.rst
>> +++ b/Documentation/gpu/rfc/xe.rst
>> @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
>>   possible ways.
>>   
>>   As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
>> -various flavors, error handling and a sample API should be documented here or in
>> -a separate document pointed to by this document.
>> +various flavors, error handling and sample API suggestions are documented in
>> +:doc:`The ASYNC VM_BIND document </gpu/drm-vm-bind-async>`.
>>   
>>   Userptr integration and vm_bind
>>   -------------------------------
