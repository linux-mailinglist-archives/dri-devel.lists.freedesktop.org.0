Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E2725006
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 00:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E5C10E3F5;
	Tue,  6 Jun 2023 22:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3179F10E3F5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 22:38:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 067C6638AE;
 Tue,  6 Jun 2023 22:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFA2C433EF;
 Tue,  6 Jun 2023 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686091081;
 bh=+d7JeMeUUdZO2aVYQ8oGUF7pb9l8qtsCjpkX1+tKZ0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ah/xpfYXpLSl/KXOtkf2COQ1AifCQwoMbz5GdNd9ACRL9pAXI9y5pmZwAaJiuFZTy
 onaUd+OM2JgRXTnepEsVZZZyWcLJkgZfFeKsIsfdH7ovQw9K9sgVTVYjMcqM7D6nA9
 hp6MJNabTZ5pUEYGZD3ZDKgehKx1/cBeVeWGsAexmiW6Du23w+QR4x5A55TodM83oa
 91QKw/L/4nPKp2Cz68Z8OsFWACnxb0UsfN1nQG3MO4QLalWNIWmH7MH7HksH3/FyDv
 mzpv63FSaBnTJ9AtPkRKj+sxtFNOsBR6Y5Sz/icdY9vgSCXdvfBFqUv4w9/M10dyUA
 jCnwRE4nixJyA==
Date: Tue, 6 Jun 2023 23:37:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
Message-ID: <20230606-geometry-blurb-1f0f07d4bf6a@spud>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
 <TY3P286MB26116576E3E502CAE53834599852A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <1991848.PYKUYFuaPT@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1lwN/EJcI4S+S54L"
Content-Disposition: inline
In-Reply-To: <1991848.PYKUYFuaPT@diego>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Shengyu Qu <wiagn233@outlook.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--1lwN/EJcI4S+S54L
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 12:22:33AM +0200, Heiko St=FCbner wrote:
> Am Dienstag, 6. Juni 2023, 20:41:17 CEST schrieb Shengyu Qu:
> > > On Fri, Jun 02, 2023 at 03:40:35PM +0800, Keith Zhao wrote:
> > >> Add bindings for JH7110 display subsystem which
> > >> has a display controller verisilicon dc8200
> > >> and an HDMI interface.

> > >> +description:
> > >> +  The StarFive SoC uses the HDMI signal transmiter based on innosil=
icon IP
> > > Is innosilicon the same thing as verisilicon? Also
> > > s/transmiter/transmitter/, both here and in the title.
> >=20
> > I think that is not the same, I remember Rockchip has used a HDMI=20
> > transmitter from
> >=20
> > Innosilicon, and there is a existing driver for that in mainline.
>=20
> Yep, I think Innosilicon is the company you turn to when you want to save
> a bit of money ;-) . In the bigger SoCs Rockchip most of the time uses
> Designware hdmi blocks and looking at the history only the rk3036 ever
> used an Innosilicon block.
>=20
> Looking at the history, 2016 really was a long time ago :-D.
>=20
> > So Keith, if that's true, I think it is better to seperate the HDMI=20
> > stuff and reuse existing driver.
>=20
> I'm not so sure about that - at least from a cursory glance :-) .
>=20
> The registers do look slightly different and I don't know how much
> the IP changed between the rk3036-version and the jh7110 version.
>=20
> At the very least, I know my rk3036 board isn't booting right now, so
> I can't really provide help for generalizing the rockchip-driver.
>=20
> At the very least both the binding and driver could drop the "starfive-hd=
mi"
> and actually use the Innosilicon in the naming somewhere, so that it's
> clear for future developers :-)

Seeing "based on" always makes me a little bit nervous to be honest when
it comes to using a compatible from the IP. Is it the IP? What version
is it? etc. Perhaps "starfive,jh7110-hdmi" & falling back to some sort
of "innosilicon,hdmi" would be more future/IP-silliness proof.
Driver can always be generic & bind against "innosilicon,hdmi" until
that becomes impossible.

Cheers,
Conor.

--1lwN/EJcI4S+S54L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH+1QQAKCRB4tDGHoIJi
0ihwAQC+3gfFJAPFBOT76QYpqrSJuQHRjE1iNJt0+04zAqcRDgD+KopK8i99wbS9
4s+s9CpPS+b/RBAa5Zq6Zq0Bynk3jgc=
=XnKq
-----END PGP SIGNATURE-----

--1lwN/EJcI4S+S54L--
