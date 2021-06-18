Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5013AD259
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 20:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6E76EA75;
	Fri, 18 Jun 2021 18:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890A56EA6E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 18:45:38 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 n20-20020a4abd140000b029024b43f59314so876746oop.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 11:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gRJ9heioPZBuKCoqd3pskUrbWboR7F0XTnQlHJFL48o=;
 b=QV6ps3i0UZ+7bkW5ydBOyKWmJwCBd5+NxwnfaK5V709wQr+82PA8Cv+buRJfb7FE2P
 rPKSsg31CZssEdRwSU0glFU8RoIisPriDeViSAtce1dfWYj2cNBHC/Qe0wNY65YME6JL
 QriHUGcHmDllvF84ZG0FgeWdnwomN3NhqpWtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gRJ9heioPZBuKCoqd3pskUrbWboR7F0XTnQlHJFL48o=;
 b=MEctn+87l3CaW0zJ90k7eDtkCQLcDc1lxGwZ8KJKnWHnQ15HL5b3paxpdFaPbbOJXv
 VeC32/YPYnZHTmcHIcGdPStgVlAiCwF5xpK+UqSKC6H6FaPWwyNfYBFsz51B/sfemYpA
 PIUeCA4UDXpedmAbjyUMz+v0k+SfMc6DoGEx+hoZ9ude0JnRvmbykVXW8cEe2ba0t67U
 IiePoxVl59Jp20JmyLoow4wK74CUKZiLMFyxLQu7J4M0Y43eD9VNDlNX5naYkOJTuPL7
 2hWTFDJyluIQLIYyFRYUIFKKX9RTGf36SFiJbK3WwadTOTPYC/zmG977jRGiMu6udzX+
 jUGQ==
X-Gm-Message-State: AOAM531v6Xra98pPd5Rsqz0xap4cCVBAwk6I/zgSi69JF9viY7r0kHPl
 /XUZm6gwGWefLjjFDkhxVNKASavJ2RVA6KhGr+StuPWta/Q=
X-Google-Smtp-Source: ABdhPJzj2HNP9pYvodY7DvjyJzpyH7lhDI8GXWNDPeKESg6GsWJ2kV/+4EDVoeD91myod2KMtnFL/I/gxnYSDntFAfk=
X-Received: by 2002:a4a:eac4:: with SMTP id s4mr1769472ooh.89.1624041937825;
 Fri, 18 Jun 2021 11:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
 <YMupgTffAfw8xw51@phenom.ffwll.local>
 <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
 <CAKMK7uH5oW3icBPOPsumRv+LJ-5qCVKgfniXd-J8mnA+JuRq+Q@mail.gmail.com>
 <53c1c0c2-5e17-a54f-155b-66f3cd4b48a3@amd.com>
 <CAKMK7uHng_beNWeYa50Nxrz2SQVmjTuuN-cAYz-SQtAymGdH3Q@mail.gmail.com>
 <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
 <CAKMK7uELvm+OFZ_GJT4NnB5xXChUcTEuozz4MTu9KwEne=bzgA@mail.gmail.com>
 <ce3fbc52-d629-f022-da52-bcc1adafbe23@amd.com>
In-Reply-To: <ce3fbc52-d629-f022-da52-bcc1adafbe23@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Jun 2021 20:45:26 +0200
Message-ID: <CAKMK7uENS-LQdMcQpa2gi-QZVUu74Y_-13iNoZO8eFTnZZ1PEw@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 8:02 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.06.21 um 19:20 schrieb Daniel Vetter:
> > On Fri, Jun 18, 2021 at 6:43 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 18.06.21 um 17:17 schrieb Daniel Vetter:
> >>> [SNIP]
> >>> Ignoring _all_ fences is officially ok for pinned dma-buf. This is
> >>> what v4l does. Aside from it's definitely not just i915 that does thi=
s
> >>> even on the drm side, we have a few more drivers nowadays.
> >> No it seriously isn't. If drivers are doing this they are more than br=
oken.
> >>
> >> See the comment in dma-resv.h
> >>
> >>    * Based on bo.c which bears the following copyright notice,
> >>    * but is dual licensed:
> >> ....
> >>
> >>
> >> The handling in ttm_bo.c is and always was that the exclusive fence is
> >> used for buffer moves.
> >>
> >> As I said multiple times now the *MAIN* purpose of the dma_resv object
> >> is memory management and *NOT* synchronization.
> >>
> >> Those restrictions come from the original design of TTM where the
> >> dma_resv object originated from.
> >>
> >> The resulting consequences are that:
> >>
> >> a) If you access the buffer without waiting for the exclusive fence yo=
u
> >> run into a potential information leak.
> >>       We kind of let that slip for V4L since they only access the buff=
ers
> >> for writes, so you can't do any harm there.
> >>
> >> b) If you overwrite the exclusive fence with a new one without waiting
> >> for the old one to signal you open up the possibility for userspace to
> >> access freed up memory.
> >>       This is a complete show stopper since it means that taking over =
the
> >> system is just a typing exercise.
> >>
> >>
> >> What you have done by allowing this in is ripping open a major securit=
y
> >> hole for any DMA-buf import in i915 from all TTM based driver.
> >>
> >> This needs to be fixed ASAP, either by waiting in i915 and all other
> >> drivers doing this for the exclusive fence while importing a DMA-buf o=
r
> >> by marking i915 and all other drivers as broken.
> >>
> >> Sorry, but if you allowed that in you seriously have no idea what you
> >> are talking about here and where all of this originated from.
> > Dude, get a grip, seriously. dma-buf landed in 2011
> >
> > commit d15bd7ee445d0702ad801fdaece348fdb79e6581
> > Author: Sumit Semwal <sumit.semwal@ti.com>
> > Date:   Mon Dec 26 14:53:15 2011 +0530
> >
> >     dma-buf: Introduce dma buffer sharing mechanism
> >
> > and drm prime landed in the same year
> >
> > commit 3248877ea1796915419fba7c89315fdbf00cb56a
> > (airlied/drm-prime-dmabuf-initial)
> > Author: Dave Airlie <airlied@redhat.com>
> > Date:   Fri Nov 25 15:21:02 2011 +0000
> >
> >     drm: base prime/dma-buf support (v5)
> >
> > dma-resv was extracted much later
> >
> > commit 786d7257e537da0674c02e16e3b30a44665d1cee
> > Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > Date:   Thu Jun 27 13:48:16 2013 +0200
> >
> >     reservation: cross-device reservation support, v4
> >
> > Maarten's patch only extracted the dma_resv stuff so it's there,
> > optionally. There was never any effort to roll this out to all the
> > existing drivers, of which there were plenty.
> >
> > It is, and has been since 10 years, totally fine to access dma-buf
> > without looking at any fences at all. From your pov of a ttm driver
> > dma-resv is mainly used for memory management and not sync, but I
> > think that's also due to some reinterpretation of the actual sync
> > rules on your side. For everyone else the dma_resv attached to a
> > dma-buf has been about implicit sync only, nothing else.
>
> No, that was way before my time.
>
> The whole thing was introduced with this commit here:
>
> commit f2c24b83ae90292d315aa7ac029c6ce7929e01aa
> Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> Date:   Wed Apr 2 17:14:48 2014 +0200
>
>      drm/ttm: flip the switch, and convert to dma_fence
>
>      Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>
>   int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
> ....
> -       bo->sync_obj =3D driver->sync_obj_ref(sync_obj);
> +       reservation_object_add_excl_fence(bo->resv, fence);
>          if (evict) {
>
> Maarten replaced the bo->sync_obj reference with the dma_resv exclusive
> fence.
>
> This means that we need to apply the sync_obj semantic to all drivers
> using a DMA-buf with its dma_resv object, otherwise you break imports
> from TTM drivers.
>
> Since then and up till now the exclusive fence must be waited on and
> never replaced with anything which signals before the old fence.
>
> Maarten and I think Thomas did that and I was always assuming that you
> know about this design decision.

Surprisingly I do actually know this.

Still the commit you cite did _not_ change any of the rules around
dma_buf: Importers have _no_ obligation to obey the exclusive fence,
because the buffer is pinned. None of the work that Maarten has done
has fundamentally changed this contract in any way.

If amdgpu (or any other ttm based driver) hands back and sgt without
waiting for ttm_bo->moving or the exclusive fence first, then that's a
bug we need to fix in these drivers. But if ttm based drivers did get
this wrong, then they got this wrong both before and after the switch
over to using dma_resv - this bug would go back all the way to Dave's
introduction of drm_prime.c and support for that.

The only thing which importers have to do is not wreak the DAG nature
of the dma_resv fences and drop dependencies. Currently there's a
handful of drivers which break this (introduced over the last few
years), and I have it somewhere on my todo list to audit&fix them all.

The goal with extracting dma_resv from ttm was to make implicit sync
working and get rid of some terrible stalls on the userspace side.
Eventually it was also the goal to make truly dynamic buffer
reservation possible, but that took another 6 or so years to realize
with your work. And we had to make dynamic dma-buf very much opt-in,
because auditing all the users is very hard work and no one
volunteered. And for dynamic dma-buf the rule is that the exclusive
fence must _never_ be ignored, and the two drivers supporting it (mlx5
and amdgpu) obey that.

So yeah for ttm drivers dma_resv is primarily for memory management,
with a side effect of also supporting implicit sync.

For everyone else (and this includes a pile of render drivers, all the
atomic kms drivers, v4l and I have no idea what else on top) dma_resv
was only ever about implicit sync, and it can be ignored. And it (the
implicit sync side) has to be ignored to be able to support vulkan
winsys buffers correctly without stalling where we shouldn't. Also we
have to ignore it on atomic kms side too (and depending upon whether
writeback is supported atomic kms is perfectly capable of reading out
any buffer passed to it).

> It's absolutely not that this is my invention, I'm just telling you how
> it ever was.
>
> Anyway this means we have a seriously misunderstanding and yes now some
> of our discussions about dynamic P2P suddenly make much more sense.

Yeah I think at least we finally managed to get this across.

Anyway I guess w/e for me now, otherwise we'll probably resort to
throwing chairs :-) I'm dearly hoping the thunderstorms all around me
actually get all the way to me, because it's way, way too hot here
right now.

Cheers, Daniel

> Regards,
> Christian.
>
>
> >
> > _only_ when you have a dynamic importer/exporter can you assume that
> > the dma_resv fences must actually be obeyed. That's one of the reasons
> > why we had to make this a completely new mode (the other one was
> > locking, but they really tie together).
> >
> > Wrt your problems:
> > a) needs to be fixed in drivers exporting buffers and failing to make
> > sure the memory is there by the time dma_buf_map_attachment returns.
> > b) needs to be fixed in the importers, and there's quite a few of
> > those. There's more than i915 here, which is why I think we should
> > have the dma_resv_add_shared_exclusive helper extracted from amdgpu.
> > Avoids hand-rolling this about 5 times (6 if we include the import
> > ioctl from Jason).
> >
> > Also I've like been trying to explain this ever since the entire
> > dynamic dma-buf thing started.
> > -Daniel
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
