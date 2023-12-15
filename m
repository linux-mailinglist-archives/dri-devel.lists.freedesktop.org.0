Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157138148A7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 13:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF8410EA11;
	Fri, 15 Dec 2023 12:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4DF10EA11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 12:58:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A37F625F6;
 Fri, 15 Dec 2023 12:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CB8C433C9;
 Fri, 15 Dec 2023 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702645102;
 bh=GEtMi/SmyqOGcU9xqHongzACicX5B8dlDCDJqLIT4UE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jYiArQBIZ+/y80QPpPSTzjIke+R1F0QQ+AHkna+k9Znw+o48JKUgMOZW35CW9y+kb
 0sYWki3KaakFBzjXwbeP2iQ6UjO8/ui24y+hwW482YqPYoUcm8ATtUwN+S9I+7aNi+
 2DT3aM6rs3JP7r9NpgcN8CmM77fDRJV9/LqGbKJGG7Ec1v4umhPHPiPKhAySFNHMvP
 bJ4v+lihpZLYZGvWVSzI4jrnH8Xc53us19rUYPg0YxWdQsW+wZmxrCZahjb46Hu9D4
 yylPm5BkJsXJkvBfGBHJ0AbNpsPF42f3aVBmSFrsp9Zwv8Diw/KKEEKZ03Bz/Ae6Dl
 84bGT9HJB5jwg==
Date: Fri, 15 Dec 2023 13:58:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iahchtgo4x2fru6o"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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


--iahchtgo4x2fru6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 11:37:07AM +0000, Biju Das wrote:
> Hi Maxime Ripard,
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Friday, December 15, 2023 10:24 AM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >=20
> > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > Hi Maxime Ripard,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Maxime Ripard <mripard@kernel.org>
> > > > Sent: Wednesday, December 13, 2023 3:47 PM
> > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > > >
> > > > > +	 */
> > > > > +	rzg2l_du_crtc_get(rcrtc);
> > > >
> > > > That's a bit suspicious. Have you looked at
> > > > drm_atomic_helper_commit_tail_rpm() ?
> > >
> > > Ok, I will drop this and start using
> > > drm_atomic_helper_commit_tail_rpm()
> > > instead of rzg2l_du_atomic_commit_tail().
> >=20
> > It was more of a suggestion, really. I'm not sure whether it works for
> > you, but it usually addresses similar issues in drivers.
>=20
> I confirm, it is working in my case, even after removing rzg2l_du_crtc_ge=
t()
> and using the helper function drm_atomic_helper_commit_tail_rpm().
>=20
> >=20
> > > >
> > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc) {
> > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > +
> > > > > +	rcrtc->vblank_enable =3D true;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc) {
> > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > +
> > > > > +	rcrtc->vblank_enable =3D false;
> > > > > +}
> > > >
> > > > You should enable / disable your interrupts here
> > >
> > > We don't have dedicated vblank IRQ for enabling/disabling vblank.
> > >
> > > vblank is handled by vspd.
> > >
> > > vspd is directly rendering images to display,
> > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank() called in
> > > vspd's pageflip context.
> > >
> > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> >=20
> > Sorry, I couldn't really get how the interrupt flow / vblank reporting =
is
> > going to work. Could you explain it a bit more?
>=20
> We just need to handle vertical blanking in the VSP frame end handler.
> See the code below.
>=20
> static void rzg2l_du_vsp_complete(void *private, unsigned int status, u32=
 crc)
> {
> 	struct rzg2l_du_crtc *crtc =3D private;
>=20
> 	if (crtc->vblank_enable)
> 		drm_crtc_handle_vblank(&crtc->crtc);
>=20
> 	if (status & VSP1_DU_STATUS_COMPLETE)
> 		rzg2l_du_crtc_finish_page_flip(crtc);
>=20
> 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc);
> }

Then we're back to the same question :)

Why can't you mask the frame end interrupt?

Maxime

--iahchtgo4x2fru6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXxNawAKCRDj7w1vZxhR
xRg9AP92bknfPCICCcXoeXPopCzkxy5qs7ZU32qyWA1xvhM9ogEA1oK9r0Aykufh
EW8OpE3+A7P/T/eq2fBysD9Pa+eY3gE=
=/irC
-----END PGP SIGNATURE-----

--iahchtgo4x2fru6o--
