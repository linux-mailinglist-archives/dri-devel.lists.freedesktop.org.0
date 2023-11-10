Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907147E7CCD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238AE10E042;
	Fri, 10 Nov 2023 14:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C0810E042
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:01:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8EAEFB82367;
 Fri, 10 Nov 2023 14:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94332C433C8;
 Fri, 10 Nov 2023 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699624902;
 bh=YTP1qlLsC/25Ajc10uwAB3APlp6AT6lDwuME2who/B8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QL3+F1WCEGhNCfJUjgN7DThQ12sRgvduKa1ogoJzD35SzvRxehcRjTNCQmX5StvT5
 LC/622tzYu5UEnFz85ZoCFuMndvL/yy6A7nQbp1Iyk6KuG5gwANZYe6/Ij6hW7ObQq
 caI7ndFxLrUzIzSHXHNaPmOIGmyAfk4iKCD2+QTjLcyhZPDjmnPpqZ3MFLay1g11ud
 A5sLUl0mSKRCfIO+s4LkSpPlsuP5laSFeinnePIefggFgosGxdkDi/4vfUHi6sltOd
 U61nPv5a8qZMTpx7sUNNtVDytt9mGnTwkpQJmpXlGQY5F5g0V3eVMSA8MVxYzAVPo+
 xmjPeW1znl4Jw==
Date: Fri, 10 Nov 2023 15:01:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <nptkmf2w6j7ro74ihthpvkrmc7r2bqm7zljiv2ajpqx565f5ty@o46mdlhzasvu>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
 <ph4ssz5r3afaovoviavkkemfxqyttqucnzl6nnrbyi3tejxfsf@22dyuwq3uyot>
 <x547FihqvjPqU5HRTVPzPb6Gsx8_I4z8LHxxhyiBjTi6fCNHYGKvgfAdQQJlXfcCfbf9rKKK7Tlj4vkZcey0PVaJfgwbEGgPaJIPJfMuou0=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jxfjvg4e5arhfp7h"
Content-Disposition: inline
In-Reply-To: <x547FihqvjPqU5HRTVPzPb6Gsx8_I4z8LHxxhyiBjTi6fCNHYGKvgfAdQQJlXfcCfbf9rKKK7Tlj4vkZcey0PVaJfgwbEGgPaJIPJfMuou0=@emersion.fr>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Iago Toral Quiroga <itoral@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jxfjvg4e5arhfp7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:21:15AM +0000, Simon Ser wrote:
> On Thursday, November 9th, 2023 at 20:17, Maxime Ripard <mripard@kernel.o=
rg> wrote:
>=20
> > > Can we add another function pointer to the struct drm_driver (or
> > > similar) to do the allocation, and move the actual dmabuf handling
> > > code into the core?
> >=20
> > Yeah, I agree here, it just seems easier to provide a global hook and a
> > somewhat sane default to cover all drivers in one go (potentially with
> > additional restrictions, like only for modeset-only drivers or
> > something).
>=20
> First off not all drivers are using the GEM DMA helpers (e.g. vc4 with
> !vc5 does not).

Right. vc4 pre-RPi4 is the exception though, so it's kind of what I
meant by providing sane defaults: the vast majority of drivers are using
GEM DMA helpers, and we should totally let drivers override that if
relevant.

Basically, we already have 2.5 citizen classes, I'd really like to avoid
having 3 officially, even more so if it's not super difficult to do.

> The heap code in this patch only works with drivers leveraging GEM DMA
> helpers.

We could add a new hook to drm_driver to allocate heaps, link to a
default implementation in DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(), and
then use that new hook in your new heap. It would already cover 40
drivers at the moment, instead of just one, with all of them (but
atmel-hlcdc maybe?) being in the same situation than RPi4-vc4 is.

> Then maybe it's somewhat simple to cover typical display devices found
> on split render/display SoCs, however for the rest it's going to be much
> more complicated. For x86 typically there are multiple buffer placements
> supported by the GPU and we need to have one heap per possible placement.
> And then figuring out all of the rules, priority and compatibility stuff
> is a whole other task in and of itself.

But x86 typically doesn't have a split render/display setup, right?

Maxime

--jxfjvg4e5arhfp7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZU43xAAKCRDj7w1vZxhR
xT8NAQDjPnXhc+LzrfM6w+yeQfl7Kp+TafafuwnEmW5bC8Op7AEA5lIhQkL9WqPx
TPrL4NJA/MPRtt/f3tcb3OnHdWaZwQU=
=oG1R
-----END PGP SIGNATURE-----

--jxfjvg4e5arhfp7h--
