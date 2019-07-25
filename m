Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B676267
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB2A6ECDF;
	Fri, 26 Jul 2019 09:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F7D6E78A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 16:13:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 2DD7C28BC64
Date: Thu, 25 Jul 2019 09:13:44 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
Message-ID: <20190725161344.GA2950@kevin>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
MIME-Version: 1.0
In-Reply-To: <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0194188045=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0194188045==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Either we should prevent mapping of HEAP objects

I'm good with that. AFAIK, HEAP objects shouldn't be (CPU) mmapped
anyway in normal use; if you need them mapped (for debugging etc), it's
no big deal to just.. not set the HEAP flag in debug builds.

Or do you mean GPU mapping?

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl051SsACgkQ/v5QWgr1
WA1HHA/+KSCmw42RrK+AY4+r05In3M01pxyQRPFCD7a5Y+9ZweMkvMxBZKGUhDJn
oAVqaILg3cTQwM03eXqge4T4J+oFu5j/nDlGhWgpYAjlFgigDPr4xUiUhbsfquh9
SaSzpKGmdBVy3o+ouP5ibbtkTGaEf/DKH1odh4lD478cMCZMwU5G2apjHeN/Xgm5
tMUVudo3miyXMqpuJvGR4OWWZ/oTJ62y7kHTgcFuozFRom7bGJxX8rTWRcshoxLn
nDlUdK3rnrLO1Os+BvuxkOIbqYm0Ks5vuNGJHgX13hfzh0vdsENBjKfx1eF46XS/
aKZwgQzIYegQ2euYo4FjEEWji83LPvVSCD3SagnhUSzuJmsJs0iBzJ4cv7TqQ494
xfIT5o5xqeFzFdUObfEht9kWsdFY3N/RVyf21C4+if+BF4l3mfQnTDEi9dx8lhSo
rEF2vy8lk2kAFSM9OMWATrJEqTmEqu2SmkI/alO+YCGm2o2Pfk5Q9prFrRBx9xz2
knN9/2gw1w99EBlssOOZXXAwQIOwprJHXERYvXjCut6cOlLHkaQIAJq42RKHgkT7
GWPx1xXJ5UOvPpWjAsTNDw0AF3t2QQ+l6Xd4gykEqN+Ccb/S8c6hA89GEefoG3G+
voKCKEruOAgoktDTwQNH6Vqqbo1XgLiUp0seRQw/ZYysFtXVVD0=
=HeBT
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--

--===============0194188045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0194188045==--
