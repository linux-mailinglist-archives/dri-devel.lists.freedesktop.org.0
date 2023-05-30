Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8FE71640E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 16:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1F710E168;
	Tue, 30 May 2023 14:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E1110E168;
 Tue, 30 May 2023 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685456840; x=1716992840;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IKLbFTmeE9Fz7RspQ8y54hd++IP/eKexNVBbQItFtLk=;
 b=nA1kG1j0DS2TXNvkbEn7LsUupXbyybupwWsY2iuGSdr6+FuVx4G23LwU
 1RZ1ny5O7blBzC+9Qv7FjIjnRYDGigtsclxOO9mB/mcq0ZThk90KeRQK7
 1RZ6UB9xPSd3XjvOPrfsOSya5PA3gFIEkdfCGyhY5TeT1X00eAqpzsaKH
 kORNX3bFo25cUy4Xv5AEt+AuSKVPk2I/c5kbsMq47maU5hPLm725gD1pV
 EbAmQUCa7jFxI9+tB10wuTHp6Wj+MXlr45yNjRCf8h2WBdd1g9AWz/km4
 61rqaz82kRFoFp78iq9OoYhELCJ6+Wc3jYXIKdV5WkzY0fThzLlAnoCUF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="358179918"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="358179918"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="880769045"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="880769045"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:27:17 -0700
Message-ID: <e14c8b98-601d-32af-0ca6-cf7f5e69d912@linux.intel.com>
Date: Tue, 30 May 2023 16:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] Documentation/gpu: Add a VM_BIND async draft document.
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230530084235.279863-1-thomas.hellstrom@linux.intel.com>
 <SA1PR11MB69919B7044A5F78AAFF6CCA7924B9@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <SA1PR11MB69919B7044A5F78AAFF6CCA7924B9@SA1PR11MB6991.namprd11.prod.outlook.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Oak,

On 5/30/23 16:06, Zeng, Oak wrote:
> Hi Thomas,
>
> Thanks for the document. See one question inline.
>
> Thanks,
> Oak
>
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Thomas Hellström
>> Sent: May 30, 2023 4:43 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; linux-kernel@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; Danilo Krummrich <dakr@redhat.com>
>> Subject: [RFC PATCH] Documentation/gpu: Add a VM_BIND async draft
>> document.
>>
>> Add a motivation for and description of asynchronous VM_BIND operation
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   Documentation/gpu/drm-vm-bind-async.rst | 138
>> ++++++++++++++++++++++++
>>   1 file changed, 138 insertions(+)
>>   create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
>>
>> diff --git a/Documentation/gpu/drm-vm-bind-async.rst
>> b/Documentation/gpu/drm-vm-bind-async.rst
>> new file mode 100644
>> index 000000000000..7f7f8f7ddfea
>> --- /dev/null
>> +++ b/Documentation/gpu/drm-vm-bind-async.rst
>> @@ -0,0 +1,138 @@
>> +====================
>> +Asynchronous VM_BIND
>> +====================
>> +
>> +Nomenclature:
>> +=============
>> +
>> +* VRAM: On-device memory. Sometimes referred to as device local memory.
>> +
>> +* vm: A GPU address space. Typically per process, but can be shared by
>> +  multiple processes.
>> +
>> +* VM_BIND: An operation or a list of operations to modify a vm using
>> +  an IOCTL. The operations include mapping and unmapping system- or
>> +  VRAM memory.
>> +
>> +* syncobj: A container that abstracts synchronization objects. The
>> +  synchronization objects can be either generic, like dma-fences or
>> +  driver specific. A syncobj typically indicates the type of the
>> +  underlying synchronization object.
>> +
>> +* in-syncobj: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
>> +  for these before starting.
>> +
>> +* out-syncbj: Argument to a VM_BIND_IOCTL, the VM_BIND operation
>> +  signals these when the bind operation is complete.
>> +
>> +* memory fence: A synchronization object, different from a dma-fence
>> +  that uses the value of a specified memory location to determine
>> +  signaled status.
> Are you saying memory fence (user fence) uses specific memory location to determine signaled status, while dma-fence doesn't use specific memory location to determine status?
>
> My understanding is, both user fence and dma fence use a memory to determine status...in the dma fence case, it is the seqno field of struct dma_fence. The difference b/t those two is, for dma-fence, people agreed it has to be signaled in certain amount of time; while user fence doesn't has such contract.

Yes, the section there wasn't intending to say anything about dma-fences 
other than that memory fences are different from dma-fences. I'll 
rephrase that to be a bit clearer.

Thanks,

Thomas



>
> -Oak
>
> A memory fence can be awaited and signaled by both
>> +  the GPU and CPU. Memory fences are sometimes referred to as
>> +  user-fences.
>> +
>> +* long-running workload: A workload that may take more than the
>> +  current stipulated dma-fence maximum signal delay to complete and
>> +  which therefore needs to set the VM or the GPU execution context in
>> +  a certain mode that disallows completion dma-fences.
>> +
>> +* UMD: User-mode driver.
>> +
>> +* KMD: Kernel-mode driver.
>> +
>> +
>> +Synchronous / Asynchronous VM_BIND operation
>> +============================================
>> +
>> +Synchronous VM_BIND
>> +___________________
>> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
>> +ioctl returns. A synchronous VM_BIND takes neither in-fences nor
>> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
>> +for example swapin or clearing, or even previous binds.
>> +
>> +Asynchronous VM_BIND
>> +____________________
>> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
>> +IOCTL may return immediately, the VM_BIND operations wait for the in-
>> syncobjs
>> +before modifying the GPU page-tables, and signal the out-syncobjs when
>> +the modification is done in the sense that the next execbuf that
>> +awaits for the out-syncobjs will see the change. Errors are reported
>> +synchronously assuming that the asynchronous part of the job never errors.
>> +In low-memory situations the implementation may block, performing the
>> +VM_BIND synchronously, because there might not be enough memory
>> +immediately available for preparing the asynchronous operation.
>> +
>> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
>> +the in-syncobjs needs to signal before the first operation starts to
>> +execute, and the out-syncobjs signal after the last operation
>> +completes. Operations in the operation list can be assumed, where it
>> +matters, to complete in order.
>> +
>> +To aid in supporting user-space queues, the VM_BIND may take a bind context
>> +AKA bind engine identifier argument. All VM_BIND operations using the same
>> +bind engine can then be assumed, where it matters, to complete in
>> +order. No such assumptions can be made between VM_BIND operations
>> +using separate bind contexts.
>> +
>> +The purpose of an Asynchronous VM_BIND operation is for user-mode
>> +drivers to be able to pipeline interleaved vm modifications and
>> +execbufs. For long-running workloads, such pipelining of a bind
>> +operation is not allowed and any in-fences need to be awaited
>> +synchronously.
>> +
>> +Also for VM_BINDS for long-running VMs the user-mode driver should typically
>> +select memory fences as out-fences since that gives greater flexibility for
>> +the kernel mode driver to inject other  operations into the bind /
>> +unbind operations. Like for example inserting breakpoints into batch
>> +buffers. The workload execution can then easily be pipelined behind
>> +the bind completion using the memory out-fence as the signal condition
>> +for a gpu semaphore embedded by UMD in the workload.
>> +
>> +Multi-operation VM_BIND IOCTL error handling and interrupts
>> +========================================
>> +
>> +The VM_BIND operations of the ioctl may error due to lack of resources
>> +to complete and also due to interrupted waits. In both situations UMD
>> +should preferrably restart the IOCTL after taking suitable action. If
>> +UMD has overcommited a memory resource, an -ENOSPC error will be
>> +returned, and UMD may then unbind resources that are not used at the
>> +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
>> +IOCTL and on -ENOMEM user-space may either attempt to free known
>> +system memory resources or abort the operation. If aborting as a
>> +result of a failed operation in a list of operations, some operations
>> +may still have completed, and to get back to a known state, user-space
>> +should therefore attempt to unbind all virtual memory regions touched
>> +by the failing IOCTL.
>> +Unbind operations are guaranteed not to cause any errors due to
>> +resource constraints.
>> +In between a failed VM_BIND ioctl and a successful restart there may
>> +be implementation defined restrictions on the use of the VM. For a
>> +description why, please see KMD implementation details under [error
>> +state saving]_.
>> +
>> +
>> +KMD implementation details
>> +==========================
>> +
>> +.. [error state saving] Open: When the VM_BIND ioctl returns an error, some
>> +			or even parts of an operation may have been
>> +			completed. If the ioctl is restarted, in order
>> +			to know where to restart, the KMD can
>> +			either put the VM in an error state and save
>> +			one instance of the needed restart state
>> +			internally. In this case, KMD needs to block
>> +			further modifications of the VM state that may
>> +			cause additional failures requiring a restart
>> +			state save, until the error has been fully resolved.
>> +			If the uAPI instead defines a pointer to a
>> +			UMD allocated cookie in the IOCTL struct, it
>> +			could also choose to store the restart state
>> +			in that cookie.
>> +
>> +			The restart state may, for example, be the
>> +			number of successfully completed operations.
>> +
>> +			Easiest for UMD would of course be if KMD did
>> +			a full unwind on error so that no error state
>> +			needs to be saved.
>> --
>> 2.39.2
