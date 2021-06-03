Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B0B39A993
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 19:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556F16F4CC;
	Thu,  3 Jun 2021 17:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A489D6F4CC;
 Thu,  3 Jun 2021 17:53:25 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id i5so5767591pgm.0;
 Thu, 03 Jun 2021 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NAd92JoyVcG5s8M+xu8HXuP+10RNT/g/WGvURFWSJQ=;
 b=g8HSEpBKVka4VIpF5Rh3ruK2micRsVADwiJT0Pxn1NzA/4bQwZZf0k8G5eqgkDwsDF
 QFccsXLe4LgSoYUpQFlOqCxNhrODxnVqurGf2Ip2Z+JzKd2UB7hQCrPSNd47xrwo6vN3
 rZ/RH3eCuzO9TcKlsSOwDm4BJEin+qUPVzaKXNivU2F1ht5ckL7MmttvYwJ0D1bugxwf
 J95s4cQbTpWGoN74arT6l0WRS0L3UoEQqkunTmCi+HKmF2LaDCwP3FzuhnlKYWF8s/9O
 7g9V6wv+qBpyIvznI8Qm/Ol/Rzx4FRHE8W269Z7DKa9NktWBSfvgC9IrIAhe39Gk/FE0
 bzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NAd92JoyVcG5s8M+xu8HXuP+10RNT/g/WGvURFWSJQ=;
 b=cV/Ba5PhuwAwjRG0fvnGNDgDuTc0AGSShwSc6+pdRY9HVsFhT1nN4KeiGRuka+6SiX
 1YdWJ3JmoOa0ZVo/sw9ROq7hQ8t9x8iBkoVEKgNBcWyN7ucVxjvIVN5AL6CfOHxSXX+H
 Z7E/H+XmmR86a6tKFVlDNoQRZgWJoxnTvivcCjuGQgSzWIv+mIE0n8J+jQH7zfSDH6Lq
 7hwwHfxDIxsFxdkpOP4BVlh44T6RwxdigVsQAayqgP0U5XOTyvvLs3LSmwJQR5fC+WgO
 tue4fUBcKE8tv13+7oDEMmERydIjoR/UvMQIw+TB5xuKGFvBhDh1odjFo6d4QHM1wSf0
 2/Lg==
X-Gm-Message-State: AOAM531KXdqrKSU7rc25DVVamiLxZ0smPE27KRJDrEn3dx8xO64jiQyb
 sSnMk4c04yp9ONSQeRx2uZFOj/KKf6LGG18Yb7Q=
X-Google-Smtp-Source: ABdhPJxgIzxhOEBBXMdeFlR+QPwd8gK6r6+pOsoDNP5NrwGiTxP5hTcQ3r3cBS7KtifTtilp6qIfNqNjE5khq10MmRE=
X-Received: by 2002:a63:4d47:: with SMTP id n7mr686724pgl.82.1622742805293;
 Thu, 03 Jun 2021 10:53:25 -0700 (PDT)
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
 <CAAxE2A5=DmvCrh5+dfxPtyv7L2UPPevYOqa=GtFpuaxvMVfK9Q@mail.gmail.com>
 <CAKMK7uF_CEEY+55o07irnG1G+xbo8Y9tNmcMZD4G9GFUFJr4zw@mail.gmail.com>
In-Reply-To: <CAKMK7uF_CEEY+55o07irnG1G+xbo8Y9tNmcMZD4G9GFUFJr4zw@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 3 Jun 2021 13:52:49 -0400
Message-ID: <CAAxE2A50WbrSTqDAMWS_SYLWPUpm1dfO-WbYchXB9HYwgHmfQw@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="00000000000078ae6105c3e04015"
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

--00000000000078ae6105c3e04015
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Daniel, I think what you are suggesting is that we need to enable user
queues with the drm scheduler and dma_fence first, and once that works, we
can investigate how much of that kernel logic can be moved to the hw. Would
that work? In theory it shouldn't matter whether the kernel does it or the
hw does it. It's the same code, just in a different place.

Thanks,
Marek

On Thu, Jun 3, 2021 at 7:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jun 3, 2021 at 12:55 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> =
wrote:
> >
> > On Thu., Jun. 3, 2021, 06:03 Daniel Vetter, <daniel@ffwll.ch> wrote:
> >>
> >> On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Ol=C5=A1=C3=A1k wrote:
> >> > On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter <daniel@ffwll.ch> wrote=
:
> >> >
> >> > > On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Ol=C5=A1=C3=A1k wr=
ote:
> >> > > > On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter <daniel@ffwll.ch>
> wrote:
> >> > > >
> >> > > > > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=A1=C3=A1=
k wrote:
> >> > > > > > On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k <maraeo=
@gmail.com>
> wrote:
> >> > > > > >
> >> > > > > > > Yes, we can't break anything because we don't want to
> complicate
> >> > > things
> >> > > > > > > for us. It's pretty much all NAK'd already. We are trying
> to gather
> >> > > > > more
> >> > > > > > > knowledge and then make better decisions.
> >> > > > > > >
> >> > > > > > > The idea we are considering is that we'll expose
> memory-based sync
> >> > > > > objects
> >> > > > > > > to userspace for read only, and the kernel or hw will
> strictly
> >> > > control
> >> > > > > the
> >> > > > > > > memory writes to those sync objects. The hole in that idea
> is that
> >> > > > > > > userspace can decide not to signal a job, so even if
> userspace
> >> > > can't
> >> > > > > > > overwrite memory-based sync object states arbitrarily, it
> can still
> >> > > > > decide
> >> > > > > > > not to signal them, and then a future fence is born.
> >> > > > > > >
> >> > > > > >
> >> > > > > > This would actually be treated as a GPU hang caused by that
> context,
> >> > > so
> >> > > > > it
> >> > > > > > should be fine.
> >> > > > >
> >> > > > > This is practically what I proposed already, except your not
> doing it
> >> > > with
> >> > > > > dma_fence. And on the memory fence side this also doesn't
> actually give
> >> > > > > what you want for that compute model.
> >> > > > >
> >> > > > > This seems like a bit a worst of both worlds approach to me?
> Tons of
> >> > > work
> >> > > > > in the kernel to hide these not-dma_fence-but-almost, and stil=
l
> pain to
> >> > > > > actually drive the hardware like it should be for compute or
> direct
> >> > > > > display.
> >> > > > >
> >> > > > > Also maybe I've missed it, but I didn't see any replies to my
> >> > > suggestion
> >> > > > > how to fake the entire dma_fence stuff on top of new hw. Would
> be
> >> > > > > interesting to know what doesn't work there instead of amd
> folks going
> >> > > of
> >> > > > > into internal again and then coming back with another rfc from
> out of
> >> > > > > nowhere :-)
> >> > > > >
> >> > > >
> >> > > > Going internal again is probably a good idea to spare you the lo=
ng
> >> > > > discussions and not waste your time, but we haven't talked about
> the
> >> > > > dma_fence stuff internally other than acknowledging that it can =
be
> >> > > solved.
> >> > > >
> >> > > > The compute use case already uses the hw as-is with no
> inter-process
> >> > > > sharing, which mostly keeps the kernel out of the picture. It us=
es
> >> > > glFinish
> >> > > > to sync with GL.
> >> > > >
> >> > > > The gfx use case needs new hardware logic to support implicit an=
d
> >> > > explicit
> >> > > > sync. When we propose a solution, it's usually torn apart the
> next day by
> >> > > > ourselves.
> >> > > >
> >> > > > Since we are talking about next hw or next next hw, preemption
> should be
> >> > > > better.
> >> > > >
> >> > > > user queue =3D user-mapped ring buffer
> >> > > >
> >> > > > For implicit sync, we will only let userspace lock access to a
> buffer
> >> > > via a
> >> > > > user queue, which waits for the per-buffer sequence counter in
> memory to
> >> > > be
> >> > > > >=3D the number assigned by the kernel, and later unlock the acc=
ess
> with
> >> > > > another command, which increments the per-buffer sequence counte=
r
> in
> >> > > memory
> >> > > > with atomic_inc regardless of the number assigned by the kernel.
> The
> >> > > kernel
> >> > > > counter and the counter in memory can be out-of-sync, and I'll
> explain
> >> > > why
> >> > > > it's OK. If a process increments the kernel counter but not the
> memory
> >> > > > counter, that's its problem and it's the same as a GPU hang
> caused by
> >> > > that
> >> > > > process. If a process increments the memory counter but not the
> kernel
> >> > > > counter, the ">=3D" condition alongside atomic_inc guarantee tha=
t
> >> > > signaling n
> >> > > > will signal n+1, so it will never deadlock but also it will
> effectively
> >> > > > disable synchronization. This method of disabling synchronizatio=
n
> is
> >> > > > similar to a process corrupting the buffer, which should be fine=
.
> Can you
> >> > > > find any flaw in it? I can't find any.
> >> > >
> >> > > Hm maybe I misunderstood what exactly you wanted to do earlier.
> That kind
> >> > > of "we let userspace free-wheel whatever it wants, kernel ensures
> >> > > correctness of the resulting chain of dma_fence with reset the
> entire
> >> > > context" is what I proposed too.
> >> > >
> >> > > Like you say, userspace is allowed to render garbage already.
> >> > >
> >> > > > The explicit submit can be done by userspace (if there is no
> >> > > > synchronization), but we plan to use the kernel to do it for
> implicit
> >> > > sync.
> >> > > > Essentially, the kernel will receive a buffer list and addresses
> of wait
> >> > > > commands in the user queue. It will assign new sequence numbers
> to all
> >> > > > buffers and write those numbers into the wait commands, and ring
> the hw
> >> > > > doorbell to start execution of that queue.
> >> > >
> >> > > Yeah for implicit sync I think kernel and using drm/scheduler to
> sort out
> >> > > the dma_fence dependencies is probably best. Since you can filter
> out
> >> > > which dma_fence you hand to the scheduler for dependency tracking
> you can
> >> > > filter out your own ones and let the hw handle those directly
> (depending
> >> > > how much your hw can do an all that). On i915 we might do that to
> be able
> >> > > to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw
> scheduler.
> >> > >
> >> > > For buffer tracking with implicit sync I think cleanest is probabl=
y
> to
> >> > > still keep them wrapped as dma_fence and stuffed into dma_resv, bu=
t
> >> > > conceptually it's the same. If we let every driver reinvent their
> own
> >> > > buffer tracking just because the hw works a bit different it'll be
> a mess.
> >> > >
> >> > > Wrt wait commands: I'm honestly not sure why you'd do that.
> Userspace gets
> >> > > to keep the pieces if it gets it wrong. You do still need to handl=
e
> >> > > external dma_fence though, hence drm/scheduler frontend to sort
> these out.
> >> > >
> >> >
> >> > The reason is to disallow lower-privileged process to deadlock/hang =
a
> >> > higher-privileged process where the kernel can't tell who did it. If
> the
> >> > implicit-sync sequence counter is read only to userspace and only
> >> > incrementable by the unlock-signal command after the lock-wait comma=
nd
> >> > appeared in the same queue (both together forming a critical section=
),
> >> > userspace can't manipulate it arbitrarily and we get almost the exac=
t
> same
> >> > behavior as implicit sync has today. That means any implicitly-sync'=
d
> >> > buffer from any process can be fully trusted by a compositor to
> signal in a
> >> > finite time, and possibly even trusted by the kernel. The only thing
> that's
> >> > different is that a malicious process can disable implicit sync for =
a
> >> > buffer in all processes/kernel, but it can't hang other
> processes/kernel
> >> > (it can only hang itself and the kernel will be notified). So I'm a
> happy
> >> > panda now. :)
> >>
> >> Yeah I think that's not going to work too well, and is too many piled =
up
> >> hacks. Within a drm_file fd you can do whatever you feel like, since
> it's
> >> just one client.
> >>
> >> But once implicit sync kicks in I think you need to go with dma_fence
> and
> >> drm/scheduler to handle the dependencies, and tdr kicking it. With the
> >> dma_fence you do know who's the offender - you might not know why, but
> >> that doesn't matter, you just shred the entire context and let that
> >> userspace figure out the details.
> >>
> >> I think trying to make memory fences work as implicit sync directly,
> >> without wrapping them in a dma_fence and assorted guarantees, will jus=
t
> >> not work.
> >>
> >> And once you do wrap them in dma_fence, then all the other problems go
> >> away: cross-driver sync, syncfiles, ... So I really don't see the
> benefit
> >> of this half-way approach.
> >>
> >> Yes there's going to be a tad bit of overhead, but that's already ther=
e
> in
> >> the current model. And it can't hurt to have a bit of motivation for
> >> compositors to switch over to userspace memory fences properly.
> >
> >
> > Well, Christian thinks that we need a high level synchronization
> primitive in hw. I don't know myself and you may be right. A software
> scheduler with user queues might be one option. My part is only to find o=
ut
> how much of the scheduler logic can be moved to the hardware.
> >
> > We plan to have memory timeline semaphores, or simply monotonic
> counters, and a fence will be represented by the counter address and a
> constant sequence number for the <=3D comparison. One counter can represe=
nt
> up to 2^64 different fences. Giving any process write access to a fence i=
s
> the same as giving it the power to manipulate the signalled state of a
> sequence of up to 2^64 fences. That could mess up a lot of things. Howeve=
r,
> if the hardware had a high level synchronization primitive with access
> rights and a limited set of clearly defined operations such that we can
> formally prove whether it's safe for everybody, we could have a solution
> where we don't have to involve the software scheduler and just let the
> hardware do everything.
>
> I don't think hw access rights control on memory fences makes sense.
> There's two cases:
>
> - brave new world of native userspace memory fences. Currently that's
> compute, maybe direct display vk, hopefully/eventually compositors and
> desktops too. If you get an untrusted fence, you need to have fallback
> logic no matter what, and by design. vk is explicit in stating that if
> things hang, you get to keep all the pieces. So the compositor needs
> to _always_ treat userspace memory fences as hostile, wrap them in a
> timeout, and have a fallback frame/scene in its rendering path.
> Probably same for the kernel on display side, maybe down to the
> display hw picking the "right" frame depending upon the fence value
> right before scanout as we discussed earlier. There's no point in hw
> access rights because by design, even if no one tampers with your
> fence, it might never signal. So you have to cope with a hostile fence
> from untrusted sources anyway (and within an app it's trusted and you
> just die as in stuck in an endless loop until someon sends a SIGKILL
> when you deadlock or get it wrong some other way).
>
> - old compat mode where we need to use dma_fence, otherwise we end up
> with another round of "amdgpu redefines implicit sync in incompatible
> ways", and Christian&me don't even know yet how to fix the current
> round without breaking use-cases badly yet. So it has to be dma_fence,
> and it has to be the same rules as on old hw, or it's just not going
> to work. This means you need to force in-order retiring of fences in
> the kernel, and you need to enforce timeout. None of this needs hw
> access rights control, since once more it's just software constructs
> in the kernel. As a first appromixation, drm/scheduler + the fence
> chain we already have in syncobj is probably good enough for this.
> E.g. if userspace rolls the fence backwards then the kernel just
> ignores that, because its internal dma_fence has signalled, and
> dma_fences never unsignal (it's a bit in struct dma_fence, once it's
> set we stop checking hw). And if it doesn't signal in time, then tdr
> jumps in and fixes the mess. Hw access control doesn't fix anything
> here, because you have to deal with timeout and ordering already
> anyway, or the dma_fence contract is broken.
>
> So in both cases hw access control gains you nothing (at least I'm not
> seeing anything), it just makes the design more tricky. "Userspace can
> manipulate the fences" is _intentionally_ how these things work, we
> need a design that works with that hw design, not against it and
> somehow tries to get us back to the old world, but only halfway (i.e.
> not useful at all, since old userspace needs us to go all the way back
> to dma_fence, and new userspace wants to fully exploit userspace
> memory fences without artificial limitations for no reason).
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--00000000000078ae6105c3e04015
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Daniel, I think what you are suggesting is that we ne=
ed to enable user queues with the drm scheduler and dma_fence first, and on=
ce that works, we can investigate how much of that kernel logic can be move=
d to the hw. Would that work? In theory it shouldn&#39;t matter whether the=
 kernel does it or the hw does it. It&#39;s the same code, just in a differ=
ent place.<br></div><div><br></div><div>Thanks,</div><div>Marek<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Jun 3, 2021 at 7:22 AM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffw=
ll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Thu, Jun 3, 2021 at 12:55 PM Marek Ol=C5=A1=C3=A1k=
 &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu., Jun. 3, 2021, 06:03 Daniel Vetter, &lt;<a href=3D"mailto:dani=
el@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Ol=C5=A1=C3=A1k wr=
ote:<br>
&gt;&gt; &gt; On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter &lt;<a href=3D"m=
ailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Ol=C5=A1=
=C3=A1k wrote:<br>
&gt;&gt; &gt; &gt; &gt; On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter &lt;<a=
 href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; =
wrote:<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; On Wed, Jun 02, 2021 at 05:38:51AM -0400, Mare=
k Ol=C5=A1=C3=A1k wrote:<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=
=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blank">mar=
aeo@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; Yes, we can&#39;t break anything bec=
ause we don&#39;t want to complicate<br>
&gt;&gt; &gt; &gt; things<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; for us. It&#39;s pretty much all NAK=
&#39;d already. We are trying to gather<br>
&gt;&gt; &gt; &gt; &gt; &gt; more<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; knowledge and then make better decis=
ions.<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; The idea we are considering is that =
we&#39;ll expose memory-based sync<br>
&gt;&gt; &gt; &gt; &gt; &gt; objects<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; to userspace for read only, and the =
kernel or hw will strictly<br>
&gt;&gt; &gt; &gt; control<br>
&gt;&gt; &gt; &gt; &gt; &gt; the<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; memory writes to those sync objects.=
 The hole in that idea is that<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; userspace can decide not to signal a=
 job, so even if userspace<br>
&gt;&gt; &gt; &gt; can&#39;t<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; overwrite memory-based sync object s=
tates arbitrarily, it can still<br>
&gt;&gt; &gt; &gt; &gt; &gt; decide<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; not to signal them, and then a futur=
e fence is born.<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; This would actually be treated as a GPU h=
ang caused by that context,<br>
&gt;&gt; &gt; &gt; so<br>
&gt;&gt; &gt; &gt; &gt; &gt; it<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; should be fine.<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; This is practically what I proposed already, e=
xcept your not doing it<br>
&gt;&gt; &gt; &gt; with<br>
&gt;&gt; &gt; &gt; &gt; &gt; dma_fence. And on the memory fence side this a=
lso doesn&#39;t actually give<br>
&gt;&gt; &gt; &gt; &gt; &gt; what you want for that compute model.<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; This seems like a bit a worst of both worlds a=
pproach to me? Tons of<br>
&gt;&gt; &gt; &gt; work<br>
&gt;&gt; &gt; &gt; &gt; &gt; in the kernel to hide these not-dma_fence-but-=
almost, and still pain to<br>
&gt;&gt; &gt; &gt; &gt; &gt; actually drive the hardware like it should be =
for compute or direct<br>
&gt;&gt; &gt; &gt; &gt; &gt; display.<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; Also maybe I&#39;ve missed it, but I didn&#39;=
t see any replies to my<br>
&gt;&gt; &gt; &gt; suggestion<br>
&gt;&gt; &gt; &gt; &gt; &gt; how to fake the entire dma_fence stuff on top =
of new hw. Would be<br>
&gt;&gt; &gt; &gt; &gt; &gt; interesting to know what doesn&#39;t work ther=
e instead of amd folks going<br>
&gt;&gt; &gt; &gt; of<br>
&gt;&gt; &gt; &gt; &gt; &gt; into internal again and then coming back with =
another rfc from out of<br>
&gt;&gt; &gt; &gt; &gt; &gt; nowhere :-)<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; Going internal again is probably a good idea to spa=
re you the long<br>
&gt;&gt; &gt; &gt; &gt; discussions and not waste your time, but we haven&#=
39;t talked about the<br>
&gt;&gt; &gt; &gt; &gt; dma_fence stuff internally other than acknowledging=
 that it can be<br>
&gt;&gt; &gt; &gt; solved.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; The compute use case already uses the hw as-is with=
 no inter-process<br>
&gt;&gt; &gt; &gt; &gt; sharing, which mostly keeps the kernel out of the p=
icture. It uses<br>
&gt;&gt; &gt; &gt; glFinish<br>
&gt;&gt; &gt; &gt; &gt; to sync with GL.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; The gfx use case needs new hardware logic to suppor=
t implicit and<br>
&gt;&gt; &gt; &gt; explicit<br>
&gt;&gt; &gt; &gt; &gt; sync. When we propose a solution, it&#39;s usually =
torn apart the next day by<br>
&gt;&gt; &gt; &gt; &gt; ourselves.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; Since we are talking about next hw or next next hw,=
 preemption should be<br>
&gt;&gt; &gt; &gt; &gt; better.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; user queue =3D user-mapped ring buffer<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; For implicit sync, we will only let userspace lock =
access to a buffer<br>
&gt;&gt; &gt; &gt; via a<br>
&gt;&gt; &gt; &gt; &gt; user queue, which waits for the per-buffer sequence=
 counter in memory to<br>
&gt;&gt; &gt; &gt; be<br>
&gt;&gt; &gt; &gt; &gt; &gt;=3D the number assigned by the kernel, and late=
r unlock the access with<br>
&gt;&gt; &gt; &gt; &gt; another command, which increments the per-buffer se=
quence counter in<br>
&gt;&gt; &gt; &gt; memory<br>
&gt;&gt; &gt; &gt; &gt; with atomic_inc regardless of the number assigned b=
y the kernel. The<br>
&gt;&gt; &gt; &gt; kernel<br>
&gt;&gt; &gt; &gt; &gt; counter and the counter in memory can be out-of-syn=
c, and I&#39;ll explain<br>
&gt;&gt; &gt; &gt; why<br>
&gt;&gt; &gt; &gt; &gt; it&#39;s OK. If a process increments the kernel cou=
nter but not the memory<br>
&gt;&gt; &gt; &gt; &gt; counter, that&#39;s its problem and it&#39;s the sa=
me as a GPU hang caused by<br>
&gt;&gt; &gt; &gt; that<br>
&gt;&gt; &gt; &gt; &gt; process. If a process increments the memory counter=
 but not the kernel<br>
&gt;&gt; &gt; &gt; &gt; counter, the &quot;&gt;=3D&quot; condition alongsid=
e atomic_inc guarantee that<br>
&gt;&gt; &gt; &gt; signaling n<br>
&gt;&gt; &gt; &gt; &gt; will signal n+1, so it will never deadlock but also=
 it will effectively<br>
&gt;&gt; &gt; &gt; &gt; disable synchronization. This method of disabling s=
ynchronization is<br>
&gt;&gt; &gt; &gt; &gt; similar to a process corrupting the buffer, which s=
hould be fine. Can you<br>
&gt;&gt; &gt; &gt; &gt; find any flaw in it? I can&#39;t find any.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Hm maybe I misunderstood what exactly you wanted to do e=
arlier. That kind<br>
&gt;&gt; &gt; &gt; of &quot;we let userspace free-wheel whatever it wants, =
kernel ensures<br>
&gt;&gt; &gt; &gt; correctness of the resulting chain of dma_fence with res=
et the entire<br>
&gt;&gt; &gt; &gt; context&quot; is what I proposed too.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Like you say, userspace is allowed to render garbage alr=
eady.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; The explicit submit can be done by userspace (if th=
ere is no<br>
&gt;&gt; &gt; &gt; &gt; synchronization), but we plan to use the kernel to =
do it for implicit<br>
&gt;&gt; &gt; &gt; sync.<br>
&gt;&gt; &gt; &gt; &gt; Essentially, the kernel will receive a buffer list =
and addresses of wait<br>
&gt;&gt; &gt; &gt; &gt; commands in the user queue. It will assign new sequ=
ence numbers to all<br>
&gt;&gt; &gt; &gt; &gt; buffers and write those numbers into the wait comma=
nds, and ring the hw<br>
&gt;&gt; &gt; &gt; &gt; doorbell to start execution of that queue.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Yeah for implicit sync I think kernel and using drm/sche=
duler to sort out<br>
&gt;&gt; &gt; &gt; the dma_fence dependencies is probably best. Since you c=
an filter out<br>
&gt;&gt; &gt; &gt; which dma_fence you hand to the scheduler for dependency=
 tracking you can<br>
&gt;&gt; &gt; &gt; filter out your own ones and let the hw handle those dir=
ectly (depending<br>
&gt;&gt; &gt; &gt; how much your hw can do an all that). On i915 we might d=
o that to be able<br>
&gt;&gt; &gt; &gt; to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw =
and fw scheduler.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; For buffer tracking with implicit sync I think cleanest =
is probably to<br>
&gt;&gt; &gt; &gt; still keep them wrapped as dma_fence and stuffed into dm=
a_resv, but<br>
&gt;&gt; &gt; &gt; conceptually it&#39;s the same. If we let every driver r=
einvent their own<br>
&gt;&gt; &gt; &gt; buffer tracking just because the hw works a bit differen=
t it&#39;ll be a mess.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Wrt wait commands: I&#39;m honestly not sure why you&#39=
;d do that. Userspace gets<br>
&gt;&gt; &gt; &gt; to keep the pieces if it gets it wrong. You do still nee=
d to handle<br>
&gt;&gt; &gt; &gt; external dma_fence though, hence drm/scheduler frontend =
to sort these out.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The reason is to disallow lower-privileged process to deadloc=
k/hang a<br>
&gt;&gt; &gt; higher-privileged process where the kernel can&#39;t tell who=
 did it. If the<br>
&gt;&gt; &gt; implicit-sync sequence counter is read only to userspace and =
only<br>
&gt;&gt; &gt; incrementable by the unlock-signal command after the lock-wai=
t command<br>
&gt;&gt; &gt; appeared in the same queue (both together forming a critical =
section),<br>
&gt;&gt; &gt; userspace can&#39;t manipulate it arbitrarily and we get almo=
st the exact same<br>
&gt;&gt; &gt; behavior as implicit sync has today. That means any implicitl=
y-sync&#39;d<br>
&gt;&gt; &gt; buffer from any process can be fully trusted by a compositor =
to signal in a<br>
&gt;&gt; &gt; finite time, and possibly even trusted by the kernel. The onl=
y thing that&#39;s<br>
&gt;&gt; &gt; different is that a malicious process can disable implicit sy=
nc for a<br>
&gt;&gt; &gt; buffer in all processes/kernel, but it can&#39;t hang other p=
rocesses/kernel<br>
&gt;&gt; &gt; (it can only hang itself and the kernel will be notified). So=
 I&#39;m a happy<br>
&gt;&gt; &gt; panda now. :)<br>
&gt;&gt;<br>
&gt;&gt; Yeah I think that&#39;s not going to work too well, and is too man=
y piled up<br>
&gt;&gt; hacks. Within a drm_file fd you can do whatever you feel like, sin=
ce it&#39;s<br>
&gt;&gt; just one client.<br>
&gt;&gt;<br>
&gt;&gt; But once implicit sync kicks in I think you need to go with dma_fe=
nce and<br>
&gt;&gt; drm/scheduler to handle the dependencies, and tdr kicking it. With=
 the<br>
&gt;&gt; dma_fence you do know who&#39;s the offender - you might not know =
why, but<br>
&gt;&gt; that doesn&#39;t matter, you just shred the entire context and let=
 that<br>
&gt;&gt; userspace figure out the details.<br>
&gt;&gt;<br>
&gt;&gt; I think trying to make memory fences work as implicit sync directl=
y,<br>
&gt;&gt; without wrapping them in a dma_fence and assorted guarantees, will=
 just<br>
&gt;&gt; not work.<br>
&gt;&gt;<br>
&gt;&gt; And once you do wrap them in dma_fence, then all the other problem=
s go<br>
&gt;&gt; away: cross-driver sync, syncfiles, ... So I really don&#39;t see =
the benefit<br>
&gt;&gt; of this half-way approach.<br>
&gt;&gt;<br>
&gt;&gt; Yes there&#39;s going to be a tad bit of overhead, but that&#39;s =
already there in<br>
&gt;&gt; the current model. And it can&#39;t hurt to have a bit of motivati=
on for<br>
&gt;&gt; compositors to switch over to userspace memory fences properly.<br=
>
&gt;<br>
&gt;<br>
&gt; Well, Christian thinks that we need a high level synchronization primi=
tive in hw. I don&#39;t know myself and you may be right. A software schedu=
ler with user queues might be one option. My part is only to find out how m=
uch of the scheduler logic can be moved to the hardware.<br>
&gt;<br>
&gt; We plan to have memory timeline semaphores, or simply monotonic counte=
rs, and a fence will be represented by the counter address and a constant s=
equence number for the &lt;=3D comparison. One counter can represent up to =
2^64 different fences. Giving any process write access to a fence is the sa=
me as giving it the power to manipulate the signalled state of a sequence o=
f up to 2^64 fences. That could mess up a lot of things. However, if the ha=
rdware had a high level synchronization primitive with access rights and a =
limited set of clearly defined operations such that we can formally prove w=
hether it&#39;s safe for everybody, we could have a solution where we don&#=
39;t have to involve the software scheduler and just let the hardware do ev=
erything.<br>
<br>
I don&#39;t think hw access rights control on memory fences makes sense.<br=
>
There&#39;s two cases:<br>
<br>
- brave new world of native userspace memory fences. Currently that&#39;s<b=
r>
compute, maybe direct display vk, hopefully/eventually compositors and<br>
desktops too. If you get an untrusted fence, you need to have fallback<br>
logic no matter what, and by design. vk is explicit in stating that if<br>
things hang, you get to keep all the pieces. So the compositor needs<br>
to _always_ treat userspace memory fences as hostile, wrap them in a<br>
timeout, and have a fallback frame/scene in its rendering path.<br>
Probably same for the kernel on display side, maybe down to the<br>
display hw picking the &quot;right&quot; frame depending upon the fence val=
ue<br>
right before scanout as we discussed earlier. There&#39;s no point in hw<br=
>
access rights because by design, even if no one tampers with your<br>
fence, it might never signal. So you have to cope with a hostile fence<br>
from untrusted sources anyway (and within an app it&#39;s trusted and you<b=
r>
just die as in stuck in an endless loop until someon sends a SIGKILL<br>
when you deadlock or get it wrong some other way).<br>
<br>
- old compat mode where we need to use dma_fence, otherwise we end up<br>
with another round of &quot;amdgpu redefines implicit sync in incompatible<=
br>
ways&quot;, and Christian&amp;me don&#39;t even know yet how to fix the cur=
rent<br>
round without breaking use-cases badly yet. So it has to be dma_fence,<br>
and it has to be the same rules as on old hw, or it&#39;s just not going<br=
>
to work. This means you need to force in-order retiring of fences in<br>
the kernel, and you need to enforce timeout. None of this needs hw<br>
access rights control, since once more it&#39;s just software constructs<br=
>
in the kernel. As a first appromixation, drm/scheduler + the fence<br>
chain we already have in syncobj is probably good enough for this.<br>
E.g. if userspace rolls the fence backwards then the kernel just<br>
ignores that, because its internal dma_fence has signalled, and<br>
dma_fences never unsignal (it&#39;s a bit in struct dma_fence, once it&#39;=
s<br>
set we stop checking hw). And if it doesn&#39;t signal in time, then tdr<br=
>
jumps in and fixes the mess. Hw access control doesn&#39;t fix anything<br>
here, because you have to deal with timeout and ordering already<br>
anyway, or the dma_fence contract is broken.<br>
<br>
So in both cases hw access control gains you nothing (at least I&#39;m not<=
br>
seeing anything), it just makes the design more tricky. &quot;Userspace can=
<br>
manipulate the fences&quot; is _intentionally_ how these things work, we<br=
>
need a design that works with that hw design, not against it and<br>
somehow tries to get us back to the old world, but only halfway (i.e.<br>
not useful at all, since old userspace needs us to go all the way back<br>
to dma_fence, and new userspace wants to fully exploit userspace<br>
memory fences without artificial limitations for no reason).<br>
-Daniel<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--00000000000078ae6105c3e04015--
