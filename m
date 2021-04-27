Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797EC36C5D6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49766E954;
	Tue, 27 Apr 2021 12:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0596E951;
 Tue, 27 Apr 2021 12:11:16 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id b17so5173300pgh.7;
 Tue, 27 Apr 2021 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pd2+UwZciI1tc56csC8GjjoarfQrD1jhX4kXCp39fKk=;
 b=hbmulHUwt07NPBPRJAwuEBQq6mhayTArmjGi21BffdCJ/q/kJ3jyjqMzmPirmSbh8f
 JZvJRj6GX2NaAKGqEJLbQj+pv8vcDJCqtwdIpqwp1oAHhYzzj94yuHlqk0oZNSupFn1b
 GBr98scVbnGBgowOgqFEgR8G8k5dQnQ0EkIhZfz9+buSSBQJJ4Q5I36nmq1mDvEsDIhV
 tbAOEI3Q3AfEu0VEzJodlBizlFul4OgdlkcwgJnUu7IGibWmOEHvd6r7+PEo8r4UjoaE
 +Jj9GB9Z61/z1OefNMF9Mje5L8QbuOk+OtHtIcKo65dVRoDLh92lwGZ8RGP56OY/Ud6z
 1JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pd2+UwZciI1tc56csC8GjjoarfQrD1jhX4kXCp39fKk=;
 b=Xr8gJKvQL693VmzSBuCfdX6zC/SOwdYU5efAnZXcLZNRuLRE/g8vpLOcQYP19AE2lb
 5ECli5wEzMbjKRzuwXQNrSduvqXqGaoQgtm24xyUWX+DBdO900UQG7CRwn+boqeI82II
 qXmlJR2v30e5sHHOvbSeZS5vHH4/H4dJlTSDIcUP2+b3AMG1GMTYp+383lg5sBZyVFNT
 SpcAOvgodPx2ync3WCIPqXIUFCjdRyPGwKOjdfLDjKSkBKXiD96zMrVcMsHamdERn41E
 2ERA1SRjO0pwTtgo7jowFjK70ZM05RusJLgOeg52i1YxS91Ns2V/QvaPngjRBxQP5t+9
 cT+g==
X-Gm-Message-State: AOAM531UGDFTKXas9w8XbQuApPeK0LGjaxsCe+hjfXrkSqkDEji/Ksap
 6rOYwPkYT3bNUZKIdbxGsEgiasUZIQrcdoKcKfI=
X-Google-Smtp-Source: ABdhPJwINdq7aAdYEqMya0/GoL3/LZrHyyeEOmA+1ANzEbo+zZUVFT4hZeS8gHXSP7IiF/Wvxm9UsGfjGmHxVPkIhN4=
X-Received: by 2002:a62:b412:0:b029:21f:6b06:7bdd with SMTP id
 h18-20020a62b4120000b029021f6b067bddmr22517650pfn.51.1619525475820; Tue, 27
 Apr 2021 05:11:15 -0700 (PDT)
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
In-Reply-To: <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 27 Apr 2021 08:11:02 -0400
Message-ID: <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1622784382=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1622784382==
Content-Type: multipart/alternative; boundary="000000000000b0e7a605c0f3282f"

--000000000000b0e7a605c0f3282f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok. I'll interpret this as "yes, it will work, let's do it".

Marek

On Tue., Apr. 27, 2021, 08:06 Christian K=C3=B6nig, <
ckoenig.leichtzumerken@gmail.com> wrote:

> Correct, we wouldn't have synchronization between device with and without
> user queues any more.
>
> That could only be a problem for A+I Laptops.
>
> Memory management will just work with preemption fences which pause the
> user queues of a process before evicting something. That will be a
> dma_fence, but also a well known approach.
>
> Christian.
>
> Am 27.04.21 um 13:49 schrieb Marek Ol=C5=A1=C3=A1k:
>
> If we don't use future fences for DMA fences at all, e.g. we don't use
> them for memory management, it can work, right? Memory management can
> suspend user queues anytime. It doesn't need to use DMA fences. There mig=
ht
> be something that I'm missing here.
>
> What would we lose without DMA fences? Just inter-device synchronization?
> I think that might be acceptable.
>
> The only case when the kernel will wait on a future fence is before a pag=
e
> flip. Everything today already depends on userspace not hanging the gpu,
> which makes everything a future fence.
>
> Marek
>
> On Tue., Apr. 27, 2021, 04:02 Daniel Vetter, <daniel@ffwll.ch> wrote:
>
>> On Mon, Apr 26, 2021 at 04:59:28PM -0400, Marek Ol=C5=A1=C3=A1k wrote:
>> > Thanks everybody. The initial proposal is dead. Here are some thoughts
>> on
>> > how to do it differently.
>> >
>> > I think we can have direct command submission from userspace via
>> > memory-mapped queues ("user queues") without changing window systems.
>> >
>> > The memory management doesn't have to use GPU page faults like HMM.
>> > Instead, it can wait for user queues of a specific process to go idle
>> and
>> > then unmap the queues, so that userspace can't submit anything. Buffer
>> > evictions, pinning, etc. can be executed when all queues are unmapped
>> > (suspended). Thus, no BO fences and page faults are needed.
>> >
>> > Inter-process synchronization can use timeline semaphores. Userspace
>> will
>> > query the wait and signal value for a shared buffer from the kernel. T=
he
>> > kernel will keep a history of those queries to know which process is
>> > responsible for signalling which buffer. There is only the wait-timeou=
t
>> > issue and how to identify the culprit. One of the solutions is to have
>> the
>> > GPU send all GPU signal commands and all timed out wait commands via a=
n
>> > interrupt to the kernel driver to monitor and validate userspace
>> behavior.
>> > With that, it can be identified whether the culprit is the waiting
>> process
>> > or the signalling process and which one. Invalid signal/wait parameter=
s
>> can
>> > also be detected. The kernel can force-signal only the semaphores that
>> time
>> > out, and punish the processes which caused the timeout or used invalid
>> > signal/wait parameters.
>> >
>> > The question is whether this synchronization solution is robust enough
>> for
>> > dma_fence and whatever the kernel and window systems need.
>>
>> The proper model here is the preempt-ctx dma_fence that amdkfd uses
>> (without page faults). That means dma_fence for synchronization is doa, =
at
>> least as-is, and we're back to figuring out the winsys problem.
>>
>> "We'll solve it with timeouts" is very tempting, but doesn't work. It's
>> akin to saying that we're solving deadlock issues in a locking design by
>> doing a global s/mutex_lock/mutex_lock_timeout/ in the kernel. Sure it
>> avoids having to reach the reset button, but that's about it.
>>
>> And the fundamental problem is that once you throw in userspace command
>> submission (and syncing, at least within the userspace driver, otherwise
>> there's kinda no point if you still need the kernel for cross-engine syn=
c)
>> means you get deadlocks if you still use dma_fence for sync under
>> perfectly legit use-case. We've discussed that one ad nauseam last summe=
r:
>>
>>
>> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=
=3Ddma_fence#indefinite-dma-fences
>>
>> See silly diagramm at the bottom.
>>
>> Now I think all isn't lost, because imo the first step to getting to thi=
s
>> brave new world is rebuilding the driver on top of userspace fences, and
>> with the adjusted cmd submit model. You probably don't want to use amdkf=
d,
>> but port that as a context flag or similar to render nodes for gl/vk. Of
>> course that means you can only use this mode in headless, without
>> glx/wayland winsys support, but it's a start.
>> -Daniel
>>
>> >
>> > Marek
>> >
>> > On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone <daniel@fooishbar.org>
>> wrote:
>> >
>> > > Hi,
>> > >
>> > > On Tue, 20 Apr 2021 at 20:30, Daniel Vetter <daniel@ffwll.ch> wrote:
>> > >
>> > >> The thing is, you can't do this in drm/scheduler. At least not
>> without
>> > >> splitting up the dma_fence in the kernel into separate memory fence=
s
>> > >> and sync fences
>> > >
>> > >
>> > > I'm starting to think this thread needs its own glossary ...
>> > >
>> > > I propose we use 'residency fence' for execution fences which enact
>> > > memory-residency operations, e.g. faulting in a page ultimately
>> depending
>> > > on GPU work retiring.
>> > >
>> > > And 'value fence' for the pure-userspace model suggested by timeline
>> > > semaphores, i.e. fences being (*addr =3D=3D val) rather than being a=
ble
>> to look
>> > > at ctx seqno.
>> > >
>> > > Cheers,
>> > > Daniel
>> > > _______________________________________________
>> > > mesa-dev mailing list
>> > > mesa-dev@lists.freedesktop.org
>> > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>> > >
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>>
>
> _______________________________________________
> mesa-dev mailing listmesa-dev@lists.freedesktop.orghttps://lists.freedesk=
top.org/mailman/listinfo/mesa-dev
>
>
>

--000000000000b0e7a605c0f3282f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok. I&#39;ll interpret this as &quot;yes, it will work, l=
et&#39;s do it&quot;.<div dir=3D"auto"><br></div><div dir=3D"auto">Marek</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue., Apr. 27, 2021, 08:06 Christian K=C3=B6nig, &lt;<a href=3D"mailt=
o:ckoenig.leichtzumerken@gmail.com">ckoenig.leichtzumerken@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    Correct, we wouldn&#39;t have synchronization between device with and
    without user queues any more.<br>
    <br>
    That could only be a problem for A+I Laptops.<br>
    <br>
    Memory management will just work with preemption fences which pause
    the user queues of a process before evicting something. That will be
    a dma_fence, but also a well known approach.<br>
    <br>
    Christian.<br>
    <br>
    <div>Am 27.04.21 um 13:49 schrieb Marek
      Ol=C5=A1=C3=A1k:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">
        <div>If we don&#39;t use future fences for DMA fences at all, e.g.
          we don&#39;t use them for memory management, it can work, right?
          Memory management can suspend user queues anytime. It doesn&#39;t
          need to use DMA fences. There might be something that I&#39;m
          missing here.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">What would we lose without DMA fences? Just
          inter-device synchronization? I think that might be
          acceptable.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">The only case when the kernel will wait on a
          future fence is before a page flip. Everything today already
          depends on userspace not hanging the gpu, which makes
          everything a future fence.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Marek<br>
          <br>
          <div class=3D"gmail_quote" dir=3D"auto">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue., Apr. 27, 2021,
              04:02 Daniel Vetter, &lt;<a href=3D"mailto:daniel@ffwll.ch" t=
arget=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&gt; wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Mon,
              Apr 26, 2021 at 04:59:28PM -0400, Marek Ol=C5=A1=C3=A1k wrote=
:<br>
              &gt; Thanks everybody. The initial proposal is dead. Here
              are some thoughts on<br>
              &gt; how to do it differently.<br>
              &gt; <br>
              &gt; I think we can have direct command submission from
              userspace via<br>
              &gt; memory-mapped queues (&quot;user queues&quot;) without c=
hanging
              window systems.<br>
              &gt; <br>
              &gt; The memory management doesn&#39;t have to use GPU page
              faults like HMM.<br>
              &gt; Instead, it can wait for user queues of a specific
              process to go idle and<br>
              &gt; then unmap the queues, so that userspace can&#39;t submi=
t
              anything. Buffer<br>
              &gt; evictions, pinning, etc. can be executed when all
              queues are unmapped<br>
              &gt; (suspended). Thus, no BO fences and page faults are
              needed.<br>
              &gt; <br>
              &gt; Inter-process synchronization can use timeline
              semaphores. Userspace will<br>
              &gt; query the wait and signal value for a shared buffer
              from the kernel. The<br>
              &gt; kernel will keep a history of those queries to know
              which process is<br>
              &gt; responsible for signalling which buffer. There is
              only the wait-timeout<br>
              &gt; issue and how to identify the culprit. One of the
              solutions is to have the<br>
              &gt; GPU send all GPU signal commands and all timed out
              wait commands via an<br>
              &gt; interrupt to the kernel driver to monitor and
              validate userspace behavior.<br>
              &gt; With that, it can be identified whether the culprit
              is the waiting process<br>
              &gt; or the signalling process and which one. Invalid
              signal/wait parameters can<br>
              &gt; also be detected. The kernel can force-signal only
              the semaphores that time<br>
              &gt; out, and punish the processes which caused the
              timeout or used invalid<br>
              &gt; signal/wait parameters.<br>
              &gt; <br>
              &gt; The question is whether this synchronization solution
              is robust enough for<br>
              &gt; dma_fence and whatever the kernel and window systems
              need.<br>
              <br>
              The proper model here is the preempt-ctx dma_fence that
              amdkfd uses<br>
              (without page faults). That means dma_fence for
              synchronization is doa, at<br>
              least as-is, and we&#39;re back to figuring out the winsys
              problem.<br>
              <br>
              &quot;We&#39;ll solve it with timeouts&quot; is very tempting=
, but
              doesn&#39;t work. It&#39;s<br>
              akin to saying that we&#39;re solving deadlock issues in a
              locking design by<br>
              doing a global s/mutex_lock/mutex_lock_timeout/ in the
              kernel. Sure it<br>
              avoids having to reach the reset button, but that&#39;s about
              it.<br>
              <br>
              And the fundamental problem is that once you throw in
              userspace command<br>
              submission (and syncing, at least within the userspace
              driver, otherwise<br>
              there&#39;s kinda no point if you still need the kernel for
              cross-engine sync)<br>
              means you get deadlocks if you still use dma_fence for
              sync under<br>
              perfectly legit use-case. We&#39;ve discussed that one ad
              nauseam last summer:<br>
              <br>
              <a href=3D"https://dri.freedesktop.org/docs/drm/driver-api/dm=
a-buf.html?highlight=3Ddma_fence#indefinite-dma-fences" rel=3D"noreferrer n=
oreferrer noreferrer" target=3D"_blank">https://dri.freedesktop.org/docs/dr=
m/driver-api/dma-buf.html?highlight=3Ddma_fence#indefinite-dma-fences</a><b=
r>
              <br>
              See silly diagramm at the bottom.<br>
              <br>
              Now I think all isn&#39;t lost, because imo the first step to
              getting to this<br>
              brave new world is rebuilding the driver on top of
              userspace fences, and<br>
              with the adjusted cmd submit model. You probably don&#39;t
              want to use amdkfd,<br>
              but port that as a context flag or similar to render nodes
              for gl/vk. Of<br>
              course that means you can only use this mode in headless,
              without<br>
              glx/wayland winsys support, but it&#39;s a start.<br>
              -Daniel<br>
              <br>
              &gt; <br>
              &gt; Marek<br>
              &gt; <br>
              &gt; On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone &lt;<a href=
=3D"mailto:daniel@fooishbar.org" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">daniel@fooishbar.org</a>&gt;
              wrote:<br>
              &gt; <br>
              &gt; &gt; Hi,<br>
              &gt; &gt;<br>
              &gt; &gt; On Tue, 20 Apr 2021 at 20:30, Daniel Vetter &lt;<a =
href=3D"mailto:daniel@ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">daniel@ffwll.ch</a>&gt;
              wrote:<br>
              &gt; &gt;<br>
              &gt; &gt;&gt; The thing is, you can&#39;t do this in
              drm/scheduler. At least not without<br>
              &gt; &gt;&gt; splitting up the dma_fence in the kernel
              into separate memory fences<br>
              &gt; &gt;&gt; and sync fences<br>
              &gt; &gt;<br>
              &gt; &gt;<br>
              &gt; &gt; I&#39;m starting to think this thread needs its own
              glossary ...<br>
              &gt; &gt;<br>
              &gt; &gt; I propose we use &#39;residency fence&#39; for exec=
ution
              fences which enact<br>
              &gt; &gt; memory-residency operations, e.g. faulting in a
              page ultimately depending<br>
              &gt; &gt; on GPU work retiring.<br>
              &gt; &gt;<br>
              &gt; &gt; And &#39;value fence&#39; for the pure-userspace mo=
del
              suggested by timeline<br>
              &gt; &gt; semaphores, i.e. fences being (*addr =3D=3D val)
              rather than being able to look<br>
              &gt; &gt; at ctx seqno.<br>
              &gt; &gt;<br>
              &gt; &gt; Cheers,<br>
              &gt; &gt; Daniel<br>
              &gt; &gt; _______________________________________________<br>
              &gt; &gt; mesa-dev mailing list<br>
              &gt; &gt; <a href=3D"mailto:mesa-dev@lists.freedesktop.org" r=
el=3D"noreferrer noreferrer" target=3D"_blank">mesa-dev@lists.freedesktop.o=
rg</a><br>
              &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/li=
stinfo/mesa-dev" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>https://lists.freedesktop.org/mailman/listinfo/mesa-dev</a><br>
              &gt; &gt;<br>
              <br>
              -- <br>
              Daniel Vetter<br>
              Software Engineer, Intel Corporation<br>
              <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer=
 noreferrer" target=3D"_blank">http://blog.ffwll.ch</a><br>
            </blockquote>
          </div>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <pre>_______________________________________________
mesa-dev mailing list
<a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blank" rel=3D"=
noreferrer">mesa-dev@lists.freedesktop.org</a>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-dev" target=
=3D"_blank" rel=3D"noreferrer">https://lists.freedesktop.org/mailman/listin=
fo/mesa-dev</a>
</pre>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000b0e7a605c0f3282f--

--===============1622784382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1622784382==--
