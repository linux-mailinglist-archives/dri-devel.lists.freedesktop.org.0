Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61937242C17
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 17:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A8489C99;
	Wed, 12 Aug 2020 15:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CF589C99
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597245653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P9an9rwHJ/MgjdiLF3BsNSADvh+lBTb2N026s19ulJs=;
 b=hRCuwPlWuKZudGJtXejaLyHWwh8krT6F/BLk0OAqaXL/fXsotuF5z1KyALCdXm5wDEKcYE
 mcNeP3vaTnOGyl90+zUPc1K8j3diHouR8VogV3xMRbWB2/XcQM6xXmvw95Zy4AfYfIT9ap
 61w+9KPlzLPkxjpO+hdF18WWj1BfQC0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-2Hckh1cBMiCxpCOjsoG7NQ-1; Wed, 12 Aug 2020 11:20:28 -0400
X-MC-Unique: 2Hckh1cBMiCxpCOjsoG7NQ-1
Received: by mail-qk1-f200.google.com with SMTP id z1so1681576qkg.23
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9an9rwHJ/MgjdiLF3BsNSADvh+lBTb2N026s19ulJs=;
 b=T8hi3Ybhb7h8rFZt5mur+aa90xtGBALZz9z06lvFpZIc+fZTdYpPnlJFxaTaL1Rf/n
 fNurQxwh0p5zw7GizbwgByiZDCFO8i2elrU07ijKGI3frM+4I15oAPDM6bP4anU14Mtr
 Gk5/hp3vSRAIzRi+p2W0nfe2Uk2fjXQRLsg6tClm114c/LAyT4XdUY+3ByZezGKgyZXw
 Kk1kO3AiAHpHBK57mfkcLUTtq0lneN4ALhtwc2lDRIvPfHJp0j2aiGuky0E0y+wuSYed
 7fnHpCY+nJBLXX7+EuQCQb83IeTyQYnM2JexUzfzuhnniUmBzNNQLWB2tsLBK5tAjuD2
 Sgag==
X-Gm-Message-State: AOAM532WWZGPua3R6kOkbpi6oARGWHVZuWQR1qoZbc2aI9d7UM5jWR62
 dTdT1QwGUTMgR8DhBnQzuA6V4iqKzPv0u8xBXso/RQddQu4qlu++F1A2l7CYRr2RXr3COOLRmGv
 Np+xmP2WeA4CtneqtGti+A3udX51Dfi11Vg7ieD9hX9sF
X-Received: by 2002:aed:30c5:: with SMTP id 63mr87740qtf.286.1597245627436;
 Wed, 12 Aug 2020 08:20:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb1q5cy29YE6/iQZpekj9deNeUnhpOsuLl85FNih9gEgPHvFAjEvzZnLLnY++RLjKpmgY2o2YW/SuQ/9NafTY=
X-Received: by 2002:aed:30c5:: with SMTP id 63mr87708qtf.286.1597245627143;
 Wed, 12 Aug 2020 08:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <20200812150514.GA8341@ulmo>
In-Reply-To: <20200812150514.GA8341@ulmo>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 12 Aug 2020 17:20:15 +0200
Message-ID: <CACO55ttHSbpPgHAaPRZizPuWCfs1BtAOoVOD8XcCFcEkewCBww@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thierry Reding <thierry.reding@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 5:05 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Aug 12, 2020 at 12:43:17PM +0200, Karol Herbst wrote:
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
>
> Hi Karol,
>
> I'm not sure if I'm doing something wrong, but I can't seem to reproduce
> these assertions at all. I've got a debug Mesa build from today as well
> as an X server build from today and if I run glxgears it works just fine
> for me. This is on Jetson TX1, but I don't think there's any difference
> to Jetson Nano in that regard. I'll try to give this a try on Jetson
> Nano as well, just to make sure. I can also try to pull in James'
> patches to see if they change anything for me.
>
> However, perhaps we can compare notes on what exactly your configuration
> is so that perhaps I can reproduce and take a closer look at what's
> going on.
>
> My Mesa build uses the following configuration:
>
>     $ meson --prefix /usr --libexecdir /usr/lib --buildtype debug -Dgles1=false \
>         -Dgallium-drivers=nouveau,swrast,tegra -Dgallium-opencl=standalone \
>         -Dvulkan-drivers='' -Dplatforms=wayland,x11,drm,surfaceless \
>         -Dbuild-tests=true -Dtexture-float=true -Ddri-drivers='' \
>         -Dgallium-omx=disabled -Dllvm=true
>
> And here's what I use for X:
>
>     $ meson --prefix /usr --libexecdir /usr/lib \
>         --libexecdir /usr/lib/xorg-server -Dxdmcp=false
>
> I've stripped out some cross-compilation boilerplate there because that
> shouldn't be relevant. Do you see anything in there that I'm missing and
> which might be causing the issue not to happen for me?
>
> Also, what's the window manager that you use? I use TWM (for simplicity)
> and I suspect that's not what you use, so perhaps this is relevant
> somehow as well?
>

I don't use any at all, just plain X.

Anyway, for software versions:
kernel-5.8.0 + patch James refered to above
Xorg-1.20.8-1.fc32.aarch64 (just the normal fc32 build)

mesa fedora, master or james modifier branch (james' branch is hitting
a different assert, so maybe that could behave differently for you as
well)
but my meson args are those: -Dplatforms=auto -Dllvm=false
-Dgallium-drivers="nouveau, tegra" -Dbuildtype=debug

But I am seeing a bunch of messages in dmesg in a release build as well:
[  233.080649] nouveau 57000000.gpu: gr: DATA_ERROR 00000003
[INVALID_OPERATION] ch 4 [0400323000 glxgears[412]] subc 0 class b197
mthd 19d0 data 0000003d
[  233.094237] nouveau 57000000.gpu: gr: DATA_ERROR 0000009c [] ch 4
[0400323000 glxgears[412]] subc 0 class b197 mthd 0d78 data 00000052
[  233.106327] nouveau 57000000.gpu: gr: DATA_ERROR 0000009c [] ch 4
[0400323000 glxgears[412]] subc 0 class b197 mthd 0d78 data 00000050

But at the moment I kind of expect Xorg to be the difference. I will
try with Xorg from git and see if it goes away.

> Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
