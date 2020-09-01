Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD22F258D28
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 13:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8757C89A1F;
	Tue,  1 Sep 2020 11:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EFB89A1F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598958362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8w2WlUv+H/I1Eu/REhxEyfi/rg9UARdYCaNPs0i6dkE=;
 b=KlijjR5+7PmTWFv15s2PrHEEjZE3TqiOZ71tmZnHZ8SjVAoA53locqrZFtXAM0AL/Bkknk
 PeDtqI2ZnsbGvZ4nATSRFBkCrdkjdfbmhPtVkUOsBclA3RluSgzrsgBnYqBEtRoZppAnDg
 onj/gUnB6PXlwwBaCqRq+YFRl8YfBYo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-YTrwfkXXMb68WkXKdTvtQQ-1; Tue, 01 Sep 2020 06:59:46 -0400
X-MC-Unique: YTrwfkXXMb68WkXKdTvtQQ-1
Received: by mail-qk1-f199.google.com with SMTP id n189so559159qkf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 03:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8w2WlUv+H/I1Eu/REhxEyfi/rg9UARdYCaNPs0i6dkE=;
 b=cNaYPnA1weICy/+Bo2QNtZjyY7KDzWoOuzn7aTdR4yqdZ3I95ObL1WNUIYibh38zJE
 rUmhdJky1t5AORdP3MedVa/7m0NkjBM6d2iaZjxHuEYNsVqgqVViArQ1WcoIZsLQeAUi
 X7TvMxf8rr+DCfl88453yEbqEJOnVSBLBSI1r2wU7mbnnXXyCdPa5W3fYRQEGapE5l6c
 3lN9E3fn6ynCDsBZLAu73SljNeMmvoAbr8AELsHMvtKaLUg8pO7Dhp5ge+IWp+BJwFSq
 CDeZEKjZPa3l5KVyme4aCa86IevlT9TAUo23QaXKfAHroPs81ik54nW5QdNYeZyvCC9C
 kTrg==
X-Gm-Message-State: AOAM531cyj5xWW+zoaX6yoWJ+7nkgvKm89Fh2I+ze++kW1mdUCytxGPb
 jZ9JzCrYjVyaCwfQvgH4VRdepTNEV42PJz6ZwC7UDYPwig8jdlwLPSle/thVp64zqEX5VCDXeTt
 ZjjqoT/0B6brx5Hd3QQpZIzBwqH83jSuXffRezNh84SQ9
X-Received: by 2002:ac8:441a:: with SMTP id j26mr1087815qtn.286.1598957986007; 
 Tue, 01 Sep 2020 03:59:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlUruQ7Duj2+bVHLrk5GqD5uPsYaP/XPb/Y7odgPbp+85iUa4SU6DmswTwNYxEaUusXKsZupint1wybl2Xmkw=
X-Received: by 2002:ac8:441a:: with SMTP id j26mr1087794qtn.286.1598957985634; 
 Tue, 01 Sep 2020 03:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
 <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
 <20200814160631.GI556087@ulmo>
 <CACO55tvzoCBNvvnrzn9fSQZwB-hXPPApFMkbJ+ZGWDHgkgkJTw@mail.gmail.com>
 <20200814162210.GA611027@ulmo>
 <CAPj87rMXXTNntwYk=58tVRRkjvYJb-+a=bnzJZjWJv21v_+7KQ@mail.gmail.com>
 <CAKMK7uFsTP-tN49SKJhm9w49EF3Ars0c1bF4=iUrEtKHCLzCTg@mail.gmail.com>
 <20200818143751.GB814860@ulmo> <20200901071347.GP2352366@phenom.ffwll.local>
In-Reply-To: <20200901071347.GP2352366@phenom.ffwll.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 1 Sep 2020 12:59:34 +0200
Message-ID: <CACO55tu5soeY1BvjgJZ-egVpJVZJiWOOHi5NvNR2JQQsJ_kgvQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 1, 2020 at 9:13 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Aug 18, 2020 at 04:37:51PM +0200, Thierry Reding wrote:
> > On Fri, Aug 14, 2020 at 07:25:17PM +0200, Daniel Vetter wrote:
> > > On Fri, Aug 14, 2020 at 7:17 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Fri, 14 Aug 2020 at 17:22, Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > > I suspect that the reason why this works in X but not in Wayland is
> > > > > because X passes the right usage flags, whereas Weston may not. But I'll
> > > > > have to investigate more in order to be sure.
> > > >
> > > > Weston allocates its own buffers for displaying the result of
> > > > composition through GBM with USE_SCANOUT, which is definitely correct.
> > > >
> > > > Wayland clients (common to all compositors, in Mesa's
> > > > src/egl/drivers/dri2/platform_wayland.c) allocate with USE_SHARED but
> > > > _not_ USE_SCANOUT, which is correct in that they are guaranteed to be
> > > > shared, but not guaranteed to be scanned out. The expectation is that
> > > > non-scanout-compatible buffers would be rejected by gbm_bo_import if
> > > > not drmModeAddFB2.
> > > >
> > > > One difference between Weston and all other compositors (GNOME Shell,
> > > > KWin, Sway, etc) is that Weston uses KMS planes for composition when
> > > > it can (i.e. when gbm_bo_import from dmabuf + drmModeAddFB2 from
> > > > gbm_bo handle + atomic check succeed), but the other compositors only
> > > > use the GPU. So if you have different assumptions about the layout of
> > > > imported buffers between the GPU and KMS, that would explain a fair
> > > > bit.
> > >
> > > Yeah non-modifiered multi-gpu (of any kind) is pretty much hopeless I
> > > think. I guess the only option is if the tegra mesa driver forces
> > > linear and an extra copy on everything that's USE_SHARED or
> > > USE_SCANOUT.
> >
> > I ended up trying this, but this fails for the X case, unfortunately,
> > because there doesn't seem to be a good synchronization point at which
> > the de-tiling blit could be done. Weston and kmscube end up calling a
> > gallium driver's ->flush_resource() implementation, but that never
> > happens for X and glamor.
> >
> > But after looking into this some more, I don't think that's even the
> > problem that we're facing here. The root of the problem that causes the
> > glxgears crash that Karol was originally reporting is because we end up
> > allocating the glxgears pixmaps using the dri3 loader from Mesa. But the
> > dri3 loader will unconditionally pass both __DRI_IMAGE_USE_SHARE and
> > __DRI_IMAGE_USE_SCANOUT, irrespective of whether the buffer will end up
> > being scanned out directly or whether it will be composited onto the
> > root window.
> >
> > What exactly happens depends on whether I run glxgears in fullscreen
> > mode or windowed mode. In windowed mode, the glxgears buffers will be
> > composited onto the root window, so there's no need for the buffers to
> > be scanout-capable. If I modify the dri3 loader to not pass those flags
> > I can make this work just fine.
> >
> > When I run glxgears in fullscreen mode, the modesetting driver ends up
> > wanting to display the glxgears buffer directly on screen, without
> > compositing it onto the root window. This ends up working if I leave out
> > the _USE_SHARE and _USE_SCANOUT flags, but I notice that the kernel then
> > complains about being unable to create a framebuffer, which in turn is
> > caused by the fact that those buffers are not exported (the Tegra Mesa
> > driver only exports/imports buffers that are meant for scanout, under
> > the assumption that those are the only ones that will ever need to be
> > used by KMS) and therefore Tegra DRM doesn't have a valid handle for
> > them.
> >
> > So I think an ideal solution would probably be for glxgears to somehow
> > pass better usage information when allocating buffers, but I suspect
> > that that's just not possible, or would be way too much work and require
> > additional protocol at the DRI level, so it's not really a good option
> > when all we want to fix is backwards-compatibility with pre-modifiers
> > userspace.
> >
> > Given that glamor also doesn't have any synchronization points, I don't
> > see how I can implement the de-tiling blit reliably. I was wondering if
> > it shouldn't be possible to flush the framebuffer resource (and perform
> > the blit) at presentation time, but I couldn't find a good entry point
> > to do this.
> >
> > One other solution that occurred to me was to reintroduce an old IOCTL
> > that we used to have in the Tegra DRM driver. That IOCTL was meant to
> > attach tiling meta data to an imported buffer and was basically a
> > simplified, driver-specific way of doing framebuffer modifiers. That's
> > a very ugly solution, but it would allow us to be backwards-compatible
> > with pre-modifiers userspace and even use an optimal path for rendering
> > and scanning out. The only prerequisite would be that the driver IOCTL
> > was implemented and that a recent enough Mesa was used to make use of
> > it. I don't like this very much because framebuffer modifiers are a much
> > more generic solution, but all of the other options above are pretty
> > much just as ugly.
> >
> > One other idea that I haven't explored yet is to be a little more clever
> > about the export/import dance that we do for buffers. Currently we
> > export/import at allocation time, and that seems to cause a bit of a
> > problem, like the lack of valid GEM handles for some buffers (such as in
> > the glxgears fullscreen use-case discussed above). I wonder if perhaps
> > deferring the export/import dance until the handles are actually
> > required may be a better way to do this. With such a solution, even if a
> > buffer is allocated for scanout, it won't actually be imported/exported
> > if the client ends up being composited onto the root window. Import and
> > export would be limited to buffers that truly are going to be used for
> > drmModeAddFB2(). I'll give that a shot and see if that gets me closer to
> > my goal.
>
> (back from vacations)
>
> I think right thing to do is *shrug*, please use modifiers. They're meant
> to solve these kind of problems for real, adding more hacks to paper over
> userspace not using modifiers doesn't seem like a good idea.
>
> Wrt dri3, since we do client-side allocations and don't have modifiers, we
> have to pessimistically assume we'll get scanned out. Modifiers and
> relevant protocol is fixing this again, but for tegra where we essentially
> can't get this right that leaves us in a very tough spot.
>
> So yeah I think "use modifiers" is the answer.
> -Daniel

Right.. the issue is just that we don't have any X release fixing it
and some compositors (mutter) don't do the right thing by default
either :/ I will ask around for mutter, but for X we really need to do
a release I think, just I've heard about regressions we need to fix
first.

> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
