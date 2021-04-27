Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4F36C656
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA706E95C;
	Tue, 27 Apr 2021 12:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A796E95B;
 Tue, 27 Apr 2021 12:46:21 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id 20so26853061pll.7;
 Tue, 27 Apr 2021 05:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U3tHAhU0scsdtQ9hjoW5rZf7Gumi9Ap+9ZbIw3NLC1Q=;
 b=Q52q8IxrozWn+09dh28RAg/SkDD56LWIM/wVRMMnplQ6/IgqAp8SAv5KZPajPcL0u/
 cL0zP8TFoJReIOu5x7N0ibt1Vm8e7yA/Iv0aZ24PXCWdd4E8y585bKQVRf3OkJkA+UXw
 p9q+oIcwYoTqFoCDU12ZXDS2EdN1w84OhPfFt03u7pjW+RrcYwy9dFXMv/+jYZfVdqYc
 m0SLqFODHESLpxv8vzXrszBCeV+6kQ7wYcny4wOjh7BlCQjXMeEDvACwqEMnvoLO6gRy
 y3hqaqqXB7OYof3DILi8uQJiLQCPOiScDD2qFr365w1EEQ48nzq4l4L2nXUOV3RMeBve
 lvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U3tHAhU0scsdtQ9hjoW5rZf7Gumi9Ap+9ZbIw3NLC1Q=;
 b=PX8/4UFN6l0Yvpbnawp6a9/a10AyCYgIwbHbfTyZNw4zlPxxxCtemuyTdNXhHiToK/
 fzUp0/dD9vW/GnLQR31UrSGmmzHuTJnb0k1dDPHIt2T7+NxD2dpeaLL133oPua2Dqt/K
 0RjMDYHniJWO7vm57os4xCjo9SxMc09S6S4I0VbcLEvodpsZcfSHXk3U/GoqXVtzzkVw
 qg4GNV6MrrdFcZHgEQmm0ZTNc5xOGE0g0U/8Tk/WmY0kdaAlFSo33JXO26bf8R+5w1Qp
 01pDpvQapZR9cXLRAlOKd+Xn0trfL60r9G8ZwKqpukwW+EkDUH0RR8jfTNQx7nF1pV5q
 EoYA==
X-Gm-Message-State: AOAM533ys4ULDr9PzsuBgcEKZGeMHZu0F2oYC6cr1804F1FP5BTzOG4U
 DE7HaSbhJvae8glLGtgWazRF4uG4QbESWURZxIo=
X-Google-Smtp-Source: ABdhPJxMthHzy5ZzJkzVJ0KXEhIAg5YN3tS7FS+mxwoUfNwVj/l0/XWfxhsj2sb+EcpNBY09m/9AbYeWBhN5Bw8Ny6Q=
X-Received: by 2002:a17:902:c209:b029:ec:7add:e183 with SMTP id
 9-20020a170902c209b02900ec7adde183mr24806485pll.74.1619527581462; Tue, 27 Apr
 2021 05:46:21 -0700 (PDT)
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
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
In-Reply-To: <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 27 Apr 2021 08:46:08 -0400
Message-ID: <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
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
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1697721130=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1697721130==
Content-Type: multipart/alternative; boundary="00000000000032739a05c0f3a6a6"

--00000000000032739a05c0f3a6a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll defer to Christian and Alex to decide whether dropping sync with
non-amd devices (GPUs, cameras etc.) is acceptable.

Rewriting those drivers to this new sync model could be done on a case by
case basis.

For now, would we only lose the "amd -> external" dependency? Or the
"external -> amd" dependency too?

Marek

On Tue., Apr. 27, 2021, 08:15 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Tue, Apr 27, 2021 at 2:11 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> =
wrote:
> > Ok. I'll interpret this as "yes, it will work, let's do it".
>
> It works if all you care about is drm/amdgpu. I'm not sure that's a
> reasonable approach for upstream, but it definitely is an approach :-)
>
> We've already gone somewhat through the pain of drm/amdgpu redefining
> how implicit sync works without sufficiently talking with other
> people, maybe we should avoid a repeat of this ...
> -Daniel
>
> >
> > Marek
> >
> > On Tue., Apr. 27, 2021, 08:06 Christian K=C3=B6nig, <
> ckoenig.leichtzumerken@gmail.com> wrote:
> >>
> >> Correct, we wouldn't have synchronization between device with and
> without user queues any more.
> >>
> >> That could only be a problem for A+I Laptops.
> >>
> >> Memory management will just work with preemption fences which pause th=
e
> user queues of a process before evicting something. That will be a
> dma_fence, but also a well known approach.
> >>
> >> Christian.
> >>
> >> Am 27.04.21 um 13:49 schrieb Marek Ol=C5=A1=C3=A1k:
> >>
> >> If we don't use future fences for DMA fences at all, e.g. we don't use
> them for memory management, it can work, right? Memory management can
> suspend user queues anytime. It doesn't need to use DMA fences. There mig=
ht
> be something that I'm missing here.
> >>
> >> What would we lose without DMA fences? Just inter-device
> synchronization? I think that might be acceptable.
> >>
> >> The only case when the kernel will wait on a future fence is before a
> page flip. Everything today already depends on userspace not hanging the
> gpu, which makes everything a future fence.
> >>
> >> Marek
> >>
> >> On Tue., Apr. 27, 2021, 04:02 Daniel Vetter, <daniel@ffwll.ch> wrote:
> >>>
> >>> On Mon, Apr 26, 2021 at 04:59:28PM -0400, Marek Ol=C5=A1=C3=A1k wrote=
:
> >>> > Thanks everybody. The initial proposal is dead. Here are some
> thoughts on
> >>> > how to do it differently.
> >>> >
> >>> > I think we can have direct command submission from userspace via
> >>> > memory-mapped queues ("user queues") without changing window system=
s.
> >>> >
> >>> > The memory management doesn't have to use GPU page faults like HMM.
> >>> > Instead, it can wait for user queues of a specific process to go
> idle and
> >>> > then unmap the queues, so that userspace can't submit anything.
> Buffer
> >>> > evictions, pinning, etc. can be executed when all queues are unmapp=
ed
> >>> > (suspended). Thus, no BO fences and page faults are needed.
> >>> >
> >>> > Inter-process synchronization can use timeline semaphores. Userspac=
e
> will
> >>> > query the wait and signal value for a shared buffer from the kernel=
.
> The
> >>> > kernel will keep a history of those queries to know which process i=
s
> >>> > responsible for signalling which buffer. There is only the
> wait-timeout
> >>> > issue and how to identify the culprit. One of the solutions is to
> have the
> >>> > GPU send all GPU signal commands and all timed out wait commands vi=
a
> an
> >>> > interrupt to the kernel driver to monitor and validate userspace
> behavior.
> >>> > With that, it can be identified whether the culprit is the waiting
> process
> >>> > or the signalling process and which one. Invalid signal/wait
> parameters can
> >>> > also be detected. The kernel can force-signal only the semaphores
> that time
> >>> > out, and punish the processes which caused the timeout or used
> invalid
> >>> > signal/wait parameters.
> >>> >
> >>> > The question is whether this synchronization solution is robust
> enough for
> >>> > dma_fence and whatever the kernel and window systems need.
> >>>
> >>> The proper model here is the preempt-ctx dma_fence that amdkfd uses
> >>> (without page faults). That means dma_fence for synchronization is
> doa, at
> >>> least as-is, and we're back to figuring out the winsys problem.
> >>>
> >>> "We'll solve it with timeouts" is very tempting, but doesn't work. It=
's
> >>> akin to saying that we're solving deadlock issues in a locking design
> by
> >>> doing a global s/mutex_lock/mutex_lock_timeout/ in the kernel. Sure i=
t
> >>> avoids having to reach the reset button, but that's about it.
> >>>
> >>> And the fundamental problem is that once you throw in userspace comma=
nd
> >>> submission (and syncing, at least within the userspace driver,
> otherwise
> >>> there's kinda no point if you still need the kernel for cross-engine
> sync)
> >>> means you get deadlocks if you still use dma_fence for sync under
> >>> perfectly legit use-case. We've discussed that one ad nauseam last
> summer:
> >>>
> >>>
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=3D=
dma_fence#indefinite-dma-fences
> >>>
> >>> See silly diagramm at the bottom.
> >>>
> >>> Now I think all isn't lost, because imo the first step to getting to
> this
> >>> brave new world is rebuilding the driver on top of userspace fences,
> and
> >>> with the adjusted cmd submit model. You probably don't want to use
> amdkfd,
> >>> but port that as a context flag or similar to render nodes for gl/vk.
> Of
> >>> course that means you can only use this mode in headless, without
> >>> glx/wayland winsys support, but it's a start.
> >>> -Daniel
> >>>
> >>> >
> >>> > Marek
> >>> >
> >>> > On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone <daniel@fooishbar.org>
> wrote:
> >>> >
> >>> > > Hi,
> >>> > >
> >>> > > On Tue, 20 Apr 2021 at 20:30, Daniel Vetter <daniel@ffwll.ch>
> wrote:
> >>> > >
> >>> > >> The thing is, you can't do this in drm/scheduler. At least not
> without
> >>> > >> splitting up the dma_fence in the kernel into separate memory
> fences
> >>> > >> and sync fences
> >>> > >
> >>> > >
> >>> > > I'm starting to think this thread needs its own glossary ...
> >>> > >
> >>> > > I propose we use 'residency fence' for execution fences which ena=
ct
> >>> > > memory-residency operations, e.g. faulting in a page ultimately
> depending
> >>> > > on GPU work retiring.
> >>> > >
> >>> > > And 'value fence' for the pure-userspace model suggested by
> timeline
> >>> > > semaphores, i.e. fences being (*addr =3D=3D val) rather than bein=
g
> able to look
> >>> > > at ctx seqno.
> >>> > >
> >>> > > Cheers,
> >>> > > Daniel
> >>> > > _______________________________________________
> >>> > > mesa-dev mailing list
> >>> > > mesa-dev@lists.freedesktop.org
> >>> > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
> >>> > >
> >>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> http://blog.ffwll.ch
> >>
> >>
> >> _______________________________________________
> >> mesa-dev mailing list
> >> mesa-dev@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
> >>
> >>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--00000000000032739a05c0f3a6a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I&#39;ll defer to Christian and Alex to decide wheth=
er dropping sync with non-amd devices (GPUs, cameras etc.) is acceptable.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Rewriting those drivers t=
o this new sync model could be done on a case by case basis.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">For now, would we only lose the &quot=
;amd -&gt; external&quot; dependency? Or the &quot;external -&gt; amd&quot;=
 dependency too?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Marek</=
div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue., Apr. 27, 2021, 08:15 Daniel Vetter, =
&lt;<a href=3D"mailto:daniel@ffwll.ch" rel=3D"noreferrer noreferrer" target=
=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Tue, Apr 27, 2021 at 2:11 PM Marek Ol=C5=A1=C3=A1k &lt;<a href=
=3D"mailto:maraeo@gmail.com" rel=3D"noreferrer noreferrer noreferrer" targe=
t=3D"_blank">maraeo@gmail.com</a>&gt; wrote:<br>
&gt; Ok. I&#39;ll interpret this as &quot;yes, it will work, let&#39;s do i=
t&quot;.<br>
<br>
It works if all you care about is drm/amdgpu. I&#39;m not sure that&#39;s a=
<br>
reasonable approach for upstream, but it definitely is an approach :-)<br>
<br>
We&#39;ve already gone somewhat through the pain of drm/amdgpu redefining<b=
r>
how implicit sync works without sufficiently talking with other<br>
people, maybe we should avoid a repeat of this ...<br>
-Daniel<br>
<br>
&gt;<br>
&gt; Marek<br>
&gt;<br>
&gt; On Tue., Apr. 27, 2021, 08:06 Christian K=C3=B6nig, &lt;<a href=3D"mai=
lto:ckoenig.leichtzumerken@gmail.com" rel=3D"noreferrer noreferrer noreferr=
er" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Correct, we wouldn&#39;t have synchronization between device with =
and without user queues any more.<br>
&gt;&gt;<br>
&gt;&gt; That could only be a problem for A+I Laptops.<br>
&gt;&gt;<br>
&gt;&gt; Memory management will just work with preemption fences which paus=
e the user queues of a process before evicting something. That will be a dm=
a_fence, but also a well known approach.<br>
&gt;&gt;<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt; Am 27.04.21 um 13:49 schrieb Marek Ol=C5=A1=C3=A1k:<br>
&gt;&gt;<br>
&gt;&gt; If we don&#39;t use future fences for DMA fences at all, e.g. we d=
on&#39;t use them for memory management, it can work, right? Memory managem=
ent can suspend user queues anytime. It doesn&#39;t need to use DMA fences.=
 There might be something that I&#39;m missing here.<br>
&gt;&gt;<br>
&gt;&gt; What would we lose without DMA fences? Just inter-device synchroni=
zation? I think that might be acceptable.<br>
&gt;&gt;<br>
&gt;&gt; The only case when the kernel will wait on a future fence is befor=
e a page flip. Everything today already depends on userspace not hanging th=
e gpu, which makes everything a future fence.<br>
&gt;&gt;<br>
&gt;&gt; Marek<br>
&gt;&gt;<br>
&gt;&gt; On Tue., Apr. 27, 2021, 04:02 Daniel Vetter, &lt;<a href=3D"mailto=
:daniel@ffwll.ch" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank=
">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon, Apr 26, 2021 at 04:59:28PM -0400, Marek Ol=C5=A1=C3=A1=
k wrote:<br>
&gt;&gt;&gt; &gt; Thanks everybody. The initial proposal is dead. Here are =
some thoughts on<br>
&gt;&gt;&gt; &gt; how to do it differently.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I think we can have direct command submission from usersp=
ace via<br>
&gt;&gt;&gt; &gt; memory-mapped queues (&quot;user queues&quot;) without ch=
anging window systems.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; The memory management doesn&#39;t have to use GPU page fa=
ults like HMM.<br>
&gt;&gt;&gt; &gt; Instead, it can wait for user queues of a specific proces=
s to go idle and<br>
&gt;&gt;&gt; &gt; then unmap the queues, so that userspace can&#39;t submit=
 anything. Buffer<br>
&gt;&gt;&gt; &gt; evictions, pinning, etc. can be executed when all queues =
are unmapped<br>
&gt;&gt;&gt; &gt; (suspended). Thus, no BO fences and page faults are neede=
d.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Inter-process synchronization can use timeline semaphores=
. Userspace will<br>
&gt;&gt;&gt; &gt; query the wait and signal value for a shared buffer from =
the kernel. The<br>
&gt;&gt;&gt; &gt; kernel will keep a history of those queries to know which=
 process is<br>
&gt;&gt;&gt; &gt; responsible for signalling which buffer. There is only th=
e wait-timeout<br>
&gt;&gt;&gt; &gt; issue and how to identify the culprit. One of the solutio=
ns is to have the<br>
&gt;&gt;&gt; &gt; GPU send all GPU signal commands and all timed out wait c=
ommands via an<br>
&gt;&gt;&gt; &gt; interrupt to the kernel driver to monitor and validate us=
erspace behavior.<br>
&gt;&gt;&gt; &gt; With that, it can be identified whether the culprit is th=
e waiting process<br>
&gt;&gt;&gt; &gt; or the signalling process and which one. Invalid signal/w=
ait parameters can<br>
&gt;&gt;&gt; &gt; also be detected. The kernel can force-signal only the se=
maphores that time<br>
&gt;&gt;&gt; &gt; out, and punish the processes which caused the timeout or=
 used invalid<br>
&gt;&gt;&gt; &gt; signal/wait parameters.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; The question is whether this synchronization solution is =
robust enough for<br>
&gt;&gt;&gt; &gt; dma_fence and whatever the kernel and window systems need=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The proper model here is the preempt-ctx dma_fence that amdkfd=
 uses<br>
&gt;&gt;&gt; (without page faults). That means dma_fence for synchronizatio=
n is doa, at<br>
&gt;&gt;&gt; least as-is, and we&#39;re back to figuring out the winsys pro=
blem.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &quot;We&#39;ll solve it with timeouts&quot; is very tempting,=
 but doesn&#39;t work. It&#39;s<br>
&gt;&gt;&gt; akin to saying that we&#39;re solving deadlock issues in a loc=
king design by<br>
&gt;&gt;&gt; doing a global s/mutex_lock/mutex_lock_timeout/ in the kernel.=
 Sure it<br>
&gt;&gt;&gt; avoids having to reach the reset button, but that&#39;s about =
it.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; And the fundamental problem is that once you throw in userspac=
e command<br>
&gt;&gt;&gt; submission (and syncing, at least within the userspace driver,=
 otherwise<br>
&gt;&gt;&gt; there&#39;s kinda no point if you still need the kernel for cr=
oss-engine sync)<br>
&gt;&gt;&gt; means you get deadlocks if you still use dma_fence for sync un=
der<br>
&gt;&gt;&gt; perfectly legit use-case. We&#39;ve discussed that one ad naus=
eam last summer:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://dri.freedesktop.org/docs/drm/driver-api/dma=
-buf.html?highlight=3Ddma_fence#indefinite-dma-fences" rel=3D"noreferrer no=
referrer noreferrer noreferrer" target=3D"_blank">https://dri.freedesktop.o=
rg/docs/drm/driver-api/dma-buf.html?highlight=3Ddma_fence#indefinite-dma-fe=
nces</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; See silly diagramm at the bottom.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Now I think all isn&#39;t lost, because imo the first step to =
getting to this<br>
&gt;&gt;&gt; brave new world is rebuilding the driver on top of userspace f=
ences, and<br>
&gt;&gt;&gt; with the adjusted cmd submit model. You probably don&#39;t wan=
t to use amdkfd,<br>
&gt;&gt;&gt; but port that as a context flag or similar to render nodes for=
 gl/vk. Of<br>
&gt;&gt;&gt; course that means you can only use this mode in headless, with=
out<br>
&gt;&gt;&gt; glx/wayland winsys support, but it&#39;s a start.<br>
&gt;&gt;&gt; -Daniel<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Marek<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone &lt;<a href=
=3D"mailto:daniel@fooishbar.org" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">daniel@fooishbar.org</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Hi,<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; On Tue, 20 Apr 2021 at 20:30, Daniel Vetter &lt;<a h=
ref=3D"mailto:daniel@ffwll.ch" rel=3D"noreferrer noreferrer noreferrer" tar=
get=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;&gt; The thing is, you can&#39;t do this in drm/sched=
uler. At least not without<br>
&gt;&gt;&gt; &gt; &gt;&gt; splitting up the dma_fence in the kernel into se=
parate memory fences<br>
&gt;&gt;&gt; &gt; &gt;&gt; and sync fences<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; I&#39;m starting to think this thread needs its own =
glossary ...<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; I propose we use &#39;residency fence&#39; for execu=
tion fences which enact<br>
&gt;&gt;&gt; &gt; &gt; memory-residency operations, e.g. faulting in a page=
 ultimately depending<br>
&gt;&gt;&gt; &gt; &gt; on GPU work retiring.<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; And &#39;value fence&#39; for the pure-userspace mod=
el suggested by timeline<br>
&gt;&gt;&gt; &gt; &gt; semaphores, i.e. fences being (*addr =3D=3D val) rat=
her than being able to look<br>
&gt;&gt;&gt; &gt; &gt; at ctx seqno.<br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt; &gt; &gt; Cheers,<br>
&gt;&gt;&gt; &gt; &gt; Daniel<br>
&gt;&gt;&gt; &gt; &gt; _______________________________________________<br>
&gt;&gt;&gt; &gt; &gt; mesa-dev mailing list<br>
&gt;&gt;&gt; &gt; &gt; <a href=3D"mailto:mesa-dev@lists.freedesktop.org" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">mesa-dev@lists.fre=
edesktop.org</a><br>
&gt;&gt;&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/lis=
tinfo/mesa-dev" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=
=3D"_blank">https://lists.freedesktop.org/mailman/listinfo/mesa-dev</a><br>
&gt;&gt;&gt; &gt; &gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Daniel Vetter<br>
&gt;&gt;&gt; Software Engineer, Intel Corporation<br>
&gt;&gt;&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer =
noreferrer noreferrer" target=3D"_blank">http://blog.ffwll.ch</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; mesa-dev mailing list<br>
&gt;&gt; <a href=3D"mailto:mesa-dev@lists.freedesktop.org" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">mesa-dev@lists.freedesktop.org</=
a><br>
&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-dev=
" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">htt=
ps://lists.freedesktop.org/mailman/listinfo/mesa-dev</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer noreferrer no=
referrer" target=3D"_blank">http://blog.ffwll.ch</a><br>
</blockquote></div></div></div>

--00000000000032739a05c0f3a6a6--

--===============1697721130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1697721130==--
