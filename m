Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497C97B1CD5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E43610E63A;
	Thu, 28 Sep 2023 12:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551C10E63A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 12:46:35 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-503056c8195so21322564e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695905194; x=1696509994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aKElrUVGthSSgr9siZwsz3d0DNjpbgp7UvFIWdutyWk=;
 b=PqKvggdmQyjorQ5uE60gpNAcr8vc/+ScGh7OniZ6FpppENOCXjyMBOHd4ZzGf9rowd
 l+LU70Os64XMRfYjE+ReH5JOJtXuqdJrCNuslEQcwYKk+o6w6oRTW57GhSvlCKpclI55
 C4DfyGCXMSduWhj2YNy57A5mEOLGQR4ymxaqTaYvks5wJf8lxbt3FSvKxAlgR8X+eA+X
 pxpLJSvlabdT1FPp3upGRCiAKMBTf6cbkeTD4+nAX88a6zxpjAFKCphHkm1BgVKL+fwS
 pMmNIA9rAjMyghqxrm8YhqVg2Oa+pIH53/69JN0tEeddW16m4EVUxYaIhTHwrvr0huGs
 vVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695905194; x=1696509994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aKElrUVGthSSgr9siZwsz3d0DNjpbgp7UvFIWdutyWk=;
 b=SR2Z5Ji9E4EScJPFbjmlPjNtfuoY/51hszt1/YV6LGXj5bN921Xv2vMOKKKCZxc/hK
 1smoWzB2BVpQEuiBKjXTAObAWEjs7YwK/G2hX1gCx8x5qvziYjlppIcQY7MzV4S6Gs8W
 kt5vR2D1Qs6fjrU7dYrzlRwCtdb28k7hv5giNUhNcykcEBJpbrhTtReo6UU/tn/ZnJfL
 bHYeTN6iQRgnX+84aDKzdCP/xB2+KIGYmTjlmekc19Dkcj1DpQbkXfeyVG+Ud9D625Wv
 qtcUSfm2GEez7YCpoBahT9NmQMn+UKw8AdsM0Tg49scnxeS8JKbO70KanoBntX5b6347
 q/zA==
X-Gm-Message-State: AOJu0Yy41BIwErnG0E/v4Z38fxSTrP1C/m0qeomMytmItVFKO/6Z+YCy
 kRTfFzWkOUAORNE9WPlId5o+gFHNybVOfgwMKVA=
X-Google-Smtp-Source: AGHT+IFdfWwx3VcSWNsZ/3fLiQc2l85jJGSV2J7mS941JQGJg7tp2cx9UnKe0O+w/3NSJpBTJJgGduil68SA82mXL7Y=
X-Received: by 2002:a19:7110:0:b0:502:9fce:b6da with SMTP id
 m16-20020a197110000000b005029fceb6damr903027lfc.21.1695905193200; Thu, 28 Sep
 2023 05:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
In-Reply-To: <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
From: Ray Strode <halfline@gmail.com>
Date: Thu, 28 Sep 2023 08:46:20 -0400
Message-ID: <CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 28, 2023 at 2:56=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> > To say the "whole point" is about CPU overhead accounting sounds
> > rather absurd to me. Is that really what you meant?
>
> Yes, absolutely. See the functionality you try to implement already exist=
s.

You say lower in this same message that you don't believe the
functionality actually works for the dpms off case I mentioned.

> After making a non blocking commit userspace can still wait on the
> commit to finish by looking at the out fence.

fences, not fence, fences. drmModeAtomicCommit works on multiple objects
at the same time. To follow the spirit of such an api, we would need a
separate fd allocated for each crtc and would have to wait on all of
them.  Surely you can see how that is much less straightforward than
using a blocking api. But mutter already uses non-blocking apis for the
lion's share of cases. It doesn't need fences for those cases, though,
because it can just use page flip events.

The main reason it uses blocking apis are for modesets and when doing
dpms off. The latter case you said you don't think can use fences, and
it certainly can't use page flip events.

So if you're right that fences can't be used for the dpms off case, it's
not workable answer. If you're wrong, and fences can be used for the
dpms off case, then it's a messy answer.

> A blocking system call in the sense of RLIMIT_RTTIME means something
> which results in the process listening for external events, e.g. calling
> select(), epoll() or read() on (for example) a network socket etc...
>
> As far as I can see drmAtomicCommit() is *not* meant with that what
> similar to for example yield() also doesn't reset the RLIMIT_RTTIME count=
er.
No no no, drmModeAtomicCommit() is not like sched_yield(). That's a
really strange thing to say (you do mean sched_yield() right?).
sched_yield() is an oddball because it's specifically for giving other
threads a turn if they need it without causing the current thread to
sleep if they don't.  It's a niche api that's meant for high performance
use cases. It's a way to reduce scheduling latency and increase running
time predictability.  drmModeAtomicCommit() using up rt time, busy
looping while waiting on the hardware to respond, eating into userspace
RLIMIT_RTTIME is nothing like that.

I'm getting the idea that you think there is some big bucket of kernel
syscalls that block for a large fraction of a second by design and are
not meant to reset RLIMIT_RTTIME. I could be wrong, but I don't think
that's true. Off the top of my head, the only ones I can think of that
might reasonably do that are futex() (which obviously can't sleep),
sched_yield() (who's whole point is to not sleep), and maybe a
some obscure ioctls (some probably legitimately, some probably
illegitimately and noone has noticed.). I'm willing to be proven wrong
here, and I might be, but right now from thinking about it, my guess is
the above list is pretty close to complete.

> Well you are breaking the RLIMIT_RTTIME functionality.
>
> The purpose of that functionality is to allow debugging and monitoring
> applications to make sure that they keep alive and can react to external
> signals.

I don't think you really thought through what you're saying here. It
just flatly doesn't apply for drmModeAtomicCommit. What is an
application supposed to do? It can't block the SIGKILL that's coming.
Respond to the preceding SIGXCPUs? What response could the application
possibly make? I'm guessing drmModeAtomicCommit isn't going to EINTR
because it's busy looping waiting on hardware in the process context.
And the kernel doesn't even guarantee SIGXCPU is going to go to the
thread with the stuck syscall, so even if there was a legitimate
response (or even "pthread_cancel" or some wreckless nonsense like
that), getting the notification to the right part of the program is an
exercise in gymnastics.

> From the RLIMIT_RTTIME documentation: "The intended use of this limit
> is to stop a runaway real-time process from locking up the system."
>
> And when drmAtomicCommit() is triggering this then we either have a
> problem with the application doing something it is not supposed to do
> (like blocking for vblank while it should listen to network traffic) or
> the driver is somehow buggy.

drmModeAtomicCommit() is used by display servers. If drmModeAtomicCommit
runs away in e.g. a set of 100ms busy loops responding to a confused or
slow responding GPU, the system will seemingly lock up to the user. That
is an intractable problem that we can not get away from. It doesn't
matter if the kernel is stuck in process context or on a workqueue. And,
regardless, it's not reasonable to expect userspace to craft elaborate
workarounds for driver bugs. We just have to fix the bugs.

> No when you disable everything there is of course no fence allocated.
Okay, so it's not actually an answer

> But then you also should never see anything waiting for to long to
> actually be able to trigger the RLIMIT_RTTIME.

But we do. That's the problem. That's like the whole problem. The amdgpu
driver thinks it's okay to do something like:

for_each_command_in_queue(&queue, command) {
        execute_command(command);
        while (1) {
                wait_for_response();

                if (delay++ > 100000)
                        break;
                udelay(1);
        }
}

or something like that. all while keeping the process in the RUNNABLE
state. It just seems wrong to me. At least let the userspace process
get scheduled out.

> > Regardless, this seems like a roundabout way to address a problem that
> > we could just ... fix.
>
> Well to make it clear: This is not a problem but intended behavior!

I'm going to be frank, I don't think this was intended behavior. We can
wait for sima to get off PTO and chime in, to know one way or the other
(or maybe airlied can chime in with his take?), but I doubt he was
thinking about realtime scheduling minutiae when he put together the
drmModeAtomicCommit implementation.

There's no practical reason for doing things the way they're being done
as far as I can tell.

--Ray
