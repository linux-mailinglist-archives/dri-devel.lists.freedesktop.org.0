Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDBB3AD112
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 19:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9696EA49;
	Fri, 18 Jun 2021 17:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E066EA48
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 17:20:55 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u11so11307933oiv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 10:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CvyqhDMII1QOdk588HDQ2jYeSW12jnwn2SirorTIh+g=;
 b=dP4+mpQSjzAFWu32vFN6Ha1chQtRnvewgS/25MsZy6JiU/9+PRfY/I6Q5ThszX/22b
 ex2dVsOJg0nPNfX5urvGPWjsjI1lZD9Ia0vIhO+/cvFg/egU1R5klS2z01hTmUhcgDRV
 gCWFH/R/M+gEBlBs9/UC0M2dMwZh9lhe/kX1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CvyqhDMII1QOdk588HDQ2jYeSW12jnwn2SirorTIh+g=;
 b=sIw/fruxTgo+F/4+7QsU4ktKCHRMb0jbSOjrDBs2nqmk9iEy2q+3CATvYvFzqFnTPQ
 mJ4S5EVcczt9kVs0E295W0+GzBBvvMDtgbr6lRsbbeI0a2dTVWo1J8iBD9iXPmg0ZTN1
 tZ8hjNSkEvJH68rKSXDpWFN4dKEaIhgXHJwsg3x6d77YaAcX5rtMhrB36Btb39qyaRog
 WAmSP0z/dRiAQAPluPujUjkN9U1h8iGNNC5zYb9G+C6iCjRxtlUIaPf7pkR4ktX26Cfg
 cNz8+b9Tz6yKZq2v+u4xEqQaqOAeAn/sLMDHa25rHJX7NrhHQyhgbNuFpZpq1WWCTMdq
 xFPg==
X-Gm-Message-State: AOAM533D0DkDQB3o0RDRbzl1cMB2eQ5jRACyLuqskzDz4HvJRGSPKAth
 zxQJVxdfQZHT+Qf485RGRUou574QNtLtfYiw2zqgow==
X-Google-Smtp-Source: ABdhPJwv1doaHbr6sSzA/YjQcQMgQgeSHhTcA9asfsA3H5+/hzfoBdLTZy60cdQhKACKwtQIvjrNyl3vtguqUXPcfrc=
X-Received: by 2002:aca:afc5:: with SMTP id y188mr6282749oie.14.1624036854612; 
 Fri, 18 Jun 2021 10:20:54 -0700 (PDT)
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
In-Reply-To: <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Jun 2021 19:20:43 +0200
Message-ID: <CAKMK7uELvm+OFZ_GJT4NnB5xXChUcTEuozz4MTu9KwEne=bzgA@mail.gmail.com>
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

On Fri, Jun 18, 2021 at 6:43 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.06.21 um 17:17 schrieb Daniel Vetter:
> > [SNIP]
> > Ignoring _all_ fences is officially ok for pinned dma-buf. This is
> > what v4l does. Aside from it's definitely not just i915 that does this
> > even on the drm side, we have a few more drivers nowadays.
>
> No it seriously isn't. If drivers are doing this they are more than broke=
n.
>
> See the comment in dma-resv.h
>
>   * Based on bo.c which bears the following copyright notice,
>   * but is dual licensed:
> ....
>
>
> The handling in ttm_bo.c is and always was that the exclusive fence is
> used for buffer moves.
>
> As I said multiple times now the *MAIN* purpose of the dma_resv object
> is memory management and *NOT* synchronization.
>
> Those restrictions come from the original design of TTM where the
> dma_resv object originated from.
>
> The resulting consequences are that:
>
> a) If you access the buffer without waiting for the exclusive fence you
> run into a potential information leak.
>      We kind of let that slip for V4L since they only access the buffers
> for writes, so you can't do any harm there.
>
> b) If you overwrite the exclusive fence with a new one without waiting
> for the old one to signal you open up the possibility for userspace to
> access freed up memory.
>      This is a complete show stopper since it means that taking over the
> system is just a typing exercise.
>
>
> What you have done by allowing this in is ripping open a major security
> hole for any DMA-buf import in i915 from all TTM based driver.
>
> This needs to be fixed ASAP, either by waiting in i915 and all other
> drivers doing this for the exclusive fence while importing a DMA-buf or
> by marking i915 and all other drivers as broken.
>
> Sorry, but if you allowed that in you seriously have no idea what you
> are talking about here and where all of this originated from.

Dude, get a grip, seriously. dma-buf landed in 2011

commit d15bd7ee445d0702ad801fdaece348fdb79e6581
Author: Sumit Semwal <sumit.semwal@ti.com>
Date:   Mon Dec 26 14:53:15 2011 +0530

   dma-buf: Introduce dma buffer sharing mechanism

and drm prime landed in the same year

commit 3248877ea1796915419fba7c89315fdbf00cb56a
(airlied/drm-prime-dmabuf-initial)
Author: Dave Airlie <airlied@redhat.com>
Date:   Fri Nov 25 15:21:02 2011 +0000

   drm: base prime/dma-buf support (v5)

dma-resv was extracted much later

commit 786d7257e537da0674c02e16e3b30a44665d1cee
Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Date:   Thu Jun 27 13:48:16 2013 +0200

   reservation: cross-device reservation support, v4

Maarten's patch only extracted the dma_resv stuff so it's there,
optionally. There was never any effort to roll this out to all the
existing drivers, of which there were plenty.

It is, and has been since 10 years, totally fine to access dma-buf
without looking at any fences at all. From your pov of a ttm driver
dma-resv is mainly used for memory management and not sync, but I
think that's also due to some reinterpretation of the actual sync
rules on your side. For everyone else the dma_resv attached to a
dma-buf has been about implicit sync only, nothing else.

_only_ when you have a dynamic importer/exporter can you assume that
the dma_resv fences must actually be obeyed. That's one of the reasons
why we had to make this a completely new mode (the other one was
locking, but they really tie together).

Wrt your problems:
a) needs to be fixed in drivers exporting buffers and failing to make
sure the memory is there by the time dma_buf_map_attachment returns.
b) needs to be fixed in the importers, and there's quite a few of
those. There's more than i915 here, which is why I think we should
have the dma_resv_add_shared_exclusive helper extracted from amdgpu.
Avoids hand-rolling this about 5 times (6 if we include the import
ioctl from Jason).

Also I've like been trying to explain this ever since the entire
dynamic dma-buf thing started.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
