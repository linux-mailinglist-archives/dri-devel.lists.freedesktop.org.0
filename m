Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC8540470
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BB010EDD6;
	Tue,  7 Jun 2022 17:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0C10EDD9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 17:12:15 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id w2so32200704ybi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qrw2kIEinGhoKs2lVZtloyZvLU2VcIRImCmepnJCjeA=;
 b=47zpTCtT7cHq4CZsq0g1XlA3gL8gwR70Goq2Tb+FLi0sY1jsd8ynpsFnUoQwm1QKKt
 LShjgN/u3PulqtzjQdsAFfEaV587KGJm8icBcjDLHsxTGQafURBhdla448l1hlifasvV
 DT/0lJ3rIu0IsWwsrYzPP6tikV2PE9riWgzGBnN9HiTzu5aHyTZFW0Th++p/7Z4Gt6qU
 1ur4n5Iv85kt380BAvYOVBbL86EFQly1cYEZ1WyOetqLxoq9sTZj/lY+V8Om50Bdo2An
 /6f0ap1k9BpkD1f+XxcnXkMbrH0EFDbok91nrI/bphHHFo/nK3c7cEaAP368ZhqZxdk2
 wkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qrw2kIEinGhoKs2lVZtloyZvLU2VcIRImCmepnJCjeA=;
 b=HNF4NX7AObgwSs5BgMNvmoyz7M3JrdOZhbarWoOFp0VbV92HGoz9sB11jt1VPqEKVk
 chmGl/wFZ+5SKXRNZLqLPv9QSPofORFIgXlRJZMPFc97glkii3yXt3wP3wsMqhG1WhWz
 jamoWQubN3DgEYlOGMK9AzgojJoq7p8/YFhEsurYi7e1TrZbi2tRgD+4jsbOFomBBpf9
 guGhrH7b9Ii9l0Lg30ITVKZBcP4oF/nR7inpb7hwVKDJw/VtxZxkfr88yZuWpBScKhC6
 87xhGKlF2HpuZ8taAGxVs5YP896qemZ8b+Y2tNdYa3bcBJTbW3qW4sC8XqVoX8qyNLJg
 7x3Q==
X-Gm-Message-State: AOAM530sFFtyP6VSJww/PiqH0y3OACw6Tj1xkdLJJ63G6cssrVGHxAOk
 YX+6fytRmSc0NBGrvBQt+sM2TvVVi/JHRw33QOsdSw==
X-Google-Smtp-Source: ABdhPJy10tCykp8+caEPuGkuMpFpkghiq134cOQ3L6LGscNy/cg+OXxevJsTvfSUEKM3oqjOomY0plMj0TH+kBpQnNI=
X-Received: by 2002:a25:c003:0:b0:64d:6291:a6b with SMTP id
 c3-20020a25c003000000b0064d62910a6bmr29703879ybf.19.1654621934771; Tue, 07
 Jun 2022 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601202836.GA15346@jons-linux-dev-box>
 <20220602201112.GQ4461@nvishwa1-DESK>
 <CAOFGe94AXn_vqON++LpiCTqOspCrVZawcYmjL3W6A7tA5vjTpQ@mail.gmail.com>
 <bd615d4e-3911-a9ce-5d9f-fb85f7866d32@intel.com>
 <20220603235148.GU4461@nvishwa1-DESK>
In-Reply-To: <20220603235148.GU4461@nvishwa1-DESK>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 7 Jun 2022 12:12:03 -0500
Message-ID: <CAOFGe97GP10J601XGRNK7X+xLxGK1sxNnbbLeLTxAf8g4V0-bQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: multipart/alternative; boundary="000000000000a8f64905e0deb060"
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
Cc: Chris Wilson <chris.p.wilson@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a8f64905e0deb060
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 3, 2022 at 6:52 PM Niranjana Vishwanathapura <
niranjana.vishwanathapura@intel.com> wrote:

> On Fri, Jun 03, 2022 at 10:20:25AM +0300, Lionel Landwerlin wrote:
> >   On 02/06/2022 23:35, Jason Ekstrand wrote:
> >
> >     On Thu, Jun 2, 2022 at 3:11 PM Niranjana Vishwanathapura
> >     <niranjana.vishwanathapura@intel.com> wrote:
> >
> >       On Wed, Jun 01, 2022 at 01:28:36PM -0700, Matthew Brost wrote:
> >       >On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
> >       >> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
> >       >> > +VM_BIND/UNBIND ioctl will immediately start binding/unbinding
> >       the mapping in an
> >       >> > +async worker. The binding and unbinding will work like a
> special
> >       GPU engine.
> >       >> > +The binding and unbinding operations are serialized and will
> >       wait on specified
> >       >> > +input fences before the operation and will signal the output
> >       fences upon the
> >       >> > +completion of the operation. Due to serialization,
> completion of
> >       an operation
> >       >> > +will also indicate that all previous operations are also
> >       complete.
> >       >>
> >       >> I guess we should avoid saying "will immediately start
> >       binding/unbinding" if
> >       >> there are fences involved.
> >       >>
> >       >> And the fact that it's happening in an async worker seem to
> imply
> >       it's not
> >       >> immediate.
> >       >>
> >
> >       Ok, will fix.
> >       This was added because in earlier design binding was deferred until
> >       next execbuff.
> >       But now it is non-deferred (immediate in that sense). But yah,
> this is
> >       confusing
> >       and will fix it.
> >
> >       >>
> >       >> I have a question on the behavior of the bind operation when no
> >       input fence
> >       >> is provided. Let say I do :
> >       >>
> >       >> VM_BIND (out_fence=fence1)
> >       >>
> >       >> VM_BIND (out_fence=fence2)
> >       >>
> >       >> VM_BIND (out_fence=fence3)
> >       >>
> >       >>
> >       >> In what order are the fences going to be signaled?
> >       >>
> >       >> In the order of VM_BIND ioctls? Or out of order?
> >       >>
> >       >> Because you wrote "serialized I assume it's : in order
> >       >>
> >
> >       Yes, in the order of VM_BIND/UNBIND ioctls. Note that bind and
> unbind
> >       will use
> >       the same queue and hence are ordered.
> >
> >       >>
> >       >> One thing I didn't realize is that because we only get one
> >       "VM_BIND" engine,
> >       >> there is a disconnect from the Vulkan specification.
> >       >>
> >       >> In Vulkan VM_BIND operations are serialized but per engine.
> >       >>
> >       >> So you could have something like this :
> >       >>
> >       >> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
> >       >>
> >       >> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
> >       >>
> >       >>
> >       >> fence1 is not signaled
> >       >>
> >       >> fence3 is signaled
> >       >>
> >       >> So the second VM_BIND will proceed before the first VM_BIND.
> >       >>
> >       >>
> >       >> I guess we can deal with that scenario in userspace by doing the
> >       wait
> >       >> ourselves in one thread per engines.
> >       >>
> >       >> But then it makes the VM_BIND input fences useless.
> >       >>
> >       >>
> >       >> Daniel : what do you think? Should be rework this or just deal
> with
> >       wait
> >       >> fences in userspace?
> >       >>
> >       >
> >       >My opinion is rework this but make the ordering via an engine
> param
> >       optional.
> >       >
> >       >e.g. A VM can be configured so all binds are ordered within the VM
> >       >
> >       >e.g. A VM can be configured so all binds accept an engine argument
> >       (in
> >       >the case of the i915 likely this is a gem context handle) and
> binds
> >       >ordered with respect to that engine.
> >       >
> >       >This gives UMDs options as the later likely consumes more KMD
> >       resources
> >       >so if a different UMD can live with binds being ordered within
> the VM
> >       >they can use a mode consuming less resources.
> >       >
> >
> >       I think we need to be careful here if we are looking for some out
> of
> >       (submission) order completion of vm_bind/unbind.
> >       In-order completion means, in a batch of binds and unbinds to be
> >       completed in-order, user only needs to specify in-fence for the
> >       first bind/unbind call and the our-fence for the last bind/unbind
> >       call. Also, the VA released by an unbind call can be re-used by
> >       any subsequent bind call in that in-order batch.
> >
> >       These things will break if binding/unbinding were to be allowed to
> >       go out of order (of submission) and user need to be extra careful
> >       not to run into pre-mature triggereing of out-fence and bind
> failing
> >       as VA is still in use etc.
> >
> >       Also, VM_BIND binds the provided mapping on the specified address
> >       space
> >       (VM). So, the uapi is not engine/context specific.
> >
> >       We can however add a 'queue' to the uapi which can be one from the
> >       pre-defined queues,
> >       I915_VM_BIND_QUEUE_0
> >       I915_VM_BIND_QUEUE_1
> >       ...
> >       I915_VM_BIND_QUEUE_(N-1)
> >
> >       KMD will spawn an async work queue for each queue which will only
> >       bind the mappings on that queue in the order of submission.
> >       User can assign the queue to per engine or anything like that.
> >
> >       But again here, user need to be careful and not deadlock these
> >       queues with circular dependency of fences.
> >
> >       I prefer adding this later an as extension based on whether it
> >       is really helping with the implementation.
> >
> >     I can tell you right now that having everything on a single in-order
> >     queue will not get us the perf we want.  What vulkan really wants is
> one
> >     of two things:
> >      1. No implicit ordering of VM_BIND ops.  They just happen in
> whatever
> >     their dependencies are resolved and we ensure ordering ourselves by
> >     having a syncobj in the VkQueue.
> >      2. The ability to create multiple VM_BIND queues.  We need at least
> 2
> >     but I don't see why there needs to be a limit besides the limits the
> >     i915 API already has on the number of engines.  Vulkan could expose
> >     multiple sparse binding queues to the client if it's not arbitrarily
> >     limited.
>
> Thanks Jason, Lionel.
>
> Jason, what are you referring to when you say "limits the i915 API already
> has on the number of engines"? I am not sure if there is such an uapi
> today.
>

There's a limit of something like 64 total engines today based on the
number of bits we can cram into the exec flags in execbuffer2.  I think
someone had an extended version that allowed more but I ripped it out
because no one was using it.  Of course, execbuffer3 might not have that
problem at all.

I am trying to see how many queues we need and don't want it to be
> arbitrarily
> large and unduely blow up memory usage and complexity in i915 driver.
>

I expect a Vulkan driver to use at most 2 in the vast majority of cases. I
could imagine a client wanting to create more than 1 sparse queue in which
case, it'll be N+1 but that's unlikely.  As far as complexity goes, once
you allow two, I don't think the complexity is going up by allowing N.  As
for memory usage, creating more queues means more memory.  That's a
trade-off that userspace can make.  Again, the expected number here is 1 or
2 in the vast majority of cases so I don't think you need to worry.


> >     Why?  Because Vulkan has two basic kind of bind operations and we
> don't
> >     want any dependencies between them:
> >      1. Immediate.  These happen right after BO creation or maybe as
> part of
> >     vkBindImageMemory() or VkBindBufferMemory().  These don't happen on a
> >     queue and we don't want them serialized with anything.  To
> synchronize
> >     with submit, we'll have a syncobj in the VkDevice which is signaled
> by
> >     all immediate bind operations and make submits wait on it.
> >      2. Queued (sparse): These happen on a VkQueue which may be the same
> as
> >     a render/compute queue or may be its own queue.  It's up to us what
> we
> >     want to advertise.  From the Vulkan API PoV, this is like any other
> >     queue.  Operations on it wait on and signal semaphores.  If we have a
> >     VM_BIND engine, we'd provide syncobjs to wait and signal just like
> we do
> >     in execbuf().
> >     The important thing is that we don't want one type of operation to
> block
> >     on the other.  If immediate binds are blocking on sparse binds, it's
> >     going to cause over-synchronization issues.
> >     In terms of the internal implementation, I know that there's going
> to be
> >     a lock on the VM and that we can't actually do these things in
> >     parallel.  That's fine.  Once the dma_fences have signaled and we're
>
> Thats correct. It is like a single VM_BIND engine with multiple queues
> feeding to it.
>

Right.  As long as the queues themselves are independent and can block on
dma_fences without holding up other queues, I think we're fine.


> >     unblocked to do the bind operation, I don't care if there's a bit of
> >     synchronization due to locking.  That's expected.  What we can't
> afford
> >     to have is an immediate bind operation suddenly blocking on a sparse
> >     operation which is blocked on a compute job that's going to run for
> >     another 5ms.
>
> As the VM_BIND queue is per VM, VM_BIND on one VM doesn't block the VM_BIND
> on other VMs. I am not sure about usecases here, but just wanted to
> clarify.
>

Yes, that's what I would expect.

--Jason



> Niranjana
>
> >     For reference, Windows solves this by allowing arbitrarily many
> paging
> >     queues (what they call a VM_BIND engine/queue).  That design works
> >     pretty well and solves the problems in question.  Again, we could
> just
> >     make everything out-of-order and require using syncobjs to order
> things
> >     as userspace wants. That'd be fine too.
> >     One more note while I'm here: danvet said something on IRC about
> VM_BIND
> >     queues waiting for syncobjs to materialize.  We don't really
> want/need
> >     this.  We already have all the machinery in userspace to handle
> >     wait-before-signal and waiting for syncobj fences to materialize and
> >     that machinery is on by default.  It would actually take MORE work in
> >     Mesa to turn it off and take advantage of the kernel being able to
> wait
> >     for syncobjs to materialize.  Also, getting that right is
> ridiculously
> >     hard and I really don't want to get it wrong in kernel space.  When
> we
> >     do memory fences, wait-before-signal will be a thing.  We don't need
> to
> >     try and make it a thing for syncobj.
> >     --Jason
> >
> >   Thanks Jason,
> >
> >   I missed the bit in the Vulkan spec that we're allowed to have a sparse
> >   queue that does not implement either graphics or compute operations :
> >
> >     "While some implementations may include VK_QUEUE_SPARSE_BINDING_BIT
> >     support in queue families that also include
> >
> >      graphics and compute support, other implementations may only expose
> a
> >     VK_QUEUE_SPARSE_BINDING_BIT-only queue
> >
> >      family."
> >
> >   So it can all be all a vm_bind engine that just does bind/unbind
> >   operations.
> >
> >   But yes we need another engine for the immediate/non-sparse operations.
> >
> >   -Lionel
> >
> >
> >
> >       Daniel, any thoughts?
> >
> >       Niranjana
> >
> >       >Matt
> >       >
> >       >>
> >       >> Sorry I noticed this late.
> >       >>
> >       >>
> >       >> -Lionel
> >       >>
> >       >>
>

--000000000000a8f64905e0deb060
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Jun 3, 2022 at 6:52 PM Niranjana Vishwanathapura &lt;<a href=
=3D"mailto:niranjana.vishwanathapura@intel.com">niranjana.vishwanathapura@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Fri, Jun 03, 2022 at 10:20:25AM +0300, Lionel Landwerlin wrote:<=
br>
&gt;=C2=A0 =C2=A0On 02/06/2022 23:35, Jason Ekstrand wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Jun 2, 2022 at 3:11 PM Niranjana Vishwanath=
apura<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:niranjana.vishwanathapura@int=
el.com" target=3D"_blank">niranjana.vishwanathapura@intel.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, Jun 01, 2022 at 01:28:36PM -0700, Ma=
tthew Brost wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;On Wed, Jun 01, 2022 at 05:25:49PM +0300=
, Lionel Landwerlin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; On 17/05/2022 21:32, Niranjana Vish=
wanathapura wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; +VM_BIND/UNBIND ioctl will imm=
ediately start binding/unbinding<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the mapping in an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; +async worker. The binding and=
 unbinding will work like a special<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GPU engine.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; +The binding and unbinding ope=
rations are serialized and will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wait on specified<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; +input fences before the opera=
tion and will signal the output<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fences upon the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; +completion of the operation. =
Due to serialization, completion of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0an operation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; +will also indicate that all p=
revious operations are also<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0complete.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; I guess we should avoid saying &quo=
t;will immediately start<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0binding/unbinding&quot; if<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; there are fences involved.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; And the fact that it&#39;s happenin=
g in an async worker seem to imply<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0it&#39;s not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; immediate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Ok, will fix.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This was added because in earlier design bin=
ding was deferred until<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0next execbuff.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0But now it is non-deferred (immediate in tha=
t sense). But yah, this is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0confusing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0and will fix it.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; I have a question on the behavior o=
f the bind operation when no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0input fence<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; is provided. Let say I do :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; VM_BIND (out_fence=3Dfence1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; VM_BIND (out_fence=3Dfence2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; VM_BIND (out_fence=3Dfence3)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; In what order are the fences going =
to be signaled?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; In the order of VM_BIND ioctls? Or =
out of order?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Because you wrote &quot;serialized =
I assume it&#39;s : in order<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yes, in the order of VM_BIND/UNBIND ioctls. =
Note that bind and unbind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0will use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the same queue and hence are ordered.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; One thing I didn&#39;t realize is t=
hat because we only get one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;VM_BIND&quot; engine,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; there is a disconnect from the Vulk=
an specification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; In Vulkan VM_BIND operations are se=
rialized but per engine.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; So you could have something like th=
is :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; VM_BIND (engine=3Drcs0, in_fence=3D=
fence1, out_fence=3Dfence2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; VM_BIND (engine=3Dccs0, in_fence=3D=
fence3, out_fence=3Dfence4)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; fence1 is not signaled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; fence3 is signaled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; So the second VM_BIND will proceed =
before the first VM_BIND.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; I guess we can deal with that scena=
rio in userspace by doing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wait<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; ourselves in one thread per engines=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; But then it makes the VM_BIND input=
 fences useless.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Daniel : what do you think? Should =
be rework this or just deal with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wait<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; fences in userspace?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;My opinion is rework this but make the o=
rdering via an engine param<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0optional.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;e.g. A VM can be configured so all binds=
 are ordered within the VM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;e.g. A VM can be configured so all binds=
 accept an engine argument<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;the case of the i915 likely this is a ge=
m context handle) and binds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;ordered with respect to that engine.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;This gives UMDs options as the later lik=
ely consumes more KMD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0resources<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;so if a different UMD can live with bind=
s being ordered within the VM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;they can use a mode consuming less resou=
rces.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I think we need to be careful here if we are=
 looking for some out of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(submission) order completion of vm_bind/unb=
ind.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In-order completion means, in a batch of bin=
ds and unbinds to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0completed in-order, user only needs to speci=
fy in-fence for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0first bind/unbind call and the our-fence for=
 the last bind/unbind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0call. Also, the VA released by an unbind cal=
l can be re-used by<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0any subsequent bind call in that in-order ba=
tch.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0These things will break if binding/unbinding=
 were to be allowed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0go out of order (of submission) and user nee=
d to be extra careful<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0not to run into pre-mature triggereing of ou=
t-fence and bind failing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0as VA is still in use etc.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also, VM_BIND binds the provided mapping on =
the specified address<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0space<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(VM). So, the uapi is not engine/context spe=
cific.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0We can however add a &#39;queue&#39; to the =
uapi which can be one from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pre-defined queues,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I915_VM_BIND_QUEUE_0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I915_VM_BIND_QUEUE_1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I915_VM_BIND_QUEUE_(N-1)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0KMD will spawn an async work queue for each =
queue which will only<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bind the mappings on that queue in the order=
 of submission.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0User can assign the queue to per engine or a=
nything like that.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0But again here, user need to be careful and =
not deadlock these<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0queues with circular dependency of fences.<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I prefer adding this later an as extension b=
ased on whether it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is really helping with the implementation.<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I can tell you right now that having everything on =
a single in-order<br>
&gt;=C2=A0 =C2=A0 =C2=A0queue will not get us the perf we want.=C2=A0 What =
vulkan really wants is one<br>
&gt;=C2=A0 =C2=A0 =C2=A0of two things:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1. No implicit ordering of VM_BIND ops.=C2=A0 They=
 just happen in whatever<br>
&gt;=C2=A0 =C2=A0 =C2=A0their dependencies are resolved and we ensure order=
ing ourselves by<br>
&gt;=C2=A0 =C2=A0 =C2=A0having a syncobj in the VkQueue.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 2. The ability to create multiple VM_BIND queues.=
=C2=A0 We need at least 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0but I don&#39;t see why there needs to be a limit b=
esides the limits the<br>
&gt;=C2=A0 =C2=A0 =C2=A0i915 API already has on the number of engines.=C2=
=A0 Vulkan could expose<br>
&gt;=C2=A0 =C2=A0 =C2=A0multiple sparse binding queues to the client if it&=
#39;s not arbitrarily<br>
&gt;=C2=A0 =C2=A0 =C2=A0limited.<br>
<br>
Thanks Jason, Lionel.<br>
<br>
Jason, what are you referring to when you say &quot;limits the i915 API alr=
eady<br>
has on the number of engines&quot;? I am not sure if there is such an uapi =
today.<br></blockquote><div><br></div><div>There&#39;s a limit of something=
 like 64 total engines today based on the number of bits we can cram into t=
he exec flags in execbuffer2.=C2=A0 I think someone had an extended version=
 that allowed more but I ripped it out because no one was using it.=C2=A0 O=
f course, execbuffer3 might not have that problem at all.<br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
I am trying to see how many queues we need and don&#39;t want it to be arbi=
trarily<br>
large and unduely blow up memory usage and complexity in i915 driver.<br></=
blockquote><div><br></div><div>I expect a Vulkan driver to use at most 2 in=
 the vast majority of cases. I could imagine a client wanting to create mor=
e than 1 sparse queue in which case, it&#39;ll be N+1 but that&#39;s unlike=
ly.=C2=A0 As far as complexity goes, once you allow two, I don&#39;t think =
the complexity is going up by allowing N.=C2=A0 As for memory usage, creati=
ng more queues means more memory.=C2=A0 That&#39;s a trade-off that userspa=
ce can make.=C2=A0 Again, the expected number here is 1 or 2 in the vast ma=
jority of cases so I don&#39;t think you need to worry.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0Why?=C2=A0 Because Vulkan has two basic kind of bin=
d operations and we don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0want any dependencies between them:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1. Immediate.=C2=A0 These happen right after BO cr=
eation or maybe as part of<br>
&gt;=C2=A0 =C2=A0 =C2=A0vkBindImageMemory() or VkBindBufferMemory().=C2=A0 =
These don&#39;t happen on a<br>
&gt;=C2=A0 =C2=A0 =C2=A0queue and we don&#39;t want them serialized with an=
ything.=C2=A0 To synchronize<br>
&gt;=C2=A0 =C2=A0 =C2=A0with submit, we&#39;ll have a syncobj in the VkDevi=
ce which is signaled by<br>
&gt;=C2=A0 =C2=A0 =C2=A0all immediate bind operations and make submits wait=
 on it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 2. Queued (sparse): These happen on a VkQueue whic=
h may be the same as<br>
&gt;=C2=A0 =C2=A0 =C2=A0a render/compute queue or may be its own queue.=C2=
=A0 It&#39;s up to us what we<br>
&gt;=C2=A0 =C2=A0 =C2=A0want to advertise.=C2=A0 From the Vulkan API PoV, t=
his is like any other<br>
&gt;=C2=A0 =C2=A0 =C2=A0queue.=C2=A0 Operations on it wait on and signal se=
maphores.=C2=A0 If we have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0VM_BIND engine, we&#39;d provide syncobjs to wait a=
nd signal just like we do<br>
&gt;=C2=A0 =C2=A0 =C2=A0in execbuf().<br>
&gt;=C2=A0 =C2=A0 =C2=A0The important thing is that we don&#39;t want one t=
ype of operation to block<br>
&gt;=C2=A0 =C2=A0 =C2=A0on the other.=C2=A0 If immediate binds are blocking=
 on sparse binds, it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0going to cause over-synchronization issues.<br>
&gt;=C2=A0 =C2=A0 =C2=A0In terms of the internal implementation, I know tha=
t there&#39;s going to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0a lock on the VM and that we can&#39;t actually do =
these things in<br>
&gt;=C2=A0 =C2=A0 =C2=A0parallel.=C2=A0 That&#39;s fine.=C2=A0 Once the dma=
_fences have signaled and we&#39;re<br>
<br>
Thats correct. It is like a single VM_BIND engine with multiple queues<br>
feeding to it.<br></blockquote><div><br></div><div>Right.=C2=A0 As long as =
the queues themselves are independent and can block on dma_fences without h=
olding up other queues, I think we&#39;re fine.<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0unblocked to do the bind operation, I don&#39;t car=
e if there&#39;s a bit of<br>
&gt;=C2=A0 =C2=A0 =C2=A0synchronization due to locking.=C2=A0 That&#39;s ex=
pected.=C2=A0 What we can&#39;t afford<br>
&gt;=C2=A0 =C2=A0 =C2=A0to have is an immediate bind operation suddenly blo=
cking on a sparse<br>
&gt;=C2=A0 =C2=A0 =C2=A0operation which is blocked on a compute job that&#3=
9;s going to run for<br>
&gt;=C2=A0 =C2=A0 =C2=A0another 5ms.<br>
<br>
As the VM_BIND queue is per VM, VM_BIND on one VM doesn&#39;t block the VM_=
BIND<br>
on other VMs. I am not sure about usecases here, but just wanted to clarify=
.<br></blockquote><div><br></div><div>Yes, that&#39;s what I would expect.<=
/div><div><br></div><div>--Jason</div><div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
Niranjana<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0For reference, Windows solves this by allowing arbi=
trarily many paging<br>
&gt;=C2=A0 =C2=A0 =C2=A0queues (what they call a VM_BIND engine/queue).=C2=
=A0 That design works<br>
&gt;=C2=A0 =C2=A0 =C2=A0pretty well and solves the problems in question.=C2=
=A0 Again, we could just<br>
&gt;=C2=A0 =C2=A0 =C2=A0make everything out-of-order and require using sync=
objs to order things<br>
&gt;=C2=A0 =C2=A0 =C2=A0as userspace wants. That&#39;d be fine too.<br>
&gt;=C2=A0 =C2=A0 =C2=A0One more note while I&#39;m here: danvet said somet=
hing on IRC about VM_BIND<br>
&gt;=C2=A0 =C2=A0 =C2=A0queues waiting for syncobjs to materialize.=C2=A0 W=
e don&#39;t really want/need<br>
&gt;=C2=A0 =C2=A0 =C2=A0this.=C2=A0 We already have all the machinery in us=
erspace to handle<br>
&gt;=C2=A0 =C2=A0 =C2=A0wait-before-signal and waiting for syncobj fences t=
o materialize and<br>
&gt;=C2=A0 =C2=A0 =C2=A0that machinery is on by default.=C2=A0 It would act=
ually take MORE work in<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mesa to turn it off and take advantage of the kerne=
l being able to wait<br>
&gt;=C2=A0 =C2=A0 =C2=A0for syncobjs to materialize.=C2=A0 Also, getting th=
at right is ridiculously<br>
&gt;=C2=A0 =C2=A0 =C2=A0hard and I really don&#39;t want to get it wrong in=
 kernel space.=C2=A0 When we<br>
&gt;=C2=A0 =C2=A0 =C2=A0do memory fences, wait-before-signal will be a thin=
g.=C2=A0 We don&#39;t need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0try and make it a thing for syncobj.<br>
&gt;=C2=A0 =C2=A0 =C2=A0--Jason<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Thanks Jason,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0I missed the bit in the Vulkan spec that we&#39;re allowed=
 to have a sparse<br>
&gt;=C2=A0 =C2=A0queue that does not implement either graphics or compute o=
perations :<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;While some implementations may include VK_QUE=
UE_SPARSE_BINDING_BIT<br>
&gt;=C2=A0 =C2=A0 =C2=A0support in queue families that also include<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 graphics and compute support, other implementation=
s may only expose a<br>
&gt;=C2=A0 =C2=A0 =C2=A0VK_QUEUE_SPARSE_BINDING_BIT-only queue<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 family.&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0So it can all be all a vm_bind engine that just does bind/=
unbind<br>
&gt;=C2=A0 =C2=A0operations.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0But yes we need another engine for the immediate/non-spars=
e operations.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0-Lionel<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Daniel, any thoughts?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Niranjana<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;Matt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Sorry I noticed this late.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; -Lionel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
</blockquote></div></div>

--000000000000a8f64905e0deb060--
