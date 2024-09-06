Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA096F3FE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 14:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146E210EA2F;
	Fri,  6 Sep 2024 12:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V6DAVZKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DFA10EA2F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 12:06:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB39B5C5B52;
 Fri,  6 Sep 2024 12:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37CDC4CEC4;
 Fri,  6 Sep 2024 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725624408;
 bh=tD4tsZt9ld3Gft6zrgTvMfi2YHAaykUrGQ+Py1+ed+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6DAVZKwauEcOsWYLzycyTUk1E7WyhZ7AP+5cpRkgn64ynaAjrGhR/B+s9sTaUA7W
 YjnZEY+WWH3pbuhOQ5/HjFtXLpZBWMcsLggUzkV8yh6gzB/ZwRaLWY+idqRrM3bl/u
 xbOnsXswrqZW6h8ejL7hWCpc4KosPKpHVmk9Em+C22cg9adnR5zxPk4rLqKumDXLUb
 QFk7f0bLjKt7xhu77C9oPUYFiDEswY9xx4u1qF1t+CJrT6Z48cwbKvwkVZKp3j+aeh
 kl5cMoe6RGMx4xH2vvkYCjR8iQ+olIFQ5Aj5IAiv+SykXokx4gro/8LwrhDkiaqpGD
 eVegVyTlRSGrA==
Date: Fri, 6 Sep 2024 14:06:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Adam Ford <aford173@gmail.com>, 
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Dominique MARTINET <dominique.martinet@atmark-techno.com>, 
 "robh@kernel.org" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: i.MX8MP IMX-LCDIF Underrun Question(s)
Message-ID: <20240906-fiery-polar-otter-5fc83f@houat>
References: <CAHCN7xLL4hrTK1OqsqUa78cdp9ZcG0sC+cO5QKC3x_Y9-QVzSA@mail.gmail.com>
 <PAXPR04MB84592996FD8101BC0CF9E366889E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kgmq37ughxbfbzck"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84592996FD8101BC0CF9E366889E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kgmq37ughxbfbzck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2024 at 08:03:38AM GMT, Peng Fan wrote:
> > Subject: i.MX8MP IMX-LCDIF Underrun Question(s)
> >=20
> > I have been testing various settings on the HDMI out of the i.MX8MP.
> >=20
> > I noticed that sometimes my monitor would not sync, but sometimes it
> > would on the same resolution/refresh rate.  Frieder noted the LCDIF
> > was sometimes underflowing, so read up on it a little bit.
> >=20
> > In the comments of the LCDIF driver, it's noted:
> >     Set FIFO Panic watermarks, low 1/3, high 2/3 .
> >=20
> > However, in the downstream kernels, NXP changes the threshold to
> > 1/2 and 3/4 on the LCDIF that drives the HDMI, while leaving the other
> > LCDIF interfaces at the default.
> >=20
> > When I increased the threshold to 1/2 and 3/4, it appeared that several
> > resolutions that my monitor was struggling to sync started working,
> > and it appeared to sync faster.  I don't have an HDMI analyzer, so I
> > cannot verify much beyond knowing if my monitor can or cannot sync.
>=20
> You mean the two?
>         thres-low  =3D <1 2>;             /* (FIFO * 1 / 2) */           =
                            =20
>         thres-high =3D <3 4>;             /* (FIFO * 3 / 4) */
> >=20
> > Could the threshold and underrun cause this monitor intermittent issue,
> > or would this be something else?
>=20
> The threshold could cause display flicker if the value could not satisfy
> the bandwidth.
>=20
> >=20
> > Does it make sense to have a flag or device tree option to override the
> > default thresholds to change the panic level?
>=20
> I think it would be good to have a property as above.
>=20
> + DT maintainer to comment.

Why do you think it's something that should be tuned as a
per-platform/board basis?

If it's something that needs to be adjusted based on the resolution,
then it should always be done in the driver, and that has nothing to do
in the DT.

Maxime

--kgmq37ughxbfbzck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtrwTQAKCRAnX84Zoj2+
dnzLAX4rhFRO43e3DD4r6oFOZJyV23z7kMCa7UfEGx6/wR3e/M078YeCcLAGflcJ
9mVa7GQBfRNe758fFWPYVXaC04cNwEziGFzaRP+8PMXwpDYsYfFsgbMtbgDbq63+
RFmXQY/SyA==
=1WaJ
-----END PGP SIGNATURE-----

--kgmq37ughxbfbzck--
