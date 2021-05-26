Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839C391ED3
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 20:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364866E432;
	Wed, 26 May 2021 18:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0076E432
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 18:15:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so1045262wmg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=haDkDjPrltfPNps2BZua7W3WH9Lq1f9vtrTF/cvH8Rc=;
 b=SBy3NmgbzpzKKJc1JLvFGNPoKiCTEVvMoRMSFAduWqPe5asKoI+HGGhV+tUXu+a0md
 aDfghNKNQfcnc0bLnZXGWvcsrbzA/44BwyaBf7tW4JHNvv9kpvC/TV3X3+VghRCeQIlU
 iFD3taOG7kh88jxIdRGd/Rab1Ac5Y+im55f0ssWn5nwMc+Ju+0CQ0XbQp64fR8/ry30F
 +sU4Krk35gkA0nEKKutxmJdw5KYh6Azy6LxiiLserV04hAMtL35ohxfiiOGrnky7SlDV
 1rnqPyHHX6o2ZSHUIwreYIuEES/I7+dZJj5pjTaz7yTIyGexEiwmLKuWpwSxu2iqRyGp
 KfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=haDkDjPrltfPNps2BZua7W3WH9Lq1f9vtrTF/cvH8Rc=;
 b=KpKiIRbmHmrpExABTbFTA3VXUyMhae3QsSVdPZ8Fl1oUlB1Y8Dombg+zUx2Ljc6eE4
 6GP1IbqQZ4/a4qC4LcrlhNwphcQ3pNTqz9x+YGr/3XxycByROXQz0HwSRsrA9T10Rvji
 QaZ/uLXpk613iVNKgyO6NHPXDXqWTw3FMdqmDXLQNRkZ4m8MBYHz3rnFV2qgRjgH2d88
 5HYPjkG7acQl3iKvQElvg1ULO7yymtAh3yFjfhXKg7hVo/aiiFfadhl/seKIjqxahIQK
 5DbJzxOKDjfyufbVhBiXK3iwaMHbrbSCIXT+1QVVUi0uz9xB/2VzUpqJKO9ynD5g3BRE
 BHiw==
X-Gm-Message-State: AOAM530equEyolIDKCN55SBcjjvHvf7UhQXuF+iV5u7t17cP6IqlT06A
 jMPfYJusp7PSRMquTBALSrGoNHqZ70r4sAxoFiRwog==
X-Google-Smtp-Source: ABdhPJzqQz8/TZY/5e6kDfdNQrClMEiYImBFYXFfi+Zq5QtrVKHQ3M24t2oqIDKQz94jaHoNIlOyiWHbQjO9kSc8pog=
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr4811882wmp.98.1622052906347; 
 Wed, 26 May 2021 11:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAOFGe95TZRw=ZpSwOKpwcxkxP_JRmEXpJn_26OS2ZPH0Mp5Kyg@mail.gmail.com>
In-Reply-To: <CAOFGe95TZRw=ZpSwOKpwcxkxP_JRmEXpJn_26OS2ZPH0Mp5Kyg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 19:14:54 +0100
Message-ID: <CAPj87rOoVtc5dC12bBU+j6tdxHLh8fWGsPiemThBrY-=TjMx7Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="UTF-8"
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On Wed, 26 May 2021 at 16:24, Jason Ekstrand <jason@jlekstrand.net> wrote:
> On Wed, May 26, 2021 at 6:09 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > Typing out the Wayland protocol isn't the hard bit. If we just need to
> > copy and sed syncobj to weirdsyncobj, no problem really, and it gives
> > us a six-month head start on painful compositor-internal surgery
> > whilst we work on common infrastructure to ship userspace fences
> > around (mappable dmabuf with the sync bracketing? FD where every
> > read() gives you the current value? memfd? other?).
>
> I feel like I should elaborate more about timelines.  In my earlier
> reply, my commentary about timeline syncobj was mostly focused around
> helping people avoid typing.  That's not really the full story,
> though, and I hope more context will help.
>
> First, let me say that timeline syncobj was designed as a mechanism to
> implement VK_KHR_timeline_semaphore without inserting future fences
> into the kernel.  It's entirely designed around the needs of Vulkan
> drivers, not really as a window-system primitive.  The semantics are
> designed around one driver communicating to another that new fences
> have been added and it's safe to kick off more rendering.  I'm not
> convinced that it's the right object for window-systems and I'm also
> not convinced that it's a good idea to try and make a version of it
> that's a wrapper around a userspace memory fence.  (I'm going to start
> typing UMF for userspace memory fence because it's long to type out.)
>
> Why?  Well, the fundamental problem with timelines in general is
> trying to figure out when it's about to be done.  But timeline syncobj
> solves this for us!  It gives us this fancy super-useful ioctl!
> Right?  Uh.... not as well as I'd like.  Let's say we make a timeline
> syncobj that's a wrapper around a userspace memory fence.  What do we
> do with that ioctl?  As I mentioned above, the kernel doesn't have any
> clue when it will be triggered so that ioctl turns into an actual
> wait.  That's no good because it creates unnecessary stalls.

Yeah, I'm assuming that UMF will be a separate primitive. No problem.
I also think that your submitted/completed thing is a non-problem: at
this stage we're just throwing up our hands and admitting that we're
letting userspace tie itself in knots, and giving it the tools to tie
a sufficiently un-streetwise compositor in knots too. We're already
crossing that Rubicon, so let's just embrace it and not try to design
it out. Us compositors can handle the scheduling, really.

> There's another potential solution here:  Have each UMF be two
> timelines: submitted and completed.  At the start of every batch
> that's supposed to trigger a UMF, we set the "submitted" side and
> then, when it completes, we set the "completed" side.  Ok, great, now
> we can get at the "about to be done" with the submitted side,
> implement the ioctl, and we're all good, right?  Sadly, no.  There's
> no guarantee about how long a "batch" takes.  So there's no universal
> timeout the kernel can apply.  Also, if it does time out, the kernel
> doesn't know who to blame for the timeout and how to prevent itself
> from getting in trouble again.  The compositor does so, in theory,
> given the right ioctls, it could detect the -ETIME and kill that
> client.  Not a great solution.
>
> The best option I've been able to come up with for this is some sort
> of client-provided signal.  Something where it says, as part of submit
> or somewhere else, "I promise I'll be done soon" where that promise
> comes with dire consequences if it's not.  At that point, we can turn
> the UMF and a particular wait value into a one-shot fence like a
> dma_fence or sync_file, or signal a syncobj on it.  If it ever times
> out, we kick their context.  In Vulkan terminology, they get
> VK_ERROR_DEVICE_LOST.  There are two important bits here:  First, is
> that it's based on a client-provided thing.  With a fully timeline
> model and wait-before-signal, we can't infer when something is about
> to be done.  Only the client knows when it submitted its last node in
> the dependency graph and the whole mess is unblocked.  Second, is that
> the dma_fence is created within the client's driver context.  If it's
> created compositor-side, the kernel doesn't know who to blame if
> things go badly.  If we create it in the client, it's pretty easy to
> make context death on -ETIME part of the contract.
>
> (Before danvet jumps in here and rants about how UMF -> dma_fence
> isn't possible, I haven't forgotten.  I'm pretending, for now, that
> we've solved some of those problems.)

Funny how we've come full circle to the original proposal here ...

If we really want a kernel primitive for this - and I think it's a
good idea, since can help surface 'badness' in a way which is
observable by e.g. session managers in a way analogous to cgroup stats
and controls - how about this for a counter-proposal? Client exports a
FD for its context/queue and sends it to winsys as part of setup,
compositor can ioctl() on that to kill it, which lands in the same
zap/zap/zap/zap/ban codepath as GPU hangs do today. It's a bigger
hammer than per-sync-point primitives, but you as a client have to
accept the social contract that if you want to participate in a
session, your context has to be making forward progress and you aren't
writing cheques the compositor can't cash.

I'm also going to pre-emptively agree with other-Dan; I'm extremely
wary of anything which tries to make UMF look even a little bit like
sync_file. The requirements to support them are so wildly different
that I'd almost rather a totally orthogonal interface so that there's
no danger of confusing the two. Us sophisticates on this thread can
eat the mild annoyance of typing out separate codepaths, but it's much
worse for anyone else who may look at a UMF wolf in dma_fence sheep's
clothing then only later be substantially more annoyed when they
realise that it's not anything like they thought it was.

So let's keep sync_file for what it is, and for UMF since the usage is
so radically different, build out whatever we do around making the
uAPI as useful as possible for what we want to do with it. The real
complexity in handling the difference between UMF and 'real' fences is
in how they behave, not in how they look.

> Another option is to just stall on the UMF until it's done.  Yeah,
> kind-of terrible and high-latency, but it always works and doesn't
> involve any complex logic to kill clients.  If a client never gets
> around to signaling a fence, it just never repaints.  The compositor
> keeps going like nothing's wrong.  Maybe, if the client submits lots
> of frames without ever triggering, it'll hit some max queue depth
> somewhere and kill it but that's it.  More likely, the client's
> vkAcquireNextImage will start timing out and it'll crash.
>
> I suspect where we might actually land is some combination of the two
> depending on client choice.  If the client wants to be dumb, it gets
> the high-latency always-works path.  If the client really wants
> lowest-latency VRR, it has to take the smarter path and risk
> VK_ERROR_DEVICE_LOST if it misses too far.

We already have to handle unresponsive clients. If your browser
livelocks today (say because it's Chrome and you hotunplug your
monitor at the wrong time with active media playback in an inactive
tab in an inactive window ... hypothetically), your Wayland server
notices that it isn't responding to pings, throws up the 'do you want
to force-quit?' dialog and kills the client; it's actually really
simple logic. So we just hook unsignaled fences up to the same. (And,
if we have the context-kill primitive, trigger that on our way out.)

So yeah, we already have all the complexity points to put particular
surface trees in limbo (thanks to subsurface sync mode), we already
have all the complexity points to separate realised surface trees from
pixels on screen, and we already have the complexity points for
different parts of the surface trees being rendered at different
times. Checking on fence progression is just a little more typing
around those interface points which already exist, and zapping clients
is utterly trivial.

> But the point of all of this is, neither of the above two paths have
> anything to do with the compositor calling a "wait for submit" ioctl.
> Building a design around that and baking it into protocol is, IMO, a
> mistake.  I don't see any valid way to handle this mess without "wait
> for sumbit" either not existing or existing only client-side for the
> purposes of WSI.

I'm still on the fence (sorry) about a wait-before-submit ioctl. For
the sync_file-based timeline syncobjs that we have today, yes it is
helpful, and we do already have it, it's just the wrong shape in being
sleep rather than epoll.

For UMF, taking it as a given that the kernel really has no visibility
at all into syncpoint progress, then the kernel is conceptually a
worse place to spin-sleep than userspace is, because why account the
CPU burn to a kthread rather than a real PID, and lose
latency/efficiency on context switches when you do wake up?

But also, the kernel is conceptually the best place to spin-sleep,
because it can fuse waits and do better wakeup quantisation than
userspace can. And I'm still hopeful that the IHVs and Windows can
both step away from the postmodern 'synchronisation doesn't mean
anything anymore, just poll in a lap-burning loop' approach that we've
been presented (sorry) with, where we at least get doorbells which
allow the kernel to do polling much smarter than quantising timers
('this fence might not have triggered yet, but _something_ happened
which might have triggered it so why not check?').

On the other other hand, the only winsys case for burning poll in a
tight loop is flipping as quickly as possible straight to a VRR
display. In that case, you're definitely running on mains power so
you're just melting the polar ice caps rather than your lap, and
you've got everything fully lit up anyway so the power cost of polling
is immaterial. For FRR, the compositor already has a fixed deadline at
which it will wake up and make a hard binding decision about which
image to present - this includes XR as well. So we don't have to worry
about optimising a polling loop, because there isn't one: we wake up
once, we check once, and if the client's missed then too bad, try
again next frame.

As you can see, much like userspace memory fences, my position on
which way to go here is not knowable upfront, and depends on when
exactly you observe it. Hopefully someone can come back with an
argument compelling enough either way that I have something better to
do than to try to pun my way out of having more hands than Ganesh. I
don't think it's material to the design or implementation of winsys
support though.

Cheers,
Daniel
