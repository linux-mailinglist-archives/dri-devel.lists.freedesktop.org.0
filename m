Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D9399FB6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 13:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CF16E87F;
	Thu,  3 Jun 2021 11:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283156E196
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 11:22:27 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 c31-20020a056830349fb02903a5bfa6138bso5385151otu.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jv0HuV+zhzJxByTLBegAWmiwt1qRIt00HcuvyFHU60o=;
 b=ZEiqGGpFUfyXQQOPsXfnkz1eEQ2rH6IhjAuuQcDUR00J51vRw8QbUmNG3wP8bhAwzL
 2ytzNafvKN7JVVu+xfkCwZFWNLYi32LOfY6ly/wm3lOP6cxaE3bS4oLbaSTCjTq3uNQp
 G3jeUf/vDyE502kovjkPEFs5L0dKSo80vQeMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jv0HuV+zhzJxByTLBegAWmiwt1qRIt00HcuvyFHU60o=;
 b=kfhYIZnEtyxsJMNMTnTCvXfQWjHZDcYqwCdvaOAHH+Al/pofK9cFOjWN63Xr7kgdT0
 OJx1FYMtBDOBnWBPQJdylht6HtlaCcVvJaFJMDExz2Ok7e29zKy3MMQZClnsjYCv/86r
 RnowZJ/EcDQEwU5UWPT8vHz/LZ8h0iVS5W29Q5DOG37ZlPlJiX+CxHd3FAHn6LTE6Uc3
 s3yBM2zMT/F5eNlIIBUylSt7ewsusl4vggppRkucWpql2zJncL3ZOihb0CklDbtjOelu
 iaojmyKhTbxL9CI0hp7jhXCnVUSe5ENOPKNhKUn1VbCF51nKQn9LyuMzyQhMBjTrEemP
 YQEg==
X-Gm-Message-State: AOAM530YJSF3aWQj4WOMavt0wE9BumdJ5GpdtQDnujGqWDQ/4wclQKX4
 04SqJWQmZVeaH4tr3uVCqP5tIpJun2Y7lzTj0tSUkw==
X-Google-Smtp-Source: ABdhPJyoKxUEx3b+pk/DbRj9YfF6Dah5nLAEBaazbZDpXm7gG97Nba7CU5nqaTIhwdlGEgCmWuD286ywK7m3aUC9QRU=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr28877942otb.281.1622719346320; 
 Thu, 03 Jun 2021 04:22:26 -0700 (PDT)
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
In-Reply-To: <CAAxE2A5=DmvCrh5+dfxPtyv7L2UPPevYOqa=GtFpuaxvMVfK9Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Jun 2021 13:22:15 +0200
Message-ID: <CAKMK7uF_CEEY+55o07irnG1G+xbo8Y9tNmcMZD4G9GFUFJr4zw@mail.gmail.com>
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

On Thu, Jun 3, 2021 at 12:55 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:
>
> On Thu., Jun. 3, 2021, 06:03 Daniel Vetter, <daniel@ffwll.ch> wrote:
>>
>> On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Ol=C5=A1=C3=A1k wrote:
>> > On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> >
>> > > On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Ol=C5=A1=C3=A1k wrot=
e:
>> > > > On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>> > > >
>> > > > > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=A1=C3=A1k =
wrote:
>> > > > > > On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k <maraeo@g=
mail.com> wrote:
>> > > > > >
>> > > > > > > Yes, we can't break anything because we don't want to compli=
cate
>> > > things
>> > > > > > > for us. It's pretty much all NAK'd already. We are trying to=
 gather
>> > > > > more
>> > > > > > > knowledge and then make better decisions.
>> > > > > > >
>> > > > > > > The idea we are considering is that we'll expose memory-base=
d sync
>> > > > > objects
>> > > > > > > to userspace for read only, and the kernel or hw will strict=
ly
>> > > control
>> > > > > the
>> > > > > > > memory writes to those sync objects. The hole in that idea i=
s that
>> > > > > > > userspace can decide not to signal a job, so even if userspa=
ce
>> > > can't
>> > > > > > > overwrite memory-based sync object states arbitrarily, it ca=
n still
>> > > > > decide
>> > > > > > > not to signal them, and then a future fence is born.
>> > > > > > >
>> > > > > >
>> > > > > > This would actually be treated as a GPU hang caused by that co=
ntext,
>> > > so
>> > > > > it
>> > > > > > should be fine.
>> > > > >
>> > > > > This is practically what I proposed already, except your not doi=
ng it
>> > > with
>> > > > > dma_fence. And on the memory fence side this also doesn't actual=
ly give
>> > > > > what you want for that compute model.
>> > > > >
>> > > > > This seems like a bit a worst of both worlds approach to me? Ton=
s of
>> > > work
>> > > > > in the kernel to hide these not-dma_fence-but-almost, and still =
pain to
>> > > > > actually drive the hardware like it should be for compute or dir=
ect
>> > > > > display.
>> > > > >
>> > > > > Also maybe I've missed it, but I didn't see any replies to my
>> > > suggestion
>> > > > > how to fake the entire dma_fence stuff on top of new hw. Would b=
e
>> > > > > interesting to know what doesn't work there instead of amd folks=
 going
>> > > of
>> > > > > into internal again and then coming back with another rfc from o=
ut of
>> > > > > nowhere :-)
>> > > > >
>> > > >
>> > > > Going internal again is probably a good idea to spare you the long
>> > > > discussions and not waste your time, but we haven't talked about t=
he
>> > > > dma_fence stuff internally other than acknowledging that it can be
>> > > solved.
>> > > >
>> > > > The compute use case already uses the hw as-is with no inter-proce=
ss
>> > > > sharing, which mostly keeps the kernel out of the picture. It uses
>> > > glFinish
>> > > > to sync with GL.
>> > > >
>> > > > The gfx use case needs new hardware logic to support implicit and
>> > > explicit
>> > > > sync. When we propose a solution, it's usually torn apart the next=
 day by
>> > > > ourselves.
>> > > >
>> > > > Since we are talking about next hw or next next hw, preemption sho=
uld be
>> > > > better.
>> > > >
>> > > > user queue =3D user-mapped ring buffer
>> > > >
>> > > > For implicit sync, we will only let userspace lock access to a buf=
fer
>> > > via a
>> > > > user queue, which waits for the per-buffer sequence counter in mem=
ory to
>> > > be
>> > > > >=3D the number assigned by the kernel, and later unlock the acces=
s with
>> > > > another command, which increments the per-buffer sequence counter =
in
>> > > memory
>> > > > with atomic_inc regardless of the number assigned by the kernel. T=
he
>> > > kernel
>> > > > counter and the counter in memory can be out-of-sync, and I'll exp=
lain
>> > > why
>> > > > it's OK. If a process increments the kernel counter but not the me=
mory
>> > > > counter, that's its problem and it's the same as a GPU hang caused=
 by
>> > > that
>> > > > process. If a process increments the memory counter but not the ke=
rnel
>> > > > counter, the ">=3D" condition alongside atomic_inc guarantee that
>> > > signaling n
>> > > > will signal n+1, so it will never deadlock but also it will effect=
ively
>> > > > disable synchronization. This method of disabling synchronization =
is
>> > > > similar to a process corrupting the buffer, which should be fine. =
Can you
>> > > > find any flaw in it? I can't find any.
>> > >
>> > > Hm maybe I misunderstood what exactly you wanted to do earlier. That=
 kind
>> > > of "we let userspace free-wheel whatever it wants, kernel ensures
>> > > correctness of the resulting chain of dma_fence with reset the entir=
e
>> > > context" is what I proposed too.
>> > >
>> > > Like you say, userspace is allowed to render garbage already.
>> > >
>> > > > The explicit submit can be done by userspace (if there is no
>> > > > synchronization), but we plan to use the kernel to do it for impli=
cit
>> > > sync.
>> > > > Essentially, the kernel will receive a buffer list and addresses o=
f wait
>> > > > commands in the user queue. It will assign new sequence numbers to=
 all
>> > > > buffers and write those numbers into the wait commands, and ring t=
he hw
>> > > > doorbell to start execution of that queue.
>> > >
>> > > Yeah for implicit sync I think kernel and using drm/scheduler to sor=
t out
>> > > the dma_fence dependencies is probably best. Since you can filter ou=
t
>> > > which dma_fence you hand to the scheduler for dependency tracking yo=
u can
>> > > filter out your own ones and let the hw handle those directly (depen=
ding
>> > > how much your hw can do an all that). On i915 we might do that to be=
 able
>> > > to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw sched=
uler.
>> > >
>> > > For buffer tracking with implicit sync I think cleanest is probably =
to
>> > > still keep them wrapped as dma_fence and stuffed into dma_resv, but
>> > > conceptually it's the same. If we let every driver reinvent their ow=
n
>> > > buffer tracking just because the hw works a bit different it'll be a=
 mess.
>> > >
>> > > Wrt wait commands: I'm honestly not sure why you'd do that. Userspac=
e gets
>> > > to keep the pieces if it gets it wrong. You do still need to handle
>> > > external dma_fence though, hence drm/scheduler frontend to sort thes=
e out.
>> > >
>> >
>> > The reason is to disallow lower-privileged process to deadlock/hang a
>> > higher-privileged process where the kernel can't tell who did it. If t=
he
>> > implicit-sync sequence counter is read only to userspace and only
>> > incrementable by the unlock-signal command after the lock-wait command
>> > appeared in the same queue (both together forming a critical section),
>> > userspace can't manipulate it arbitrarily and we get almost the exact =
same
>> > behavior as implicit sync has today. That means any implicitly-sync'd
>> > buffer from any process can be fully trusted by a compositor to signal=
 in a
>> > finite time, and possibly even trusted by the kernel. The only thing t=
hat's
>> > different is that a malicious process can disable implicit sync for a
>> > buffer in all processes/kernel, but it can't hang other processes/kern=
el
>> > (it can only hang itself and the kernel will be notified). So I'm a ha=
ppy
>> > panda now. :)
>>
>> Yeah I think that's not going to work too well, and is too many piled up
>> hacks. Within a drm_file fd you can do whatever you feel like, since it'=
s
>> just one client.
>>
>> But once implicit sync kicks in I think you need to go with dma_fence an=
d
>> drm/scheduler to handle the dependencies, and tdr kicking it. With the
>> dma_fence you do know who's the offender - you might not know why, but
>> that doesn't matter, you just shred the entire context and let that
>> userspace figure out the details.
>>
>> I think trying to make memory fences work as implicit sync directly,
>> without wrapping them in a dma_fence and assorted guarantees, will just
>> not work.
>>
>> And once you do wrap them in dma_fence, then all the other problems go
>> away: cross-driver sync, syncfiles, ... So I really don't see the benefi=
t
>> of this half-way approach.
>>
>> Yes there's going to be a tad bit of overhead, but that's already there =
in
>> the current model. And it can't hurt to have a bit of motivation for
>> compositors to switch over to userspace memory fences properly.
>
>
> Well, Christian thinks that we need a high level synchronization primitiv=
e in hw. I don't know myself and you may be right. A software scheduler wit=
h user queues might be one option. My part is only to find out how much of =
the scheduler logic can be moved to the hardware.
>
> We plan to have memory timeline semaphores, or simply monotonic counters,=
 and a fence will be represented by the counter address and a constant sequ=
ence number for the <=3D comparison. One counter can represent up to 2^64 d=
ifferent fences. Giving any process write access to a fence is the same as =
giving it the power to manipulate the signalled state of a sequence of up t=
o 2^64 fences. That could mess up a lot of things. However, if the hardware=
 had a high level synchronization primitive with access rights and a limite=
d set of clearly defined operations such that we can formally prove whether=
 it's safe for everybody, we could have a solution where we don't have to i=
nvolve the software scheduler and just let the hardware do everything.

I don't think hw access rights control on memory fences makes sense.
There's two cases:

- brave new world of native userspace memory fences. Currently that's
compute, maybe direct display vk, hopefully/eventually compositors and
desktops too. If you get an untrusted fence, you need to have fallback
logic no matter what, and by design. vk is explicit in stating that if
things hang, you get to keep all the pieces. So the compositor needs
to _always_ treat userspace memory fences as hostile, wrap them in a
timeout, and have a fallback frame/scene in its rendering path.
Probably same for the kernel on display side, maybe down to the
display hw picking the "right" frame depending upon the fence value
right before scanout as we discussed earlier. There's no point in hw
access rights because by design, even if no one tampers with your
fence, it might never signal. So you have to cope with a hostile fence
from untrusted sources anyway (and within an app it's trusted and you
just die as in stuck in an endless loop until someon sends a SIGKILL
when you deadlock or get it wrong some other way).

- old compat mode where we need to use dma_fence, otherwise we end up
with another round of "amdgpu redefines implicit sync in incompatible
ways", and Christian&me don't even know yet how to fix the current
round without breaking use-cases badly yet. So it has to be dma_fence,
and it has to be the same rules as on old hw, or it's just not going
to work. This means you need to force in-order retiring of fences in
the kernel, and you need to enforce timeout. None of this needs hw
access rights control, since once more it's just software constructs
in the kernel. As a first appromixation, drm/scheduler + the fence
chain we already have in syncobj is probably good enough for this.
E.g. if userspace rolls the fence backwards then the kernel just
ignores that, because its internal dma_fence has signalled, and
dma_fences never unsignal (it's a bit in struct dma_fence, once it's
set we stop checking hw). And if it doesn't signal in time, then tdr
jumps in and fixes the mess. Hw access control doesn't fix anything
here, because you have to deal with timeout and ordering already
anyway, or the dma_fence contract is broken.

So in both cases hw access control gains you nothing (at least I'm not
seeing anything), it just makes the design more tricky. "Userspace can
manipulate the fences" is _intentionally_ how these things work, we
need a design that works with that hw design, not against it and
somehow tries to get us back to the old world, but only halfway (i.e.
not useful at all, since old userspace needs us to go all the way back
to dma_fence, and new userspace wants to fully exploit userspace
memory fences without artificial limitations for no reason).
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
