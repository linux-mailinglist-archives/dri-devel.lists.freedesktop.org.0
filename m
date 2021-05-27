Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61150392669
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECD96EE2C;
	Thu, 27 May 2021 04:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176B96EE2C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 04:32:54 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id c3so3884423oic.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 21:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=pqSz7eL3K2lAgaYSnBDAoPNimivg+metK+x42B6cUP8=;
 b=xzTK+r2ovXJDA/ld4pqPD2PLRHOlPYxzwduuzW/x/yA4Q5BdLM7vZFWV9spBBWalGq
 ToCUd7chS/I7R9hH4Lr1cFC5gb1xH/lQm8VP7Oc4/YQg5cJ3qUjaulDlVLFTkOMOg/40
 +aqn02mkzvSP+m718tcZ+miICDm/Db17SGJNq905+lpUfqwPrEVr9JixJ2Z7C7D2UJaG
 0SkkNab9Rlx63Za2AB72Fb+0Zbs3apvHeGD9N/amCv0I+OAsoJJtaskOupPt/5rr3QA6
 6czliBNR+Z4ZkTm5Oth2FCmfYBWBh38O/aEZDWtxWW8A1LKROMjlgXKbwZaB9aJoKnwC
 VP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=pqSz7eL3K2lAgaYSnBDAoPNimivg+metK+x42B6cUP8=;
 b=hT+PpHEZjCSHCkS/76YpWMorNilIoRaMicTkxbc2Omajp4qTHMUJ+sf09b1WWvINS2
 Y30OeFO6XjA6KZIs+SOJqaVmu+C43CZunEdUXz46ewcabPwjWkWfaVZ46JZ8pOtFF71K
 u3t3uNw9Mh596qfygMIN27sjyOwxDF10ixDkDWp26FN/Q1fyaSH4scZ4uuki7CJ+wtUo
 FKQEOF0HDfHCvd47ZuCwoxOXAR0ptivFNr8ys8c7iMnCcU4+7yy558NYGgronVeqTbVx
 GrkTi0OUt/cVrGH7BMCJ3b6TYwNJu93tw60xGXLMzUypBJJhRo6UeaCoBr0u1PG3xkIC
 gjeA==
X-Gm-Message-State: AOAM532aKoWzA+4ihWIlz4xYGoy/WxGvUegIb/tkPf89uQTWM55CEPZo
 wD5r0J4Hx2Jj/WNosZAVvWQtow==
X-Google-Smtp-Source: ABdhPJzmsOQm80u6ijPR0D8yTjkv/TUyGH1qwdX06d9NW0gCnxjgD4cyIb9rSzR9RD9Br/gD0maYOQ==
X-Received: by 2002:a54:4192:: with SMTP id 18mr4329736oiy.84.1622089973154;
 Wed, 26 May 2021 21:32:53 -0700 (PDT)
Received: from [100.76.170.236] ([216.252.221.27])
 by smtp.gmail.com with ESMTPSA id y44sm240904ooi.0.2021.05.26.21.32.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 May 2021 21:32:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 23:32:49 -0500
Message-ID: <179ac18a598.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <CAPj87rOoVtc5dC12bBU+j6tdxHLh8fWGsPiemThBrY-=TjMx7Q@mail.gmail.com>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAOFGe95TZRw=ZpSwOKpwcxkxP_JRmEXpJn_26OS2ZPH0Mp5Kyg@mail.gmail.com>
 <CAPj87rOoVtc5dC12bBU+j6tdxHLh8fWGsPiemThBrY-=TjMx7Q@mail.gmail.com>
User-Agent: AquaMail/1.29.2-1810 (build: 102900008)
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="179ac18afbe5b02817ce59f7"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--179ac18afbe5b02817ce59f7
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On May 26, 2021 13:15:08 Daniel Stone <daniel@fooishbar.org> wrote:

> Hey,
>
> On Wed, 26 May 2021 at 16:24, Jason Ekstrand <jason@jlekstrand.net> wrote:
>> On Wed, May 26, 2021 at 6:09 AM Daniel Stone <daniel@fooishbar.org> wrote:
>>> Typing out the Wayland protocol isn't the hard bit. If we just need to
>>> copy and sed syncobj to weirdsyncobj, no problem really, and it gives
>>> us a six-month head start on painful compositor-internal surgery
>>> whilst we work on common infrastructure to ship userspace fences
>>> around (mappable dmabuf with the sync bracketing? FD where every
>>> read() gives you the current value? memfd? other?).
>>
>> I feel like I should elaborate more about timelines.  In my earlier
>> reply, my commentary about timeline syncobj was mostly focused around
>> helping people avoid typing.  That's not really the full story,
>> though, and I hope more context will help.
>>
>> First, let me say that timeline syncobj was designed as a mechanism to
>> implement VK_KHR_timeline_semaphore without inserting future fences
>> into the kernel.  It's entirely designed around the needs of Vulkan
>> drivers, not really as a window-system primitive.  The semantics are
>> designed around one driver communicating to another that new fences
>> have been added and it's safe to kick off more rendering.  I'm not
>> convinced that it's the right object for window-systems and I'm also
>> not convinced that it's a good idea to try and make a version of it
>> that's a wrapper around a userspace memory fence.  (I'm going to start
>> typing UMF for userspace memory fence because it's long to type out.)
>>
>> Why?  Well, the fundamental problem with timelines in general is
>> trying to figure out when it's about to be done.  But timeline syncobj
>> solves this for us!  It gives us this fancy super-useful ioctl!
>> Right?  Uh.... not as well as I'd like.  Let's say we make a timeline
>> syncobj that's a wrapper around a userspace memory fence.  What do we
>> do with that ioctl?  As I mentioned above, the kernel doesn't have any
>> clue when it will be triggered so that ioctl turns into an actual
>> wait.  That's no good because it creates unnecessary stalls.
>
> Yeah, I'm assuming that UMF will be a separate primitive. No problem.
> I also think that your submitted/completed thing is a non-problem: at
> this stage we're just throwing up our hands and admitting that we're
> letting userspace tie itself in knots, and giving it the tools to tie
> a sufficiently un-streetwise compositor in knots too. We're already
> crossing that Rubicon, so let's just embrace it and not try to design
> it out. Us compositors can handle the scheduling, really.

Ok, good. I think we're on the same page.

>
>> There's another potential solution here:  Have each UMF be two
>> timelines: submitted and completed.  At the start of every batch
>> that's supposed to trigger a UMF, we set the "submitted" side and
>> then, when it completes, we set the "completed" side.  Ok, great, now
>> we can get at the "about to be done" with the submitted side,
>> implement the ioctl, and we're all good, right?  Sadly, no.  There's
>> no guarantee about how long a "batch" takes.  So there's no universal
>> timeout the kernel can apply.  Also, if it does time out, the kernel
>> doesn't know who to blame for the timeout and how to prevent itself
>> from getting in trouble again.  The compositor does so, in theory,
>> given the right ioctls, it could detect the -ETIME and kill that
>> client.  Not a great solution.
>>
>> The best option I've been able to come up with for this is some sort
>> of client-provided signal.  Something where it says, as part of submit
>> or somewhere else, "I promise I'll be done soon" where that promise
>> comes with dire consequences if it's not.  At that point, we can turn
>> the UMF and a particular wait value into a one-shot fence like a
>> dma_fence or sync_file, or signal a syncobj on it.  If it ever times
>> out, we kick their context.  In Vulkan terminology, they get
>> VK_ERROR_DEVICE_LOST.  There are two important bits here:  First, is
>> that it's based on a client-provided thing.  With a fully timeline
>> model and wait-before-signal, we can't infer when something is about
>> to be done.  Only the client knows when it submitted its last node in
>> the dependency graph and the whole mess is unblocked.  Second, is that
>> the dma_fence is created within the client's driver context.  If it's
>> created compositor-side, the kernel doesn't know who to blame if
>> things go badly.  If we create it in the client, it's pretty easy to
>> make context death on -ETIME part of the contract.
>>
>> (Before danvet jumps in here and rants about how UMF -> dma_fence
>> isn't possible, I haven't forgotten.  I'm pretending, for now, that
>> we've solved some of those problems.)
>
> Funny how we've come full circle to the original proposal here ...
>
> If we really want a kernel primitive for this - and I think it's a
> good idea, since can help surface 'badness' in a way which is
> observable by e.g. session managers in a way analogous to cgroup stats
> and controls - how about this for a counter-proposal? Client exports a
> FD for its context/queue and sends it to winsys as part of setup,
> compositor can ioctl() on that to kill it, which lands in the same
> zap/zap/zap/zap/ban codepath as GPU hangs do today. It's a bigger
> hammer than per-sync-point primitives, but you as a client have to
> accept the social contract that if you want to participate in a
> session, your context has to be making forward progress and you aren't
> writing cheques the compositor can't cash.

The compositor already has that. It can kick the client's Wayland protocol 
connection. Banning the context from the kernel might be nice too but 
kicking it is probably sufficient.

Side-note to danvet: Do we need a plan for UMF with persistent contexts? My 
gut says that's a very bad idea but this made me think I should say least 
pose the question.

> I'm also going to pre-emptively agree with other-Dan; I'm extremely
> wary of anything which tries to make UMF look even a little bit like
> sync_file. The requirements to support them are so wildly different
> that I'd almost rather a totally orthogonal interface so that there's
> no danger of confusing the two. Us sophisticates on this thread can
> eat the mild annoyance of typing out separate codepaths, but it's much
> worse for anyone else who may look at a UMF wolf in dma_fence sheep's
> clothing then only later be substantially more annoyed when they
> realise that it's not anything like they thought it was.
>
> So let's keep sync_file for what it is, and for UMF since the usage is
> so radically different, build out whatever we do around making the
> uAPI as useful as possible for what we want to do with it. The real
> complexity in handling the difference between UMF and 'real' fences is
> in how they behave, not in how they look.

Sounds good.

>
>> Another option is to just stall on the UMF until it's done.  Yeah,
>> kind-of terrible and high-latency, but it always works and doesn't
>> involve any complex logic to kill clients.  If a client never gets
>> around to signaling a fence, it just never repaints.  The compositor
>> keeps going like nothing's wrong.  Maybe, if the client submits lots
>> of frames without ever triggering, it'll hit some max queue depth
>> somewhere and kill it but that's it.  More likely, the client's
>> vkAcquireNextImage will start timing out and it'll crash.
>>
>> I suspect where we might actually land is some combination of the two
>> depending on client choice.  If the client wants to be dumb, it gets
>> the high-latency always-works path.  If the client really wants
>> lowest-latency VRR, it has to take the smarter path and risk
>> VK_ERROR_DEVICE_LOST if it misses too far.
>
> We already have to handle unresponsive clients. If your browser
> livelocks today (say because it's Chrome and you hotunplug your
> monitor at the wrong time with active media playback in an inactive
> tab in an inactive window ... hypothetically),

That's an oddly specific hypothetical...

> yourr Wayland server
> notices that it isn't responding to pings, throws up the 'do you want
> to force-quit?' dialog and kills the client; it's actually really
> simple logic. So we just hook unsignaled fences up to the same. (And,
> if we have the context-kill primitive, trigger that on our way out.)
>
> So yeah, we already have all the complexity points to put particular
> surface trees in limbo (thanks to subsurface sync mode), we already
> have all the complexity points to separate realised surface trees from
> pixels on screen, and we already have the complexity points for
> different parts of the surface trees being rendered at different
> times. Checking on fence progression is just a little more typing
> around those interface points which already exist, and zapping clients
> is utterly trivial.

👍

>
>> But the point of all of this is, neither of the above two paths have
>> anything to do with the compositor calling a "wait for submit" ioctl.
>> Building a design around that and baking it into protocol is, IMO, a
>> mistake.  I don't see any valid way to handle this mess without "wait
>> for sumbit" either not existing or existing only client-side for the
>> purposes of WSI.
>
> I'm still on the fence (sorry) about a wait-before-submit ioctl. For
> the sync_file-based timeline syncobjs that we have today, yes it is
> helpful, and we do already have it, it's just the wrong shape in being
> sleep rather than epoll.

I still don't see why we're still talking about timeline syncobj...

> For UMF, taking it as a given that the kernel really has no visibility
> at all into syncpoint progress, then the kernel is conceptually a
> worse place to spin-sleep than userspace is, because why account the
> CPU burn to a kthread rather than a real PID, and lose
> latency/efficiency on context switches when you do wake up?
>
> But also, the kernel is conceptually the best place to spin-sleep,
> because it can fuse waits and do better wakeup quantisation than
> userspace can. And I'm still hopeful that the IHVs and Windows can
> both step away from the postmodern 'synchronisation doesn't mean
> anything anymore, just poll in a lap-burning loop' approach that we've
> been presented (sorry) with, where we at least get doorbells which
> allow the kernel to do polling much smarter than quantising timers
> ('this fence might not have triggered yet, but _something_ happened
> which might have triggered it so why not check?').

I think we can and do do something better than just poll on the memory. I'm 
not sure on the details but I've been told that we can set some sort of 
interrupt-like thing on the address so it's not actually a spin. Even 
without that, done hardware has some way that a command buffer can trigger 
an interrupt. If the protocol is to write memory and then trigger an 
interrupt rather than just write memory, that gives us something if a 
doorbell. Not as convenient, maybe, but it'd help with power consumption, etc.

--Jason

> On the other other hand, the only winsys case for burning poll in a
> tight loop is flipping as quickly as possible straight to a VRR
> display. In that case, you're definitely running on mains power so
> you're just melting the polar ice caps rather than your lap, and
> you've got everything fully lit up anyway so the power cost of polling
> is immaterial. For FRR, the compositor already has a fixed deadline at
> which it will wake up and make a hard binding decision about which
> image to present - this includes XR as well. So we don't have to worry
> about optimising a polling loop, because there isn't one: we wake up
> once, we check once, and if the client's missed then too bad, try
> again next frame.
>
> As you can see, much like userspace memory fences, my position on
> which way to go here is not knowable upfront, and depends on when
> exactly you observe it. Hopefully someone can come back with an
> argument compelling enough either way that I have something better to
> do than to try to pun my way out of having more hands than Ganesh. I
> don't think it's material to the design or implementation of winsys
> support though.
>
> Cheers,
> Daniel


--179ac18afbe5b02817ce59f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On May 26, 2021 13:15:08=
 Daniel Stone &lt;daniel@fooishbar.org&gt; wrote:</span></div><div id=3D"aq=
m-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hey,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Wed, 26 May 2021 at 16:24, Jason Ekstrand &lt;jason@jl=
ekstrand.net&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">On Wed, May 26, 2021 at 6:09 AM Daniel Stone &lt;daniel@f=
ooishbar.org&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto">Typing out the Wayland protocol isn't the hard bit. If we=
 just need to</div>
<div dir=3D"auto">copy and sed syncobj to weirdsyncobj, no problem really, =
and it gives</div>
<div dir=3D"auto">us a six-month head start on painful compositor-internal =
surgery</div>
<div dir=3D"auto">whilst we work on common infrastructure to ship userspace=
 fences</div>
<div dir=3D"auto">around (mappable dmabuf with the sync bracketing? FD wher=
e every</div>
<div dir=3D"auto">read() gives you the current value? memfd? other?).</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I feel like I should elaborate more about timelines. &nbs=
p;In my earlier</div>
<div dir=3D"auto">reply, my commentary about timeline syncobj was mostly fo=
cused around</div>
<div dir=3D"auto">helping people avoid typing. &nbsp;That's not really the =
full story,</div>
<div dir=3D"auto">though, and I hope more context will help.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">First, let me say that timeline syncobj was designed as a=
 mechanism to</div>
<div dir=3D"auto">implement VK_KHR_timeline_semaphore without inserting fut=
ure fences</div>
<div dir=3D"auto">into the kernel. &nbsp;It's entirely designed around the =
needs of Vulkan</div>
<div dir=3D"auto">drivers, not really as a window-system primitive. &nbsp;T=
he semantics are</div>
<div dir=3D"auto">designed around one driver communicating to another that =
new fences</div>
<div dir=3D"auto">have been added and it's safe to kick off more rendering.=
 &nbsp;I'm not</div>
<div dir=3D"auto">convinced that it's the right object for window-systems a=
nd I'm also</div>
<div dir=3D"auto">not convinced that it's a good idea to try and make a ver=
sion of it</div>
<div dir=3D"auto">that's a wrapper around a userspace memory fence. &nbsp;(=
I'm going to start</div>
<div dir=3D"auto">typing UMF for userspace memory fence because it's long t=
o type out.)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Why? &nbsp;Well, the fundamental problem with timelines i=
n general is</div>
<div dir=3D"auto">trying to figure out when it's about to be done. &nbsp;Bu=
t timeline syncobj</div>
<div dir=3D"auto">solves this for us! &nbsp;It gives us this fancy super-us=
eful ioctl!</div>
<div dir=3D"auto">Right? &nbsp;Uh.... not as well as I'd like. &nbsp;Let's =
say we make a timeline</div>
<div dir=3D"auto">syncobj that's a wrapper around a userspace memory fence.=
 &nbsp;What do we</div>
<div dir=3D"auto">do with that ioctl? &nbsp;As I mentioned above, the kerne=
l doesn't have any</div>
<div dir=3D"auto">clue when it will be triggered so that ioctl turns into a=
n actual</div>
<div dir=3D"auto">wait. &nbsp;That's no good because it creates unnecessary=
 stalls.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Yeah, I'm assuming that UMF will be a separate primitive.=
 No problem.</div>
<div dir=3D"auto">I also think that your submitted/completed thing is a non=
-problem: at</div>
<div dir=3D"auto">this stage we're just throwing up our hands and admitting=
 that we're</div>
<div dir=3D"auto">letting userspace tie itself in knots, and giving it the =
tools to tie</div>
<div dir=3D"auto">a sufficiently un-streetwise compositor in knots too. We'=
re already</div>
<div dir=3D"auto">crossing that Rubicon, so let's just embrace it and not t=
ry to design</div>
<div dir=3D"auto">it out. Us compositors can handle the scheduling, really.=
</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ok, =
good. I think we're on the same page.</div><div dir=3D"auto"><br></div><div=
 id=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquote type=
=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left:=
 1px solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">There's another potential solution here: &nbsp;Have each =
UMF be two</div>
<div dir=3D"auto">timelines: submitted and completed. &nbsp;At the start of=
 every batch</div>
<div dir=3D"auto">that's supposed to trigger a UMF, we set the "submitted" =
side and</div>
<div dir=3D"auto">then, when it completes, we set the "completed" side. &nb=
sp;Ok, great, now</div>
<div dir=3D"auto">we can get at the "about to be done" with the submitted s=
ide,</div>
<div dir=3D"auto">implement the ioctl, and we're all good, right? &nbsp;Sad=
ly, no. &nbsp;There's</div>
<div dir=3D"auto">no guarantee about how long a "batch" takes. &nbsp;So the=
re's no universal</div>
<div dir=3D"auto">timeout the kernel can apply. &nbsp;Also, if it does time=
 out, the kernel</div>
<div dir=3D"auto">doesn't know who to blame for the timeout and how to prev=
ent itself</div>
<div dir=3D"auto">from getting in trouble again. &nbsp;The compositor does =
so, in theory,</div>
<div dir=3D"auto">given the right ioctls, it could detect the -ETIME and ki=
ll that</div>
<div dir=3D"auto">client. &nbsp;Not a great solution.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The best option I've been able to come up with for this i=
s some sort</div>
<div dir=3D"auto">of client-provided signal. &nbsp;Something where it says,=
 as part of submit</div>
<div dir=3D"auto">or somewhere else, "I promise I'll be done soon" where th=
at promise</div>
<div dir=3D"auto">comes with dire consequences if it's not. &nbsp;At that p=
oint, we can turn</div>
<div dir=3D"auto">the UMF and a particular wait value into a one-shot fence=
 like a</div>
<div dir=3D"auto">dma_fence or sync_file, or signal a syncobj on it. &nbsp;=
If it ever times</div>
<div dir=3D"auto">out, we kick their context. &nbsp;In Vulkan terminology, =
they get</div>
<div dir=3D"auto">VK_ERROR_DEVICE_LOST. &nbsp;There are two important bits =
here: &nbsp;First, is</div>
<div dir=3D"auto">that it's based on a client-provided thing. &nbsp;With a =
fully timeline</div>
<div dir=3D"auto">model and wait-before-signal, we can't infer when somethi=
ng is about</div>
<div dir=3D"auto">to be done. &nbsp;Only the client knows when it submitted=
 its last node in</div>
<div dir=3D"auto">the dependency graph and the whole mess is unblocked. &nb=
sp;Second, is that</div>
<div dir=3D"auto">the dma_fence is created within the client's driver conte=
xt. &nbsp;If it's</div>
<div dir=3D"auto">created compositor-side, the kernel doesn't know who to b=
lame if</div>
<div dir=3D"auto">things go badly. &nbsp;If we create it in the client, it'=
s pretty easy to</div>
<div dir=3D"auto">make context death on -ETIME part of the contract.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">(Before danvet jumps in here and rants about how UMF -&gt=
; dma_fence</div>
<div dir=3D"auto">isn't possible, I haven't forgotten. &nbsp;I'm pretending=
, for now, that</div>
<div dir=3D"auto">we've solved some of those problems.)</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Funny how we've come full circle to the original proposal=
 here ...</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">If we really want a kernel primitive for this - and I thi=
nk it's a</div>
<div dir=3D"auto">good idea, since can help surface 'badness' in a way whic=
h is</div>
<div dir=3D"auto">observable by e.g. session managers in a way analogous to=
 cgroup stats</div>
<div dir=3D"auto">and controls - how about this for a counter-proposal? Cli=
ent exports a</div>
<div dir=3D"auto">FD for its context/queue and sends it to winsys as part o=
f setup,</div>
<div dir=3D"auto">compositor can ioctl() on that to kill it, which lands in=
 the same</div>
<div dir=3D"auto">zap/zap/zap/zap/ban codepath as GPU hangs do today. It's =
a bigger</div>
<div dir=3D"auto">hammer than per-sync-point primitives, but you as a clien=
t have to</div>
<div dir=3D"auto">accept the social contract that if you want to participat=
e in a</div>
<div dir=3D"auto">session, your context has to be making forward progress a=
nd you aren't</div>
<div dir=3D"auto">writing cheques the compositor can't cash.</div></blockqu=
ote></div><div dir=3D"auto"><br></div><div dir=3D"auto">The compositor alre=
ady has that. It can kick the client's Wayland protocol connection. Banning=
 the context from the kernel might be nice too but kicking it is probably s=
ufficient.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Side-note to =
danvet: Do we need a plan for UMF with persistent contexts? My gut says tha=
t's a very bad idea but this made me think I should say least pose the ques=
tion.</div><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"co=
lor: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" s=
tyle=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left:=
 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">I'm also going to pre-emptively agree with other-Dan; I'm=
 extremely</div>
<div dir=3D"auto">wary of anything which tries to make UMF look even a litt=
le bit like</div>
<div dir=3D"auto">sync_file. The requirements to support them are so wildly=
 different</div>
<div dir=3D"auto">that I'd almost rather a totally orthogonal interface so =
that there's</div>
<div dir=3D"auto">no danger of confusing the two. Us sophisticates on this =
thread can</div>
<div dir=3D"auto">eat the mild annoyance of typing out separate codepaths, =
but it's much</div>
<div dir=3D"auto">worse for anyone else who may look at a UMF wolf in dma_f=
ence sheep's</div>
<div dir=3D"auto">clothing then only later be substantially more annoyed wh=
en they</div>
<div dir=3D"auto">realise that it's not anything like they thought it was.<=
/div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">So let's keep sync_file for what it is, and for UMF since=
 the usage is</div>
<div dir=3D"auto">so radically different, build out whatever we do around m=
aking the</div>
<div dir=3D"auto">uAPI as useful as possible for what we want to do with it=
. The real</div>
<div dir=3D"auto">complexity in handling the difference between UMF and 're=
al' fences is</div>
<div dir=3D"auto">in how they behave, not in how they look.</div></blockquo=
te></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sounds good.</div><d=
iv dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: black;" =
dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;"><di=
v dir=3D"auto"></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Another option is to just stall on the UMF until it's don=
e. &nbsp;Yeah,</div>
<div dir=3D"auto">kind-of terrible and high-latency, but it always works an=
d doesn't</div>
<div dir=3D"auto">involve any complex logic to kill clients. &nbsp;If a cli=
ent never gets</div>
<div dir=3D"auto">around to signaling a fence, it just never repaints. &nbs=
p;The compositor</div>
<div dir=3D"auto">keeps going like nothing's wrong. &nbsp;Maybe, if the cli=
ent submits lots</div>
<div dir=3D"auto">of frames without ever triggering, it'll hit some max que=
ue depth</div>
<div dir=3D"auto">somewhere and kill it but that's it. &nbsp;More likely, t=
he client's</div>
<div dir=3D"auto">vkAcquireNextImage will start timing out and it'll crash.=
</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I suspect where we might actually land is some combinatio=
n of the two</div>
<div dir=3D"auto">depending on client choice. &nbsp;If the client wants to =
be dumb, it gets</div>
<div dir=3D"auto">the high-latency always-works path. &nbsp;If the client r=
eally wants</div>
<div dir=3D"auto">lowest-latency VRR, it has to take the smarter path and r=
isk</div>
<div dir=3D"auto">VK_ERROR_DEVICE_LOST if it misses too far.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">We already have to handle unresponsive clients. If your b=
rowser</div>
<div dir=3D"auto">livelocks today (say because it's Chrome and you hotunplu=
g your</div>
<div dir=3D"auto">monitor at the wrong time with active media playback in a=
n inactive</div>
<div dir=3D"auto">tab in an inactive window ... hypothetically), </div></bl=
ockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">That's an oddl=
y specific hypothetical...</div><div dir=3D"auto"><br></div><div id=3D"aqm-=
original" style=3D"color: black;" dir=3D"auto"><blockquote type=3D"cite" cl=
ass=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #=
808080; padding-left: 0.75ex;"><div dir=3D"auto">yourr Wayland server</div>
<div dir=3D"auto">notices that it isn't responding to pings, throws up the =
'do you want</div>
<div dir=3D"auto">to force-quit?' dialog and kills the client; it's actuall=
y really</div>
<div dir=3D"auto">simple logic. So we just hook unsignaled fences up to the=
 same. (And,</div>
<div dir=3D"auto">if we have the context-kill primitive, trigger that on ou=
r way out.)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">So yeah, we already have all the complexity points to put=
 particular</div>
<div dir=3D"auto">surface trees in limbo (thanks to subsurface sync mode), =
we already</div>
<div dir=3D"auto">have all the complexity points to separate realised surfa=
ce trees from</div>
<div dir=3D"auto">pixels on screen, and we already have the complexity poin=
ts for</div>
<div dir=3D"auto">different parts of the surface trees being rendered at di=
fferent</div>
<div dir=3D"auto">times. Checking on fence progression is just a little mor=
e typing</div>
<div dir=3D"auto">around those interface points which already exist, and za=
pping clients</div>
<div dir=3D"auto">is utterly trivial.</div></blockquote></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">=F0=9F=91=8D</div><div dir=3D"auto"><br></=
div><div id=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquo=
te type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; borde=
r-left: 1px solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">But the point of all of this is, neither of the above two=
 paths have</div>
<div dir=3D"auto">anything to do with the compositor calling a "wait for su=
bmit" ioctl.</div>
<div dir=3D"auto">Building a design around that and baking it into protocol=
 is, IMO, a</div>
<div dir=3D"auto">mistake. &nbsp;I don't see any valid way to handle this m=
ess without "wait</div>
<div dir=3D"auto">for sumbit" either not existing or existing only client-s=
ide for the</div>
<div dir=3D"auto">purposes of WSI.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I'm still on the fence (sorry) about a wait-before-submit=
 ioctl. For</div>
<div dir=3D"auto">the sync_file-based timeline syncobjs that we have today,=
 yes it is</div>
<div dir=3D"auto">helpful, and we do already have it, it's just the wrong s=
hape in being</div>
<div dir=3D"auto">sleep rather than epoll.</div></blockquote></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I still don't see why we're still tal=
king about timeline syncobj...</div><div dir=3D"auto"><br></div><div id=3D"=
aqm-original" style=3D"color: black;" dir=3D"auto"><blockquote type=3D"cite=
" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px sol=
id #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">For UMF, taking it as a given that the kernel really has =
no visibility</div>
<div dir=3D"auto">at all into syncpoint progress, then the kernel is concep=
tually a</div>
<div dir=3D"auto">worse place to spin-sleep than userspace is, because why =
account the</div>
<div dir=3D"auto">CPU burn to a kthread rather than a real PID, and lose</d=
iv>
<div dir=3D"auto">latency/efficiency on context switches when you do wake u=
p?</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">But also, the kernel is conceptually the best place to sp=
in-sleep,</div>
<div dir=3D"auto">because it can fuse waits and do better wakeup quantisati=
on than</div>
<div dir=3D"auto">userspace can. And I'm still hopeful that the IHVs and Wi=
ndows can</div>
<div dir=3D"auto">both step away from the postmodern 'synchronisation doesn=
't mean</div>
<div dir=3D"auto">anything anymore, just poll in a lap-burning loop' approa=
ch that we've</div>
<div dir=3D"auto">been presented (sorry) with, where we at least get doorbe=
lls which</div>
<div dir=3D"auto">allow the kernel to do polling much smarter than quantisi=
ng timers</div>
<div dir=3D"auto">('this fence might not have triggered yet, but _something=
_ happened</div>
<div dir=3D"auto">which might have triggered it so why not check?').</div><=
/blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">I think we =
can and do do something better than just poll on the memory. I'm not sure o=
n the details but I've been told that we can set some sort of interrupt-lik=
e thing on the address so it's not actually a spin. Even without that, done=
 hardware has some way that a command buffer can trigger an interrupt. If t=
he protocol is to write memory and then trigger an interrupt rather than ju=
st write memory, that gives us something if a doorbell. Not as convenient, =
maybe, but it'd help with power consumption, etc.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">--Jason</div><div dir=3D"auto"><br></div><div id=
=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquote type=3D"=
cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px=
 solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">On the other other hand, the only winsys case for burning=
 poll in a</div>
<div dir=3D"auto">tight loop is flipping as quickly as possible straight to=
 a VRR</div>
<div dir=3D"auto">display. In that case, you're definitely running on mains=
 power so</div>
<div dir=3D"auto">you're just melting the polar ice caps rather than your l=
ap, and</div>
<div dir=3D"auto">you've got everything fully lit up anyway so the power co=
st of polling</div>
<div dir=3D"auto">is immaterial. For FRR, the compositor already has a fixe=
d deadline at</div>
<div dir=3D"auto">which it will wake up and make a hard binding decision ab=
out which</div>
<div dir=3D"auto">image to present - this includes XR as well. So we don't =
have to worry</div>
<div dir=3D"auto">about optimising a polling loop, because there isn't one:=
 we wake up</div>
<div dir=3D"auto">once, we check once, and if the client's missed then too =
bad, try</div>
<div dir=3D"auto">again next frame.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">As you can see, much like userspace memory fences, my pos=
ition on</div>
<div dir=3D"auto">which way to go here is not knowable upfront, and depends=
 on when</div>
<div dir=3D"auto">exactly you observe it. Hopefully someone can come back w=
ith an</div>
<div dir=3D"auto">argument compelling enough either way that I have somethi=
ng better to</div>
<div dir=3D"auto">do than to try to pun my way out of having more hands tha=
n Ganesh. I</div>
<div dir=3D"auto">don't think it's material to the design or implementation=
 of winsys</div>
<div dir=3D"auto">support though.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Cheers,</div>
<div dir=3D"auto">Daniel</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--179ac18afbe5b02817ce59f7--

