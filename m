Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5753C5E8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 09:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E351F10F423;
	Fri,  3 Jun 2022 07:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E7810F423;
 Fri,  3 Jun 2022 07:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654240831; x=1685776831;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=mpBTqjCTzbS192FT8WAVFFUe1GIMOej8Ly84CShGc+A=;
 b=LeW0PHu/7konDP3KWq85D9Fti8SCummt8lQYqTYpPnsYj0cW26AFwJUr
 0/0kMR9f9AqBjctmZVWBkIXhjVNzFZU2nCDRNwPKbM4clfISe7SgPQWyk
 ayaa4UoO0Olk/xEpnxHPFZfkgxd8PoJwJ3Ri0jTi4JCHjM3geP5hvAavr
 2KrtHwXU87K+XCMgO4DOO/rqagB5syB9vF7Tfg00HNZqMX9uDZDqmXl3N
 OVXiLfNBXhORxINm76HeMNaIXeGBCLsAW4SMV9rrl+V/wdl4lQOzkw/r9
 fjkQGZM2Ha+HTWjvyFvY+gSABPbnu4JxZGGuuianpVbo3VG+QBjsKaeen w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="362562164"
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; 
 d="scan'208,217";a="362562164"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 00:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; 
 d="scan'208,217";a="824622534"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 03 Jun 2022 00:20:30 -0700
Received: from [10.249.152.225] (rkozik-mobl.ger.corp.intel.com
 [10.249.152.225])
 by linux.intel.com (Postfix) with ESMTP id 7089C580699;
 Fri,  3 Jun 2022 00:20:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------tvpAExmrbLpyc248g0uCDGqN"
Message-ID: <bd615d4e-3911-a9ce-5d9f-fb85f7866d32@intel.com>
Date: Fri, 3 Jun 2022 10:20:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601202836.GA15346@jons-linux-dev-box>
 <20220602201112.GQ4461@nvishwa1-DESK>
 <CAOFGe94AXn_vqON++LpiCTqOspCrVZawcYmjL3W6A7tA5vjTpQ@mail.gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <CAOFGe94AXn_vqON++LpiCTqOspCrVZawcYmjL3W6A7tA5vjTpQ@mail.gmail.com>
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
 Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------tvpAExmrbLpyc248g0uCDGqN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/06/2022 23:35, Jason Ekstrand wrote:
> On Thu, Jun 2, 2022 at 3:11 PM Niranjana Vishwanathapura 
> <niranjana.vishwanathapura@intel.com> wrote:
>
>     On Wed, Jun 01, 2022 at 01:28:36PM -0700, Matthew Brost wrote:
>     >On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
>     >> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
>     >> > +VM_BIND/UNBIND ioctl will immediately start
>     binding/unbinding the mapping in an
>     >> > +async worker. The binding and unbinding will work like a
>     special GPU engine.
>     >> > +The binding and unbinding operations are serialized and will
>     wait on specified
>     >> > +input fences before the operation and will signal the output
>     fences upon the
>     >> > +completion of the operation. Due to serialization,
>     completion of an operation
>     >> > +will also indicate that all previous operations are also
>     complete.
>     >>
>     >> I guess we should avoid saying "will immediately start
>     binding/unbinding" if
>     >> there are fences involved.
>     >>
>     >> And the fact that it's happening in an async worker seem to
>     imply it's not
>     >> immediate.
>     >>
>
>     Ok, will fix.
>     This was added because in earlier design binding was deferred
>     until next execbuff.
>     But now it is non-deferred (immediate in that sense). But yah,
>     this is confusing
>     and will fix it.
>
>     >>
>     >> I have a question on the behavior of the bind operation when no
>     input fence
>     >> is provided. Let say I do :
>     >>
>     >> VM_BIND (out_fence=fence1)
>     >>
>     >> VM_BIND (out_fence=fence2)
>     >>
>     >> VM_BIND (out_fence=fence3)
>     >>
>     >>
>     >> In what order are the fences going to be signaled?
>     >>
>     >> In the order of VM_BIND ioctls? Or out of order?
>     >>
>     >> Because you wrote "serialized I assume it's : in order
>     >>
>
>     Yes, in the order of VM_BIND/UNBIND ioctls. Note that bind and
>     unbind will use
>     the same queue and hence are ordered.
>
>     >>
>     >> One thing I didn't realize is that because we only get one
>     "VM_BIND" engine,
>     >> there is a disconnect from the Vulkan specification.
>     >>
>     >> In Vulkan VM_BIND operations are serialized but per engine.
>     >>
>     >> So you could have something like this :
>     >>
>     >> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
>     >>
>     >> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>     >>
>     >>
>     >> fence1 is not signaled
>     >>
>     >> fence3 is signaled
>     >>
>     >> So the second VM_BIND will proceed before the first VM_BIND.
>     >>
>     >>
>     >> I guess we can deal with that scenario in userspace by doing
>     the wait
>     >> ourselves in one thread per engines.
>     >>
>     >> But then it makes the VM_BIND input fences useless.
>     >>
>     >>
>     >> Daniel : what do you think? Should be rework this or just deal
>     with wait
>     >> fences in userspace?
>     >>
>     >
>     >My opinion is rework this but make the ordering via an engine
>     param optional.
>     >
>     >e.g. A VM can be configured so all binds are ordered within the VM
>     >
>     >e.g. A VM can be configured so all binds accept an engine
>     argument (in
>     >the case of the i915 likely this is a gem context handle) and binds
>     >ordered with respect to that engine.
>     >
>     >This gives UMDs options as the later likely consumes more KMD
>     resources
>     >so if a different UMD can live with binds being ordered within the VM
>     >they can use a mode consuming less resources.
>     >
>
>     I think we need to be careful here if we are looking for some out of
>     (submission) order completion of vm_bind/unbind.
>     In-order completion means, in a batch of binds and unbinds to be
>     completed in-order, user only needs to specify in-fence for the
>     first bind/unbind call and the our-fence for the last bind/unbind
>     call. Also, the VA released by an unbind call can be re-used by
>     any subsequent bind call in that in-order batch.
>
>     These things will break if binding/unbinding were to be allowed to
>     go out of order (of submission) and user need to be extra careful
>     not to run into pre-mature triggereing of out-fence and bind failing
>     as VA is still in use etc.
>
>     Also, VM_BIND binds the provided mapping on the specified address
>     space
>     (VM). So, the uapi is not engine/context specific.
>
>     We can however add a 'queue' to the uapi which can be one from the
>     pre-defined queues,
>     I915_VM_BIND_QUEUE_0
>     I915_VM_BIND_QUEUE_1
>     ...
>     I915_VM_BIND_QUEUE_(N-1)
>
>     KMD will spawn an async work queue for each queue which will only
>     bind the mappings on that queue in the order of submission.
>     User can assign the queue to per engine or anything like that.
>
>     But again here, user need to be careful and not deadlock these
>     queues with circular dependency of fences.
>
>     I prefer adding this later an as extension based on whether it
>     is really helping with the implementation.
>
>
> I can tell you right now that having everything on a single in-order 
> queue will not get us the perf we want. What vulkan really wants is 
> one of two things:
>
>  1. No implicit ordering of VM_BIND ops.  They just happen in whatever 
> their dependencies are resolved and we ensure ordering ourselves by 
> having a syncobj in the VkQueue.
>
>  2. The ability to create multiple VM_BIND queues.  We need at least 2 
> but I don't see why there needs to be a limit besides the limits the 
> i915 API already has on the number of engines.  Vulkan could expose 
> multiple sparse binding queues to the client if it's not arbitrarily 
> limited.
>
> Why?  Because Vulkan has two basic kind of bind operations and we 
> don't want any dependencies between them:
>
>  1. Immediate.  These happen right after BO creation or maybe as part 
> of vkBindImageMemory() or VkBindBufferMemory().  These don't happen on 
> a queue and we don't want them serialized with anything.  To 
> synchronize with submit, we'll have a syncobj in the VkDevice which is 
> signaled by all immediate bind operations and make submits wait on it.
>
>  2. Queued (sparse): These happen on a VkQueue which may be the same 
> as a render/compute queue or may be its own queue.  It's up to us what 
> we want to advertise.  From the Vulkan API PoV, this is like any other 
> queue.  Operations on it wait on and signal semaphores.  If we have a 
> VM_BIND engine, we'd provide syncobjs to wait and signal just like we 
> do in execbuf().
>
> The important thing is that we don't want one type of operation to 
> block on the other.  If immediate binds are blocking on sparse binds, 
> it's going to cause over-synchronization issues.
>
> In terms of the internal implementation, I know that there's going to 
> be a lock on the VM and that we can't actually do these things in 
> parallel.  That's fine.  Once the dma_fences have signaled and we're 
> unblocked to do the bind operation, I don't care if there's a bit of 
> synchronization due to locking.  That's expected.  What we can't 
> afford to have is an immediate bind operation suddenly blocking on a 
> sparse operation which is blocked on a compute job that's going to run 
> for another 5ms.
>
> For reference, Windows solves this by allowing arbitrarily many paging 
> queues (what they call a VM_BIND engine/queue).  That design works 
> pretty well and solves the problems in question.  Again, we could just 
> make everything out-of-order and require using syncobjs to order 
> things as userspace wants. That'd be fine too.
>
> One more note while I'm here: danvet said something on IRC about 
> VM_BIND queues waiting for syncobjs to materialize.  We don't really 
> want/need this.  We already have all the machinery in userspace to 
> handle wait-before-signal and waiting for syncobj fences to 
> materialize and that machinery is on by default.  It would actually 
> take MORE work in Mesa to turn it off and take advantage of the kernel 
> being able to wait for syncobjs to materialize.  Also, getting that 
> right is ridiculously hard and I really don't want to get it wrong in 
> kernel space. When we do memory fences, wait-before-signal will be a 
> thing.  We don't need to try and make it a thing for syncobj.
>
> --Jason


Thanks Jason,


I missed the bit in the Vulkan spec that we're allowed to have a sparse 
queue that does not implement either graphics or compute operations :

    "While some implementations may include VK_QUEUE_SPARSE_BINDING_BIT
    support in queue families that also include

      graphics and compute support, other implementations may only
    expose a VK_QUEUE_SPARSE_BINDING_BIT-only queue

      family."


So it can all be all a vm_bind engine that just does bind/unbind 
operations.


But yes we need another engine for the immediate/non-sparse operations.


-Lionel


>     Daniel, any thoughts?
>
>     Niranjana
>
>     >Matt
>     >
>     >>
>     >> Sorry I noticed this late.
>     >>
>     >>
>     >> -Lionel
>     >>
>     >>
>

--------------tvpAExmrbLpyc248g0uCDGqN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 02/06/2022 23:35, Jason Ekstrand
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOFGe94AXn_vqON++LpiCTqOspCrVZawcYmjL3W6A7tA5vjTpQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Jun 2, 2022 at 3:11
            PM Niranjana Vishwanathapura &lt;<a
              href="mailto:niranjana.vishwanathapura@intel.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">niranjana.vishwanathapura@intel.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Wed, Jun 01, 2022 at
            01:28:36PM -0700, Matthew Brost wrote:<br>
            &gt;On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel
            Landwerlin wrote:<br>
            &gt;&gt; On 17/05/2022 21:32, Niranjana Vishwanathapura
            wrote:<br>
            &gt;&gt; &gt; +VM_BIND/UNBIND ioctl will immediately start
            binding/unbinding the mapping in an<br>
            &gt;&gt; &gt; +async worker. The binding and unbinding will
            work like a special GPU engine.<br>
            &gt;&gt; &gt; +The binding and unbinding operations are
            serialized and will wait on specified<br>
            &gt;&gt; &gt; +input fences before the operation and will
            signal the output fences upon the<br>
            &gt;&gt; &gt; +completion of the operation. Due to
            serialization, completion of an operation<br>
            &gt;&gt; &gt; +will also indicate that all previous
            operations are also complete.<br>
            &gt;&gt;<br>
            &gt;&gt; I guess we should avoid saying "will immediately
            start binding/unbinding" if<br>
            &gt;&gt; there are fences involved.<br>
            &gt;&gt;<br>
            &gt;&gt; And the fact that it's happening in an async worker
            seem to imply it's not<br>
            &gt;&gt; immediate.<br>
            &gt;&gt;<br>
            <br>
            Ok, will fix.<br>
            This was added because in earlier design binding was
            deferred until next execbuff.<br>
            But now it is non-deferred (immediate in that sense). But
            yah, this is confusing<br>
            and will fix it.<br>
            <br>
            &gt;&gt;<br>
            &gt;&gt; I have a question on the behavior of the bind
            operation when no input fence<br>
            &gt;&gt; is provided. Let say I do :<br>
            &gt;&gt;<br>
            &gt;&gt; VM_BIND (out_fence=fence1)<br>
            &gt;&gt;<br>
            &gt;&gt; VM_BIND (out_fence=fence2)<br>
            &gt;&gt;<br>
            &gt;&gt; VM_BIND (out_fence=fence3)<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; In what order are the fences going to be signaled?<br>
            &gt;&gt;<br>
            &gt;&gt; In the order of VM_BIND ioctls? Or out of order?<br>
            &gt;&gt;<br>
            &gt;&gt; Because you wrote "serialized I assume it's : in
            order<br>
            &gt;&gt;<br>
            <br>
            Yes, in the order of VM_BIND/UNBIND ioctls. Note that bind
            and unbind will use<br>
            the same queue and hence are ordered.<br>
            <br>
            &gt;&gt;<br>
            &gt;&gt; One thing I didn't realize is that because we only
            get one "VM_BIND" engine,<br>
            &gt;&gt; there is a disconnect from the Vulkan
            specification.<br>
            &gt;&gt;<br>
            &gt;&gt; In Vulkan VM_BIND operations are serialized but per
            engine.<br>
            &gt;&gt;<br>
            &gt;&gt; So you could have something like this :<br>
            &gt;&gt;<br>
            &gt;&gt; VM_BIND (engine=rcs0, in_fence=fence1,
            out_fence=fence2)<br>
            &gt;&gt;<br>
            &gt;&gt; VM_BIND (engine=ccs0, in_fence=fence3,
            out_fence=fence4)<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; fence1 is not signaled<br>
            &gt;&gt;<br>
            &gt;&gt; fence3 is signaled<br>
            &gt;&gt;<br>
            &gt;&gt; So the second VM_BIND will proceed before the first
            VM_BIND.<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; I guess we can deal with that scenario in userspace
            by doing the wait<br>
            &gt;&gt; ourselves in one thread per engines.<br>
            &gt;&gt;<br>
            &gt;&gt; But then it makes the VM_BIND input fences useless.<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; Daniel : what do you think? Should be rework this
            or just deal with wait<br>
            &gt;&gt; fences in userspace?<br>
            &gt;&gt;<br>
            &gt;<br>
            &gt;My opinion is rework this but make the ordering via an
            engine param optional.<br>
            &gt;<br>
            &gt;e.g. A VM can be configured so all binds are ordered
            within the VM<br>
            &gt;<br>
            &gt;e.g. A VM can be configured so all binds accept an
            engine argument (in<br>
            &gt;the case of the i915 likely this is a gem context
            handle) and binds<br>
            &gt;ordered with respect to that engine.<br>
            &gt;<br>
            &gt;This gives UMDs options as the later likely consumes
            more KMD resources<br>
            &gt;so if a different UMD can live with binds being ordered
            within the VM<br>
            &gt;they can use a mode consuming less resources.<br>
            &gt;<br>
            <br>
            I think we need to be careful here if we are looking for
            some out of<br>
            (submission) order completion of vm_bind/unbind.<br>
            In-order completion means, in a batch of binds and unbinds
            to be<br>
            completed in-order, user only needs to specify in-fence for
            the<br>
            first bind/unbind call and the our-fence for the last
            bind/unbind<br>
            call. Also, the VA released by an unbind call can be re-used
            by<br>
            any subsequent bind call in that in-order batch.<br>
            <br>
            These things will break if binding/unbinding were to be
            allowed to<br>
            go out of order (of submission) and user need to be extra
            careful<br>
            not to run into pre-mature triggereing of out-fence and bind
            failing<br>
            as VA is still in use etc.<br>
            <br>
            Also, VM_BIND binds the provided mapping on the specified
            address space<br>
            (VM). So, the uapi is not engine/context specific.<br>
            <br>
            We can however add a 'queue' to the uapi which can be one
            from the<br>
            pre-defined queues,<br>
            I915_VM_BIND_QUEUE_0<br>
            I915_VM_BIND_QUEUE_1<br>
            ...<br>
            I915_VM_BIND_QUEUE_(N-1)<br>
            <br>
            KMD will spawn an async work queue for each queue which will
            only<br>
            bind the mappings on that queue in the order of submission.<br>
            User can assign the queue to per engine or anything like
            that.<br>
            <br>
            But again here, user need to be careful and not deadlock
            these<br>
            queues with circular dependency of fences.<br>
            <br>
            I prefer adding this later an as extension based on whether
            it<br>
            is really helping with the implementation.<br>
          </blockquote>
          <div><br>
          </div>
          <div>I can tell you right now that having everything on a
            single in-order queue will not get us the perf we want. 
            What vulkan really wants is one of two things:</div>
          <div><br>
          </div>
          <div> 1. No implicit ordering of VM_BIND ops.  They just
            happen in whatever their dependencies are resolved and we
            ensure ordering ourselves by having a syncobj in the
            VkQueue.<br>
          </div>
          <div><br>
          </div>
          <div> 2. The ability to create multiple VM_BIND queues.  We
            need at least 2 but I don't see why there needs to be a
            limit besides the limits the i915 API already has on the
            number of engines.  Vulkan could expose multiple sparse
            binding queues to the client if it's not arbitrarily
            limited.<br>
          </div>
          <div><br>
          </div>
          <div>Why?  Because Vulkan has two basic kind of bind
            operations and we don't want any dependencies between them:</div>
          <div><br>
          </div>
          <div> 1. Immediate.  These happen right after BO creation or
            maybe as part of vkBindImageMemory() or
            VkBindBufferMemory().  These don't happen on a queue and we
            don't want them serialized with anything.  To synchronize
            with submit, we'll have a syncobj in the VkDevice which is
            signaled by all immediate bind operations and make submits
            wait on it.</div>
          <div><br>
          </div>
          <div> 2. Queued (sparse): These happen on a VkQueue which may
            be the same as a render/compute queue or may be its own
            queue.  It's up to us what we want to advertise.  From the
            Vulkan API PoV, this is like any other queue.  Operations on
            it wait on and signal semaphores.  If we have a VM_BIND
            engine, we'd provide syncobjs to wait and signal just like
            we do in execbuf().</div>
          <div><br>
          </div>
          <div>The important thing is that we don't want one type of
            operation to block on the other.  If immediate binds are
            blocking on sparse binds, it's going to cause
            over-synchronization issues.</div>
          <div><br>
          </div>
          <div>In terms of the internal implementation, I know that
            there's going to be a lock on the VM and that we can't
            actually do these things in parallel.  That's fine.  Once
            the dma_fences have signaled and we're unblocked to do the
            bind operation, I don't care if there's a bit of
            synchronization due to locking.  That's expected.  What we
            can't afford to have is an immediate bind operation suddenly
            blocking on a sparse operation which is blocked on a compute
            job that's going to run for another 5ms.</div>
          <div><br>
          </div>
          <div>For reference, Windows solves this by allowing
            arbitrarily many paging queues (what they call a VM_BIND
            engine/queue).  That design works pretty well and solves the
            problems in question.  Again, we could just make everything
            out-of-order and require using syncobjs to order things as
            userspace wants. That'd be fine too.<br>
          </div>
          <div><br>
          </div>
          <div>One more note while I'm here: danvet said something on
            IRC about VM_BIND queues waiting for syncobjs to
            materialize.  We don't really want/need this.  We already
            have all the machinery in userspace to handle
            wait-before-signal and waiting for syncobj fences to
            materialize and that machinery is on by default.  It would
            actually take MORE work in Mesa to turn it off and take
            advantage of the kernel being able to wait for syncobjs to
            materialize.  Also, getting that right is ridiculously hard
            and I really don't want to get it wrong in kernel space. 
            When we do memory fences, wait-before-signal will be a
            thing.  We don't need to try and make it a thing for
            syncobj.<br>
          </div>
          <div><br>
          </div>
          <div>--Jason<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks Jason,</p>
    <p><br>
    </p>
    <p>I missed the bit in the Vulkan spec that we're allowed to have a
      sparse queue that does not implement either graphics or compute
      operations :</p>
    <blockquote>
      <p>"While some implementations may include
        VK_QUEUE_SPARSE_BINDING_BIT support in queue families that also
        include</p>
      <p> graphics and compute support, other implementations may only
        expose a VK_QUEUE_SPARSE_BINDING_BIT-only queue</p>
      <p> family."</p>
    </blockquote>
    <p><br>
    </p>
    So it can all be all a vm_bind engine that just does bind/unbind
    operations.
    <p><br>
    </p>
    <p>But yes we need another engine for the immediate/non-sparse
      operations.</p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAOFGe94AXn_vqON++LpiCTqOspCrVZawcYmjL3W6A7tA5vjTpQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Daniel, any thoughts?<br>
            <br>
            Niranjana<br>
            <br>
            &gt;Matt<br>
            &gt;<br>
            &gt;&gt;<br>
            &gt;&gt; Sorry I noticed this late.<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; -Lionel<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------tvpAExmrbLpyc248g0uCDGqN--
