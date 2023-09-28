Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BAF7B1F5D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 16:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8D310E010;
	Thu, 28 Sep 2023 14:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E1510E010
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 14:20:44 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5048156976cso4907594e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695910842; x=1696515642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4m/jG64PRfZJknuU9g8afk+2HIsV9MV3qzDFhW6g+M0=;
 b=gUbKUBixIdPEF7AqPtUEAjxhRWIckVHm5q7YkAIRIHkhB8HDldxQhmj1Z18wPaMLJc
 Das6dyWuh5hc7McrmrHOqpk0oAKYCaVrO7Y++Mk7qBXwh86s5gb/pzd7fYsT78q6KmMY
 9sPJ5IOK8G2RSwXVQcNs9h+bhNS8kP5zPhv38KI687ygQv2cezy0n4h94YXM0fVUnug0
 8Px/d6JOPvpxkh7Fh7MyQLBoxJ+xX957qHt7qME3UuP1QwJUgt0KsUgtd4v8Ml8mKTVJ
 E2AwlilbsqLEGLfjdUdR4HTXjos0KtzBJ/soz8VDzv9vqqPHRlyNkMD7mE9AxJkpAhjx
 JnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695910842; x=1696515642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4m/jG64PRfZJknuU9g8afk+2HIsV9MV3qzDFhW6g+M0=;
 b=LXdRVHjxNIgmml8GBYO528eHNQ+dqIT/P5lVtSwRxgrotwmEUWFXt7IRP0ny3ufiUK
 K1y4QnDNy+8EyPCj9ch6fEuUcI4R/ekflsm+2b23ee123ZEmS5WtDRO/LFeWN8AiREMA
 ITxbpXwZ34GpLMBRHMn2dA7vzvz7dKe7oDLzyLrD6XTUEqpEZms4737gVkmNIpq2Zj47
 yJXJbmTWQs6bcSMIMJv+LRYlVq/LsVodU+6cvkW9PJl321RzdkiHE8JrfWi23+FUDHIq
 RDOD/GYUSKQif1d+8KWzLawyXrC/gBmrePbbTegMmr+Sz1v2+Qcaxwl3MhqBbgX8sdgS
 7wQA==
X-Gm-Message-State: AOJu0Yw13zQG9cXXl3IqgeUU2yaOq6q/A/zUk9HdwoIkpitwoAQ10heZ
 jEOewVy0+xlx8VW41vLy+ZUSdlhV0UOwPLRGkWk=
X-Google-Smtp-Source: AGHT+IHz5Z03RjNG5VIJDWbFMbs3TDnwQKrt4s553zxNHQAshz8xQpJ5GAoR1cRY5yuhtms6Cr9CzMWhW3Aaqj6j8bw=
X-Received: by 2002:a05:6512:b1b:b0:501:c406:c296 with SMTP id
 w27-20020a0565120b1b00b00501c406c296mr1472247lfu.31.1695910841995; Thu, 28
 Sep 2023 07:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
 <CAA_UwzLYbSXaa-JLHwcyKpe45MAkYuaheXNO2m6ZAW1iyMJ_yQ@mail.gmail.com>
 <e0d0e283-fab3-b023-ecdc-89e5cc913da3@amd.com>
In-Reply-To: <e0d0e283-fab3-b023-ecdc-89e5cc913da3@amd.com>
From: Ray Strode <halfline@gmail.com>
Date: Thu, 28 Sep 2023 10:20:29 -0400
Message-ID: <CAA_UwzLEiXY_O64ibo3So5GPjEJMpmbkQdF_TRJ-4CQ7o-4oiQ@mail.gmail.com>
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

On Thu, Sep 28, 2023 at 9:24=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> If you see a large delay in the dpms off case then we probably have a dri=
ver bug somewhere.

This is something we both agree on, I think.

>> I'm getting the idea that you think there is some big bucket of kernel
>> syscalls that block for a large fraction of a second by design and are
>> not meant to reset RLIMIT_RTTIME.
>
> Yes, exactly that's the case as far as I know.

Okay, well i'm willing to be proven wrong. My previously stated list
is: futex, sched_yield, and maybe a few obscure ioctls. If you have a
big bucket of syscalls in your mind, i'm all ears. I think I'm
probably right and the lions share of all syscalls that can block for
a long time don't leave the process RUNNABLE, though.

> The purpose of RLIMIT_RTTIME is to have a watchdog if an application is s=
till responsive. Only things which make the application look for outside ev=
ents are considered a reset for this whatdog.
>
> So for example calling select() and poll() will reset the watchdog, but n=
ot calling any DRM modeset functions or an power management IOCTL for examp=
le.

what power management ioctls are you talking about?

>
> There are only two possibilities I can see how a DRM modeset is triggerin=
g this:
>
> 1. We create enough CPU overhead to actually exceed the limit. In this ca=
se triggering it is certainly intentional.

As I said before I suspect that not all modeset work for all drivers
is happening in the process context already anyway. So if this is
intentional, I suspect it's not actually working as designed (but I
haven't confirmed that, aside from my `git grep -E
'INIT_WORK|DECLARE_TASKLET|open_softirq|timer_setup|kthread_run' | wc
-l` litmus test) . I can't come up with a good reason it would be
designed like that, however, and you haven't provided one, so I
suspect it's not actually intentional.

>> I don't think you really thought through what you're saying here. It
>> just flatly doesn't apply for drmModeAtomicCommit. What is an
>> application supposed to do?
>
> Get terminated and restart. That's what the whole functionality is good f=
or.
>
> If you don't desire that than don't use the RLIMIT_RTTIME functionality.

No, getting terminated and restarting the session because
drmModeAtomicCommit is taking too long is not really acceptable
behavior for a display server. In general, crashing the session is
maybe better than locking up the entire system hard, so RLIMIT_RTTIME
is still a good idea, but in either case we're in bug land here, each
such bug needs to be fixed. In this case, the bug is
drmModeAtomicCommit isn't sleeping like nearly every other syscall
does.

> From the RLIMIT_RTTIME documentation: "The intended use of this limit
> is to stop a runaway real-time process from locking up the system."
>
> And when drmAtomicCommit() is triggering this then we either have a
> problem with the application doing something it is not supposed to do
> (like blocking for vblank while it should listen to network traffic) or
> the driver is somehow buggy.
Yes! This is about bugs.

> drmModeAtomicCommit() is used by display servers. If drmModeAtomicCommit
> runs away in e.g. a set of 100ms busy loops responding to a confused or
> slow responding GPU, the system will seemingly lock up to the user. That
> is an intractable problem that we can not get away from. It doesn't
> matter if the kernel is stuck in process context or on a workqueue. And,
> regardless, it's not reasonable to expect userspace to craft elaborate
> workarounds for driver bugs. We just have to fix the bugs.
>
> Exactly that's the reason why I'm pointing out that this isn't a good ide=
a.

Not following your logic here.

> That just papers over the problem. The process doesn't become more respon=
sive by hiding the problem.

It's not about the process being responsive. In meat-space, the
sub-second delay is imperceptible because the screen is turned off.

It's about not killing an innocent display server because of a driver bug.

> What you need to do here is to report those problems to the driver teams =
and not try to hide them this way.

There is already a bug, it's mentioned in the merge request, the
reason I cc'd you (vs say just Dave and Daniel) is because the driver
bug is in amdgpu code.

--Ray
