Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138162487D5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 16:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC7689D4F;
	Tue, 18 Aug 2020 14:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0855489D4F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:37:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id p20so18530899wrf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JLW0F94bv93ojF5Ape3UkpgVowpiXyZf1796ZiYG/D0=;
 b=eL5Z/SI9rJySb5+DgW2LTAunU0O2nG8Is98j4yT00Hli3DVDaPtHzhocksaqQRqGCq
 35rzMTTQ7+D/MXG5U4CNgRoSwX2s2JQceZPkDuh0wn3Ju9wjGP7kUZFxdkV+xCyqwXRV
 soXAA2xmK2/gpe0ZICXaWi/k69G5xlmtzm8ITDhkud8yA8IdGQ2agMgZb1xqv18B0ktO
 tVLBGtXIQaVnl3FIMu+8x7hlkld3BozJQyeTMaDeJYTPkpiwKHiVIVq2m1wrMbdTnO/u
 N6qkbKTfWwA6Fp9irSM7wsLmDcL17slT9UV0KpyaeUrEQdWUAKHymlYiXAmrUcbx1GWU
 8UIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JLW0F94bv93ojF5Ape3UkpgVowpiXyZf1796ZiYG/D0=;
 b=fHunsSNjXFgi9ypRPIMMyU11TVDVNZj8Tm47fNBX7LIi+c+8LMNTtAyo/O3Cxs0ViM
 w7+1oadh43a9fLDaipH19c9b9GN77AF5G3MgiYhGiYt7K88ghWboJOSqBAUD4V8yrSty
 pmMjZINoGMlgodjZeBqrNHEAtUDqBgeBcP40lhbbTQkMUZ4vFmvk5yuBaE4twDqCrqPI
 2TVxLxzsmzYTa5+o6oJI/5Vb0KYnQoeofo0Bv5E5cusdXmYgxb4cO9qJyU1qqQvcSy8R
 U36hPuEADOHCZkHc9NR6cCGVi61PidlUbGrjaQCpvKXUR/PpegGMW5IRP8bttt9x0hfT
 V81Q==
X-Gm-Message-State: AOAM531pEiboEmZBb2ocxsw77p+PJ+XUldX0sqmEGOJ41W7BY5a8FgIf
 IBMS7Yz4960JyiJ55EqKwAY=
X-Google-Smtp-Source: ABdhPJwHX/kuSquwvjEpJp7oe/Oc4rFL6NP8C7Ez9cjYLaNA1E2anH3wAhOQGHmbRnVC/JWutSfmrw==
X-Received: by 2002:adf:b18d:: with SMTP id q13mr20280099wra.256.1597761474515; 
 Tue, 18 Aug 2020 07:37:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id n12sm37103937wrq.63.2020.08.18.07.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 07:37:53 -0700 (PDT)
Date: Tue, 18 Aug 2020 16:37:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200818143751.GB814860@ulmo>
References: <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
 <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
 <20200814160631.GI556087@ulmo>
 <CACO55tvzoCBNvvnrzn9fSQZwB-hXPPApFMkbJ+ZGWDHgkgkJTw@mail.gmail.com>
 <20200814162210.GA611027@ulmo>
 <CAPj87rMXXTNntwYk=58tVRRkjvYJb-+a=bnzJZjWJv21v_+7KQ@mail.gmail.com>
 <CAKMK7uFsTP-tN49SKJhm9w49EF3Ars0c1bF4=iUrEtKHCLzCTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFsTP-tN49SKJhm9w49EF3Ars0c1bF4=iUrEtKHCLzCTg@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Content-Type: multipart/mixed; boundary="===============0636310621=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0636310621==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 07:25:17PM +0200, Daniel Vetter wrote:
> On Fri, Aug 14, 2020 at 7:17 PM Daniel Stone <daniel@fooishbar.org> wrote:
> >
> > Hi,
> >
> > On Fri, 14 Aug 2020 at 17:22, Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > > I suspect that the reason why this works in X but not in Wayland is
> > > because X passes the right usage flags, whereas Weston may not. But I=
'll
> > > have to investigate more in order to be sure.
> >
> > Weston allocates its own buffers for displaying the result of
> > composition through GBM with USE_SCANOUT, which is definitely correct.
> >
> > Wayland clients (common to all compositors, in Mesa's
> > src/egl/drivers/dri2/platform_wayland.c) allocate with USE_SHARED but
> > _not_ USE_SCANOUT, which is correct in that they are guaranteed to be
> > shared, but not guaranteed to be scanned out. The expectation is that
> > non-scanout-compatible buffers would be rejected by gbm_bo_import if
> > not drmModeAddFB2.
> >
> > One difference between Weston and all other compositors (GNOME Shell,
> > KWin, Sway, etc) is that Weston uses KMS planes for composition when
> > it can (i.e. when gbm_bo_import from dmabuf + drmModeAddFB2 from
> > gbm_bo handle + atomic check succeed), but the other compositors only
> > use the GPU. So if you have different assumptions about the layout of
> > imported buffers between the GPU and KMS, that would explain a fair
> > bit.
>=20
> Yeah non-modifiered multi-gpu (of any kind) is pretty much hopeless I
> think. I guess the only option is if the tegra mesa driver forces
> linear and an extra copy on everything that's USE_SHARED or
> USE_SCANOUT.

I ended up trying this, but this fails for the X case, unfortunately,
because there doesn't seem to be a good synchronization point at which
the de-tiling blit could be done. Weston and kmscube end up calling a
gallium driver's ->flush_resource() implementation, but that never
happens for X and glamor.

But after looking into this some more, I don't think that's even the
problem that we're facing here. The root of the problem that causes the
glxgears crash that Karol was originally reporting is because we end up
allocating the glxgears pixmaps using the dri3 loader from Mesa. But the
dri3 loader will unconditionally pass both __DRI_IMAGE_USE_SHARE and
__DRI_IMAGE_USE_SCANOUT, irrespective of whether the buffer will end up
being scanned out directly or whether it will be composited onto the
root window.

What exactly happens depends on whether I run glxgears in fullscreen
mode or windowed mode. In windowed mode, the glxgears buffers will be
composited onto the root window, so there's no need for the buffers to
be scanout-capable. If I modify the dri3 loader to not pass those flags
I can make this work just fine.

When I run glxgears in fullscreen mode, the modesetting driver ends up
wanting to display the glxgears buffer directly on screen, without
compositing it onto the root window. This ends up working if I leave out
the _USE_SHARE and _USE_SCANOUT flags, but I notice that the kernel then
complains about being unable to create a framebuffer, which in turn is
caused by the fact that those buffers are not exported (the Tegra Mesa
driver only exports/imports buffers that are meant for scanout, under
the assumption that those are the only ones that will ever need to be
used by KMS) and therefore Tegra DRM doesn't have a valid handle for
them.

So I think an ideal solution would probably be for glxgears to somehow
pass better usage information when allocating buffers, but I suspect
that that's just not possible, or would be way too much work and require
additional protocol at the DRI level, so it's not really a good option
when all we want to fix is backwards-compatibility with pre-modifiers
userspace.

Given that glamor also doesn't have any synchronization points, I don't
see how I can implement the de-tiling blit reliably. I was wondering if
it shouldn't be possible to flush the framebuffer resource (and perform
the blit) at presentation time, but I couldn't find a good entry point
to do this.

One other solution that occurred to me was to reintroduce an old IOCTL
that we used to have in the Tegra DRM driver. That IOCTL was meant to
attach tiling meta data to an imported buffer and was basically a
simplified, driver-specific way of doing framebuffer modifiers. That's
a very ugly solution, but it would allow us to be backwards-compatible
with pre-modifiers userspace and even use an optimal path for rendering
and scanning out. The only prerequisite would be that the driver IOCTL
was implemented and that a recent enough Mesa was used to make use of
it. I don't like this very much because framebuffer modifiers are a much
more generic solution, but all of the other options above are pretty
much just as ugly.

One other idea that I haven't explored yet is to be a little more clever
about the export/import dance that we do for buffers. Currently we
export/import at allocation time, and that seems to cause a bit of a
problem, like the lack of valid GEM handles for some buffers (such as in
the glxgears fullscreen use-case discussed above). I wonder if perhaps
deferring the export/import dance until the handles are actually
required may be a better way to do this. With such a solution, even if a
buffer is allocated for scanout, it won't actually be imported/exported
if the client ends up being composited onto the root window. Import and
export would be limited to buffers that truly are going to be used for
drmModeAddFB2(). I'll give that a shot and see if that gets me closer to
my goal.

Thierry

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl87570ACgkQ3SOs138+
s6FEXg//QtSc0TbJZTBARBv/gEPiBvA6uzrbQYIy4C95UA0ecSh7gdWBSf1Gu3ci
PDsSi5segKQHPvX2DPgtQ7ZWv21eBcQ7vWyt2hRz3wkQPPFjpGI9FjT4DTECo3vC
DfcY20LXVUwbKr1MGgE6PB6gLYn/VF1KCtOSvOZzXGs+cfwswyX4vZc0R92WY2QT
CY89oHbepRmf5xJPFlcJiPslIvao8iYLkancbAk7tSjw1q0WU5J7riySl93x1Oxx
Tca8239tWpKLv3X0yspfa3SJ5N5ZH8oK0uYp+rURYLHls7Qz7gplUYKAEJLQuqZO
EjDtouQ4ch40SPbJZR7AmUWiDC/rCGbfcA0lcZK7EU4wMf1qJwCtngAYxOBgo2uq
XyfpTSghmJRQo0/VJ+fgWC+uCxEWQ7ifNduwMLGsvlcAhs66O4PMnIgDJxqqzuyo
4rFneE917eYidrQqbJcEpoUHbWolj9MepRLUDll4ryXthgXOXodQNOloIbYZtIV0
RX6cUhWs+IXWrtUz6A5mPUQmE5RUhiXoEytpMt6daXSly12R/Lb6DMqctOtEQsxq
e6ROKeg6+2emB5odp1HBn+oIrr2Y+TL8TBaAnW6CjmDJSzTZy7SpYzGCSBZ6aTMK
7POeMwsY0yisAUZ7j6dRjRSNYogBIJqo8su/fAgs45SW5GT+iig=
=AdDi
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--

--===============0636310621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0636310621==--
