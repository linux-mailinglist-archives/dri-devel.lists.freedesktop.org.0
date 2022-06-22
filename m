Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B357E55449B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 10:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B7E11351D;
	Wed, 22 Jun 2022 08:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21FF1134A9;
 Wed, 22 Jun 2022 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655885920; x=1687421920;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Sbp26CsAgaZsKkbQyWgdr6nFJhfyPtF77JArfdkzKwE=;
 b=AKllp0hmGflYXrJ80VktCLAhfbrtTMMXhU8MA05XfuBurmGvDdhuNNcH
 hV1j4QAZX+HFwNppXqdgAFQDSjWykMW6Sq51XeQ29+gew/Gr4mdawACSN
 M8HrclbWANb0ppI5eWLyywzzck1LdUpaG00XA2Qg0VXVgIkJwdo2Ufttk
 BjZyrPuCw1nmS3TPxrnr/7kiEAXyTEOyRQTOyJCn6Z1B1D7RbjBEmkxbC
 dVcuxqfcM+z5yM//F59pIX3SOWtZdqQHr+TicltulSC8A9t2BGM43SOa5
 maUNtE7B0SsVCLrhO27MJwXeByMdQHiccpzDOrfBincns+JC/AvfJjNTZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="342035811"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="342035811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 01:17:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="615074050"
Received: from ebrazil-mobl1.amr.corp.intel.com (HELO [10.213.200.60])
 ([10.213.200.60])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 01:17:37 -0700
Message-ID: <f3e3482c-5f50-2a45-b39d-3ae2da14a77e@linux.intel.com>
Date: Wed, 22 Jun 2022 09:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v2 1/3] drm/doc/rfc: VM_BIND feature design
 document
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220617051445.8901-1-niranjana.vishwanathapura@intel.com>
 <20220617051445.8901-2-niranjana.vishwanathapura@intel.com>
 <c153dc07-f44d-ba83-cad6-2005a497a519@linux.intel.com>
 <20220620162944.GW376@nvishwa1-DESK>
 <2a2c9a7a-bc0e-ad2a-4b82-b4801b5c6373@linux.intel.com>
 <20220621144328.GX376@nvishwa1-DESK>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220621144328.GX376@nvishwa1-DESK>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, thomas.hellstrom@intel.com,
 dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/06/2022 15:43, Niranjana Vishwanathapura wrote:
> On Tue, Jun 21, 2022 at 09:35:16AM +0100, Tvrtko Ursulin wrote:
>>
>> On 20/06/2022 17:29, Niranjana Vishwanathapura wrote:
>>> On Mon, Jun 20, 2022 at 11:43:10AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 17/06/2022 06:14, Niranjana Vishwanathapura wrote:
>>>>> VM_BIND design document with description of intended use cases.
>>>>>
>>>>> v2: Reduce the scope to simple Mesa use case.
>>>>
>>>> since I expressed interest please add me to cc when sending out.
>>>>
>>>
>>> Hi Tvrtko,
>>> I did include you in the cc list with git send-email, but looks like 
>>> some patches
>>> in this series has the full cc list, but some don't (you are on cc 
>>> list of this
>>> patch though). I am not sure why.
>>
>> Odd, I'm not on CC on the (only for me) copy I found in the mailing list.
>>
>>>> How come the direction changed to simplify all of a sudden? I did 
>>>> not spot any discussion to that effect. Was it internal talks?
>>>>
>>>
>>> Yah, some of us had offline discussion involving the Mesa team.
>>> I did update the thread (previous version of this patch series) about 
>>> that.
>>> Plan was to align our roadmap to focus on the deliverables at this point
>>> without further complicating the uapi.
>>>>>
>>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>>> <niranjana.vishwanathapura@intel.com>
>>>>> ---
>>>>>  Documentation/gpu/rfc/i915_vm_bind.rst | 238 
>>>>> +++++++++++++++++++++++++
>>>>>  Documentation/gpu/rfc/index.rst        |   4 +
>>>>>  2 files changed, 242 insertions(+)
>>>>>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
>>>>>
>>>>> diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst 
>>>>> b/Documentation/gpu/rfc/i915_vm_bind.rst
>>>>> new file mode 100644
>>>>> index 000000000000..4ab590ef11fd
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/rfc/i915_vm_bind.rst
>>>>> @@ -0,0 +1,238 @@
>>>>> +==========================================
>>>>> +I915 VM_BIND feature design and use cases
>>>>> +==========================================
>>>>> +
>>>>> +VM_BIND feature
>>>>> +================
>>>>> +DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM 
>>>>> buffer
>>>>> +objects (BOs) or sections of a BOs at specified GPU virtual 
>>>>> addresses on a
>>>>> +specified address space (VM). These mappings (also referred to as 
>>>>> persistent
>>>>> +mappings) will be persistent across multiple GPU submissions 
>>>>> (execbuf calls)
>>>>> +issued by the UMD, without user having to provide a list of all 
>>>>> required
>>>>> +mappings during each submission (as required by older execbuf mode).
>>>>> +
>>>>> +The VM_BIND/UNBIND calls allow UMDs to request a timeline fence 
>>>>> for signaling
>>>>> +the completion of bind/unbind operation.
>>>>> +
>>>>> +VM_BIND feature is advertised to user via I915_PARAM_HAS_VM_BIND.
>>>>> +User has to opt-in for VM_BIND mode of binding for an address 
>>>>> space (VM)
>>>>> +during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND 
>>>>> extension.
>>>>> +
>>>>> +Normally, vm_bind/unbind operations will get completed synchronously,
>>>>
>>>> To me synchronously, at this point in the text, reads as ioctl will 
>>>> return only when the operation is done. Rest of the paragraph 
>>>> however disagrees (plus existence of out fence). It is not clear to 
>>>> me what is the actual behaviour. Will it be clear to userspace 
>>>> developers reading uapi kerneldoc? If it is async, what are the 
>>>> ordering rules in this version?
>>>>
>>>
>>> Yah, here I am simply stating the i915_vma_pin_ww() behavior which 
>>> mostly
>>> does the binding synchronously unless there is a moving fence associated
>>> with the object in which case, binding will complete later once that 
>>> fence
>>> is signaled (hence the out fence).
>>
>> So from userspace point of view it is fully asynchronous and out of 
>> order? I'd suggest spelling that out in the uapi kerneldoc.
>>
> 
> Yah. I can see how some i915 details I provided here can be confusing.
> Ok, will remove and spell it out that user must anticipate fully async
> out of order completions.
> 
>>>>> +but if the object is being moved, the binding will happen once 
>>>>> that the
>>>>> +moving is complete and out fence will be signaled after binding is 
>>>>> complete.
>>>>> +The bind/unbind operation can get completed out of submission order.
>>>>> +
>>>>> +VM_BIND features include:
>>>>> +
>>>>> +* Multiple Virtual Address (VA) mappings can map to the same 
>>>>> physical pages
>>>>> +  of an object (aliasing).
>>>>> +* VA mapping can map to a partial section of the BO (partial 
>>>>> binding).
>>>>> +* Support capture of persistent mappings in the dump upon GPU error.
>>>>> +* TLB is flushed upon unbind completion. Batching of TLB flushes 
>>>>> in some
>>>>> +  use cases will be helpful.
>>>>> +* Support for userptr gem objects (no special uapi is required for 
>>>>> this).
>>>>> +
>>>>> +Execbuf ioctl in VM_BIND mode
>>>>> +-------------------------------
>>>>> +A VM in VM_BIND mode will not support older execbuf mode of binding.
>>>>> +The execbuf ioctl handling in VM_BIND mode differs significantly 
>>>>> from the
>>>>> +older execbuf2 ioctl (See struct drm_i915_gem_execbuffer2).
>>>>> +Hence, a new execbuf3 ioctl has been added to support VM_BIND 
>>>>> mode. (See
>>>>> +struct drm_i915_gem_execbuffer3). The execbuf3 ioctl will not 
>>>>> accept any
>>>>> +execlist. Hence, no support for implicit sync. It is expected that 
>>>>> the below
>>>>> +work will be able to support requirements of object dependency 
>>>>> setting in all
>>>>> +use cases:
>>>>> +
>>>>> +"dma-buf: Add an API for exporting sync files"
>>>>> +(https://lwn.net/Articles/859290/)
>>>>
>>>> What does this mean? If execbuf3 does not know about target objects 
>>>> how can we add a meaningful fence?
>>>>
>>>
>>> Execbuf3 does know about the target objects. It is all the objects
>>> bound to that VM via vm_bind call.
>>>
>>>>> +
>>>>> +The execbuf3 ioctl directly specifies the batch addresses instead 
>>>>> of as
>>>>> +object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
>>>>> +support many of the older features like in/out/submit fences, 
>>>>> fence array,
>>>>> +default gem context and many more (See struct 
>>>>> drm_i915_gem_execbuffer3).
>>>>> +
>>>>> +In VM_BIND mode, VA allocation is completely managed by the user 
>>>>> instead of
>>>>> +the i915 driver. Hence all VA assignment, eviction are not 
>>>>> applicable in
>>>>> +VM_BIND mode. Also, for determining object activeness, VM_BIND 
>>>>> mode will not
>>>>> +be using the i915_vma active reference tracking. It will instead 
>>>>> use dma-resv
>>>>> +object for that (See `VM_BIND dma_resv usage`_).
>>>>> +
>>>>> +So, a lot of existing code supporting execbuf2 ioctl, like 
>>>>> relocations, VA
>>>>> +evictions, vma lookup table, implicit sync, vma active reference 
>>>>> tracking etc.,
>>>>> +are not applicable for execbuf3 ioctl. Hence, all execbuf3 
>>>>> specific handling
>>>>> +should be in a separate file and only functionalities common to 
>>>>> these ioctls
>>>>> +can be the shared code where possible.
>>>>> +
>>>>> +VM_PRIVATE objects
>>>>> +-------------------
>>>>> +By default, BOs can be mapped on multiple VMs and can also be dma-buf
>>>>> +exported. Hence these BOs are referred to as Shared BOs.
>>>>> +During each execbuf submission, the request fence must be added to 
>>>>> the
>>>>> +dma-resv fence list of all shared BOs mapped on the VM.
>>>>
>>>> Does this tie to my previous question? Design is to add each fence 
>>>> to literally _all_ BOs mapped to a VM, on every execbuf3? If so, is 
>>>> that definitely needed and for what use case? Mixing implicit and 
>>>> explicit, I mean bridging implicit and explicit sync clients?
>>>>
>>>
>>> Yes. It is similar to how legacy execbuf2 does. ie., add request fence
>>> to all of the target BOs. Only difference is in execbuf2 case, target
>>> objects are the objects in execlist, whereas in execbuf2, it is all
>>> the BOs mapped to that VM via vm_bind call. It is needed as UMD says
>>> that it is needed by vm_bind'ing the BO before the execbuf3 call.
>>
>> Sorry I did not understand why it is needed, the last sentence that 
>> is, what did that suppose to mean?
>>
> 
> I am seeing there is a typo in my above comment. It should have been,
> "wherewas in execbuf3, it is all the BOs mapped to that VM via vm_bind 
> call".
> 
> We need all the BO's dma-resv fence list should be properly updated
> as we depend on it for gem_wait ioctl etc. Also note that we are moving
> away from i915_vma active tracking mechanism and instead will be checking
> the BO's dma-resv fence list to check if BO is active or not.
> So, we need the BO's dma-resv fence list properly updated.
> As for execbuf3, all the vm_bind BOs are target BOs, we need to update
> the dma-resv fence list for all of them (private or shared).

Why do we care about gem_wait on a random BO handle if userspace is 
supposed to explicitly manage things? Perhaps the key is in the "etc" 
part - so what is etc? Or maybe I am not seeing something in the 
activity tracking angle? If it is eviction then why it wouldn't be 
possible to just not evict anything from a vm if a vm is busy?

Anyway my concern is that inserting a fence to _all_ objects in a VM on 
_every_ execbuf feels it could be quite costly. So there should be a 
strong reason to do it which needs to be documented.

Regards,

Tvrtko
