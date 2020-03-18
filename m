Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DAB1895E8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 07:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65096E870;
	Wed, 18 Mar 2020 06:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA2D6E86D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 06:35:11 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z3so12007502edq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 23:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avzVrZIf1wLUz+pG+uc67ZsrE+8uaVtP16+bPi4jkyo=;
 b=eR0KUqEM7U1L9kpP91LjCBdYPTGJyfXe1E7R7mQf+FblSrMDoBL8StMpl7S5MEHR/Y
 ACkhx0H5AQjP1WkNxyHmL+O5wrGTuQJ0W/AOR2woUcTXrExTEdYMm3APSD/K6OWxlH7K
 83OxEO+vpje/2M7spg/ZsJtADvmfPGtKmlFL2X6dn/+jMIqzXQAY/dvIyNcxpAUAlEL9
 z8JA3g47AUzPwyJmL4MZ4yFKXFHmCsi5+tKd4XJz5uKLbOEbs+Vp+6WY0wm0BhFGajyu
 dpu09/+m1MeqizJaKCTKxOWu/IR9kgpeRsma2nngyzff/FF3qs4wYiOmWu5ugjiIvl+t
 Hjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avzVrZIf1wLUz+pG+uc67ZsrE+8uaVtP16+bPi4jkyo=;
 b=LSCTlfLsgThQubRoln1VTRXIxP8n+s+FkAYqmYbY/PCmT8CTWENdPLsds5jEG+zdkz
 ntWcEJAG0BnwtTvb5VFlWMl7u4dwwqbJH2OFfK41s6LQsl5WoSoa2jS9BWaTdaMGkshW
 qRVAOoILRCJnfI5N1/bB7DKI/6LE7LtPj5gI4XEmbq6ceW0RjDKQee3H2/wX0IdlAv0o
 BtzwDTaQ8KfuCkFHuhCaJ3FfbuylId8NLWK7HwxHhKWyWgurXLVgpaqz/vuEKGJQqNvT
 wU1+vlKHm5D1s1s0wBycYe5SoPbunEXRpATmQVpN7kIufxgip7+1GWjPXfkwjjejZQfw
 N4bQ==
X-Gm-Message-State: ANhLgQ36pW+SEDitWl1UXqWblcmnVyRe+ylo5ZE3+1GF+ekHRHxpzOFl
 XT3ZozxSq59Bzi43GXZHq9H5BAA91KftI7UaTWyehQ==
X-Google-Smtp-Source: ADFU+vu55g7kA273IrMf2mncefNvZ0T7dPQRUCZ0sh3qUa6VEWGHUHcpctrA/5X/YVQ+sXIfN5f2akGGtQHRgDRjItM=
X-Received: by 2002:a17:906:d18e:: with SMTP id
 c14mr2761556ejz.120.1584513310044; 
 Tue, 17 Mar 2020 23:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
 <CAC2bXD6f2LiJ9_S0V8gZdrczRzH8oNqyLprzzFnGYTMzGe5gUQ@mail.gmail.com>
 <949b8373908a9895e97981e872d6e35dcaaba632.camel@lynxeye.de>
 <CAC2bXD5+KwBXBo-qHWkGw+=cH_AytwS=jeDGbskXcmO0rfsREw@mail.gmail.com>
 <CAOFGe94gmWZOA7sB0jDXoZyj=i1id25gR2-kX87GA+fB=AJ2RQ@mail.gmail.com>
 <CAC2bXD43ctzqg2O9yDgr2Hf0Q-RQ7bVtVvAJBXuX43gZwr=Nfw@mail.gmail.com>
In-Reply-To: <CAC2bXD43ctzqg2O9yDgr2Hf0Q-RQ7bVtVvAJBXuX43gZwr=Nfw@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 18 Mar 2020 01:34:58 -0500
Message-ID: <CAOFGe96Nbc8GoAWSby8awTsTQkywFa198hrjm-cRzfxEp6KfXQ@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: Jacob Lifshay <programmerjake@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 12:20 AM Jacob Lifshay <programmerjake@gmail.com> wrote:
>
> On Tue, Mar 17, 2020 at 7:08 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On Tue, Mar 17, 2020 at 7:16 PM Jacob Lifshay <programmerjake@gmail.com> wrote:
> > >
> > > On Tue, Mar 17, 2020 at 11:14 AM Lucas Stach <dev@lynxeye.de> wrote:
> > > >
> > > > Am Dienstag, den 17.03.2020, 10:59 -0700 schrieb Jacob Lifshay:
> > > > > I think I found a userspace-accessible way to create sync_files and
> > > > > dma_fences that would fulfill the requirements:
> > > > > https://github.com/torvalds/linux/blob/master/drivers/dma-buf/sw_sync.c
> > > > >
> > > > > I'm just not sure if that's a good interface to use, since it appears
> > > > > to be designed only for debugging. Will have to check for additional
> > > > > requirements of signalling an error when the process that created the
> > > > > fence is killed.
> >
> > It is expressly only for debugging and testing.  Exposing such an API
> > to userspace would break the finite time guarantees that are relied
> > upon to keep sync_file a secure API.
>
> Ok, I was figuring that was probably the case.
>
> > > > Something like that can certainly be lifted for general use if it makes
> > > > sense. But then with a software renderer I don't really see how fences
> > > > help you at all. With a software renderer you know exactly when the
> > > > frame is finished and you can just defer pushing it over to the next
> > > > pipeline element until that time. You won't gain any parallelism by
> > > > using fences as the CPU is busy doing the rendering and will not run
> > > > other stuff concurrently, right?
> > >
> > > There definitely may be other hardware and/or processes that can
> > > process some stuff concurrently with the main application, such as the
> > > compositor and or video encoding processes (for video capture).
> > > Additionally, from what I understand, sync_file is the standard way to
> > > export and import explicit synchronization between processes and
> > > between drivers on Linux, so it seems like a good idea to support it
> > > from an interoperability standpoint even if it turns out that there
> > > aren't any scheduling/timing benefits.
> >
> > There are different ways that one can handle interoperability,
> > however.  One way is to try and make the software rasterizer look as
> > much like a GPU as possible:  lots of threads to make things as
> > asynchronous as possible, "real" implementations of semaphores and
> > fences, etc.
>
> This is basically the route I've picked, though rather than making
> lots of native threads, I'm planning on having just one thread per
> core and have a work-stealing scheduler (inspired by Rust's rayon
> crate) schedule all the individual render/compute jobs, because that
> allows making a lot more jobs to allow finer load balancing.
>
> > Another is to let a SW rasterizer be a SW rasterizer: do
> > everything immediately, thread only so you can exercise all the CPU
> > cores, and minimally implement semaphores and fences well enough to
> > maintain compatibility.  If you take the first approach, then we have
> > to solve all these problems with letting userspace create unsignaled
> > sync_files which it will signal later and figure out how to make it
> > safe.  If you take the second approach, you'll only ever have to
> > return already signaled sync_files and there's no problem with the
> > sync_file finite time guarantees.
>
> The main issue with doing everything immediately is that a lot of the
> function calls that games expect to take a very short time (e.g.
> vkQueueSubmit) would instead take a much longer time, potentially
> causing problems.

Do you have any evidence that it will cause problems?  What I said
above is what switfshader is doing and they're running real apps and
I've not heard of it causing any problems.  It's also worth noting
that you would only really have to stall at sync_file export.  You can
async as much as you want internally.

> One idea for a safe userspace-backed sync_file is to have a step
> counter that counts down until the sync_file is ready, where if
> userspace doesn't tell it to count any steps in a certain amount of
> time, then the sync_file switches to the error state. This way, it
> will error shortly after a process deadlocks for some reason, while
> still having the finite-time guarantee.
>
> When the sync_file is created, the step counter would be set to the
> number of jobs that the fence is waiting on.
>
> It can also be set to pause the timeout to wait until another
> sync_file signals, to handle cases where a sync_file is waiting on a
> userspace process that is waiting on another sync_file.
>
> The main issue is that the kernel would have to make sure that the
> sync_file graph doesn't have loops, maybe by erroring all sync_files
> that it finds in the loop.
>
> Does that sound like a good idea?

Honestly, I don't think you'll ever be able to sell that to the kernel
community.  All of the deadlock detection would add massive complexity
to the already non-trivial dma_fence infrastructure and for what
benefit?  So that a software rasterizer can try to pretend to be more
like a GPU?  You're going to have some very serious perf numbers
and/or other proof of necessity if you want to convince the kernel to
people to accept that level of complexity/risk.  "I designed my
software to work this way" isn't going to convince anyone of anything
especially when literally every other software rasterizer I'm aware of
is immediate and they work just fine.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
