Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E536C6FC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 15:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9546E2A3;
	Tue, 27 Apr 2021 13:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D196E2A3;
 Tue, 27 Apr 2021 13:27:02 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id y32so42312597pga.11;
 Tue, 27 Apr 2021 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOMh8tFIpYKwtcKcrkCp7JMBO9a463noYM7WSP4UC+o=;
 b=mZ89QEdwUjzC5nkZy6LnqsjpTOow/rTl7iND1K+0H102FcwFqn5RpKur94EqWReFXv
 jCRY3b5vyDuHjYGaMNlAEdmBb4aXFdFzdikpRGMkO3sfUp4RguDIFstxwS/yXVVqdvg/
 Ix2oCfEjzNA0ljBOCfkv1qnannfS6B1PXE96xkp9ZPRmpWD7iVyVuifFyXGMJsM0ZCwA
 uJ67/5ex5E3qR+9ZHuW34zFPV6s6SmAkI0zryoDuIWKhFK/cQH4Ck77ItdbUzNmcIUx4
 izoWIeNB+frBa0wdbWJOVPPh346v909Uf+WVblDDOon3HUFhFh4y1TZyzgFhKnUCqJMq
 jNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOMh8tFIpYKwtcKcrkCp7JMBO9a463noYM7WSP4UC+o=;
 b=FDDdrQeisdjV8+4FJmy/utxMmOeO0U5kAsUZ5PJl7lHczUUyW5/2aqRPjvwyvvLPfF
 8kDew/jQRqr8oHF4ZYw1ewL2AxxHMObaktZZYHJtLNe3s2R7S9LPeX7CCrZQMdF40XOt
 OfMg3BBbELSi+Dfni23O7nZKaJjohXQtJ+zifwaqGENZjgnX490PiA2nDkvtVKmko2EM
 aMrm3oA1ucLTNWVZoN3oEONEGa+EhbNXLmjnQ+nR3FwYUa3SAQvEbebwKQceIsG0C3YA
 OH14hGJG2APNWT6yIczHAbHVxq/NObIOYXVbNXzUoOLzhiyEZTvgIsvqGK/4FLfmuoNO
 eJAw==
X-Gm-Message-State: AOAM533hVFbHfyrDhKQ6TJnilgWHzd3glfdJNEvjgqRqyurCNqyA+1Dt
 PmAhrKp3Dk45DT/mylctEkjkbtc+LS7VFIgiTqOBPuY9bxU=
X-Google-Smtp-Source: ABdhPJxM86vpDRJ8PfayxgAHkTMKGal0/e3ytOdK7Gsl+CG92x8ed/a8tjBjmMtyJJSFVB3i3Hgpt35V9nyIBC5cBjo=
X-Received: by 2002:a63:7842:: with SMTP id t63mr22167667pgc.233.1619530022095; 
 Tue, 27 Apr 2021 06:27:02 -0700 (PDT)
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
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
In-Reply-To: <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 27 Apr 2021 09:26:49 -0400
Message-ID: <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0133694554=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0133694554==
Content-Type: multipart/alternative; boundary="000000000000ab8fec05c0f43747"

--000000000000ab8fec05c0f43747
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok. So that would only make the following use cases broken for now:
- amd render -> external gpu
- amd video encode -> network device

What about the case when we get a buffer from an external device and we're
supposed to make it "busy" when we are using it, and the external device
wants to wait until we stop using it? Is it something that can happen, thus
turning "external -> amd" into "external <-> amd"?

Marek

On Tue., Apr. 27, 2021, 08:50 Christian K=C3=B6nig, <
ckoenig.leichtzumerken@gmail.com> wrote:

> Only amd -> external.
>
> We can easily install something in an user queue which waits for a
> dma_fence in the kernel.
>
> But we can't easily wait for an user queue as dependency of a dma_fence.
>
> The good thing is we have this wait before signal case on Vulkan timeline
> semaphores which have the same problem in the kernel.
>
> The good news is I think we can relatively easily convert i915 and older
> amdgpu device to something which is compatible with user fences.
>
> So yes, getting that fixed case by case should work.
>
> Christian
>
> Am 27.04.21 um 14:46 schrieb Marek Ol=C5=A1=C3=A1k:
>
> I'll defer to Christian and Alex to decide whether dropping sync with
> non-amd devices (GPUs, cameras etc.) is acceptable.
>
> Rewriting those drivers to this new sync model could be done on a case by
> case basis.
>
> For now, would we only lose the "amd -> external" dependency? Or the
> "external -> amd" dependency too?
>
> Marek
>
> On Tue., Apr. 27, 2021, 08:15 Daniel Vetter, <daniel@ffwll.ch> wrote:
>
>> On Tue, Apr 27, 2021 at 2:11 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com>=
 wrote:
>> > Ok. I'll interpret this as "yes, it will work, let's do it".
>>
>> It works if all you care about is drm/amdgpu. I'm not sure that's a
>> reasonable approach for upstream, but it definitely is an approach :-)
>>
>> We've already gone somewhat through the pain of drm/amdgpu redefining
>> how implicit sync works without sufficiently talking with other
>> people, maybe we should avoid a repeat of this ...
>> -Daniel
>>
>> >
>> > Marek
>> >
>> > On Tue., Apr. 27, 2021, 08:06 Christian K=C3=B6nig, <
>> ckoenig.leichtzumerken@gmail.com> wrote:
>> >>
>> >> Correct, we wouldn't have synchronization between device with and
>> without user queues any more.
>> >>
>> >> That could only be a problem for A+I Laptops.
>> >>
>> >> Memory management will just work with preemption fences which pause
>> the user queues of a process before evicting something. That will be a
>> dma_fence, but also a well known approach.
>> >>
>> >> Christian.
>> >>
>> >> Am 27.04.21 um 13:49 schrieb Marek Ol=C5=A1=C3=A1k:
>> >>
>> >> If we don't use future fences for DMA fences at all, e.g. we don't us=
e
>> them for memory management, it can work, right? Memory management can
>> suspend user queues anytime. It doesn't need to use DMA fences. There mi=
ght
>> be something that I'm missing here.
>> >>
>> >> What would we lose without DMA fences? Just inter-device
>> synchronization? I think that might be acceptable.
>> >>
>> >> The only case when the kernel will wait on a future fence is before a
>> page flip. Everything today already depends on userspace not hanging the
>> gpu, which makes everything a future fence.
>> >>
>> >> Marek
>> >>
>> >> On Tue., Apr. 27, 2021, 04:02 Daniel Vetter, <daniel@ffwll.ch> wrote:
>> >>>
>> >>> On Mon, Apr 26, 2021 at 04:59:28PM -0400, Marek Ol=C5=A1=C3=A1k wrot=
e:
>> >>> > Thanks everybody. The initial proposal is dead. Here are some
>> thoughts on
>> >>> > how to do it differently.
>> >>> >
>> >>> > I think we can have direct command submission from userspace via
>> >>> > memory-mapped queues ("user queues") without changing window
>> systems.
>> >>> >
>> >>> > The memory management doesn't have to use GPU page faults like HMM=
.
>> >>> > Instead, it can wait for user queues of a specific process to go
>> idle and
>> >>> > then unmap the queues, so that userspace can't submit anything.
>> Buffer
>> >>> > evictions, pinning, etc. can be executed when all queues are
>> unmapped
>> >>> > (suspended). Thus, no BO fences and page faults are needed.
>> >>> >
>> >>> > Inter-process synchronization can use timeline semaphores.
>> Userspace will
>> >>> > query the wait and signal value for a shared buffer from the
>> kernel. The
>> >>> > kernel will keep a history of those queries to know which process =
is
>> >>> > responsible for signalling which buffer. There is only the
>> wait-timeout
>> >>> > issue and how to identify the culprit. One of the solutions is to
>> have the
>> >>> > GPU send all GPU signal commands and all timed out wait commands
>> via an
>> >>> > interrupt to the kernel driver to monitor and validate userspace
>> behavior.
>> >>> > With that, it can be identified whether the culprit is the waiting
>> process
>> >>> > or the signalling process and which one. Invalid signal/wait
>> parameters can
>> >>> > also be detected. The kernel can force-signal only the semaphores
>> that time
>> >>> > out, and punish the processes which caused the timeout or used
>> invalid
>> >>> > signal/wait parameters.
>> >>> >
>> >>> > The question is whether this synchronization solution is robust
>> enough for
>> >>> > dma_fence and whatever the kernel and window systems need.
>> >>>
>> >>> The proper model here is the preempt-ctx dma_fence that amdkfd uses
>> >>> (without page faults). That means dma_fence for synchronization is
>> doa, at
>> >>> least as-is, and we're back to figuring out the winsys problem.
>> >>>
>> >>> "We'll solve it with timeouts" is very tempting, but doesn't work.
>> It's
>> >>> akin to saying that we're solving deadlock issues in a locking desig=
n
>> by
>> >>> doing a global s/mutex_lock/mutex_lock_timeout/ in the kernel. Sure =
it
>> >>> avoids having to reach the reset button, but that's about it.
>> >>>
>> >>> And the fundamental problem is that once you throw in userspace
>> command
>> >>> submission (and syncing, at least within the userspace driver,
>> otherwise
>> >>> there's kinda no point if you still need the kernel for cross-engine
>> sync)
>> >>> means you get deadlocks if you still use dma_fence for sync under
>> >>> perfectly legit use-case. We've discussed that one ad nauseam last
>> summer:
>> >>>
>> >>>
>> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=
=3Ddma_fence#indefinite-dma-fences
>> >>>
>> >>> See silly diagramm at the bottom.
>> >>>
>> >>> Now I think all isn't lost, because imo the first step to getting to
>> this
>> >>> brave new world is rebuilding the driver on top of userspace fences,
>> and
>> >>> with the adjusted cmd submit model. You probably don't want to use
>> amdkfd,
>> >>> but port that as a context flag or similar to render nodes for gl/vk=
.
>> Of
>> >>> course that means you can only use this mode in headless, without
>> >>> glx/wayland winsys support, but it's a start.
>> >>> -Daniel
>> >>>
>> >>> >
>> >>> > Marek
>> >>> >
>> >>> > On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone <daniel@fooishbar.org=
>
>> wrote:
>> >>> >
>> >>> > > Hi,
>> >>> > >
>> >>> > > On Tue, 20 Apr 2021 at 20:30, Daniel Vetter <daniel@ffwll.ch>
>> wrote:
>> >>> > >
>> >>> > >> The thing is, you can't do this in drm/scheduler. At least not
>> without
>> >>> > >> splitting up the dma_fence in the kernel into separate memory
>> fences
>> >>> > >> and sync fences
>> >>> > >
>> >>> > >
>> >>> > > I'm starting to think this thread needs its own glossary ...
>> >>> > >
>> >>> > > I propose we use 'residency fence' for execution fences which
>> enact
>> >>> > > memory-residency operations, e.g. faulting in a page ultimately
>> depending
>> >>> > > on GPU work retiring.
>> >>> > >
>> >>> > > And 'value fence' for the pure-userspace model suggested by
>> timeline
>> >>> > > semaphores, i.e. fences being (*addr =3D=3D val) rather than bei=
ng
>> able to look
>> >>> > > at ctx seqno.
>> >>> > >
>> >>> > > Cheers,
>> >>> > > Daniel
>> >>> > > _______________________________________________
>> >>> > > mesa-dev mailing list
>> >>> > > mesa-dev@lists.freedesktop.org
>> >>> > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>> >>> > >
>> >>>
>> >>> --
>> >>> Daniel Vetter
>> >>> Software Engineer, Intel Corporation
>> >>> http://blog.ffwll.ch
>> >>
>> >>
>> >> _______________________________________________
>> >> mesa-dev mailing list
>> >> mesa-dev@lists.freedesktop.org
>> >> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>> >>
>> >>
>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>>
>
>

--000000000000ab8fec05c0f43747
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok. So that would only make the following use cases broke=
n for now:<div dir=3D"auto">- amd render -&gt; external gpu</div><div dir=
=3D"auto">- amd video encode -&gt; network device</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">What about the case when we get a buffer from an =
external device and we&#39;re supposed to make it &quot;busy&quot; when we =
are using it, and the external device wants to wait until we stop using it?=
 Is it something that can happen, thus turning &quot;external -&gt; amd&quo=
t; into &quot;external &lt;-&gt; amd&quot;?</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Marek</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue., Apr. 27, 2021, 08:50 Christian K=C3=
=B6nig, &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com">ckoenig.lei=
chtzumerken@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
 =20
   =20
 =20
  <div>
    Only amd -&gt; external.<br>
    <br>
    We can easily install something in an user queue which waits for a
    dma_fence in the kernel.<br>
    <br>
    But we can&#39;t easily wait for an user queue as dependency of a
    dma_fence.<br>
    <br>
    The good thing is we have this wait before signal case on Vulkan
    timeline semaphores which have the same problem in the kernel.<br>
    <br>
    The good news is I think we can relatively easily convert i915 and
    older amdgpu device to something which is compatible with user
    fences.<br>
    <br>
    So yes, getting that fixed case by case should work.<br>
    <br>
    Christian<br>
    <br>
    <div>Am 27.04.21 um 14:46 schrieb Marek
      Ol=C5=A1=C3=A1k:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">
        <div>I&#39;ll defer to Christian and Alex to decide whether droppin=
g
          sync with non-amd devices (GPUs, cameras etc.) is acceptable.</di=
v>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Rewriting those drivers to this new sync model
          could be done on a case by case basis.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">For now, would we only lose the &quot;amd -&gt;
          external&quot; dependency? Or the &quot;external -&gt; amd&quot; =
dependency
          too?</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Marek</div>
        <div dir=3D"auto"><br>
          <div class=3D"gmail_quote" dir=3D"auto">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue., Apr. 27, 2021,
              08:15 Daniel Vetter, &lt;<a href=3D"mailto:daniel@ffwll.ch" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">daniel@ffwll.ch</=
a>&gt; wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Tue,
              Apr 27, 2021 at 2:11 PM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"=
mailto:maraeo@gmail.com" rel=3D"noreferrer
                noreferrer noreferrer noreferrer" target=3D"_blank">maraeo@=
gmail.com</a>&gt; wrote:<br>
              &gt; Ok. I&#39;ll interpret this as &quot;yes, it will work, =
let&#39;s
              do it&quot;.<br>
              <br>
              It works if all you care about is drm/amdgpu. I&#39;m not sur=
e
              that&#39;s a<br>
              reasonable approach for upstream, but it definitely is an
              approach :-)<br>
              <br>
              We&#39;ve already gone somewhat through the pain of drm/amdgp=
u
              redefining<br>
              how implicit sync works without sufficiently talking with
              other<br>
              people, maybe we should avoid a repeat of this ...<br>
              -Daniel<br>
              <br>
              &gt;<br>
              &gt; Marek<br>
              &gt;<br>
              &gt; On Tue., Apr. 27, 2021, 08:06 Christian K=C3=B6nig, &lt;=
<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" rel=3D"noreferrer noref=
errer noreferrer noreferrer" target=3D"_blank">ckoenig.leichtzumerken@gmail=
.com</a>&gt;
              wrote:<br>
              &gt;&gt;<br>
              &gt;&gt; Correct, we wouldn&#39;t have synchronization betwee=
n
              device with and without user queues any more.<br>
              &gt;&gt;<br>
              &gt;&gt; That could only be a problem for A+I Laptops.<br>
              &gt;&gt;<br>
              &gt;&gt; Memory management will just work with preemption
              fences which pause the user queues of a process before
              evicting something. That will be a dma_fence, but also a
              well known approach.<br>
              &gt;&gt;<br>
              &gt;&gt; Christian.<br>
              &gt;&gt;<br>
              &gt;&gt; Am 27.04.21 um 13:49 schrieb Marek Ol=C5=A1=C3=A1k:<=
br>
              &gt;&gt;<br>
              &gt;&gt; If we don&#39;t use future fences for DMA fences at
              all, e.g. we don&#39;t use them for memory management, it can
              work, right? Memory management can suspend user queues
              anytime. It doesn&#39;t need to use DMA fences. There might b=
e
              something that I&#39;m missing here.<br>
              &gt;&gt;<br>
              &gt;&gt; What would we lose without DMA fences? Just
              inter-device synchronization? I think that might be
              acceptable.<br>
              &gt;&gt;<br>
              &gt;&gt; The only case when the kernel will wait on a
              future fence is before a page flip. Everything today
              already depends on userspace not hanging the gpu, which
              makes everything a future fence.<br>
              &gt;&gt;<br>
              &gt;&gt; Marek<br>
              &gt;&gt;<br>
              &gt;&gt; On Tue., Apr. 27, 2021, 04:02 Daniel Vetter, &lt;<a =
href=3D"mailto:daniel@ffwll.ch" rel=3D"noreferrer noreferrer
                noreferrer noreferrer" target=3D"_blank">daniel@ffwll.ch</a=
>&gt;
              wrote:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; On Mon, Apr 26, 2021 at 04:59:28PM -0400,
              Marek Ol=C5=A1=C3=A1k wrote:<br>
              &gt;&gt;&gt; &gt; Thanks everybody. The initial proposal
              is dead. Here are some thoughts on<br>
              &gt;&gt;&gt; &gt; how to do it differently.<br>
              &gt;&gt;&gt; &gt;<br>
              &gt;&gt;&gt; &gt; I think we can have direct command
              submission from userspace via<br>
              &gt;&gt;&gt; &gt; memory-mapped queues (&quot;user queues&quo=
t;)
              without changing window systems.<br>
              &gt;&gt;&gt; &gt;<br>
              &gt;&gt;&gt; &gt; The memory management doesn&#39;t have to
              use GPU page faults like HMM.<br>
              &gt;&gt;&gt; &gt; Instead, it can wait for user queues of
              a specific process to go idle and<br>
              &gt;&gt;&gt; &gt; then unmap the queues, so that userspace
              can&#39;t submit anything. Buffer<br>
              &gt;&gt;&gt; &gt; evictions, pinning, etc. can be executed
              when all queues are unmapped<br>
              &gt;&gt;&gt; &gt; (suspended). Thus, no BO fences and page
              faults are needed.<br>
              &gt;&gt;&gt; &gt;<br>
              &gt;&gt;&gt; &gt; Inter-process synchronization can use
              timeline semaphores. Userspace will<br>
              &gt;&gt;&gt; &gt; query the wait and signal value for a
              shared buffer from the kernel. The<br>
              &gt;&gt;&gt; &gt; kernel will keep a history of those
              queries to know which process is<br>
              &gt;&gt;&gt; &gt; responsible for signalling which buffer.
              There is only the wait-timeout<br>
              &gt;&gt;&gt; &gt; issue and how to identify the culprit.
              One of the solutions is to have the<br>
              &gt;&gt;&gt; &gt; GPU send all GPU signal commands and all
              timed out wait commands via an<br>
              &gt;&gt;&gt; &gt; interrupt to the kernel driver to
              monitor and validate userspace behavior.<br>
              &gt;&gt;&gt; &gt; With that, it can be identified whether
              the culprit is the waiting process<br>
              &gt;&gt;&gt; &gt; or the signalling process and which one.
              Invalid signal/wait parameters can<br>
              &gt;&gt;&gt; &gt; also be detected. The kernel can
              force-signal only the semaphores that time<br>
              &gt;&gt;&gt; &gt; out, and punish the processes which
              caused the timeout or used invalid<br>
              &gt;&gt;&gt; &gt; signal/wait parameters.<br>
              &gt;&gt;&gt; &gt;<br>
              &gt;&gt;&gt; &gt; The question is whether this
              synchronization solution is robust enough for<br>
              &gt;&gt;&gt; &gt; dma_fence and whatever the kernel and
              window systems need.<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; The proper model here is the preempt-ctx
              dma_fence that amdkfd uses<br>
              &gt;&gt;&gt; (without page faults). That means dma_fence
              for synchronization is doa, at<br>
              &gt;&gt;&gt; least as-is, and we&#39;re back to figuring out
              the winsys problem.<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; &quot;We&#39;ll solve it with timeouts&quot; is =
very
              tempting, but doesn&#39;t work. It&#39;s<br>
              &gt;&gt;&gt; akin to saying that we&#39;re solving deadlock
              issues in a locking design by<br>
              &gt;&gt;&gt; doing a global
              s/mutex_lock/mutex_lock_timeout/ in the kernel. Sure it<br>
              &gt;&gt;&gt; avoids having to reach the reset button, but
              that&#39;s about it.<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; And the fundamental problem is that once you
              throw in userspace command<br>
              &gt;&gt;&gt; submission (and syncing, at least within the
              userspace driver, otherwise<br>
              &gt;&gt;&gt; there&#39;s kinda no point if you still need the
              kernel for cross-engine sync)<br>
              &gt;&gt;&gt; means you get deadlocks if you still use
              dma_fence for sync under<br>
              &gt;&gt;&gt; perfectly legit use-case. We&#39;ve discussed
              that one ad nauseam last summer:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; <a href=3D"https://dri.freedesktop.org/docs/drm/=
driver-api/dma-buf.html?highlight=3Ddma_fence#indefinite-dma-fences" rel=3D=
"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=3Ddm=
a_fence#indefinite-dma-fences</a><br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; See silly diagramm at the bottom.<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; Now I think all isn&#39;t lost, because imo the
              first step to getting to this<br>
              &gt;&gt;&gt; brave new world is rebuilding the driver on
              top of userspace fences, and<br>
              &gt;&gt;&gt; with the adjusted cmd submit model. You
              probably don&#39;t want to use amdkfd,<br>
              &gt;&gt;&gt; but port that as a context flag or similar to
              render nodes for gl/vk. Of<br>
              &gt;&gt;&gt; course that means you can only use this mode
              in headless, without<br>
              &gt;&gt;&gt; glx/wayland winsys support, but it&#39;s a start=
.<br>
              &gt;&gt;&gt; -Daniel<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; &gt;<br>
              &gt;&gt;&gt; &gt; Marek<br>
              &gt;&gt;&gt; &gt;<br>
              &gt;&gt;&gt; &gt; On Tue, Apr 20, 2021 at 4:34 PM Daniel
              Stone &lt;<a href=3D"mailto:daniel@fooishbar.org" rel=3D"nore=
ferrer noreferrer noreferrer noreferrer" target=3D"_blank">daniel@fooishbar=
.org</a>&gt;
              wrote:<br>
              &gt;&gt;&gt; &gt;<br>
              &gt;&gt;&gt; &gt; &gt; Hi,<br>
              &gt;&gt;&gt; &gt; &gt;<br>
              &gt;&gt;&gt; &gt; &gt; On Tue, 20 Apr 2021 at 20:30,
              Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer" target=3D"_blank">daniel@ffwll.=
ch</a>&gt; wrote:<br>
              &gt;&gt;&gt; &gt; &gt;<br>
              &gt;&gt;&gt; &gt; &gt;&gt; The thing is, you can&#39;t do thi=
s
              in drm/scheduler. At least not without<br>
              &gt;&gt;&gt; &gt; &gt;&gt; splitting up the dma_fence in
              the kernel into separate memory fences<br>
              &gt;&gt;&gt; &gt; &gt;&gt; and sync fences<br>
              &gt;&gt;&gt; &gt; &gt;<br>
              &gt;&gt;&gt; &gt; &gt;<br>
              &gt;&gt;&gt; &gt; &gt; I&#39;m starting to think this thread
              needs its own glossary ...<br>
              &gt;&gt;&gt; &gt; &gt;<br>
              &gt;&gt;&gt; &gt; &gt; I propose we use &#39;residency fence&=
#39;
              for execution fences which enact<br>
              &gt;&gt;&gt; &gt; &gt; memory-residency operations, e.g.
              faulting in a page ultimately depending<br>
              &gt;&gt;&gt; &gt; &gt; on GPU work retiring.<br>
              &gt;&gt;&gt; &gt; &gt;<br>
              &gt;&gt;&gt; &gt; &gt; And &#39;value fence&#39; for the
              pure-userspace model suggested by timeline<br>
              &gt;&gt;&gt; &gt; &gt; semaphores, i.e. fences being
              (*addr =3D=3D val) rather than being able to look<br>
              &gt;&gt;&gt; &gt; &gt; at ctx seqno.<br>
              &gt;&gt;&gt; &gt; &gt;<br>
              &gt;&gt;&gt; &gt; &gt; Cheers,<br>
              &gt;&gt;&gt; &gt; &gt; Daniel<br>
              &gt;&gt;&gt; &gt; &gt;
              _______________________________________________<br>
              &gt;&gt;&gt; &gt; &gt; mesa-dev mailing list<br>
              &gt;&gt;&gt; &gt; &gt; <a href=3D"mailto:mesa-dev@lists.freed=
esktop.org" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_=
blank">mesa-dev@lists.freedesktop.org</a><br>
              &gt;&gt;&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.o=
rg/mailman/listinfo/mesa-dev" rel=3D"noreferrer noreferrer noreferrer noref=
errer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/mesa-dev</a><br>
              &gt;&gt;&gt; &gt; &gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; --<br>
              &gt;&gt;&gt; Daniel Vetter<br>
              &gt;&gt;&gt; Software Engineer, Intel Corporation<br>
              &gt;&gt;&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferr=
er noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">http://bl=
og.ffwll.ch</a><br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; _______________________________________________<br>
              &gt;&gt; mesa-dev mailing list<br>
              &gt;&gt; <a href=3D"mailto:mesa-dev@lists.freedesktop.org" re=
l=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">mesa-de=
v@lists.freedesktop.org</a><br>
              &gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/lis=
tinfo/mesa-dev" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferr=
er" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo/mesa-d=
ev</a><br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              <br>
              <br>
              -- <br>
              Daniel Vetter<br>
              Software Engineer, Intel Corporation<br>
              <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer
                noreferrer noreferrer noreferrer" target=3D"_blank">http://=
blog.ffwll.ch</a><br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000ab8fec05c0f43747--

--===============0133694554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0133694554==--
