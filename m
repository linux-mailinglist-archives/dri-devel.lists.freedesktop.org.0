Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932E4242C56
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 17:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E686E90F;
	Wed, 12 Aug 2020 15:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FA56E90F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597247378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e+4IXDNIc7Sb1mguJsRjf7uQW+uymk1nzfer8L5EUgs=;
 b=WE2YbMnaGElp8yy93rpzQWRwu2AAb5Be8ICvEaetbaoOwdQ99j1oUnIgmGiA0ZHU9ZfaxE
 yFh/NDa2Ydd5IB7jwxYv4cYGj4x14e22u542M9dPISzzfL2dKX85tvEO4exTlGKIhgsZw0
 d4FakCONQUwBQ2dSYbn5GReo20PEGtc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-TK8caZcuMCO_IlfwGvzoZw-1; Wed, 12 Aug 2020 11:49:32 -0400
X-MC-Unique: TK8caZcuMCO_IlfwGvzoZw-1
Received: by mail-qt1-f200.google.com with SMTP id z5so1990254qtc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+4IXDNIc7Sb1mguJsRjf7uQW+uymk1nzfer8L5EUgs=;
 b=QokuLsx7M9DMlRrd3aHRblQ+ahgsIbos/FQrZ/k1C4px/xnEAo9zuVTUnL/lrC4HlH
 9opDNwQN2dNZtZzCUCNw3dJnaoYl41wrbJm1L9wIzitq3xTAUbI/fTRRKmh0RKEd2UlC
 s/p1SIy54mHl7Vh1CHSijewpDZq9d8sKNNJ4bjY9358Dt2/bh5bPUdcrrFx37HxOVeFM
 7ADvcYIXoSSxVCI0iTrnoh7bnOqnyVx5/iUYq3t3d64x4sDt/bD7KQPe+2mAjSGj6Whd
 x932eV1gdoQlVxbIUa18L0oUhx0ZRgh1UXYMMDz3Xmc2c1pW22KiSRqmEics8AQS1Mqf
 tOxw==
X-Gm-Message-State: AOAM530vrgzy+W7hp8JfxNwSQ3hN99tZaXF2rNDB7P18o68geKV9rAJp
 /fpVK2bjqgrjZ+5BIF0EEawc7AA/ck23wLjlobWWN+zgRiZm7QA1Crld1f20AoQhg4ZGY+A+BPx
 vcN955W52+J84mD/dgy8tJ6ZwTQDvbUOrM7a/KCqog+Sg
X-Received: by 2002:a37:7dc2:: with SMTP id y185mr511169qkc.381.1597247370492; 
 Wed, 12 Aug 2020 08:49:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2FA1stQT+/bWgkcqheTMkj6o827zWu4DgKWKOcUIBSjn8l/ddHPKnjwlsaEyzQib39KzCH+IaT5a1fuFJQA0=
X-Received: by 2002:a37:7dc2:: with SMTP id y185mr511136qkc.381.1597247370162; 
 Wed, 12 Aug 2020 08:49:30 -0700 (PDT)
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
 <CACO55ttHSbpPgHAaPRZizPuWCfs1BtAOoVOD8XcCFcEkewCBww@mail.gmail.com>
In-Reply-To: <CACO55ttHSbpPgHAaPRZizPuWCfs1BtAOoVOD8XcCFcEkewCBww@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 12 Aug 2020 17:49:18 +0200
Message-ID: <CACO55ttt1prHpcvWsbNDMPoAom=J1HJ16N=F9Ts0zp=m2h8HUw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thierry Reding <thierry.reding@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.003
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

On Wed, Aug 12, 2020 at 5:20 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 12, 2020 at 5:05 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Wed, Aug 12, 2020 at 12:43:17PM +0200, Karol Herbst wrote:
> > > On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
> > > > >
> > > > > Sorry for the slow reply here as well.  I've been in the process of
> > > > > rebasing and reworking the userspace patches.  I'm not clear my changes
> > > > > will address the Jetson Nano issue, but if you'd like to try them, the
> > > > > latest userspace changes are available here:
> > > > >
> > > > >    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
> > > > >
> > > > > And the tegra-drm kernel patches are here:
> > > > >
> > > > >
> > > > > https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/
> > > > >
> > > > > Those + the kernel changes addressed in this thread are everything I had
> > > > > outstanding.
> > > > >
> > > >
> > > > I don't know if that's caused by your changes or not, but now the
> > > > assert I hit is a different one pointing out that
> > > > nvc0_miptree_select_best_modifier fails in a certain case and returns
> > > > MOD_INVALID... anyway, it seems like with your patches applied it's
> > > > now way easier to debug and figure out what's going wrong, so maybe I
> > > > can figure it out now :)
> > > >
> > >
> > > collected some information which might help to track it down.
> > >
> > > src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsbuf)
> > >
> > > templ is {reference = {count = 0}, width0 = 300, height0 = 300, depth0
> > > = 1, array_size = 1, format = PIPE_FORMAT_Z24X8_UNORM, target =
> > > PIPE_TEXTURE_2D, last_level = 0, nr_samples = 0, nr_storage_samples =
> > > 0, usage = 0, bind = 1, flags = 0, next = 0x0, screen = 0x0}
> > >
> > > inside tegra_screen_resource_create modifier says
> > > DRM_FORMAT_MOD_INVALID as template->bind is 1
> > >
> > > and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALID,
> > > so the call just returns NULL leading to the assert.
> > >
> > > Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.
> >
> > Hi Karol,
> >
> > I'm not sure if I'm doing something wrong, but I can't seem to reproduce
> > these assertions at all. I've got a debug Mesa build from today as well
> > as an X server build from today and if I run glxgears it works just fine
> > for me. This is on Jetson TX1, but I don't think there's any difference
> > to Jetson Nano in that regard. I'll try to give this a try on Jetson
> > Nano as well, just to make sure. I can also try to pull in James'
> > patches to see if they change anything for me.
> >
> > However, perhaps we can compare notes on what exactly your configuration
> > is so that perhaps I can reproduce and take a closer look at what's
> > going on.
> >
> > My Mesa build uses the following configuration:
> >
> >     $ meson --prefix /usr --libexecdir /usr/lib --buildtype debug -Dgles1=false \
> >         -Dgallium-drivers=nouveau,swrast,tegra -Dgallium-opencl=standalone \
> >         -Dvulkan-drivers='' -Dplatforms=wayland,x11,drm,surfaceless \
> >         -Dbuild-tests=true -Dtexture-float=true -Ddri-drivers='' \
> >         -Dgallium-omx=disabled -Dllvm=true
> >
> > And here's what I use for X:
> >
> >     $ meson --prefix /usr --libexecdir /usr/lib \
> >         --libexecdir /usr/lib/xorg-server -Dxdmcp=false
> >
> > I've stripped out some cross-compilation boilerplate there because that
> > shouldn't be relevant. Do you see anything in there that I'm missing and
> > which might be causing the issue not to happen for me?
> >
> > Also, what's the window manager that you use? I use TWM (for simplicity)
> > and I suspect that's not what you use, so perhaps this is relevant
> > somehow as well?
> >
>
> I don't use any at all, just plain X.
>
> Anyway, for software versions:
> kernel-5.8.0 + patch James refered to above
> Xorg-1.20.8-1.fc32.aarch64 (just the normal fc32 build)
>
> mesa fedora, master or james modifier branch (james' branch is hitting
> a different assert, so maybe that could behave differently for you as
> well)
> but my meson args are those: -Dplatforms=auto -Dllvm=false
> -Dgallium-drivers="nouveau, tegra" -Dbuildtype=debug
>
> But I am seeing a bunch of messages in dmesg in a release build as well:
> [  233.080649] nouveau 57000000.gpu: gr: DATA_ERROR 00000003
> [INVALID_OPERATION] ch 4 [0400323000 glxgears[412]] subc 0 class b197
> mthd 19d0 data 0000003d
> [  233.094237] nouveau 57000000.gpu: gr: DATA_ERROR 0000009c [] ch 4
> [0400323000 glxgears[412]] subc 0 class b197 mthd 0d78 data 00000052
> [  233.106327] nouveau 57000000.gpu: gr: DATA_ERROR 0000009c [] ch 4
> [0400323000 glxgears[412]] subc 0 class b197 mthd 0d78 data 00000050
>
> But at the moment I kind of expect Xorg to be the difference. I will
> try with Xorg from git and see if it goes away.

yeah... Xorg from git doesn't cause the errors/asserts.

So.. what do we want to do?

>
> > Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
