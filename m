Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E107D793730
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 10:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509BD10E594;
	Wed,  6 Sep 2023 08:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E502310E594;
 Wed,  6 Sep 2023 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693989151; x=1725525151;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=gXjlvyuDqL4/Cbvmfo1aMjgk37AZjhA1n6do7pnoMqg=;
 b=FIG5Sh/Sxej1gnAJzhBq3XkMRBpykdEuSf6+fjozR6PKa92VWWkqE6LS
 8hb/kfdZ9jBp7mruNAsIHcyavqoDkFkqq9hn5SdI+vATGGN4+p4sDrOfw
 xf9zd2So3i4krGrAgklLNJ4c8XeOERvqVadItm4MevgbBgx3F2Js0oq2N
 ggcdQZ4sXUKic7eg4ScojEGy8uRWKr0JehDKS1CcggLUhrASHti/GxlHt
 EcUXQH7a6xeNXofHEGnsX5DvRpZl/97VqjdMvhzWXu4yD/oYcRqh2a5Pl
 /lpaf86AbETS3HywWHDp6Zm/RbQuoyZYk+dl0JPaIliIPRS3NwyUbaj6N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="362034470"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
 d="scan'208,217";a="362034470"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 01:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="831570296"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
 d="scan'208,217";a="831570296"
Received: from igorhaza-mobl1.ger.corp.intel.com (HELO [10.249.254.161])
 ([10.249.254.161])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 01:32:26 -0700
Content-Type: multipart/alternative;
 boundary="------------9R07ggAo0c1QCd0dXNiKQfZo"
Message-ID: <1a2965a4-943f-0ba7-b082-155d75b94d59@linux.intel.com>
Date: Wed, 6 Sep 2023 10:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
 <ZPeGld0mBwbWptV9@cassiopeiae>
 <4e7a2b2e-1ab5-09b6-b2de-9b2a82a8a32e@linux.intel.com>
 <1c6cbf97-7e85-a48f-9e6a-ed716ab5b05d@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <1c6cbf97-7e85-a48f-9e6a-ed716ab5b05d@redhat.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------9R07ggAo0c1QCd0dXNiKQfZo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/6/23 10:00, Danilo Krummrich wrote:
> On 9/6/23 09:06, Thomas Hellström wrote:
>> Hi, Danilo,
>>
>> Thanks for taking a look. Comments inline.
>>
>> On 9/5/23 21:50, Danilo Krummrich wrote:
>>> On Wed, Aug 16, 2023 at 11:15:47AM +0200, Thomas Hellström wrote:
>>>> Add the first version of the VM_BIND locking document which is
>>>> intended to be part of the xe driver upstreaming agreement.
>>>>
>>>> The document describes and discuss the locking used during exec-
>>>> functions, evicton and for userptr gpu-vmas. Intention is to be 
>>>> using the
>>>> same nomenclature as the drm-vm-bind-async.rst.
>>>>
>>>> v2:
>>>>
>>>>
>>>> - s/gvm/gpu_vm/g (Rodrigo Vivi)
>>>> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>>>>    (Rodrigo Vivi)
>>>> - Adjust commit message accordingly.
>>>> - Add SPDX license header.
>>>>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>   Documentation/gpu/drm-vm-bind-locking.rst | 351 
>>>> ++++++++++++++++++++++
>>>>   1 file changed, 351 insertions(+)
>>>>   create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
>>>>
>>>> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst 
>>>> b/Documentation/gpu/drm-vm-bind-locking.rst
>>>> new file mode 100644
>>>> index 000000000000..b813961a9ec2
>>>> --- /dev/null
>>>> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
>>>> @@ -0,0 +1,351 @@
>>>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +
>>>> +===============
>>>> +VM_BIND locking
>>>> +===============
>>>> +
>>>> +This document attempts to describe what's needed to get VM_BIND 
>>>> locking right,
>>>> +including the userptr mmu_notifier locking and it will also 
>>>> discuss some
>>>> +optimizations to get rid of the looping through of all userptr 
>>>> mappings and
>>>> +external / shared object mappings that is needed in the simplest
>>>> +implementation. It will also discuss some implications for 
>>>> faulting gpu_vms.
>>>> +
>>>> +Nomenclature
>>>> +============
>>>> +
>>>> +* ``Context``: GPU execution context.
>>>> +* ``gpu_vm``: Abstraction of a virtual GPU address space with
>>>>
>>>>
>>>> +  meta-data. Typically one per client (DRM file-private), or one per
>>>> +  context.
>>>> +* ``gpu_vma``: Abstraction of a GPU address range within a gpu_vm 
>>>> with
>>> The same nomenclature was used within the VM_BIND async document as 
>>> well. I
>>> wonder if it would make sense to align the naming with the GPUVA 
>>> manager, such
>>> that ('drm_gpuva_manager' -> 'drm_gpuvm'). This would also result 
>>> into better
>>> function names, such as drm_gpuvm_resv_lock() or 
>>> drm_gpuvm_prepare_objects() and
>>> potentially way better naming for the VM_BO abstraction 'drm_gpuvm_bo'.
>>>
>>> However, I'd like to keep 'drm_gpuva' rather than 'drm_gpu_vma', but 
>>> I think
>>> this is close enough anyway.
>>
>> I don't have a strong opinion about the naming here and aligning with 
>> the GPUVA manager make sense, although perhaps the "drm_" prefix 
>> which makes sense for the function- and struct names may not make 
>> sense in a more generic document like this. What about gpuva and gpuvm?
>
> Oh, I think the document is fine as it is. This was more like me 
> thinking loud
> about renaming things in the GPUVA manager accordingly.
>
>>
>>
>>>
>>>> +  associated meta-data. The backing storage of a gpu_vma can 
>>>> either be
>>>> +  a gem buffer object or anonymous pages mapped also into the CPU
>>>> +  address space for the process.
>>>> +* ``userptr gpu_vma or just userptr``: A gpu_vma, the backing 
>>>> store of
>>>> +  which is anonymous pages as described above.
>>>> +* ``revalidating``: Revalidating a gpu_vma means making the latest 
>>>> version
>>>> +  of the backing store resident and making sure the gpu_vma's
>>>> +  page-table entries point to that backing store.
>>>> +* ``dma_fence``: A struct dma_fence that is similar to a struct 
>>>> completion
>>>> +  and which tracks GPU activity. When the GPU activity is finished,
>>>> +  the dma_fence signals.
>>>> +* ``dma_resv``: A struct dma_resv (AKA reservation object) that is 
>>>> used
>>>> +  to track GPU activity in the form of multiple dma_fences on a
>>>> +  gpu_vm or a gem buffer object. The dma_resv contains an array / 
>>>> list
>>>> +  of dma_fences and a lock that needs to be held when adding
>>>>
>>>>
>>>> +  additional dma_fences to the dma_resv. The lock is of a type that
>>>> +  allows deadlock-safe locking of multiple dma_resvs in arbitrary 
>>>> order.
>>>> +* ``exec function``: An exec function is a function that 
>>>> revalidates all
>>>> +  affected gpu_vmas, submits a GPU command batch and registers the
>>>> +  dma_fence representing the GPU command's activity with all affected
>>>> +  dma_resvs. For completeness, although not covered by this document,
>>>> +  it's worth mentioning that an exec function may also be the
>>>> +  revalidation worker that is used by some drivers in compute /
>>>> +  long-running mode.
>>>> +* ``local object``: A GEM object which is local to a gpu_vm. 
>>>> Shared gem
>>>> +  objects also share the gpu_vm's dma_resv.
>>>> +* ``shared object``: AKA external object: A GEM object which may 
>>>> be shared
>>>> +  by multiple gpu_vms and whose backing storage may be shared with
>>>> +  other drivers.
>>>> +
>>>> +
>>>> +Introducing the locks
>>>> +=====================
>>>> +
>>>> +One of the benefits of VM_BIND is that local GEM objects share the 
>>>> gpu_vm's
>>>> +dma_resv object and hence the dma_resv lock. So even with a huge
>>>> +number of local GEM objects, only one lock is needed to make the exec
>>>> +sequence atomic.
>>>> +
>>>> +The following locks and locking orders are used:
>>>> +
>>>> +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the 
>>>> gpu_vm is
>>>> +  partitioned into gpu_vmas, protects the gpu_vm's list of 
>>>> external objects,
>>>> +  and can also with some simplification protect the gpu_vm's list of
>>>> +  userptr gpu_vmas. With the CPU mm analogy this would correspond 
>>>> to the
>>>> +  mmap_lock.
>>>> +* The ``userptr_seqlock``. This lock is taken in read mode for each
>>>> +  userptr gpu_vma on the gpu_vm's userptr list, and in write mode 
>>>> during mmu
>>>> +  notifier invalidation. This is not a real seqlock but described in
>>>> +  ``mm/mmu_notifier.c` as a "Collision-retry read-side/write-side
>>>> +  'lock' a lot like a seqcount, however this allows multiple
>>>> +  write-sides to hold it at once...". The read side critical section
>>>> +  is enclosed by ``mmu_interval_read_begin() /
>>>> +  mmu_interval_read_retry()`` with ``mmu_interval_read_begin()``
>>>> +  sleeping uninterruptibly if the write side is held.
>>>> +  The write side is held by the core mm while calling mmu interval
>>>> +  invalidation notifiers.
>>>> +* The ``gpu_vm->resv`` lock. Protects the gpu_vm's list of 
>>>> gpu_vmas needing
>>>> +  rebinding, and also the residency of all the gpu_vm's local GEM 
>>>> object.
>>>> +* The ``gpu_vm->userptr_notifier_lock``. This is an rwsem that is 
>>>> taken in read
>>>> +  mode during exec and write mode during a mmu notifier 
>>>> invalidation. In
>>>> +  the absence of a separate page-table lock, this lock can serve
>>>> +  together with the gpu_vm's dma_resv lock as a page-table lock. 
>>>> More on
>>>> +  this below. The userptr notifier lock is per gpu_vm.
>>>> +* The ``gpu_vm->page_table_lock``. Protects the gpu_vm's 
>>>> page-table updates. For
>>>> +  simplicity the gpu_vm's dma_resv lock can be reused as 
>>>> page-table lock.
>>>> +
>>>> +There are certain optimizations described below that require
>>>> +additional locks. More on that later.
>>>> +
>>>> +.. code-block:: C
>>>> +
>>>> +   dma_resv_lock(&gpu_vm->resv);
>>>> +
>>>> +   for_each_gpu_vma_on_revalidate_list(gpu_vm, &gpu_vma) {
>>>> +        revalidate_gpu_vma(&gpu_vma);
>>>> +        remove_from_revalidate_list(&gpu_vma);
>>>> +   }
>>>> +
>>>> +   add_dependencies(&gpu_job, &gpu_vm->resv);
>>>> +   job_dma_fence = gpu_submit(&gpu_job));
>>>> +
>>>> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
>>>> +   dma_resv_unlock(&gpu_vm->resv);
>>>> +
>>>> +Eviction of one of these local objects will then be something like 
>>>> the
>>>> +following:
>>>> +
>>>> +.. code-block:: C
>>>> +
>>>> +   obj = get_object_from_lru();
>>>> +
>>>> +   dma_resv_lock(obj->resv);
>>>> +   for_each_gpu_vma_of_obj(obj, &gpu_vma);
>>>> +        put_gpu_vma_on_revalidate_list(&gpu_vma);
>>>> +
>>>> +   add_dependencies(&eviction_job, &obj->resv);
>>>> +   job_dma_fence = gpu_submit(&eviction_job);
>>>> +   add_dma_fence(&obj->resv, job_dma_fence);
>>>> +
>>>> +   dma_resv_unlock(&obj->resv);
>>>> +   put_object(obj);
>>>> +
>>>> +Note that since the object is local to the gpu_vm, it will share 
>>>> the gpu_vm's
>>>> +``dma_resv`` lock so that ``obj->resv == gpu_vm->resv``. 
>>>> Invalidated gpu_vmas are put
>>>> +on the gpu_vm's revalidation list, which is protected by 
>>>> ``gpu_vm->resv``, which
>>>> +is always locked while evicting, due to the above equality.
>>>> +
>>>> +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before 
>>>> eviction,
>>>> +Since the eviction blit or copy will wait for GPU idle, any 
>>>> attempt by
>>>> +the GPU to access freed memory through the gpu_vma will be 
>>>> preceded by
>>>> +a new exec function, which will make sure the gpu_vma is
>>>> +revalidated. The eviction code holding the object's dma_resv while
>>>> +revalidating will ensure a new exec function may not race with the 
>>>> eviction.
>>>> +
>>>> +Introducing external (or shared) buffer objects
>>>> +===============================================
>>>> +
>>>> +Since shared buffer objects may be shared by multiple gpu_vm's they
>>>> +can't share their reservation object with a single gpu_vm, but 
>>>> will rather
>>>> +have a reservation object of their own. The shared objects bound to a
>>>> +gpu_vm using one or many
>>>> +gpu_vmas are therefore typically put on a per-gpu_vm list which is
>>>> +protected by the gpu_vm lock. One could in theory protect it also 
>>>> with
>>>> +the ``gpu_vm->resv``, but since the list of dma_resvs to take is 
>>>> typically
>>>> +built before the ``gpu_vm->resv`` is locked due to a limitation in
>>>> +the current locking helpers, that is typically not done. Also see
>>>> +below for userptr gpu_vmas.
>>>> +
>>>> +At eviction time we now need to invalidate *all* gpu_vmas of a shared
>>>> +object, but we can no longer be certain that we hold the gpu_vm's
>>>> +dma_resv of all the object's gpu_vmas. We can only be certain that we
>>> I need to think a bit more about locking of extobj and evicted 
>>> object tracking
>>> in the case of processing 'drm_gpuva_ops' directly through callbacks 
>>> within the
>>> fence signalling critical path as mentioend in [1].
>>>
>>> In order to support that, we'd need to protect extobjs with a 
>>> separate lock,
>>> and while iterating extobjs to acquire the dma-resv lock drop the 
>>> lock within
>>> the loop before we actually acquire the dma-resv lock. Maple tree 
>>> supports that
>>> already and this can be fully done within the GPUVA manager; no need 
>>> for the
>>> driver to care about that.
>>
>> So do I understand correctly that this because you want to update the 
>> gpuvm state while operations are progressing asynchronously?
>>
>> If so, I wonder whether that could really be done? For example to 
>> allocate enough memory for page-tables etc, you need to know the 
>> details of the operations at IOCTL execution time, and to know the 
>> details you need to know the state from the previous operation?
>
>
> Right, sync and async bind can't run fully concurrently, but you could 
> "inject" a
> sync one between two async ones such that the sync ones executed from 
> the IOCTL
> directly while async execution is stalled meanwhile. This would be 
> possible because
> the actual drm_gpuva_ops would be calculated within the async 
> execution path rather
> than in the IOCTL. But yes, page-table management must be desinged to 
> support that.

OK, well one of the main motivations for Xe is to be able to pipeline 
interleaving binds and execs if needed, like so:

- Bind vmas for scene 1.
- Submit scene 1.
- Unbind vmas for scene 1.
- Bind vmas for scene 2.
- Submit scene 2.
- Unbind vmas for scene 2.

And being able to *submit* all of the above while the async binding of 
vmas for scene (step 1) has not yet completed.
I can't really see how this could be done, while obeying dma-fence 
rules, unless state is updated synchronously while submitting?

So unless I'm misunderstanding what you are trying to do, I don't see Xe 
wanting to side-step the current approach, but OTOH protecting part of 
the state with additional locks probably won't be a problem as long as 
that is optional.

>
>>
>>>
>>> While, as already mentioned, I'd really love to support that, I 
>>> noticed that we
>>> have a similar issue with tracking evicted objects. There are 
>>> (similar) ways to
>>> deal with that, however, it drastically increases complexity.
>>>
>>> Hence, I'd like to reconsider whether it's worth supporting it in 
>>> the first
>>> place. Most of the arguments in order to support it are for decreasing
>>> complexity. However, if it increases complexity elsewhere, it's 
>>> probably not
>>> worth. The only argument left would be for synchronous bind jobs 
>>> which could
>>> be injected at any point of time without the need to be queued up in 
>>> the
>>> scheduler to preserve ordering. However, I'm not yet sure how 
>>> important this
>>> would be. For Xe it doesn't really seem to be a concern I guess?
>> Xe supports that functionality via separate bind queues. If you queue 
>> most of the operations using one queue, you can inject synchronous 
>> bind jobs using another. Ideally they execute separately, but they 
>> are not guaranteed to do that.
>
> Ok, but the separate bind queue would still work in the same 
> asynchronous way, as
> in the job is submitted to some kind of worker and the IOCTL just 
> blocks until
> completion, right?

The job is only submitted to a worker if there are unsatisfied 
dependencies, like that bind queue is busy with something else, or a GPU 
job is wiping the BO content for security reasons, or an in-fence, or 
somebody else having queued a job to the same page-table range *). 
Otherwise the page-table is updated immediately using CPU writes.

But yes, the IOCTL blocks until completion if the job is synchronous.

/Thomas


>
>
>
>>>
>>> [1] 
>>> https://lore.kernel.org/dri-devel/202308221050.kTj8uFMA-lkp@intel.com/T/#m7f3b5a7ff70723332adeea32671578cb95c62f7c
>>>
>>>> +hold the object's private dma_resv. We can trylock the dma_resvs for
>>>> +the affected gpu_vm's but that might be unnecessarily complex. If we
>>>> +have a ww_acquire context at hand at eviction time we can also 
>>>> perform
>>>> +sleeping locks of those dma_resvs but that could cause expensive
>>>> +rollbacks. One option is to just mark the invalidated gpu_vmas 
>>>> with a bool
>>>> +which is inspected on the next exec function, when the gpu_vm's
>>>> +dma_resv and the object's dma_resv is held, and the invalidated
>>>> +gpu_vmas could then be put on the gpu_vm's list of invalidated
>>>> +gpu_vmas. That bool would then, although being per-gpu_vma 
>>>> formally be
>>>> +protected by the object's dma_resv.
>>>> +
>>>> +The exec function would then look something like the following:
>>>> +
>>>> +.. code-block:: C
>>>> +
>>>> +   read_lock(&gpu_vm->lock);
>>>> +
>>>> +   dma_resv_lock(&gpu_vm->resv);
>>>> +
>>>> +   // Shared object list is protected by the gpu_vm->lock.
>>>> +   for_each_shared_obj(gpu_vm, &obj) {
>>>> +        dma_resv_lock(&obj->resv);
>>>> + move_marked_gpu_vmas_to_revalidate_gpu_vma_list(obj, &gpu_vm);
>>>> +   }
>>>> +
>>>> +   for_each_gpu_vma_to_revalidate(gpu_vm, &gpu_vma) {
>>>> +        revalidate_gpu_vma(&gpu_vma);
>>>> +        remove_from_revalidate_list(&gpu_vma);
>>>> +   }
>>>> +
>>>> +   add_dependencies(&gpu_job, &gpu_vm->resv);
>>>> +   job_dma_fence = gpu_submit(&gpu_job));
>>>> +
>>>> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
>>>> +   for_each_shared_obj(gpu_vm, &obj)
>>>> +          add_dma_fence(job_dma_fence, &obj->resv);
>>>> +   dma_resv_unlock_all_resv_locks();
>>>> +
>>>> +   read_unlock(&gpu_vm->lock);
>>>> +
>>>> +And the corresponding shared-object aware eviction would look like:
>>>> +
>>>> +.. code-block:: C
>>>> +
>>>> +   obj = get_object_from_lru();
>>>> +
>>>> +   dma_resv_lock(obj->resv);
>>>> +   for_each_gpu_vma_of_obj(obj, &gpu_vma);
>>>> +        if (object_is_vm_local(obj))
>>>> + put_gpu_vma_on_revalidate_list(&gpu_vma, &gpu_vm);
>>>> +        else
>>>> + mark_gpu_vma_for_revalidation(&gpu_vma);
>>>> +
>>>> +   add_dependencies(&eviction_job, &obj->resv);
>>>> +   job_dma_fence = gpu_submit(&eviction_job);
>>>> +   add_dma_fence(&obj->resv, job_dma_fence);
>>>> +
>>>> +   dma_resv_unlock(&obj->resv);
>>>> +   put_object(obj);
>>>> +
>>>> +Yet another option is to put the gpu_vmas to be invalidated on a 
>>>> separate
>>>> +gpu_vm list protected by a lower level lock that can be taken both 
>>>> at eviction
>>>> +time and at transfer-to-revalidate list time. The details are not in
>>>> +this document, but this for reference implemented in the Intel xe
>>>> +driver.
>>>> +
>>>> +Introducing userptr gpu_vmas
>>>> +============================
>>>> +
>>>> +A userptr gpu_vma is a gpu_vma that, instead of mapping a buffer 
>>>> object to a
>>>> +GPU virtual address range, directly maps a CPU mm range of anonymous-
>>>> +or file page-cache pages.
>>>> +A very simple approach would be to just pin the pages using
>>>> +pin_user_pages() at bind time and unpin them at unbind time, but this
>>>> +creates a Denial-Of-Service vector since a single user-space process
>>>> +would be able to pin down all of system memory, which is not
>>>> +desirable. (For special use-cases and with proper accounting 
>>>> pinning might
>>>> +still be a desirable feature, though). What we need to do in the 
>>>> general case is
>>>> +to obtain a reference to the desired pages, make sure we are notified
>>>> +using a MMU notifier just before the CPU mm unmaps the pages, dirty
>>>> +them if they are not mapped read-only to the GPU, and then drop 
>>>> the reference.
>>>> +When we are notified by the MMU notifier that CPU mm is about to 
>>>> drop the
>>>> +pages, we need to stop GPU access to the pages,
>>>> +GPU page-table and make sure that before the next time the GPU 
>>>> tries to access
>>>> +whatever is now present in the CPU mm range, we unmap the old pages
>>>> +from the GPU page tables and repeat the process of obtaining new page
>>>> +references. Note that when the core mm decides to laundry pages, 
>>>> we get such
>>>> +an unmap MMU notification and can mark the pages dirty again 
>>>> before the
>>>> +next GPU access. We also get similar MMU notifications for NUMA 
>>>> accounting
>>>> +which the GPU driver doesn't really need to care about, but so far
>>>> +it's proven difficult to exclude certain notifications.
>>>> +
>>>> +Using a MMU notifier for device DMA (and other methods) is 
>>>> described in
>>>> +`this document
>>>> +<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_. 
>>>>
>>>> +
>>>> +Now the method of obtaining struct page references using
>>>> +get_user_pages() unfortunately can't be used under a dma_resv lock
>>>> +since that would violate the locking order of the dma_resv lock vs 
>>>> the
>>>> +mmap_lock that is grabbed when resolving a CPU pagefault. This 
>>>> means the gpu_vm's
>>>> +list of userptr gpu_vmas needs to be protected by an outer lock, 
>>>> and this
>>>> +is the first time we strictly need the gpu_vm->lock. While it was
>>>> +previously used also to protect the list of the gpu_vm's shared 
>>>> objects,
>>>> +we could in theory have used the gpu_vm->resv for that.
>>>> +
>>>> +The MMU interval seqlock for a userptr gpu_vma is used in the 
>>>> following
>>>> +way:
>>>> +
>>>> +.. code-block:: C
>>>> +
>>>> +   down_read(&gpu_vm->lock);
>>>> +
>>>> +   retry:
>>>> +
>>>> +   // Note: mmu_interval_read_begin() blocks until there is no
>>>> +   // invalidation notifier running anymore.
>>>> +   seq = mmu_interval_read_begin(&gpu_vma->userptr_interval);
>>>> +   if (seq != gpu_vma->saved_seq) {
>>>> +           obtain_new_page_pointers(&gpu_vma);
>>>> +       dma_resv_lock(&gpu_vm->resv);
>>>> +       put_gpu_vma_on_revalidate_list(&gpu_vma, &gpu_vm);
>>>> +       dma_resv_unlock(&gpu_vm->resv);
>>>> +       gpu_vma->saved_seq = seq;
>>>> +   }
>>>> +
>>>> +   // The usual revalidation goes here.
>>>> +
>>>> +   // Final userptr sequence validation may not happen before the
>>>> +   // submission dma_fence is added to the gpu_vm's resv, from the 
>>>> POW
>>>> +   // of the MMU invalidation notifier. Hence the
>>>> +   // userptr_notifier_lock that will make them appear atomic.
>>>> +
>>>> +   add_dependencies(&gpu_job, &gpu_vm->resv);
>>>> +   down_read(&gpu_vm->userptr_notifier_lock);
>>>> +   if (mmu_interval_read_retry(&gpu_vma->userptr_interval, 
>>>> gpu_vma->saved_seq)) {
>>>> +          up_read(&gpu_vm->userptr_notifier_lock);
>>>> +      goto retry;
>>>> +   }
>>>> +
>>>> +   job_dma_fence = gpu_submit(&gpu_job));
>>>> +
>>>> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
>>>> +
>>>> +   for_each_shared_obj(gpu_vm, &obj)
>>>> +          add_dma_fence(job_dma_fence, &obj->resv);
>>>> +
>>>> +   dma_resv_unlock_all_resv_locks();
>>>> +   up_read(&gpu_vm->userptr_notifier_lock);
>>>> +   up_read(&gpu_vm->lock);
>>>> +
>>>> +The code between ``mmu_interval_read_begin()`` and the
>>>> +``mmu_interval_read_retry()`` marks the read side critical section of
>>>> +what we call the ``userptr_seqlock``. In reality the gpu_vm's userptr
>>>> +gpu_vma list is looped through, and the check is done for *all* of 
>>>> its
>>>> +userptr gpu_vmas, although we only show a single one here.
>>>> +
>>>> +The userptr gpu_vma MMU invalidation notifier might be called fr
>>>>
>>>>
>>>> om
>>>> +reclaim context and, again to avoid locking order violations, we 
>>>> can't
>>>> +take any dma_resv lock nor the gpu_vm->lock from within it.
>>>> +
>>>> +.. code-block:: C
>>>> +
>>>> +  bool gpu_vma_userptr_invalidate(userptr_interval, cur_seq)
>>>> +  {
>>>> +          // Make sure the exec function either sees the new sequence
>>>> +      // and backs off or we wait for the dma-fence:
>>>> +
>>>> + down_write(&gpu_vm->userptr_notifier_lock);
>>>> +      mmu_interval_set_seq(userptr_interval, cur_seq);
>>>> +      up_write(&gpu_vm->userptr_notifier_lock);
>>>> +
>>>> +      dma_resv_wait_timeout(&gpu_vm->resv, DMA_RESV_USAGE_BOOKKEEP,
>>>> +                        false, MAX_SCHEDULE_TIMEOUT);
>>>> +      return true;
>>>> +  }
>>>> +
>>>> +When this invalidation notifier returns, the GPU can no longer be
>>>> +accessing the old pages of the userptr gpu_vma and needs to redo 
>>>> the page-binding
>>>> +before a new GPU submission can succeed.
>>>> +
>>>> +Optimizing gpu_vma iteration
>>>> +----------------------------
>>>> +
>>>> +Iterating through all of a gpu_vm's userptr gpu_vmas to check the 
>>>> validity
>>>> +on each exec function may be very costly. There is a scheme to avoid
>>>> +this and only iterate through the userptr gpu_vmas that actually 
>>>> saw an
>>>> +invalidation notifier call since the last exec. T
>>>> +
>>>> +TODO: describe that scheme here. It's implemented in the xe driver.
>>>> +
>>>> +Locking for page-table updates at bind- and unbind time
>>>> +=======================================================
>>>> +
>>>> +TODO.
>>>> +
>>>> +Recoverable page-fault implications
>>>> +===================================
>>>> +
>>>> +TODO.
>>>> -- 
>>>> 2.41.0
>>>>
>>
>
--------------9R07ggAo0c1QCd0dXNiKQfZo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/6/23 10:00, Danilo Krummrich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1c6cbf97-7e85-a48f-9e6a-ed716ab5b05d@redhat.com">On
      9/6/23 09:06, Thomas Hellström wrote:
      <br>
      <blockquote type="cite">Hi, Danilo,
        <br>
        <br>
        Thanks for taking a look. Comments inline.
        <br>
        <br>
        On 9/5/23 21:50, Danilo Krummrich wrote:
        <br>
        <blockquote type="cite">On Wed, Aug 16, 2023 at 11:15:47AM
          +0200, Thomas Hellström wrote:
          <br>
          <blockquote type="cite">Add the first version of the VM_BIND
            locking document which is
            <br>
            intended to be part of the xe driver upstreaming agreement.
            <br>
            <br>
            The document describes and discuss the locking used during
            exec-
            <br>
            functions, evicton and for userptr gpu-vmas. Intention is to
            be using the
            <br>
            same nomenclature as the drm-vm-bind-async.rst.
            <br>
            <br>
            v2:
            <br>
            <h1> </h1>
            - s/gvm/gpu_vm/g (Rodrigo Vivi)
            <br>
            - Clarify the userptr seqlock with a pointer to
            mm/mmu_notifier.c
            <br>
               (Rodrigo Vivi)
            <br>
            - Adjust commit message accordingly.
            <br>
            - Add SPDX license header.
            <br>
            <br>
            Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
            <br>
            Signed-off-by: Thomas Hellström
            <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
            <br>
            ---
            <br>
              Documentation/gpu/drm-vm-bind-locking.rst | 351
            ++++++++++++++++++++++
            <br>
              1 file changed, 351 insertions(+)
            <br>
              create mode 100644
            Documentation/gpu/drm-vm-bind-locking.rst
            <br>
            <br>
            diff --git a/Documentation/gpu/drm-vm-bind-locking.rst
            b/Documentation/gpu/drm-vm-bind-locking.rst
            <br>
            new file mode 100644
            <br>
            index 000000000000..b813961a9ec2
            <br>
            --- /dev/null
            <br>
            +++ b/Documentation/gpu/drm-vm-bind-locking.rst
            <br>
            @@ -0,0 +1,351 @@
            <br>
            +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
            <br>
            +
            <br>
            +===============
            <br>
            +VM_BIND locking
            <br>
            +===============
            <br>
            +
            <br>
            +This document attempts to describe what's needed to get
            VM_BIND locking right,
            <br>
            +including the userptr mmu_notifier locking and it will also
            discuss some
            <br>
            +optimizations to get rid of the looping through of all
            userptr mappings and
            <br>
            +external / shared object mappings that is needed in the
            simplest
            <br>
            +implementation. It will also discuss some implications for
            faulting gpu_vms.
            <br>
            +
            <br>
            +Nomenclature
            <br>
            +============
            <br>
            +
            <br>
            +* ``Context``: GPU execution context.
            <br>
            +* ``gpu_vm``: Abstraction of a virtual GPU address space
            with
            <br>
            <h1> </h1>
            +  meta-data. Typically one per client (DRM file-private),
            or one per
            <br>
            +  context.
            <br>
            +* ``gpu_vma``: Abstraction of a GPU address range within a
            gpu_vm with
            <br>
          </blockquote>
          The same nomenclature was used within the VM_BIND async
          document as well. I
          <br>
          wonder if it would make sense to align the naming with the
          GPUVA manager, such
          <br>
          that ('drm_gpuva_manager' -&gt; 'drm_gpuvm'). This would also
          result into better
          <br>
          function names, such as drm_gpuvm_resv_lock() or
          drm_gpuvm_prepare_objects() and
          <br>
          potentially way better naming for the VM_BO abstraction
          'drm_gpuvm_bo'.
          <br>
          <br>
          However, I'd like to keep 'drm_gpuva' rather than
          'drm_gpu_vma', but I think
          <br>
          this is close enough anyway.
          <br>
        </blockquote>
        <br>
        I don't have a strong opinion about the naming here and aligning
        with the GPUVA manager make sense, although perhaps the "drm_"
        prefix which makes sense for the function- and struct names may
        not make sense in a more generic document like this. What about
        gpuva and gpuvm?
        <br>
      </blockquote>
      <br>
      Oh, I think the document is fine as it is. This was more like me
      thinking loud
      <br>
      about renaming things in the GPUVA manager accordingly.
      <br>
      <br>
      <blockquote type="cite">
        <br>
        <br>
        <blockquote type="cite">
          <br>
          <blockquote type="cite">+  associated meta-data. The backing
            storage of a gpu_vma can either be
            <br>
            +  a gem buffer object or anonymous pages mapped also into
            the CPU
            <br>
            +  address space for the process.
            <br>
            +* ``userptr gpu_vma or just userptr``: A gpu_vma, the
            backing store of
            <br>
            +  which is anonymous pages as described above.
            <br>
            +* ``revalidating``: Revalidating a gpu_vma means making the
            latest version
            <br>
            +  of the backing store resident and making sure the
            gpu_vma's
            <br>
            +  page-table entries point to that backing store.
            <br>
            +* ``dma_fence``: A struct dma_fence that is similar to a
            struct completion
            <br>
            +  and which tracks GPU activity. When the GPU activity is
            finished,
            <br>
            +  the dma_fence signals.
            <br>
            +* ``dma_resv``: A struct dma_resv (AKA reservation object)
            that is used
            <br>
            +  to track GPU activity in the form of multiple dma_fences
            on a
            <br>
            +  gpu_vm or a gem buffer object. The dma_resv contains an
            array / list
            <br>
            +  of dma_fences and a lock that needs to be held when
            adding
            <br>
            <h1> </h1>
            +  additional dma_fences to the dma_resv. The lock is of a
            type that
            <br>
            +  allows deadlock-safe locking of multiple dma_resvs in
            arbitrary order.
            <br>
            +* ``exec function``: An exec function is a function that
            revalidates all
            <br>
            +  affected gpu_vmas, submits a GPU command batch and
            registers the
            <br>
            +  dma_fence representing the GPU command's activity with
            all affected
            <br>
            +  dma_resvs. For completeness, although not covered by this
            document,
            <br>
            +  it's worth mentioning that an exec function may also be
            the
            <br>
            +  revalidation worker that is used by some drivers in
            compute /
            <br>
            +  long-running mode.
            <br>
            +* ``local object``: A GEM object which is local to a
            gpu_vm. Shared gem
            <br>
            +  objects also share the gpu_vm's dma_resv.
            <br>
            +* ``shared object``: AKA external object: A GEM object
            which may be shared
            <br>
            +  by multiple gpu_vms and whose backing storage may be
            shared with
            <br>
            +  other drivers.
            <br>
            +
            <br>
            +
            <br>
            +Introducing the locks
            <br>
            +=====================
            <br>
            +
            <br>
            +One of the benefits of VM_BIND is that local GEM objects
            share the gpu_vm's
            <br>
            +dma_resv object and hence the dma_resv lock. So even with a
            huge
            <br>
            +number of local GEM objects, only one lock is needed to
            make the exec
            <br>
            +sequence atomic.
            <br>
            +
            <br>
            +The following locks and locking orders are used:
            <br>
            +
            <br>
            +* The ``gpu_vm-&gt;lock`` (optionally an rwsem). Protects
            how the gpu_vm is
            <br>
            +  partitioned into gpu_vmas, protects the gpu_vm's list of
            external objects,
            <br>
            +  and can also with some simplification protect the
            gpu_vm's list of
            <br>
            +  userptr gpu_vmas. With the CPU mm analogy this would
            correspond to the
            <br>
            +  mmap_lock.
            <br>
            +* The ``userptr_seqlock``. This lock is taken in read mode
            for each
            <br>
            +  userptr gpu_vma on the gpu_vm's userptr list, and in
            write mode during mmu
            <br>
            +  notifier invalidation. This is not a real seqlock but
            described in
            <br>
            +  ``mm/mmu_notifier.c` as a "Collision-retry
            read-side/write-side
            <br>
            +  'lock' a lot like a seqcount, however this allows
            multiple
            <br>
            +  write-sides to hold it at once...". The read side
            critical section
            <br>
            +  is enclosed by ``mmu_interval_read_begin() /
            <br>
            +  mmu_interval_read_retry()`` with
            ``mmu_interval_read_begin()``
            <br>
            +  sleeping uninterruptibly if the write side is held.
            <br>
            +  The write side is held by the core mm while calling mmu
            interval
            <br>
            +  invalidation notifiers.
            <br>
            +* The ``gpu_vm-&gt;resv`` lock. Protects the gpu_vm's list
            of gpu_vmas needing
            <br>
            +  rebinding, and also the residency of all the gpu_vm's
            local GEM object.
            <br>
            +* The ``gpu_vm-&gt;userptr_notifier_lock``. This is an
            rwsem that is taken in read
            <br>
            +  mode during exec and write mode during a mmu notifier
            invalidation. In
            <br>
            +  the absence of a separate page-table lock, this lock can
            serve
            <br>
            +  together with the gpu_vm's dma_resv lock as a page-table
            lock. More on
            <br>
            +  this below. The userptr notifier lock is per gpu_vm.
            <br>
            +* The ``gpu_vm-&gt;page_table_lock``. Protects the gpu_vm's
            page-table updates. For
            <br>
            +  simplicity the gpu_vm's dma_resv lock can be reused as
            page-table lock.
            <br>
            +
            <br>
            +There are certain optimizations described below that
            require
            <br>
            +additional locks. More on that later.
            <br>
            +
            <br>
            +.. code-block:: C
            <br>
            +
            <br>
            +   dma_resv_lock(&amp;gpu_vm-&gt;resv);
            <br>
            +
            <br>
            +   for_each_gpu_vma_on_revalidate_list(gpu_vm,
            &amp;gpu_vma) {
            <br>
            +        revalidate_gpu_vma(&amp;gpu_vma);
            <br>
            +        remove_from_revalidate_list(&amp;gpu_vma);
            <br>
            +   }
            <br>
            +
            <br>
            +   add_dependencies(&amp;gpu_job, &amp;gpu_vm-&gt;resv);
            <br>
            +   job_dma_fence = gpu_submit(&amp;gpu_job));
            <br>
            +
            <br>
            +   add_dma_fence(job_dma_fence, &amp;gpu_vm-&gt;resv);
            <br>
            +   dma_resv_unlock(&amp;gpu_vm-&gt;resv);
            <br>
            +
            <br>
            +Eviction of one of these local objects will then be
            something like the
            <br>
            +following:
            <br>
            +
            <br>
            +.. code-block:: C
            <br>
            +
            <br>
            +   obj = get_object_from_lru();
            <br>
            +
            <br>
            +   dma_resv_lock(obj-&gt;resv);
            <br>
            +   for_each_gpu_vma_of_obj(obj, &amp;gpu_vma);
            <br>
            +        put_gpu_vma_on_revalidate_list(&amp;gpu_vma);
            <br>
            +
            <br>
            +   add_dependencies(&amp;eviction_job, &amp;obj-&gt;resv);
            <br>
            +   job_dma_fence = gpu_submit(&amp;eviction_job);
            <br>
            +   add_dma_fence(&amp;obj-&gt;resv, job_dma_fence);
            <br>
            +
            <br>
            +   dma_resv_unlock(&amp;obj-&gt;resv);
            <br>
            +   put_object(obj);
            <br>
            +
            <br>
            +Note that since the object is local to the gpu_vm, it will
            share the gpu_vm's
            <br>
            +``dma_resv`` lock so that ``obj-&gt;resv ==
            gpu_vm-&gt;resv``. Invalidated gpu_vmas are put
            <br>
            +on the gpu_vm's revalidation list, which is protected by
            ``gpu_vm-&gt;resv``, which
            <br>
            +is always locked while evicting, due to the above equality.
            <br>
            +
            <br>
            +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound
            before eviction,
            <br>
            +Since the eviction blit or copy will wait for GPU idle, any
            attempt by
            <br>
            +the GPU to access freed memory through the gpu_vma will be
            preceded by
            <br>
            +a new exec function, which will make sure the gpu_vma is
            <br>
            +revalidated. The eviction code holding the object's
            dma_resv while
            <br>
            +revalidating will ensure a new exec function may not race
            with the eviction.
            <br>
            +
            <br>
            +Introducing external (or shared) buffer objects
            <br>
            +===============================================
            <br>
            +
            <br>
            +Since shared buffer objects may be shared by multiple
            gpu_vm's they
            <br>
            +can't share their reservation object with a single gpu_vm,
            but will rather
            <br>
            +have a reservation object of their own. The shared objects
            bound to a
            <br>
            +gpu_vm using one or many
            <br>
            +gpu_vmas are therefore typically put on a per-gpu_vm list
            which is
            <br>
            +protected by the gpu_vm lock. One could in theory protect
            it also with
            <br>
            +the ``gpu_vm-&gt;resv``, but since the list of dma_resvs to
            take is typically
            <br>
            +built before the ``gpu_vm-&gt;resv`` is locked due to a
            limitation in
            <br>
            +the current locking helpers, that is typically not done.
            Also see
            <br>
            +below for userptr gpu_vmas.
            <br>
            +
            <br>
            +At eviction time we now need to invalidate *all* gpu_vmas
            of a shared
            <br>
            +object, but we can no longer be certain that we hold the
            gpu_vm's
            <br>
            +dma_resv of all the object's gpu_vmas. We can only be
            certain that we
            <br>
          </blockquote>
          I need to think a bit more about locking of extobj and evicted
          object tracking
          <br>
          in the case of processing 'drm_gpuva_ops' directly through
          callbacks within the
          <br>
          fence signalling critical path as mentioend in [1].
          <br>
          <br>
          In order to support that, we'd need to protect extobjs with a
          separate lock,
          <br>
          and while iterating extobjs to acquire the dma-resv lock drop
          the lock within
          <br>
          the loop before we actually acquire the dma-resv lock. Maple
          tree supports that
          <br>
          already and this can be fully done within the GPUVA manager;
          no need for the
          <br>
          driver to care about that.
          <br>
        </blockquote>
        <br>
        So do I understand correctly that this because you want to
        update the gpuvm state while operations are progressing
        asynchronously?
        <br>
        <br>
        If so, I wonder whether that could really be done? For example
        to allocate enough memory for page-tables etc, you need to know
        the details of the operations at IOCTL execution time, and to
        know the details you need to know the state from the previous
        operation?
        <br>
      </blockquote>
      <br>
      <h1> </h1>
      Right, sync and async bind can't run fully concurrently, but you
      could "inject" a
      <br>
      sync one between two async ones such that the sync ones executed
      from the IOCTL
      <br>
      directly while async execution is stalled meanwhile. This would be
      possible because
      <br>
      the actual drm_gpuva_ops would be calculated within the async
      execution path rather
      <br>
      than in the IOCTL. But yes, page-table management must be desinged
      to support that.
      <br>
    </blockquote>
    <p>OK, well one of the main motivations for Xe is to be able to
      pipeline interleaving binds and execs if needed, like so:</p>
    <p>- Bind vmas for scene 1.<br>
      - Submit scene 1.<br>
      - Unbind vmas for scene 1.<br>
      - Bind vmas for scene 2.<br>
      - Submit scene 2.<br>
      - Unbind vmas for scene 2.<br>
    </p>
    <p>And being able to *submit* all of the above while the async
      binding of vmas for scene (step 1) has not yet completed.<br>
      I can't really see how this could be done, while obeying dma-fence
      rules, unless state is updated synchronously while submitting?</p>
    <p>So unless I'm misunderstanding what you are trying to do, I don't
      see Xe wanting to side-step the current approach, but OTOH
      protecting part of the state with additional locks probably won't
      be a problem as long as that is optional. <br>
    </p>
    <blockquote type="cite"
      cite="mid:1c6cbf97-7e85-a48f-9e6a-ed716ab5b05d@redhat.com">
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">
          <br>
          While, as already mentioned, I'd really love to support that,
          I noticed that we
          <br>
          have a similar issue with tracking evicted objects. There are
          (similar) ways to
          <br>
          deal with that, however, it drastically increases complexity.
          <br>
          <br>
          Hence, I'd like to reconsider whether it's worth supporting it
          in the first
          <br>
          place. Most of the arguments in order to support it are for
          decreasing
          <br>
          complexity. However, if it increases complexity elsewhere,
          it's probably not
          <br>
          worth. The only argument left would be for synchronous bind
          jobs which could
          <br>
          be injected at any point of time without the need to be queued
          up in the
          <br>
          scheduler to preserve ordering. However, I'm not yet sure how
          important this
          <br>
          would be. For Xe it doesn't really seem to be a concern I
          guess?
          <br>
        </blockquote>
        Xe supports that functionality via separate bind queues. If you
        queue most of the operations using one queue, you can inject
        synchronous bind jobs using another. Ideally they execute
        separately, but they are not guaranteed to do that.
        <br>
      </blockquote>
      <br>
      Ok, but the separate bind queue would still work in the same
      asynchronous way, as
      <br>
      in the job is submitted to some kind of worker and the IOCTL just
      blocks until
      <br>
      completion, right?
      <br>
    </blockquote>
    <p>The job is only submitted to a worker if there are unsatisfied
      dependencies, like that bind queue is busy with something else, or
      a GPU job is wiping the BO content for security reasons, or an
      in-fence, or somebody else having queued a job to the same
      page-table range *). Otherwise the page-table is updated
      immediately using CPU writes.</p>
    <p>But yes, the IOCTL blocks until completion if the job is
      synchronous.<br>
    </p>
    <p>/Thomas</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:1c6cbf97-7e85-a48f-9e6a-ed716ab5b05d@redhat.com"><br>
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          [1]
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/202308221050.kTj8uFMA-lkp@intel.com/T/#m7f3b5a7ff70723332adeea32671578cb95c62f7c">https://lore.kernel.org/dri-devel/202308221050.kTj8uFMA-lkp@intel.com/T/#m7f3b5a7ff70723332adeea32671578cb95c62f7c</a><br>
          <br>
          <blockquote type="cite">+hold the object's private dma_resv.
            We can trylock the dma_resvs for
            <br>
            +the affected gpu_vm's but that might be unnecessarily
            complex. If we
            <br>
            +have a ww_acquire context at hand at eviction time we can
            also perform
            <br>
            +sleeping locks of those dma_resvs but that could cause
            expensive
            <br>
            +rollbacks. One option is to just mark the invalidated
            gpu_vmas with a bool
            <br>
            +which is inspected on the next exec function, when the
            gpu_vm's
            <br>
            +dma_resv and the object's dma_resv is held, and the
            invalidated
            <br>
            +gpu_vmas could then be put on the gpu_vm's list of
            invalidated
            <br>
            +gpu_vmas. That bool would then, although being per-gpu_vma
            formally be
            <br>
            +protected by the object's dma_resv.
            <br>
            +
            <br>
            +The exec function would then look something like the
            following:
            <br>
            +
            <br>
            +.. code-block:: C
            <br>
            +
            <br>
            +   read_lock(&amp;gpu_vm-&gt;lock);
            <br>
            +
            <br>
            +   dma_resv_lock(&amp;gpu_vm-&gt;resv);
            <br>
            +
            <br>
            +   // Shared object list is protected by the
            gpu_vm-&gt;lock.
            <br>
            +   for_each_shared_obj(gpu_vm, &amp;obj) {
            <br>
            +        dma_resv_lock(&amp;obj-&gt;resv);
            <br>
            +       
            move_marked_gpu_vmas_to_revalidate_gpu_vma_list(obj,
            &amp;gpu_vm);
            <br>
            +   }
            <br>
            +
            <br>
            +   for_each_gpu_vma_to_revalidate(gpu_vm, &amp;gpu_vma) {
            <br>
            +        revalidate_gpu_vma(&amp;gpu_vma);
            <br>
            +        remove_from_revalidate_list(&amp;gpu_vma);
            <br>
            +   }
            <br>
            +
            <br>
            +   add_dependencies(&amp;gpu_job, &amp;gpu_vm-&gt;resv);
            <br>
            +   job_dma_fence = gpu_submit(&amp;gpu_job));
            <br>
            +
            <br>
            +   add_dma_fence(job_dma_fence, &amp;gpu_vm-&gt;resv);
            <br>
            +   for_each_shared_obj(gpu_vm, &amp;obj)
            <br>
            +          add_dma_fence(job_dma_fence, &amp;obj-&gt;resv);
            <br>
            +   dma_resv_unlock_all_resv_locks();
            <br>
            +
            <br>
            +   read_unlock(&amp;gpu_vm-&gt;lock);
            <br>
            +
            <br>
            +And the corresponding shared-object aware eviction would
            look like:
            <br>
            +
            <br>
            +.. code-block:: C
            <br>
            +
            <br>
            +   obj = get_object_from_lru();
            <br>
            +
            <br>
            +   dma_resv_lock(obj-&gt;resv);
            <br>
            +   for_each_gpu_vma_of_obj(obj, &amp;gpu_vma);
            <br>
            +        if (object_is_vm_local(obj))
            <br>
            +                    
            put_gpu_vma_on_revalidate_list(&amp;gpu_vma, &amp;gpu_vm);
            <br>
            +        else
            <br>
            +                    
            mark_gpu_vma_for_revalidation(&amp;gpu_vma);
            <br>
            +
            <br>
            +   add_dependencies(&amp;eviction_job, &amp;obj-&gt;resv);
            <br>
            +   job_dma_fence = gpu_submit(&amp;eviction_job);
            <br>
            +   add_dma_fence(&amp;obj-&gt;resv, job_dma_fence);
            <br>
            +
            <br>
            +   dma_resv_unlock(&amp;obj-&gt;resv);
            <br>
            +   put_object(obj);
            <br>
            +
            <br>
            +Yet another option is to put the gpu_vmas to be invalidated
            on a separate
            <br>
            +gpu_vm list protected by a lower level lock that can be
            taken both at eviction
            <br>
            +time and at transfer-to-revalidate list time. The details
            are not in
            <br>
            +this document, but this for reference implemented in the
            Intel xe
            <br>
            +driver.
            <br>
            +
            <br>
            +Introducing userptr gpu_vmas
            <br>
            +============================
            <br>
            +
            <br>
            +A userptr gpu_vma is a gpu_vma that, instead of mapping a
            buffer object to a
            <br>
            +GPU virtual address range, directly maps a CPU mm range of
            anonymous-
            <br>
            +or file page-cache pages.
            <br>
            +A very simple approach would be to just pin the pages using
            <br>
            +pin_user_pages() at bind time and unpin them at unbind
            time, but this
            <br>
            +creates a Denial-Of-Service vector since a single
            user-space process
            <br>
            +would be able to pin down all of system memory, which is
            not
            <br>
            +desirable. (For special use-cases and with proper
            accounting pinning might
            <br>
            +still be a desirable feature, though). What we need to do
            in the general case is
            <br>
            +to obtain a reference to the desired pages, make sure we
            are notified
            <br>
            +using a MMU notifier just before the CPU mm unmaps the
            pages, dirty
            <br>
            +them if they are not mapped read-only to the GPU, and then
            drop the reference.
            <br>
            +When we are notified by the MMU notifier that CPU mm is
            about to drop the
            <br>
            +pages, we need to stop GPU access to the pages,
            <br>
            +GPU page-table and make sure that before the next time the
            GPU tries to access
            <br>
            +whatever is now present in the CPU mm range, we unmap the
            old pages
            <br>
            +from the GPU page tables and repeat the process of
            obtaining new page
            <br>
            +references. Note that when the core mm decides to laundry
            pages, we get such
            <br>
            +an unmap MMU notification and can mark the pages dirty
            again before the
            <br>
            +next GPU access. We also get similar MMU notifications for
            NUMA accounting
            <br>
            +which the GPU driver doesn't really need to care about, but
            so far
            <br>
            +it's proven difficult to exclude certain notifications.
            <br>
            +
            <br>
            +Using a MMU notifier for device DMA (and other methods) is
            described in
            <br>
            +`this document
            <br>
+<a class="moz-txt-link-rfc2396E" href="https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware">&lt;https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware&gt;</a>`_.
            <br>
            +
            <br>
            +Now the method of obtaining struct page references using
            <br>
            +get_user_pages() unfortunately can't be used under a
            dma_resv lock
            <br>
            +since that would violate the locking order of the dma_resv
            lock vs the
            <br>
            +mmap_lock that is grabbed when resolving a CPU pagefault.
            This means the gpu_vm's
            <br>
            +list of userptr gpu_vmas needs to be protected by an outer
            lock, and this
            <br>
            +is the first time we strictly need the gpu_vm-&gt;lock.
            While it was
            <br>
            +previously used also to protect the list of the gpu_vm's
            shared objects,
            <br>
            +we could in theory have used the gpu_vm-&gt;resv for that.
            <br>
            +
            <br>
            +The MMU interval seqlock for a userptr gpu_vma is used in
            the following
            <br>
            +way:
            <br>
            +
            <br>
            +.. code-block:: C
            <br>
            +
            <br>
            +   down_read(&amp;gpu_vm-&gt;lock);
            <br>
            +
            <br>
            +   retry:
            <br>
            +
            <br>
            +   // Note: mmu_interval_read_begin() blocks until there is
            no
            <br>
            +   // invalidation notifier running anymore.
            <br>
            +   seq =
            mmu_interval_read_begin(&amp;gpu_vma-&gt;userptr_interval);
            <br>
            +   if (seq != gpu_vma-&gt;saved_seq) {
            <br>
            +           obtain_new_page_pointers(&amp;gpu_vma);
            <br>
            +       dma_resv_lock(&amp;gpu_vm-&gt;resv);
            <br>
            +       put_gpu_vma_on_revalidate_list(&amp;gpu_vma,
            &amp;gpu_vm);
            <br>
            +       dma_resv_unlock(&amp;gpu_vm-&gt;resv);
            <br>
            +       gpu_vma-&gt;saved_seq = seq;
            <br>
            +   }
            <br>
            +
            <br>
            +   // The usual revalidation goes here.
            <br>
            +
            <br>
            +   // Final userptr sequence validation may not happen
            before the
            <br>
            +   // submission dma_fence is added to the gpu_vm's resv,
            from the POW
            <br>
            +   // of the MMU invalidation notifier. Hence the
            <br>
            +   // userptr_notifier_lock that will make them appear
            atomic.
            <br>
            +
            <br>
            +   add_dependencies(&amp;gpu_job, &amp;gpu_vm-&gt;resv);
            <br>
            +   down_read(&amp;gpu_vm-&gt;userptr_notifier_lock);
            <br>
            +   if
            (mmu_interval_read_retry(&amp;gpu_vma-&gt;userptr_interval,
            gpu_vma-&gt;saved_seq)) {
            <br>
            +          up_read(&amp;gpu_vm-&gt;userptr_notifier_lock);
            <br>
            +      goto retry;
            <br>
            +   }
            <br>
            +
            <br>
            +   job_dma_fence = gpu_submit(&amp;gpu_job));
            <br>
            +
            <br>
            +   add_dma_fence(job_dma_fence, &amp;gpu_vm-&gt;resv);
            <br>
            +
            <br>
            +   for_each_shared_obj(gpu_vm, &amp;obj)
            <br>
            +          add_dma_fence(job_dma_fence, &amp;obj-&gt;resv);
            <br>
            +
            <br>
            +   dma_resv_unlock_all_resv_locks();
            <br>
            +   up_read(&amp;gpu_vm-&gt;userptr_notifier_lock);
            <br>
            +   up_read(&amp;gpu_vm-&gt;lock);
            <br>
            +
            <br>
            +The code between ``mmu_interval_read_begin()`` and the
            <br>
            +``mmu_interval_read_retry()`` marks the read side critical
            section of
            <br>
            +what we call the ``userptr_seqlock``. In reality the
            gpu_vm's userptr
            <br>
            +gpu_vma list is looped through, and the check is done for
            *all* of its
            <br>
            +userptr gpu_vmas, although we only show a single one here.
            <br>
            +
            <br>
            +The userptr gpu_vma MMU invalidation notifier might be
            called fr
            <h1> </h1>
            om
            <br>
            +reclaim context and, again to avoid locking order
            violations, we can't
            <br>
            +take any dma_resv lock nor the gpu_vm-&gt;lock from within
            it.
            <br>
            +
            <br>
            +.. code-block:: C
            <br>
            +
            <br>
            +  bool gpu_vma_userptr_invalidate(userptr_interval,
            cur_seq)
            <br>
            +  {
            <br>
            +          // Make sure the exec function either sees the
            new sequence
            <br>
            +      // and backs off or we wait for the dma-fence:
            <br>
            +
            <br>
            +         
            down_write(&amp;gpu_vm-&gt;userptr_notifier_lock);
            <br>
            +      mmu_interval_set_seq(userptr_interval, cur_seq);
            <br>
            +      up_write(&amp;gpu_vm-&gt;userptr_notifier_lock);
            <br>
            +
            <br>
            +      dma_resv_wait_timeout(&amp;gpu_vm-&gt;resv,
            DMA_RESV_USAGE_BOOKKEEP,
            <br>
            +                        false, MAX_SCHEDULE_TIMEOUT);
            <br>
            +      return true;
            <br>
            +  }
            <br>
            +
            <br>
            +When this invalidation notifier returns, the GPU can no
            longer be
            <br>
            +accessing the old pages of the userptr gpu_vma and needs to
            redo the page-binding
            <br>
            +before a new GPU submission can succeed.
            <br>
            +
            <br>
            +Optimizing gpu_vma iteration
            <br>
            +----------------------------
            <br>
            +
            <br>
            +Iterating through all of a gpu_vm's userptr gpu_vmas to
            check the validity
            <br>
            +on each exec function may be very costly. There is a scheme
            to avoid
            <br>
            +this and only iterate through the userptr gpu_vmas that
            actually saw an
            <br>
            +invalidation notifier call since the last exec. T
            <br>
            +
            <br>
            +TODO: describe that scheme here. It's implemented in the xe
            driver.
            <br>
            +
            <br>
            +Locking for page-table updates at bind- and unbind time
            <br>
            +=======================================================
            <br>
            +
            <br>
            +TODO.
            <br>
            +
            <br>
            +Recoverable page-fault implications
            <br>
            +===================================
            <br>
            +
            <br>
            +TODO.
            <br>
            -- <br>
            2.41.0
            <br>
            <br>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------9R07ggAo0c1QCd0dXNiKQfZo--
