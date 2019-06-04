Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A604233F7E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C056189354;
	Tue,  4 Jun 2019 07:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A6189322;
 Tue,  4 Jun 2019 07:06:15 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y13so15564447lfh.9;
 Tue, 04 Jun 2019 00:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6CaFo8zmlqKLGL1ckG42QkMHuF0QZabNoUdo+LwvIa8=;
 b=JdeHEE10ifrwIBJ9zDxHTVwDpuMdVx2Uz+10qpYMwRyJFQKBXm4+69HXDss/hr3SM3
 ZJ9iylpq0CyOGAJ8a2m40r0GVofdLtOb0qhBm2XmG6TYGzigU61xH6QYf3VeEOtU5GHA
 vFzebbCjxmPOlgVW2SZq4s/HN+f7GQTUJiDCtNk8TaZh1/exuMIQ9PVWsKtU492TEZ8U
 FddrtZg5O/2oCLzbX27oSCOTv57Pa1DhfUOCWYypt5QFTNcK6EbGVhhNYi4xNbqzkwwK
 f1rvd7EsFyLj+OsxplZtg4nx1bm2gA7FlLI3yWHO0yVzlKmxhuPq4ru6zbSizVjZslB1
 zGLg==
X-Gm-Message-State: APjAAAW5sp03xMNr+oikMxCPVoslqfB0OjW2vnrpV3HA4s8jrnUMCQF0
 nlyTErBM9IbUUaHNaPthRWE=
X-Google-Smtp-Source: APXvYqyV2jGlVjOlWQ7lh2nwI6gWD4hkp8OrrbR3BDfD+MOow/YyCATyFo86EhCK6h6Zdjpj+hFq7g==
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr15665762lfn.52.1559631973619; 
 Tue, 04 Jun 2019 00:06:13 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a7sm554845lfo.22.2019.06.04.00.06.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Jun 2019 00:06:13 -0700 (PDT)
Date: Tue, 4 Jun 2019 10:06:09 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Ser, Simon" <simon.ser@intel.com>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190604100609.235cd763@eldfell.localdomain>
In-Reply-To: <6782500f2aa3a2b1fbf2dde6a6c31d1bba8b575c.camel@intel.com>
References: <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
 <20190515103731.16855195@eldfell.localdomain>
 <20190515082449.GA17751@phenom.ffwll.local>
 <20190516112211.1cd5a8c6@eldfell.localdomain>
 <20190516122455.GA3851@phenom.ffwll.local>
 <20190517130824.17372663@eldfell.localdomain>
 <20190520161107.GA21222@phenom.ffwll.local>
 <20190521095505.7ef1cbdf@eldfell.localdomain>
 <CAKMK7uGoVhAOkZN7G1fuzdUjihjxqRhVuVvE3K5HFZwGjyC6Hg@mail.gmail.com>
 <9953e1fa-dafa-21c1-9604-50ed1e9fecaf@daenzer.net>
 <20190603150834.GL21222@phenom.ffwll.local>
 <6782500f2aa3a2b1fbf2dde6a6c31d1bba8b575c.camel@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=6CaFo8zmlqKLGL1ckG42QkMHuF0QZabNoUdo+LwvIa8=;
 b=Hvsdj3epm8cBnVyubf4sZ13JlrBn8S7H4LRYbw++/Vd4QpK3uL+y+l1ONEgMjQ3FxE
 W7n+3NnlgCQy3d5lJzC0dTXlapI8eGeIPHbC3nbQScwHGUpZX3RrwHsT6thlaGCXQxOr
 9SeLUS8ZY6i5BGhQKQJrWjsLX3DTJMWDsVOrzVcASv59PdZNMhZycGJHAywmqluf5+xN
 paIg42EEcz01s8kWk8bzYSP3w8RsIKl+iDXGrkMzk1lBJ3XSzBVyze3+5BssEXxrZoiI
 Z7Z3BHbKEVYLwQyn2pX9kiCIRO3xdlhWSvmK2y+YkKUsXqY7Ei6IvE7ACjlxsjvHmj3J
 TdVw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0180891024=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0180891024==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W.iY6vTYf6bkZBrNUXl5Oi9"; protocol="application/pgp-signature"

--Sig_/W.iY6vTYf6bkZBrNUXl5Oi9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Jun 2019 15:19:13 +0000
"Ser, Simon" <simon.ser@intel.com> wrote:

> On Mon, 2019-06-03 at 17:08 +0200, Daniel Vetter wrote:

> > It's definitely a very suboptimal situation. Not sure there's a good way
> > out. The trouble here is that i915 ended up configuring crtc/connectors
> > differently than -modesetting (to allow fastboot, which I think is still
> > i915 exclusive). This then highlighted that modesetting can't do atomic
> > modesets if you try to reassign connectors.
> >=20
> > One idea I have is that vgms would help compositors to play out a bunch=
 of =20
>=20
> Just so people aren't confused: I think Daniel meant "vkms" here :P
>=20
> > standard scenarios, even automated. But that's not there yet, and every
> > compositor project needs to care beyond "boots on my laptop, ship it". =
No
> > idea that's even possible. =20
>=20
> Having documentation for userspace is also important IMHO.
>=20
> Regarding automated compositor testing, it's probably not possible to
> have a single place where all compositors are tested: vkms should
> probably be included as part of their CI. Thoughts?
>=20
> Anyway, we could start a discussion to see if compositor people are
> interested. Or have you already talked to some compositor maintainers?

FWIW, I would absolutely *love* to be able to exercise Weston's
DRM-backend in Gitlab CI with anything, even just vkms, at least in
Weston's test suite to test Weston against KMS in general. Once that is
up, kernel people could replicate from that to their own CI for testing
drivers against known userspace.

I think it would be an awesome long term plan, whether uAPI specs
appear or not. Long term, because I have no idea who could work on it
when. In theory, all I would be waiting for is for vkms to be just
featureful enough and to figure out a way how to get that running
inside Gitlab CI.


Thanks,
pq

--Sig_/W.iY6vTYf6bkZBrNUXl5Oi9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlz2GGEACgkQI1/ltBGq
qqc7bQ//T+X7rFpCzQPGd0CUmY4WF5R2A896kDEBG5HCSdBRLOLGZ7C5hBK4zQac
gVYha5Hq3GqKPuoOfuAW8XneOgsrMX+89jWA7s/NwETt1W5QDuEsjWEvxWdcvi48
WgvOnPHuKaFWEEOpyVHTWVKaEB7lkyrYitG5g+My4kql5ANEAq2U5BfVgbfBwnNc
w8xhgx8tOK71oH7zt2XYd8rQT+QFTE6RK2QWhrgcUxzjPXXCgp+BZCtfRxAWhASF
Mp1CLQVKvvH4k26pfrq2tKTZW8Epyn2nqA6dc7/RD00jpPKvAvG7NC/uDso6GBsF
sR5ajTYRkkG86aYDwWKHguCph3J3cywNFrMtPPRFO6EIWbo8mUVi8Rh7+8UPj3jv
AP4pt2/MWA13WB3ExlXV1D0sa/B6sWFQnY6FNMb/FX+Zad5q4FyNnaQIVmdObVJX
p9XHjnLcmMy6wqRJhYvTcoUAPEbJqe/GXsWqp2D5UrvySRaKVNLpBFg1IPISMxMv
ZGb3WZ5j9ewjVbVd9kQenH/+vB34Oi/e/kdSm5ZMW3AQv14PuIkVUn1w9kyTvRim
Jk5lf5AZYWlGORfiJZuXUgrqvRy7CdA0iwBjMExG/4eNNaqCDI0oy4yeD9wYU2Gc
rysEf5lYwHf4ebySiVpNrxQfZUxRODJRGRnG6j5ZymowIcIOlTM=
=37SF
-----END PGP SIGNATURE-----

--Sig_/W.iY6vTYf6bkZBrNUXl5Oi9--

--===============0180891024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0180891024==--
