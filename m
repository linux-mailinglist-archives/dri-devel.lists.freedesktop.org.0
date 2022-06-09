Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C938C544FCC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 16:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6364611A615;
	Thu,  9 Jun 2022 14:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D913411A5A1;
 Thu,  9 Jun 2022 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654786154; x=1686322154;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=IGonYGdY+o87de5o4KgOMfYLeTriHhJCK5++WBrNt/c=;
 b=JePB2TtqUWbMDz3RDNnBMb2DYkj0LlZlDQTDGcFsYiuQkrUN+RadO4Io
 +cecdPK7rF1GeFfB0Og6f1GGIDW5i5ppSiYnCKCvGFSt0lYth+KA6FyFv
 EATrNaL8dA9zbmQJdSNx2QHxE3Q1Ja6aA7YADFo7UB11Q6ycYOynjwWPl
 PsLR2hbhGlJIx3FaPua+73rFFc1bdTk+SPzLFpElIijfoHNH5zKH0WQkR
 q3kp4RP39JPInhx5On1n7sRYTLFb8dc4Lj4NgcMKc7IoxYjb33QR6CsFp
 N/AIHnQmvbcs7cnYiH9LRuS6/ZarPyG7Q4cHiJ4QwSOj87mpki9p/Smxy A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="257735452"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
 d="scan'208,217";a="257735452"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 07:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
 d="scan'208,217";a="710472924"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 09 Jun 2022 07:49:13 -0700
Received: from [10.249.140.246] (unknown [10.249.140.246])
 by linux.intel.com (Postfix) with ESMTP id 1257058094D;
 Thu,  9 Jun 2022 07:49:10 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------QtZtyOAemP00vsXfCK0kGkfq"
Message-ID: <54fb6c28-7954-123e-edd6-ba6c15b6d36e@intel.com>
Date: Thu, 9 Jun 2022 17:49:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601202836.GA15346@jons-linux-dev-box>
 <20220602201112.GQ4461@nvishwa1-DESK>
 <CAOFGe94AXn_vqON++LpiCTqOspCrVZawcYmjL3W6A7tA5vjTpQ@mail.gmail.com>
 <bd615d4e-3911-a9ce-5d9f-fb85f7866d32@intel.com>
 <20220603235148.GU4461@nvishwa1-DESK>
 <CAOFGe97GP10J601XGRNK7X+xLxGK1sxNnbbLeLTxAf8g4V0-bQ@mail.gmail.com>
 <20220607181810.GV4461@nvishwa1-DESK> <20220607213209.GY4461@nvishwa1-DESK>
 <4be022cc-518e-49e1-96bd-b9720a313401@linux.intel.com>
 <20220608214431.GD4461@nvishwa1-DESK>
 <CAOFGe97UDd2S+LdKeOWubFvc4cNy6KbRTtCPKUbwd8PnZPuvMQ@mail.gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <CAOFGe97UDd2S+LdKeOWubFvc4cNy6KbRTtCPKUbwd8PnZPuvMQ@mail.gmail.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------QtZtyOAemP00vsXfCK0kGkfq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/06/2022 00:55, Jason Ekstrand wrote:
> On Wed, Jun 8, 2022 at 4:44 PM Niranjana Vishwanathapura 
> <niranjana.vishwanathapura@intel.com> wrote:
>
>     On Wed, Jun 08, 2022 at 08:33:25AM +0100, Tvrtko Ursulin wrote:
>     >
>     >
>     >On 07/06/2022 22:32, Niranjana Vishwanathapura wrote:
>     >>On Tue, Jun 07, 2022 at 11:18:11AM -0700, Niranjana
>     Vishwanathapura wrote:
>     >>>On Tue, Jun 07, 2022 at 12:12:03PM -0500, Jason Ekstrand wrote:
>     >>>> On Fri, Jun 3, 2022 at 6:52 PM Niranjana Vishwanathapura
>     >>>> <niranjana.vishwanathapura@intel.com> wrote:
>     >>>>
>     >>>>   On Fri, Jun 03, 2022 at 10:20:25AM +0300, Lionel Landwerlin
>     wrote:
>     >>>>   >   On 02/06/2022 23:35, Jason Ekstrand wrote:
>     >>>>   >
>     >>>>   >     On Thu, Jun 2, 2022 at 3:11 PM Niranjana Vishwanathapura
>     >>>>   >     <niranjana.vishwanathapura@intel.com> wrote:
>     >>>>   >
>     >>>>   >       On Wed, Jun 01, 2022 at 01:28:36PM -0700, Matthew
>     >>>>Brost wrote:
>     >>>>   >       >On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel
>     Landwerlin
>     >>>>   wrote:
>     >>>>   >       >> On 17/05/2022 21:32, Niranjana Vishwanathapura
>     wrote:
>     >>>>   >       >> > +VM_BIND/UNBIND ioctl will immediately start
>     >>>>   binding/unbinding
>     >>>>   >       the mapping in an
>     >>>>   >       >> > +async worker. The binding and unbinding will
>     >>>>work like a
>     >>>>   special
>     >>>>   >       GPU engine.
>     >>>>   >       >> > +The binding and unbinding operations are
>     serialized and
>     >>>>   will
>     >>>>   >       wait on specified
>     >>>>   >       >> > +input fences before the operation and will
>     signal the
>     >>>>   output
>     >>>>   >       fences upon the
>     >>>>   >       >> > +completion of the operation. Due to
>     serialization,
>     >>>>   completion of
>     >>>>   >       an operation
>     >>>>   >       >> > +will also indicate that all previous operations
>     >>>>are also
>     >>>>   >       complete.
>     >>>>   >       >>
>     >>>>   >       >> I guess we should avoid saying "will immediately
>     start
>     >>>>   >       binding/unbinding" if
>     >>>>   >       >> there are fences involved.
>     >>>>   >       >>
>     >>>>   >       >> And the fact that it's happening in an async
>     >>>>worker seem to
>     >>>>   imply
>     >>>>   >       it's not
>     >>>>   >       >> immediate.
>     >>>>   >       >>
>     >>>>   >
>     >>>>   >       Ok, will fix.
>     >>>>   >       This was added because in earlier design binding
>     was deferred
>     >>>>   until
>     >>>>   >       next execbuff.
>     >>>>   >       But now it is non-deferred (immediate in that sense).
>     >>>>But yah,
>     >>>>   this is
>     >>>>   >       confusing
>     >>>>   >       and will fix it.
>     >>>>   >
>     >>>>   >       >>
>     >>>>   >       >> I have a question on the behavior of the bind
>     >>>>operation when
>     >>>>   no
>     >>>>   >       input fence
>     >>>>   >       >> is provided. Let say I do :
>     >>>>   >       >>
>     >>>>   >       >> VM_BIND (out_fence=fence1)
>     >>>>   >       >>
>     >>>>   >       >> VM_BIND (out_fence=fence2)
>     >>>>   >       >>
>     >>>>   >       >> VM_BIND (out_fence=fence3)
>     >>>>   >       >>
>     >>>>   >       >>
>     >>>>   >       >> In what order are the fences going to be signaled?
>     >>>>   >       >>
>     >>>>   >       >> In the order of VM_BIND ioctls? Or out of order?
>     >>>>   >       >>
>     >>>>   >       >> Because you wrote "serialized I assume it's : in
>     order
>     >>>>   >       >>
>     >>>>   >
>     >>>>   >       Yes, in the order of VM_BIND/UNBIND ioctls. Note that
>     >>>>bind and
>     >>>>   unbind
>     >>>>   >       will use
>     >>>>   >       the same queue and hence are ordered.
>     >>>>   >
>     >>>>   >       >>
>     >>>>   >       >> One thing I didn't realize is that because we
>     only get one
>     >>>>   >       "VM_BIND" engine,
>     >>>>   >       >> there is a disconnect from the Vulkan specification.
>     >>>>   >       >>
>     >>>>   >       >> In Vulkan VM_BIND operations are serialized but
>     >>>>per engine.
>     >>>>   >       >>
>     >>>>   >       >> So you could have something like this :
>     >>>>   >       >>
>     >>>>   >       >> VM_BIND (engine=rcs0, in_fence=fence1,
>     out_fence=fence2)
>     >>>>   >       >>
>     >>>>   >       >> VM_BIND (engine=ccs0, in_fence=fence3,
>     out_fence=fence4)
>     >>>>   >       >>
>     >>>>   >       >>
>     >>>>   >       >> fence1 is not signaled
>     >>>>   >       >>
>     >>>>   >       >> fence3 is signaled
>     >>>>   >       >>
>     >>>>   >       >> So the second VM_BIND will proceed before the
>     >>>>first VM_BIND.
>     >>>>   >       >>
>     >>>>   >       >>
>     >>>>   >       >> I guess we can deal with that scenario in
>     >>>>userspace by doing
>     >>>>   the
>     >>>>   >       wait
>     >>>>   >       >> ourselves in one thread per engines.
>     >>>>   >       >>
>     >>>>   >       >> But then it makes the VM_BIND input fences useless.
>     >>>>   >       >>
>     >>>>   >       >>
>     >>>>   >       >> Daniel : what do you think? Should be rework
>     this or just
>     >>>>   deal with
>     >>>>   >       wait
>     >>>>   >       >> fences in userspace?
>     >>>>   >       >>
>     >>>>   >       >
>     >>>>   >       >My opinion is rework this but make the ordering via
>     >>>>an engine
>     >>>>   param
>     >>>>   >       optional.
>     >>>>   >       >
>     >>>>   >       >e.g. A VM can be configured so all binds are ordered
>     >>>>within the
>     >>>>   VM
>     >>>>   >       >
>     >>>>   >       >e.g. A VM can be configured so all binds accept an
>     engine
>     >>>>   argument
>     >>>>   >       (in
>     >>>>   >       >the case of the i915 likely this is a gem context
>     >>>>handle) and
>     >>>>   binds
>     >>>>   >       >ordered with respect to that engine.
>     >>>>   >       >
>     >>>>   >       >This gives UMDs options as the later likely consumes
>     >>>>more KMD
>     >>>>   >       resources
>     >>>>   >       >so if a different UMD can live with binds being
>     >>>>ordered within
>     >>>>   the VM
>     >>>>   >       >they can use a mode consuming less resources.
>     >>>>   >       >
>     >>>>   >
>     >>>>   >       I think we need to be careful here if we are
>     looking for some
>     >>>>   out of
>     >>>>   >       (submission) order completion of vm_bind/unbind.
>     >>>>   >       In-order completion means, in a batch of binds and
>     >>>>unbinds to be
>     >>>>   >       completed in-order, user only needs to specify
>     >>>>in-fence for the
>     >>>>   >       first bind/unbind call and the our-fence for the last
>     >>>>   bind/unbind
>     >>>>   >       call. Also, the VA released by an unbind call can be
>     >>>>re-used by
>     >>>>   >       any subsequent bind call in that in-order batch.
>     >>>>   >
>     >>>>   >       These things will break if binding/unbinding were to
>     >>>>be allowed
>     >>>>   to
>     >>>>   >       go out of order (of submission) and user need to be
>     extra
>     >>>>   careful
>     >>>>   >       not to run into pre-mature triggereing of out-fence
>     and bind
>     >>>>   failing
>     >>>>   >       as VA is still in use etc.
>     >>>>   >
>     >>>>   >       Also, VM_BIND binds the provided mapping on the
>     specified
>     >>>>   address
>     >>>>   >       space
>     >>>>   >       (VM). So, the uapi is not engine/context specific.
>     >>>>   >
>     >>>>   >       We can however add a 'queue' to the uapi which can be
>     >>>>one from
>     >>>>   the
>     >>>>   >       pre-defined queues,
>     >>>>   >       I915_VM_BIND_QUEUE_0
>     >>>>   >       I915_VM_BIND_QUEUE_1
>     >>>>   >       ...
>     >>>>   >       I915_VM_BIND_QUEUE_(N-1)
>     >>>>   >
>     >>>>   >       KMD will spawn an async work queue for each queue
>     which will
>     >>>>   only
>     >>>>   >       bind the mappings on that queue in the order of
>     submission.
>     >>>>   >       User can assign the queue to per engine or anything
>     >>>>like that.
>     >>>>   >
>     >>>>   >       But again here, user need to be careful and not
>     >>>>deadlock these
>     >>>>   >       queues with circular dependency of fences.
>     >>>>   >
>     >>>>   >       I prefer adding this later an as extension based on
>     >>>>whether it
>     >>>>   >       is really helping with the implementation.
>     >>>>   >
>     >>>>   >     I can tell you right now that having everything on a
>     single
>     >>>>   in-order
>     >>>>   >     queue will not get us the perf we want.  What vulkan
>     >>>>really wants
>     >>>>   is one
>     >>>>   >     of two things:
>     >>>>   >      1. No implicit ordering of VM_BIND ops.  They just
>     happen in
>     >>>>   whatever
>     >>>>   >     their dependencies are resolved and we ensure ordering
>     >>>>ourselves
>     >>>>   by
>     >>>>   >     having a syncobj in the VkQueue.
>     >>>>   >      2. The ability to create multiple VM_BIND queues. 
>     We need at
>     >>>>   least 2
>     >>>>   >     but I don't see why there needs to be a limit besides
>     >>>>the limits
>     >>>>   the
>     >>>>   >     i915 API already has on the number of engines. 
>     Vulkan could
>     >>>>   expose
>     >>>>   >     multiple sparse binding queues to the client if it's not
>     >>>>   arbitrarily
>     >>>>   >     limited.
>     >>>>
>     >>>>   Thanks Jason, Lionel.
>     >>>>
>     >>>>   Jason, what are you referring to when you say "limits the
>     i915 API
>     >>>>   already
>     >>>>   has on the number of engines"? I am not sure if there is
>     such an uapi
>     >>>>   today.
>     >>>>
>     >>>> There's a limit of something like 64 total engines today
>     based on the
>     >>>> number of bits we can cram into the exec flags in
>     execbuffer2.  I think
>     >>>> someone had an extended version that allowed more but I
>     ripped it out
>     >>>> because no one was using it.  Of course, execbuffer3 might not
>     >>>>have that
>     >>>> problem at all.
>     >>>>
>     >>>
>     >>>Thanks Jason.
>     >>>Ok, I am not sure which exec flag is that, but yah, execbuffer3
>     probably
>     >>>will not have this limiation. So, we need to define a
>     VM_BIND_MAX_QUEUE
>     >>>and somehow export it to user (I am thinking of embedding it in
>     >>>I915_PARAM_HAS_VM_BIND. bits[0]->HAS_VM_BIND, bits[1-3]->'n'
>     meaning 2^n
>     >>>queues.
>     >>
>     >>Ah, I think you are waking about I915_EXEC_RING_MASK (0x3f)
>     which execbuf3
>
>
> Yup!  That's exactly the limit I was talking about.
>
>     >>will also have. So, we can simply define in vm_bind/unbind
>     structures,
>     >>
>     >>#define I915_VM_BIND_MAX_QUEUE   64
>     >>        __u32 queue;
>     >>
>     >>I think that will keep things simple.
>     >
>     >Hmmm? What does execbuf2 limit has to do with how many engines
>     >hardware can have? I suggest not to do that.
>     >
>     >Change with added this:
>     >
>     >       if (set.num_engines > I915_EXEC_RING_MASK + 1)
>     >               return -EINVAL;
>     >
>     >To context creation needs to be undone and so let users create
>     engine
>     >maps with all hardware engines, and let execbuf3 access them all.
>     >
>
>     Earlier plan was to carry I915_EXEC_RING_MAP (0x3f) to execbuff3 also.
>     Hence, I was using the same limit for VM_BIND queues (64, or 65 if we
>     make it N+1).
>     But, as discussed in other thread of this RFC series, we are planning
>     to drop this I915_EXEC_RING_MAP in execbuff3. So, there won't be
>     any uapi that limits the number of engines (and hence the vm_bind
>     queues
>     need to be supported).
>
>     If we leave the number of vm_bind queues to be arbitrarily large
>     (__u32 queue_idx) then, we need to have a hashmap for queue (a wq,
>     work_item and a linked list) lookup from the user specified queue
>     index.
>     Other option is to just put some hard limit (say 64 or 65) and use
>     an array of queues in VM (each created upon first use). I prefer this.
>
>
> I don't get why a VM_BIND queue is any different from any other queue 
> or userspace-visible kernel object.  But I'll leave those details up 
> to danvet or whoever else might be reviewing the implementation.
>
> --Jason


I kind of agree here. Wouldn't be simpler to have the bind queue created 
like the others when we build the engine map?

For userspace it's then just matter of selecting the right queue ID when 
submitting.

If there is ever a possibility to have this work on the GPU, it would be 
all ready.


Thanks,


-Lionel


>
>
>     Niranjana
>
>     >Regards,
>     >
>     >Tvrtko
>     >
>     >>
>     >>Niranjana
>     >>
>     >>>
>     >>>>   I am trying to see how many queues we need and don't want
>     it to be
>     >>>>   arbitrarily
>     >>>>   large and unduely blow up memory usage and complexity in
>     i915 driver.
>     >>>>
>     >>>> I expect a Vulkan driver to use at most 2 in the vast majority
>     >>>>of cases. I
>     >>>> could imagine a client wanting to create more than 1 sparse
>     >>>>queue in which
>     >>>> case, it'll be N+1 but that's unlikely.  As far as complexity
>     >>>>goes, once
>     >>>> you allow two, I don't think the complexity is going up by
>     >>>>allowing N.  As
>     >>>> for memory usage, creating more queues means more memory. 
>     That's a
>     >>>> trade-off that userspace can make.  Again, the expected number
>     >>>>here is 1
>     >>>> or 2 in the vast majority of cases so I don't think you need
>     to worry.
>     >>>
>     >>>Ok, will start with n=3 meaning 8 queues.
>     >>>That would require us create 8 workqueues.
>     >>>We can change 'n' later if required.
>     >>>
>     >>>Niranjana
>     >>>
>     >>>>
>     >>>>   >     Why?  Because Vulkan has two basic kind of bind
>     >>>>operations and we
>     >>>>   don't
>     >>>>   >     want any dependencies between them:
>     >>>>   >      1. Immediate.  These happen right after BO creation or
>     >>>>maybe as
>     >>>>   part of
>     >>>>   >     vkBindImageMemory() or VkBindBufferMemory().  These
>     >>>>don't happen
>     >>>>   on a
>     >>>>   >     queue and we don't want them serialized with
>     anything.  To
>     >>>>   synchronize
>     >>>>   >     with submit, we'll have a syncobj in the VkDevice
>     which is
>     >>>>   signaled by
>     >>>>   >     all immediate bind operations and make submits wait
>     on it.
>     >>>>   >      2. Queued (sparse): These happen on a VkQueue which
>     may be the
>     >>>>   same as
>     >>>>   >     a render/compute queue or may be its own queue.  It's
>     up to us
>     >>>>   what we
>     >>>>   >     want to advertise.  From the Vulkan API PoV, this is
>     like any
>     >>>>   other
>     >>>>   >     queue.  Operations on it wait on and signal
>     semaphores.  If we
>     >>>>   have a
>     >>>>   >     VM_BIND engine, we'd provide syncobjs to wait and
>     >>>>signal just like
>     >>>>   we do
>     >>>>   >     in execbuf().
>     >>>>   >     The important thing is that we don't want one type of
>     >>>>operation to
>     >>>>   block
>     >>>>   >     on the other.  If immediate binds are blocking on
>     sparse binds,
>     >>>>   it's
>     >>>>   >     going to cause over-synchronization issues.
>     >>>>   >     In terms of the internal implementation, I know that
>     >>>>there's going
>     >>>>   to be
>     >>>>   >     a lock on the VM and that we can't actually do these
>     things in
>     >>>>   >     parallel.  That's fine.  Once the dma_fences have
>     signaled and
>     >>>>   we're
>     >>>>
>     >>>>   Thats correct. It is like a single VM_BIND engine with
>     >>>>multiple queues
>     >>>>   feeding to it.
>     >>>>
>     >>>> Right.  As long as the queues themselves are independent and
>     >>>>can block on
>     >>>> dma_fences without holding up other queues, I think we're fine.
>     >>>>
>     >>>>   >     unblocked to do the bind operation, I don't care if
>     >>>>there's a bit
>     >>>>   of
>     >>>>   >     synchronization due to locking. That's expected.  What
>     >>>>we can't
>     >>>>   afford
>     >>>>   >     to have is an immediate bind operation suddenly
>     blocking on a
>     >>>>   sparse
>     >>>>   >     operation which is blocked on a compute job that's
>     going to run
>     >>>>   for
>     >>>>   >     another 5ms.
>     >>>>
>     >>>>   As the VM_BIND queue is per VM, VM_BIND on one VM doesn't
>     block the
>     >>>>   VM_BIND
>     >>>>   on other VMs. I am not sure about usecases here, but just
>     wanted to
>     >>>>   clarify.
>     >>>>
>     >>>> Yes, that's what I would expect.
>     >>>> --Jason
>     >>>>
>     >>>>   Niranjana
>     >>>>
>     >>>>   >     For reference, Windows solves this by allowing
>     arbitrarily many
>     >>>>   paging
>     >>>>   >     queues (what they call a VM_BIND engine/queue).  That
>     >>>>design works
>     >>>>   >     pretty well and solves the problems in question.
>     >>>>Again, we could
>     >>>>   just
>     >>>>   >     make everything out-of-order and require using syncobjs
>     >>>>to order
>     >>>>   things
>     >>>>   >     as userspace wants. That'd be fine too.
>     >>>>   >     One more note while I'm here: danvet said something on
>     >>>>IRC about
>     >>>>   VM_BIND
>     >>>>   >     queues waiting for syncobjs to materialize.  We don't
>     really
>     >>>>   want/need
>     >>>>   >     this.  We already have all the machinery in userspace
>     to handle
>     >>>>   >     wait-before-signal and waiting for syncobj fences to
>     >>>>materialize
>     >>>>   and
>     >>>>   >     that machinery is on by default.  It would actually
>     >>>>take MORE work
>     >>>>   in
>     >>>>   >     Mesa to turn it off and take advantage of the kernel
>     >>>>being able to
>     >>>>   wait
>     >>>>   >     for syncobjs to materialize. Also, getting that right is
>     >>>>   ridiculously
>     >>>>   >     hard and I really don't want to get it wrong in kernel
>     >>>>space.     When we
>     >>>>   >     do memory fences, wait-before-signal will be a
>     thing.  We don't
>     >>>>   need to
>     >>>>   >     try and make it a thing for syncobj.
>     >>>>   >     --Jason
>     >>>>   >
>     >>>>   >   Thanks Jason,
>     >>>>   >
>     >>>>   >   I missed the bit in the Vulkan spec that we're allowed
>     to have a
>     >>>>   sparse
>     >>>>   >   queue that does not implement either graphics or compute
>     >>>>operations
>     >>>>   :
>     >>>>   >
>     >>>>   >     "While some implementations may include
>     >>>>   VK_QUEUE_SPARSE_BINDING_BIT
>     >>>>   >     support in queue families that also include
>     >>>>   >
>     >>>>   >      graphics and compute support, other implementations
>     may only
>     >>>>   expose a
>     >>>>   >     VK_QUEUE_SPARSE_BINDING_BIT-only queue
>     >>>>   >
>     >>>>   >      family."
>     >>>>   >
>     >>>>   >   So it can all be all a vm_bind engine that just does
>     bind/unbind
>     >>>>   >   operations.
>     >>>>   >
>     >>>>   >   But yes we need another engine for the immediate/non-sparse
>     >>>>   operations.
>     >>>>   >
>     >>>>   >   -Lionel
>     >>>>   >
>     >>>>   >         >
>     >>>>   >       Daniel, any thoughts?
>     >>>>   >
>     >>>>   >       Niranjana
>     >>>>   >
>     >>>>   >       >Matt
>     >>>>   >       >
>     >>>>   >       >>
>     >>>>   >       >> Sorry I noticed this late.
>     >>>>   >       >>
>     >>>>   >       >>
>     >>>>   >       >> -Lionel
>     >>>>   >       >>
>     >>>>   >       >>
>

--------------QtZtyOAemP00vsXfCK0kGkfq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 09/06/2022 00:55, Jason Ekstrand
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOFGe97UDd2S+LdKeOWubFvc4cNy6KbRTtCPKUbwd8PnZPuvMQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jun 8, 2022 at 4:44
            PM Niranjana Vishwanathapura &lt;<a
              href="mailto:niranjana.vishwanathapura@intel.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">niranjana.vishwanathapura@intel.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Wed, Jun 08, 2022 at
            08:33:25AM +0100, Tvrtko Ursulin wrote:<br>
            &gt;<br>
            &gt;<br>
            &gt;On 07/06/2022 22:32, Niranjana Vishwanathapura wrote:<br>
            &gt;&gt;On Tue, Jun 07, 2022 at 11:18:11AM -0700, Niranjana
            Vishwanathapura wrote:<br>
            &gt;&gt;&gt;On Tue, Jun 07, 2022 at 12:12:03PM -0500, Jason
            Ekstrand wrote:<br>
            &gt;&gt;&gt;&gt; On Fri, Jun 3, 2022 at 6:52 PM Niranjana
            Vishwanathapura<br>
            &gt;&gt;&gt;&gt; &lt;<a
              href="mailto:niranjana.vishwanathapura@intel.com"
              target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">niranjana.vishwanathapura@intel.com</a>&gt;
            wrote:<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   On Fri, Jun 03, 2022 at 10:20:25AM +0300,
            Lionel Landwerlin wrote:<br>
            &gt;&gt;&gt;&gt;   &gt;   On 02/06/2022 23:35, Jason
            Ekstrand wrote:<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;     On Thu, Jun 2, 2022 at 3:11 PM
            Niranjana Vishwanathapura<br>
            &gt;&gt;&gt;&gt;   &gt;     &lt;<a
              href="mailto:niranjana.vishwanathapura@intel.com"
              target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">niranjana.vishwanathapura@intel.com</a>&gt;
            wrote:<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       On Wed, Jun 01, 2022 at
            01:28:36PM -0700, Matthew <br>
            &gt;&gt;&gt;&gt;Brost wrote:<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;On Wed, Jun 01, 2022 at
            05:25:49PM +0300, Lionel Landwerlin<br>
            &gt;&gt;&gt;&gt;   wrote:<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; On 17/05/2022 21:32,
            Niranjana Vishwanathapura wrote:<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; &gt; +VM_BIND/UNBIND
            ioctl will immediately start<br>
            &gt;&gt;&gt;&gt;   binding/unbinding<br>
            &gt;&gt;&gt;&gt;   &gt;       the mapping in an<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; &gt; +async worker.
            The binding and unbinding will <br>
            &gt;&gt;&gt;&gt;work like a<br>
            &gt;&gt;&gt;&gt;   special<br>
            &gt;&gt;&gt;&gt;   &gt;       GPU engine.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; &gt; +The binding and
            unbinding operations are serialized and<br>
            &gt;&gt;&gt;&gt;   will<br>
            &gt;&gt;&gt;&gt;   &gt;       wait on specified<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; &gt; +input fences
            before the operation and will signal the<br>
            &gt;&gt;&gt;&gt;   output<br>
            &gt;&gt;&gt;&gt;   &gt;       fences upon the<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; &gt; +completion of
            the operation. Due to serialization,<br>
            &gt;&gt;&gt;&gt;   completion of<br>
            &gt;&gt;&gt;&gt;   &gt;       an operation<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; &gt; +will also
            indicate that all previous operations <br>
            &gt;&gt;&gt;&gt;are also<br>
            &gt;&gt;&gt;&gt;   &gt;       complete.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; I guess we should
            avoid saying "will immediately start<br>
            &gt;&gt;&gt;&gt;   &gt;       binding/unbinding" if<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; there are fences
            involved.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; And the fact that
            it's happening in an async <br>
            &gt;&gt;&gt;&gt;worker seem to<br>
            &gt;&gt;&gt;&gt;   imply<br>
            &gt;&gt;&gt;&gt;   &gt;       it's not<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; immediate.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       Ok, will fix.<br>
            &gt;&gt;&gt;&gt;   &gt;       This was added because in
            earlier design binding was deferred<br>
            &gt;&gt;&gt;&gt;   until<br>
            &gt;&gt;&gt;&gt;   &gt;       next execbuff.<br>
            &gt;&gt;&gt;&gt;   &gt;       But now it is non-deferred
            (immediate in that sense). <br>
            &gt;&gt;&gt;&gt;But yah,<br>
            &gt;&gt;&gt;&gt;   this is<br>
            &gt;&gt;&gt;&gt;   &gt;       confusing<br>
            &gt;&gt;&gt;&gt;   &gt;       and will fix it.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; I have a question on
            the behavior of the bind <br>
            &gt;&gt;&gt;&gt;operation when<br>
            &gt;&gt;&gt;&gt;   no<br>
            &gt;&gt;&gt;&gt;   &gt;       input fence<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; is provided. Let say
            I do :<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; VM_BIND
            (out_fence=fence1)<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; VM_BIND
            (out_fence=fence2)<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; VM_BIND
            (out_fence=fence3)<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; In what order are the
            fences going to be signaled?<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; In the order of
            VM_BIND ioctls? Or out of order?<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; Because you wrote
            "serialized I assume it's : in order<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       Yes, in the order of
            VM_BIND/UNBIND ioctls. Note that <br>
            &gt;&gt;&gt;&gt;bind and<br>
            &gt;&gt;&gt;&gt;   unbind<br>
            &gt;&gt;&gt;&gt;   &gt;       will use<br>
            &gt;&gt;&gt;&gt;   &gt;       the same queue and hence are
            ordered.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; One thing I didn't
            realize is that because we only get one<br>
            &gt;&gt;&gt;&gt;   &gt;       "VM_BIND" engine,<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; there is a disconnect
            from the Vulkan specification.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; In Vulkan VM_BIND
            operations are serialized but <br>
            &gt;&gt;&gt;&gt;per engine.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; So you could have
            something like this :<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; VM_BIND (engine=rcs0,
            in_fence=fence1, out_fence=fence2)<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; VM_BIND (engine=ccs0,
            in_fence=fence3, out_fence=fence4)<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; fence1 is not
            signaled<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; fence3 is signaled<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; So the second VM_BIND
            will proceed before the <br>
            &gt;&gt;&gt;&gt;first VM_BIND.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; I guess we can deal
            with that scenario in <br>
            &gt;&gt;&gt;&gt;userspace by doing<br>
            &gt;&gt;&gt;&gt;   the<br>
            &gt;&gt;&gt;&gt;   &gt;       wait<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; ourselves in one
            thread per engines.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; But then it makes the
            VM_BIND input fences useless.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; Daniel : what do you
            think? Should be rework this or just<br>
            &gt;&gt;&gt;&gt;   deal with<br>
            &gt;&gt;&gt;&gt;   &gt;       wait<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; fences in userspace?<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;My opinion is rework this
            but make the ordering via <br>
            &gt;&gt;&gt;&gt;an engine<br>
            &gt;&gt;&gt;&gt;   param<br>
            &gt;&gt;&gt;&gt;   &gt;       optional.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;e.g. A VM can be
            configured so all binds are ordered <br>
            &gt;&gt;&gt;&gt;within the<br>
            &gt;&gt;&gt;&gt;   VM<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;e.g. A VM can be
            configured so all binds accept an engine<br>
            &gt;&gt;&gt;&gt;   argument<br>
            &gt;&gt;&gt;&gt;   &gt;       (in<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;the case of the i915
            likely this is a gem context <br>
            &gt;&gt;&gt;&gt;handle) and<br>
            &gt;&gt;&gt;&gt;   binds<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;ordered with respect to
            that engine.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;This gives UMDs options as
            the later likely consumes <br>
            &gt;&gt;&gt;&gt;more KMD<br>
            &gt;&gt;&gt;&gt;   &gt;       resources<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;so if a different UMD can
            live with binds being <br>
            &gt;&gt;&gt;&gt;ordered within<br>
            &gt;&gt;&gt;&gt;   the VM<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;they can use a mode
            consuming less resources.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       I think we need to be careful
            here if we are looking for some<br>
            &gt;&gt;&gt;&gt;   out of<br>
            &gt;&gt;&gt;&gt;   &gt;       (submission) order completion
            of vm_bind/unbind.<br>
            &gt;&gt;&gt;&gt;   &gt;       In-order completion means, in
            a batch of binds and <br>
            &gt;&gt;&gt;&gt;unbinds to be<br>
            &gt;&gt;&gt;&gt;   &gt;       completed in-order, user only
            needs to specify <br>
            &gt;&gt;&gt;&gt;in-fence for the<br>
            &gt;&gt;&gt;&gt;   &gt;       first bind/unbind call and the
            our-fence for the last<br>
            &gt;&gt;&gt;&gt;   bind/unbind<br>
            &gt;&gt;&gt;&gt;   &gt;       call. Also, the VA released by
            an unbind call can be <br>
            &gt;&gt;&gt;&gt;re-used by<br>
            &gt;&gt;&gt;&gt;   &gt;       any subsequent bind call in
            that in-order batch.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       These things will break if
            binding/unbinding were to <br>
            &gt;&gt;&gt;&gt;be allowed<br>
            &gt;&gt;&gt;&gt;   to<br>
            &gt;&gt;&gt;&gt;   &gt;       go out of order (of
            submission) and user need to be extra<br>
            &gt;&gt;&gt;&gt;   careful<br>
            &gt;&gt;&gt;&gt;   &gt;       not to run into pre-mature
            triggereing of out-fence and bind<br>
            &gt;&gt;&gt;&gt;   failing<br>
            &gt;&gt;&gt;&gt;   &gt;       as VA is still in use etc.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       Also, VM_BIND binds the
            provided mapping on the specified<br>
            &gt;&gt;&gt;&gt;   address<br>
            &gt;&gt;&gt;&gt;   &gt;       space<br>
            &gt;&gt;&gt;&gt;   &gt;       (VM). So, the uapi is not
            engine/context specific.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       We can however add a 'queue'
            to the uapi which can be <br>
            &gt;&gt;&gt;&gt;one from<br>
            &gt;&gt;&gt;&gt;   the<br>
            &gt;&gt;&gt;&gt;   &gt;       pre-defined queues,<br>
            &gt;&gt;&gt;&gt;   &gt;       I915_VM_BIND_QUEUE_0<br>
            &gt;&gt;&gt;&gt;   &gt;       I915_VM_BIND_QUEUE_1<br>
            &gt;&gt;&gt;&gt;   &gt;       ...<br>
            &gt;&gt;&gt;&gt;   &gt;       I915_VM_BIND_QUEUE_(N-1)<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       KMD will spawn an async work
            queue for each queue which will<br>
            &gt;&gt;&gt;&gt;   only<br>
            &gt;&gt;&gt;&gt;   &gt;       bind the mappings on that
            queue in the order of submission.<br>
            &gt;&gt;&gt;&gt;   &gt;       User can assign the queue to
            per engine or anything <br>
            &gt;&gt;&gt;&gt;like that.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       But again here, user need to
            be careful and not <br>
            &gt;&gt;&gt;&gt;deadlock these<br>
            &gt;&gt;&gt;&gt;   &gt;       queues with circular
            dependency of fences.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       I prefer adding this later an
            as extension based on <br>
            &gt;&gt;&gt;&gt;whether it<br>
            &gt;&gt;&gt;&gt;   &gt;       is really helping with the
            implementation.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;     I can tell you right now that
            having everything on a single<br>
            &gt;&gt;&gt;&gt;   in-order<br>
            &gt;&gt;&gt;&gt;   &gt;     queue will not get us the perf
            we want.  What vulkan <br>
            &gt;&gt;&gt;&gt;really wants<br>
            &gt;&gt;&gt;&gt;   is one<br>
            &gt;&gt;&gt;&gt;   &gt;     of two things:<br>
            &gt;&gt;&gt;&gt;   &gt;      1. No implicit ordering of
            VM_BIND ops.  They just happen in<br>
            &gt;&gt;&gt;&gt;   whatever<br>
            &gt;&gt;&gt;&gt;   &gt;     their dependencies are resolved
            and we ensure ordering <br>
            &gt;&gt;&gt;&gt;ourselves<br>
            &gt;&gt;&gt;&gt;   by<br>
            &gt;&gt;&gt;&gt;   &gt;     having a syncobj in the VkQueue.<br>
            &gt;&gt;&gt;&gt;   &gt;      2. The ability to create
            multiple VM_BIND queues.  We need at<br>
            &gt;&gt;&gt;&gt;   least 2<br>
            &gt;&gt;&gt;&gt;   &gt;     but I don't see why there needs
            to be a limit besides <br>
            &gt;&gt;&gt;&gt;the limits<br>
            &gt;&gt;&gt;&gt;   the<br>
            &gt;&gt;&gt;&gt;   &gt;     i915 API already has on the
            number of engines.  Vulkan could<br>
            &gt;&gt;&gt;&gt;   expose<br>
            &gt;&gt;&gt;&gt;   &gt;     multiple sparse binding queues
            to the client if it's not<br>
            &gt;&gt;&gt;&gt;   arbitrarily<br>
            &gt;&gt;&gt;&gt;   &gt;     limited.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   Thanks Jason, Lionel.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   Jason, what are you referring to when you
            say "limits the i915 API<br>
            &gt;&gt;&gt;&gt;   already<br>
            &gt;&gt;&gt;&gt;   has on the number of engines"? I am not
            sure if there is such an uapi<br>
            &gt;&gt;&gt;&gt;   today.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; There's a limit of something like 64 total
            engines today based on the<br>
            &gt;&gt;&gt;&gt; number of bits we can cram into the exec
            flags in execbuffer2.  I think<br>
            &gt;&gt;&gt;&gt; someone had an extended version that
            allowed more but I ripped it out<br>
            &gt;&gt;&gt;&gt; because no one was using it.  Of course,
            execbuffer3 might not <br>
            &gt;&gt;&gt;&gt;have that<br>
            &gt;&gt;&gt;&gt; problem at all.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;Thanks Jason.<br>
            &gt;&gt;&gt;Ok, I am not sure which exec flag is that, but
            yah, execbuffer3 probably<br>
            &gt;&gt;&gt;will not have this limiation. So, we need to
            define a VM_BIND_MAX_QUEUE<br>
            &gt;&gt;&gt;and somehow export it to user (I am thinking of
            embedding it in<br>
            &gt;&gt;&gt;I915_PARAM_HAS_VM_BIND. bits[0]-&gt;HAS_VM_BIND,
            bits[1-3]-&gt;'n' meaning 2^n<br>
            &gt;&gt;&gt;queues.<br>
            &gt;&gt;<br>
            &gt;&gt;Ah, I think you are waking about I915_EXEC_RING_MASK
            (0x3f) which execbuf3<br>
          </blockquote>
          <div><br>
          </div>
          <div>Yup!  That's exactly the limit I was talking about.<br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt;&gt;will also have. So, we can simply define in
            vm_bind/unbind structures,<br>
            &gt;&gt;<br>
            &gt;&gt;#define I915_VM_BIND_MAX_QUEUE   64<br>
            &gt;&gt;        __u32 queue;<br>
            &gt;&gt;<br>
            &gt;&gt;I think that will keep things simple.<br>
            &gt;<br>
            &gt;Hmmm? What does execbuf2 limit has to do with how many
            engines <br>
            &gt;hardware can have? I suggest not to do that.<br>
            &gt;<br>
            &gt;Change with added this:<br>
            &gt;<br>
            &gt;       if (set.num_engines &gt; I915_EXEC_RING_MASK + 1)<br>
            &gt;               return -EINVAL;<br>
            &gt;<br>
            &gt;To context creation needs to be undone and so let users
            create engine <br>
            &gt;maps with all hardware engines, and let execbuf3 access
            them all.<br>
            &gt;<br>
            <br>
            Earlier plan was to carry I915_EXEC_RING_MAP (0x3f) to
            execbuff3 also.<br>
            Hence, I was using the same limit for VM_BIND queues (64, or
            65 if we<br>
            make it N+1).<br>
            But, as discussed in other thread of this RFC series, we are
            planning<br>
            to drop this I915_EXEC_RING_MAP in execbuff3. So, there
            won't be<br>
            any uapi that limits the number of engines (and hence the
            vm_bind queues<br>
            need to be supported).<br>
            <br>
            If we leave the number of vm_bind queues to be arbitrarily
            large<br>
            (__u32 queue_idx) then, we need to have a hashmap for queue
            (a wq,<br>
            work_item and a linked list) lookup from the user specified
            queue index.<br>
            Other option is to just put some hard limit (say 64 or 65)
            and use<br>
            an array of queues in VM (each created upon first use). I
            prefer this.<br>
          </blockquote>
          <div><br>
          </div>
          <div>I don't get why a VM_BIND queue is any different from any
            other queue or userspace-visible kernel object.  But I'll
            leave those details up to danvet or whoever else might be
            reviewing the implementation.</div>
          <div><br>
          </div>
          <div>--Jason</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I kind of agree here. Wouldn't be simpler to have the bind queue
      created like the others when we build the engine map?</p>
    <p>For userspace it's then just matter of selecting the right queue
      ID when submitting.</p>
    <p>If there is ever a possibility to have this work on the GPU, it
      would be all ready.</p>
    <p><br>
    </p>
    <p>Thanks,<br>
    </p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAOFGe97UDd2S+LdKeOWubFvc4cNy6KbRTtCPKUbwd8PnZPuvMQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Niranjana<br>
            <br>
            &gt;Regards,<br>
            &gt;<br>
            &gt;Tvrtko<br>
            &gt;<br>
            &gt;&gt;<br>
            &gt;&gt;Niranjana<br>
            &gt;&gt;<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   I am trying to see how many queues we
            need and don't want it to be<br>
            &gt;&gt;&gt;&gt;   arbitrarily<br>
            &gt;&gt;&gt;&gt;   large and unduely blow up memory usage
            and complexity in i915 driver.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; I expect a Vulkan driver to use at most 2
            in the vast majority <br>
            &gt;&gt;&gt;&gt;of cases. I<br>
            &gt;&gt;&gt;&gt; could imagine a client wanting to create
            more than 1 sparse <br>
            &gt;&gt;&gt;&gt;queue in which<br>
            &gt;&gt;&gt;&gt; case, it'll be N+1 but that's unlikely.  As
            far as complexity <br>
            &gt;&gt;&gt;&gt;goes, once<br>
            &gt;&gt;&gt;&gt; you allow two, I don't think the complexity
            is going up by <br>
            &gt;&gt;&gt;&gt;allowing N.  As<br>
            &gt;&gt;&gt;&gt; for memory usage, creating more queues
            means more memory.  That's a<br>
            &gt;&gt;&gt;&gt; trade-off that userspace can make.  Again,
            the expected number <br>
            &gt;&gt;&gt;&gt;here is 1<br>
            &gt;&gt;&gt;&gt; or 2 in the vast majority of cases so I
            don't think you need to worry.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;Ok, will start with n=3 meaning 8 queues.<br>
            &gt;&gt;&gt;That would require us create 8 workqueues.<br>
            &gt;&gt;&gt;We can change 'n' later if required.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;Niranjana<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;     Why?  Because Vulkan has two
            basic kind of bind <br>
            &gt;&gt;&gt;&gt;operations and we<br>
            &gt;&gt;&gt;&gt;   don't<br>
            &gt;&gt;&gt;&gt;   &gt;     want any dependencies between
            them:<br>
            &gt;&gt;&gt;&gt;   &gt;      1. Immediate.  These happen
            right after BO creation or <br>
            &gt;&gt;&gt;&gt;maybe as<br>
            &gt;&gt;&gt;&gt;   part of<br>
            &gt;&gt;&gt;&gt;   &gt;     vkBindImageMemory() or
            VkBindBufferMemory().  These <br>
            &gt;&gt;&gt;&gt;don't happen<br>
            &gt;&gt;&gt;&gt;   on a<br>
            &gt;&gt;&gt;&gt;   &gt;     queue and we don't want them
            serialized with anything.  To<br>
            &gt;&gt;&gt;&gt;   synchronize<br>
            &gt;&gt;&gt;&gt;   &gt;     with submit, we'll have a
            syncobj in the VkDevice which is<br>
            &gt;&gt;&gt;&gt;   signaled by<br>
            &gt;&gt;&gt;&gt;   &gt;     all immediate bind operations
            and make submits wait on it.<br>
            &gt;&gt;&gt;&gt;   &gt;      2. Queued (sparse): These
            happen on a VkQueue which may be the<br>
            &gt;&gt;&gt;&gt;   same as<br>
            &gt;&gt;&gt;&gt;   &gt;     a render/compute queue or may be
            its own queue.  It's up to us<br>
            &gt;&gt;&gt;&gt;   what we<br>
            &gt;&gt;&gt;&gt;   &gt;     want to advertise.  From the
            Vulkan API PoV, this is like any<br>
            &gt;&gt;&gt;&gt;   other<br>
            &gt;&gt;&gt;&gt;   &gt;     queue.  Operations on it wait on
            and signal semaphores.  If we<br>
            &gt;&gt;&gt;&gt;   have a<br>
            &gt;&gt;&gt;&gt;   &gt;     VM_BIND engine, we'd provide
            syncobjs to wait and <br>
            &gt;&gt;&gt;&gt;signal just like<br>
            &gt;&gt;&gt;&gt;   we do<br>
            &gt;&gt;&gt;&gt;   &gt;     in execbuf().<br>
            &gt;&gt;&gt;&gt;   &gt;     The important thing is that we
            don't want one type of <br>
            &gt;&gt;&gt;&gt;operation to<br>
            &gt;&gt;&gt;&gt;   block<br>
            &gt;&gt;&gt;&gt;   &gt;     on the other.  If immediate
            binds are blocking on sparse binds,<br>
            &gt;&gt;&gt;&gt;   it's<br>
            &gt;&gt;&gt;&gt;   &gt;     going to cause
            over-synchronization issues.<br>
            &gt;&gt;&gt;&gt;   &gt;     In terms of the internal
            implementation, I know that <br>
            &gt;&gt;&gt;&gt;there's going<br>
            &gt;&gt;&gt;&gt;   to be<br>
            &gt;&gt;&gt;&gt;   &gt;     a lock on the VM and that we
            can't actually do these things in<br>
            &gt;&gt;&gt;&gt;   &gt;     parallel.  That's fine.  Once
            the dma_fences have signaled and<br>
            &gt;&gt;&gt;&gt;   we're<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   Thats correct. It is like a single
            VM_BIND engine with <br>
            &gt;&gt;&gt;&gt;multiple queues<br>
            &gt;&gt;&gt;&gt;   feeding to it.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; Right.  As long as the queues themselves
            are independent and <br>
            &gt;&gt;&gt;&gt;can block on<br>
            &gt;&gt;&gt;&gt; dma_fences without holding up other queues,
            I think we're fine.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;     unblocked to do the bind
            operation, I don't care if <br>
            &gt;&gt;&gt;&gt;there's a bit<br>
            &gt;&gt;&gt;&gt;   of<br>
            &gt;&gt;&gt;&gt;   &gt;     synchronization due to locking. 
            That's expected.  What <br>
            &gt;&gt;&gt;&gt;we can't<br>
            &gt;&gt;&gt;&gt;   afford<br>
            &gt;&gt;&gt;&gt;   &gt;     to have is an immediate bind
            operation suddenly blocking on a<br>
            &gt;&gt;&gt;&gt;   sparse<br>
            &gt;&gt;&gt;&gt;   &gt;     operation which is blocked on a
            compute job that's going to run<br>
            &gt;&gt;&gt;&gt;   for<br>
            &gt;&gt;&gt;&gt;   &gt;     another 5ms.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   As the VM_BIND queue is per VM, VM_BIND
            on one VM doesn't block the<br>
            &gt;&gt;&gt;&gt;   VM_BIND<br>
            &gt;&gt;&gt;&gt;   on other VMs. I am not sure about
            usecases here, but just wanted to<br>
            &gt;&gt;&gt;&gt;   clarify.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; Yes, that's what I would expect.<br>
            &gt;&gt;&gt;&gt; --Jason<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   Niranjana<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;     For reference, Windows solves
            this by allowing arbitrarily many<br>
            &gt;&gt;&gt;&gt;   paging<br>
            &gt;&gt;&gt;&gt;   &gt;     queues (what they call a VM_BIND
            engine/queue).  That <br>
            &gt;&gt;&gt;&gt;design works<br>
            &gt;&gt;&gt;&gt;   &gt;     pretty well and solves the
            problems in question.  <br>
            &gt;&gt;&gt;&gt;Again, we could<br>
            &gt;&gt;&gt;&gt;   just<br>
            &gt;&gt;&gt;&gt;   &gt;     make everything out-of-order and
            require using syncobjs <br>
            &gt;&gt;&gt;&gt;to order<br>
            &gt;&gt;&gt;&gt;   things<br>
            &gt;&gt;&gt;&gt;   &gt;     as userspace wants. That'd be
            fine too.<br>
            &gt;&gt;&gt;&gt;   &gt;     One more note while I'm here:
            danvet said something on <br>
            &gt;&gt;&gt;&gt;IRC about<br>
            &gt;&gt;&gt;&gt;   VM_BIND<br>
            &gt;&gt;&gt;&gt;   &gt;     queues waiting for syncobjs to
            materialize.  We don't really<br>
            &gt;&gt;&gt;&gt;   want/need<br>
            &gt;&gt;&gt;&gt;   &gt;     this.  We already have all the
            machinery in userspace to handle<br>
            &gt;&gt;&gt;&gt;   &gt;     wait-before-signal and waiting
            for syncobj fences to <br>
            &gt;&gt;&gt;&gt;materialize<br>
            &gt;&gt;&gt;&gt;   and<br>
            &gt;&gt;&gt;&gt;   &gt;     that machinery is on by
            default.  It would actually <br>
            &gt;&gt;&gt;&gt;take MORE work<br>
            &gt;&gt;&gt;&gt;   in<br>
            &gt;&gt;&gt;&gt;   &gt;     Mesa to turn it off and take
            advantage of the kernel <br>
            &gt;&gt;&gt;&gt;being able to<br>
            &gt;&gt;&gt;&gt;   wait<br>
            &gt;&gt;&gt;&gt;   &gt;     for syncobjs to materialize. 
            Also, getting that right is<br>
            &gt;&gt;&gt;&gt;   ridiculously<br>
            &gt;&gt;&gt;&gt;   &gt;     hard and I really don't want to
            get it wrong in kernel <br>
            &gt;&gt;&gt;&gt;space.     When we<br>
            &gt;&gt;&gt;&gt;   &gt;     do memory fences,
            wait-before-signal will be a thing.  We don't<br>
            &gt;&gt;&gt;&gt;   need to<br>
            &gt;&gt;&gt;&gt;   &gt;     try and make it a thing for
            syncobj.<br>
            &gt;&gt;&gt;&gt;   &gt;     --Jason<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;   Thanks Jason,<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;   I missed the bit in the Vulkan
            spec that we're allowed to have a<br>
            &gt;&gt;&gt;&gt;   sparse<br>
            &gt;&gt;&gt;&gt;   &gt;   queue that does not implement
            either graphics or compute <br>
            &gt;&gt;&gt;&gt;operations<br>
            &gt;&gt;&gt;&gt;   :<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;     "While some implementations may
            include<br>
            &gt;&gt;&gt;&gt;   VK_QUEUE_SPARSE_BINDING_BIT<br>
            &gt;&gt;&gt;&gt;   &gt;     support in queue families that
            also include<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;      graphics and compute support,
            other implementations may only<br>
            &gt;&gt;&gt;&gt;   expose a<br>
            &gt;&gt;&gt;&gt;   &gt;     VK_QUEUE_SPARSE_BINDING_BIT-only
            queue<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;      family."<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;   So it can all be all a vm_bind
            engine that just does bind/unbind<br>
            &gt;&gt;&gt;&gt;   &gt;   operations.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;   But yes we need another engine for
            the immediate/non-sparse<br>
            &gt;&gt;&gt;&gt;   operations.<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;   -Lionel<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;         &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       Daniel, any thoughts?<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       Niranjana<br>
            &gt;&gt;&gt;&gt;   &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;Matt<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; Sorry I noticed this
            late.<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt; -Lionel<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
            &gt;&gt;&gt;&gt;   &gt;       &gt;&gt;<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------QtZtyOAemP00vsXfCK0kGkfq--
