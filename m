Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A4D7E721A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 20:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760210E233;
	Thu,  9 Nov 2023 19:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED2610E232
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 19:17:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3AF72CE1357;
 Thu,  9 Nov 2023 19:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B84C433C8;
 Thu,  9 Nov 2023 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699557424;
 bh=kwClf3z18JsElVUryUg/fNBrdEHIx3Ncx2GhkFyXLHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bwtt7NjgRvliSuPpYppWj6zdVs9MGjK5iOc91TZc89vLfNGagMb12vcJPK5+5Fs4K
 oU/M0M/KIDYVCvIv61Od3oOEj8a7ubiiS5sKGIyIWj2EXeb/jtaOx4DDwE4pSFPUYR
 bHVsrhtnn0eqmbkKkzKNADlMuCsm5UtTMxF8LWpuUmr8aT1CXI6IEpshPvj4mI0g67
 SU2J7TTXg4999VJnNFZdITrPW3NEyQNdM8vZuzmRwON+24kp6nxDWhu7Lkdv2pNQO+
 wHdyydIe4MGwCsnSP0nyPV8DVaJ2jlhL8kvNjEkrmVR90hwtwrLhfg37H7Umsf2h0m
 AAW/JC33NUliw==
Date: Thu, 9 Nov 2023 20:17:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <ph4ssz5r3afaovoviavkkemfxqyttqucnzl6nnrbyi3tejxfsf@22dyuwq3uyot>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3z56ybpw5az3tw6s"
Content-Disposition: inline
In-Reply-To: <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Iago Toral Quiroga <itoral@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3z56ybpw5az3tw6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 03:42:38PM +0000, Dave Stevenson wrote:
> Hi Simon and Maxime
>=20
> On Thu, 9 Nov 2023 at 09:12, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi Simon,
> >
> > On Thu, Nov 09, 2023 at 07:45:58AM +0000, Simon Ser wrote:
> > > User-space sometimes needs to allocate scanout-capable memory for
> > > GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> > > is achieved via DRM dumb buffers: the v3d user-space driver opens
> > > the primary vc4 node, allocates a DRM dumb buffer there, exports it
> > > as a DMA-BUF, imports it into the v3d render node, and renders to it.
> > >
> > > However, DRM dumb buffers are only meant for CPU rendering, they are
> > > not intended to be used for GPU rendering. Primary nodes should only
> > > be used for mode-setting purposes, other programs should not attempt
> > > to open it. Moreover, opening the primary node is already broken on
> > > some setups: systemd grants permission to open primary nodes to
> > > physically logged in users, but this breaks when the user is not
> > > physically logged in (e.g. headless setup) and when the distribution
> > > is using a different init (e.g. Alpine Linux uses openrc).
> > >
> > > We need an alternate way for v3d to allocate scanout-capable memory.
> > > Leverage DMA heaps for this purpose: expose a CMA heap to user-space.
> > > Preliminary testing has been done with wlroots [1].
> > >
> > > This is still an RFC. Open questions:
> > >
> > > - Does this approach make sense to y'all in general?
> >
> > Makes sense to me :)
> >
> > > - What would be a good name for the heap? "vc4" is maybe a bit naive =
and
> > >   not precise enough. Something with "cma"? Do we need to plan a nami=
ng
> > >   scheme to accomodate for multiple vc4 devices?
> >
> > That's a general issue though that happens with pretty much all devices
> > with a separate node for modesetting and rendering, so I don't think
> > addressing it only for vc4 make sense, we should make it generic.
> >
> > So maybe something like "scanout"?
> >
> > One thing we need to consider too is that the Pi5 will have multiple
> > display nodes (4(?) iirc) with different capabilities, vc4 being only
> > one of them. This will impact that solution too.
>=20
> It does need to scale.
>=20
> Pi5 adds 4 additional DRM devices (2xDSI, 1xDPI, and 1xComposite
> Video), and just this last week I've been running Wayfire with TinyDRM
> drivers for SPI displays and UDL (DisplayLink) outputs as well.
> Presumably all of those drivers need to have appropriate hooks added
> so they each expose a dma-heap to enable scanout buffers to be
> allocated.
>=20
> Can we add another function pointer to the struct drm_driver (or
> similar) to do the allocation, and move the actual dmabuf handling
> code into the core?

Yeah, I agree here, it just seems easier to provide a global hook and a
somewhat sane default to cover all drivers in one go (potentially with
additional restrictions, like only for modeset-only drivers or
something).

Maxime

--3z56ybpw5az3tw6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZU0wLQAKCRDj7w1vZxhR
xen+AP4/VGxeUeVw0G8R/0YlcJWI8UCc+K0F+y018uLmxWbb3QEAjTDSz+mUmAsF
7G1he1M0CTwL287mGA+z2tc2cPtDAws=
=1SZD
-----END PGP SIGNATURE-----

--3z56ybpw5az3tw6s--
