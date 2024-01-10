Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2182B829E4C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 17:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ECE10E604;
	Wed, 10 Jan 2024 16:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD5410E604
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 16:14:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E0AADB81D9D;
 Wed, 10 Jan 2024 16:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CAEC433F1;
 Wed, 10 Jan 2024 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704903284;
 bh=Xx0Rbe8QTGItzmg/lcxSs/JDjzXu4x7aHez4euG12i4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YKz+MkGHDrZ5TN6vtJKdN/gdUvfbqTG4WLH+XQPp7QIIYYUJW7F5/sS3iJ3KXv7u4
 XDmDjkRvFDBbXRlj3S59L++jtcLJ0oQz6H8vdpKUrngbqAveGVbYUscj5kR/iMulth
 KWhTpKuPrbbpPhSroCp+w+2krR81PkaQVQWTuliy8rShSbvDZaWWBKea3jRdf2B9nt
 4B1UPnFVYsRXoku8MXgrKGgfLd+37X+xM17i8JxiCjy9KBBocczIRFxXcfRh++Rsim
 J/P5VCJMpZLmBGkW4RWoRSghCJSB0gBKK2NJOXeIsHeX9l7Ai7enE4DJIN/4fR+guf
 9fSs/1ZGVjFoA==
Date: Wed, 10 Jan 2024 17:14:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <w5yc4ahv7tlr2bb4otzy7cnvke6q63w4msaxhdvpmeia3s5xi5@yhzvc3rxrowj>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB1126964899D432355ACAF49D18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <he23e5al3hinegebvq7qai4jdw3qjgbzmnx34xgxqnu3hw4jke@dts2vi5kcs4u>
 <TYCPR01MB112697575E0CF41CC26A8140086672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="quvacqf5r5l65bcx"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB112697575E0CF41CC26A8140086672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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


--quvacqf5r5l65bcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2024 at 02:34:33PM +0000, Biju Das wrote:
> Hi Maxime Ripard,
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Friday, December 15, 2023 2:24 PM
> > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >=20
> > On Fri, Dec 15, 2023 at 01:25:48PM +0000, Biju Das wrote:
> > > Hi Maxime Ripard,
> > >
> > > > -----Original Message-----
> > > > From: Maxime Ripard <mripard@kernel.org>
> > > > Sent: Friday, December 15, 2023 10:24 AM
> > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > > >
> > > > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > > > Hi Maxime Ripard,
> > > > >
> > > > > Thanks for the feedback.
> > > >
> > > > Thanks, that's super helpful. The architecture is thus similar to
> > > > vc4
> > > >
> > > > Some general questions related to bugs we had at some point with vc=
4:
> > > >
> > > >   * Where is the display list stored? In RAM or in a dedicated SRAM?
> > >
> > > [1] It is in DDR (RAM).
> > >
> > > >
> > > >   * Are the pointer to the current display list latched?
> > > >
> > > >   * Is the display list itself latched? If it's not, what happens w=
hen
> > > >     the display list is changed while the frame is being generated?
> > >
> > > There is some protocol defined for SW side and HW side for updating
> > > display list See [1] 33.4.8.1 Operation flow of VSPD and DU.
> > >
> > > All the display list operations are manged here[2]
> > >
> > > [1]
> > > https://www.renesas.com/us/en/document/mah/rzg2l-group-rzg2lc-group-us
> > > ers-manual-hardware-0
> > >
> > > [2]
> > > https://elixir.bootlin.com/linux/v6.7-rc5/source/drivers/media/platfor
> > > m/renesas/vsp1/vsp1_dl.c#L863
> >=20
> > I'm sorry, but I'm not going to read a 3500+ to try to figure it out.
> > Could you answer the questions above?
>=20
> The answer for your question is,
>=20
> If a previous display list has been queued to the hardware but not
> processed yet, the VSP can start processing it at any time. In that
> case we can't replace the queued list by the new one, as we could
> race with the hardware. We thus mark the update as pending, it will
> be queued up to the hardware by the frame end interrupt handler.

Ok, so you need to make sure that the list entries are allocated and
tied to the state. That way, you'll know for sure it'll get destroyed
only once the state isn't used anymore, so after the vblank.

Maxime

--quvacqf5r5l65bcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZ7CcAAKCRDj7w1vZxhR
xfi9AP9ZjMEY1DG5Kf0hgpbXKMvYDWH7F+QdjnlW1yZK6Rl9ZwD/SE1pHnLKJe6e
TDH7FGGhUZWvBi7Bvy4ckxCXQD0reQM=
=qAb+
-----END PGP SIGNATURE-----

--quvacqf5r5l65bcx--
