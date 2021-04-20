Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF1C36570F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 13:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F065B6E7E2;
	Tue, 20 Apr 2021 11:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0216E7DD;
 Tue, 20 Apr 2021 11:03:55 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id d10so26342388pgf.12;
 Tue, 20 Apr 2021 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c9l0yfihONZakEicItnBBcgkvsJBL/Ambg189h0A2tA=;
 b=Gy07xqblMZTJts7lyiecQ+xHDiGif8QaWCCQC0tsZ8UCw6zqQw5ZRUwvYaaM+Y5vxb
 RGwgma+B0B00tVgIlEmWn0x6y+PfC70ziwtUIxCrobUZFcX8IWtigcb7kGdAAzNx0Vab
 0RWk5UkRsAJ3l9RtRkSd9sMqaa5H1kUTaGUVCcwhg3rxi0JVYWjnG8dBF25rPvrrVRFP
 YZ5xbfZf/6HWr7J2UoYgpeyMS1M9ZLxhUUUnP20enYHSNlcgWvGG3zb9lxkFARgbApPr
 1+pVDXt8rlUd/iB/purA42A2Rr7kf1AE2ViV/01i2DT7W9NbWRyW1MIm5Flo3adRNE+k
 pqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9l0yfihONZakEicItnBBcgkvsJBL/Ambg189h0A2tA=;
 b=tnjnQXhVNO5W433TIs4VmNkjL/xA/MdeptjEUya+5KMw0ngbyeDs957+jdLSpzTi/O
 8qCervosoPGDCaax44qq55Di9kpmpzYJdx3m1ikynbdQ6rn4pwi0iJBATcFtn0iKU6XQ
 ijn5bmA6MLeX9mAr8K+dhTG9jY2pHC7EgMIJyUhivLeYA3VOE/gXcAqGV9rqE4np9RZE
 yCEWxEiiyP4kjtDsjmB8QhkAkuKgMp7FHSvmZ0EGUu9PJLKY+dQIGH27r5GVWqhK++qa
 tnSzD8KAIHlA8VPZ8wI3kX9Crk53OBVTtqa0HCxi+1vfaJuzznChxzy/5Xmj6aExQA7P
 PPYA==
X-Gm-Message-State: AOAM533NG32tBkFUbDruySIyHfKt9XjWv3oO22gotEaWmGeKUrYh/oCW
 NLjU64hhUZ3ptB1BwqY4SQJc9mFBE+ZuVY1qhZY=
X-Google-Smtp-Source: ABdhPJxxzl0uByUCe0l8j8QrvsZYBjU6Fsy4XxKJIGd3Pe+pRiL8mA5x8irTRLWWo4lrOTU3PAWjONuCHIOuaYdcvVU=
X-Received: by 2002:a05:6a00:b41:b029:261:fc0f:15f7 with SMTP id
 p1-20020a056a000b41b0290261fc0f15f7mr6334962pfo.30.1618916635527; Tue, 20 Apr
 2021 04:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAOFGe95xnRjqVHssoOVvERP12KUnD2FHhG_LfqE6Z0h9nFH9AA@mail.gmail.com>
 <926b18b2-2498-9fcb-8516-fa34510fb898@gmail.com>
 <CAKMK7uE3s2z8mDiuWs73Xg3PMsrr3WNg20q03V0EOyfZmmDFcQ@mail.gmail.com>
In-Reply-To: <CAKMK7uE3s2z8mDiuWs73Xg3PMsrr3WNg20q03V0EOyfZmmDFcQ@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 20 Apr 2021 07:03:19 -0400
Message-ID: <CAAxE2A6k0H0YHo4Fu8UO=pByOzdsz90LyB+qs+e2sMy4r6YKOQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0268591006=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0268591006==
Content-Type: multipart/alternative; boundary="000000000000fb4df405c06566de"

--000000000000fb4df405c06566de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Daniel, are you suggesting that we should skip any deadlock prevention in
the kernel, and just let userspace wait for and signal any fence it has
access to?

Do you have any concern with the deprecation/removal of BO fences in the
kernel assuming userspace is only using explicit fences? Any concern with
the submit and return fences for modesetting and other producer<->consumer
scenarios?

Thanks,
Marek

On Tue, Apr 20, 2021 at 6:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Apr 20, 2021 at 12:15 PM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 19.04.21 um 17:48 schrieb Jason Ekstrand:
> > > Not going to comment on everything on the first pass...
> > >
> > > On Mon, Apr 19, 2021 at 5:48 AM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.c=
om> wrote:
> > >> Hi,
> > >>
> > >> This is our initial proposal for explicit fences everywhere and new
> memory management that doesn't use BO fences. It's a redesign of how Linu=
x
> graphics drivers work, and it can coexist with what we have now.
> > >>
> > >>
> > >> 1. Introduction
> > >> (skip this if you are already sold on explicit fences)
> > >>
> > >> The current Linux graphics architecture was initially designed for
> GPUs with only one graphics queue where everything was executed in the
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
> > >>
> > >> The GPU scheduler, implicit synchronization, BO-fence-based memory
> management, and the tracking of per-BO fences increase CPU overhead and
> latency, and reduce parallelism. There is a desire to replace all of them
> with something much simpler. Below is how we could do it.
> > >>
> > >>
> > >> 2. Explicit synchronization for window systems and modesetting
> > >>
> > >> The producer is an application and the consumer is a compositor or a
> modesetting driver.
> > >>
> > >> 2.1. The Present request
> > >>
> > >> As part of the Present request, the producer will pass 2 fences (syn=
c
> objects) to the consumer alongside the presented DMABUF BO:
> > >> - The submit fence: Initially unsignalled, it will be signalled when
> the producer has finished drawing into the presented buffer.
> > >> - The return fence: Initially unsignalled, it will be signalled when
> the consumer has finished using the presented buffer.
> > > I'm not sure syncobj is what we want.  In the Intel world we're tryin=
g
> > > to go even further to something we're calling "userspace fences" whic=
h
> > > are a timeline implemented as a single 64-bit value in some
> > > CPU-mappable BO.  The client writes a higher value into the BO to
> > > signal the timeline.
> >
> > Well that is exactly what our Windows guys have suggested as well, but
> > it strongly looks like that this isn't sufficient.
> >
> > First of all you run into security problems when any application can
> > just write any value to that memory location. Just imagine an
> > application sets the counter to zero and X waits forever for some
> > rendering to finish.
>
> The thing is, with userspace fences security boundary issue prevent
> moves into userspace entirely. And it really doesn't matter whether
> the event you're waiting on doesn't complete because the other app
> crashed or was stupid or intentionally gave you a wrong fence point:
> You have to somehow handle that, e.g. perhaps with conditional
> rendering and just using the old frame in compositing if the new one
> doesn't show up in time. Or something like that. So trying to get the
> kernel involved but also not so much involved sounds like a bad design
> to me.
>
> > Additional to that in such a model you can't determine who is the guilt=
y
> > queue in case of a hang and can't reset the synchronization primitives
> > in case of an error.
> >
> > Apart from that this is rather inefficient, e.g. we don't have any way
> > to prevent priority inversion when used as a synchronization mechanism
> > between different GPU queues.
>
> Yeah but you can't have it both ways. Either all the scheduling in the
> kernel and fence handling is a problem, or you actually want to
> schedule in the kernel. hw seems to definitely move towards the more
> stupid spinlock-in-hw model (and direct submit from userspace and all
> that), priority inversions be damned. I'm really not sure we should
> fight that - if it's really that inefficient then maybe hw will add
> support for waiting sync constructs in hardware, or at least be
> smarter about scheduling other stuff. E.g. on intel hw both the kernel
> scheduler and fw scheduler knows when you're spinning on a hw fence
> (whether userspace or kernel doesn't matter) and plugs in something
> else. Add in a bit of hw support to watch cachelines, and you have
> something which can handle both directions efficiently.
>
> Imo given where hw is going, we shouldn't try to be too clever here.
> The only thing we do need to provision is being able to do cpu side
> waits without spinning. And that should probably be done in a fairly
> gpu specific way still.
> -Daniel
>
> > Christian.
> >
> > >    The kernel then provides some helpers for
> > > waiting on them reliably and without spinning.  I don't expect
> > > everyone to support these right away but, If we're going to re-plumb
> > > userspace for explicit synchronization, I'd like to make sure we take
> > > this into account so we only have to do it once.
> > >
> > >
> > >> Deadlock mitigation to recover from segfaults:
> > >> - The kernel knows which process is obliged to signal which fence.
> This information is part of the Present request and supplied by userspace=
.
> > > This isn't clear to me.  Yes, if we're using anything dma-fence based
> > > like syncobj, this is true.  But it doesn't seem totally true as a
> > > general statement.
> > >
> > >
> > >> - If the producer crashes, the kernel signals the submit fence, so
> that the consumer can make forward progress.
> > >> - If the consumer crashes, the kernel signals the return fence, so
> that the producer can reclaim the buffer.
> > >> - A GPU hang signals all fences. Other deadlocks will be handled lik=
e
> GPU hangs.
> > > What do you mean by "all"?  All fences that were supposed to be
> > > signaled by the hung context?
> > >
> > >
> > >> Other window system requests can follow the same idea.
> > >>
> > >> Merged fences where one fence object contains multiple fences will b=
e
> supported. A merged fence is signalled only when its fences are signalled=
.
> The consumer will have the option to redefine the unsignalled return fenc=
e
> to a merged fence.
> > >>
> > >> 2.2. Modesetting
> > >>
> > >> Since a modesetting driver can also be the consumer, the present
> ioctl will contain a submit fence and a return fence too. One small probl=
em
> with this is that userspace can hang the modesetting driver, but in theor=
y,
> any later present ioctl can override the previous one, so the unsignalled
> presentation is never used.
> > >>
> > >>
> > >> 3. New memory management
> > >>
> > >> The per-BO fences will be removed and the kernel will not know which
> buffers are busy. This will reduce CPU overhead and latency. The kernel
> will not need per-BO fences with explicit synchronization, so we just nee=
d
> to remove their last user: buffer evictions. It also resolves the current
> OOM deadlock.
> > > Is this even really possible?  I'm no kernel MM expert (trying to
> > > learn some) but my understanding is that the use of per-BO dma-fence
> > > runs deep.  I would like to stop using it for implicit synchronizatio=
n
> > > to be sure, but I'm not sure I believe the claim that we can get rid
> > > of it entirely.  Happy to see someone try, though.
> > >
> > >
> > >> 3.1. Evictions
> > >>
> > >> If the kernel wants to move a buffer, it will have to wait for
> everything to go idle, halt all userspace command submissions, move the
> buffer, and resume everything. This is not expected to happen when memory
> is not exhausted. Other more efficient ways of synchronization are also
> possible (e.g. sync only one process), but are not discussed here.
> > >>
> > >> 3.2. Per-process VRAM usage quota
> > >>
> > >> Each process can optionally and periodically query its VRAM usage
> quota and change domains of its buffers to obey that quota. For example, =
a
> process allocated 2 GB of buffers in VRAM, but the kernel decreased the
> quota to 1 GB. The process can change the domains of the least important
> buffers to GTT to get the best outcome for itself. If the process doesn't
> do it, the kernel will choose which buffers to evict at random. (thanks t=
o
> Christian Koenig for this idea)
> > > This is going to be difficult.  On Intel, we have some resources that
> > > have to be pinned to VRAM and can't be dynamically swapped out by the
> > > kernel.  In GL, we probably can deal with it somewhat dynamically.  I=
n
> > > Vulkan, we'll be entirely dependent on the application to use the
> > > appropriate Vulkan memory budget APIs.
> > >
> > > --Jason
> > >
> > >
> > >> 3.3. Buffer destruction without per-BO fences
> > >>
> > >> When the buffer destroy ioctl is called, an optional fence list can
> be passed to the kernel to indicate when it's safe to deallocate the
> buffer. If the fence list is empty, the buffer will be deallocated
> immediately. Shared buffers will be handled by merging fence lists from a=
ll
> processes that destroy them. Mitigation of malicious behavior:
> > >> - If userspace destroys a busy buffer, it will get a GPU page fault.
> > >> - If userspace sends fences that never signal, the kernel will have =
a
> timeout period and then will proceed to deallocate the buffer anyway.
> > >>
> > >> 3.4. Other notes on MM
> > >>
> > >> Overcommitment of GPU-accessible memory will cause an allocation
> failure or invoke the OOM killer. Evictions to GPU-inaccessible memory
> might not be supported.
> > >>
> > >> Kernel drivers could move to this new memory management today. Only
> buffer residency and evictions would stop using per-BO fences.
> > >>
> > >>
> > >> 4. Deprecating implicit synchronization
> > >>
> > >> It can be phased out by introducing a new generation of hardware
> where the driver doesn't add support for it (like a driver fork would do)=
,
> assuming userspace has all the changes for explicit synchronization. This
> could potentially create an isolated part of the kernel DRM where all
> drivers only support explicit synchronization.
> > >>
> > >> Marek
> > >> _______________________________________________
> > >> dri-devel mailing list
> > >> dri-devel@lists.freedesktop.org
> > >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > _______________________________________________
> > > mesa-dev mailing list
> > > mesa-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000fb4df405c06566de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Daniel, are you suggesting that we should skip any de=
adlock prevention in the kernel, and just let userspace wait for and signal=
 any fence it has access to?</div><div><br></div><div>Do you have any conce=
rn with the deprecation/removal of BO fences in the kernel assuming userspa=
ce is only using explicit fences? Any concern with the submit and return fe=
nces for modesetting and other producer&lt;-&gt;consumer scenarios?</div><d=
iv><br></div><div>Thanks,</div><div>Marek<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 20, 2021 at =
6:34 AM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.c=
h</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Tue, Apr 20, 2021 at 12:15 PM Christian K=C3=B6nig<br>
&lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank">c=
koenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Am 19.04.21 um 17:48 schrieb Jason Ekstrand:<br>
&gt; &gt; Not going to comment on everything on the first pass...<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Apr 19, 2021 at 5:48 AM Marek Ol=C5=A1=C3=A1k &lt;<a href=
=3D"mailto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wro=
te:<br>
&gt; &gt;&gt; Hi,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This is our initial proposal for explicit fences everywhere a=
nd new memory management that doesn&#39;t use BO fences. It&#39;s a redesig=
n of how Linux graphics drivers work, and it can coexist with what we have =
now.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 1. Introduction<br>
&gt; &gt;&gt; (skip this if you are already sold on explicit fences)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The current Linux graphics architecture was initially designe=
d for GPUs with only one graphics queue where everything was executed in th=
e submission order and per-BO fences were used for memory management and CP=
U-GPU synchronization, not GPU-GPU synchronization. Later, multiple queues =
were added on top, which required the introduction of implicit GPU-GPU sync=
hronization between queues of different processes using per-BO fences. Rece=
ntly, even parallel execution within one queue was enabled where a command =
buffer starts draws and compute shaders, but doesn&#39;t wait for them, ena=
bling parallelism between back-to-back command buffers. Modesetting also us=
es per-BO fences for scheduling flips. Our GPU scheduler was created to ena=
ble all those use cases, and it&#39;s the only reason why the scheduler exi=
sts.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The GPU scheduler, implicit synchronization, BO-fence-based m=
emory management, and the tracking of per-BO fences increase CPU overhead a=
nd latency, and reduce parallelism. There is a desire to replace all of the=
m with something much simpler. Below is how we could do it.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 2. Explicit synchronization for window systems and modesettin=
g<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The producer is an application and the consumer is a composit=
or or a modesetting driver.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 2.1. The Present request<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; As part of the Present request, the producer will pass 2 fenc=
es (sync objects) to the consumer alongside the presented DMABUF BO:<br>
&gt; &gt;&gt; - The submit fence: Initially unsignalled, it will be signall=
ed when the producer has finished drawing into the presented buffer.<br>
&gt; &gt;&gt; - The return fence: Initially unsignalled, it will be signall=
ed when the consumer has finished using the presented buffer.<br>
&gt; &gt; I&#39;m not sure syncobj is what we want.=C2=A0 In the Intel worl=
d we&#39;re trying<br>
&gt; &gt; to go even further to something we&#39;re calling &quot;userspace=
 fences&quot; which<br>
&gt; &gt; are a timeline implemented as a single 64-bit value in some<br>
&gt; &gt; CPU-mappable BO.=C2=A0 The client writes a higher value into the =
BO to<br>
&gt; &gt; signal the timeline.<br>
&gt;<br>
&gt; Well that is exactly what our Windows guys have suggested as well, but=
<br>
&gt; it strongly looks like that this isn&#39;t sufficient.<br>
&gt;<br>
&gt; First of all you run into security problems when any application can<b=
r>
&gt; just write any value to that memory location. Just imagine an<br>
&gt; application sets the counter to zero and X waits forever for some<br>
&gt; rendering to finish.<br>
<br>
The thing is, with userspace fences security boundary issue prevent<br>
moves into userspace entirely. And it really doesn&#39;t matter whether<br>
the event you&#39;re waiting on doesn&#39;t complete because the other app<=
br>
crashed or was stupid or intentionally gave you a wrong fence point:<br>
You have to somehow handle that, e.g. perhaps with conditional<br>
rendering and just using the old frame in compositing if the new one<br>
doesn&#39;t show up in time. Or something like that. So trying to get the<b=
r>
kernel involved but also not so much involved sounds like a bad design<br>
to me.<br>
<br>
&gt; Additional to that in such a model you can&#39;t determine who is the =
guilty<br>
&gt; queue in case of a hang and can&#39;t reset the synchronization primit=
ives<br>
&gt; in case of an error.<br>
&gt;<br>
&gt; Apart from that this is rather inefficient, e.g. we don&#39;t have any=
 way<br>
&gt; to prevent priority inversion when used as a synchronization mechanism=
<br>
&gt; between different GPU queues.<br>
<br>
Yeah but you can&#39;t have it both ways. Either all the scheduling in the<=
br>
kernel and fence handling is a problem, or you actually want to<br>
schedule in the kernel. hw seems to definitely move towards the more<br>
stupid spinlock-in-hw model (and direct submit from userspace and all<br>
that), priority inversions be damned. I&#39;m really not sure we should<br>
fight that - if it&#39;s really that inefficient then maybe hw will add<br>
support for waiting sync constructs in hardware, or at least be<br>
smarter about scheduling other stuff. E.g. on intel hw both the kernel<br>
scheduler and fw scheduler knows when you&#39;re spinning on a hw fence<br>
(whether userspace or kernel doesn&#39;t matter) and plugs in something<br>
else. Add in a bit of hw support to watch cachelines, and you have<br>
something which can handle both directions efficiently.<br>
<br>
Imo given where hw is going, we shouldn&#39;t try to be too clever here.<br=
>
The only thing we do need to provision is being able to do cpu side<br>
waits without spinning. And that should probably be done in a fairly<br>
gpu specific way still.<br>
-Daniel<br>
<br>
&gt; Christian.<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 The kernel then provides some helpers for<br>
&gt; &gt; waiting on them reliably and without spinning.=C2=A0 I don&#39;t =
expect<br>
&gt; &gt; everyone to support these right away but, If we&#39;re going to r=
e-plumb<br>
&gt; &gt; userspace for explicit synchronization, I&#39;d like to make sure=
 we take<br>
&gt; &gt; this into account so we only have to do it once.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; Deadlock mitigation to recover from segfaults:<br>
&gt; &gt;&gt; - The kernel knows which process is obliged to signal which f=
ence. This information is part of the Present request and supplied by users=
pace.<br>
&gt; &gt; This isn&#39;t clear to me.=C2=A0 Yes, if we&#39;re using anythin=
g dma-fence based<br>
&gt; &gt; like syncobj, this is true.=C2=A0 But it doesn&#39;t seem totally=
 true as a<br>
&gt; &gt; general statement.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; - If the producer crashes, the kernel signals the submit fenc=
e, so that the consumer can make forward progress.<br>
&gt; &gt;&gt; - If the consumer crashes, the kernel signals the return fenc=
e, so that the producer can reclaim the buffer.<br>
&gt; &gt;&gt; - A GPU hang signals all fences. Other deadlocks will be hand=
led like GPU hangs.<br>
&gt; &gt; What do you mean by &quot;all&quot;?=C2=A0 All fences that were s=
upposed to be<br>
&gt; &gt; signaled by the hung context?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; Other window system requests can follow the same idea.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Merged fences where one fence object contains multiple fences=
 will be supported. A merged fence is signalled only when its fences are si=
gnalled. The consumer will have the option to redefine the unsignalled retu=
rn fence to a merged fence.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 2.2. Modesetting<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Since a modesetting driver can also be the consumer, the pres=
ent ioctl will contain a submit fence and a return fence too. One small pro=
blem with this is that userspace can hang the modesetting driver, but in th=
eory, any later present ioctl can override the previous one, so the unsigna=
lled presentation is never used.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 3. New memory management<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The per-BO fences will be removed and the kernel will not kno=
w which buffers are busy. This will reduce CPU overhead and latency. The ke=
rnel will not need per-BO fences with explicit synchronization, so we just =
need to remove their last user: buffer evictions. It also resolves the curr=
ent OOM deadlock.<br>
&gt; &gt; Is this even really possible?=C2=A0 I&#39;m no kernel MM expert (=
trying to<br>
&gt; &gt; learn some) but my understanding is that the use of per-BO dma-fe=
nce<br>
&gt; &gt; runs deep.=C2=A0 I would like to stop using it for implicit synch=
ronization<br>
&gt; &gt; to be sure, but I&#39;m not sure I believe the claim that we can =
get rid<br>
&gt; &gt; of it entirely.=C2=A0 Happy to see someone try, though.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; 3.1. Evictions<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If the kernel wants to move a buffer, it will have to wait fo=
r everything to go idle, halt all userspace command submissions, move the b=
uffer, and resume everything. This is not expected to happen when memory is=
 not exhausted. Other more efficient ways of synchronization are also possi=
ble (e.g. sync only one process), but are not discussed here.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 3.2. Per-process VRAM usage quota<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Each process can optionally and periodically query its VRAM u=
sage quota and change domains of its buffers to obey that quota. For exampl=
e, a process allocated 2 GB of buffers in VRAM, but the kernel decreased th=
e quota to 1 GB. The process can change the domains of the least important =
buffers to GTT to get the best outcome for itself. If the process doesn&#39=
;t do it, the kernel will choose which buffers to evict at random. (thanks =
to Christian Koenig for this idea)<br>
&gt; &gt; This is going to be difficult.=C2=A0 On Intel, we have some resou=
rces that<br>
&gt; &gt; have to be pinned to VRAM and can&#39;t be dynamically swapped ou=
t by the<br>
&gt; &gt; kernel.=C2=A0 In GL, we probably can deal with it somewhat dynami=
cally.=C2=A0 In<br>
&gt; &gt; Vulkan, we&#39;ll be entirely dependent on the application to use=
 the<br>
&gt; &gt; appropriate Vulkan memory budget APIs.<br>
&gt; &gt;<br>
&gt; &gt; --Jason<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; 3.3. Buffer destruction without per-BO fences<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; When the buffer destroy ioctl is called, an optional fence li=
st can be passed to the kernel to indicate when it&#39;s safe to deallocate=
 the buffer. If the fence list is empty, the buffer will be deallocated imm=
ediately. Shared buffers will be handled by merging fence lists from all pr=
ocesses that destroy them. Mitigation of malicious behavior:<br>
&gt; &gt;&gt; - If userspace destroys a busy buffer, it will get a GPU page=
 fault.<br>
&gt; &gt;&gt; - If userspace sends fences that never signal, the kernel wil=
l have a timeout period and then will proceed to deallocate the buffer anyw=
ay.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 3.4. Other notes on MM<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Overcommitment of GPU-accessible memory will cause an allocat=
ion failure or invoke the OOM killer. Evictions to GPU-inaccessible memory =
might not be supported.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Kernel drivers could move to this new memory management today=
. Only buffer residency and evictions would stop using per-BO fences.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 4. Deprecating implicit synchronization<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; It can be phased out by introducing a new generation of hardw=
are where the driver doesn&#39;t add support for it (like a driver fork wou=
ld do), assuming userspace has all the changes for explicit synchronization=
. This could potentially create an isolated part of the kernel DRM where al=
l drivers only support explicit synchronization.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Marek<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; dri-devel mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"=
_blank">dri-devel@lists.freedesktop.org</a><br>
&gt; &gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri=
-devel" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/=
mailman/listinfo/dri-devel</a><br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; mesa-dev mailing list<br>
&gt; &gt; <a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blan=
k">mesa-dev@lists.freedesktop.org</a><br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-de=
v" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/mesa-dev</a><br>
&gt;<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--000000000000fb4df405c06566de--

--===============0268591006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0268591006==--
