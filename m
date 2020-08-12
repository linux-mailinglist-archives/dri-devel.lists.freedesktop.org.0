Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B1624297A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 14:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0C66E0D0;
	Wed, 12 Aug 2020 12:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546086E0D0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 12:38:05 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id a1so993778vsp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 05:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uuREm/2H2i4DpS8LcmsSiCUyxNoP7q/eMRZyXuZx0gg=;
 b=M7sULlu7fY3jPoMspeTcHnyYlVcPIkPxYvPGFyqJKi5QBkX5rLMJazMByUrxS9Cuw2
 aI2PH19zn3LyiElqUm6uv8YoeCUQDgmw1mZQzSoTAS21BRlE/MIBMaMd3wFxlLqMaIiL
 8Sv7G9614iK/M6aHbhe0wN6JVqPcnJjnlV8bG22WxjFSo27lnwNzdjgr28j50Ialk8J6
 ezKyb4djnFAN8pncghqXdDpGlg0POut0YNQC6juzyQnOXQ7YVeb6K2YRFnmBtoT7w8Nw
 Uh+CEsW3FqtJl8DoT3Ywt8sIm03ilb3o6HQ3QIvOH8Px8ag/zGAKqSED1mZVagfIMZ0z
 I0EA==
X-Gm-Message-State: AOAM533dRGXxDfX2UOdiZIU6qNBLsfxOPSpwMABJm06G3UFDNvOzrRWF
 bKgviFg3GErABUer2N5ua2oSt5b0YEfVX1iGYMOI4Olf
X-Google-Smtp-Source: ABdhPJwgCZuduKoG8aU8SIStwZz/xkLmEwyWinB42ss3FcIY+r4K4lnS0Y0D9n7CqqnA4LhkR3jJdY4DJDPEkixhDUQ=
X-Received: by 2002:a67:ef81:: with SMTP id r1mr27489669vsp.37.1597235884431; 
 Wed, 12 Aug 2020 05:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
In-Reply-To: <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 12 Aug 2020 08:37:52 -0400
Message-ID: <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Karol Herbst <kherbst@redhat.com>
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 8:24 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 12, 2020 at 12:43 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
> > > >
> > > > Sorry for the slow reply here as well.  I've been in the process of
> > > > rebasing and reworking the userspace patches.  I'm not clear my changes
> > > > will address the Jetson Nano issue, but if you'd like to try them, the
> > > > latest userspace changes are available here:
> > > >
> > > >    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
> > > >
> > > > And the tegra-drm kernel patches are here:
> > > >
> > > >
> > > > https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/
> > > >
> > > > Those + the kernel changes addressed in this thread are everything I had
> > > > outstanding.
> > > >
> > >
> > > I don't know if that's caused by your changes or not, but now the
> > > assert I hit is a different one pointing out that
> > > nvc0_miptree_select_best_modifier fails in a certain case and returns
> > > MOD_INVALID... anyway, it seems like with your patches applied it's
> > > now way easier to debug and figure out what's going wrong, so maybe I
> > > can figure it out now :)
> > >
> >
> > collected some information which might help to track it down.
> >
> > src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsbuf)
> >
> > templ is {reference = {count = 0}, width0 = 300, height0 = 300, depth0
> > = 1, array_size = 1, format = PIPE_FORMAT_Z24X8_UNORM, target =
> > PIPE_TEXTURE_2D, last_level = 0, nr_samples = 0, nr_storage_samples =
> > 0, usage = 0, bind = 1, flags = 0, next = 0x0, screen = 0x0}
> >
> > inside tegra_screen_resource_create modifier says
> > DRM_FORMAT_MOD_INVALID as template->bind is 1
> >
> > and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALID,
> > so the call just returns NULL leading to the assert.
> >
> > Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.
> >
>
> So I digged a bit deeper and here is what tripps it of:
>
> when the context gets made current, the normal framebuffer validation
> and render buffer allocation is done, but we end up inside
> tegra_screen_resource_create at some point with PIPE_BIND_SCANOUT set
> in template->bind. Now the tegra driver forces the
> DRM_FORMAT_MOD_LINEAR modifier and calls into
> resource_create_with_modifiers.
>
> If it wouldn't do that, nouveau would allocate a tiled buffer, with
> that it's linear and we at some point end up with an assert about a
> depth_stencil buffer being there even though it shouldn't. If I always
> use DRM_FORMAT_MOD_INVALID in tegra_screen_resource_create, things
> just work.
>
> That's kind of the cause I pinpointed the issue down to. But I have no
> idea what's supposed to happen and what the actual bug is.

Yeah, the bug with tegra has always been "trying to render to linear
color + tiled depth", which the hardware plain doesn't support. (And
linear depth isn't a thing.)

Question is whether what it's doing necessary. PIPE_BIND_SCANOUT
(/linear) requirements are needed for DRI2 to work (well, maybe not in
theory, but at least in practice the nouveau ddx expects linear
buffers). However tegra operates on a more DRI3-like basis, so with
"client" allocations, tiled should work OK as long as there's
something in tegra to copy it to linear when necessary?

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
