Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20601B095A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 14:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6781A6E528;
	Mon, 20 Apr 2020 12:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EC36E528
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:32:37 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96EBB206D4;
 Mon, 20 Apr 2020 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587385957;
 bh=ZMukz6nNKGu33s3FRvBaxizeZXmWlbe9Fjx2efgzEDI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RGa+xqk+kcDuKFAQaQOzJb322uQMKz8mX0qmE8uu2t74dL6qjcU+iq7X3+F/FiHrm
 xCn3skOK0MoFz4m5zpYhpW+MogfrTDXCV4OK+oBSdK9fzO03ZZlVI5AI4hhtbASPeK
 Q2tW8m19A3PuQRnXS4hgsowLkHAzmDsJdyyXG05E=
Date: Mon, 20 Apr 2020 13:32:34 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: Multiple regulators for one device [was drm/panfrost: add
 devfreq regulator support]
Message-ID: <20200420123234.GA10045@sirena.org.uk>
References: <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCccF3tmbmMWNh0nC5WRJ1_iPdj6f1oH1zYMSue_pFrXsPQ@mail.gmail.com>
 <20200414185523.GO5412@sirena.org.uk>
 <CAJiuCce5ekAed6RF8+x_ehruCXW3900wkFNKRXN_Xo_62MPXew@mail.gmail.com>
 <5e15e7ac-1d9c-d614-8fd9-27525c88cafb@arm.com>
 <5290a7a8-2a0a-cb89-9d62-270393123054@arm.com>
 <CAJiuCccm4gTAUWhTy+gK0kt4of=8yWcz2n_JtnmeAJofcpBKeQ@mail.gmail.com>
 <CAJiuCceECTKqTecq5KGayzNqOvQfOctR8RqnncKU66ieU7hH1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJiuCceECTKqTecq5KGayzNqOvQfOctR8RqnncKU66ieU7hH1w@mail.gmail.com>
X-Cookie: Hope is a waking dream.
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
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0789948198=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0789948198==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2020 at 11:25:08AM +0200, Cl=E9ment P=E9ron wrote:

> Just saw that a Lima devfreq[0] has been also introduced with I think
> exactly the same logic.

> Is this something that hasn't been triggered by Maintainer or I am
> missing something?

My understanding is that there is very little use of any of this
upstream since it's all pretty new, some platforms have OPPs but use a
firmware interface rather than the OS to control clocks and regulators
while most other platforms don't have OPPs defined and it's only
platforms with both regulators and OPPs that are affected.

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6dlmEACgkQJNaLcl1U
h9DypQf+P2vOWeN+u8XMuP/6aPG5takPC+MHnWznoRLaDc2TdO5H+eHG2iQOAjO0
1aZTF0RSKX4Q0Sh0l3cuYuiuZYqLMfRuftdQDiHPT3PoVWKUPSA3yfCIhlIMQq6K
W8DYg6MQ1T3sYSpbgeuWzEBfsMJqtHTpKxn9NvH8TEaJ2meGJpHW3BrquR1Xl9pj
oL196yRNbFAswmrHo/n1KUtID7dkPXZkXk+Jzfdy8G8GTDAU9imish/sLYNZkdup
JI0g2XYO2U/HscE4mniwpJKufckSu2TbKlpOP56W23xEFHs3LANgz75Blokpu3WQ
AyNedgAah8HO9b2ZovsitfGhGVJMrA==
=IWQH
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--

--===============0789948198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0789948198==--
