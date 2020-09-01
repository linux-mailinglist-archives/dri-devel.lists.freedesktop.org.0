Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D52588D6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CD189218;
	Tue,  1 Sep 2020 07:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97B689218
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 07:13:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z4so264608wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 00:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ge/cub5oifginJ60ZEJ8LKdbDp1WbagdRZxikItCBTA=;
 b=LRlJSTY7vJnCebLIDNAT/b1adOABRrSxCvobyIxdrbOxoOZXK25jfV8Ln9S5oaSp3l
 CsB8B70zPPAwqHM3yeXWBFf3aEjILK1jR4A63/qHaPtH2q3t592p5r638jL3TVzqtgT1
 g0T1Ca+Ktg/c9afMT0AX4ECJWSpCJnQd983e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ge/cub5oifginJ60ZEJ8LKdbDp1WbagdRZxikItCBTA=;
 b=cJCZ/loiCHAe8BLMC/XWeCGefdTBFXPvYfFG35tyUnJCEjoyuMANu1c0LChJhyXj8V
 9T8eIwiyuWN8HJwmrgQCjItymveAbSzqNUOJFkoeFWi62SvNrf3+kOBcL9QkWboOb9/G
 V/XsraX8+OcHp1AcepGGUvIIN+8Yv587iltDXW0oXNaQ7nZHZUj4sTWeSPc4mkGMPH9V
 Pw+/HFiVwnDERXxUWBMNQ5NKhgq/OO8DqZ0jIXBh5ImDOvxB2EKK5CY8/lH2g4XlJkf8
 H4ST6PnaUHpna4XmCExIKwUFKpHb/Rz/+8LHyMPe46gLpmry3coDk6vs8mESJ4rtlG/U
 mUFg==
X-Gm-Message-State: AOAM5318Pkultj8OzpQwQ/tjOHKgj5zgFhT2PfWcptI/kP2qH+f5p3Y4
 V4QuSmUcLrLaPVjXC40S4xsSxQeU6Pm09tV0
X-Google-Smtp-Source: ABdhPJx021mpGY6+ZcAp85x8oeIftu6hyEEO11sOANvud2lgWfxkhcZn1Z5W/w2s463Wxx7NhbFGCg==
X-Received: by 2002:adf:f011:: with SMTP id j17mr245620wro.335.1598944430319; 
 Tue, 01 Sep 2020 00:13:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y1sm706937wru.87.2020.09.01.00.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 00:13:48 -0700 (PDT)
Date: Tue, 1 Sep 2020 09:13:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200901071347.GP2352366@phenom.ffwll.local>
References: <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
 <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
 <20200814160631.GI556087@ulmo>
 <CACO55tvzoCBNvvnrzn9fSQZwB-hXPPApFMkbJ+ZGWDHgkgkJTw@mail.gmail.com>
 <20200814162210.GA611027@ulmo>
 <CAPj87rMXXTNntwYk=58tVRRkjvYJb-+a=bnzJZjWJv21v_+7KQ@mail.gmail.com>
 <CAKMK7uFsTP-tN49SKJhm9w49EF3Ars0c1bF4=iUrEtKHCLzCTg@mail.gmail.com>
 <20200818143751.GB814860@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818143751.GB814860@ulmo>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Karol Herbst <kherbst@redhat.com>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 04:37:51PM +0200, Thierry Reding wrote:
> On Fri, Aug 14, 2020 at 07:25:17PM +0200, Daniel Vetter wrote:
> > On Fri, Aug 14, 2020 at 7:17 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, 14 Aug 2020 at 17:22, Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > I suspect that the reason why this works in X but not in Wayland is
> > > > because X passes the right usage flags, whereas Weston may not. But I'll
> > > > have to investigate more in order to be sure.
> > >
> > > Weston allocates its own buffers for displaying the result of
> > > composition through GBM with USE_SCANOUT, which is definitely correct.
> > >
> > > Wayland clients (common to all compositors, in Mesa's
> > > src/egl/drivers/dri2/platform_wayland.c) allocate with USE_SHARED but
> > > _not_ USE_SCANOUT, which is correct in that they are guaranteed to be
> > > shared, but not guaranteed to be scanned out. The expectation is that
> > > non-scanout-compatible buffers would be rejected by gbm_bo_import if
> > > not drmModeAddFB2.
> > >
> > > One difference between Weston and all other compositors (GNOME Shell,
> > > KWin, Sway, etc) is that Weston uses KMS planes for composition when
> > > it can (i.e. when gbm_bo_import from dmabuf + drmModeAddFB2 from
> > > gbm_bo handle + atomic check succeed), but the other compositors only
> > > use the GPU. So if you have different assumptions about the layout of
> > > imported buffers between the GPU and KMS, that would explain a fair
> > > bit.
> > 
> > Yeah non-modifiered multi-gpu (of any kind) is pretty much hopeless I
> > think. I guess the only option is if the tegra mesa driver forces
> > linear and an extra copy on everything that's USE_SHARED or
> > USE_SCANOUT.
> 
> I ended up trying this, but this fails for the X case, unfortunately,
> because there doesn't seem to be a good synchronization point at which
> the de-tiling blit could be done. Weston and kmscube end up calling a
> gallium driver's ->flush_resource() implementation, but that never
> happens for X and glamor.
> 
> But after looking into this some more, I don't think that's even the
> problem that we're facing here. The root of the problem that causes the
> glxgears crash that Karol was originally reporting is because we end up
> allocating the glxgears pixmaps using the dri3 loader from Mesa. But the
> dri3 loader will unconditionally pass both __DRI_IMAGE_USE_SHARE and
> __DRI_IMAGE_USE_SCANOUT, irrespective of whether the buffer will end up
> being scanned out directly or whether it will be composited onto the
> root window.
> 
> What exactly happens depends on whether I run glxgears in fullscreen
> mode or windowed mode. In windowed mode, the glxgears buffers will be
> composited onto the root window, so there's no need for the buffers to
> be scanout-capable. If I modify the dri3 loader to not pass those flags
> I can make this work just fine.
> 
> When I run glxgears in fullscreen mode, the modesetting driver ends up
> wanting to display the glxgears buffer directly on screen, without
> compositing it onto the root window. This ends up working if I leave out
> the _USE_SHARE and _USE_SCANOUT flags, but I notice that the kernel then
> complains about being unable to create a framebuffer, which in turn is
> caused by the fact that those buffers are not exported (the Tegra Mesa
> driver only exports/imports buffers that are meant for scanout, under
> the assumption that those are the only ones that will ever need to be
> used by KMS) and therefore Tegra DRM doesn't have a valid handle for
> them.
> 
> So I think an ideal solution would probably be for glxgears to somehow
> pass better usage information when allocating buffers, but I suspect
> that that's just not possible, or would be way too much work and require
> additional protocol at the DRI level, so it's not really a good option
> when all we want to fix is backwards-compatibility with pre-modifiers
> userspace.
> 
> Given that glamor also doesn't have any synchronization points, I don't
> see how I can implement the de-tiling blit reliably. I was wondering if
> it shouldn't be possible to flush the framebuffer resource (and perform
> the blit) at presentation time, but I couldn't find a good entry point
> to do this.
> 
> One other solution that occurred to me was to reintroduce an old IOCTL
> that we used to have in the Tegra DRM driver. That IOCTL was meant to
> attach tiling meta data to an imported buffer and was basically a
> simplified, driver-specific way of doing framebuffer modifiers. That's
> a very ugly solution, but it would allow us to be backwards-compatible
> with pre-modifiers userspace and even use an optimal path for rendering
> and scanning out. The only prerequisite would be that the driver IOCTL
> was implemented and that a recent enough Mesa was used to make use of
> it. I don't like this very much because framebuffer modifiers are a much
> more generic solution, but all of the other options above are pretty
> much just as ugly.
> 
> One other idea that I haven't explored yet is to be a little more clever
> about the export/import dance that we do for buffers. Currently we
> export/import at allocation time, and that seems to cause a bit of a
> problem, like the lack of valid GEM handles for some buffers (such as in
> the glxgears fullscreen use-case discussed above). I wonder if perhaps
> deferring the export/import dance until the handles are actually
> required may be a better way to do this. With such a solution, even if a
> buffer is allocated for scanout, it won't actually be imported/exported
> if the client ends up being composited onto the root window. Import and
> export would be limited to buffers that truly are going to be used for
> drmModeAddFB2(). I'll give that a shot and see if that gets me closer to
> my goal.

(back from vacations)

I think right thing to do is *shrug*, please use modifiers. They're meant
to solve these kind of problems for real, adding more hacks to paper over
userspace not using modifiers doesn't seem like a good idea.

Wrt dri3, since we do client-side allocations and don't have modifiers, we
have to pessimistically assume we'll get scanned out. Modifiers and
relevant protocol is fixing this again, but for tegra where we essentially
can't get this right that leaves us in a very tough spot.

So yeah I think "use modifiers" is the answer.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
