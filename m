Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84136C874
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 17:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90726E980;
	Tue, 27 Apr 2021 15:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3903E6E980;
 Tue, 27 Apr 2021 15:13:58 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d14so6562684edc.12;
 Tue, 27 Apr 2021 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=bVuS4X5EUNfIJq7ABQX5lsoe3IhAOvWxBjOv7xGrfE0=;
 b=tmZ0NZDH3TGI+2CsNld3jHYjH7qPFZ8t96dBUgav/I12jt7mGce24O5Mxjh3XMH044
 OyJBTjZCeRKFQ13v/2CH4VzwVBaIjp4bZWRjv0qcWHuUChzvsVPj0OBVSGG7/iySQ0am
 dAjWlrWYTDPRVbL90IChXP/gIwa+MLexWh7pwpEuDTjFWjwPuBpfslkwp7m0mn/JBzxO
 9TmxwG7QMStOXn1+6w9ctgavv2ZV6Gjq0xQ3Esqm98/gy7/XdN+HwRzWY3NGs1pKqG90
 UEo81RKZ01zueuPaI4S3aYgGOP/Qq8esywy1cqBWKHqWiMmI0wiKjmiP/jzJujizcTti
 7i6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=bVuS4X5EUNfIJq7ABQX5lsoe3IhAOvWxBjOv7xGrfE0=;
 b=rULiVR1yLnTcGd4RlQZ1xLdiGXh+V0kTrfrj4YNfnbaa1hP7nonN5gnwPgTlAy9oiS
 7Xelw1CGym3okipKcgTBXuIOhQ+lPP2Hie1553i5t9kwG+Oqr+M+TfQiAMuNqbFICOcE
 brGcN/dJNl7kV0JT34q8hbzl9wNmx9/+lYn7dloHTx8jQaVsFp9k0cYb6MV6qHMEZ6XP
 I4A1h787PsSGgQDlIVYxDJHj2t6iY7o+VvR25qH2/iHVYAOFrYkZyRbm/8qs528ANzdr
 DtddxOwp9nBPq6omwZHg+m5rBwbiXww2YHgTVFcSmYXsDjksNik3GHfoHjAc5S7DnRoT
 2yVQ==
X-Gm-Message-State: AOAM530NXZlgsB/4Bpxv/Tw3safkVEWTy5joFRstoQJPejMblJLRCvF0
 KFlKi7ZdrlZFOborE+dHnqVZii+0DYM=
X-Google-Smtp-Source: ABdhPJyeqWNqJMhaCo2brJkaw0OlvWN8RnVqz8J99GaEZYFrFMaCFcGsT+qv4SXybsGMvoJNgfUZZg==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr4966398edt.152.1619536436953; 
 Tue, 27 Apr 2021 08:13:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5565:6656:893b:2618?
 ([2a02:908:1252:fb60:5565:6656:893b:2618])
 by smtp.gmail.com with ESMTPSA id i8sm2631532edu.64.2021.04.27.08.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 08:13:56 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
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
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <78a45197-1563-6ad7-5e54-a2ed1d1332bd@gmail.com>
Date: Tue, 27 Apr 2021 17:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
Content-Language: en-US
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
Content-Type: multipart/mixed; boundary="===============2090817872=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2090817872==
Content-Type: multipart/alternative;
 boundary="------------04D7232B639FE7EDDFB40D7A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------04D7232B639FE7EDDFB40D7A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Uff good question. DMA-buf certainly supports that use case, but I have 
no idea if that is actually used somewhere.

Daniel do you know any case?

Christian.

Am 27.04.21 um 15:26 schrieb Marek Olšák:
> Ok. So that would only make the following use cases broken for now:
> - amd render -> external gpu
> - amd video encode -> network device
>
> What about the case when we get a buffer from an external device and 
> we're supposed to make it "busy" when we are using it, and the 
> external device wants to wait until we stop using it? Is it something 
> that can happen, thus turning "external -> amd" into "external <-> amd"?
>
> Marek
>
> On Tue., Apr. 27, 2021, 08:50 Christian König, 
> <ckoenig.leichtzumerken@gmail.com 
> <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>
>     Only amd -> external.
>
>     We can easily install something in an user queue which waits for a
>     dma_fence in the kernel.
>
>     But we can't easily wait for an user queue as dependency of a
>     dma_fence.
>
>     The good thing is we have this wait before signal case on Vulkan
>     timeline semaphores which have the same problem in the kernel.
>
>     The good news is I think we can relatively easily convert i915 and
>     older amdgpu device to something which is compatible with user fences.
>
>     So yes, getting that fixed case by case should work.
>
>     Christian
>
>     Am 27.04.21 um 14:46 schrieb Marek Olšák:
>>     I'll defer to Christian and Alex to decide whether dropping sync
>>     with non-amd devices (GPUs, cameras etc.) is acceptable.
>>
>>     Rewriting those drivers to this new sync model could be done on a
>>     case by case basis.
>>
>>     For now, would we only lose the "amd -> external" dependency? Or
>>     the "external -> amd" dependency too?
>>
>>     Marek
>>
>>     On Tue., Apr. 27, 2021, 08:15 Daniel Vetter, <daniel@ffwll.ch
>>     <mailto:daniel@ffwll.ch>> wrote:
>>
>>         On Tue, Apr 27, 2021 at 2:11 PM Marek Olšák <maraeo@gmail.com
>>         <mailto:maraeo@gmail.com>> wrote:
>>         > Ok. I'll interpret this as "yes, it will work, let's do it".
>>
>>         It works if all you care about is drm/amdgpu. I'm not sure
>>         that's a
>>         reasonable approach for upstream, but it definitely is an
>>         approach :-)
>>
>>         We've already gone somewhat through the pain of drm/amdgpu
>>         redefining
>>         how implicit sync works without sufficiently talking with other
>>         people, maybe we should avoid a repeat of this ...
>>         -Daniel
>>
>>         >
>>         > Marek
>>         >
>>         > On Tue., Apr. 27, 2021, 08:06 Christian König,
>>         <ckoenig.leichtzumerken@gmail.com
>>         <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>>         >>
>>         >> Correct, we wouldn't have synchronization between device
>>         with and without user queues any more.
>>         >>
>>         >> That could only be a problem for A+I Laptops.
>>         >>
>>         >> Memory management will just work with preemption fences
>>         which pause the user queues of a process before evicting
>>         something. That will be a dma_fence, but also a well known
>>         approach.
>>         >>
>>         >> Christian.
>>         >>
>>         >> Am 27.04.21 um 13:49 schrieb Marek Olšák:
>>         >>
>>         >> If we don't use future fences for DMA fences at all, e.g.
>>         we don't use them for memory management, it can work, right?
>>         Memory management can suspend user queues anytime. It doesn't
>>         need to use DMA fences. There might be something that I'm
>>         missing here.
>>         >>
>>         >> What would we lose without DMA fences? Just inter-device
>>         synchronization? I think that might be acceptable.
>>         >>
>>         >> The only case when the kernel will wait on a future fence
>>         is before a page flip. Everything today already depends on
>>         userspace not hanging the gpu, which makes everything a
>>         future fence.
>>         >>
>>         >> Marek
>>         >>
>>         >> On Tue., Apr. 27, 2021, 04:02 Daniel Vetter,
>>         <daniel@ffwll.ch <mailto:daniel@ffwll.ch>> wrote:
>>         >>>
>>         >>> On Mon, Apr 26, 2021 at 04:59:28PM -0400, Marek Olšák wrote:
>>         >>> > Thanks everybody. The initial proposal is dead. Here
>>         are some thoughts on
>>         >>> > how to do it differently.
>>         >>> >
>>         >>> > I think we can have direct command submission from
>>         userspace via
>>         >>> > memory-mapped queues ("user queues") without changing
>>         window systems.
>>         >>> >
>>         >>> > The memory management doesn't have to use GPU page
>>         faults like HMM.
>>         >>> > Instead, it can wait for user queues of a specific
>>         process to go idle and
>>         >>> > then unmap the queues, so that userspace can't submit
>>         anything. Buffer
>>         >>> > evictions, pinning, etc. can be executed when all
>>         queues are unmapped
>>         >>> > (suspended). Thus, no BO fences and page faults are needed.
>>         >>> >
>>         >>> > Inter-process synchronization can use timeline
>>         semaphores. Userspace will
>>         >>> > query the wait and signal value for a shared buffer
>>         from the kernel. The
>>         >>> > kernel will keep a history of those queries to know
>>         which process is
>>         >>> > responsible for signalling which buffer. There is only
>>         the wait-timeout
>>         >>> > issue and how to identify the culprit. One of the
>>         solutions is to have the
>>         >>> > GPU send all GPU signal commands and all timed out wait
>>         commands via an
>>         >>> > interrupt to the kernel driver to monitor and validate
>>         userspace behavior.
>>         >>> > With that, it can be identified whether the culprit is
>>         the waiting process
>>         >>> > or the signalling process and which one. Invalid
>>         signal/wait parameters can
>>         >>> > also be detected. The kernel can force-signal only the
>>         semaphores that time
>>         >>> > out, and punish the processes which caused the timeout
>>         or used invalid
>>         >>> > signal/wait parameters.
>>         >>> >
>>         >>> > The question is whether this synchronization solution
>>         is robust enough for
>>         >>> > dma_fence and whatever the kernel and window systems need.
>>         >>>
>>         >>> The proper model here is the preempt-ctx dma_fence that
>>         amdkfd uses
>>         >>> (without page faults). That means dma_fence for
>>         synchronization is doa, at
>>         >>> least as-is, and we're back to figuring out the winsys
>>         problem.
>>         >>>
>>         >>> "We'll solve it with timeouts" is very tempting, but
>>         doesn't work. It's
>>         >>> akin to saying that we're solving deadlock issues in a
>>         locking design by
>>         >>> doing a global s/mutex_lock/mutex_lock_timeout/ in the
>>         kernel. Sure it
>>         >>> avoids having to reach the reset button, but that's about it.
>>         >>>
>>         >>> And the fundamental problem is that once you throw in
>>         userspace command
>>         >>> submission (and syncing, at least within the userspace
>>         driver, otherwise
>>         >>> there's kinda no point if you still need the kernel for
>>         cross-engine sync)
>>         >>> means you get deadlocks if you still use dma_fence for
>>         sync under
>>         >>> perfectly legit use-case. We've discussed that one ad
>>         nauseam last summer:
>>         >>>
>>         >>>
>>         https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_fence#indefinite-dma-fences
>>         <https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_fence#indefinite-dma-fences>
>>         >>>
>>         >>> See silly diagramm at the bottom.
>>         >>>
>>         >>> Now I think all isn't lost, because imo the first step to
>>         getting to this
>>         >>> brave new world is rebuilding the driver on top of
>>         userspace fences, and
>>         >>> with the adjusted cmd submit model. You probably don't
>>         want to use amdkfd,
>>         >>> but port that as a context flag or similar to render
>>         nodes for gl/vk. Of
>>         >>> course that means you can only use this mode in headless,
>>         without
>>         >>> glx/wayland winsys support, but it's a start.
>>         >>> -Daniel
>>         >>>
>>         >>> >
>>         >>> > Marek
>>         >>> >
>>         >>> > On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone
>>         <daniel@fooishbar.org <mailto:daniel@fooishbar.org>> wrote:
>>         >>> >
>>         >>> > > Hi,
>>         >>> > >
>>         >>> > > On Tue, 20 Apr 2021 at 20:30, Daniel Vetter
>>         <daniel@ffwll.ch <mailto:daniel@ffwll.ch>> wrote:
>>         >>> > >
>>         >>> > >> The thing is, you can't do this in drm/scheduler. At
>>         least not without
>>         >>> > >> splitting up the dma_fence in the kernel into
>>         separate memory fences
>>         >>> > >> and sync fences
>>         >>> > >
>>         >>> > >
>>         >>> > > I'm starting to think this thread needs its own
>>         glossary ...
>>         >>> > >
>>         >>> > > I propose we use 'residency fence' for execution
>>         fences which enact
>>         >>> > > memory-residency operations, e.g. faulting in a page
>>         ultimately depending
>>         >>> > > on GPU work retiring.
>>         >>> > >
>>         >>> > > And 'value fence' for the pure-userspace model
>>         suggested by timeline
>>         >>> > > semaphores, i.e. fences being (*addr == val) rather
>>         than being able to look
>>         >>> > > at ctx seqno.
>>         >>> > >
>>         >>> > > Cheers,
>>         >>> > > Daniel
>>         >>> > > _______________________________________________
>>         >>> > > mesa-dev mailing list
>>         >>> > > mesa-dev@lists.freedesktop.org
>>         <mailto:mesa-dev@lists.freedesktop.org>
>>         >>> > >
>>         https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>>         <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>
>>         >>> > >
>>         >>>
>>         >>> --
>>         >>> Daniel Vetter
>>         >>> Software Engineer, Intel Corporation
>>         >>> http://blog.ffwll.ch <http://blog.ffwll.ch>
>>         >>
>>         >>
>>         >> _______________________________________________
>>         >> mesa-dev mailing list
>>         >> mesa-dev@lists.freedesktop.org
>>         <mailto:mesa-dev@lists.freedesktop.org>
>>         >> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>>         <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>
>>         >>
>>         >>
>>
>>
>>         -- 
>>         Daniel Vetter
>>         Software Engineer, Intel Corporation
>>         http://blog.ffwll.ch <http://blog.ffwll.ch>
>>
>


--------------04D7232B639FE7EDDFB40D7A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Uff good question. DMA-buf certainly supports that use case, but I
    have no idea if that is actually used somewhere.<br>
    <br>
    Daniel do you know any case?<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 27.04.21 um 15:26 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">Ok. So that would only make the following use
        cases broken for now:
        <div dir="auto">- amd render -&gt; external gpu</div>
        <div dir="auto">- amd video encode -&gt; network device</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">What about the case when we get a buffer from an
          external device and we're supposed to make it "busy" when we
          are using it, and the external device wants to wait until we
          stop using it? Is it something that can happen, thus turning
          "external -&gt; amd" into "external &lt;-&gt; amd"?</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Marek</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue., Apr. 27, 2021, 08:50
          Christian König, &lt;<a
            href="mailto:ckoenig.leichtzumerken@gmail.com"
            moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div> Only amd -&gt; external.<br>
            <br>
            We can easily install something in an user queue which waits
            for a dma_fence in the kernel.<br>
            <br>
            But we can't easily wait for an user queue as dependency of
            a dma_fence.<br>
            <br>
            The good thing is we have this wait before signal case on
            Vulkan timeline semaphores which have the same problem in
            the kernel.<br>
            <br>
            The good news is I think we can relatively easily convert
            i915 and older amdgpu device to something which is
            compatible with user fences.<br>
            <br>
            So yes, getting that fixed case by case should work.<br>
            <br>
            Christian<br>
            <br>
            <div>Am 27.04.21 um 14:46 schrieb Marek Olšák:<br>
            </div>
            <blockquote type="cite">
              <div dir="auto">
                <div>I'll defer to Christian and Alex to decide whether
                  dropping sync with non-amd devices (GPUs, cameras
                  etc.) is acceptable.</div>
                <div dir="auto"><br>
                </div>
                <div dir="auto">Rewriting those drivers to this new sync
                  model could be done on a case by case basis.</div>
                <div dir="auto"><br>
                </div>
                <div dir="auto">For now, would we only lose the "amd
                  -&gt; external" dependency? Or the "external -&gt;
                  amd" dependency too?</div>
                <div dir="auto"><br>
                </div>
                <div dir="auto">Marek</div>
                <div dir="auto"><br>
                  <div class="gmail_quote" dir="auto">
                    <div dir="ltr" class="gmail_attr">On Tue., Apr. 27,
                      2021, 08:15 Daniel Vetter, &lt;<a
                        href="mailto:daniel@ffwll.ch" rel="noreferrer
                        noreferrer noreferrer" target="_blank"
                        moz-do-not-send="true">daniel@ffwll.ch</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">On
                      Tue, Apr 27, 2021 at 2:11 PM Marek Olšák &lt;<a
                        href="mailto:maraeo@gmail.com" rel="noreferrer
                        noreferrer noreferrer noreferrer"
                        target="_blank" moz-do-not-send="true">maraeo@gmail.com</a>&gt;
                      wrote:<br>
                      &gt; Ok. I'll interpret this as "yes, it will
                      work, let's do it".<br>
                      <br>
                      It works if all you care about is drm/amdgpu. I'm
                      not sure that's a<br>
                      reasonable approach for upstream, but it
                      definitely is an approach :-)<br>
                      <br>
                      We've already gone somewhat through the pain of
                      drm/amdgpu redefining<br>
                      how implicit sync works without sufficiently
                      talking with other<br>
                      people, maybe we should avoid a repeat of this ...<br>
                      -Daniel<br>
                      <br>
                      &gt;<br>
                      &gt; Marek<br>
                      &gt;<br>
                      &gt; On Tue., Apr. 27, 2021, 08:06 Christian
                      König, &lt;<a
                        href="mailto:ckoenig.leichtzumerken@gmail.com"
                        rel="noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
                      wrote:<br>
                      &gt;&gt;<br>
                      &gt;&gt; Correct, we wouldn't have synchronization
                      between device with and without user queues any
                      more.<br>
                      &gt;&gt;<br>
                      &gt;&gt; That could only be a problem for A+I
                      Laptops.<br>
                      &gt;&gt;<br>
                      &gt;&gt; Memory management will just work with
                      preemption fences which pause the user queues of a
                      process before evicting something. That will be a
                      dma_fence, but also a well known approach.<br>
                      &gt;&gt;<br>
                      &gt;&gt; Christian.<br>
                      &gt;&gt;<br>
                      &gt;&gt; Am 27.04.21 um 13:49 schrieb Marek Olšák:<br>
                      &gt;&gt;<br>
                      &gt;&gt; If we don't use future fences for DMA
                      fences at all, e.g. we don't use them for memory
                      management, it can work, right? Memory management
                      can suspend user queues anytime. It doesn't need
                      to use DMA fences. There might be something that
                      I'm missing here.<br>
                      &gt;&gt;<br>
                      &gt;&gt; What would we lose without DMA fences?
                      Just inter-device synchronization? I think that
                      might be acceptable.<br>
                      &gt;&gt;<br>
                      &gt;&gt; The only case when the kernel will wait
                      on a future fence is before a page flip.
                      Everything today already depends on userspace not
                      hanging the gpu, which makes everything a future
                      fence.<br>
                      &gt;&gt;<br>
                      &gt;&gt; Marek<br>
                      &gt;&gt;<br>
                      &gt;&gt; On Tue., Apr. 27, 2021, 04:02 Daniel
                      Vetter, &lt;<a href="mailto:daniel@ffwll.ch"
                        rel="noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">daniel@ffwll.ch</a>&gt;
                      wrote:<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; On Mon, Apr 26, 2021 at 04:59:28PM
                      -0400, Marek Olšák wrote:<br>
                      &gt;&gt;&gt; &gt; Thanks everybody. The initial
                      proposal is dead. Here are some thoughts on<br>
                      &gt;&gt;&gt; &gt; how to do it differently.<br>
                      &gt;&gt;&gt; &gt;<br>
                      &gt;&gt;&gt; &gt; I think we can have direct
                      command submission from userspace via<br>
                      &gt;&gt;&gt; &gt; memory-mapped queues ("user
                      queues") without changing window systems.<br>
                      &gt;&gt;&gt; &gt;<br>
                      &gt;&gt;&gt; &gt; The memory management doesn't
                      have to use GPU page faults like HMM.<br>
                      &gt;&gt;&gt; &gt; Instead, it can wait for user
                      queues of a specific process to go idle and<br>
                      &gt;&gt;&gt; &gt; then unmap the queues, so that
                      userspace can't submit anything. Buffer<br>
                      &gt;&gt;&gt; &gt; evictions, pinning, etc. can be
                      executed when all queues are unmapped<br>
                      &gt;&gt;&gt; &gt; (suspended). Thus, no BO fences
                      and page faults are needed.<br>
                      &gt;&gt;&gt; &gt;<br>
                      &gt;&gt;&gt; &gt; Inter-process synchronization
                      can use timeline semaphores. Userspace will<br>
                      &gt;&gt;&gt; &gt; query the wait and signal value
                      for a shared buffer from the kernel. The<br>
                      &gt;&gt;&gt; &gt; kernel will keep a history of
                      those queries to know which process is<br>
                      &gt;&gt;&gt; &gt; responsible for signalling which
                      buffer. There is only the wait-timeout<br>
                      &gt;&gt;&gt; &gt; issue and how to identify the
                      culprit. One of the solutions is to have the<br>
                      &gt;&gt;&gt; &gt; GPU send all GPU signal commands
                      and all timed out wait commands via an<br>
                      &gt;&gt;&gt; &gt; interrupt to the kernel driver
                      to monitor and validate userspace behavior.<br>
                      &gt;&gt;&gt; &gt; With that, it can be identified
                      whether the culprit is the waiting process<br>
                      &gt;&gt;&gt; &gt; or the signalling process and
                      which one. Invalid signal/wait parameters can<br>
                      &gt;&gt;&gt; &gt; also be detected. The kernel can
                      force-signal only the semaphores that time<br>
                      &gt;&gt;&gt; &gt; out, and punish the processes
                      which caused the timeout or used invalid<br>
                      &gt;&gt;&gt; &gt; signal/wait parameters.<br>
                      &gt;&gt;&gt; &gt;<br>
                      &gt;&gt;&gt; &gt; The question is whether this
                      synchronization solution is robust enough for<br>
                      &gt;&gt;&gt; &gt; dma_fence and whatever the
                      kernel and window systems need.<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; The proper model here is the
                      preempt-ctx dma_fence that amdkfd uses<br>
                      &gt;&gt;&gt; (without page faults). That means
                      dma_fence for synchronization is doa, at<br>
                      &gt;&gt;&gt; least as-is, and we're back to
                      figuring out the winsys problem.<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; "We'll solve it with timeouts" is
                      very tempting, but doesn't work. It's<br>
                      &gt;&gt;&gt; akin to saying that we're solving
                      deadlock issues in a locking design by<br>
                      &gt;&gt;&gt; doing a global
                      s/mutex_lock/mutex_lock_timeout/ in the kernel.
                      Sure it<br>
                      &gt;&gt;&gt; avoids having to reach the reset
                      button, but that's about it.<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; And the fundamental problem is that
                      once you throw in userspace command<br>
                      &gt;&gt;&gt; submission (and syncing, at least
                      within the userspace driver, otherwise<br>
                      &gt;&gt;&gt; there's kinda no point if you still
                      need the kernel for cross-engine sync)<br>
                      &gt;&gt;&gt; means you get deadlocks if you still
                      use dma_fence for sync under<br>
                      &gt;&gt;&gt; perfectly legit use-case. We've
                      discussed that one ad nauseam last summer:<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; <a
href="https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_fence#indefinite-dma-fences"
                        rel="noreferrer noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_fence#indefinite-dma-fences</a><br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; See silly diagramm at the bottom.<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; Now I think all isn't lost, because
                      imo the first step to getting to this<br>
                      &gt;&gt;&gt; brave new world is rebuilding the
                      driver on top of userspace fences, and<br>
                      &gt;&gt;&gt; with the adjusted cmd submit model.
                      You probably don't want to use amdkfd,<br>
                      &gt;&gt;&gt; but port that as a context flag or
                      similar to render nodes for gl/vk. Of<br>
                      &gt;&gt;&gt; course that means you can only use
                      this mode in headless, without<br>
                      &gt;&gt;&gt; glx/wayland winsys support, but it's
                      a start.<br>
                      &gt;&gt;&gt; -Daniel<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; &gt;<br>
                      &gt;&gt;&gt; &gt; Marek<br>
                      &gt;&gt;&gt; &gt;<br>
                      &gt;&gt;&gt; &gt; On Tue, Apr 20, 2021 at 4:34 PM
                      Daniel Stone &lt;<a
                        href="mailto:daniel@fooishbar.org"
                        rel="noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">daniel@fooishbar.org</a>&gt;
                      wrote:<br>
                      &gt;&gt;&gt; &gt;<br>
                      &gt;&gt;&gt; &gt; &gt; Hi,<br>
                      &gt;&gt;&gt; &gt; &gt;<br>
                      &gt;&gt;&gt; &gt; &gt; On Tue, 20 Apr 2021 at
                      20:30, Daniel Vetter &lt;<a
                        href="mailto:daniel@ffwll.ch" rel="noreferrer
                        noreferrer noreferrer noreferrer"
                        target="_blank" moz-do-not-send="true">daniel@ffwll.ch</a>&gt;
                      wrote:<br>
                      &gt;&gt;&gt; &gt; &gt;<br>
                      &gt;&gt;&gt; &gt; &gt;&gt; The thing is, you can't
                      do this in drm/scheduler. At least not without<br>
                      &gt;&gt;&gt; &gt; &gt;&gt; splitting up the
                      dma_fence in the kernel into separate memory
                      fences<br>
                      &gt;&gt;&gt; &gt; &gt;&gt; and sync fences<br>
                      &gt;&gt;&gt; &gt; &gt;<br>
                      &gt;&gt;&gt; &gt; &gt;<br>
                      &gt;&gt;&gt; &gt; &gt; I'm starting to think this
                      thread needs its own glossary ...<br>
                      &gt;&gt;&gt; &gt; &gt;<br>
                      &gt;&gt;&gt; &gt; &gt; I propose we use 'residency
                      fence' for execution fences which enact<br>
                      &gt;&gt;&gt; &gt; &gt; memory-residency
                      operations, e.g. faulting in a page ultimately
                      depending<br>
                      &gt;&gt;&gt; &gt; &gt; on GPU work retiring.<br>
                      &gt;&gt;&gt; &gt; &gt;<br>
                      &gt;&gt;&gt; &gt; &gt; And 'value fence' for the
                      pure-userspace model suggested by timeline<br>
                      &gt;&gt;&gt; &gt; &gt; semaphores, i.e. fences
                      being (*addr == val) rather than being able to
                      look<br>
                      &gt;&gt;&gt; &gt; &gt; at ctx seqno.<br>
                      &gt;&gt;&gt; &gt; &gt;<br>
                      &gt;&gt;&gt; &gt; &gt; Cheers,<br>
                      &gt;&gt;&gt; &gt; &gt; Daniel<br>
                      &gt;&gt;&gt; &gt; &gt;
                      _______________________________________________<br>
                      &gt;&gt;&gt; &gt; &gt; mesa-dev mailing list<br>
                      &gt;&gt;&gt; &gt; &gt; <a
                        href="mailto:mesa-dev@lists.freedesktop.org"
                        rel="noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">mesa-dev@lists.freedesktop.org</a><br>
                      &gt;&gt;&gt; &gt; &gt; <a
                        href="https://lists.freedesktop.org/mailman/listinfo/mesa-dev"
                        rel="noreferrer noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/mesa-dev</a><br>
                      &gt;&gt;&gt; &gt; &gt;<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; --<br>
                      &gt;&gt;&gt; Daniel Vetter<br>
                      &gt;&gt;&gt; Software Engineer, Intel Corporation<br>
                      &gt;&gt;&gt; <a href="http://blog.ffwll.ch"
                        rel="noreferrer noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">http://blog.ffwll.ch</a><br>
                      &gt;&gt;<br>
                      &gt;&gt;<br>
                      &gt;&gt;
                      _______________________________________________<br>
                      &gt;&gt; mesa-dev mailing list<br>
                      &gt;&gt; <a
                        href="mailto:mesa-dev@lists.freedesktop.org"
                        rel="noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">mesa-dev@lists.freedesktop.org</a><br>
                      &gt;&gt; <a
                        href="https://lists.freedesktop.org/mailman/listinfo/mesa-dev"
                        rel="noreferrer noreferrer noreferrer noreferrer
                        noreferrer" target="_blank"
                        moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/mesa-dev</a><br>
                      &gt;&gt;<br>
                      &gt;&gt;<br>
                      <br>
                      <br>
                      -- <br>
                      Daniel Vetter<br>
                      Software Engineer, Intel Corporation<br>
                      <a href="http://blog.ffwll.ch" rel="noreferrer
                        noreferrer noreferrer noreferrer noreferrer"
                        target="_blank" moz-do-not-send="true">http://blog.ffwll.ch</a><br>
                    </blockquote>
                  </div>
                </div>
              </div>
            </blockquote>
            <br>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------04D7232B639FE7EDDFB40D7A--

--===============2090817872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2090817872==--
