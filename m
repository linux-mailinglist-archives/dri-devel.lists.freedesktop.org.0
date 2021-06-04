Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138339B201
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 07:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B026F581;
	Fri,  4 Jun 2021 05:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323006F580;
 Fri,  4 Jun 2021 05:26:41 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id z26so6636743pfj.5;
 Thu, 03 Jun 2021 22:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3O4vK+zrdNJZCKWGuqxwhTjBoeinTYJnolV8Yt3xfc=;
 b=tFMzLx93m7RBEYMuLyfNaUm2cJ9Y5hRIvC3HjdLDHphQ3meJrgCoF5FV0B7NTrvuML
 7nMrlQZ5E6kWr2nNt1JC6jGbJQQ+vtZ0AFRsAmApJ+1VSn2Fkl1IrT8KbOPGOwfskO+e
 4+xtTRRVZPn3kTOLA28u2Oi+KOsJCbVmXio/vvgHDTA6+IdKZz0kgHHXIVGSRB3XRslj
 L+W3+kMfXIHEZkrhAZMXmdM667ss1ew0qtVozCgCJyKWmupn7/7TiTs8adtvHcYl/EtU
 J5fvhN5LNX871bo+ZALeHrG9i0na9QVxVr7oH4H064/CjkMUUTB4//ohWftaZbsPPADP
 LlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3O4vK+zrdNJZCKWGuqxwhTjBoeinTYJnolV8Yt3xfc=;
 b=IFMRy4IqPOuopktAnhE6RbRgHQrgKkPJJlk5d6zD2geuMW6zusCmlp0qZpyNgPpCui
 bpTa6FjFuluAWuz54QD7Dk0Rd3uIaakZVbdJ79ZX9aT4n/kBIUWtqjtOUQo6BP6PhHJn
 b4KTzRLzARqJYDxjZiOKUm9+rh20E2vUB10x14JIcKBi3UozAyNw0qSNQhVOG8LOXUD8
 eHIwxS3H0z6j7uSyDWocs2RTd/caXqgNpqj9dXM2QhufzIcPP0ZzrY9k8Aa2ktAag5gL
 nB4JdWPKQYlHcWUQa2/VVB/6zfFJt8TMweXMorDdBCfKwXxDu5ytIuPU3aZHeHaVM0F+
 5oMA==
X-Gm-Message-State: AOAM533SfafuVXznPebVT44bHCMmttBLtGkNwFnHuMI3Pyz14JdoZPhe
 NmRyG09e2RSSlFl62te28EnBNuWxb4a0+zHWklU=
X-Google-Smtp-Source: ABdhPJxoE/33qn+WikdQTuVBLP3tJBs3e40O34wWNEYOq/Et6d3CSS0nvrBoHNvR7rYbBS8Uaod0ROM7Lk8vz78BJ1s=
X-Received: by 2002:a63:1360:: with SMTP id 32mr3134400pgt.233.1622784400720; 
 Thu, 03 Jun 2021 22:26:40 -0700 (PDT)
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
 <CAKMK7uFaEVEy=yfNLEgM9OOeuoogB73NNAxBdZ2+vSRzN8FEzw@mail.gmail.com>
In-Reply-To: <CAKMK7uFaEVEy=yfNLEgM9OOeuoogB73NNAxBdZ2+vSRzN8FEzw@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 4 Jun 2021 01:26:27 -0400
Message-ID: <CAAxE2A7XdgboU-9N=shjd31ospRwJgjGdK5Xvo1wOMLtSMTADg@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000c0862805c3e9efb9"
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

--000000000000c0862805c3e9efb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu., Jun. 3, 2021, 15:18 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Thu, Jun 3, 2021 at 7:53 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> w=
rote:
> >
> > Daniel, I think what you are suggesting is that we need to enable user
> queues with the drm scheduler and dma_fence first, and once that works, w=
e
> can investigate how much of that kernel logic can be moved to the hw. Wou=
ld
> that work? In theory it shouldn't matter whether the kernel does it or th=
e
> hw does it. It's the same code, just in a different place.
>
> Yeah I guess that's another way to look at it. Maybe in practice
> you'll just move it from the kernel to userspace, which then programs
> the hw waits directly into its IB. That's at least how I'd do it on
> i915, assuming I'd have such hw. So these fences that userspace
> programs directly (to sync within itself) won't even show up as
> dependencies in the kernel.
>
> And then yes on the other side you can lift work from the
> drm/scheduler wrt dependencies you get in the kernel (whether explicit
> sync with sync_file, or implicit sync fished out of dma_resv) and
> program the hw directly that way. That would mean that userspace wont
> fill the ringbuffer directly, but the kernel would do that, so that
> you have space to stuff in the additional waits. Again assuming i915
> hw model, maybe works differently on amd. Iirc we have some of that
> already in the i915 scheduler, but I'd need to recheck how much it
> really uses the hw semaphores.
>

I was thinking we would pass per process syncobj handles and buffer handles
into commands in the user queue, or something equivalent. We do have a
large degree of programmability in the hw that we can do something like
that. The question is whether this high level user->hw interface would have
any advantage over trivial polling on memory, etc. My impression is no
because the kernel would be robust enough that it wouldn't matter what
userspace does, but I don't know. Anyway, all we need is user queues and
what your proposed seems totally sufficient.

Marek

-Daniel
>
> > Thanks,
> > Marek
> >
> > On Thu, Jun 3, 2021 at 7:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Thu, Jun 3, 2021 at 12:55 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.co=
m> wrote:
> >> >
> >> > On Thu., Jun. 3, 2021, 06:03 Daniel Vetter, <daniel@ffwll.ch> wrote:
> >> >>
> >> >> On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Ol=C5=A1=C3=A1k wro=
te:
> >> >> > On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter <daniel@ffwll.ch>
> wrote:
> >> >> >
> >> >> > > On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Ol=C5=A1=C3=A1k=
 wrote:
> >> >> > > > On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter <daniel@ffwll.ch=
>
> wrote:
> >> >> > > >
> >> >> > > > > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=A1=C3=
=A1k wrote:
> >> >> > > > > > On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k <
> maraeo@gmail.com> wrote:
> >> >> > > > > >
> >> >> > > > > > > Yes, we can't break anything because we don't want to
> complicate
> >> >> > > things
> >> >> > > > > > > for us. It's pretty much all NAK'd already. We are
> trying to gather
> >> >> > > > > more
> >> >> > > > > > > knowledge and then make better decisions.
> >> >> > > > > > >
> >> >> > > > > > > The idea we are considering is that we'll expose
> memory-based sync
> >> >> > > > > objects
> >> >> > > > > > > to userspace for read only, and the kernel or hw will
> strictly
> >> >> > > control
> >> >> > > > > the
> >> >> > > > > > > memory writes to those sync objects. The hole in that
> idea is that
> >> >> > > > > > > userspace can decide not to signal a job, so even if
> userspace
> >> >> > > can't
> >> >> > > > > > > overwrite memory-based sync object states arbitrarily,
> it can still
> >> >> > > > > decide
> >> >> > > > > > > not to signal them, and then a future fence is born.
> >> >> > > > > > >
> >> >> > > > > >
> >> >> > > > > > This would actually be treated as a GPU hang caused by
> that context,
> >> >> > > so
> >> >> > > > > it
> >> >> > > > > > should be fine.
> >> >> > > > >
> >> >> > > > > This is practically what I proposed already, except your no=
t
> doing it
> >> >> > > with
> >> >> > > > > dma_fence. And on the memory fence side this also doesn't
> actually give
> >> >> > > > > what you want for that compute model.
> >> >> > > > >
> >> >> > > > > This seems like a bit a worst of both worlds approach to me=
?
> Tons of
> >> >> > > work
> >> >> > > > > in the kernel to hide these not-dma_fence-but-almost, and
> still pain to
> >> >> > > > > actually drive the hardware like it should be for compute o=
r
> direct
> >> >> > > > > display.
> >> >> > > > >
> >> >> > > > > Also maybe I've missed it, but I didn't see any replies to =
my
> >> >> > > suggestion
> >> >> > > > > how to fake the entire dma_fence stuff on top of new hw.
> Would be
> >> >> > > > > interesting to know what doesn't work there instead of amd
> folks going
> >> >> > > of
> >> >> > > > > into internal again and then coming back with another rfc
> from out of
> >> >> > > > > nowhere :-)
> >> >> > > > >
> >> >> > > >
> >> >> > > > Going internal again is probably a good idea to spare you the
> long
> >> >> > > > discussions and not waste your time, but we haven't talked
> about the
> >> >> > > > dma_fence stuff internally other than acknowledging that it
> can be
> >> >> > > solved.
> >> >> > > >
> >> >> > > > The compute use case already uses the hw as-is with no
> inter-process
> >> >> > > > sharing, which mostly keeps the kernel out of the picture. It
> uses
> >> >> > > glFinish
> >> >> > > > to sync with GL.
> >> >> > > >
> >> >> > > > The gfx use case needs new hardware logic to support implicit
> and
> >> >> > > explicit
> >> >> > > > sync. When we propose a solution, it's usually torn apart the
> next day by
> >> >> > > > ourselves.
> >> >> > > >
> >> >> > > > Since we are talking about next hw or next next hw, preemptio=
n
> should be
> >> >> > > > better.
> >> >> > > >
> >> >> > > > user queue =3D user-mapped ring buffer
> >> >> > > >
> >> >> > > > For implicit sync, we will only let userspace lock access to =
a
> buffer
> >> >> > > via a
> >> >> > > > user queue, which waits for the per-buffer sequence counter i=
n
> memory to
> >> >> > > be
> >> >> > > > >=3D the number assigned by the kernel, and later unlock the
> access with
> >> >> > > > another command, which increments the per-buffer sequence
> counter in
> >> >> > > memory
> >> >> > > > with atomic_inc regardless of the number assigned by the
> kernel. The
> >> >> > > kernel
> >> >> > > > counter and the counter in memory can be out-of-sync, and I'l=
l
> explain
> >> >> > > why
> >> >> > > > it's OK. If a process increments the kernel counter but not
> the memory
> >> >> > > > counter, that's its problem and it's the same as a GPU hang
> caused by
> >> >> > > that
> >> >> > > > process. If a process increments the memory counter but not
> the kernel
> >> >> > > > counter, the ">=3D" condition alongside atomic_inc guarantee =
that
> >> >> > > signaling n
> >> >> > > > will signal n+1, so it will never deadlock but also it will
> effectively
> >> >> > > > disable synchronization. This method of disabling
> synchronization is
> >> >> > > > similar to a process corrupting the buffer, which should be
> fine. Can you
> >> >> > > > find any flaw in it? I can't find any.
> >> >> > >
> >> >> > > Hm maybe I misunderstood what exactly you wanted to do earlier.
> That kind
> >> >> > > of "we let userspace free-wheel whatever it wants, kernel ensur=
es
> >> >> > > correctness of the resulting chain of dma_fence with reset the
> entire
> >> >> > > context" is what I proposed too.
> >> >> > >
> >> >> > > Like you say, userspace is allowed to render garbage already.
> >> >> > >
> >> >> > > > The explicit submit can be done by userspace (if there is no
> >> >> > > > synchronization), but we plan to use the kernel to do it for
> implicit
> >> >> > > sync.
> >> >> > > > Essentially, the kernel will receive a buffer list and
> addresses of wait
> >> >> > > > commands in the user queue. It will assign new sequence
> numbers to all
> >> >> > > > buffers and write those numbers into the wait commands, and
> ring the hw
> >> >> > > > doorbell to start execution of that queue.
> >> >> > >
> >> >> > > Yeah for implicit sync I think kernel and using drm/scheduler t=
o
> sort out
> >> >> > > the dma_fence dependencies is probably best. Since you can
> filter out
> >> >> > > which dma_fence you hand to the scheduler for dependency
> tracking you can
> >> >> > > filter out your own ones and let the hw handle those directly
> (depending
> >> >> > > how much your hw can do an all that). On i915 we might do that
> to be able
> >> >> > > to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw
> scheduler.
> >> >> > >
> >> >> > > For buffer tracking with implicit sync I think cleanest is
> probably to
> >> >> > > still keep them wrapped as dma_fence and stuffed into dma_resv,
> but
> >> >> > > conceptually it's the same. If we let every driver reinvent
> their own
> >> >> > > buffer tracking just because the hw works a bit different it'll
> be a mess.
> >> >> > >
> >> >> > > Wrt wait commands: I'm honestly not sure why you'd do that.
> Userspace gets
> >> >> > > to keep the pieces if it gets it wrong. You do still need to
> handle
> >> >> > > external dma_fence though, hence drm/scheduler frontend to sort
> these out.
> >> >> > >
> >> >> >
> >> >> > The reason is to disallow lower-privileged process to
> deadlock/hang a
> >> >> > higher-privileged process where the kernel can't tell who did it.
> If the
> >> >> > implicit-sync sequence counter is read only to userspace and only
> >> >> > incrementable by the unlock-signal command after the lock-wait
> command
> >> >> > appeared in the same queue (both together forming a critical
> section),
> >> >> > userspace can't manipulate it arbitrarily and we get almost the
> exact same
> >> >> > behavior as implicit sync has today. That means any
> implicitly-sync'd
> >> >> > buffer from any process can be fully trusted by a compositor to
> signal in a
> >> >> > finite time, and possibly even trusted by the kernel. The only
> thing that's
> >> >> > different is that a malicious process can disable implicit sync
> for a
> >> >> > buffer in all processes/kernel, but it can't hang other
> processes/kernel
> >> >> > (it can only hang itself and the kernel will be notified). So I'm
> a happy
> >> >> > panda now. :)
> >> >>
> >> >> Yeah I think that's not going to work too well, and is too many
> piled up
> >> >> hacks. Within a drm_file fd you can do whatever you feel like, sinc=
e
> it's
> >> >> just one client.
> >> >>
> >> >> But once implicit sync kicks in I think you need to go with
> dma_fence and
> >> >> drm/scheduler to handle the dependencies, and tdr kicking it. With
> the
> >> >> dma_fence you do know who's the offender - you might not know why,
> but
> >> >> that doesn't matter, you just shred the entire context and let that
> >> >> userspace figure out the details.
> >> >>
> >> >> I think trying to make memory fences work as implicit sync directly=
,
> >> >> without wrapping them in a dma_fence and assorted guarantees, will
> just
> >> >> not work.
> >> >>
> >> >> And once you do wrap them in dma_fence, then all the other problems
> go
> >> >> away: cross-driver sync, syncfiles, ... So I really don't see the
> benefit
> >> >> of this half-way approach.
> >> >>
> >> >> Yes there's going to be a tad bit of overhead, but that's already
> there in
> >> >> the current model. And it can't hurt to have a bit of motivation fo=
r
> >> >> compositors to switch over to userspace memory fences properly.
> >> >
> >> >
> >> > Well, Christian thinks that we need a high level synchronization
> primitive in hw. I don't know myself and you may be right. A software
> scheduler with user queues might be one option. My part is only to find o=
ut
> how much of the scheduler logic can be moved to the hardware.
> >> >
> >> > We plan to have memory timeline semaphores, or simply monotonic
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
> >>
> >> I don't think hw access rights control on memory fences makes sense.
> >> There's two cases:
> >>
> >> - brave new world of native userspace memory fences. Currently that's
> >> compute, maybe direct display vk, hopefully/eventually compositors and
> >> desktops too. If you get an untrusted fence, you need to have fallback
> >> logic no matter what, and by design. vk is explicit in stating that if
> >> things hang, you get to keep all the pieces. So the compositor needs
> >> to _always_ treat userspace memory fences as hostile, wrap them in a
> >> timeout, and have a fallback frame/scene in its rendering path.
> >> Probably same for the kernel on display side, maybe down to the
> >> display hw picking the "right" frame depending upon the fence value
> >> right before scanout as we discussed earlier. There's no point in hw
> >> access rights because by design, even if no one tampers with your
> >> fence, it might never signal. So you have to cope with a hostile fence
> >> from untrusted sources anyway (and within an app it's trusted and you
> >> just die as in stuck in an endless loop until someon sends a SIGKILL
> >> when you deadlock or get it wrong some other way).
> >>
> >> - old compat mode where we need to use dma_fence, otherwise we end up
> >> with another round of "amdgpu redefines implicit sync in incompatible
> >> ways", and Christian&me don't even know yet how to fix the current
> >> round without breaking use-cases badly yet. So it has to be dma_fence,
> >> and it has to be the same rules as on old hw, or it's just not going
> >> to work. This means you need to force in-order retiring of fences in
> >> the kernel, and you need to enforce timeout. None of this needs hw
> >> access rights control, since once more it's just software constructs
> >> in the kernel. As a first appromixation, drm/scheduler + the fence
> >> chain we already have in syncobj is probably good enough for this.
> >> E.g. if userspace rolls the fence backwards then the kernel just
> >> ignores that, because its internal dma_fence has signalled, and
> >> dma_fences never unsignal (it's a bit in struct dma_fence, once it's
> >> set we stop checking hw). And if it doesn't signal in time, then tdr
> >> jumps in and fixes the mess. Hw access control doesn't fix anything
> >> here, because you have to deal with timeout and ordering already
> >> anyway, or the dma_fence contract is broken.
> >>
> >> So in both cases hw access control gains you nothing (at least I'm not
> >> seeing anything), it just makes the design more tricky. "Userspace can
> >> manipulate the fences" is _intentionally_ how these things work, we
> >> need a design that works with that hw design, not against it and
> >> somehow tries to get us back to the old world, but only halfway (i.e.
> >> not useful at all, since old userspace needs us to go all the way back
> >> to dma_fence, and new userspace wants to fully exploit userspace
> >> memory fences without artificial limitations for no reason).
> >> -Daniel
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000c0862805c3e9efb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu., Jun. 3, 2021, 15:18 Daniel Vetter, &lt;<a hre=
f=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Thu, Jun 3, 2021 at 7:53 PM Marek Ol=C5=A1=C3=
=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blank" rel=3D"noref=
errer">maraeo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Daniel, I think what you are suggesting is that we need to enable user=
 queues with the drm scheduler and dma_fence first, and once that works, we=
 can investigate how much of that kernel logic can be moved to the hw. Woul=
d that work? In theory it shouldn&#39;t matter whether the kernel does it o=
r the hw does it. It&#39;s the same code, just in a different place.<br>
<br>
Yeah I guess that&#39;s another way to look at it. Maybe in practice<br>
you&#39;ll just move it from the kernel to userspace, which then programs<b=
r>
the hw waits directly into its IB. That&#39;s at least how I&#39;d do it on=
<br>
i915, assuming I&#39;d have such hw. So these fences that userspace<br>
programs directly (to sync within itself) won&#39;t even show up as<br>
dependencies in the kernel.<br>
<br>
And then yes on the other side you can lift work from the<br>
drm/scheduler wrt dependencies you get in the kernel (whether explicit<br>
sync with sync_file, or implicit sync fished out of dma_resv) and<br>
program the hw directly that way. That would mean that userspace wont<br>
fill the ringbuffer directly, but the kernel would do that, so that<br>
you have space to stuff in the additional waits. Again assuming i915<br>
hw model, maybe works differently on amd. Iirc we have some of that<br>
already in the i915 scheduler, but I&#39;d need to recheck how much it<br>
really uses the hw semaphores.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">I was thinking we would pass per process sync=
obj handles and buffer handles into commands in the user queue, or somethin=
g equivalent. We do have a large degree of programmability in the hw that w=
e can do something like that. The question is whether this high level user-=
&gt;hw interface would have any advantage over trivial polling on memory, e=
tc. My impression is no because the kernel would be robust enough that it w=
ouldn&#39;t matter what userspace does, but I don&#39;t know. Anyway, all w=
e need is user queues and what your proposed seems totally sufficient.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Marek</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
-Daniel<br>
<br>
&gt; Thanks,<br>
&gt; Marek<br>
&gt;<br>
&gt; On Thu, Jun 3, 2021 at 7:22 AM Daniel Vetter &lt;<a href=3D"mailto:dan=
iel@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Jun 3, 2021 at 12:55 PM Marek Ol=C5=A1=C3=A1k &lt;<a href=
=3D"mailto:maraeo@gmail.com" target=3D"_blank" rel=3D"noreferrer">maraeo@gm=
ail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu., Jun. 3, 2021, 06:03 Daniel Vetter, &lt;<a href=3D"ma=
ilto:daniel@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch<=
/a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Ol=C5=A1=
=C3=A1k wrote:<br>
&gt;&gt; &gt;&gt; &gt; On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter &lt;<a =
href=3D"mailto:daniel@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel=
@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek=
 Ol=C5=A1=C3=A1k wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; On Wed, Jun 2, 2021 at 2:48 PM Daniel Vett=
er &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank" rel=3D"noreferr=
er">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; On Wed, Jun 02, 2021 at 05:38:51AM -0=
400, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; On Wed, Jun 2, 2021 at 5:34 AM M=
arek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">maraeo@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; Yes, we can&#39;t break any=
thing because we don&#39;t want to complicate<br>
&gt;&gt; &gt;&gt; &gt; &gt; things<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; for us. It&#39;s pretty muc=
h all NAK&#39;d already. We are trying to gather<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; more<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; knowledge and then make bet=
ter decisions.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; The idea we are considering=
 is that we&#39;ll expose memory-based sync<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; objects<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; to userspace for read only,=
 and the kernel or hw will strictly<br>
&gt;&gt; &gt;&gt; &gt; &gt; control<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; the<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; memory writes to those sync=
 objects. The hole in that idea is that<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; userspace can decide not to=
 signal a job, so even if userspace<br>
&gt;&gt; &gt;&gt; &gt; &gt; can&#39;t<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; overwrite memory-based sync=
 object states arbitrarily, it can still<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; decide<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt; not to signal them, and the=
n a future fence is born.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; This would actually be treated a=
s a GPU hang caused by that context,<br>
&gt;&gt; &gt;&gt; &gt; &gt; so<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; it<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; should be fine.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; This is practically what I proposed a=
lready, except your not doing it<br>
&gt;&gt; &gt;&gt; &gt; &gt; with<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; dma_fence. And on the memory fence si=
de this also doesn&#39;t actually give<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; what you want for that compute model.=
<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; This seems like a bit a worst of both=
 worlds approach to me? Tons of<br>
&gt;&gt; &gt;&gt; &gt; &gt; work<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; in the kernel to hide these not-dma_f=
ence-but-almost, and still pain to<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; actually drive the hardware like it s=
hould be for compute or direct<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; display.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; Also maybe I&#39;ve missed it, but I =
didn&#39;t see any replies to my<br>
&gt;&gt; &gt;&gt; &gt; &gt; suggestion<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; how to fake the entire dma_fence stuf=
f on top of new hw. Would be<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; interesting to know what doesn&#39;t =
work there instead of amd folks going<br>
&gt;&gt; &gt;&gt; &gt; &gt; of<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; into internal again and then coming b=
ack with another rfc from out of<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; nowhere :-)<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; Going internal again is probably a good id=
ea to spare you the long<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; discussions and not waste your time, but w=
e haven&#39;t talked about the<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; dma_fence stuff internally other than ackn=
owledging that it can be<br>
&gt;&gt; &gt;&gt; &gt; &gt; solved.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; The compute use case already uses the hw a=
s-is with no inter-process<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; sharing, which mostly keeps the kernel out=
 of the picture. It uses<br>
&gt;&gt; &gt;&gt; &gt; &gt; glFinish<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; to sync with GL.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; The gfx use case needs new hardware logic =
to support implicit and<br>
&gt;&gt; &gt;&gt; &gt; &gt; explicit<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; sync. When we propose a solution, it&#39;s=
 usually torn apart the next day by<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; ourselves.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; Since we are talking about next hw or next=
 next hw, preemption should be<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; better.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; user queue =3D user-mapped ring buffer<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; For implicit sync, we will only let usersp=
ace lock access to a buffer<br>
&gt;&gt; &gt;&gt; &gt; &gt; via a<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; user queue, which waits for the per-buffer=
 sequence counter in memory to<br>
&gt;&gt; &gt;&gt; &gt; &gt; be<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt;=3D the number assigned by the kernel,=
 and later unlock the access with<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; another command, which increments the per-=
buffer sequence counter in<br>
&gt;&gt; &gt;&gt; &gt; &gt; memory<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; with atomic_inc regardless of the number a=
ssigned by the kernel. The<br>
&gt;&gt; &gt;&gt; &gt; &gt; kernel<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; counter and the counter in memory can be o=
ut-of-sync, and I&#39;ll explain<br>
&gt;&gt; &gt;&gt; &gt; &gt; why<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; it&#39;s OK. If a process increments the k=
ernel counter but not the memory<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; counter, that&#39;s its problem and it&#39=
;s the same as a GPU hang caused by<br>
&gt;&gt; &gt;&gt; &gt; &gt; that<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; process. If a process increments the memor=
y counter but not the kernel<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; counter, the &quot;&gt;=3D&quot; condition=
 alongside atomic_inc guarantee that<br>
&gt;&gt; &gt;&gt; &gt; &gt; signaling n<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; will signal n+1, so it will never deadlock=
 but also it will effectively<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; disable synchronization. This method of di=
sabling synchronization is<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; similar to a process corrupting the buffer=
, which should be fine. Can you<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; find any flaw in it? I can&#39;t find any.=
<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Hm maybe I misunderstood what exactly you wante=
d to do earlier. That kind<br>
&gt;&gt; &gt;&gt; &gt; &gt; of &quot;we let userspace free-wheel whatever i=
t wants, kernel ensures<br>
&gt;&gt; &gt;&gt; &gt; &gt; correctness of the resulting chain of dma_fence=
 with reset the entire<br>
&gt;&gt; &gt;&gt; &gt; &gt; context&quot; is what I proposed too.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Like you say, userspace is allowed to render ga=
rbage already.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; The explicit submit can be done by userspa=
ce (if there is no<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; synchronization), but we plan to use the k=
ernel to do it for implicit<br>
&gt;&gt; &gt;&gt; &gt; &gt; sync.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; Essentially, the kernel will receive a buf=
fer list and addresses of wait<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; commands in the user queue. It will assign=
 new sequence numbers to all<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; buffers and write those numbers into the w=
ait commands, and ring the hw<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; doorbell to start execution of that queue.=
<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Yeah for implicit sync I think kernel and using=
 drm/scheduler to sort out<br>
&gt;&gt; &gt;&gt; &gt; &gt; the dma_fence dependencies is probably best. Si=
nce you can filter out<br>
&gt;&gt; &gt;&gt; &gt; &gt; which dma_fence you hand to the scheduler for d=
ependency tracking you can<br>
&gt;&gt; &gt;&gt; &gt; &gt; filter out your own ones and let the hw handle =
those directly (depending<br>
&gt;&gt; &gt;&gt; &gt; &gt; how much your hw can do an all that). On i915 w=
e might do that to be able<br>
&gt;&gt; &gt;&gt; &gt; &gt; to use MI_SEMAPHORE_WAIT/SIGNAL functionality i=
n the hw and fw scheduler.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; For buffer tracking with implicit sync I think =
cleanest is probably to<br>
&gt;&gt; &gt;&gt; &gt; &gt; still keep them wrapped as dma_fence and stuffe=
d into dma_resv, but<br>
&gt;&gt; &gt;&gt; &gt; &gt; conceptually it&#39;s the same. If we let every=
 driver reinvent their own<br>
&gt;&gt; &gt;&gt; &gt; &gt; buffer tracking just because the hw works a bit=
 different it&#39;ll be a mess.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Wrt wait commands: I&#39;m honestly not sure wh=
y you&#39;d do that. Userspace gets<br>
&gt;&gt; &gt;&gt; &gt; &gt; to keep the pieces if it gets it wrong. You do =
still need to handle<br>
&gt;&gt; &gt;&gt; &gt; &gt; external dma_fence though, hence drm/scheduler =
frontend to sort these out.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; The reason is to disallow lower-privileged process t=
o deadlock/hang a<br>
&gt;&gt; &gt;&gt; &gt; higher-privileged process where the kernel can&#39;t=
 tell who did it. If the<br>
&gt;&gt; &gt;&gt; &gt; implicit-sync sequence counter is read only to users=
pace and only<br>
&gt;&gt; &gt;&gt; &gt; incrementable by the unlock-signal command after the=
 lock-wait command<br>
&gt;&gt; &gt;&gt; &gt; appeared in the same queue (both together forming a =
critical section),<br>
&gt;&gt; &gt;&gt; &gt; userspace can&#39;t manipulate it arbitrarily and we=
 get almost the exact same<br>
&gt;&gt; &gt;&gt; &gt; behavior as implicit sync has today. That means any =
implicitly-sync&#39;d<br>
&gt;&gt; &gt;&gt; &gt; buffer from any process can be fully trusted by a co=
mpositor to signal in a<br>
&gt;&gt; &gt;&gt; &gt; finite time, and possibly even trusted by the kernel=
. The only thing that&#39;s<br>
&gt;&gt; &gt;&gt; &gt; different is that a malicious process can disable im=
plicit sync for a<br>
&gt;&gt; &gt;&gt; &gt; buffer in all processes/kernel, but it can&#39;t han=
g other processes/kernel<br>
&gt;&gt; &gt;&gt; &gt; (it can only hang itself and the kernel will be noti=
fied). So I&#39;m a happy<br>
&gt;&gt; &gt;&gt; &gt; panda now. :)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Yeah I think that&#39;s not going to work too well, and i=
s too many piled up<br>
&gt;&gt; &gt;&gt; hacks. Within a drm_file fd you can do whatever you feel =
like, since it&#39;s<br>
&gt;&gt; &gt;&gt; just one client.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; But once implicit sync kicks in I think you need to go wi=
th dma_fence and<br>
&gt;&gt; &gt;&gt; drm/scheduler to handle the dependencies, and tdr kicking=
 it. With the<br>
&gt;&gt; &gt;&gt; dma_fence you do know who&#39;s the offender - you might =
not know why, but<br>
&gt;&gt; &gt;&gt; that doesn&#39;t matter, you just shred the entire contex=
t and let that<br>
&gt;&gt; &gt;&gt; userspace figure out the details.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I think trying to make memory fences work as implicit syn=
c directly,<br>
&gt;&gt; &gt;&gt; without wrapping them in a dma_fence and assorted guarant=
ees, will just<br>
&gt;&gt; &gt;&gt; not work.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; And once you do wrap them in dma_fence, then all the othe=
r problems go<br>
&gt;&gt; &gt;&gt; away: cross-driver sync, syncfiles, ... So I really don&#=
39;t see the benefit<br>
&gt;&gt; &gt;&gt; of this half-way approach.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Yes there&#39;s going to be a tad bit of overhead, but th=
at&#39;s already there in<br>
&gt;&gt; &gt;&gt; the current model. And it can&#39;t hurt to have a bit of=
 motivation for<br>
&gt;&gt; &gt;&gt; compositors to switch over to userspace memory fences pro=
perly.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Well, Christian thinks that we need a high level synchronizat=
ion primitive in hw. I don&#39;t know myself and you may be right. A softwa=
re scheduler with user queues might be one option. My part is only to find =
out how much of the scheduler logic can be moved to the hardware.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We plan to have memory timeline semaphores, or simply monoton=
ic counters, and a fence will be represented by the counter address and a c=
onstant sequence number for the &lt;=3D comparison. One counter can represe=
nt up to 2^64 different fences. Giving any process write access to a fence =
is the same as giving it the power to manipulate the signalled state of a s=
equence of up to 2^64 fences. That could mess up a lot of things. However, =
if the hardware had a high level synchronization primitive with access righ=
ts and a limited set of clearly defined operations such that we can formall=
y prove whether it&#39;s safe for everybody, we could have a solution where=
 we don&#39;t have to involve the software scheduler and just let the hardw=
are do everything.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t think hw access rights control on memory fences makes =
sense.<br>
&gt;&gt; There&#39;s two cases:<br>
&gt;&gt;<br>
&gt;&gt; - brave new world of native userspace memory fences. Currently tha=
t&#39;s<br>
&gt;&gt; compute, maybe direct display vk, hopefully/eventually compositors=
 and<br>
&gt;&gt; desktops too. If you get an untrusted fence, you need to have fall=
back<br>
&gt;&gt; logic no matter what, and by design. vk is explicit in stating tha=
t if<br>
&gt;&gt; things hang, you get to keep all the pieces. So the compositor nee=
ds<br>
&gt;&gt; to _always_ treat userspace memory fences as hostile, wrap them in=
 a<br>
&gt;&gt; timeout, and have a fallback frame/scene in its rendering path.<br=
>
&gt;&gt; Probably same for the kernel on display side, maybe down to the<br=
>
&gt;&gt; display hw picking the &quot;right&quot; frame depending upon the =
fence value<br>
&gt;&gt; right before scanout as we discussed earlier. There&#39;s no point=
 in hw<br>
&gt;&gt; access rights because by design, even if no one tampers with your<=
br>
&gt;&gt; fence, it might never signal. So you have to cope with a hostile f=
ence<br>
&gt;&gt; from untrusted sources anyway (and within an app it&#39;s trusted =
and you<br>
&gt;&gt; just die as in stuck in an endless loop until someon sends a SIGKI=
LL<br>
&gt;&gt; when you deadlock or get it wrong some other way).<br>
&gt;&gt;<br>
&gt;&gt; - old compat mode where we need to use dma_fence, otherwise we end=
 up<br>
&gt;&gt; with another round of &quot;amdgpu redefines implicit sync in inco=
mpatible<br>
&gt;&gt; ways&quot;, and Christian&amp;me don&#39;t even know yet how to fi=
x the current<br>
&gt;&gt; round without breaking use-cases badly yet. So it has to be dma_fe=
nce,<br>
&gt;&gt; and it has to be the same rules as on old hw, or it&#39;s just not=
 going<br>
&gt;&gt; to work. This means you need to force in-order retiring of fences =
in<br>
&gt;&gt; the kernel, and you need to enforce timeout. None of this needs hw=
<br>
&gt;&gt; access rights control, since once more it&#39;s just software cons=
tructs<br>
&gt;&gt; in the kernel. As a first appromixation, drm/scheduler + the fence=
<br>
&gt;&gt; chain we already have in syncobj is probably good enough for this.=
<br>
&gt;&gt; E.g. if userspace rolls the fence backwards then the kernel just<b=
r>
&gt;&gt; ignores that, because its internal dma_fence has signalled, and<br=
>
&gt;&gt; dma_fences never unsignal (it&#39;s a bit in struct dma_fence, onc=
e it&#39;s<br>
&gt;&gt; set we stop checking hw). And if it doesn&#39;t signal in time, th=
en tdr<br>
&gt;&gt; jumps in and fixes the mess. Hw access control doesn&#39;t fix any=
thing<br>
&gt;&gt; here, because you have to deal with timeout and ordering already<b=
r>
&gt;&gt; anyway, or the dma_fence contract is broken.<br>
&gt;&gt;<br>
&gt;&gt; So in both cases hw access control gains you nothing (at least I&#=
39;m not<br>
&gt;&gt; seeing anything), it just makes the design more tricky. &quot;User=
space can<br>
&gt;&gt; manipulate the fences&quot; is _intentionally_ how these things wo=
rk, we<br>
&gt;&gt; need a design that works with that hw design, not against it and<b=
r>
&gt;&gt; somehow tries to get us back to the old world, but only halfway (i=
.e.<br>
&gt;&gt; not useful at all, since old userspace needs us to go all the way =
back<br>
&gt;&gt; to dma_fence, and new userspace wants to fully exploit userspace<b=
r>
&gt;&gt; memory fences without artificial limitations for no reason).<br>
&gt;&gt; -Daniel<br>
&gt;&gt; --<br>
&gt;&gt; Daniel Vetter<br>
&gt;&gt; Software Engineer, Intel Corporation<br>
&gt;&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">http://blog.ffwll.ch</a><br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://blog.ffwll.ch</a><br>
</blockquote></div></div></div>

--000000000000c0862805c3e9efb9--
