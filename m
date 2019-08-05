Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530282C9E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2394C6E2EA;
	Tue,  6 Aug 2019 07:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CE989DFB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:08:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 0834228A0FB
Date: Mon, 5 Aug 2019 14:08:09 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] drm/panfrost: Add madvise and shrinker support
Message-ID: <20190805210809.GA4376@kevin>
References: <20190805143358.21245-1-robh@kernel.org>
 <20190805143358.21245-2-robh@kernel.org>
 <20190805155209.GA5909@kevin>
 <CAL_JsqL17x6nr9BzXGXeNimG5OwySsYCtBd6UtLEtATWR1jt4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL17x6nr9BzXGXeNimG5OwySsYCtBd6UtLEtATWR1jt4A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============0559315442=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0559315442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > Just to clarify about the `retained` flag: if userspace does a
> > madvise(WILLNEED) and we find out that retained=3D0, what's supposed to
> > happen?
> >
> > Should userspace evict the BO from its local cache and allocate one
> > fresh?
>=20
> Yes. Just like msm/freedreno.

Got it. In that case, the series has my A-b :)

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1ImrQACgkQ/v5QWgr1
WA0WUA//VsQARTgfZgX2WlCn2W8aJt/j+K/5pxq5NEIbV3hovGK0gv6Cpj5G2D1x
8sbIwWSa9rbPU50J+VLV/aTjRLpFxtfTsNJ3zE62nJG/1FOxa62Lsxdy0nbuq6B6
uzYAWU428jJl0KwqayUVnupTt1eT9ctA7OwlSySAwiRY76VkEpzXUknf1FoLOii0
sPA3GDbQv2X/CDGrOXw/j4cS6/wxijsewaa6Y0/O0/qqEoHZMXINMUL1GgKa0cVz
IndjQWoOuN1GipKlSeNw/P7z0ZzVe9LP3rvSLAikOmXommrGnpSHQPhFHwEqh+8p
CfqUzCTuymZ5xH9s/btJwJBcbBpkn4f/mXDEA76TzvFPLpdHqqRnfSeWFoFRNR+Q
wnT2T7TxTkwVJCiXWbdCxyp78RVF/CjN6gw8sqZm+hWo4b1RB7OObYqJ32FKTFCT
FqClz4s1/PMcdiA59/QWY22zriY2qh0IPWx05DATrbejrwqQ4ELjWOnWIdpgKcqr
of+llT3Ajs2zBQt12RnuRQLdm5oYr6zLyt7B7v9AKKIRYUS+XAY2bwf+YBuhCW9Q
l4gB/i9kH2tv8xjt8W2Jk0ta/Lrg7uFwIUpxxlQlS2u5YeYVRKtYQGgvnFZHTbV6
x0mSFbs0t51suqngxT87lMvMMz1T5v3EzxrkPYEjPh0Wt7KhnCM=
=dcC6
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

--===============0559315442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0559315442==--
