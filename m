Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185B7E9A8B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 11:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4627610E32F;
	Mon, 13 Nov 2023 10:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6B910E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 10:52:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 907ED60DE4;
 Mon, 13 Nov 2023 10:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D2FC433C8;
 Mon, 13 Nov 2023 10:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699872756;
 bh=r+cF8t/1JDjYoU5jHldb1WOkP7lg5ttMP9h30f15cHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YK6LKyKF4gIT2lLrx8A7ChOHSnmvKlpWeSvL7LClDxsakDQTwEICxL4rxYTEd+qHM
 pTlsJQQNv16a76PyWZpt5w0MCevIE8flBJ5LfjwB5PDNhTHX1bU3pqT4Jh7hdjhNtS
 aHBerOfxZHBpCzvz4EMdNItSv5FdWhOpesNdYHPSXaibcIMqn2mqRXLuxYdMwpMoot
 4gOa5vjRwEBPp1F2t0/BOBBIlCKxVcFuToBjJZWE8uSaOs8ubGcG2TG74ExReVi4RD
 XHwj0Zoj4V3YPgFFB4cHGgqCrN7iVJDj8TieVo9X8AGT7N9OlWjOAqU8yzs3WcRzXE
 SoXG/J3uLsD1A==
Date: Mon, 13 Nov 2023 11:52:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <5vho2bbvq6ek7watowevagouumsynoqq7yhllq2od3qpqwtspj@77vgr7vlsvyq>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
 <ph4ssz5r3afaovoviavkkemfxqyttqucnzl6nnrbyi3tejxfsf@22dyuwq3uyot>
 <x547FihqvjPqU5HRTVPzPb6Gsx8_I4z8LHxxhyiBjTi6fCNHYGKvgfAdQQJlXfcCfbf9rKKK7Tlj4vkZcey0PVaJfgwbEGgPaJIPJfMuou0=@emersion.fr>
 <nptkmf2w6j7ro74ihthpvkrmc7r2bqm7zljiv2ajpqx565f5ty@o46mdlhzasvu>
 <gQR1IvZQuSocyjbMBXHrYbnNCMHNXwjmItCrmRgRVjG5xF2qFuD1WWB60aik8UNHJpNkPfTweafYINmniOywJpGPqFOSNvdwTemWPBUifeY=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4dwxeuivst2jqyl6"
Content-Disposition: inline
In-Reply-To: <gQR1IvZQuSocyjbMBXHrYbnNCMHNXwjmItCrmRgRVjG5xF2qFuD1WWB60aik8UNHJpNkPfTweafYINmniOywJpGPqFOSNvdwTemWPBUifeY=@emersion.fr>
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


--4dwxeuivst2jqyl6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 02:23:16PM +0000, Simon Ser wrote:
> On Friday, November 10th, 2023 at 15:01, Maxime Ripard <mripard@kernel.or=
g> wrote:
>=20
> > On Fri, Nov 10, 2023 at 11:21:15AM +0000, Simon Ser wrote:
> >=20
> > > On Thursday, November 9th, 2023 at 20:17, Maxime Ripard mripard@kerne=
l.org wrote:
> > >=20
> > > > > Can we add another function pointer to the struct drm_driver (or
> > > > > similar) to do the allocation, and move the actual dmabuf handling
> > > > > code into the core?
> > > >=20
> > > > Yeah, I agree here, it just seems easier to provide a global hook a=
nd a
> > > > somewhat sane default to cover all drivers in one go (potentially w=
ith
> > > > additional restrictions, like only for modeset-only drivers or
> > > > something).
> > >=20
> > > First off not all drivers are using the GEM DMA helpers (e.g. vc4 with
> > > !vc5 does not).
> >=20
> > Right. vc4 pre-RPi4 is the exception though, so it's kind of what I
> > meant by providing sane defaults: the vast majority of drivers are using
> > GEM DMA helpers, and we should totally let drivers override that if
> > relevant.
> >=20
> > Basically, we already have 2.5 citizen classes, I'd really like to avoid
> > having 3 officially, even more so if it's not super difficult to do.
> >=20
> > > The heap code in this patch only works with drivers leveraging GEM DMA
> > > helpers.
> >=20
> > We could add a new hook to drm_driver to allocate heaps, link to a
> > default implementation in DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(), and
> > then use that new hook in your new heap. It would already cover 40
> > drivers at the moment, instead of just one, with all of them (but
> > atmel-hlcdc maybe?) being in the same situation than RPi4-vc4 is.
>=20
> As said in another e-mail, I really think the consequences of DMA heaps
> need to be thought out on a per-driver basis.

The issue you pointed out doesn't show up on a per-driver basis though.

> Moreover this approach makes core DRM go in the wrong direction,
> deeper in midlayer territory.

I have no idea why that makes it more of a midlayer here, but even if it
does, just because it does doesn't mean it's bad or something to avoid.
We've been striving for more than a decade now to make drivers easy to
write and easy to extend / deviate from the norm.

AFAIK, what I suggested provides both. Yours create unnecessary
boilerplate and will leave a lot of drivers out of a needed solution.

> > > Then maybe it's somewhat simple to cover typical display devices found
> > > on split render/display SoCs, however for the rest it's going to be m=
uch
> > > more complicated. For x86 typically there are multiple buffer placeme=
nts
> > > supported by the GPU and we need to have one heap per possible placem=
ent.
> > > And then figuring out all of the rules, priority and compatibility st=
uff
> > > is a whole other task in and of itself.
> >=20
> > But x86 typically doesn't have a split render/display setup, right?
>=20
> So you're saying we should fix everything at once, but why is x86 not
> part of "everything" then?

"everything" is your word, not mine. I'm saying that the issue you've
mentioned for this series applies to a lot of other drivers, and we
should fix it for those too.

x86 doesn't suffer from the issue you've mentioned, just like the Pi0-3,
and thus we don't have to come up with a solution for them.

> x86 also has issues regarding buffer placement. You're saying you
> don't want to fragment the ecosystem, but it seems like there would
> still be "fragmentation" between split render/display SoCs and the
> rest?

If you want to come up with a generic solution to buffer placement, then
you need to consider both sides. A buffer that can be addressed by the
scanout engine might not be addressable by the codec that will fill that
buffer for example.

The problem is far broader than what you described here, and the
solution far more involved too.

I don't see why you're bringing that up here, I don't think we need a
solution for that at this point, and yet I think your current patch is a
step in the right direction if we enroll every relevant driver.

Maxime

> I'm having a hard time understanding your goals here.

--4dwxeuivst2jqyl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVH/8QAKCRDj7w1vZxhR
xZSOAP9EBKJ87BaLlWkIC3+z04g1VGCznnsQiTI07cGUrv5mYAEA3n7HqIfJE7+T
ZHaPCVHtTRn7K/54M2pf8pvfd8PdNQw=
=0TlS
-----END PGP SIGNATURE-----

--4dwxeuivst2jqyl6--
