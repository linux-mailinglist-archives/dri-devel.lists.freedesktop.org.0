Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE1F53BFE2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8418113677;
	Thu,  2 Jun 2022 20:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B681113676
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:35:16 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id g4so10290263ybf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9WHOyRXlQv9E2Qgd/vEVdWnien9ef0bEtCp9rMf/rBE=;
 b=HDBih82gOCxujOSxsCVQnRGPC6gsc66ef5vYXgehH3N/GJJzFL6FLVcb99lzuKxfJn
 8+4kosXPQM+QHb6kQcax0NHlRsBojRMlhrWeN3MW9hr8sL1lgmRhnFteYOr3AhB64dOn
 tWuT/QXKQH8aqVVV7MH0fDOgbTQQ724E6YDsZWqQvHk5WalBL/XtGdxKBoIOtvZrStEq
 YFe0X2BM/EQyzA8bqaQfaS5JrMHR+Red3FrY8feMUFQsMF93fX1QL4E9CYCQCddwDm82
 5TS4Ea5z5C1myZ+/PTwKQXAJCo3Ix2y8vsHkaXE3+5DZNowL0PXRqpKOtwWsDEMV3K3T
 perQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9WHOyRXlQv9E2Qgd/vEVdWnien9ef0bEtCp9rMf/rBE=;
 b=eoVGaEZADs3A53IF9BJhoRxSjWrwsSXP/mCBVT6jXtLITRX7mGkQppq53JjUQIjWn7
 tNbp4uvHuse2h3lRklCMt2l/LjR9QTVAbou1BiCSFTKy4SVAu2d9Gn/gHw6k+DZsyQ3V
 vA1Kotg603LRSipEiylpdwjWIJmsaTKQQ1FouEnlG6UUQL17MtPt4dHsr6V5ZgcwTUbj
 9o2tiT1klNr+2/G+kPKAS3megBnF2iJ5DdZRJXm/bZUtuBZK2Tcw8E2ES+D/3axNImkr
 xOLGtPcOvNjA5v/5mrMbz1uj+owgf/acqPodBEuJWPlTa6Q+czQMaEcW7U5CVGWbilMD
 G74A==
X-Gm-Message-State: AOAM530I9nKsNzenQOs0KKwJFdlII1GcXXr7KPMS9cw5hz0uWbbv3RRj
 WXENbVE7qgqv8KLifMoU36N7a8eA3KAX6t1xd/yf2A==
X-Google-Smtp-Source: ABdhPJy0MuJmMEPu6x3Uu7akXFBc5R0CVN7IG4kfs/wE3Q5FIqx9guRk4+0cxl/oz0Nd4/OT2iMWiUxFThIONZDG/w4=
X-Received: by 2002:a05:6902:100a:b0:660:44fa:7c03 with SMTP id
 w10-20020a056902100a00b0066044fa7c03mr5512924ybt.126.1654202115594; Thu, 02
 Jun 2022 13:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601202836.GA15346@jons-linux-dev-box>
 <20220602201112.GQ4461@nvishwa1-DESK>
In-Reply-To: <20220602201112.GQ4461@nvishwa1-DESK>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 2 Jun 2022 15:35:04 -0500
Message-ID: <CAOFGe94AXn_vqON++LpiCTqOspCrVZawcYmjL3W6A7tA5vjTpQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: multipart/alternative; boundary="0000000000007cb75f05e07cf179"
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
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007cb75f05e07cf179
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 2, 2022 at 3:11 PM Niranjana Vishwanathapura <
niranjana.vishwanathapura@intel.com> wrote:

> On Wed, Jun 01, 2022 at 01:28:36PM -0700, Matthew Brost wrote:
> >On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
> >> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
> >> > +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the
> mapping in an
> >> > +async worker. The binding and unbinding will work like a special GPU
> engine.
> >> > +The binding and unbinding operations are serialized and will wait on
> specified
> >> > +input fences before the operation and will signal the output fences
> upon the
> >> > +completion of the operation. Due to serialization, completion of an
> operation
> >> > +will also indicate that all previous operations are also complete.
> >>
> >> I guess we should avoid saying "will immediately start
> binding/unbinding" if
> >> there are fences involved.
> >>
> >> And the fact that it's happening in an async worker seem to imply it's
> not
> >> immediate.
> >>
>
> Ok, will fix.
> This was added because in earlier design binding was deferred until next
> execbuff.
> But now it is non-deferred (immediate in that sense). But yah, this is
> confusing
> and will fix it.
>
> >>
> >> I have a question on the behavior of the bind operation when no input
> fence
> >> is provided. Let say I do :
> >>
> >> VM_BIND (out_fence=fence1)
> >>
> >> VM_BIND (out_fence=fence2)
> >>
> >> VM_BIND (out_fence=fence3)
> >>
> >>
> >> In what order are the fences going to be signaled?
> >>
> >> In the order of VM_BIND ioctls? Or out of order?
> >>
> >> Because you wrote "serialized I assume it's : in order
> >>
>
> Yes, in the order of VM_BIND/UNBIND ioctls. Note that bind and unbind will
> use
> the same queue and hence are ordered.
>
> >>
> >> One thing I didn't realize is that because we only get one "VM_BIND"
> engine,
> >> there is a disconnect from the Vulkan specification.
> >>
> >> In Vulkan VM_BIND operations are serialized but per engine.
> >>
> >> So you could have something like this :
> >>
> >> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
> >>
> >> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
> >>
> >>
> >> fence1 is not signaled
> >>
> >> fence3 is signaled
> >>
> >> So the second VM_BIND will proceed before the first VM_BIND.
> >>
> >>
> >> I guess we can deal with that scenario in userspace by doing the wait
> >> ourselves in one thread per engines.
> >>
> >> But then it makes the VM_BIND input fences useless.
> >>
> >>
> >> Daniel : what do you think? Should be rework this or just deal with wait
> >> fences in userspace?
> >>
> >
> >My opinion is rework this but make the ordering via an engine param
> optional.
> >
> >e.g. A VM can be configured so all binds are ordered within the VM
> >
> >e.g. A VM can be configured so all binds accept an engine argument (in
> >the case of the i915 likely this is a gem context handle) and binds
> >ordered with respect to that engine.
> >
> >This gives UMDs options as the later likely consumes more KMD resources
> >so if a different UMD can live with binds being ordered within the VM
> >they can use a mode consuming less resources.
> >
>
> I think we need to be careful here if we are looking for some out of
> (submission) order completion of vm_bind/unbind.
> In-order completion means, in a batch of binds and unbinds to be
> completed in-order, user only needs to specify in-fence for the
> first bind/unbind call and the our-fence for the last bind/unbind
> call. Also, the VA released by an unbind call can be re-used by
> any subsequent bind call in that in-order batch.
>
> These things will break if binding/unbinding were to be allowed to
> go out of order (of submission) and user need to be extra careful
> not to run into pre-mature triggereing of out-fence and bind failing
> as VA is still in use etc.
>
> Also, VM_BIND binds the provided mapping on the specified address space
> (VM). So, the uapi is not engine/context specific.
>
> We can however add a 'queue' to the uapi which can be one from the
> pre-defined queues,
> I915_VM_BIND_QUEUE_0
> I915_VM_BIND_QUEUE_1
> ...
> I915_VM_BIND_QUEUE_(N-1)
>
> KMD will spawn an async work queue for each queue which will only
> bind the mappings on that queue in the order of submission.
> User can assign the queue to per engine or anything like that.
>
> But again here, user need to be careful and not deadlock these
> queues with circular dependency of fences.
>
> I prefer adding this later an as extension based on whether it
> is really helping with the implementation.
>

I can tell you right now that having everything on a single in-order queue
will not get us the perf we want.  What vulkan really wants is one of two
things:

 1. No implicit ordering of VM_BIND ops.  They just happen in whatever
their dependencies are resolved and we ensure ordering ourselves by having
a syncobj in the VkQueue.

 2. The ability to create multiple VM_BIND queues.  We need at least 2 but
I don't see why there needs to be a limit besides the limits the i915 API
already has on the number of engines.  Vulkan could expose multiple sparse
binding queues to the client if it's not arbitrarily limited.

Why?  Because Vulkan has two basic kind of bind operations and we don't
want any dependencies between them:

 1. Immediate.  These happen right after BO creation or maybe as part of
vkBindImageMemory() or VkBindBufferMemory().  These don't happen on a queue
and we don't want them serialized with anything.  To synchronize with
submit, we'll have a syncobj in the VkDevice which is signaled by all
immediate bind operations and make submits wait on it.

 2. Queued (sparse): These happen on a VkQueue which may be the same as a
render/compute queue or may be its own queue.  It's up to us what we want
to advertise.  From the Vulkan API PoV, this is like any other queue.
Operations on it wait on and signal semaphores.  If we have a VM_BIND
engine, we'd provide syncobjs to wait and signal just like we do in
execbuf().

The important thing is that we don't want one type of operation to block on
the other.  If immediate binds are blocking on sparse binds, it's going to
cause over-synchronization issues.

In terms of the internal implementation, I know that there's going to be a
lock on the VM and that we can't actually do these things in parallel.
That's fine.  Once the dma_fences have signaled and we're unblocked to do
the bind operation, I don't care if there's a bit of synchronization due to
locking.  That's expected.  What we can't afford to have is an immediate
bind operation suddenly blocking on a sparse operation which is blocked on
a compute job that's going to run for another 5ms.

For reference, Windows solves this by allowing arbitrarily many paging
queues (what they call a VM_BIND engine/queue).  That design works pretty
well and solves the problems in question.  Again, we could just make
everything out-of-order and require using syncobjs to order things as
userspace wants. That'd be fine too.

One more note while I'm here: danvet said something on IRC about VM_BIND
queues waiting for syncobjs to materialize.  We don't really want/need
this.  We already have all the machinery in userspace to handle
wait-before-signal and waiting for syncobj fences to materialize and that
machinery is on by default.  It would actually take MORE work in Mesa to
turn it off and take advantage of the kernel being able to wait for
syncobjs to materialize.  Also, getting that right is ridiculously hard and
I really don't want to get it wrong in kernel space.  When we do memory
fences, wait-before-signal will be a thing.  We don't need to try and make
it a thing for syncobj.

--Jason


> Daniel, any thoughts?
>
> Niranjana
>
> >Matt
> >
> >>
> >> Sorry I noticed this late.
> >>
> >>
> >> -Lionel
> >>
> >>
>

--0000000000007cb75f05e07cf179
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jun 2, 2022 at 3:11 PM Niranjana Vishwanathapura &lt;<a href=
=3D"mailto:niranjana.vishwanathapura@intel.com">niranjana.vishwanathapura@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Jun 01, 2022 at 01:28:36PM -0700, Matthew Brost wrote:<br>
&gt;On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:<br>
&gt;&gt; On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:<br>
&gt;&gt; &gt; +VM_BIND/UNBIND ioctl will immediately start binding/unbindin=
g the mapping in an<br>
&gt;&gt; &gt; +async worker. The binding and unbinding will work like a spe=
cial GPU engine.<br>
&gt;&gt; &gt; +The binding and unbinding operations are serialized and will=
 wait on specified<br>
&gt;&gt; &gt; +input fences before the operation and will signal the output=
 fences upon the<br>
&gt;&gt; &gt; +completion of the operation. Due to serialization, completio=
n of an operation<br>
&gt;&gt; &gt; +will also indicate that all previous operations are also com=
plete.<br>
&gt;&gt;<br>
&gt;&gt; I guess we should avoid saying &quot;will immediately start bindin=
g/unbinding&quot; if<br>
&gt;&gt; there are fences involved.<br>
&gt;&gt;<br>
&gt;&gt; And the fact that it&#39;s happening in an async worker seem to im=
ply it&#39;s not<br>
&gt;&gt; immediate.<br>
&gt;&gt;<br>
<br>
Ok, will fix.<br>
This was added because in earlier design binding was deferred until next ex=
ecbuff.<br>
But now it is non-deferred (immediate in that sense). But yah, this is conf=
using<br>
and will fix it.<br>
<br>
&gt;&gt;<br>
&gt;&gt; I have a question on the behavior of the bind operation when no in=
put fence<br>
&gt;&gt; is provided. Let say I do :<br>
&gt;&gt;<br>
&gt;&gt; VM_BIND (out_fence=3Dfence1)<br>
&gt;&gt;<br>
&gt;&gt; VM_BIND (out_fence=3Dfence2)<br>
&gt;&gt;<br>
&gt;&gt; VM_BIND (out_fence=3Dfence3)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; In what order are the fences going to be signaled?<br>
&gt;&gt;<br>
&gt;&gt; In the order of VM_BIND ioctls? Or out of order?<br>
&gt;&gt;<br>
&gt;&gt; Because you wrote &quot;serialized I assume it&#39;s : in order<br=
>
&gt;&gt;<br>
<br>
Yes, in the order of VM_BIND/UNBIND ioctls. Note that bind and unbind will =
use<br>
the same queue and hence are ordered.<br>
<br>
&gt;&gt;<br>
&gt;&gt; One thing I didn&#39;t realize is that because we only get one &qu=
ot;VM_BIND&quot; engine,<br>
&gt;&gt; there is a disconnect from the Vulkan specification.<br>
&gt;&gt;<br>
&gt;&gt; In Vulkan VM_BIND operations are serialized but per engine.<br>
&gt;&gt;<br>
&gt;&gt; So you could have something like this :<br>
&gt;&gt;<br>
&gt;&gt; VM_BIND (engine=3Drcs0, in_fence=3Dfence1, out_fence=3Dfence2)<br>
&gt;&gt;<br>
&gt;&gt; VM_BIND (engine=3Dccs0, in_fence=3Dfence3, out_fence=3Dfence4)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; fence1 is not signaled<br>
&gt;&gt;<br>
&gt;&gt; fence3 is signaled<br>
&gt;&gt;<br>
&gt;&gt; So the second VM_BIND will proceed before the first VM_BIND.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I guess we can deal with that scenario in userspace by doing the w=
ait<br>
&gt;&gt; ourselves in one thread per engines.<br>
&gt;&gt;<br>
&gt;&gt; But then it makes the VM_BIND input fences useless.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Daniel : what do you think? Should be rework this or just deal wit=
h wait<br>
&gt;&gt; fences in userspace?<br>
&gt;&gt;<br>
&gt;<br>
&gt;My opinion is rework this but make the ordering via an engine param opt=
ional.<br>
&gt;<br>
&gt;e.g. A VM can be configured so all binds are ordered within the VM<br>
&gt;<br>
&gt;e.g. A VM can be configured so all binds accept an engine argument (in<=
br>
&gt;the case of the i915 likely this is a gem context handle) and binds<br>
&gt;ordered with respect to that engine.<br>
&gt;<br>
&gt;This gives UMDs options as the later likely consumes more KMD resources=
<br>
&gt;so if a different UMD can live with binds being ordered within the VM<b=
r>
&gt;they can use a mode consuming less resources.<br>
&gt;<br>
<br>
I think we need to be careful here if we are looking for some out of<br>
(submission) order completion of vm_bind/unbind.<br>
In-order completion means, in a batch of binds and unbinds to be<br>
completed in-order, user only needs to specify in-fence for the<br>
first bind/unbind call and the our-fence for the last bind/unbind<br>
call. Also, the VA released by an unbind call can be re-used by<br>
any subsequent bind call in that in-order batch.<br>
<br>
These things will break if binding/unbinding were to be allowed to<br>
go out of order (of submission) and user need to be extra careful<br>
not to run into pre-mature triggereing of out-fence and bind failing<br>
as VA is still in use etc.<br>
<br>
Also, VM_BIND binds the provided mapping on the specified address space<br>
(VM). So, the uapi is not engine/context specific.<br>
<br>
We can however add a &#39;queue&#39; to the uapi which can be one from the<=
br>
pre-defined queues,<br>
I915_VM_BIND_QUEUE_0<br>
I915_VM_BIND_QUEUE_1<br>
...<br>
I915_VM_BIND_QUEUE_(N-1)<br>
<br>
KMD will spawn an async work queue for each queue which will only<br>
bind the mappings on that queue in the order of submission.<br>
User can assign the queue to per engine or anything like that.<br>
<br>
But again here, user need to be careful and not deadlock these<br>
queues with circular dependency of fences.<br>
<br>
I prefer adding this later an as extension based on whether it<br>
is really helping with the implementation.<br></blockquote><div><br></div><=
div>I can tell you right now that having everything on a single in-order qu=
eue will not get us the perf we want.=C2=A0 What vulkan really wants is one=
 of two things:</div><div><br></div><div>=C2=A01. No implicit ordering of V=
M_BIND ops.=C2=A0 They just happen in whatever their dependencies are resol=
ved and we ensure ordering ourselves by having a syncobj in the VkQueue.<br=
></div><div><br></div><div>=C2=A02. The ability to create multiple VM_BIND =
queues.=C2=A0 We need at least 2 but I don&#39;t see why there needs to be =
a limit besides the limits the i915 API already has on the number of engine=
s.=C2=A0 Vulkan could expose multiple sparse binding queues to the client i=
f it&#39;s not arbitrarily limited.<br></div><div><br></div><div>Why?=C2=A0=
 Because Vulkan has two basic kind of bind operations and we don&#39;t want=
 any dependencies between them:</div><div><br></div><div>=C2=A01. Immediate=
.=C2=A0 These happen right after BO creation or maybe as part of vkBindImag=
eMemory() or VkBindBufferMemory().=C2=A0 These don&#39;t happen on a queue =
and we don&#39;t want them serialized with anything.=C2=A0 To synchronize w=
ith submit, we&#39;ll have a syncobj in the VkDevice which is signaled by a=
ll immediate bind operations and make submits wait on it.</div><div><br></d=
iv><div>=C2=A02. Queued (sparse): These happen on a VkQueue which may be th=
e same as a render/compute queue or may be its own queue.=C2=A0 It&#39;s up=
 to us what we want to advertise.=C2=A0 From the Vulkan API PoV, this is li=
ke any other queue.=C2=A0 Operations on it wait on and signal semaphores.=
=C2=A0 If we have a VM_BIND engine, we&#39;d provide syncobjs to wait and s=
ignal just like we do in execbuf().</div><div><br></div><div>The important =
thing is that we don&#39;t want one type of operation to block on the other=
.=C2=A0 If immediate binds are blocking on sparse binds, it&#39;s going to =
cause over-synchronization issues.</div><div><br></div><div>In terms of the=
 internal implementation, I know that there&#39;s going to be a lock on the=
 VM and that we can&#39;t actually do these things in parallel.=C2=A0 That&=
#39;s fine.=C2=A0 Once the dma_fences have signaled and we&#39;re unblocked=
 to do the bind operation, I don&#39;t care if there&#39;s a bit of synchro=
nization due to locking.=C2=A0 That&#39;s expected.=C2=A0 What we can&#39;t=
 afford to have is an immediate bind operation suddenly blocking on a spars=
e operation which is blocked on a compute job that&#39;s going to run for a=
nother 5ms.</div><div><br></div><div>For reference, Windows solves this by =
allowing arbitrarily many paging queues (what they call a VM_BIND engine/qu=
eue).=C2=A0 That design works pretty well and solves the problems in questi=
on.=C2=A0 Again, we could just make everything out-of-order and require usi=
ng syncobjs to order things as userspace wants. That&#39;d be fine too.<br>=
</div><div><br></div><div>One more note while I&#39;m here: danvet said som=
ething on IRC about VM_BIND queues waiting for syncobjs to materialize.=C2=
=A0 We don&#39;t really want/need this.=C2=A0 We already have all the machi=
nery in userspace to handle wait-before-signal and waiting for syncobj fenc=
es to materialize and that machinery is on by default.=C2=A0 It would actua=
lly take MORE work in Mesa to turn it off and take advantage of the kernel =
being able to wait for syncobjs to materialize.=C2=A0 Also, getting that ri=
ght is ridiculously hard and I really don&#39;t want to get it wrong in ker=
nel space.=C2=A0 When we do memory fences, wait-before-signal will be a thi=
ng.=C2=A0 We don&#39;t need to try and make it a thing for syncobj.<br></di=
v><div><br></div><div>--Jason<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--0000000000007cb75f05e07cf179--
