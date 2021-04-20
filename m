Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7558E365053
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 04:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7B389E7C;
	Tue, 20 Apr 2021 02:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAACE89E63;
 Tue, 20 Apr 2021 02:26:22 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id c3so5703801pfo.3;
 Mon, 19 Apr 2021 19:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/7Vb8m0njKeTT4GQ6W18v40tMKNrJl18yjti7JtnlQE=;
 b=nDEZ2I7wpXfFSPVTv+il+x4ZApHzCgxonk6iAI6qn3z3MtexjFk7z7geSwn3Yz5PZK
 csg+MxVWmm3+PNZB19QJJ5VMFQy0jyD1w68Q/BirDoD9ONOG5qZ0dgQmnysV4+QCCaIg
 b9wguFYTWf4DOdzh9GWzd3XiynuveR5stcNUAEmZBPX1ywKufgj5k6/YuMAorpfZWxtJ
 LUYGdyayENIAqU9oEMqO8KAqqP03Y6dInEbo4ltlPIXxw/VBBPlxTh/vdWJHaWtS6sbC
 YJj+T3QhuB95dF4mYEBZFdNeZxx7ZJ1OdvSjKa4RvF0pOZqAQNosCsoclkm+mqqDCqID
 izlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/7Vb8m0njKeTT4GQ6W18v40tMKNrJl18yjti7JtnlQE=;
 b=hZteLl29YLNJeKQK35IMsYw97q9u2gtez47caJzdaqjUJYOVtHKaEG6D3xj/tLja0H
 fF66oFHixMiVY0m4IWpTy8SHqfAzm//ENU1XlLVPOHA6ACuwgKlpAm8PDUjeJ+xIXxjp
 ibnDRvoGgicUNyzuOPXPkq2HRMAE4AIOdRXwtnRxC1ZUrmpnHtRxoXvS6pKkeCuUXJYF
 kTbCIs40eXSLok4DdY27oE/Y8W7t+tDW20CuSr3oY+ay18vrkaGcP/i87tWq6co3KNma
 x7qFglEMAxQfiOoxztNq7tIRkbtxeL4Jc+neUJSBuLyC5D1dVD6/b1L74FTbizgTz8Ty
 tFQw==
X-Gm-Message-State: AOAM531ZFAHJvOXE7eRtPebbHFMdyyc6eOaqiLSkAc+SruFCcgYvErRp
 7BBjWRZ7UJxHCb/OpMD68Zclf+2wNTJz3XRIoyRomuduhsX0TA==
X-Google-Smtp-Source: ABdhPJy6TTDYKVc2HnvilrOd6fuzbyv2J7BmFv1fqudfyya8uTG44uyUwXtLlRl2emMXM3c9E2mMFt+cVm6pjinjM+Q=
X-Received: by 2002:a62:7d07:0:b029:21b:d1bc:f6c8 with SMTP id
 y7-20020a627d070000b029021bd1bcf6c8mr22353713pfc.45.1618885582583; Mon, 19
 Apr 2021 19:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAOFGe95xnRjqVHssoOVvERP12KUnD2FHhG_LfqE6Z0h9nFH9AA@mail.gmail.com>
In-Reply-To: <CAOFGe95xnRjqVHssoOVvERP12KUnD2FHhG_LfqE6Z0h9nFH9AA@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 19 Apr 2021 22:25:46 -0400
Message-ID: <CAAxE2A6a15bs1=uANUwAu_zveeDvdaNfBR6b+=x_zagzpwHM_w@mail.gmail.com>
Subject: Re: [RFC] Linux Graphics Next: Explicit fences everywhere and no BO
 fences - initial proposal
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1079550989=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1079550989==
Content-Type: multipart/alternative; boundary="00000000000014faef05c05e2cf6"

--00000000000014faef05c05e2cf6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We already don't have accurate BO fences in some cases. Instead, BOs can
have fences which are equal to the last seen command buffer for each queue.
It's practically the same as if the kernel had no visibility into command
submissions and just added a fence into all queues when it needed to wait
for idle. That's already one alternative to BO fences that would work
today. The only BOs that need accurate BO fences are shared buffers, and
those use cases can be converted to explicit fences.

Removing memory management from all command buffer submission logic would
be one of the benefits that is quite appealing.

You don't need to depend on apps for budgeting and placement determination.
You can sort buffers according to driver usage, e.g. scratch/spill buffers,
shader IO rings, MSAA images, other images, and buffers. Alternatively, you
can have just internal buffers vs app buffers. Then you assign VRAM from
left to right until you reach the quota. This is optional, so this part can
be ignored.

>> - A GPU hang signals all fences. Other deadlocks will be handled like
GPU hangs.
>
>What do you mean by "all"?  All fences that were supposed to be
>signaled by the hung context?

Yes, that's one of the possibilities. Any GPU hang followed by a GPU reset
can clear VRAM, so all processes should recreate their contexts and
reinitialize resources. A deadlock caused by userspace could be handled
similarly.

I don't know how timeline fences would work across processes and how
resilient they would be to segfaults.

Marek

On Mon, Apr 19, 2021 at 11:48 AM Jason Ekstrand <jason@jlekstrand.net>
wrote:

> Not going to comment on everything on the first pass...
>
> On Mon, Apr 19, 2021 at 5:48 AM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> =
wrote:
> >
> > Hi,
> >
> > This is our initial proposal for explicit fences everywhere and new
> memory management that doesn't use BO fences. It's a redesign of how Linu=
x
> graphics drivers work, and it can coexist with what we have now.
> >
> >
> > 1. Introduction
> > (skip this if you are already sold on explicit fences)
> >
> > The current Linux graphics architecture was initially designed for GPUs
> with only one graphics queue where everything was executed in the
> submission order and per-BO fences were used for memory management and
> CPU-GPU synchronization, not GPU-GPU synchronization. Later, multiple
> queues were added on top, which required the introduction of implicit
> GPU-GPU synchronization between queues of different processes using per-B=
O
> fences. Recently, even parallel execution within one queue was enabled
> where a command buffer starts draws and compute shaders, but doesn't wait
> for them, enabling parallelism between back-to-back command buffers.
> Modesetting also uses per-BO fences for scheduling flips. Our GPU schedul=
er
> was created to enable all those use cases, and it's the only reason why t=
he
> scheduler exists.
> >
> > The GPU scheduler, implicit synchronization, BO-fence-based memory
> management, and the tracking of per-BO fences increase CPU overhead and
> latency, and reduce parallelism. There is a desire to replace all of them
> with something much simpler. Below is how we could do it.
> >
> >
> > 2. Explicit synchronization for window systems and modesetting
> >
> > The producer is an application and the consumer is a compositor or a
> modesetting driver.
> >
> > 2.1. The Present request
> >
> > As part of the Present request, the producer will pass 2 fences (sync
> objects) to the consumer alongside the presented DMABUF BO:
> > - The submit fence: Initially unsignalled, it will be signalled when th=
e
> producer has finished drawing into the presented buffer.
> > - The return fence: Initially unsignalled, it will be signalled when th=
e
> consumer has finished using the presented buffer.
>
> I'm not sure syncobj is what we want.  In the Intel world we're trying
> to go even further to something we're calling "userspace fences" which
> are a timeline implemented as a single 64-bit value in some
> CPU-mappable BO.  The client writes a higher value into the BO to
> signal the timeline.  The kernel then provides some helpers for
> waiting on them reliably and without spinning.  I don't expect
> everyone to support these right away but, If we're going to re-plumb
> userspace for explicit synchronization, I'd like to make sure we take
> this into account so we only have to do it once.
>
>
> > Deadlock mitigation to recover from segfaults:
> > - The kernel knows which process is obliged to signal which fence. This
> information is part of the Present request and supplied by userspace.
>
> This isn't clear to me.  Yes, if we're using anything dma-fence based
> like syncobj, this is true.  But it doesn't seem totally true as a
> general statement.
>
>
> > - If the producer crashes, the kernel signals the submit fence, so that
> the consumer can make forward progress.
> > - If the consumer crashes, the kernel signals the return fence, so that
> the producer can reclaim the buffer.
> > - A GPU hang signals all fences. Other deadlocks will be handled like
> GPU hangs.
>
> What do you mean by "all"?  All fences that were supposed to be
> signaled by the hung context?
>
>
> >
> > Other window system requests can follow the same idea.
> >
> > Merged fences where one fence object contains multiple fences will be
> supported. A merged fence is signalled only when its fences are signalled=
.
> The consumer will have the option to redefine the unsignalled return fenc=
e
> to a merged fence.
> >
> > 2.2. Modesetting
> >
> > Since a modesetting driver can also be the consumer, the present ioctl
> will contain a submit fence and a return fence too. One small problem wit=
h
> this is that userspace can hang the modesetting driver, but in theory, an=
y
> later present ioctl can override the previous one, so the unsignalled
> presentation is never used.
> >
> >
> > 3. New memory management
> >
> > The per-BO fences will be removed and the kernel will not know which
> buffers are busy. This will reduce CPU overhead and latency. The kernel
> will not need per-BO fences with explicit synchronization, so we just nee=
d
> to remove their last user: buffer evictions. It also resolves the current
> OOM deadlock.
>
> Is this even really possible?  I'm no kernel MM expert (trying to
> learn some) but my understanding is that the use of per-BO dma-fence
> runs deep.  I would like to stop using it for implicit synchronization
> to be sure, but I'm not sure I believe the claim that we can get rid
> of it entirely.  Happy to see someone try, though.
>
>
> > 3.1. Evictions
> >
> > If the kernel wants to move a buffer, it will have to wait for
> everything to go idle, halt all userspace command submissions, move the
> buffer, and resume everything. This is not expected to happen when memory
> is not exhausted. Other more efficient ways of synchronization are also
> possible (e.g. sync only one process), but are not discussed here.
> >
> > 3.2. Per-process VRAM usage quota
> >
> > Each process can optionally and periodically query its VRAM usage quota
> and change domains of its buffers to obey that quota. For example, a
> process allocated 2 GB of buffers in VRAM, but the kernel decreased the
> quota to 1 GB. The process can change the domains of the least important
> buffers to GTT to get the best outcome for itself. If the process doesn't
> do it, the kernel will choose which buffers to evict at random. (thanks t=
o
> Christian Koenig for this idea)
>
> This is going to be difficult.  On Intel, we have some resources that
> have to be pinned to VRAM and can't be dynamically swapped out by the
> kernel.  In GL, we probably can deal with it somewhat dynamically.  In
> Vulkan, we'll be entirely dependent on the application to use the
> appropriate Vulkan memory budget APIs.
>
> --Jason
>
>
> > 3.3. Buffer destruction without per-BO fences
> >
> > When the buffer destroy ioctl is called, an optional fence list can be
> passed to the kernel to indicate when it's safe to deallocate the buffer.
> If the fence list is empty, the buffer will be deallocated immediately.
> Shared buffers will be handled by merging fence lists from all processes
> that destroy them. Mitigation of malicious behavior:
> > - If userspace destroys a busy buffer, it will get a GPU page fault.
> > - If userspace sends fences that never signal, the kernel will have a
> timeout period and then will proceed to deallocate the buffer anyway.
> >
> > 3.4. Other notes on MM
> >
> > Overcommitment of GPU-accessible memory will cause an allocation failur=
e
> or invoke the OOM killer. Evictions to GPU-inaccessible memory might not =
be
> supported.
> >
> > Kernel drivers could move to this new memory management today. Only
> buffer residency and evictions would stop using per-BO fences.
> >
> >
> > 4. Deprecating implicit synchronization
> >
> > It can be phased out by introducing a new generation of hardware where
> the driver doesn't add support for it (like a driver fork would do),
> assuming userspace has all the changes for explicit synchronization. This
> could potentially create an isolated part of the kernel DRM where all
> drivers only support explicit synchronization.
> >
> > Marek
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--00000000000014faef05c05e2cf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We already don&#39;t have accurate BO fences in some =
cases. Instead, BOs can have fences which are equal to the last seen comman=
d buffer for each queue. It&#39;s practically the same as if the kernel had=
 no visibility into command submissions and just added a fence into all que=
ues when it needed to wait for idle. That&#39;s already one alternative to =
BO fences that would work today. The only BOs that need accurate BO fences =
are shared buffers, and those use cases can be converted to explicit fences=
.</div><div><br></div><div>Removing memory management from all command buff=
er submission logic would be one of the benefits that is quite appealing.<b=
r></div><div><br></div><div>You don&#39;t need to depend on apps for budget=
ing and placement determination. You can sort buffers according to driver u=
sage, e.g. scratch/spill buffers, shader IO rings, MSAA images, other image=
s, and buffers. Alternatively, you can have just internal buffers vs app bu=
ffers. Then you assign VRAM from left to right until you reach the quota. T=
his is optional, so this part can be ignored.</div><div><br></div><div><spa=
n class=3D"gmail-im">&gt;&gt; - A GPU hang signals all fences. Other deadlo=
cks will be handled like GPU hangs.<br>
&gt;<br></span>&gt;What do you mean by &quot;all&quot;?=C2=A0 All fences th=
at were supposed to be<br>&gt;signaled by the hung context?<span class=3D"g=
mail-im"><br>
</span></div><div><br></div><div>Yes, that&#39;s one of the possibilities. =
Any GPU hang followed by a GPU reset can clear VRAM, so all processes shoul=
d recreate their contexts and reinitialize resources. A deadlock caused by =
userspace could be handled similarly.<br></div><div><br></div><div>I don&#3=
9;t know how timeline fences would work across processes and how resilient =
they would be to segfaults.<br></div><div><br></div><div>Marek<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Apr 19, 2021 at 11:48 AM Jason Ekstrand &lt;<a href=3D"mailto:jason@jl=
ekstrand.net" target=3D"_blank">jason@jlekstrand.net</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Not going to comment on=
 everything on the first pass...<br>
<br>
On Mon, Apr 19, 2021 at 5:48 AM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto=
:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; This is our initial proposal for explicit fences everywhere and new me=
mory management that doesn&#39;t use BO fences. It&#39;s a redesign of how =
Linux graphics drivers work, and it can coexist with what we have now.<br>
&gt;<br>
&gt;<br>
&gt; 1. Introduction<br>
&gt; (skip this if you are already sold on explicit fences)<br>
&gt;<br>
&gt; The current Linux graphics architecture was initially designed for GPU=
s with only one graphics queue where everything was executed in the submiss=
ion order and per-BO fences were used for memory management and CPU-GPU syn=
chronization, not GPU-GPU synchronization. Later, multiple queues were adde=
d on top, which required the introduction of implicit GPU-GPU synchronizati=
on between queues of different processes using per-BO fences. Recently, eve=
n parallel execution within one queue was enabled where a command buffer st=
arts draws and compute shaders, but doesn&#39;t wait for them, enabling par=
allelism between back-to-back command buffers. Modesetting also uses per-BO=
 fences for scheduling flips. Our GPU scheduler was created to enable all t=
hose use cases, and it&#39;s the only reason why the scheduler exists.<br>
&gt;<br>
&gt; The GPU scheduler, implicit synchronization, BO-fence-based memory man=
agement, and the tracking of per-BO fences increase CPU overhead and latenc=
y, and reduce parallelism. There is a desire to replace all of them with so=
mething much simpler. Below is how we could do it.<br>
&gt;<br>
&gt;<br>
&gt; 2. Explicit synchronization for window systems and modesetting<br>
&gt;<br>
&gt; The producer is an application and the consumer is a compositor or a m=
odesetting driver.<br>
&gt;<br>
&gt; 2.1. The Present request<br>
&gt;<br>
&gt; As part of the Present request, the producer will pass 2 fences (sync =
objects) to the consumer alongside the presented DMABUF BO:<br>
&gt; - The submit fence: Initially unsignalled, it will be signalled when t=
he producer has finished drawing into the presented buffer.<br>
&gt; - The return fence: Initially unsignalled, it will be signalled when t=
he consumer has finished using the presented buffer.<br>
<br>
I&#39;m not sure syncobj is what we want.=C2=A0 In the Intel world we&#39;r=
e trying<br>
to go even further to something we&#39;re calling &quot;userspace fences&qu=
ot; which<br>
are a timeline implemented as a single 64-bit value in some<br>
CPU-mappable BO.=C2=A0 The client writes a higher value into the BO to<br>
signal the timeline.=C2=A0 The kernel then provides some helpers for<br>
waiting on them reliably and without spinning.=C2=A0 I don&#39;t expect<br>
everyone to support these right away but, If we&#39;re going to re-plumb<br=
>
userspace for explicit synchronization, I&#39;d like to make sure we take<b=
r>
this into account so we only have to do it once.<br>
<br>
<br>
&gt; Deadlock mitigation to recover from segfaults:<br>
&gt; - The kernel knows which process is obliged to signal which fence. Thi=
s information is part of the Present request and supplied by userspace.<br>
<br>
This isn&#39;t clear to me.=C2=A0 Yes, if we&#39;re using anything dma-fenc=
e based<br>
like syncobj, this is true.=C2=A0 But it doesn&#39;t seem totally true as a=
<br>
general statement.<br>
<br>
<br>
&gt; - If the producer crashes, the kernel signals the submit fence, so tha=
t the consumer can make forward progress.<br>
&gt; - If the consumer crashes, the kernel signals the return fence, so tha=
t the producer can reclaim the buffer.<br>
&gt; - A GPU hang signals all fences. Other deadlocks will be handled like =
GPU hangs.<br>
<br>
What do you mean by &quot;all&quot;?=C2=A0 All fences that were supposed to=
 be<br>
signaled by the hung context?<br>
<br>
<br>
&gt;<br>
&gt; Other window system requests can follow the same idea.<br>
&gt;<br>
&gt; Merged fences where one fence object contains multiple fences will be =
supported. A merged fence is signalled only when its fences are signalled. =
The consumer will have the option to redefine the unsignalled return fence =
to a merged fence.<br>
&gt;<br>
&gt; 2.2. Modesetting<br>
&gt;<br>
&gt; Since a modesetting driver can also be the consumer, the present ioctl=
 will contain a submit fence and a return fence too. One small problem with=
 this is that userspace can hang the modesetting driver, but in theory, any=
 later present ioctl can override the previous one, so the unsignalled pres=
entation is never used.<br>
&gt;<br>
&gt;<br>
&gt; 3. New memory management<br>
&gt;<br>
&gt; The per-BO fences will be removed and the kernel will not know which b=
uffers are busy. This will reduce CPU overhead and latency. The kernel will=
 not need per-BO fences with explicit synchronization, so we just need to r=
emove their last user: buffer evictions. It also resolves the current OOM d=
eadlock.<br>
<br>
Is this even really possible?=C2=A0 I&#39;m no kernel MM expert (trying to<=
br>
learn some) but my understanding is that the use of per-BO dma-fence<br>
runs deep.=C2=A0 I would like to stop using it for implicit synchronization=
<br>
to be sure, but I&#39;m not sure I believe the claim that we can get rid<br=
>
of it entirely.=C2=A0 Happy to see someone try, though.<br>
<br>
<br>
&gt; 3.1. Evictions<br>
&gt;<br>
&gt; If the kernel wants to move a buffer, it will have to wait for everyth=
ing to go idle, halt all userspace command submissions, move the buffer, an=
d resume everything. This is not expected to happen when memory is not exha=
usted. Other more efficient ways of synchronization are also possible (e.g.=
 sync only one process), but are not discussed here.<br>
&gt;<br>
&gt; 3.2. Per-process VRAM usage quota<br>
&gt;<br>
&gt; Each process can optionally and periodically query its VRAM usage quot=
a and change domains of its buffers to obey that quota. For example, a proc=
ess allocated 2 GB of buffers in VRAM, but the kernel decreased the quota t=
o 1 GB. The process can change the domains of the least important buffers t=
o GTT to get the best outcome for itself. If the process doesn&#39;t do it,=
 the kernel will choose which buffers to evict at random. (thanks to Christ=
ian Koenig for this idea)<br>
<br>
This is going to be difficult.=C2=A0 On Intel, we have some resources that<=
br>
have to be pinned to VRAM and can&#39;t be dynamically swapped out by the<b=
r>
kernel.=C2=A0 In GL, we probably can deal with it somewhat dynamically.=C2=
=A0 In<br>
Vulkan, we&#39;ll be entirely dependent on the application to use the<br>
appropriate Vulkan memory budget APIs.<br>
<br>
--Jason<br>
<br>
<br>
&gt; 3.3. Buffer destruction without per-BO fences<br>
&gt;<br>
&gt; When the buffer destroy ioctl is called, an optional fence list can be=
 passed to the kernel to indicate when it&#39;s safe to deallocate the buff=
er. If the fence list is empty, the buffer will be deallocated immediately.=
 Shared buffers will be handled by merging fence lists from all processes t=
hat destroy them. Mitigation of malicious behavior:<br>
&gt; - If userspace destroys a busy buffer, it will get a GPU page fault.<b=
r>
&gt; - If userspace sends fences that never signal, the kernel will have a =
timeout period and then will proceed to deallocate the buffer anyway.<br>
&gt;<br>
&gt; 3.4. Other notes on MM<br>
&gt;<br>
&gt; Overcommitment of GPU-accessible memory will cause an allocation failu=
re or invoke the OOM killer. Evictions to GPU-inaccessible memory might not=
 be supported.<br>
&gt;<br>
&gt; Kernel drivers could move to this new memory management today. Only bu=
ffer residency and evictions would stop using per-BO fences.<br>
&gt;<br>
&gt;<br>
&gt; 4. Deprecating implicit synchronization<br>
&gt;<br>
&gt; It can be phased out by introducing a new generation of hardware where=
 the driver doesn&#39;t add support for it (like a driver fork would do), a=
ssuming userspace has all the changes for explicit synchronization. This co=
uld potentially create an isolated part of the kernel DRM where all drivers=
 only support explicit synchronization.<br>
&gt;<br>
&gt; Marek<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div>

--00000000000014faef05c05e2cf6--

--===============1079550989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1079550989==--
