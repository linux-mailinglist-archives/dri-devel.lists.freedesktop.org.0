Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA939AAD6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 21:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A136F4F8;
	Thu,  3 Jun 2021 19:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0086E216
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 19:18:30 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 v13-20020a4ac00d0000b029020b43b918eeso1653503oop.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Zw+KGBvtDcppq7dJMJJdjM1FSgzn3DL5dphq4lWyxU=;
 b=cB11J1iM81/jxinQpm/vxdH7btWLoVG7LZgLtgCMJc0X6pwjfrFHQKZaIrmaxFWN8g
 1rYktftVYEPgosII22sucJrl6O/R9yTmaYMZjt0xSi5XXTJdqJPQ1v1ggkuBlbXevzsY
 uqQ2/pt0vmkFXze+o0p6d1syRRk4fxwP53V9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Zw+KGBvtDcppq7dJMJJdjM1FSgzn3DL5dphq4lWyxU=;
 b=RSlaSp/nwhW88C3YjScgbxEXKn8RjMG81uIwouoSorM/YL+vMiLg2RRQAlPBsZokYZ
 wnQGd8o4Vu4k1a4JRiYHZNf8cJsbyZwSI4MYsqTqHFr3oR6GmdiSC0izsPaPfQSZ1cQM
 ltuWlnTGwAWDSmrgmzBFuojdYY4UG2sSEqKwWW+UKDuFAhPwk4E2ib6w1DdRrRIpO6HI
 mpBH5OLP82OCPWb+LTcesbRmZ8KC2kyNrJHptx04GP0imQS3rN/zM1zILZ2q2y7tFe6+
 70qnpVBdvVr8Dy9K6SMP5MrtbRJopr1Q++duLkGIGXtJys0n6wXMvg7Q/XehJCqwJSCn
 zo5A==
X-Gm-Message-State: AOAM531Qb5aWeQAK998o/fpfKp3Im7+Oo8suY2IDCHAEwXWtSLiorfX/
 xoOtk9K0uOCLDJeOQQcIpntGoeu58O7Ah243qt77zA==
X-Google-Smtp-Source: ABdhPJz6K/x7EHSeWAdwdq4IkN/VBAquubVNdv4xa11p73ealTg/bQERePulHzsGH5XwZzEQRArNbHVfB7OlGNQ4vJo=
X-Received: by 2002:a4a:8e04:: with SMTP id q4mr679467ook.28.1622747909305;
 Thu, 03 Jun 2021 12:18:29 -0700 (PDT)
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
 <CAAxE2A50WbrSTqDAMWS_SYLWPUpm1dfO-WbYchXB9HYwgHmfQw@mail.gmail.com>
In-Reply-To: <CAAxE2A50WbrSTqDAMWS_SYLWPUpm1dfO-WbYchXB9HYwgHmfQw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Jun 2021 21:18:17 +0200
Message-ID: <CAKMK7uFaEVEy=yfNLEgM9OOeuoogB73NNAxBdZ2+vSRzN8FEzw@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 3, 2021 at 7:53 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wro=
te:
>
> Daniel, I think what you are suggesting is that we need to enable user qu=
eues with the drm scheduler and dma_fence first, and once that works, we ca=
n investigate how much of that kernel logic can be moved to the hw. Would t=
hat work? In theory it shouldn't matter whether the kernel does it or the h=
w does it. It's the same code, just in a different place.

Yeah I guess that's another way to look at it. Maybe in practice
you'll just move it from the kernel to userspace, which then programs
the hw waits directly into its IB. That's at least how I'd do it on
i915, assuming I'd have such hw. So these fences that userspace
programs directly (to sync within itself) won't even show up as
dependencies in the kernel.

And then yes on the other side you can lift work from the
drm/scheduler wrt dependencies you get in the kernel (whether explicit
sync with sync_file, or implicit sync fished out of dma_resv) and
program the hw directly that way. That would mean that userspace wont
fill the ringbuffer directly, but the kernel would do that, so that
you have space to stuff in the additional waits. Again assuming i915
hw model, maybe works differently on amd. Iirc we have some of that
already in the i915 scheduler, but I'd need to recheck how much it
really uses the hw semaphores.
-Daniel

> Thanks,
> Marek
>
> On Thu, Jun 3, 2021 at 7:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Thu, Jun 3, 2021 at 12:55 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com>=
 wrote:
>> >
>> > On Thu., Jun. 3, 2021, 06:03 Daniel Vetter, <daniel@ffwll.ch> wrote:
>> >>
>> >> On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Ol=C5=A1=C3=A1k wrote=
:
>> >> > On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>> >> >
>> >> > > On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Ol=C5=A1=C3=A1k w=
rote:
>> >> > > > On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter <daniel@ffwll.ch> =
wrote:
>> >> > > >
>> >> > > > > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=A1=C3=
=A1k wrote:
>> >> > > > > > On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k <marae=
o@gmail.com> wrote:
>> >> > > > > >
>> >> > > > > > > Yes, we can't break anything because we don't want to com=
plicate
>> >> > > things
>> >> > > > > > > for us. It's pretty much all NAK'd already. We are trying=
 to gather
>> >> > > > > more
>> >> > > > > > > knowledge and then make better decisions.
>> >> > > > > > >
>> >> > > > > > > The idea we are considering is that we'll expose memory-b=
ased sync
>> >> > > > > objects
>> >> > > > > > > to userspace for read only, and the kernel or hw will str=
ictly
>> >> > > control
>> >> > > > > the
>> >> > > > > > > memory writes to those sync objects. The hole in that ide=
a is that
>> >> > > > > > > userspace can decide not to signal a job, so even if user=
space
>> >> > > can't
>> >> > > > > > > overwrite memory-based sync object states arbitrarily, it=
 can still
>> >> > > > > decide
>> >> > > > > > > not to signal them, and then a future fence is born.
>> >> > > > > > >
>> >> > > > > >
>> >> > > > > > This would actually be treated as a GPU hang caused by that=
 context,
>> >> > > so
>> >> > > > > it
>> >> > > > > > should be fine.
>> >> > > > >
>> >> > > > > This is practically what I proposed already, except your not =
doing it
>> >> > > with
>> >> > > > > dma_fence. And on the memory fence side this also doesn't act=
ually give
>> >> > > > > what you want for that compute model.
>> >> > > > >
>> >> > > > > This seems like a bit a worst of both worlds approach to me? =
Tons of
>> >> > > work
>> >> > > > > in the kernel to hide these not-dma_fence-but-almost, and sti=
ll pain to
>> >> > > > > actually drive the hardware like it should be for compute or =
direct
>> >> > > > > display.
>> >> > > > >
>> >> > > > > Also maybe I've missed it, but I didn't see any replies to my
>> >> > > suggestion
>> >> > > > > how to fake the entire dma_fence stuff on top of new hw. Woul=
d be
>> >> > > > > interesting to know what doesn't work there instead of amd fo=
lks going
>> >> > > of
>> >> > > > > into internal again and then coming back with another rfc fro=
m out of
>> >> > > > > nowhere :-)
>> >> > > > >
>> >> > > >
>> >> > > > Going internal again is probably a good idea to spare you the l=
ong
>> >> > > > discussions and not waste your time, but we haven't talked abou=
t the
>> >> > > > dma_fence stuff internally other than acknowledging that it can=
 be
>> >> > > solved.
>> >> > > >
>> >> > > > The compute use case already uses the hw as-is with no inter-pr=
ocess
>> >> > > > sharing, which mostly keeps the kernel out of the picture. It u=
ses
>> >> > > glFinish
>> >> > > > to sync with GL.
>> >> > > >
>> >> > > > The gfx use case needs new hardware logic to support implicit a=
nd
>> >> > > explicit
>> >> > > > sync. When we propose a solution, it's usually torn apart the n=
ext day by
>> >> > > > ourselves.
>> >> > > >
>> >> > > > Since we are talking about next hw or next next hw, preemption =
should be
>> >> > > > better.
>> >> > > >
>> >> > > > user queue =3D user-mapped ring buffer
>> >> > > >
>> >> > > > For implicit sync, we will only let userspace lock access to a =
buffer
>> >> > > via a
>> >> > > > user queue, which waits for the per-buffer sequence counter in =
memory to
>> >> > > be
>> >> > > > >=3D the number assigned by the kernel, and later unlock the ac=
cess with
>> >> > > > another command, which increments the per-buffer sequence count=
er in
>> >> > > memory
>> >> > > > with atomic_inc regardless of the number assigned by the kernel=
. The
>> >> > > kernel
>> >> > > > counter and the counter in memory can be out-of-sync, and I'll =
explain
>> >> > > why
>> >> > > > it's OK. If a process increments the kernel counter but not the=
 memory
>> >> > > > counter, that's its problem and it's the same as a GPU hang cau=
sed by
>> >> > > that
>> >> > > > process. If a process increments the memory counter but not the=
 kernel
>> >> > > > counter, the ">=3D" condition alongside atomic_inc guarantee th=
at
>> >> > > signaling n
>> >> > > > will signal n+1, so it will never deadlock but also it will eff=
ectively
>> >> > > > disable synchronization. This method of disabling synchronizati=
on is
>> >> > > > similar to a process corrupting the buffer, which should be fin=
e. Can you
>> >> > > > find any flaw in it? I can't find any.
>> >> > >
>> >> > > Hm maybe I misunderstood what exactly you wanted to do earlier. T=
hat kind
>> >> > > of "we let userspace free-wheel whatever it wants, kernel ensures
>> >> > > correctness of the resulting chain of dma_fence with reset the en=
tire
>> >> > > context" is what I proposed too.
>> >> > >
>> >> > > Like you say, userspace is allowed to render garbage already.
>> >> > >
>> >> > > > The explicit submit can be done by userspace (if there is no
>> >> > > > synchronization), but we plan to use the kernel to do it for im=
plicit
>> >> > > sync.
>> >> > > > Essentially, the kernel will receive a buffer list and addresse=
s of wait
>> >> > > > commands in the user queue. It will assign new sequence numbers=
 to all
>> >> > > > buffers and write those numbers into the wait commands, and rin=
g the hw
>> >> > > > doorbell to start execution of that queue.
>> >> > >
>> >> > > Yeah for implicit sync I think kernel and using drm/scheduler to =
sort out
>> >> > > the dma_fence dependencies is probably best. Since you can filter=
 out
>> >> > > which dma_fence you hand to the scheduler for dependency tracking=
 you can
>> >> > > filter out your own ones and let the hw handle those directly (de=
pending
>> >> > > how much your hw can do an all that). On i915 we might do that to=
 be able
>> >> > > to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw sc=
heduler.
>> >> > >
>> >> > > For buffer tracking with implicit sync I think cleanest is probab=
ly to
>> >> > > still keep them wrapped as dma_fence and stuffed into dma_resv, b=
ut
>> >> > > conceptually it's the same. If we let every driver reinvent their=
 own
>> >> > > buffer tracking just because the hw works a bit different it'll b=
e a mess.
>> >> > >
>> >> > > Wrt wait commands: I'm honestly not sure why you'd do that. Users=
pace gets
>> >> > > to keep the pieces if it gets it wrong. You do still need to hand=
le
>> >> > > external dma_fence though, hence drm/scheduler frontend to sort t=
hese out.
>> >> > >
>> >> >
>> >> > The reason is to disallow lower-privileged process to deadlock/hang=
 a
>> >> > higher-privileged process where the kernel can't tell who did it. I=
f the
>> >> > implicit-sync sequence counter is read only to userspace and only
>> >> > incrementable by the unlock-signal command after the lock-wait comm=
and
>> >> > appeared in the same queue (both together forming a critical sectio=
n),
>> >> > userspace can't manipulate it arbitrarily and we get almost the exa=
ct same
>> >> > behavior as implicit sync has today. That means any implicitly-sync=
'd
>> >> > buffer from any process can be fully trusted by a compositor to sig=
nal in a
>> >> > finite time, and possibly even trusted by the kernel. The only thin=
g that's
>> >> > different is that a malicious process can disable implicit sync for=
 a
>> >> > buffer in all processes/kernel, but it can't hang other processes/k=
ernel
>> >> > (it can only hang itself and the kernel will be notified). So I'm a=
 happy
>> >> > panda now. :)
>> >>
>> >> Yeah I think that's not going to work too well, and is too many piled=
 up
>> >> hacks. Within a drm_file fd you can do whatever you feel like, since =
it's
>> >> just one client.
>> >>
>> >> But once implicit sync kicks in I think you need to go with dma_fence=
 and
>> >> drm/scheduler to handle the dependencies, and tdr kicking it. With th=
e
>> >> dma_fence you do know who's the offender - you might not know why, bu=
t
>> >> that doesn't matter, you just shred the entire context and let that
>> >> userspace figure out the details.
>> >>
>> >> I think trying to make memory fences work as implicit sync directly,
>> >> without wrapping them in a dma_fence and assorted guarantees, will ju=
st
>> >> not work.
>> >>
>> >> And once you do wrap them in dma_fence, then all the other problems g=
o
>> >> away: cross-driver sync, syncfiles, ... So I really don't see the ben=
efit
>> >> of this half-way approach.
>> >>
>> >> Yes there's going to be a tad bit of overhead, but that's already the=
re in
>> >> the current model. And it can't hurt to have a bit of motivation for
>> >> compositors to switch over to userspace memory fences properly.
>> >
>> >
>> > Well, Christian thinks that we need a high level synchronization primi=
tive in hw. I don't know myself and you may be right. A software scheduler =
with user queues might be one option. My part is only to find out how much =
of the scheduler logic can be moved to the hardware.
>> >
>> > We plan to have memory timeline semaphores, or simply monotonic counte=
rs, and a fence will be represented by the counter address and a constant s=
equence number for the <=3D comparison. One counter can represent up to 2^6=
4 different fences. Giving any process write access to a fence is the same =
as giving it the power to manipulate the signalled state of a sequence of u=
p to 2^64 fences. That could mess up a lot of things. However, if the hardw=
are had a high level synchronization primitive with access rights and a lim=
ited set of clearly defined operations such that we can formally prove whet=
her it's safe for everybody, we could have a solution where we don't have t=
o involve the software scheduler and just let the hardware do everything.
>>
>> I don't think hw access rights control on memory fences makes sense.
>> There's two cases:
>>
>> - brave new world of native userspace memory fences. Currently that's
>> compute, maybe direct display vk, hopefully/eventually compositors and
>> desktops too. If you get an untrusted fence, you need to have fallback
>> logic no matter what, and by design. vk is explicit in stating that if
>> things hang, you get to keep all the pieces. So the compositor needs
>> to _always_ treat userspace memory fences as hostile, wrap them in a
>> timeout, and have a fallback frame/scene in its rendering path.
>> Probably same for the kernel on display side, maybe down to the
>> display hw picking the "right" frame depending upon the fence value
>> right before scanout as we discussed earlier. There's no point in hw
>> access rights because by design, even if no one tampers with your
>> fence, it might never signal. So you have to cope with a hostile fence
>> from untrusted sources anyway (and within an app it's trusted and you
>> just die as in stuck in an endless loop until someon sends a SIGKILL
>> when you deadlock or get it wrong some other way).
>>
>> - old compat mode where we need to use dma_fence, otherwise we end up
>> with another round of "amdgpu redefines implicit sync in incompatible
>> ways", and Christian&me don't even know yet how to fix the current
>> round without breaking use-cases badly yet. So it has to be dma_fence,
>> and it has to be the same rules as on old hw, or it's just not going
>> to work. This means you need to force in-order retiring of fences in
>> the kernel, and you need to enforce timeout. None of this needs hw
>> access rights control, since once more it's just software constructs
>> in the kernel. As a first appromixation, drm/scheduler + the fence
>> chain we already have in syncobj is probably good enough for this.
>> E.g. if userspace rolls the fence backwards then the kernel just
>> ignores that, because its internal dma_fence has signalled, and
>> dma_fences never unsignal (it's a bit in struct dma_fence, once it's
>> set we stop checking hw). And if it doesn't signal in time, then tdr
>> jumps in and fixes the mess. Hw access control doesn't fix anything
>> here, because you have to deal with timeout and ordering already
>> anyway, or the dma_fence contract is broken.
>>
>> So in both cases hw access control gains you nothing (at least I'm not
>> seeing anything), it just makes the design more tricky. "Userspace can
>> manipulate the fences" is _intentionally_ how these things work, we
>> need a design that works with that hw design, not against it and
>> somehow tries to get us back to the old world, but only halfway (i.e.
>> not useful at all, since old userspace needs us to go all the way back
>> to dma_fence, and new userspace wants to fully exploit userspace
>> memory fences without artificial limitations for no reason).
>> -Daniel
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
