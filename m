Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57415814A68
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F3D10EA36;
	Fri, 15 Dec 2023 14:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB9410EA36
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:24:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 719926246E;
 Fri, 15 Dec 2023 14:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C83C433C8;
 Fri, 15 Dec 2023 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702650265;
 bh=n//Zk2gdkH/iGcaZ7tRqNwsbso51mNHgRXktukJtHgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=npdlo1HQ8Pn+/5wgKaQIVR1AiVBKw/CqspZ8QqAict90UGsCuqr6d48XIDO3/G8Mp
 JD19pAmuRfYy2Ec+Kuuun/R6s8bJeGm233mUhhn4Z1iPLl8KBIkvTcqHEJqcfYZDue
 zkXuc75JGr1L+97rQOFASW0CGOCuM7o7ST7TLxN39dvgh40UAvUutYFSJrJ/abW4KI
 I6bO52e9vR4qDSpIGb+Mhb8tEI4+2ap5bK77X5x+ofcr9Lpu/docxW/XTB2aGvliWI
 3jEtNN6kTx52OmdMmaGM4Cu5Eh+kQ0cWMfBtvs19Wpmv9IB+arAV/5/tPh9ABBemnp
 SP/sqgSM6b5Wg==
Date: Fri, 15 Dec 2023 15:24:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <he23e5al3hinegebvq7qai4jdw3qjgbzmnx34xgxqnu3hw4jke@dts2vi5kcs4u>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB1126964899D432355ACAF49D18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zhsfxp6q5wlnvcc3"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB1126964899D432355ACAF49D18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zhsfxp6q5wlnvcc3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 01:25:48PM +0000, Biju Das wrote:
> Hi Maxime Ripard,
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Friday, December 15, 2023 10:24 AM
> > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >=20
> > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > Hi Maxime Ripard,
> > >
> > > Thanks for the feedback.
> >=20
> > Thanks, that's super helpful. The architecture is thus similar to vc4
> >=20
> > Some general questions related to bugs we had at some point with vc4:
> >=20
> >   * Where is the display list stored? In RAM or in a dedicated SRAM?
>=20
> [1] It is in DDR (RAM).
>=20
> >=20
> >   * Are the pointer to the current display list latched?
> >=20
> >   * Is the display list itself latched? If it's not, what happens when
> >     the display list is changed while the frame is being generated?
>=20
> There is some protocol defined for SW side and HW side for updating displ=
ay list
> See [1] 33.4.8.1 Operation flow of VSPD and DU.
>=20
> All the display list operations are manged here[2]
>=20
> [1] https://www.renesas.com/us/en/document/mah/rzg2l-group-rzg2lc-group-u=
sers-manual-hardware-0
>=20
> [2] https://elixir.bootlin.com/linux/v6.7-rc5/source/drivers/media/platfo=
rm/renesas/vsp1/vsp1_dl.c#L863

I'm sorry, but I'm not going to read a 3500+ to try to figure it out.
Could you answer the questions above?

Maxime

--zhsfxp6q5wlnvcc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXxhlgAKCRDj7w1vZxhR
xQ97AP9yP2lSDsHP9g4HSUqxtJV7cgXsj9Xauf5TPZ/M7DeWMAD/R6c5ZBcVu2MX
UhuMQnlqnnHP5Iv8yKhrgkM7DNU0CQ8=
=qOGM
-----END PGP SIGNATURE-----

--zhsfxp6q5wlnvcc3--
