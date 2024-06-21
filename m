Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2C8911EFC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 10:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E1910F093;
	Fri, 21 Jun 2024 08:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pXzTM92/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA40C10F093
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:41:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2141E623A3;
 Fri, 21 Jun 2024 08:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C227C2BBFC;
 Fri, 21 Jun 2024 08:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718959287;
 bh=j3L45u3qT07bx2aznJCokKwbZEumckaEMAFPmA37S4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pXzTM92/7qoZtDkL5kgw3/3MpbNZAO+S33/HBjta1Rd6Z0HuGnqidU5y/sGgXTWUJ
 WUPbuPSgPBgf+ZY+/OS42DhgBM2u0KQqEyjSrOP0T6vo80IsdUNd1ZH/+HQhj5BvhV
 Xkud3pjd7Dg6WqeuB43cFWXoRV/36mVDbSrdTz6bfurs74Ned3dC6eIod7/AxCW8YJ
 +QFs1/7RJPCzhH2pw3vrp+pLrfGXrqJ0LrZyIoT9YKDr0oI8n4dpzGCBUzqNdkTSqi
 LUWfWe4UvspQxzOO4Y+ytCUt6DJu+Aa6tjtN9vPe8fVtpMnaFvc+np7ptL58CzMiR0
 LKv0W6h7u2QDw==
Date: Fri, 21 Jun 2024 10:41:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] MAINTAINERS: drm : vc4: Add Raspberry Pi as
 maintainers
Message-ID: <20240621-towering-fat-bug-2eea23@houat>
References: <20240620111401.3629380-1-dave.stevenson@raspberrypi.com>
 <20240620-optimistic-kittiwake-of-vitality-f1ae20@houat>
 <CAPY8ntDLqTXvvpLb=6Q5TQD-Dzj1pScg_scUWBpcg3oBMggyxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rvxagco4diwbzta6"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDLqTXvvpLb=6Q5TQD-Dzj1pScg_scUWBpcg3oBMggyxg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rvxagco4diwbzta6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 03:06:11PM GMT, Dave Stevenson wrote:
> On Thu, 20 Jun 2024 at 14:52, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Thu, Jun 20, 2024 at 12:14:00PM GMT, Dave Stevenson wrote:
> > > Add myself and our kernel maintenance list as maintainers for
> > > VC4 alongside Maxime.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  MAINTAINERS | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index d1566c647a50..b6dd628d5bc6 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7520,6 +7520,8 @@ F:      include/uapi/drm/v3d_drm.h
> > >
> > >  DRM DRIVERS FOR VC4
> > >  M:   Maxime Ripard <mripard@kernel.org>
> > > +M:   Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > +M:   Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> >
> > I don't think we can put a list as maintainer, maintainers (and
> > reviewers) should be explicit. We can definitely put the list as Cc with
> > L: though :)
>=20
> It's been accepted for Unicam
> https://github.com/torvalds/linux/blob/master/MAINTAINERS#L4178-L4183

I think it's somewhat different in the case of v4l2, you're the one
taking the patches and sending a PR iirc. In drm-misc, there's a
significant chance someone else will apply it.

> bcm-kernel-feedback-list@broadcom.com is listed as reviewer for a fair
> number of entries.

It's also a matter of signalling to the rest of the kernel community how
important a review is: if I get a review of someone on a patch that
isn't listed in MAINTAINERS, then it's valid but not enough for me to
merge it.

If it's from a reviewer, then it carries more weight, and if it's from a
maintainer, then it's pretty much the final word.

That only works if we explicitly put names in MAINTAINERS.

But I also don't care how many maintainers or reviewers you want to put
in MAINTAINERS, so it's not gatekeeping. It's mostly just around
documenting what the situation will be :)

Maxime

--rvxagco4diwbzta6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnU8swAKCRDj7w1vZxhR
xfT4AP9994nrGkFrzuXbXQYFPGXmd6KjO9234AQrdkKgA9QNXgD+NozVeFPDzjO/
b+tATgx7XF/Xc23UVlOG61T2uGA7iwI=
=5Dul
-----END PGP SIGNATURE-----

--rvxagco4diwbzta6--
