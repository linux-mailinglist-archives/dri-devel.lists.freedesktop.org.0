Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317357C75C2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 20:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882D310E557;
	Thu, 12 Oct 2023 18:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61D110E56E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 18:19:55 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50435a9f800so1749193e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 11:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697134794; x=1697739594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFdhSuAAOk5PfCW2u6p96/6Hn0YKjqD9jFdDIXHDz10=;
 b=MUTbY3k1XqNJiGAuG7kJWdvdrd2yia4o8ZC0miYW/dkfqvacCOHyxN9GGLlTcc+7ME
 NuCu5gptR3LYsiS78ge9ZOMAubtZGoisuPq1Sw+kowQSkmyhIvHWxWaDi5L1406HytCj
 UFOYyyzCHmtNj8IVoTnypU3qeJlp2top9AoV/q4ywl3zyC+kivBcb10L+Di0tO+h7IrK
 D6OBkhR5/lNasqN65YWyxPFNPcC1X8z9HC5taa7Brpkmaq3Yh7Z9oT06QN4yHMPv8qgG
 i8WDMRBZTRlEok9sQuqmxmpjdKG5Vru0C9IRmko+2xAzbqK9FMl/4j5l68CEKOedGF4W
 9dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697134794; x=1697739594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFdhSuAAOk5PfCW2u6p96/6Hn0YKjqD9jFdDIXHDz10=;
 b=WtyeQ5/I4FJ6WlQCGYweYcwfQhDLyMPBkmmgIJ+2+2Z4pifitS/uWFxk3HTDZZC2up
 ZyU6JciM40T1XgKyraG+Pvvq+S8pUP1BUeDoTUL6cQrFQP0yqOGaLUDlW8euAEh6Y+Fy
 ecXx98es+DiD8I8b6pIjEsrtwY1Ww7V0iSnipjREpqp+GcRM4b0fTEScaJ+zmgchUOVj
 RhCshz2vNgTra/BNWpfngWelgi3OR/wDPU2OTxuwL8NjCkg5z3YSr6l65EyJ4w9Soij2
 Tu1DvrikbBHnIgve/icG3zTDMANKkAS31nGEWo4SdvxExQ6OidnbVSjrk77+VW3GJzwk
 Zm5w==
X-Gm-Message-State: AOJu0Ywk3gksqiOnghtO2ta6sUaUpY/qIXUeVSTu4R7krxxZPdaGkqON
 tDBm/Us4HOvI+zm/rOFHvjWtMIN1XBNs8euUg8s=
X-Google-Smtp-Source: AGHT+IGeUH+dnJd9p+/aAbtjl9+Qqhmig4gTdfZDF6imrlFQk1n9J17A1hlVGxEnLgH4GcrqRYU8DeUxPQm86Gjffnw=
X-Received: by 2002:a19:3814:0:b0:503:1bd4:5e43 with SMTP id
 f20-20020a193814000000b005031bd45e43mr18068962lfa.40.1697134793500; Thu, 12
 Oct 2023 11:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com> <ZSPv1iAwJMgnsDu3@intel.com>
 <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
 <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
In-Reply-To: <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
From: Ray Strode <halfline@gmail.com>
Date: Thu, 12 Oct 2023 14:19:41 -0400
Message-ID: <CAA_UwzJF3Smi_JSQ4S3B1kG23MEXppVfm0Sc1ftVktaoumymuA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Mon, Oct 09, 2023 at 02:36:17PM +0200, Christian K=C3=B6nig wrote:
> > > > To be clear, my take is, if driver code is running in process conte=
xt
> > > > and needs to wait for periods of time on the order of or in excess =
of
> > > > a typical process time slice it should be sleeping during the waiti=
ng.
> > > > If the operation is at a point where it can be cancelled without si=
de
> > > > effects, the sleeping should be INTERRUPTIBLE. If it's past the poi=
nt
> > > > of no return, sleeping should be UNINTERRUPTIBLE. At no point, in m=
y
> > > > opinion, should kernel code busy block a typical process for dozens=
 of
> > > > milliseconds while keeping the process RUNNING. I don't think this =
is
> > > > a controversial take.
> > > Exactly that's what I completely disagree on.

Okay if we can't agree that it's not okay for user space (or the
kernel running in the context of user space) to busy loop a cpu core
at 100% utilization throughout and beyond the process's entire
scheduled time slice then we really are at an impasse. I gotta say i'm
astonished that this seemingly indefensible behavior is somehow a
point of contention, but I'm not going to keep arguing about it beyond
this email.

I mean we're not talking about scientific computing, or code
compilation, or seti@home. We're talking about nearly the equivalent
of `while (1) __asm__ ("nop");`

> > The key point here is that the patch puts the work into the background =
just
> > to avoid that it is accounted to the thread issuing it, and that in tur=
n is
> > not valid as far as I can see.
>
> Yeah it's that aspect I'm really worried about, because we essentially
> start to support some gurantees that a) most drivers can't uphold without
> a huge amount of work, some of the DC state recomputations are _really_
> expensive b) without actually making the semantics clear, it's just
> duct-tape.

If DC plane state computation (or whatever) is really taking 50ms or
200ms, then it probably should be done in chunks so it doesn't get
preempted at an inopportune point? Look, this is not my wheelhouse,
this is your wheelhouse, and I don't want to keep debating forever. It
seems there is a discrepancy between our understandings of implied
acceptable behavior.

> Yes compositors want to run kms in real-time, and yes that results in fun
> if you try to strictly account for cpu time spent. Especially if your
> policy is to just nuke the real time thread instead of demoting it to
> SCHED_NORMAL for a time.

So I ended up going with this suggestion for blocking modesets:

https://gitlab.gnome.org/GNOME/mutter/-/commit/5d3e31a49968fc0da04e98c0f9d6=
24ea5095c9e0

But *this* feels like duct tape: You've already said there's no
guarantee the problem won't also happen during preliminary computation
during non-blocking commits or via other drm entry points. So it
really does seem like a fix that won't age well. I won't be surprised
if in ~3 years (or whatever) in some RHEL release there's a customer
bug leading to the real-time thread getting blocklisted for obscure
server display hardware because it's causing the session to tank on a
production machine.

> I think if we want more than hacks here we need to answer two questions:
> - which parts of the kms api are real time
> - what exactly do we guarantee with that

imo, this isn't just about real-time versus non-real-time. It's no
more acceptable for non-real-time mutter to be using 100% CPU doing
busywaits than it is for real-time mutter to be using 100% cpu doing
busywaits.

Also, both you and Christian have suggested using the non-blocking
modeset api with a fence fd to poll on is equivalent to the blocking
api flushing the commit_tail work before returning from the ioctl, but
that's not actually true. I think we all now agree the EBUSY problem
you mentioned as an issue with my proposed patch wasn't actually a
problem for blocking commits, but that very same issue is a problem
with the non-blocking commits that then block on a fence fd, right? I
guess we'd need to block on a fence fd from the prior non-blocking
commit first before starting the blocking commit (or something)

--Ray
