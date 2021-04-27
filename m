Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C69D36C58F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 13:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FCD6E918;
	Tue, 27 Apr 2021 11:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AF46E918;
 Tue, 27 Apr 2021 11:49:40 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id 10so5761543pfl.1;
 Tue, 27 Apr 2021 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X6d1vmUTGJztFpFsrZYkmhXX6s4a6feNDPWjI9wIKCs=;
 b=ejJp4+Y1p6ZUix6jrWqTrGqGY8EynvIDHJkoMvZFp4ZaSyaR3CUTG8vcMRpm/aSVs4
 QbmMal8/TKRvCy9Oos3jgx2iEJx/JHnvV0+nnCnrRyTMbW8/kN2VjeKH/8d4Z7oDFBzo
 ChliSPmzOrgvuNG3Ypb6YOrR4s80buMlp5UaxrS8TOYdliVkX31txxfvBWLGVTX49fsF
 QD3nzTvlSY+IH0uTN3WQwSPORYAWdqJiXBCxySn64t4JWmASnkjI8L6P8f/QMpIeLBfE
 5we9MtbfOR5S+fJYZ73pIH8s66jb9FHsC+oSFyNjySQte5fGCUug9L1BfwQoOstSBoxV
 t06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X6d1vmUTGJztFpFsrZYkmhXX6s4a6feNDPWjI9wIKCs=;
 b=XQpsHiCbuKgx+AxfK2aF95YedcyMsw8MEwXASUhdzAEMM9k4Ocp6qCrXs4Uv1rC2Mn
 YbTbdPkOPzVhBTJhTG8gitKB05KWR6yeEReZnSOkkdOV6OX67KNgqeb7qnSQOr/PW7gb
 TY5MeuMVTmxW1Ad0jEVgAQdzX3vaDY37tiBUvIaNEFpq9Ue8K/aENayUm+/8IQkCr7Yr
 0sWUIA2dEFpN0nGqj2Vhj340HYGwPBuCcYLrX3gjdqy+m9PO7/HjgB19AWF+iHy6nJpE
 00MJ40InII9UpUWNz8EJeEwjaA3DcCo5//3+OIctvjyXjAXAaSaVG3OVLK3vskzk3dvZ
 wMEg==
X-Gm-Message-State: AOAM533pv1udT/gSF5JZ1kFetonFEskli2HkSlLsEQTXRiDQW1ilfJ9W
 nicyf4PEML6/FgO0axUQKiUwYFVWQYO9r5ts1yc=
X-Google-Smtp-Source: ABdhPJxi+PsV8zDwzo8Zy885OQBPs/gWKHf3r5PoMfHs64UgchHfdr8UHTIXpKTzrAkdshwt4aqt5B+KbFibxW8jl1I=
X-Received: by 2002:a65:594a:: with SMTP id g10mr5997242pgu.82.1619524180313; 
 Tue, 27 Apr 2021 04:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
In-Reply-To: <YIfFC3YST0cfzd3l@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 27 Apr 2021 07:49:27 -0400
Message-ID: <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0633644640=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0633644640==
Content-Type: multipart/alternative; boundary="000000000000790b7005c0f2db79"

--000000000000790b7005c0f2db79
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If we don't use future fences for DMA fences at all, e.g. we don't use them
for memory management, it can work, right? Memory management can suspend
user queues anytime. It doesn't need to use DMA fences. There might be
something that I'm missing here.

What would we lose without DMA fences? Just inter-device synchronization? I
think that might be acceptable.

The only case when the kernel will wait on a future fence is before a page
flip. Everything today already depends on userspace not hanging the gpu,
which makes everything a future fence.

Marek

On Tue., Apr. 27, 2021, 04:02 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Mon, Apr 26, 2021 at 04:59:28PM -0400, Marek Ol=C5=A1=C3=A1k wrote:
> > Thanks everybody. The initial proposal is dead. Here are some thoughts =
on
> > how to do it differently.
> >
> > I think we can have direct command submission from userspace via
> > memory-mapped queues ("user queues") without changing window systems.
> >
> > The memory management doesn't have to use GPU page faults like HMM.
> > Instead, it can wait for user queues of a specific process to go idle a=
nd
> > then unmap the queues, so that userspace can't submit anything. Buffer
> > evictions, pinning, etc. can be executed when all queues are unmapped
> > (suspended). Thus, no BO fences and page faults are needed.
> >
> > Inter-process synchronization can use timeline semaphores. Userspace wi=
ll
> > query the wait and signal value for a shared buffer from the kernel. Th=
e
> > kernel will keep a history of those queries to know which process is
> > responsible for signalling which buffer. There is only the wait-timeout
> > issue and how to identify the culprit. One of the solutions is to have
> the
> > GPU send all GPU signal commands and all timed out wait commands via an
> > interrupt to the kernel driver to monitor and validate userspace
> behavior.
> > With that, it can be identified whether the culprit is the waiting
> process
> > or the signalling process and which one. Invalid signal/wait parameters
> can
> > also be detected. The kernel can force-signal only the semaphores that
> time
> > out, and punish the processes which caused the timeout or used invalid
> > signal/wait parameters.
> >
> > The question is whether this synchronization solution is robust enough
> for
> > dma_fence and whatever the kernel and window systems need.
>
> The proper model here is the preempt-ctx dma_fence that amdkfd uses
> (without page faults). That means dma_fence for synchronization is doa, a=
t
> least as-is, and we're back to figuring out the winsys problem.
>
> "We'll solve it with timeouts" is very tempting, but doesn't work. It's
> akin to saying that we're solving deadlock issues in a locking design by
> doing a global s/mutex_lock/mutex_lock_timeout/ in the kernel. Sure it
> avoids having to reach the reset button, but that's about it.
>
> And the fundamental problem is that once you throw in userspace command
> submission (and syncing, at least within the userspace driver, otherwise
> there's kinda no point if you still need the kernel for cross-engine sync=
)
> means you get deadlocks if you still use dma_fence for sync under
> perfectly legit use-case. We've discussed that one ad nauseam last summer=
:
>
>
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=3D=
dma_fence#indefinite-dma-fences
>
> See silly diagramm at the bottom.
>
> Now I think all isn't lost, because imo the first step to getting to this
> brave new world is rebuilding the driver on top of userspace fences, and
> with the adjusted cmd submit model. You probably don't want to use amdkfd=
,
> but port that as a context flag or similar to render nodes for gl/vk. Of
> course that means you can only use this mode in headless, without
> glx/wayland winsys support, but it's a start.
> -Daniel
>
> >
> > Marek
> >
> > On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone <daniel@fooishbar.org>
> wrote:
> >
> > > Hi,
> > >
> > > On Tue, 20 Apr 2021 at 20:30, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > >> The thing is, you can't do this in drm/scheduler. At least not witho=
ut
> > >> splitting up the dma_fence in the kernel into separate memory fences
> > >> and sync fences
> > >
> > >
> > > I'm starting to think this thread needs its own glossary ...
> > >
> > > I propose we use 'residency fence' for execution fences which enact
> > > memory-residency operations, e.g. faulting in a page ultimately
> depending
> > > on GPU work retiring.
> > >
> > > And 'value fence' for the pure-userspace model suggested by timeline
> > > semaphores, i.e. fences being (*addr =3D=3D val) rather than being ab=
le to
> look
> > > at ctx seqno.
> > >
> > > Cheers,
> > > Daniel
> > > _______________________________________________
> > > mesa-dev mailing list
> > > mesa-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000790b7005c0f2db79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>If we don&#39;t use future fences for DMA fences at =
all, e.g. we don&#39;t use them for memory management, it can work, right? =
Memory management can suspend user queues anytime. It doesn&#39;t need to u=
se DMA fences. There might be something that I&#39;m missing here.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">What would we lose without DMA f=
ences? Just inter-device synchronization? I think that might be acceptable.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">The only case when the =
kernel will wait on a future fence is before a page flip. Everything today =
already depends on userspace not hanging the gpu, which makes everything a =
future fence.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Marek<br><=
br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue., Apr. 27, 2021, 04:02 Daniel Vetter, &lt;<a href=3D"mailto:da=
niel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On Mon, Apr 26, 2021 at 04:59:28PM -0400, Marek Ol=C5=A1=C3=A1k =
wrote:<br>
&gt; Thanks everybody. The initial proposal is dead. Here are some thoughts=
 on<br>
&gt; how to do it differently.<br>
&gt; <br>
&gt; I think we can have direct command submission from userspace via<br>
&gt; memory-mapped queues (&quot;user queues&quot;) without changing window=
 systems.<br>
&gt; <br>
&gt; The memory management doesn&#39;t have to use GPU page faults like HMM=
.<br>
&gt; Instead, it can wait for user queues of a specific process to go idle =
and<br>
&gt; then unmap the queues, so that userspace can&#39;t submit anything. Bu=
ffer<br>
&gt; evictions, pinning, etc. can be executed when all queues are unmapped<=
br>
&gt; (suspended). Thus, no BO fences and page faults are needed.<br>
&gt; <br>
&gt; Inter-process synchronization can use timeline semaphores. Userspace w=
ill<br>
&gt; query the wait and signal value for a shared buffer from the kernel. T=
he<br>
&gt; kernel will keep a history of those queries to know which process is<b=
r>
&gt; responsible for signalling which buffer. There is only the wait-timeou=
t<br>
&gt; issue and how to identify the culprit. One of the solutions is to have=
 the<br>
&gt; GPU send all GPU signal commands and all timed out wait commands via a=
n<br>
&gt; interrupt to the kernel driver to monitor and validate userspace behav=
ior.<br>
&gt; With that, it can be identified whether the culprit is the waiting pro=
cess<br>
&gt; or the signalling process and which one. Invalid signal/wait parameter=
s can<br>
&gt; also be detected. The kernel can force-signal only the semaphores that=
 time<br>
&gt; out, and punish the processes which caused the timeout or used invalid=
<br>
&gt; signal/wait parameters.<br>
&gt; <br>
&gt; The question is whether this synchronization solution is robust enough=
 for<br>
&gt; dma_fence and whatever the kernel and window systems need.<br>
<br>
The proper model here is the preempt-ctx dma_fence that amdkfd uses<br>
(without page faults). That means dma_fence for synchronization is doa, at<=
br>
least as-is, and we&#39;re back to figuring out the winsys problem.<br>
<br>
&quot;We&#39;ll solve it with timeouts&quot; is very tempting, but doesn&#3=
9;t work. It&#39;s<br>
akin to saying that we&#39;re solving deadlock issues in a locking design b=
y<br>
doing a global s/mutex_lock/mutex_lock_timeout/ in the kernel. Sure it<br>
avoids having to reach the reset button, but that&#39;s about it.<br>
<br>
And the fundamental problem is that once you throw in userspace command<br>
submission (and syncing, at least within the userspace driver, otherwise<br=
>
there&#39;s kinda no point if you still need the kernel for cross-engine sy=
nc)<br>
means you get deadlocks if you still use dma_fence for sync under<br>
perfectly legit use-case. We&#39;ve discussed that one ad nauseam last summ=
er:<br>
<br>
<a href=3D"https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?hig=
hlight=3Ddma_fence#indefinite-dma-fences" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html=
?highlight=3Ddma_fence#indefinite-dma-fences</a><br>
<br>
See silly diagramm at the bottom.<br>
<br>
Now I think all isn&#39;t lost, because imo the first step to getting to th=
is<br>
brave new world is rebuilding the driver on top of userspace fences, and<br=
>
with the adjusted cmd submit model. You probably don&#39;t want to use amdk=
fd,<br>
but port that as a context flag or similar to render nodes for gl/vk. Of<br=
>
course that means you can only use this mode in headless, without<br>
glx/wayland winsys support, but it&#39;s a start.<br>
-Daniel<br>
<br>
&gt; <br>
&gt; Marek<br>
&gt; <br>
&gt; On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone &lt;<a href=3D"mailto:dan=
iel@fooishbar.org" target=3D"_blank" rel=3D"noreferrer">daniel@fooishbar.or=
g</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Tue, 20 Apr 2021 at 20:30, Daniel Vetter &lt;<a href=3D"mailto=
:daniel@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; The thing is, you can&#39;t do this in drm/scheduler. At leas=
t not without<br>
&gt; &gt;&gt; splitting up the dma_fence in the kernel into separate memory=
 fences<br>
&gt; &gt;&gt; and sync fences<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m starting to think this thread needs its own glossary ...<=
br>
&gt; &gt;<br>
&gt; &gt; I propose we use &#39;residency fence&#39; for execution fences w=
hich enact<br>
&gt; &gt; memory-residency operations, e.g. faulting in a page ultimately d=
epending<br>
&gt; &gt; on GPU work retiring.<br>
&gt; &gt;<br>
&gt; &gt; And &#39;value fence&#39; for the pure-userspace model suggested =
by timeline<br>
&gt; &gt; semaphores, i.e. fences being (*addr =3D=3D val) rather than bein=
g able to look<br>
&gt; &gt; at ctx seqno.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Daniel<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; mesa-dev mailing list<br>
&gt; &gt; <a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blan=
k" rel=3D"noreferrer">mesa-dev@lists.freedesktop.org</a><br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-de=
v" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.freedeskto=
p.org/mailman/listinfo/mesa-dev</a><br>
&gt; &gt;<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://blog.ffwll.ch</a><br>
</blockquote></div></div></div>

--000000000000790b7005c0f2db79--

--===============0633644640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0633644640==--
