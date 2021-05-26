Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0127391B61
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 17:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29816E20E;
	Wed, 26 May 2021 15:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDE06E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 15:13:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so771280wmk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JC8HpxyIu10oISvtWws82Z159WoVrNTvawPit28M/lk=;
 b=S9xrv6r6l1qq8RALA3ZRQwICgUbG3ep1sWHauTHCqkhkNtUoymShsz2GUWJLCgMbVs
 eqLjfbGauQvlX+0tfArAC3RaUDydSJTiXs5QBOJXIPc64Ho7RM0DbAF0lYwsqnC9mOY1
 HqW9GpH0fvUqQGNqsk931G458HYtSNvHFfRVQmfSvXfWjtmZ41VDsp6wDhimh5YPWzfO
 ZVGgiarZNkbDwzMOYfuYik9ohCQi/IcdbG7Mqquwoy6RYHWUjRIPAkKihhgAQKqg+0eB
 NlmlAH9euMOFxBlBYXEQwcFuAr0cW/EuOQNID65TlRSOTd72sXRQZ4KbrmrB2u1xpFzz
 49qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JC8HpxyIu10oISvtWws82Z159WoVrNTvawPit28M/lk=;
 b=kf9itj6wCC1BdaZHINeqAJ2kC2yilNgF2tdGQLey59ytUAdf7h3sY1IZFoJPAtHgHT
 aLfI4SFsrWgK7x+Pu7UoacoW7sWh436kDTln9TdtURFcy8uAesbiBnEOvQBBrnMrex+w
 VMgEGjOdry31karp+XVCQVO7lnMK8zSkgO0LfcLoITkemj0KJfPxePOzOyxzcsdfav5k
 bJBSeitZyTAhza2E+j2GEX+IC7PYpaXdFalEeYo1x6UdHU0QMF8nWkZ0OfqRyfbc4t1c
 jYY058QW2LSFjUO6mr66OBST1qPMMxZtA0WKKsqYyLEuMP/wI4W726ii1EVDE3tTkHi1
 VWzw==
X-Gm-Message-State: AOAM533zC3JJ6ufrL1cVkPJ+FNmWdUgHotT+oIesN1UbLU4a8LjNJTSt
 ZG1jJNUdCd2I2uMObsJtU1AALYNGZwcqLutf6nvtDA==
X-Google-Smtp-Source: ABdhPJyxWUcycmlrebrRbWhM2cMBw+5UN7dbQWWsaIVOvIxKlINaRWTxIzfxTtYioTP91GvPDuD+jiky73KSpT8fnEg=
X-Received: by 2002:a1c:3184:: with SMTP id x126mr3907633wmx.52.1622041992543; 
 Wed, 26 May 2021 08:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAKMK7uHqxLe_CH_cOjfy-rouYcxwg=n6AkkxprzAKnb-y_A3NQ@mail.gmail.com>
 <CAPj87rOW_633K_n4nwq2qkPt5Q5efc3BpRnzT+=Npb=agWGTew@mail.gmail.com>
 <YK5QvIJYTJ7AJZNx@phenom.ffwll.local>
In-Reply-To: <YK5QvIJYTJ7AJZNx@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 16:13:00 +0100
Message-ID: <CAPj87rMgQiwdB+fTjoMkqtpKxs6JgxWSm=jrq1Oen0dKiFqSog@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Vetter <daniel@ffwll.ch>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 May 2021 at 14:44, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, May 26, 2021 at 02:08:19PM +0100, Daniel Stone wrote:
> > Are you saying that if a compositor imports a client-provided dmabuf
> > as an EGLImage to use as a source texture for its rendering, and then
> > provides it to VA-API or V4L2 to use as a media encode source (both
> > purely read-only ops), that these will both serialise against each
> > other? Like, my media decode job won't begin execution until the
> > composition read has fully retired?
> >
> > If so, a) good lord that hurts, and b) what are shared fences actually ... for?
>
> Shared is shared, I just meant to say that we always add the shared fence.
> So an explicit ioctl to add more shared fences is kinda pointless.
>
> So yeah on a good driver this will run in parallel. On a not-so-good
> driver (which currently includes amdgpu and panfrost) this will serialize,
> because those drivers don't have the concept of a non-exclusive fence for
> such shared buffers (amdgpu does not sync internally, but will sync as
> soon as it's cross-drm_file).

When you say 'we always add the shared fence', add it to ... where?
And which shared fence? (I'm going to use 'fence' below to refer to
anything from literal sync_file to timeline-syncobj to userspace
fence.)

I'll admit that I've typed out an argument twice for always export
from excl+shared, and always import to excl, results in oversync. And
I keep tying myself in knots trying to do it. It's arguably slightly
contrived, but here's my third attempt ...

Vulkan Wayland client, full-flying-car-sync Wayland protocol,
Vulkan-based compositor. Part of the contract when the server exposes
that protocol is that it guarantees to do explicit sync in both
directions, so the client provides a fence at QueueSubmit time and the
server provides one back when releasing the image for return to ANI.
Neither side ever record fences into the dma_resv because they've
opted out by being fully explicit-aware.

Now add media encode out on the side because you're streaming. The
compositor knows this is a transition between explicit and implicit
worlds, so it imports the client's fence into the exclusive dma_resv
slot, which makes sense: the media encode has to sync against the
client work, but is indifferent to the parallel compositor work. The
shared fence is exported back out so the compositor can union the
encode-finished fence with its composition-finished fence to send back
to the client with release/ANI.

Now add a second media encode because you want a higher-quality local
capture to upload to YouTube later on. The compositor can do the exact
same import/export dance, and the two encodes can safely run in
parallel. Which is good.

Where it starts to become complex is: what if your compositor is fully
explicit-aware but your clients aren't, so your compositor has more
import/export points to record into the resv? What if you aren't
actually a compositor but a full-blown media pipeline, where you have
a bunch of threads all launching reads in parallel, to the extent
where it's not practical to manage implicit/explicit transitions
globally, but each thread has to more pessimistically import and
export around each access?

I can make the relatively simple usecases work, but it really feels
like in practice we'll end up with massive oversync in some fairly
complex usecases, and we'll regret not having had it from the start,
plus people will just rely on implicit sync for longer because it has
better (more parallel) semantics in some usecases.

Cheers,
Daniel
