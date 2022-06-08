Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBDD543EE7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6633810FE53;
	Wed,  8 Jun 2022 21:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D8C10FE53
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:55:50 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id p13so38760248ybm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cJVBOdmsN6f3z8ci8C2aFiGa9xLfEjM1kOXTi5SCP8M=;
 b=h5vGYooJ/IBbiuKXHtrhlj87nQdK51DG8ynxjGQc977YC+mqXPVA5ilt6n76vS+g5F
 Gm4QU0RbalcuJ/vtlqcQv+0umXet+vqQcgJP2ZSB065rqRukCbZeXDwyEnWyk9fVsB/2
 NLySFhoO1c805Fdf6Uoq7SNs0POZDRZh4/9LqcESHdmicgGhAoQmjWRGDFtNvBB8hJeN
 YTG6EP2S0q94qSjGBxjgdsunl3VRMyCNcN10yPusjfqIFvgjqFbjAzWnbVGhKG8gOCbO
 CJ/oidvbb0XffGLatE3Sbk2cG1EWIYeeEoh0G+sRoNctSIJ5r6BMw3McuH+ONuq84oFB
 ukGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cJVBOdmsN6f3z8ci8C2aFiGa9xLfEjM1kOXTi5SCP8M=;
 b=JronhTQoUpsHO3sG/qugIoYXQTBbjLW7wJ3TRNWZxOptAIsY0xYE7EekwrXHI1wvy8
 nMcH7Eu6DWxEs+uDqOtuesZWLoCCgiefSzeg5JVS7r8AZASGhPj2uiu1HkMEa5b6F6XM
 ndZaKEtRc9ZXX/tONw3GkVoH2fXT81nHKBBTn9Z3iF2DXK5X+sPdRCZP6GAplgGR4BJ5
 4C4IyoUEslicUWDzckE4ELGWQxCCDbkDYYn3kiW5D0A30xTBaIIxAoY9ryH3LiN2dUgC
 VJVr7dZJjqMURxNWMzrmUH3uSfziYzpqptAxr6aGJ1LL4iupyGGc7CqAo0XcQIL9yyIx
 RVXg==
X-Gm-Message-State: AOAM5318vyyTCZ6z3H4hz99m1OrAXlgShfxsqkcThdHW8rAJiwqnqTuD
 9rAm9AzINlIY9jC+1pK/IVqsV6FkSMiDUsqvMzzSyA==
X-Google-Smtp-Source: ABdhPJxWtKUlp0jKuHj1Wf9N+Jci9TpYeHa2mgj0BmOlwyNkmoDjC1cSOVClSeDpvBaeqoFvgQTte0oBgr8TDC37M74=
X-Received: by 2002:a25:910e:0:b0:65c:caa7:52b6 with SMTP id
 v14-20020a25910e000000b0065ccaa752b6mr35178793ybl.577.1654725349109; Wed, 08
 Jun 2022 14:55:49 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <20220608214431.GD4461@nvishwa1-DESK>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 8 Jun 2022 16:55:38 -0500
Message-ID: <CAOFGe97UDd2S+LdKeOWubFvc4cNy6KbRTtCPKUbwd8PnZPuvMQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: multipart/alternative; boundary="000000000000a2837d05e0f6c4c8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a2837d05e0f6c4c8
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:44 PM Niranjana Vishwanathapura <
niranjana.vishwanathapura@intel.com> wrote:

> On Wed, Jun 08, 2022 at 08:33:25AM +0100, Tvrtko Ursulin wrote:
> >
> >
> >On 07/06/2022 22:32, Niranjana Vishwanathapura wrote:
> >>On Tue, Jun 07, 2022 at 11:18:11AM -0700, Niranjana Vishwanathapura
> wrote:
> >>>On Tue, Jun 07, 2022 at 12:12:03PM -0500, Jason Ekstrand wrote:
> >>>> On Fri, Jun 3, 2022 at 6:52 PM Niranjana Vishwanathapura
> >>>> <niranjana.vishwanathapura@intel.com> wrote:
> >>>>
> >>>>   On Fri, Jun 03, 2022 at 10:20:25AM +0300, Lionel Landwerlin wrote:
> >>>>   >   On 02/06/2022 23:35, Jason Ekstrand wrote:
> >>>>   >
> >>>>   >     On Thu, Jun 2, 2022 at 3:11 PM Niranjana Vishwanathapura
> >>>>   >     <niranjana.vishwanathapura@intel.com> wrote:
> >>>>   >
> >>>>   >       On Wed, Jun 01, 2022 at 01:28:36PM -0700, Matthew
> >>>>Brost wrote:
> >>>>   >       >On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin
> >>>>   wrote:
> >>>>   >       >> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
> >>>>   >       >> > +VM_BIND/UNBIND ioctl will immediately start
> >>>>   binding/unbinding
> >>>>   >       the mapping in an
> >>>>   >       >> > +async worker. The binding and unbinding will
> >>>>work like a
> >>>>   special
> >>>>   >       GPU engine.
> >>>>   >       >> > +The binding and unbinding operations are serialized
> and
> >>>>   will
> >>>>   >       wait on specified
> >>>>   >       >> > +input fences before the operation and will signal the
> >>>>   output
> >>>>   >       fences upon the
> >>>>   >       >> > +completion of the operation. Due to serialization,
> >>>>   completion of
> >>>>   >       an operation
> >>>>   >       >> > +will also indicate that all previous operations
> >>>>are also
> >>>>   >       complete.
> >>>>   >       >>
> >>>>   >       >> I guess we should avoid saying "will immediately start
> >>>>   >       binding/unbinding" if
> >>>>   >       >> there are fences involved.
> >>>>   >       >>
> >>>>   >       >> And the fact that it's happening in an async
> >>>>worker seem to
> >>>>   imply
> >>>>   >       it's not
> >>>>   >       >> immediate.
> >>>>   >       >>
> >>>>   >
> >>>>   >       Ok, will fix.
> >>>>   >       This was added because in earlier design binding was
> deferred
> >>>>   until
> >>>>   >       next execbuff.
> >>>>   >       But now it is non-deferred (immediate in that sense).
> >>>>But yah,
> >>>>   this is
> >>>>   >       confusing
> >>>>   >       and will fix it.
> >>>>   >
> >>>>   >       >>
> >>>>   >       >> I have a question on the behavior of the bind
> >>>>operation when
> >>>>   no
> >>>>   >       input fence
> >>>>   >       >> is provided. Let say I do :
> >>>>   >       >>
> >>>>   >       >> VM_BIND (out_fence=fence1)
> >>>>   >       >>
> >>>>   >       >> VM_BIND (out_fence=fence2)
> >>>>   >       >>
> >>>>   >       >> VM_BIND (out_fence=fence3)
> >>>>   >       >>
> >>>>   >       >>
> >>>>   >       >> In what order are the fences going to be signaled?
> >>>>   >       >>
> >>>>   >       >> In the order of VM_BIND ioctls? Or out of order?
> >>>>   >       >>
> >>>>   >       >> Because you wrote "serialized I assume it's : in order
> >>>>   >       >>
> >>>>   >
> >>>>   >       Yes, in the order of VM_BIND/UNBIND ioctls. Note that
> >>>>bind and
> >>>>   unbind
> >>>>   >       will use
> >>>>   >       the same queue and hence are ordered.
> >>>>   >
> >>>>   >       >>
> >>>>   >       >> One thing I didn't realize is that because we only get
> one
> >>>>   >       "VM_BIND" engine,
> >>>>   >       >> there is a disconnect from the Vulkan specification.
> >>>>   >       >>
> >>>>   >       >> In Vulkan VM_BIND operations are serialized but
> >>>>per engine.
> >>>>   >       >>
> >>>>   >       >> So you could have something like this :
> >>>>   >       >>
> >>>>   >       >> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
> >>>>   >       >>
> >>>>   >       >> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
> >>>>   >       >>
> >>>>   >       >>
> >>>>   >       >> fence1 is not signaled
> >>>>   >       >>
> >>>>   >       >> fence3 is signaled
> >>>>   >       >>
> >>>>   >       >> So the second VM_BIND will proceed before the
> >>>>first VM_BIND.
> >>>>   >       >>
> >>>>   >       >>
> >>>>   >       >> I guess we can deal with that scenario in
> >>>>userspace by doing
> >>>>   the
> >>>>   >       wait
> >>>>   >       >> ourselves in one thread per engines.
> >>>>   >       >>
> >>>>   >       >> But then it makes the VM_BIND input fences useless.
> >>>>   >       >>
> >>>>   >       >>
> >>>>   >       >> Daniel : what do you think? Should be rework this or just
> >>>>   deal with
> >>>>   >       wait
> >>>>   >       >> fences in userspace?
> >>>>   >       >>
> >>>>   >       >
> >>>>   >       >My opinion is rework this but make the ordering via
> >>>>an engine
> >>>>   param
> >>>>   >       optional.
> >>>>   >       >
> >>>>   >       >e.g. A VM can be configured so all binds are ordered
> >>>>within the
> >>>>   VM
> >>>>   >       >
> >>>>   >       >e.g. A VM can be configured so all binds accept an engine
> >>>>   argument
> >>>>   >       (in
> >>>>   >       >the case of the i915 likely this is a gem context
> >>>>handle) and
> >>>>   binds
> >>>>   >       >ordered with respect to that engine.
> >>>>   >       >
> >>>>   >       >This gives UMDs options as the later likely consumes
> >>>>more KMD
> >>>>   >       resources
> >>>>   >       >so if a different UMD can live with binds being
> >>>>ordered within
> >>>>   the VM
> >>>>   >       >they can use a mode consuming less resources.
> >>>>   >       >
> >>>>   >
> >>>>   >       I think we need to be careful here if we are looking for
> some
> >>>>   out of
> >>>>   >       (submission) order completion of vm_bind/unbind.
> >>>>   >       In-order completion means, in a batch of binds and
> >>>>unbinds to be
> >>>>   >       completed in-order, user only needs to specify
> >>>>in-fence for the
> >>>>   >       first bind/unbind call and the our-fence for the last
> >>>>   bind/unbind
> >>>>   >       call. Also, the VA released by an unbind call can be
> >>>>re-used by
> >>>>   >       any subsequent bind call in that in-order batch.
> >>>>   >
> >>>>   >       These things will break if binding/unbinding were to
> >>>>be allowed
> >>>>   to
> >>>>   >       go out of order (of submission) and user need to be extra
> >>>>   careful
> >>>>   >       not to run into pre-mature triggereing of out-fence and bind
> >>>>   failing
> >>>>   >       as VA is still in use etc.
> >>>>   >
> >>>>   >       Also, VM_BIND binds the provided mapping on the specified
> >>>>   address
> >>>>   >       space
> >>>>   >       (VM). So, the uapi is not engine/context specific.
> >>>>   >
> >>>>   >       We can however add a 'queue' to the uapi which can be
> >>>>one from
> >>>>   the
> >>>>   >       pre-defined queues,
> >>>>   >       I915_VM_BIND_QUEUE_0
> >>>>   >       I915_VM_BIND_QUEUE_1
> >>>>   >       ...
> >>>>   >       I915_VM_BIND_QUEUE_(N-1)
> >>>>   >
> >>>>   >       KMD will spawn an async work queue for each queue which will
> >>>>   only
> >>>>   >       bind the mappings on that queue in the order of submission.
> >>>>   >       User can assign the queue to per engine or anything
> >>>>like that.
> >>>>   >
> >>>>   >       But again here, user need to be careful and not
> >>>>deadlock these
> >>>>   >       queues with circular dependency of fences.
> >>>>   >
> >>>>   >       I prefer adding this later an as extension based on
> >>>>whether it
> >>>>   >       is really helping with the implementation.
> >>>>   >
> >>>>   >     I can tell you right now that having everything on a single
> >>>>   in-order
> >>>>   >     queue will not get us the perf we want.  What vulkan
> >>>>really wants
> >>>>   is one
> >>>>   >     of two things:
> >>>>   >      1. No implicit ordering of VM_BIND ops.  They just happen in
> >>>>   whatever
> >>>>   >     their dependencies are resolved and we ensure ordering
> >>>>ourselves
> >>>>   by
> >>>>   >     having a syncobj in the VkQueue.
> >>>>   >      2. The ability to create multiple VM_BIND queues.  We need at
> >>>>   least 2
> >>>>   >     but I don't see why there needs to be a limit besides
> >>>>the limits
> >>>>   the
> >>>>   >     i915 API already has on the number of engines.  Vulkan could
> >>>>   expose
> >>>>   >     multiple sparse binding queues to the client if it's not
> >>>>   arbitrarily
> >>>>   >     limited.
> >>>>
> >>>>   Thanks Jason, Lionel.
> >>>>
> >>>>   Jason, what are you referring to when you say "limits the i915 API
> >>>>   already
> >>>>   has on the number of engines"? I am not sure if there is such an
> uapi
> >>>>   today.
> >>>>
> >>>> There's a limit of something like 64 total engines today based on the
> >>>> number of bits we can cram into the exec flags in execbuffer2.  I
> think
> >>>> someone had an extended version that allowed more but I ripped it out
> >>>> because no one was using it.  Of course, execbuffer3 might not
> >>>>have that
> >>>> problem at all.
> >>>>
> >>>
> >>>Thanks Jason.
> >>>Ok, I am not sure which exec flag is that, but yah, execbuffer3 probably
> >>>will not have this limiation. So, we need to define a VM_BIND_MAX_QUEUE
> >>>and somehow export it to user (I am thinking of embedding it in
> >>>I915_PARAM_HAS_VM_BIND. bits[0]->HAS_VM_BIND, bits[1-3]->'n' meaning 2^n
> >>>queues.
> >>
> >>Ah, I think you are waking about I915_EXEC_RING_MASK (0x3f) which
> execbuf3
>

Yup!  That's exactly the limit I was talking about.


> >>will also have. So, we can simply define in vm_bind/unbind structures,
> >>
> >>#define I915_VM_BIND_MAX_QUEUE   64
> >>        __u32 queue;
> >>
> >>I think that will keep things simple.
> >
> >Hmmm? What does execbuf2 limit has to do with how many engines
> >hardware can have? I suggest not to do that.
> >
> >Change with added this:
> >
> >       if (set.num_engines > I915_EXEC_RING_MASK + 1)
> >               return -EINVAL;
> >
> >To context creation needs to be undone and so let users create engine
> >maps with all hardware engines, and let execbuf3 access them all.
> >
>
> Earlier plan was to carry I915_EXEC_RING_MAP (0x3f) to execbuff3 also.
> Hence, I was using the same limit for VM_BIND queues (64, or 65 if we
> make it N+1).
> But, as discussed in other thread of this RFC series, we are planning
> to drop this I915_EXEC_RING_MAP in execbuff3. So, there won't be
> any uapi that limits the number of engines (and hence the vm_bind queues
> need to be supported).
>
> If we leave the number of vm_bind queues to be arbitrarily large
> (__u32 queue_idx) then, we need to have a hashmap for queue (a wq,
> work_item and a linked list) lookup from the user specified queue index.
> Other option is to just put some hard limit (say 64 or 65) and use
> an array of queues in VM (each created upon first use). I prefer this.
>

I don't get why a VM_BIND queue is any different from any other queue or
userspace-visible kernel object.  But I'll leave those details up to danvet
or whoever else might be reviewing the implementation.

--Jason



>
> Niranjana
>
> >Regards,
> >
> >Tvrtko
> >
> >>
> >>Niranjana
> >>
> >>>
> >>>>   I am trying to see how many queues we need and don't want it to be
> >>>>   arbitrarily
> >>>>   large and unduely blow up memory usage and complexity in i915
> driver.
> >>>>
> >>>> I expect a Vulkan driver to use at most 2 in the vast majority
> >>>>of cases. I
> >>>> could imagine a client wanting to create more than 1 sparse
> >>>>queue in which
> >>>> case, it'll be N+1 but that's unlikely.  As far as complexity
> >>>>goes, once
> >>>> you allow two, I don't think the complexity is going up by
> >>>>allowing N.  As
> >>>> for memory usage, creating more queues means more memory.  That's a
> >>>> trade-off that userspace can make.  Again, the expected number
> >>>>here is 1
> >>>> or 2 in the vast majority of cases so I don't think you need to worry.
> >>>
> >>>Ok, will start with n=3 meaning 8 queues.
> >>>That would require us create 8 workqueues.
> >>>We can change 'n' later if required.
> >>>
> >>>Niranjana
> >>>
> >>>>
> >>>>   >     Why?  Because Vulkan has two basic kind of bind
> >>>>operations and we
> >>>>   don't
> >>>>   >     want any dependencies between them:
> >>>>   >      1. Immediate.  These happen right after BO creation or
> >>>>maybe as
> >>>>   part of
> >>>>   >     vkBindImageMemory() or VkBindBufferMemory().  These
> >>>>don't happen
> >>>>   on a
> >>>>   >     queue and we don't want them serialized with anything.  To
> >>>>   synchronize
> >>>>   >     with submit, we'll have a syncobj in the VkDevice which is
> >>>>   signaled by
> >>>>   >     all immediate bind operations and make submits wait on it.
> >>>>   >      2. Queued (sparse): These happen on a VkQueue which may be
> the
> >>>>   same as
> >>>>   >     a render/compute queue or may be its own queue.  It's up to us
> >>>>   what we
> >>>>   >     want to advertise.  From the Vulkan API PoV, this is like any
> >>>>   other
> >>>>   >     queue.  Operations on it wait on and signal semaphores.  If we
> >>>>   have a
> >>>>   >     VM_BIND engine, we'd provide syncobjs to wait and
> >>>>signal just like
> >>>>   we do
> >>>>   >     in execbuf().
> >>>>   >     The important thing is that we don't want one type of
> >>>>operation to
> >>>>   block
> >>>>   >     on the other.  If immediate binds are blocking on sparse
> binds,
> >>>>   it's
> >>>>   >     going to cause over-synchronization issues.
> >>>>   >     In terms of the internal implementation, I know that
> >>>>there's going
> >>>>   to be
> >>>>   >     a lock on the VM and that we can't actually do these things in
> >>>>   >     parallel.  That's fine.  Once the dma_fences have signaled and
> >>>>   we're
> >>>>
> >>>>   Thats correct. It is like a single VM_BIND engine with
> >>>>multiple queues
> >>>>   feeding to it.
> >>>>
> >>>> Right.  As long as the queues themselves are independent and
> >>>>can block on
> >>>> dma_fences without holding up other queues, I think we're fine.
> >>>>
> >>>>   >     unblocked to do the bind operation, I don't care if
> >>>>there's a bit
> >>>>   of
> >>>>   >     synchronization due to locking.  That's expected.  What
> >>>>we can't
> >>>>   afford
> >>>>   >     to have is an immediate bind operation suddenly blocking on a
> >>>>   sparse
> >>>>   >     operation which is blocked on a compute job that's going to
> run
> >>>>   for
> >>>>   >     another 5ms.
> >>>>
> >>>>   As the VM_BIND queue is per VM, VM_BIND on one VM doesn't block the
> >>>>   VM_BIND
> >>>>   on other VMs. I am not sure about usecases here, but just wanted to
> >>>>   clarify.
> >>>>
> >>>> Yes, that's what I would expect.
> >>>> --Jason
> >>>>
> >>>>   Niranjana
> >>>>
> >>>>   >     For reference, Windows solves this by allowing arbitrarily
> many
> >>>>   paging
> >>>>   >     queues (what they call a VM_BIND engine/queue).  That
> >>>>design works
> >>>>   >     pretty well and solves the problems in question.
> >>>>Again, we could
> >>>>   just
> >>>>   >     make everything out-of-order and require using syncobjs
> >>>>to order
> >>>>   things
> >>>>   >     as userspace wants. That'd be fine too.
> >>>>   >     One more note while I'm here: danvet said something on
> >>>>IRC about
> >>>>   VM_BIND
> >>>>   >     queues waiting for syncobjs to materialize.  We don't really
> >>>>   want/need
> >>>>   >     this.  We already have all the machinery in userspace to
> handle
> >>>>   >     wait-before-signal and waiting for syncobj fences to
> >>>>materialize
> >>>>   and
> >>>>   >     that machinery is on by default.  It would actually
> >>>>take MORE work
> >>>>   in
> >>>>   >     Mesa to turn it off and take advantage of the kernel
> >>>>being able to
> >>>>   wait
> >>>>   >     for syncobjs to materialize.  Also, getting that right is
> >>>>   ridiculously
> >>>>   >     hard and I really don't want to get it wrong in kernel
> >>>>space.     When we
> >>>>   >     do memory fences, wait-before-signal will be a thing.  We
> don't
> >>>>   need to
> >>>>   >     try and make it a thing for syncobj.
> >>>>   >     --Jason
> >>>>   >
> >>>>   >   Thanks Jason,
> >>>>   >
> >>>>   >   I missed the bit in the Vulkan spec that we're allowed to have a
> >>>>   sparse
> >>>>   >   queue that does not implement either graphics or compute
> >>>>operations
> >>>>   :
> >>>>   >
> >>>>   >     "While some implementations may include
> >>>>   VK_QUEUE_SPARSE_BINDING_BIT
> >>>>   >     support in queue families that also include
> >>>>   >
> >>>>   >      graphics and compute support, other implementations may only
> >>>>   expose a
> >>>>   >     VK_QUEUE_SPARSE_BINDING_BIT-only queue
> >>>>   >
> >>>>   >      family."
> >>>>   >
> >>>>   >   So it can all be all a vm_bind engine that just does bind/unbind
> >>>>   >   operations.
> >>>>   >
> >>>>   >   But yes we need another engine for the immediate/non-sparse
> >>>>   operations.
> >>>>   >
> >>>>   >   -Lionel
> >>>>   >
> >>>>   >         >
> >>>>   >       Daniel, any thoughts?
> >>>>   >
> >>>>   >       Niranjana
> >>>>   >
> >>>>   >       >Matt
> >>>>   >       >
> >>>>   >       >>
> >>>>   >       >> Sorry I noticed this late.
> >>>>   >       >>
> >>>>   >       >>
> >>>>   >       >> -Lionel
> >>>>   >       >>
> >>>>   >       >>
>

--000000000000a2837d05e0f6c4c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Jun 8, 2022 at 4:44 PM Niranjana Vishwanathapura &lt;<a href=
=3D"mailto:niranjana.vishwanathapura@intel.com">niranjana.vishwanathapura@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Jun 08, 2022 at 08:33:25AM +0100, Tvrtko Ursulin wrote:<br>
&gt;<br>
&gt;<br>
&gt;On 07/06/2022 22:32, Niranjana Vishwanathapura wrote:<br>
&gt;&gt;On Tue, Jun 07, 2022 at 11:18:11AM -0700, Niranjana Vishwanathapura=
 wrote:<br>
&gt;&gt;&gt;On Tue, Jun 07, 2022 at 12:12:03PM -0500, Jason Ekstrand wrote:=
<br>
&gt;&gt;&gt;&gt;=C2=A0On Fri, Jun 3, 2022 at 6:52 PM Niranjana Vishwanathap=
ura<br>
&gt;&gt;&gt;&gt;=C2=A0&lt;<a href=3D"mailto:niranjana.vishwanathapura@intel=
.com" target=3D"_blank">niranjana.vishwanathapura@intel.com</a>&gt; wrote:<=
br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 On Fri, Jun 03, 2022 at 10:20:25AM +0300, Lion=
el Landwerlin wrote:<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0 On 02/06/2022 23:35, Jason Ek=
strand wrote:<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 On Thu, Jun 2, 20=
22 at 3:11 PM Niranjana Vishwanathapura<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 &lt;<a href=3D"ma=
ilto:niranjana.vishwanathapura@intel.com" target=3D"_blank">niranjana.vishw=
anathapura@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On We=
d, Jun 01, 2022 at 01:28:36PM -0700, Matthew <br>
&gt;&gt;&gt;&gt;Brost wrote:<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;O=
n Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 wrote:<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; &gt; +VM_BIND/UNBIND ioctl will immediately start<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 binding/unbinding<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the m=
apping in an<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; &gt; +async worker. The binding and unbinding will <br>
&gt;&gt;&gt;&gt;work like a<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 special<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GPU e=
ngine.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; &gt; +The binding and unbinding operations are serialized and<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 will<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wait =
on specified<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; &gt; +input fences before the operation and will signal the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 output<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence=
s upon the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; &gt; +completion of the operation. Due to serialization,<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 completion of<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 an op=
eration<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; &gt; +will also indicate that all previous operations <br>
&gt;&gt;&gt;&gt;are also<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compl=
ete.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; I guess we should avoid saying &quot;will immediately start<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindi=
ng/unbinding&quot; if<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; there are fences involved.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; And the fact that it&#39;s happening in an async <br>
&gt;&gt;&gt;&gt;worker seem to<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 imply<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it&#3=
9;s not<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; immediate.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok, w=
ill fix.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This =
was added because in earlier design binding was deferred<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 until<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 next =
execbuff.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 But n=
ow it is non-deferred (immediate in that sense). <br>
&gt;&gt;&gt;&gt;But yah,<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 this is<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 confu=
sing<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and w=
ill fix it.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; I have a question on the behavior of the bind <br>
&gt;&gt;&gt;&gt;operation when<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 no<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input=
 fence<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; is provided. Let say I do :<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; VM_BIND (out_fence=3Dfence1)<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; VM_BIND (out_fence=3Dfence2)<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; VM_BIND (out_fence=3Dfence3)<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; In what order are the fences going to be signaled?<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; In the order of VM_BIND ioctls? Or out of order?<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; Because you wrote &quot;serialized I assume it&#39;s : in order<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Yes, =
in the order of VM_BIND/UNBIND ioctls. Note that <br>
&gt;&gt;&gt;&gt;bind and<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 unbind<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will =
use<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the s=
ame queue and hence are ordered.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; One thing I didn&#39;t realize is that because we only get one<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot=
;VM_BIND&quot; engine,<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; there is a disconnect from the Vulkan specification.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; In Vulkan VM_BIND operations are serialized but <br>
&gt;&gt;&gt;&gt;per engine.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; So you could have something like this :<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; VM_BIND (engine=3Drcs0, in_fence=3Dfence1, out_fence=3Dfence2)<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; VM_BIND (engine=3Dccs0, in_fence=3Dfence3, out_fence=3Dfence4)<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; fence1 is not signaled<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; fence3 is signaled<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; So the second VM_BIND will proceed before the <br>
&gt;&gt;&gt;&gt;first VM_BIND.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; I guess we can deal with that scenario in <br>
&gt;&gt;&gt;&gt;userspace by doing<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wait<=
br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; ourselves in one thread per engines.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; But then it makes the VM_BIND input fences useless.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; Daniel : what do you think? Should be rework this or just<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 deal with<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wait<=
br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; fences in userspace?<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<=
br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;M=
y opinion is rework this but make the ordering via <br>
&gt;&gt;&gt;&gt;an engine<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 param<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optio=
nal.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<=
br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;e=
.g. A VM can be configured so all binds are ordered <br>
&gt;&gt;&gt;&gt;within the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 VM<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<=
br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;e=
.g. A VM can be configured so all binds accept an engine<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 argument<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (in<b=
r>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;t=
he case of the i915 likely this is a gem context <br>
&gt;&gt;&gt;&gt;handle) and<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 binds<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;o=
rdered with respect to that engine.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<=
br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;T=
his gives UMDs options as the later likely consumes <br>
&gt;&gt;&gt;&gt;more KMD<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resou=
rces<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;s=
o if a different UMD can live with binds being <br>
&gt;&gt;&gt;&gt;ordered within<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 the VM<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;t=
hey can use a mode consuming less resources.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<=
br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I thi=
nk we need to be careful here if we are looking for some<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 out of<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (subm=
ission) order completion of vm_bind/unbind.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In-or=
der completion means, in a batch of binds and <br>
&gt;&gt;&gt;&gt;unbinds to be<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compl=
eted in-order, user only needs to specify <br>
&gt;&gt;&gt;&gt;in-fence for the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first=
 bind/unbind call and the our-fence for the last<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 bind/unbind<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 call.=
 Also, the VA released by an unbind call can be <br>
&gt;&gt;&gt;&gt;re-used by<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 any s=
ubsequent bind call in that in-order batch.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 These=
 things will break if binding/unbinding were to <br>
&gt;&gt;&gt;&gt;be allowed<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 to<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go ou=
t of order (of submission) and user need to be extra<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 careful<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not t=
o run into pre-mature triggereing of out-fence and bind<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 failing<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as VA=
 is still in use etc.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Also,=
 VM_BIND binds the provided mapping on the specified<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 address<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 space=
<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (VM).=
 So, the uapi is not engine/context specific.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 We ca=
n however add a &#39;queue&#39; to the uapi which can be <br>
&gt;&gt;&gt;&gt;one from<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pre-d=
efined queues,<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I915_=
VM_BIND_QUEUE_0<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I915_=
VM_BIND_QUEUE_1<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...<b=
r>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I915_=
VM_BIND_QUEUE_(N-1)<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KMD w=
ill spawn an async work queue for each queue which will<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 only<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bind =
the mappings on that queue in the order of submission.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 User =
can assign the queue to per engine or anything <br>
&gt;&gt;&gt;&gt;like that.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 But a=
gain here, user need to be careful and not <br>
&gt;&gt;&gt;&gt;deadlock these<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue=
s with circular dependency of fences.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I pre=
fer adding this later an as extension based on <br>
&gt;&gt;&gt;&gt;whether it<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is re=
ally helping with the implementation.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 I can tell you ri=
ght now that having everything on a single<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 in-order<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 queue will not ge=
t us the perf we want.=C2=A0 What vulkan <br>
&gt;&gt;&gt;&gt;really wants<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 is one<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 of two things:<br=
>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. No impli=
cit ordering of VM_BIND ops.=C2=A0 They just happen in<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 whatever<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 their dependencie=
s are resolved and we ensure ordering <br>
&gt;&gt;&gt;&gt;ourselves<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 by<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 having a syncobj =
in the VkQueue.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. The abil=
ity to create multiple VM_BIND queues.=C2=A0 We need at<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 least 2<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 but I don&#39;t s=
ee why there needs to be a limit besides <br>
&gt;&gt;&gt;&gt;the limits<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 i915 API already =
has on the number of engines.=C2=A0 Vulkan could<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 expose<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 multiple sparse b=
inding queues to the client if it&#39;s not<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 arbitrarily<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 limited.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 Thanks Jason, Lionel.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 Jason, what are you referring to when you say =
&quot;limits the i915 API<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 already<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 has on the number of engines&quot;? I am not s=
ure if there is such an uapi<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 today.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0There&#39;s a limit of something like 64 total engine=
s today based on the<br>
&gt;&gt;&gt;&gt;=C2=A0number of bits we can cram into the exec flags in exe=
cbuffer2.=C2=A0 I think<br>
&gt;&gt;&gt;&gt;=C2=A0someone had an extended version that allowed more but=
 I ripped it out<br>
&gt;&gt;&gt;&gt;=C2=A0because no one was using it.=C2=A0 Of course, execbuf=
fer3 might not <br>
&gt;&gt;&gt;&gt;have that<br>
&gt;&gt;&gt;&gt;=C2=A0problem at all.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;Thanks Jason.<br>
&gt;&gt;&gt;Ok, I am not sure which exec flag is that, but yah, execbuffer3=
 probably<br>
&gt;&gt;&gt;will not have this limiation. So, we need to define a VM_BIND_M=
AX_QUEUE<br>
&gt;&gt;&gt;and somehow export it to user (I am thinking of embedding it in=
<br>
&gt;&gt;&gt;I915_PARAM_HAS_VM_BIND. bits[0]-&gt;HAS_VM_BIND, bits[1-3]-&gt;=
&#39;n&#39; meaning 2^n<br>
&gt;&gt;&gt;queues.<br>
&gt;&gt;<br>
&gt;&gt;Ah, I think you are waking about I915_EXEC_RING_MASK (0x3f) which e=
xecbuf3<br></blockquote><div><br></div><div>Yup!=C2=A0 That&#39;s exactly t=
he limit I was talking about.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt;&gt;will also have. So, we can simply define in vm_bind/unbind structur=
es,<br>
&gt;&gt;<br>
&gt;&gt;#define I915_VM_BIND_MAX_QUEUE=C2=A0=C2=A0 64<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 queue;<br>
&gt;&gt;<br>
&gt;&gt;I think that will keep things simple.<br>
&gt;<br>
&gt;Hmmm? What does execbuf2 limit has to do with how many engines <br>
&gt;hardware can have? I suggest not to do that.<br>
&gt;<br>
&gt;Change with added this:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (set.num_engines &gt; I915_EXEC_RING_MASK=
 + 1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;<br>
&gt;To context creation needs to be undone and so let users create engine <=
br>
&gt;maps with all hardware engines, and let execbuf3 access them all.<br>
&gt;<br>
<br>
Earlier plan was to carry I915_EXEC_RING_MAP (0x3f) to execbuff3 also.<br>
Hence, I was using the same limit for VM_BIND queues (64, or 65 if we<br>
make it N+1).<br>
But, as discussed in other thread of this RFC series, we are planning<br>
to drop this I915_EXEC_RING_MAP in execbuff3. So, there won&#39;t be<br>
any uapi that limits the number of engines (and hence the vm_bind queues<br=
>
need to be supported).<br>
<br>
If we leave the number of vm_bind queues to be arbitrarily large<br>
(__u32 queue_idx) then, we need to have a hashmap for queue (a wq,<br>
work_item and a linked list) lookup from the user specified queue index.<br=
>
Other option is to just put some hard limit (say 64 or 65) and use<br>
an array of queues in VM (each created upon first use). I prefer this.<br><=
/blockquote><div><br></div><div>I don&#39;t get why a VM_BIND queue is any =
different from any other queue or userspace-visible kernel object.=C2=A0 Bu=
t I&#39;ll leave those details up to danvet or whoever else might be review=
ing the implementation.</div><div><br></div><div>--Jason</div><div><br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 I am trying to see how many queues we need and=
 don&#39;t want it to be<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 arbitrarily<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 large and unduely blow up memory usage and com=
plexity in i915 driver.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0I expect a Vulkan driver to use at most 2 in the vast=
 majority <br>
&gt;&gt;&gt;&gt;of cases. I<br>
&gt;&gt;&gt;&gt;=C2=A0could imagine a client wanting to create more than 1 =
sparse <br>
&gt;&gt;&gt;&gt;queue in which<br>
&gt;&gt;&gt;&gt;=C2=A0case, it&#39;ll be N+1 but that&#39;s unlikely.=C2=A0=
 As far as complexity <br>
&gt;&gt;&gt;&gt;goes, once<br>
&gt;&gt;&gt;&gt;=C2=A0you allow two, I don&#39;t think the complexity is go=
ing up by <br>
&gt;&gt;&gt;&gt;allowing N.=C2=A0 As<br>
&gt;&gt;&gt;&gt;=C2=A0for memory usage, creating more queues means more mem=
ory.=C2=A0 That&#39;s a<br>
&gt;&gt;&gt;&gt;=C2=A0trade-off that userspace can make.=C2=A0 Again, the e=
xpected number <br>
&gt;&gt;&gt;&gt;here is 1<br>
&gt;&gt;&gt;&gt;=C2=A0or 2 in the vast majority of cases so I don&#39;t thi=
nk you need to worry.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;Ok, will start with n=3D3 meaning 8 queues.<br>
&gt;&gt;&gt;That would require us create 8 workqueues.<br>
&gt;&gt;&gt;We can change &#39;n&#39; later if required.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;Niranjana<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 Why?=C2=A0 Becaus=
e Vulkan has two basic kind of bind <br>
&gt;&gt;&gt;&gt;operations and we<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 don&#39;t<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 want any dependen=
cies between them:<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. Immediat=
e.=C2=A0 These happen right after BO creation or <br>
&gt;&gt;&gt;&gt;maybe as<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 part of<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 vkBindImageMemory=
() or VkBindBufferMemory().=C2=A0 These <br>
&gt;&gt;&gt;&gt;don&#39;t happen<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 on a<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 queue and we don&=
#39;t want them serialized with anything.=C2=A0 To<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 synchronize<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 with submit, we&#=
39;ll have a syncobj in the VkDevice which is<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 signaled by<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 all immediate bin=
d operations and make submits wait on it.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. Queued (=
sparse): These happen on a VkQueue which may be the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 same as<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 a render/compute =
queue or may be its own queue.=C2=A0 It&#39;s up to us<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 what we<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 want to advertise=
.=C2=A0 From the Vulkan API PoV, this is like any<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 other<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 queue.=C2=A0 Oper=
ations on it wait on and signal semaphores.=C2=A0 If we<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 have a<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 VM_BIND engine, w=
e&#39;d provide syncobjs to wait and <br>
&gt;&gt;&gt;&gt;signal just like<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 we do<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 in execbuf().<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 The important thi=
ng is that we don&#39;t want one type of <br>
&gt;&gt;&gt;&gt;operation to<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 block<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 on the other.=C2=
=A0 If immediate binds are blocking on sparse binds,<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 it&#39;s<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 going to cause ov=
er-synchronization issues.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 In terms of the i=
nternal implementation, I know that <br>
&gt;&gt;&gt;&gt;there&#39;s going<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 to be<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 a lock on the VM =
and that we can&#39;t actually do these things in<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 parallel.=C2=A0 T=
hat&#39;s fine.=C2=A0 Once the dma_fences have signaled and<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 we&#39;re<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 Thats correct. It is like a single VM_BIND eng=
ine with <br>
&gt;&gt;&gt;&gt;multiple queues<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 feeding to it.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0Right.=C2=A0 As long as the queues themselves are ind=
ependent and <br>
&gt;&gt;&gt;&gt;can block on<br>
&gt;&gt;&gt;&gt;=C2=A0dma_fences without holding up other queues, I think w=
e&#39;re fine.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 unblocked to do t=
he bind operation, I don&#39;t care if <br>
&gt;&gt;&gt;&gt;there&#39;s a bit<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 of<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 synchronization d=
ue to locking.=C2=A0 That&#39;s expected.=C2=A0 What <br>
&gt;&gt;&gt;&gt;we can&#39;t<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 afford<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 to have is an imm=
ediate bind operation suddenly blocking on a<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 sparse<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 operation which i=
s blocked on a compute job that&#39;s going to run<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 for<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 another 5ms.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 As the VM_BIND queue is per VM, VM_BIND on one=
 VM doesn&#39;t block the<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 VM_BIND<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 on other VMs. I am not sure about usecases her=
e, but just wanted to<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 clarify.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0Yes, that&#39;s what I would expect.<br>
&gt;&gt;&gt;&gt;=C2=A0--Jason<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 Niranjana<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 For reference, Wi=
ndows solves this by allowing arbitrarily many<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 paging<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 queues (what they=
 call a VM_BIND engine/queue).=C2=A0 That <br>
&gt;&gt;&gt;&gt;design works<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 pretty well and s=
olves the problems in question.=C2=A0 <br>
&gt;&gt;&gt;&gt;Again, we could<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 just<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 make everything o=
ut-of-order and require using syncobjs <br>
&gt;&gt;&gt;&gt;to order<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 things<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 as userspace want=
s. That&#39;d be fine too.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 One more note whi=
le I&#39;m here: danvet said something on <br>
&gt;&gt;&gt;&gt;IRC about<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 VM_BIND<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 queues waiting fo=
r syncobjs to materialize.=C2=A0 We don&#39;t really<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 want/need<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 this.=C2=A0 We al=
ready have all the machinery in userspace to handle<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 wait-before-signa=
l and waiting for syncobj fences to <br>
&gt;&gt;&gt;&gt;materialize<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 and<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 that machinery is=
 on by default.=C2=A0 It would actually <br>
&gt;&gt;&gt;&gt;take MORE work<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 in<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 Mesa to turn it o=
ff and take advantage of the kernel <br>
&gt;&gt;&gt;&gt;being able to<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 wait<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 for syncobjs to m=
aterialize.=C2=A0 Also, getting that right is<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 ridiculously<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 hard and I really=
 don&#39;t want to get it wrong in kernel <br>
&gt;&gt;&gt;&gt;space.=C2=A0=C2=A0=C2=A0=C2=A0 When we<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 do memory fences,=
 wait-before-signal will be a thing.=C2=A0 We don&#39;t<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 need to<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 try and make it a=
 thing for syncobj.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 --Jason<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0 Thanks Jason,<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0 I missed the bit in the Vulka=
n spec that we&#39;re allowed to have a<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 sparse<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0 queue that does not implement=
 either graphics or compute <br>
&gt;&gt;&gt;&gt;operations<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 :<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 &quot;While some =
implementations may include<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 VK_QUEUE_SPARSE_BINDING_BIT<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 support in queue =
families that also include<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 graphics an=
d compute support, other implementations may only<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 expose a<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0 VK_QUEUE_SPARSE_B=
INDING_BIT-only queue<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 family.&quo=
t;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0 So it can all be all a vm_bin=
d engine that just does bind/unbind<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0 operations.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0 But yes we need another engin=
e for the immediate/non-sparse<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 operations.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0 -Lionel<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Danie=
l, any thoughts?<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Niran=
jana<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;M=
att<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<=
br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; Sorry I noticed this late.<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt; -Lionel<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
&gt;&gt;&gt;&gt;=C2=A0=C2=A0 &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;&=
gt;<br>
</blockquote></div></div>

--000000000000a2837d05e0f6c4c8--
