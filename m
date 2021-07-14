Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B660C3C8007
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE7F6E19C;
	Wed, 14 Jul 2021 08:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764896E19C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:28:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i94so2147445wri.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ivKO9rn/nP2b/CMoka/2OrZBQ/V1ctLVZiqoNJxWfo0=;
 b=h0ZbIHzxJyLCHwToOuf3Z+2sZj3796pTavGiEpN6/G0b4znq21Lycbz3BvuV1eYoVU
 4vR7jJk4eELqYI9tC4bTyrt5e8l0DEPOr+ySiHCcKDd1ri9sjv4hTKwyv1iWsO8k9jM0
 f4GH0EUjh8riOgJbif1jMbxazFC4SSBAWEeIJXCse37eLn+HJvgd8lsBrMn5knC/s5Af
 OkC6j3hxUCxfCNo6x6vLbgCjaXM1sYVVgiVb8ODHMmv8Woi1Bvm8c8RS6Oa4QwNkmZYD
 vPwk9V6D6Z7MP+YhIZOfqmqOHn781yNljXbGpfyJSFimAGGmgNmCiDOq6x8Xk0KUFBJO
 oK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ivKO9rn/nP2b/CMoka/2OrZBQ/V1ctLVZiqoNJxWfo0=;
 b=QhG0wtBr87XLyL0xvB3XGkzkmjoOHjtyi410ibbPIx3rf5z66jQXjCo1s5t4k8xKG3
 5f1wmGAU3aW7G6WcZHPpBmtQgbLWwKz8zvLUMf+DQpST1JibXQuKG/gXexzhLhAFjP8o
 MCq9RGRMZI7lAV62YJQ1qs70keJAeR5BQT4wWNXdGrjyTnvMcD3mEuOOnn8SVGzy7gQ8
 gWQn3d5r+xyahzq/1we4E72JT0kRmUArdA65D0+grtBEY2HAKz7+/T0FboxmjZN8JBl0
 903Y54d2LVmN4FOaGhDGC0bi5/WOD5qDFl7FQiW+KUw7+2Ypr2e5QdNJD3hoBG9Doub6
 XPDw==
X-Gm-Message-State: AOAM532xPnpvOlYy+n4hfmQgms82ZUb8fHQTUVp0vU8ToimZ63KGhgKF
 urxvoWFvtGWR0svh7lU7v5w=
X-Google-Smtp-Source: ABdhPJxCZbc6ZLE8hZgyj0nChQi/HNBMI7wf/+9xAxuo6LrTonov2XyRGDaEwsXMy4t4VJerwbRk4A==
X-Received: by 2002:a05:6000:44:: with SMTP id
 k4mr11381145wrx.174.1626251301148; 
 Wed, 14 Jul 2021 01:28:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p5sm1350431wme.2.2021.07.14.01.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 01:28:19 -0700 (PDT)
Date: Wed, 14 Jul 2021 10:30:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
Message-ID: <YO6gm0PgMGNovk+4@orome.fritz.box>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iaNpXtGtXkWeBPvi"
Content-Disposition: inline
In-Reply-To: <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iaNpXtGtXkWeBPvi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 10, 2021 at 12:16:28AM +0300, Dmitry Osipenko wrote:
> Hello Thierry,
>=20
> 09.07.2021 22:31, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi all,
> >=20
> > Mikko has been away for a few weeks, so I've been testing and revising
> > the new UABI patches in the meantime. There are very minor changes to
> > the naming of some of the UABI fields, but other than that it's mostly
> > unchanged from v7.
>=20
> Why you haven't addressed any of the previous review comments? There
> were some obvious problems in v7 and v8 still has them.
>=20
> > One notable change is that mappings can now be read-only, write-only,
> > read-write or none of them (rather than just read-only or read-write),
> > since those combinations are all supported by the IOMMUs and it might
> > be useful to make some mappings write-only.
> >=20
> > For a full list of changes in v8, see the changelog in patch 6.
> >=20
> > I've also updated the libdrm_tegra library to work against this version
> > of the UABI. A branch can be found here:
> >=20
> >   https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
> >=20
> > That contains helper APIs for the concepts introduced in this series and
> > shows how they can be used in various tests that can be run for sanity
> > checking.
> >=20
> > In addition, Mikko has made updates to the following projects, though
> > they may need to be updated for the minor changes in v8:
> >=20
> > * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
> >   Experimental support for MPEG2 and H264 decoding on T210, T186
> >   and T194.
> >=20
> > * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-ope=
ntegra
> >   X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
> >=20
> > * grate - https://github.com/grate-driver/grate
> >   3D rendering testbed for Tegra20, Tegra30, and Tegra114
> >=20
> > I plan on putting this into linux-next soon after v5.14-rc1 so that this
> > can get some soak time.
>=20
> It should be a bit too early to push it into kernel. The UAPI is not
> ready because it's missing essential features. We can't call this a
> 'modern UABI' until it's fully implemented. The design decisions are
> still questionable because this UAPI is built around the proprietary
> firmware (and based on UAPI of downstream driver) which doesn't fit well
> into DRM world. I haven't got all the answers to my previous questions,
> should I repeat them?

I don't know what you means by "built around the proprietary firmware".
Yes, this ends up using proprietary firmware for some of the hardware
engines that host1x drives, but that's completely orthogonal to the
UABI. No matter what UABI we'd be introducing, we'd be using that same
firmware.

And yes, this is based on the UABI of the downstream drivers. The design
is guided by what we've learned over the last decade working with this
hardware in use-cases that customers need. It'd be dumb not to use that
knowledge to our advantage. This is the only way to ensure we can
deliver an upstream driver that's on par with our downstream drivers and
therefore make it possible to eventually adopt the upstream driver.

And frankly, you did get answers to previous questions, though perhaps
not all, but I'm out of patience. We've been going in circles and at
some point we have to make a decision so we can make progress.

I made several attempts over the years to get something usable merged
upstream so that we can finally make use of this hardware and get it
supported upstream and each time I made the mistake of trying to make it
perfect and accomodate all wishlist items. The result is that I wasted a
lot of time and have nothing to show for it.

I've also been very hard Mikko with his work on this and I think we've
stretched this as far as we can without compromising too much on what we
are going to need from this UABI in the future.

We've gone through the process of making sure all existing userspace can
and does work with this new UABI and even left the old UABI in place in
case we need it.

I'm reasonably satisfied with what we have now and I don't see any
reason to hold this back any further. We always have the option of
adding UABI if we need it for something, or extend functionality of
existing UABI where it makes sense. But we also do have to start
somewhere, otherwise we're just not going to get anywhere, as the last
10 years have shown.

> UAPI is not the only problem that we have. The performance and stability
> of the driver are in a very bad shape too. The modern UAPI can't be
> built on top of the old code. It's clear now that this is a very serious
> problem that must be addressed along with the UAPI work and I'm getting
> silence from you guys.

We've been over this multiple times before, though perhaps never over
email. So let me make this clear here again and for future reference: we
will *not* be rewriting the driver from scratch.

If there are any serious performance and stability issues, then we'll
find them and address them incrementally, like we always do in the
kernel.

Thierry

--iaNpXtGtXkWeBPvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDuoJkACgkQ3SOs138+
s6EV+g//bdNe9WGb3R8br/zGvyc0rsk8VnqtU4c85ANO8FQ8HgYDTVSwJ0rH2/Ne
Gh+NPCW4MXoCK0lmzPXVTz+GhuuUaQuR5KrC0ng1vG3auvBYKEfUvLf6wnGDAHIv
YbxFEz5Bk+Pu0TfNortVtDToOfNsokc7adsEkwb+bs04vatp83QHzEZ6DipEg3cL
mizhJNvuo0mx0D2ApSj315VcOh55VhZl7IroAAGMlxDF3JlJhuIyphcav1DgJvdz
NZdSW43xopUQ2EkoBDnETK9xGds3PGkFzWdKoE1MRcECAHlOia7vA1ejtxYP5sgi
DXYHGtJDZ2gIXLSyUc61MFckyhzV3bZwIyvKm1HBiPzaR/BtsCp4gs100cojmb1+
gyrcM9KdVwLr4CcRsRznW0p8OVarQWSqNcnMku7XimNLX47J5d54/Cm6KfJ7+key
qW49begJ/ziUI8/weGaKetYwpLeNLd6mipySNjYb+9Uf8TQj70YW7DYx5rgMPve+
icY4b07smjP4o5b+ERO9y27/chfudFmXmdTRyR4MP6HqUXIjNh/BuGWLyd/rA7n8
BkI6uNo370yzQNV6zx0gim51mts0cuHWnBTVT34mGaKhCMm9E8+mbJDwCToZPmQE
nLgFj5FULdGdxunIu0wB94wcSV/6OazySON5gmf17WjrF8sfN1U=
=KoTy
-----END PGP SIGNATURE-----

--iaNpXtGtXkWeBPvi--
