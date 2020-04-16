Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB041AC4BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 16:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6016E136;
	Thu, 16 Apr 2020 14:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C416E136
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 14:04:36 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FE5B2063A;
 Thu, 16 Apr 2020 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587045876;
 bh=2YXh/XKJI3YxS1o4ALaiH+LPf7d7D4uam3AFzOV80bQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wsNql+K5TJYxNfJ2BkKZPxv5pVE57QGTWKEpi1WnmT83+GOehaIagRtib+9RflqBq
 9GBSjyXHxCWSk5d7R3YiUkuOQGPjSMKPqR6CJ1G1HawJoI7aUp0XBLgwUjHAwQ1Vk7
 9a3axNOyPxwZra1XjQ/ZN466RPdZTgqQmymh1Eik=
Date: Thu, 16 Apr 2020 15:04:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: Multiple regulators for one device [was drm/panfrost: add
 devfreq regulator support]
Message-ID: <20200416140434.GL5354@sirena.org.uk>
References: <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCccF3tmbmMWNh0nC5WRJ1_iPdj6f1oH1zYMSue_pFrXsPQ@mail.gmail.com>
 <20200414185523.GO5412@sirena.org.uk>
 <CAJiuCce5ekAed6RF8+x_ehruCXW3900wkFNKRXN_Xo_62MPXew@mail.gmail.com>
 <5e15e7ac-1d9c-d614-8fd9-27525c88cafb@arm.com>
MIME-Version: 1.0
In-Reply-To: <5e15e7ac-1d9c-d614-8fd9-27525c88cafb@arm.com>
X-Cookie: Tempt me with a spoon!
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: multipart/mixed; boundary="===============0096252834=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0096252834==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m+jEI8cDoTn6Mu9E"
Content-Disposition: inline


--m+jEI8cDoTn6Mu9E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 02:42:13PM +0100, Steven Price wrote:
> On 14/04/2020 20:16, Cl=E9ment P=E9ron wrote:

> > That's can be reworked and Panfrost can only probe regulator if there
> > is no opp-table.

> This is what I was thinking about looking at. But it may make sense inste=
ad
> to extend the regulator API to allow multiple regualtor_get() calls for a
> single device. I haven't had time to dig into how difficult this would be.

To repeat what I said before we don't actively stop this, it's just not
something that seems particularly tasteful and the warning does find
actual errors.  I definitely don't think it's a good idea to extend the
API for this.

> Ideally calling regulator_get a second time for the same device would sim=
ply
> return the same struct regulator object (with a reference count increment=
).

One of the goals with the distinct struct regulator is to make sure that
we track all the user's activity together - if we mix multiple users in
there it becomes harder to tell if something is going wrong.

--m+jEI8cDoTn6Mu9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6YZfEACgkQJNaLcl1U
h9C/nQf/QCLo1rj6iRwBLPShJ84GFlBcvRlBij0IwxL5iMTtg6XkxiDm8/SLBixS
S1Bc/Wf6eNsaPSItFuhdGG7O7X1q8CEH4QRw7mb/GEOBOxkeSmBaYw+KGiatWVE6
wwK6H+GjDONuqkUTxsW5aOWtXdo8DHFsE+wzpJVGaaG3Dha4rnT+U9928gpNArK8
EUXfsezFxHayhWWMkb4Dq/lzlI8iXZDdLypZ8reuR20X+44sHIGlsm6OdAHg+6oM
AGal/xBKzemEoM7wqGDtcaRuEJd9FuRdKz1nAMGh0l9p4gpWljqr1oPeS4zh4D+M
3cENMO5/EQRQvTWYLgxIMLDqhdFmvw==
=8v7v
-----END PGP SIGNATURE-----

--m+jEI8cDoTn6Mu9E--

--===============0096252834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0096252834==--
