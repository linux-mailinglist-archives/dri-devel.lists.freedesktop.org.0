Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E4372E95
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 19:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B3789D00;
	Tue,  4 May 2021 17:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6E89D00;
 Tue,  4 May 2021 17:16:34 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id p12so7821825pgj.10;
 Tue, 04 May 2021 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gyv6ANs6xU1RsqUeM9SGO9pt7eeeRFtkcUQN+obiBTc=;
 b=Of/zb37H9SO5pmjm/reQeAt/2jlRBBHQqnsUM67o0PIAR8CWfB7ZacYpL9bm3yqSxo
 BoTflIxOiqW2hgHmMiEf0LSdebptENA2MozSxssM3kgEvB5Q1sV7QYHbR+DQl2ykHOf6
 cMh6AMzY2miVxjYsEwmlgJRQnQR/rimclJSNW+4+DoqU4Jj3CN1LXzGB1iKoR7JzJvzW
 TBZE7Auch2w47QThclQkXUb8JV0RCwi8JkGomTR+r36SpoOyFhb4i3PMiEXWgj8qhvb1
 pdibAoR1sW5gMX1osUplEWP4xEe8oNno2/bascVj2x7kLJEdC8QfI/TyZr0+1G1ozbRg
 enKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gyv6ANs6xU1RsqUeM9SGO9pt7eeeRFtkcUQN+obiBTc=;
 b=rC1wytMlOtGqmhVixg8jxkI/tcpkWoNlAfUJTYPQEh7p9DUOCHWRB82SCSPZRygSXa
 xUFDjpTYqV/3LOPg01hU3eLllmh2ObndVzQqiL3EOJaLMEgqmWa0U292hF0/KhCVlyNc
 h8b6p0/AgxyrLAu8NmzGYu8aHiHe2ACk9Dmsdc8ntgAn2Lh1aoEqzkGGlm1mM4nE+pdL
 6+1RkvoxPrNqDZ7darDf+glDo+lU8fg1JVU7ODQT/CtztnmOZ2qkwkVhEJb3ADdrSD3s
 KzEIME3+IKGMsg1VhUPddhplS5mD1JGlHmZn4UnMFUc/bxW5m+oUWoVJUpjtwrp1t94f
 Umow==
X-Gm-Message-State: AOAM5330HacvyGw1e+AhQoif98m4cXzkHg+rPrrtJgL0HU/nLkpf0EAH
 l8ZDB0xQ8ak2ESzNLUeAR2JJhqLByptjylHLewE=
X-Google-Smtp-Source: ABdhPJwe0jzW6yjP0WLGKmNdizn1Iyta2iFib61sSA6NKRTxbMq0N4hvHTKz1fRY7WbW6+ZUGOdxGASMf7nAz7CUPLE=
X-Received: by 2002:a63:8f17:: with SMTP id n23mr16435375pgd.82.1620148594380; 
 Tue, 04 May 2021 10:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe961tB38dE=gzte4OTGNMOpUsW2ikrB03+t=eh4pDYFh5g@mail.gmail.com>
 <CAP+8YyGkP2n9v2mJM5UH4NJrA6bE9+2Bgs1-6HrPPPMCrFz9dw@mail.gmail.com>
 <CAOFGe94JAO0OBiiwp8+hd=XCsrGLA1fVxqxePtPdHFg+YBB0dg@mail.gmail.com>
 <CAAxE2A50Lg+ehW3LSiTnvGRqHTR8tW77V7wES1PaCnbHVkzMug@mail.gmail.com>
 <CAAxE2A6NCTFsV6oH=AL=S=P1p0xYF0To8T_THpUO2ypdo0dyBw@mail.gmail.com>
 <1bd8105b-4a2a-2ad9-0b3c-a81590282f2e@gmail.com>
 <YJD4pt0r+TWAYfX5@phenom.ffwll.local>
 <9ccfe4b2-91f0-b8e5-6327-bf3c8b6d1a24@gmail.com>
 <CAKMK7uErXQ2O2RH4qqUVqYzw3jqJT2JwfCiXVZfu0U7HPKwYGA@mail.gmail.com>
 <a0c38808-3651-a3de-c4c4-2f4e5bf6fde7@gmail.com>
 <YJEYQnSb6m2df6YN@phenom.ffwll.local>
 <7227e6fb-1108-1096-ab2c-017d6422e90b@gmail.com>
 <CAKMK7uGQaysQM6NL3G3fgvoAk_0bOnz=62PaJmXw32sSh2n0RA@mail.gmail.com>
 <a9234655-ecd7-5ac0-579e-306d3bc91a59@gmail.com>
In-Reply-To: <a9234655-ecd7-5ac0-579e-306d3bc91a59@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 4 May 2021 13:16:23 -0400
Message-ID: <CAAxE2A6FP9N=eZ6uv8so0sdUhXCpa6OJSREndfoE9PJTbqBoPQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============1718242824=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1718242824==
Content-Type: multipart/alternative; boundary="0000000000007394eb05c1843d99"

--0000000000007394eb05c1843d99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see some mentions of XNACK and recoverable page faults. Note that all
gaming AMD hw that has userspace queues doesn't have XNACK, so there is no
overhead in compute units. My understanding is that recoverable page faults
are still supported without XNACK, but instead of the compute unit
replaying the faulting instruction, the L1 cache does that. Anyway, the
point is that XNACK is totally irrelevant here.

Marek

On Tue., May 4, 2021, 08:48 Christian K=C3=B6nig, <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 04.05.21 um 13:13 schrieb Daniel Vetter:
> > On Tue, May 4, 2021 at 12:53 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 04.05.21 um 11:47 schrieb Daniel Vetter:
> >>> [SNIP]
> >>>> Yeah, it just takes to long for the preemption to complete to be
> really
> >>>> useful for the feature we are discussing here.
> >>>>
> >>>> As I said when the kernel requests to preempt a queue we can easily
> expect a
> >>>> timeout of ~100ms until that comes back. For compute that is even in
> the
> >>>> multiple seconds range.
> >>> 100ms for preempting an idle request sounds like broken hw to me. Of
> >>> course preemting something that actually runs takes a while, that's
> >>> nothing new. But it's also not the thing we're talking about here. Is
> this
> >>> 100ms actual numbers from hw for an actual idle ringbuffer?
> >> Well 100ms is just an example of the scheduler granularity. Let me
> >> explain in a wider context.
> >>
> >> The hardware can have X queues mapped at the same time and every Y tim=
e
> >> interval the hardware scheduler checks if those queues have changed an=
d
> >> only if they have changed the necessary steps to reload them are
> started.
> >>
> >> Multiple queues can be rendering at the same time, so you can have X a=
s
> >> a high priority queue active and just waiting for a signal to start an=
d
> >> the client rendering one frame after another and a third background
> >> compute task mining bitcoins for you.
> >>
> >> As long as everything is static this is perfectly performant. Adding a
> >> queue to the list of active queues is also relatively simple, but taki=
ng
> >> one down requires you to wait until we are sure the hardware has seen
> >> the change and reloaded the queues.
> >>
> >> Think of it as an RCU grace period. This is simply not something which
> >> is made to be used constantly, but rather just at process termination.
> > Uh ... that indeed sounds rather broken.
>
> Well I wouldn't call it broken. It's just not made for the use case we
> are trying to abuse it for.
>
> > Otoh it's just a dma_fence that'd we'd inject as this unload-fence.
>
> Yeah, exactly that's why it isn't much of a problem for process
> termination or freeing memory.
>
> > So by and large everyone should already be able to cope with it taking =
a
> > bit longer. So from a design pov I don't see a huge problem, but I
> > guess you guys wont be happy since it means on amd hw there will be
> > random unsightly stalls in desktop linux usage.
> >
> >>>> The "preemption" feature is really called suspend and made just for
> the case
> >>>> when we want to put a process to sleep or need to forcefully kill it
> for
> >>>> misbehavior or stuff like that. It is not meant to be used in normal
> >>>> operation.
> >>>>
> >>>> If we only attach it on ->move then yeah maybe a last resort
> possibility to
> >>>> do it this way, but I think in that case we could rather stick with
> kernel
> >>>> submissions.
> >>> Well this is a hybrid userspace ring + kernel augmeted submit mode, s=
o
> you
> >>> can keep dma-fences working. Because the dma-fence stuff wont work wi=
th
> >>> pure userspace submit, I think that conclusion is rather solid. Once
> more
> >>> even after this long thread here.
> >> When assisted with unload fences, then yes. Problem is that I can't se=
e
> >> how we could implement those performant currently.
> > Is there really no way to fix fw here? Like if process start/teardown
> > takes 100ms, that's going to suck no matter what.
>
> As I said adding the queue is unproblematic and teardown just results in
> a bit more waiting to free things up.
>
> Problematic is more overcommit swapping and OOM situations which need to
> wait for the hw scheduler to come back and tell us that the queue is now
> unmapped.
>
> >>>>> Also, if userspace lies to us and keeps pushing crap into the ring
> >>>>> after it's supposed to be idle: Userspace is already allowed to was=
te
> >>>>> gpu time. If you're too worried about this set a fairly aggressive
> >>>>> preempt timeout on the unload fence, and kill the context if it tak=
es
> >>>>> longer than what preempting an idle ring should take (because that
> >>>>> would indicate broken/evil userspace).
> >>>> I think you have the wrong expectation here. It is perfectly valid a=
nd
> >>>> expected for userspace to keep writing commands into the ring buffer=
.
> >>>>
> >>>> After all when one frame is completed they want to immediately start
> >>>> rendering the next one.
> >>> Sure, for the true userspace direct submit model. But with that you
> don't
> >>> get dma-fence, which means this gpu will not work for 3d accel on any
> >>> current linux desktop.
> >> I'm not sure of that. I've looked a bit into how we could add user
> >> fences to dma_resv objects and that isn't that hard after all.
> > I think as a proof of concept it's fine, but as an actual solution ...
> > pls no. Two reasons:
> > - implicit sync is bad
>
> Well can't disagree with that :) But I think we can't avoid supporting it=
.
>
> > - this doesn't fix anything for explicit sync using dma_fence in terms
> > of sync_file or drm_syncobj.
>
> Exactly.
>
> If we do implicit sync or explicit sync is orthogonal to the problems
> that sync must be made reliable somehow.
>
> So when we sync and timeout the waiter should just continue, but whoever
> failed to signal will be punished.
>
> But since this isn't solved on Windows I don't see how we can solve it
> on Linux either.
>
> > So if we go with the route of papering over this in the kernel, then
> > it'll be a ton more work than just hacking something into dma_resv.
>
> I'm just now prototyping that and at least for the driver parts it
> doesn't look that hard after all.
>
> >>> Which sucks, hence some hybrid model of using the userspace ring and
> >>> kernel augmented submit is needed. Which was my idea.
> >> Yeah, I think when our firmware folks would really remove the kernel
> >> queue and we still don't have
> > Yeah I think kernel queue can be removed. But the price is that you
> > need reasonable fast preempt of idle contexts.
> >
> > I really can't understand how this can take multiple ms, something
> > feels very broken in the design of the fw (since obviously the hw can
> > preempt an idle context to another one pretty fast, or you'd render
> > any multi-client desktop as a slideshow at best).
>
> Well the hardware doesn't preempt and idle context. See you can have a
> number of active ("mapped" in the fw terminology) contexts and idle
> contexts are usually kept active even when they are idle.
>
> So when multi-client desktop switches between context then that is
> rather fast, but when the kernel asks for a context to be unmapped that
> can take rather long.
>
>
> >
> >>>> [SNIP]
> >>>> Can't find that of hand either, but see the amdgpu_noretry module
> option.
> >>>>
> >>>> It basically tells the hardware if retry page faults should be
> supported or
> >>>> not because this whole TLB shutdown thing when they are supported is
> >>>> extremely costly.
> >>> Hm so synchronous tlb shootdown is a lot more costly when you allow
> >>> retrying of page faults?
> >> Partially correct, yes.
> >>
> >> See when you have retry page faults enabled and unmap something you ne=
ed
> >> to make sure that everybody which could have potentially translated th=
at
> >> page and has a TLB is either invalidated or waited until the access is
> >> completed.
> >>
> >> Since every CU could be using a memory location that takes ages to
> >> completed compared to the normal invalidation where you just invalidat=
e
> >> the L1/L2 and are done.
> >>
> >> Additional to that the recovery adds some extra overhead to every memo=
ry
> >> access, so even without a fault you are quite a bit slower if this is
> >> enabled.
> > Well yes it's complicated, and it's even more fun when the tlb
> > invalidate comes in through the IOMMU through ATS.
> >
> > But also if you don't your hw is just broken from a security pov, no
> > page fault handling for you. So it's really not optional.
>
> Yeah, but that is also a known issue. You either have retry faults and
> live with the extra overhead or you disable them and go with the kernel
> based submission approach.
>
> >
> >>> That sounds bad, because for full hmm mode you need to be able to ret=
ry
> >>> pagefaults. Well at least the PASID/ATS/IOMMU side will do that, and
> might just
> >>> hang your gpu for a long time while it's waiting for the va->pa looku=
p
> >>> response to return. So retrying lookups shouldn't be any different
> really.
> >>>
> >>> And you also need fairly fast synchronous tlb shootdown for hmm. So i=
f
> >>> your hw has a problem with both together that sounds bad.
> >> Completely agree. And since it was my job to validate the implementati=
on
> >> on Vega10 I was also the first one to realize that.
> >>
> >> Felix, a couple of others and me are trying to work around those
> >> restrictions ever since.
> >>
> >>> I was more thinking about handling it all in the kernel.
> >>> Yeah can do, just means that you also have to copy the ringbuffer stu=
ff
> >>> over from userspace to the kernel.
> >> That is my least worry. The IBs are just addr+length., so no more than
> >> 16 bytes for each IB.
> > Ah ok, maybe I'm biased from drm/i915 where an ib launch + seqno is
> > rather long, because the hw folks keep piling more workarounds and
> > additional flushes on top. Like on some hw the recommended w/a was to
> > just issue 32 gpu cache flushes or something like that (otherwise the
> > seqno write could arrive before the gpu actually finished flushing)
> > :-/
>
> Well I once had a conversation with a hw engineer which wanted to split
> up the TLB in validations into 1Gib chunks :)
>
> That would have mean we would need to emit 2^17 different invalidation
> requests on the kernel ring buffer....
>
> Christian.
>
>
> >
> > Cheers, Daniel
> >
> >>> It also means that there's more differences in how your userspace wor=
ks
> >>> between full userspace mode (necessary for compute) and legacy
> dma-fence
> >>> mode (necessary for desktop 3d). Which is especially big fun for
> vulkan,
> >>> since that will have to do both.
> >> That is the bigger problem.
> >>
> >> Christian.
> >>
> >>> But then amd is still hanging onto the amdgpu vs amdkfd split, so
> you're
> >>> going for max pain in this area anyway :-P
> >>> -Daniel
> >
>
>

--0000000000007394eb05c1843d99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I see some mentions of XNACK and recoverable page faults.=
 Note that all gaming AMD hw that has userspace queues doesn&#39;t have XNA=
CK, so there is no overhead in compute units. My understanding is that reco=
verable page faults are still supported without XNACK, but instead of the c=
ompute unit replaying the faulting instruction, the L1 cache does that. Any=
way, the point is that XNACK is totally irrelevant here.<div dir=3D"auto"><=
br></div><div dir=3D"auto">Marek</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue., May 4, 2021, 08:48 Christian=
 K=C3=B6nig, &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com">ckoeni=
g.leichtzumerken@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Am 04.05.21 um 13:13 schrieb Daniel Vetter:<br>
&gt; On Tue, May 4, 2021 at 12:53 PM Christian K=C3=B6nig<br>
&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Am 04.05.21 um 11:47 schrieb Daniel Vetter:<br>
&gt;&gt;&gt; [SNIP]<br>
&gt;&gt;&gt;&gt; Yeah, it just takes to long for the preemption to complete=
 to be really<br>
&gt;&gt;&gt;&gt; useful for the feature we are discussing here.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; As I said when the kernel requests to preempt a queue we c=
an easily expect a<br>
&gt;&gt;&gt;&gt; timeout of ~100ms until that comes back. For compute that =
is even in the<br>
&gt;&gt;&gt;&gt; multiple seconds range.<br>
&gt;&gt;&gt; 100ms for preempting an idle request sounds like broken hw to =
me. Of<br>
&gt;&gt;&gt; course preemting something that actually runs takes a while, t=
hat&#39;s<br>
&gt;&gt;&gt; nothing new. But it&#39;s also not the thing we&#39;re talking=
 about here. Is this<br>
&gt;&gt;&gt; 100ms actual numbers from hw for an actual idle ringbuffer?<br=
>
&gt;&gt; Well 100ms is just an example of the scheduler granularity. Let me=
<br>
&gt;&gt; explain in a wider context.<br>
&gt;&gt;<br>
&gt;&gt; The hardware can have X queues mapped at the same time and every Y=
 time<br>
&gt;&gt; interval the hardware scheduler checks if those queues have change=
d and<br>
&gt;&gt; only if they have changed the necessary steps to reload them are s=
tarted.<br>
&gt;&gt;<br>
&gt;&gt; Multiple queues can be rendering at the same time, so you can have=
 X as<br>
&gt;&gt; a high priority queue active and just waiting for a signal to star=
t and<br>
&gt;&gt; the client rendering one frame after another and a third backgroun=
d<br>
&gt;&gt; compute task mining bitcoins for you.<br>
&gt;&gt;<br>
&gt;&gt; As long as everything is static this is perfectly performant. Addi=
ng a<br>
&gt;&gt; queue to the list of active queues is also relatively simple, but =
taking<br>
&gt;&gt; one down requires you to wait until we are sure the hardware has s=
een<br>
&gt;&gt; the change and reloaded the queues.<br>
&gt;&gt;<br>
&gt;&gt; Think of it as an RCU grace period. This is simply not something w=
hich<br>
&gt;&gt; is made to be used constantly, but rather just at process terminat=
ion.<br>
&gt; Uh ... that indeed sounds rather broken.<br>
<br>
Well I wouldn&#39;t call it broken. It&#39;s just not made for the use case=
 we <br>
are trying to abuse it for.<br>
<br>
&gt; Otoh it&#39;s just a dma_fence that&#39;d we&#39;d inject as this unlo=
ad-fence.<br>
<br>
Yeah, exactly that&#39;s why it isn&#39;t much of a problem for process <br=
>
termination or freeing memory.<br>
<br>
&gt; So by and large everyone should already be able to cope with it taking=
 a<br>
&gt; bit longer. So from a design pov I don&#39;t see a huge problem, but I=
<br>
&gt; guess you guys wont be happy since it means on amd hw there will be<br=
>
&gt; random unsightly stalls in desktop linux usage.<br>
&gt;<br>
&gt;&gt;&gt;&gt; The &quot;preemption&quot; feature is really called suspen=
d and made just for the case<br>
&gt;&gt;&gt;&gt; when we want to put a process to sleep or need to forceful=
ly kill it for<br>
&gt;&gt;&gt;&gt; misbehavior or stuff like that. It is not meant to be used=
 in normal<br>
&gt;&gt;&gt;&gt; operation.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; If we only attach it on -&gt;move then yeah maybe a last r=
esort possibility to<br>
&gt;&gt;&gt;&gt; do it this way, but I think in that case we could rather s=
tick with kernel<br>
&gt;&gt;&gt;&gt; submissions.<br>
&gt;&gt;&gt; Well this is a hybrid userspace ring + kernel augmeted submit =
mode, so you<br>
&gt;&gt;&gt; can keep dma-fences working. Because the dma-fence stuff wont =
work with<br>
&gt;&gt;&gt; pure userspace submit, I think that conclusion is rather solid=
. Once more<br>
&gt;&gt;&gt; even after this long thread here.<br>
&gt;&gt; When assisted with unload fences, then yes. Problem is that I can&=
#39;t see<br>
&gt;&gt; how we could implement those performant currently.<br>
&gt; Is there really no way to fix fw here? Like if process start/teardown<=
br>
&gt; takes 100ms, that&#39;s going to suck no matter what.<br>
<br>
As I said adding the queue is unproblematic and teardown just results in <b=
r>
a bit more waiting to free things up.<br>
<br>
Problematic is more overcommit swapping and OOM situations which need to <b=
r>
wait for the hw scheduler to come back and tell us that the queue is now <b=
r>
unmapped.<br>
<br>
&gt;&gt;&gt;&gt;&gt; Also, if userspace lies to us and keeps pushing crap i=
nto the ring<br>
&gt;&gt;&gt;&gt;&gt; after it&#39;s supposed to be idle: Userspace is alrea=
dy allowed to waste<br>
&gt;&gt;&gt;&gt;&gt; gpu time. If you&#39;re too worried about this set a f=
airly aggressive<br>
&gt;&gt;&gt;&gt;&gt; preempt timeout on the unload fence, and kill the cont=
ext if it takes<br>
&gt;&gt;&gt;&gt;&gt; longer than what preempting an idle ring should take (=
because that<br>
&gt;&gt;&gt;&gt;&gt; would indicate broken/evil userspace).<br>
&gt;&gt;&gt;&gt; I think you have the wrong expectation here. It is perfect=
ly valid and<br>
&gt;&gt;&gt;&gt; expected for userspace to keep writing commands into the r=
ing buffer.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; After all when one frame is completed they want to immedia=
tely start<br>
&gt;&gt;&gt;&gt; rendering the next one.<br>
&gt;&gt;&gt; Sure, for the true userspace direct submit model. But with tha=
t you don&#39;t<br>
&gt;&gt;&gt; get dma-fence, which means this gpu will not work for 3d accel=
 on any<br>
&gt;&gt;&gt; current linux desktop.<br>
&gt;&gt; I&#39;m not sure of that. I&#39;ve looked a bit into how we could =
add user<br>
&gt;&gt; fences to dma_resv objects and that isn&#39;t that hard after all.=
<br>
&gt; I think as a proof of concept it&#39;s fine, but as an actual solution=
 ...<br>
&gt; pls no. Two reasons:<br>
&gt; - implicit sync is bad<br>
<br>
Well can&#39;t disagree with that :) But I think we can&#39;t avoid support=
ing it.<br>
<br>
&gt; - this doesn&#39;t fix anything for explicit sync using dma_fence in t=
erms<br>
&gt; of sync_file or drm_syncobj.<br>
<br>
Exactly.<br>
<br>
If we do implicit sync or explicit sync is orthogonal to the problems <br>
that sync must be made reliable somehow.<br>
<br>
So when we sync and timeout the waiter should just continue, but whoever <b=
r>
failed to signal will be punished.<br>
<br>
But since this isn&#39;t solved on Windows I don&#39;t see how we can solve=
 it <br>
on Linux either.<br>
<br>
&gt; So if we go with the route of papering over this in the kernel, then<b=
r>
&gt; it&#39;ll be a ton more work than just hacking something into dma_resv=
.<br>
<br>
I&#39;m just now prototyping that and at least for the driver parts it <br>
doesn&#39;t look that hard after all.<br>
<br>
&gt;&gt;&gt; Which sucks, hence some hybrid model of using the userspace ri=
ng and<br>
&gt;&gt;&gt; kernel augmented submit is needed. Which was my idea.<br>
&gt;&gt; Yeah, I think when our firmware folks would really remove the kern=
el<br>
&gt;&gt; queue and we still don&#39;t have<br>
&gt; Yeah I think kernel queue can be removed. But the price is that you<br=
>
&gt; need reasonable fast preempt of idle contexts.<br>
&gt;<br>
&gt; I really can&#39;t understand how this can take multiple ms, something=
<br>
&gt; feels very broken in the design of the fw (since obviously the hw can<=
br>
&gt; preempt an idle context to another one pretty fast, or you&#39;d rende=
r<br>
&gt; any multi-client desktop as a slideshow at best).<br>
<br>
Well the hardware doesn&#39;t preempt and idle context. See you can have a =
<br>
number of active (&quot;mapped&quot; in the fw terminology) contexts and id=
le <br>
contexts are usually kept active even when they are idle.<br>
<br>
So when multi-client desktop switches between context then that is <br>
rather fast, but when the kernel asks for a context to be unmapped that <br=
>
can take rather long.<br>
<br>
<br>
&gt;<br>
&gt;&gt;&gt;&gt; [SNIP]<br>
&gt;&gt;&gt;&gt; Can&#39;t find that of hand either, but see the amdgpu_nor=
etry module option.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It basically tells the hardware if retry page faults shoul=
d be supported or<br>
&gt;&gt;&gt;&gt; not because this whole TLB shutdown thing when they are su=
pported is<br>
&gt;&gt;&gt;&gt; extremely costly.<br>
&gt;&gt;&gt; Hm so synchronous tlb shootdown is a lot more costly when you =
allow<br>
&gt;&gt;&gt; retrying of page faults?<br>
&gt;&gt; Partially correct, yes.<br>
&gt;&gt;<br>
&gt;&gt; See when you have retry page faults enabled and unmap something yo=
u need<br>
&gt;&gt; to make sure that everybody which could have potentially translate=
d that<br>
&gt;&gt; page and has a TLB is either invalidated or waited until the acces=
s is<br>
&gt;&gt; completed.<br>
&gt;&gt;<br>
&gt;&gt; Since every CU could be using a memory location that takes ages to=
<br>
&gt;&gt; completed compared to the normal invalidation where you just inval=
idate<br>
&gt;&gt; the L1/L2 and are done.<br>
&gt;&gt;<br>
&gt;&gt; Additional to that the recovery adds some extra overhead to every =
memory<br>
&gt;&gt; access, so even without a fault you are quite a bit slower if this=
 is<br>
&gt;&gt; enabled.<br>
&gt; Well yes it&#39;s complicated, and it&#39;s even more fun when the tlb=
<br>
&gt; invalidate comes in through the IOMMU through ATS.<br>
&gt;<br>
&gt; But also if you don&#39;t your hw is just broken from a security pov, =
no<br>
&gt; page fault handling for you. So it&#39;s really not optional.<br>
<br>
Yeah, but that is also a known issue. You either have retry faults and <br>
live with the extra overhead or you disable them and go with the kernel <br=
>
based submission approach.<br>
<br>
&gt;<br>
&gt;&gt;&gt; That sounds bad, because for full hmm mode you need to be able=
 to retry<br>
&gt;&gt;&gt; pagefaults. Well at least the PASID/ATS/IOMMU side will do tha=
t, and might just<br>
&gt;&gt;&gt; hang your gpu for a long time while it&#39;s waiting for the v=
a-&gt;pa lookup<br>
&gt;&gt;&gt; response to return. So retrying lookups shouldn&#39;t be any d=
ifferent really.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; And you also need fairly fast synchronous tlb shootdown for hm=
m. So if<br>
&gt;&gt;&gt; your hw has a problem with both together that sounds bad.<br>
&gt;&gt; Completely agree. And since it was my job to validate the implemen=
tation<br>
&gt;&gt; on Vega10 I was also the first one to realize that.<br>
&gt;&gt;<br>
&gt;&gt; Felix, a couple of others and me are trying to work around those<b=
r>
&gt;&gt; restrictions ever since.<br>
&gt;&gt;<br>
&gt;&gt;&gt; I was more thinking about handling it all in the kernel.<br>
&gt;&gt;&gt; Yeah can do, just means that you also have to copy the ringbuf=
fer stuff<br>
&gt;&gt;&gt; over from userspace to the kernel.<br>
&gt;&gt; That is my least worry. The IBs are just addr+length., so no more =
than<br>
&gt;&gt; 16 bytes for each IB.<br>
&gt; Ah ok, maybe I&#39;m biased from drm/i915 where an ib launch + seqno i=
s<br>
&gt; rather long, because the hw folks keep piling more workarounds and<br>
&gt; additional flushes on top. Like on some hw the recommended w/a was to<=
br>
&gt; just issue 32 gpu cache flushes or something like that (otherwise the<=
br>
&gt; seqno write could arrive before the gpu actually finished flushing)<br=
>
&gt; :-/<br>
<br>
Well I once had a conversation with a hw engineer which wanted to split <br=
>
up the TLB in validations into 1Gib chunks :)<br>
<br>
That would have mean we would need to emit 2^17 different invalidation <br>
requests on the kernel ring buffer....<br>
<br>
Christian.<br>
<br>
<br>
&gt;<br>
&gt; Cheers, Daniel<br>
&gt;<br>
&gt;&gt;&gt; It also means that there&#39;s more differences in how your us=
erspace works<br>
&gt;&gt;&gt; between full userspace mode (necessary for compute) and legacy=
 dma-fence<br>
&gt;&gt;&gt; mode (necessary for desktop 3d). Which is especially big fun f=
or vulkan,<br>
&gt;&gt;&gt; since that will have to do both.<br>
&gt;&gt; That is the bigger problem.<br>
&gt;&gt;<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt; But then amd is still hanging onto the amdgpu vs amdkfd split,=
 so you&#39;re<br>
&gt;&gt;&gt; going for max pain in this area anyway :-P<br>
&gt;&gt;&gt; -Daniel<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000007394eb05c1843d99--

--===============1718242824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1718242824==--
