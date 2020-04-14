Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE71A8A4D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2916E56A;
	Tue, 14 Apr 2020 18:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE666E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:55:26 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 420B42074D;
 Tue, 14 Apr 2020 18:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586890525;
 bh=D4uD8lJngE4r0vCQv58R/Cgz9fWEBtk9Yx3Wo3ClZqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tUBphm2Rb7rh1cocNFCF1O3d+uVd8Mn+1KwUOvaIashLzhYAJJs6WNDl3X86yG9DI
 9aLh5UjxG3LWYb5CqkQZi3z3ge5ZDoA2lJw2UnrACJBojsjTRDcGYSATVnqgk+gwd7
 hv1wN/PhGiKOWf6tqhg7U4DyL5tiqkU8Ii2fGoQY=
Date: Tue, 14 Apr 2020 19:55:23 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
Message-ID: <20200414185523.GO5412@sirena.org.uk>
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCccF3tmbmMWNh0nC5WRJ1_iPdj6f1oH1zYMSue_pFrXsPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJiuCccF3tmbmMWNh0nC5WRJ1_iPdj6f1oH1zYMSue_pFrXsPQ@mail.gmail.com>
X-Cookie: I've only got 12 cards.
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
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0934042377=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0934042377==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WoqaC9TUMqqIOlla"
Content-Disposition: inline


--WoqaC9TUMqqIOlla
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 08:20:23PM +0200, Cl=E9ment P=E9ron wrote:
> Hi Liam and Mark,

You might want to flag stuff like this in the subject line, I very
nearly deleted this without opening it since most of the email I get
about panfrost appears to be coming from me having sent patches rather
than being relevant.

> We are having an issue with Panfrost driver registering two times the
> same regulator and giving an error when trying to create the debugfs
> folder.

> Could you clarify if it is allowed for a device to register two times
> the same regulator?

> I check Documentation/power/regulator/regulator.rst but this point is
> not specified.

We don't actively prevent it and I can't think what other than debugfs
might run into problems (and that's just a warning) but it does seem
like a weird thing to want to do and like it's pointing to some
confusion in your code with two different parts of the device
controlling the same supply independently.  What's the use case here?

--WoqaC9TUMqqIOlla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6WBxoACgkQJNaLcl1U
h9AufQf/b6efImc7LvBHGoIjbHuK7UiFNve0LJJqjKwvdUwdpOp/m+WzrHWaNAvO
5JNbL9U5h7T5oGh5A9AiToEysk1Fo7St5WLmbEJBXqD8Nhg9yQU/3OtCTgHi+2LP
gx3nA1upkwg3OVkAt5RO1jX70kRXebrAPGy4FgGUyiLhNKnK6Nqf8FXnVzhy6Szl
wH1/jGJlNphErY6s9t9nQLHSY8uS2h2AVvRHA8m5TJeGCGVcfr9iH8r/lLgfIWZI
9SiBZkDSSPsqPOaUylAF2QPyGRx8hNQrJX0Ih4MFsuts0JW1YUO1iNTW6HGj7gL9
8c4/u0KEtqVMiq2q6PnG7cfk2XlkNA==
=+uTF
-----END PGP SIGNATURE-----

--WoqaC9TUMqqIOlla--

--===============0934042377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0934042377==--
