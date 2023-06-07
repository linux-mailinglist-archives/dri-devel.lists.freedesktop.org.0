Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5166B725480
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701C010E435;
	Wed,  7 Jun 2023 06:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79110E435
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 06:41:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A55A6636E2;
 Wed,  7 Jun 2023 06:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90074C433EF;
 Wed,  7 Jun 2023 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686120067;
 bh=Px4yR+6OsZ1b/yH6ZdWEW0dyGLZ2w09Hzl1kzNrtJw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQg+1HP7Qdi4iQUKM9u6T9UtZIm5jIp8wQ9ZmIp5NRyJ86hGU+vePDRhiuSAYNRm6
 Jqk3k+DVuCc5FGFzNbK5Rn2ivpsN+lXHm6xghGiAaTBw+vXoIb8b+rIQrhXf8LZe1D
 FzfQShhS4fXXIzN2QaQKrcs2vOf4o+QNrU1ke91Petu2OhppYwnsN47DUoVLk+GuO1
 YiT05Z7VfeTyJguCpkfDhKUfEdcHdRCHcQ2CZ1BEHDJysLT+AcRemIMpF/WoZkbiEj
 ITOzCH9XmQGcZJTlesoEmjljCT20DtVddq8SEALOmI5RK4DGy2iRhf7brapBRnVvTY
 SRomxqX/O+acQ==
Date: Wed, 7 Jun 2023 08:41:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
Message-ID: <ifgjvonhkzcwrklzch5efguor2x6az4m737dwte4uyow7ar5dr@z4glaxse6dou>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
 <TY3P286MB26116576E3E502CAE53834599852A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <1991848.PYKUYFuaPT@diego>
 <20230606-geometry-blurb-1f0f07d4bf6a@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fpldas4cn62wqe46"
Content-Disposition: inline
In-Reply-To: <20230606-geometry-blurb-1f0f07d4bf6a@spud>
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
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fpldas4cn62wqe46
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 11:37:53PM +0100, Conor Dooley wrote:
> On Wed, Jun 07, 2023 at 12:22:33AM +0200, Heiko St=FCbner wrote:
> > Am Dienstag, 6. Juni 2023, 20:41:17 CEST schrieb Shengyu Qu:
> > > > On Fri, Jun 02, 2023 at 03:40:35PM +0800, Keith Zhao wrote:
> > > >> Add bindings for JH7110 display subsystem which
> > > >> has a display controller verisilicon dc8200
> > > >> and an HDMI interface.
>=20
> > > >> +description:
> > > >> +  The StarFive SoC uses the HDMI signal transmiter based on innos=
ilicon IP
> > > > Is innosilicon the same thing as verisilicon? Also
> > > > s/transmiter/transmitter/, both here and in the title.
> > >=20
> > > I think that is not the same, I remember Rockchip has used a HDMI=20
> > > transmitter from
> > >=20
> > > Innosilicon, and there is a existing driver for that in mainline.
> >=20
> > Yep, I think Innosilicon is the company you turn to when you want to sa=
ve
> > a bit of money ;-) . In the bigger SoCs Rockchip most of the time uses
> > Designware hdmi blocks and looking at the history only the rk3036 ever
> > used an Innosilicon block.
> >=20
> > Looking at the history, 2016 really was a long time ago :-D.
> >=20
> > > So Keith, if that's true, I think it is better to seperate the HDMI=
=20
> > > stuff and reuse existing driver.
> >=20
> > I'm not so sure about that - at least from a cursory glance :-) .
> >=20
> > The registers do look slightly different and I don't know how much
> > the IP changed between the rk3036-version and the jh7110 version.
> >=20
> > At the very least, I know my rk3036 board isn't booting right now, so
> > I can't really provide help for generalizing the rockchip-driver.
> >=20
> > At the very least both the binding and driver could drop the "starfive-=
hdmi"
> > and actually use the Innosilicon in the naming somewhere, so that it's
> > clear for future developers :-)
>=20
> Seeing "based on" always makes me a little bit nervous to be honest when
> it comes to using a compatible from the IP. Is it the IP? What version
> is it? etc. Perhaps "starfive,jh7110-hdmi" & falling back to some sort
> of "innosilicon,hdmi" would be more future/IP-silliness proof.
> Driver can always be generic & bind against "innosilicon,hdmi" until
> that becomes impossible.

Given that Neil was saying that there's at least two
generations/revisions/models of an HDMI controller from Innosilicon, I'm
not sure that compatible is enough to reach that goal anyway.

Maxime

--fpldas4cn62wqe46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIAmgAAKCRDj7w1vZxhR
xaQ+AQDViFCjrmBh/FOmfkZnsbFEZqUbyPu3G+ff5Kfs9al3LgEA4TGU5Z1tubCB
079K0fi4BmqB2ZgKk65Uxw0vctIlIAE=
=TcBS
-----END PGP SIGNATURE-----

--fpldas4cn62wqe46--
