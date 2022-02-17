Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF254BABDC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 22:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153BD10E81D;
	Thu, 17 Feb 2022 21:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A8310E836
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 21:38:04 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id o9so1438952ljq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 13:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7GVM4Imaflj4JIe8CRzxVHc58Ab/xWCMTV8z5JInLLY=;
 b=V6A3E7siPvJSxNL4Zw1sa/9jV7UvEiLulVjANFUwEz8UL/RE3kv6tjbKRIwRCsuksU
 axGQOKBP/ixHQhKjvMw09I92EXDIn2oudQ5SooxthoXhvncdDWfSDss7JVpAo6I/dzAB
 CQOw5vQBgNav1GrpqcSmp/qj8FO9/4KBZitKKvIpdCAvEu1FvpQDvrUp+CK0HpEV3hnC
 q2aVxAQeKAXCRmNCJV6VcWJhyM79+F11RxLErs2n3195DkxlCzVidk2Yv5tO3hECN6o0
 A3pI0rDpMRKEBarg4bv2Je5GUj4KQ6HPxKQFOi9mDMkp5It+c8TWM6GxDi+a3fCp1gY5
 vxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7GVM4Imaflj4JIe8CRzxVHc58Ab/xWCMTV8z5JInLLY=;
 b=SaiwxZQNkZgNpo6Y/qb3oN/LB/3PqRlQX1jWiOry5EQHqslUbrKGWVbDo5pxSImE1A
 RN2aGW/IkR9/Va7KPDREWM98gyA2fRZaJ84wHDhW7FQqhwlB1HkH74pw1lztEU1L1F16
 3Nox52jlk5dJdWzb1RXNbBvDXu6eYY4vlQOWTV0H6GMYb4FPns3HpomNDFYxUQJ7wTc+
 tmK638CDriNOuqO2Rs+Fu66AxTUJaQn+CE2sBcvXPPEuigw6lgXYm7IhASxm4x3XjqHj
 5BRAI4sIh3yWmbhoHk/Wwr88y0czy0bXhOAvA4/74URIZAKUwSv34O2SjpVOEmfDjyup
 PJIQ==
X-Gm-Message-State: AOAM533peDR9Rpn1kHYgj8awy4wjaWOcQ/OiADdIiD7on50bkOkoM1Xs
 wRQO9MQLMvhQrwJn+u3Dcs4=
X-Google-Smtp-Source: ABdhPJzaJgT2M4QR68WHPwUssS6ksK1ClTpavhjLm192RraKOqYf+favGGfVt7pfUeNRS6ST3qUlTA==
X-Received: by 2002:a2e:a886:0:b0:244:de6f:1bf6 with SMTP id
 m6-20020a2ea886000000b00244de6f1bf6mr3609835ljq.375.1645133882866; 
 Thu, 17 Feb 2022 13:38:02 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id k14sm94762ljh.82.2022.02.17.13.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:38:01 -0800 (PST)
Date: Thu, 17 Feb 2022 22:37:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Message-ID: <Yg7ANdIhSiEsZf8E@orome>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <fb059f6f-013a-4a7e-55a7-81acbdda80fc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wh3BVJzbBMulczrm"
Content-Disposition: inline
In-Reply-To: <fb059f6f-013a-4a7e-55a7-81acbdda80fc@gmail.com>
User-Agent: Mutt/2.2 (7160e05a) (2022-02-12)
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
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Wh3BVJzbBMulczrm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 11:02:53PM +0300, Dmitry Osipenko wrote:
> 17.02.2022 22:16, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi all,
> >=20
> > this is the userspace part of the kernel patches that were recently
> > merged into drm-next:
> >=20
> >   https://patchwork.freedesktop.org/series/92378/
> >=20
> > The goal is to provide a userspace implementation of the UAPI exposed by
> > the kernel and show its usage in some test programs that can also be
> > used for basic sanity testing. More complete userspace implementations
> > are available here:
> >=20
> >   * https://github.com/cyndis/vaapi-tegra-driver
> >   * https://github.com/grate-driver/xf86-video-opentegra
> >   * https://github.com/grate-driver/grate
> >=20
> > Changes in v2:
> > - implement vic_clear() as a helper using ->fill() (Micha=C5=82 Miros=
=C5=82aw)
> > - rebase and fix a couple of Meson errors/warnings
> >=20
> > Thierry
> >=20
> > Thierry Reding (25):
> >   tegra: Indent according to .editorconfig
> >   tegra: Remove unused IOCTL implementations
> >   tegra: Extract common buffer object allocation code
> >   tegra: Fix mmap() of GEM buffer objects
> >   tegra: Add flink helpers
> >   tegra: Add PRIME support helpers
> >   tegra: Make API more consistent
> >   tegra: Install tegra-openclose test
> >   tegra: Update for new UABI
> >   tegra: Include private.h in list of source files
> >   tegra: Add channel APIs
> >   tegra: Add job and push buffer APIs
> >   tegra: Add syncpoint APIs
> >   tests: tegra: Add helper library for tests
> >   tests: tegra: Add gr2d-fill test
> >   tests: tegra: Add syncpt-wait test
> >   tests: tegra: Add syncpoint timeout test
> >   tests: tegra: Add VIC support
> >   tests: tegra: Add VIC 3.0 support
> >   tests: tegra: Add VIC 4.0 support
> >   tests: tegra: Add VIC 4.1 support
> >   tests: tegra: Add VIC 4.2 support
> >   tests: tegra: Add VIC clear test
> >   tests: tegra: Add VIC blit test
> >   tests: tegra: Add VIC flip test
> >=20
> >  include/drm/tegra_drm.h      | 429 +++++++++++++++++++++++--
> >  tegra/channel.c              | 195 ++++++++++++
> >  tegra/job.c                  | 187 +++++++++++
> >  tegra/meson.build            |   7 +-
> >  tegra/private.h              |  85 ++++-
> >  tegra/pushbuf.c              | 184 +++++++++++
> >  tegra/syncpt.c               | 101 ++++++
> >  tegra/tegra-symbols.txt      |  27 +-
> >  tegra/tegra.c                | 386 +++++++++++-----------
> >  tegra/tegra.h                |  95 +++++-
> >  tests/tegra/.gitignore       |   3 +-
> >  tests/tegra/drm-test-tegra.c | 147 +++++++++
> >  tests/tegra/drm-test-tegra.h |  55 ++++
> >  tests/tegra/drm-test.c       | 248 +++++++++++++++
> >  tests/tegra/drm-test.h       |  72 +++++
> >  tests/tegra/gr2d-fill.c      | 146 +++++++++
> >  tests/tegra/host1x.h         |  34 ++
> >  tests/tegra/meson.build      |  88 +++++-
> >  tests/tegra/openclose.c      |  52 +--
> >  tests/tegra/syncpt-timeout.c | 163 ++++++++++
> >  tests/tegra/syncpt-wait.c    | 151 +++++++++
> >  tests/tegra/vic-blit.c       | 333 +++++++++++++++++++
> >  tests/tegra/vic-clear.c      | 173 ++++++++++
> >  tests/tegra/vic-flip.c       | 333 +++++++++++++++++++
> >  tests/tegra/vic.c            | 184 +++++++++++
> >  tests/tegra/vic.h            | 181 +++++++++++
> >  tests/tegra/vic30.c          | 458 +++++++++++++++++++++++++++
> >  tests/tegra/vic30.h          | 439 ++++++++++++++++++++++++++
> >  tests/tegra/vic40.c          | 370 ++++++++++++++++++++++
> >  tests/tegra/vic40.h          | 285 +++++++++++++++++
> >  tests/tegra/vic41.c          | 374 ++++++++++++++++++++++
> >  tests/tegra/vic41.h          | 372 ++++++++++++++++++++++
> >  tests/tegra/vic42.c          | 374 ++++++++++++++++++++++
> >  tests/tegra/vic42.h          | 597 +++++++++++++++++++++++++++++++++++
> >  34 files changed, 7068 insertions(+), 260 deletions(-)
>=20
>=20
> Why do we need these tests in libdrm? Why not IGT?

Oops, sorry. I had meant to reply to your question in the previous
version. The idea was to have this minimal set of tests in libdrm as a
way to demonstrate how to use the various APIs. At the same time, this
is meant to serve as an easy way to validate that everything works from
the comparatively simple libdrm package.

But yes, adding more tests on top of this to IGT is something that I've
been pondering and I certainly wouldn't object if anyone else was going
to attempt to do so. I don't think IGT and libdrm need to be mutually
exclusive, though.

Thierry

--Wh3BVJzbBMulczrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIOwDQACgkQ3SOs138+
s6Fl5A/+PXZCaNobNnhmYfw5bctJSqyvzggoj9MaW3Jn9VE85IFwOimWKjRlbWlm
OLf5xyFtWmPAOJY521k/db7CD5wvlUHH7zF13XsZAgeL9jDxEJZXWYr6BfIX06JQ
ztTGWZZh2EC3tIhgf0bFMHvyogn32Hs3sWwsFeGaNVNcSWwPiDD80BTOLkPPL4Jj
OejvUUVd0moSbghddx3KoP1OTpXynI2r3QXU6WgCkUarjtP3Mr/gwtsm0sOAM/LJ
QtlxdqomgOv4JJSg9NSBp7UbztRG+2QvOMDNFuDPx4b+FQogrYMSa42OqOcxczjr
dBV5102Z2d7zLMPWEgBBFZdFIUVnPL2ac4TuWPRGwL6h1CbMW5coSi4ZgciADKqJ
Vn5XwZ5PB8PFqwYOi7J4dAMlJo78njHOk71hdY/g5PRjRk5R/KlDt3be8z6dh/3g
YnjaDdwd45kuQSBXJux+UlWzjjwDAE4EdwJZUv2oQAHtODsHQyRy6sTdVrlKNIUB
FHXAUW/ItLQVInywIEVISnYbIk6Se+Ay48hVJJ0THoZE9e4PVD9zHEp2zEblG0+m
YFOhqZdIxIwAZjyou74WcydfdRN5quYvdJvF54M1SuBLyWx2CtXNc8zmticJvCZk
+07G84jHLEp/lgpXkFXGiLsFVxznude00zbi7PLtO5OoNRD5rKo=
=1Msg
-----END PGP SIGNATURE-----

--Wh3BVJzbBMulczrm--
