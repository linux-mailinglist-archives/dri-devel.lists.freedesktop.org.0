Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86568399F51
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 12:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F58E6E153;
	Thu,  3 Jun 2021 10:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071566E153;
 Thu,  3 Jun 2021 10:55:15 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id u7so2675709plq.4;
 Thu, 03 Jun 2021 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vbUqsTDk3va9ddxqUKkWAOrP3UuTgqnG5IbI19sfIQM=;
 b=Hw2Z7TI6z86hLHawgv94jUnZGWBd5I83ZEcvARP/BF9bkEc1kwnKYY6YlZ+EHH6Iuy
 7Xwo07VNTzyYNJrBRrOdVPE4vLtDTcDS3PKn8AdUgK7b8C42MoToDa+VdDAwcPAjNotG
 LcJCVZZtYTDQtIsT7URpwarMMf9MrN/JqOxHZfLJkkGHsaNAbXIMGZEVDT1egGrTVC+F
 cJaeLbU0Y1lKLJdeuRcloCtzgHFksrfRGRavGllE+pKMjnj12hDks1RqxRQKGwfaTa9D
 Y061bZvAL+FA88TLbGj7rnlOFqYl3JuGxeFZD9jmmYo61F5WamzFUdtV6cRfsrIz1k/L
 TDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vbUqsTDk3va9ddxqUKkWAOrP3UuTgqnG5IbI19sfIQM=;
 b=Lb3ZOjhju9LQ5prsCxvTiiaczh9ZL1TtzW6CaufNEOBnVqPQFU2S0NwCkYubxiOKwO
 OOmNKsJlA0Yz1JM9T94rqokgQ6DJ1nKRWQ5hwWz3mcSD6Uy7yt8+0i/IAKOveYLs8ksd
 HuFYskLxE3xVL1mVcbP12PiigiYCmbcgUdpyRd0UQwJG6tPJOX/kbo9jn6vZSXhhWL05
 c+XCtCxPvrqBKmmxvbwnp+e613cgHjcvYom1WJ3CpvFkxXiwQComK3dRhROeSeBLA4LO
 CWnNVU3esV3kZ1q2U2mZvM/FcMzIJdMWzS4VTmocogDKTpyFQhD6lBdv+aIqLSUvpeRR
 msHA==
X-Gm-Message-State: AOAM530ZaySg01vJm9NBm0Jo6BFh1yyGqTJJCEiTO53I1YHhFIEs0kjV
 bHkZSOzmrVie12vUKJCGzlijajeWCm6Y1DDephg=
X-Google-Smtp-Source: ABdhPJw1u4QEhsRMQqKG1IpUevn/QD7X02wJEr7wG94VxrCbJ+jdxVMnL9DwvdrlOHnT04nlAcYB4sC8taddVYBkbs4=
X-Received: by 2002:a17:902:db0f:b029:f3:e5f4:87f1 with SMTP id
 m15-20020a170902db0fb02900f3e5f487f1mr34505537plx.26.1622717715368; Thu, 03
 Jun 2021 03:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <CAAxE2A7uK7zumDiaU1XpEi_RNv8Q+QQHU-dLB0HrES2BkdP-cw@mail.gmail.com>
 <YLiJFdcaxzXsstt6@phenom.ffwll.local>
 <CAAxE2A4VPYMrjbq1W9z3pNXHP_Msn9HCFMPew9jf2h72rfK3dA@mail.gmail.com>
 <YLio7wyoMRJyFoO/@phenom.ffwll.local>
In-Reply-To: <YLio7wyoMRJyFoO/@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 3 Jun 2021 06:55:02 -0400
Message-ID: <CAAxE2A5=DmvCrh5+dfxPtyv7L2UPPevYOqa=GtFpuaxvMVfK9Q@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000fed1be05c3da688c"
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000fed1be05c3da688c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu., Jun. 3, 2021, 06:03 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Ol=C5=A1=C3=A1k wrote:
> > On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Ol=C5=A1=C3=A1k wrote=
:
> > > > On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter <daniel@ffwll.ch>
> wrote:
> > > >
> > > > > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=A1=C3=A1k w=
rote:
> > > > > > On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k <maraeo@gm=
ail.com>
> wrote:
> > > > > >
> > > > > > > Yes, we can't break anything because we don't want to
> complicate
> > > things
> > > > > > > for us. It's pretty much all NAK'd already. We are trying to
> gather
> > > > > more
> > > > > > > knowledge and then make better decisions.
> > > > > > >
> > > > > > > The idea we are considering is that we'll expose memory-based
> sync
> > > > > objects
> > > > > > > to userspace for read only, and the kernel or hw will strictl=
y
> > > control
> > > > > the
> > > > > > > memory writes to those sync objects. The hole in that idea is
> that
> > > > > > > userspace can decide not to signal a job, so even if userspac=
e
> > > can't
> > > > > > > overwrite memory-based sync object states arbitrarily, it can
> still
> > > > > decide
> > > > > > > not to signal them, and then a future fence is born.
> > > > > > >
> > > > > >
> > > > > > This would actually be treated as a GPU hang caused by that
> context,
> > > so
> > > > > it
> > > > > > should be fine.
> > > > >
> > > > > This is practically what I proposed already, except your not doin=
g
> it
> > > with
> > > > > dma_fence. And on the memory fence side this also doesn't actuall=
y
> give
> > > > > what you want for that compute model.
> > > > >
> > > > > This seems like a bit a worst of both worlds approach to me? Tons
> of
> > > work
> > > > > in the kernel to hide these not-dma_fence-but-almost, and still
> pain to
> > > > > actually drive the hardware like it should be for compute or dire=
ct
> > > > > display.
> > > > >
> > > > > Also maybe I've missed it, but I didn't see any replies to my
> > > suggestion
> > > > > how to fake the entire dma_fence stuff on top of new hw. Would be
> > > > > interesting to know what doesn't work there instead of amd folks
> going
> > > of
> > > > > into internal again and then coming back with another rfc from ou=
t
> of
> > > > > nowhere :-)
> > > > >
> > > >
> > > > Going internal again is probably a good idea to spare you the long
> > > > discussions and not waste your time, but we haven't talked about th=
e
> > > > dma_fence stuff internally other than acknowledging that it can be
> > > solved.
> > > >
> > > > The compute use case already uses the hw as-is with no inter-proces=
s
> > > > sharing, which mostly keeps the kernel out of the picture. It uses
> > > glFinish
> > > > to sync with GL.
> > > >
> > > > The gfx use case needs new hardware logic to support implicit and
> > > explicit
> > > > sync. When we propose a solution, it's usually torn apart the next
> day by
> > > > ourselves.
> > > >
> > > > Since we are talking about next hw or next next hw, preemption
> should be
> > > > better.
> > > >
> > > > user queue =3D user-mapped ring buffer
> > > >
> > > > For implicit sync, we will only let userspace lock access to a buff=
er
> > > via a
> > > > user queue, which waits for the per-buffer sequence counter in
> memory to
> > > be
> > > > >=3D the number assigned by the kernel, and later unlock the access
> with
> > > > another command, which increments the per-buffer sequence counter i=
n
> > > memory
> > > > with atomic_inc regardless of the number assigned by the kernel. Th=
e
> > > kernel
> > > > counter and the counter in memory can be out-of-sync, and I'll
> explain
> > > why
> > > > it's OK. If a process increments the kernel counter but not the
> memory
> > > > counter, that's its problem and it's the same as a GPU hang caused =
by
> > > that
> > > > process. If a process increments the memory counter but not the
> kernel
> > > > counter, the ">=3D" condition alongside atomic_inc guarantee that
> > > signaling n
> > > > will signal n+1, so it will never deadlock but also it will
> effectively
> > > > disable synchronization. This method of disabling synchronization i=
s
> > > > similar to a process corrupting the buffer, which should be fine.
> Can you
> > > > find any flaw in it? I can't find any.
> > >
> > > Hm maybe I misunderstood what exactly you wanted to do earlier. That
> kind
> > > of "we let userspace free-wheel whatever it wants, kernel ensures
> > > correctness of the resulting chain of dma_fence with reset the entire
> > > context" is what I proposed too.
> > >
> > > Like you say, userspace is allowed to render garbage already.
> > >
> > > > The explicit submit can be done by userspace (if there is no
> > > > synchronization), but we plan to use the kernel to do it for implic=
it
> > > sync.
> > > > Essentially, the kernel will receive a buffer list and addresses of
> wait
> > > > commands in the user queue. It will assign new sequence numbers to
> all
> > > > buffers and write those numbers into the wait commands, and ring th=
e
> hw
> > > > doorbell to start execution of that queue.
> > >
> > > Yeah for implicit sync I think kernel and using drm/scheduler to sort
> out
> > > the dma_fence dependencies is probably best. Since you can filter out
> > > which dma_fence you hand to the scheduler for dependency tracking you
> can
> > > filter out your own ones and let the hw handle those directly
> (depending
> > > how much your hw can do an all that). On i915 we might do that to be
> able
> > > to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw
> scheduler.
> > >
> > > For buffer tracking with implicit sync I think cleanest is probably t=
o
> > > still keep them wrapped as dma_fence and stuffed into dma_resv, but
> > > conceptually it's the same. If we let every driver reinvent their own
> > > buffer tracking just because the hw works a bit different it'll be a
> mess.
> > >
> > > Wrt wait commands: I'm honestly not sure why you'd do that. Userspace
> gets
> > > to keep the pieces if it gets it wrong. You do still need to handle
> > > external dma_fence though, hence drm/scheduler frontend to sort these
> out.
> > >
> >
> > The reason is to disallow lower-privileged process to deadlock/hang a
> > higher-privileged process where the kernel can't tell who did it. If th=
e
> > implicit-sync sequence counter is read only to userspace and only
> > incrementable by the unlock-signal command after the lock-wait command
> > appeared in the same queue (both together forming a critical section),
> > userspace can't manipulate it arbitrarily and we get almost the exact
> same
> > behavior as implicit sync has today. That means any implicitly-sync'd
> > buffer from any process can be fully trusted by a compositor to signal
> in a
> > finite time, and possibly even trusted by the kernel. The only thing
> that's
> > different is that a malicious process can disable implicit sync for a
> > buffer in all processes/kernel, but it can't hang other processes/kerne=
l
> > (it can only hang itself and the kernel will be notified). So I'm a hap=
py
> > panda now. :)
>
> Yeah I think that's not going to work too well, and is too many piled up
> hacks. Within a drm_file fd you can do whatever you feel like, since it's
> just one client.
>
> But once implicit sync kicks in I think you need to go with dma_fence and
> drm/scheduler to handle the dependencies, and tdr kicking it. With the
> dma_fence you do know who's the offender - you might not know why, but
> that doesn't matter, you just shred the entire context and let that
> userspace figure out the details.
>
> I think trying to make memory fences work as implicit sync directly,
> without wrapping them in a dma_fence and assorted guarantees, will just
> not work.
>
> And once you do wrap them in dma_fence, then all the other problems go
> away: cross-driver sync, syncfiles, ... So I really don't see the benefit
> of this half-way approach.
>
> Yes there's going to be a tad bit of overhead, but that's already there i=
n
> the current model. And it can't hurt to have a bit of motivation for
> compositors to switch over to userspace memory fences properly.
>

Well, Christian thinks that we need a high level synchronization primitive
in hw. I don't know myself and you may be right. A software scheduler with
user queues might be one option. My part is only to find out how much of
the scheduler logic can be moved to the hardware.

We plan to have memory timeline semaphores, or simply monotonic counters,
and a fence will be represented by the counter address and a constant
sequence number for the <=3D comparison. One counter can represent up to 2^=
64
different fences. Giving any process write access to a fence is the same as
giving it the power to manipulate the signalled state of a sequence of up
to 2^64 fences. That could mess up a lot of things. However, if the
hardware had a high level synchronization primitive with access rights and
a limited set of clearly defined operations such that we can formally prove
whether it's safe for everybody, we could have a solution where we don't
have to involve the software scheduler and just let the hardware do
everything.

Marek



-Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000fed1be05c3da688c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu., Jun. 3, 2021, 06:03 Daniel Vetter, &lt;<a href=3D"mai=
lto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Ol=C5=A1=
=C3=A1k wrote:<br>
&gt; On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter &lt;<a href=3D"mailto:dan=
iel@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&gt; =
wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Ol=C5=A1=C3=A1k w=
rote:<br>
&gt; &gt; &gt; On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter &lt;<a href=3D"=
mailto:daniel@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel@ffwll.c=
h</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=
=A1=C3=A1k wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=
=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blank" rel=3D"noref=
errer">maraeo@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Yes, we can&#39;t break anything because we d=
on&#39;t want to complicate<br>
&gt; &gt; things<br>
&gt; &gt; &gt; &gt; &gt; &gt; for us. It&#39;s pretty much all NAK&#39;d al=
ready. We are trying to gather<br>
&gt; &gt; &gt; &gt; more<br>
&gt; &gt; &gt; &gt; &gt; &gt; knowledge and then make better decisions.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; The idea we are considering is that we&#39;ll=
 expose memory-based sync<br>
&gt; &gt; &gt; &gt; objects<br>
&gt; &gt; &gt; &gt; &gt; &gt; to userspace for read only, and the kernel or=
 hw will strictly<br>
&gt; &gt; control<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; memory writes to those sync objects. The hole=
 in that idea is that<br>
&gt; &gt; &gt; &gt; &gt; &gt; userspace can decide not to signal a job, so =
even if userspace<br>
&gt; &gt; can&#39;t<br>
&gt; &gt; &gt; &gt; &gt; &gt; overwrite memory-based sync object states arb=
itrarily, it can still<br>
&gt; &gt; &gt; &gt; decide<br>
&gt; &gt; &gt; &gt; &gt; &gt; not to signal them, and then a future fence i=
s born.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; This would actually be treated as a GPU hang cause=
d by that context,<br>
&gt; &gt; so<br>
&gt; &gt; &gt; &gt; it<br>
&gt; &gt; &gt; &gt; &gt; should be fine.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This is practically what I proposed already, except you=
r not doing it<br>
&gt; &gt; with<br>
&gt; &gt; &gt; &gt; dma_fence. And on the memory fence side this also doesn=
&#39;t actually give<br>
&gt; &gt; &gt; &gt; what you want for that compute model.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This seems like a bit a worst of both worlds approach t=
o me? Tons of<br>
&gt; &gt; work<br>
&gt; &gt; &gt; &gt; in the kernel to hide these not-dma_fence-but-almost, a=
nd still pain to<br>
&gt; &gt; &gt; &gt; actually drive the hardware like it should be for compu=
te or direct<br>
&gt; &gt; &gt; &gt; display.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Also maybe I&#39;ve missed it, but I didn&#39;t see any=
 replies to my<br>
&gt; &gt; suggestion<br>
&gt; &gt; &gt; &gt; how to fake the entire dma_fence stuff on top of new hw=
. Would be<br>
&gt; &gt; &gt; &gt; interesting to know what doesn&#39;t work there instead=
 of amd folks going<br>
&gt; &gt; of<br>
&gt; &gt; &gt; &gt; into internal again and then coming back with another r=
fc from out of<br>
&gt; &gt; &gt; &gt; nowhere :-)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Going internal again is probably a good idea to spare you th=
e long<br>
&gt; &gt; &gt; discussions and not waste your time, but we haven&#39;t talk=
ed about the<br>
&gt; &gt; &gt; dma_fence stuff internally other than acknowledging that it =
can be<br>
&gt; &gt; solved.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The compute use case already uses the hw as-is with no inter=
-process<br>
&gt; &gt; &gt; sharing, which mostly keeps the kernel out of the picture. I=
t uses<br>
&gt; &gt; glFinish<br>
&gt; &gt; &gt; to sync with GL.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The gfx use case needs new hardware logic to support implici=
t and<br>
&gt; &gt; explicit<br>
&gt; &gt; &gt; sync. When we propose a solution, it&#39;s usually torn apar=
t the next day by<br>
&gt; &gt; &gt; ourselves.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Since we are talking about next hw or next next hw, preempti=
on should be<br>
&gt; &gt; &gt; better.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; user queue =3D user-mapped ring buffer<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For implicit sync, we will only let userspace lock access to=
 a buffer<br>
&gt; &gt; via a<br>
&gt; &gt; &gt; user queue, which waits for the per-buffer sequence counter =
in memory to<br>
&gt; &gt; be<br>
&gt; &gt; &gt; &gt;=3D the number assigned by the kernel, and later unlock =
the access with<br>
&gt; &gt; &gt; another command, which increments the per-buffer sequence co=
unter in<br>
&gt; &gt; memory<br>
&gt; &gt; &gt; with atomic_inc regardless of the number assigned by the ker=
nel. The<br>
&gt; &gt; kernel<br>
&gt; &gt; &gt; counter and the counter in memory can be out-of-sync, and I&=
#39;ll explain<br>
&gt; &gt; why<br>
&gt; &gt; &gt; it&#39;s OK. If a process increments the kernel counter but =
not the memory<br>
&gt; &gt; &gt; counter, that&#39;s its problem and it&#39;s the same as a G=
PU hang caused by<br>
&gt; &gt; that<br>
&gt; &gt; &gt; process. If a process increments the memory counter but not =
the kernel<br>
&gt; &gt; &gt; counter, the &quot;&gt;=3D&quot; condition alongside atomic_=
inc guarantee that<br>
&gt; &gt; signaling n<br>
&gt; &gt; &gt; will signal n+1, so it will never deadlock but also it will =
effectively<br>
&gt; &gt; &gt; disable synchronization. This method of disabling synchroniz=
ation is<br>
&gt; &gt; &gt; similar to a process corrupting the buffer, which should be =
fine. Can you<br>
&gt; &gt; &gt; find any flaw in it? I can&#39;t find any.<br>
&gt; &gt;<br>
&gt; &gt; Hm maybe I misunderstood what exactly you wanted to do earlier. T=
hat kind<br>
&gt; &gt; of &quot;we let userspace free-wheel whatever it wants, kernel en=
sures<br>
&gt; &gt; correctness of the resulting chain of dma_fence with reset the en=
tire<br>
&gt; &gt; context&quot; is what I proposed too.<br>
&gt; &gt;<br>
&gt; &gt; Like you say, userspace is allowed to render garbage already.<br>
&gt; &gt;<br>
&gt; &gt; &gt; The explicit submit can be done by userspace (if there is no=
<br>
&gt; &gt; &gt; synchronization), but we plan to use the kernel to do it for=
 implicit<br>
&gt; &gt; sync.<br>
&gt; &gt; &gt; Essentially, the kernel will receive a buffer list and addre=
sses of wait<br>
&gt; &gt; &gt; commands in the user queue. It will assign new sequence numb=
ers to all<br>
&gt; &gt; &gt; buffers and write those numbers into the wait commands, and =
ring the hw<br>
&gt; &gt; &gt; doorbell to start execution of that queue.<br>
&gt; &gt;<br>
&gt; &gt; Yeah for implicit sync I think kernel and using drm/scheduler to =
sort out<br>
&gt; &gt; the dma_fence dependencies is probably best. Since you can filter=
 out<br>
&gt; &gt; which dma_fence you hand to the scheduler for dependency tracking=
 you can<br>
&gt; &gt; filter out your own ones and let the hw handle those directly (de=
pending<br>
&gt; &gt; how much your hw can do an all that). On i915 we might do that to=
 be able<br>
&gt; &gt; to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw sc=
heduler.<br>
&gt; &gt;<br>
&gt; &gt; For buffer tracking with implicit sync I think cleanest is probab=
ly to<br>
&gt; &gt; still keep them wrapped as dma_fence and stuffed into dma_resv, b=
ut<br>
&gt; &gt; conceptually it&#39;s the same. If we let every driver reinvent t=
heir own<br>
&gt; &gt; buffer tracking just because the hw works a bit different it&#39;=
ll be a mess.<br>
&gt; &gt;<br>
&gt; &gt; Wrt wait commands: I&#39;m honestly not sure why you&#39;d do tha=
t. Userspace gets<br>
&gt; &gt; to keep the pieces if it gets it wrong. You do still need to hand=
le<br>
&gt; &gt; external dma_fence though, hence drm/scheduler frontend to sort t=
hese out.<br>
&gt; &gt;<br>
&gt; <br>
&gt; The reason is to disallow lower-privileged process to deadlock/hang a<=
br>
&gt; higher-privileged process where the kernel can&#39;t tell who did it. =
If the<br>
&gt; implicit-sync sequence counter is read only to userspace and only<br>
&gt; incrementable by the unlock-signal command after the lock-wait command=
<br>
&gt; appeared in the same queue (both together forming a critical section),=
<br>
&gt; userspace can&#39;t manipulate it arbitrarily and we get almost the ex=
act same<br>
&gt; behavior as implicit sync has today. That means any implicitly-sync&#3=
9;d<br>
&gt; buffer from any process can be fully trusted by a compositor to signal=
 in a<br>
&gt; finite time, and possibly even trusted by the kernel. The only thing t=
hat&#39;s<br>
&gt; different is that a malicious process can disable implicit sync for a<=
br>
&gt; buffer in all processes/kernel, but it can&#39;t hang other processes/=
kernel<br>
&gt; (it can only hang itself and the kernel will be notified). So I&#39;m =
a happy<br>
&gt; panda now. :)<br>
<br>
Yeah I think that&#39;s not going to work too well, and is too many piled u=
p<br>
hacks. Within a drm_file fd you can do whatever you feel like, since it&#39=
;s<br>
just one client.<br>
<br>
But once implicit sync kicks in I think you need to go with dma_fence and<b=
r>
drm/scheduler to handle the dependencies, and tdr kicking it. With the<br>
dma_fence you do know who&#39;s the offender - you might not know why, but<=
br>
that doesn&#39;t matter, you just shred the entire context and let that<br>
userspace figure out the details.<br>
<br>
I think trying to make memory fences work as implicit sync directly,<br>
without wrapping them in a dma_fence and assorted guarantees, will just<br>
not work.<br>
<br>
And once you do wrap them in dma_fence, then all the other problems go<br>
away: cross-driver sync, syncfiles, ... So I really don&#39;t see the benef=
it<br>
of this half-way approach.<br>
<br>
Yes there&#39;s going to be a tad bit of overhead, but that&#39;s already t=
here in<br>
the current model. And it can&#39;t hurt to have a bit of motivation for<br=
>
compositors to switch over to userspace memory fences properly.<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Well, Christ=
ian thinks that we need a high level synchronization primitive in hw. I don=
&#39;t know myself and you may be right. A software scheduler with user que=
ues might be one option. My part is only to find out how much of the schedu=
ler logic can be moved to the hardware.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">We plan to have memory timeline semaphores, or simply monot=
onic counters, and a fence will be represented by the counter address and a=
 constant sequence number for the &lt;=3D comparison. One counter can repre=
sent up to 2^64 different fences. Giving any process write access to a fenc=
e is the same as giving it the power to manipulate the signalled state of a=
 sequence of up to 2^64 fences. That could mess up a lot of things. However=
, if the hardware had a high level synchronization primitive with access ri=
ghts and a limited set of clearly defined operations such that we can forma=
lly prove whether it&#39;s safe for everybody, we could have a solution whe=
re we don&#39;t have to involve the software scheduler and just let the har=
dware do everything.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Mar=
ek</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
-Daniel<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://blog.ffwll.ch</a><br>
</blockquote></div></div></div>

--000000000000fed1be05c3da688c--
