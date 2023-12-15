Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F5814A49
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402AC10EA1E;
	Fri, 15 Dec 2023 14:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6418D10EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:18:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C03FDB82911;
 Fri, 15 Dec 2023 14:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87DCC433C7;
 Fri, 15 Dec 2023 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702649885;
 bh=F+p5OE3EA9zE5wGYZfUFNzVMbr6WtrhJApfqkvUhDMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f7T3Wn9ZuZhqTXZibDriASeTzbImXuEXMNt414+9VwdGvtLOywjtfEAMEC8dcYgIZ
 YZipFrPNK5/RQn1aRj+kUEUcxEiBK7e4zcG4eOJJZIAdbmj6gHuvqQGq0BQNvJMQH1
 T5btcxwBNv1yK1hoY2yuljfARXfJTOihKWTF0OAgcAJvhNgK3+tqGUpxAPuNJX/SRZ
 gHHvhbeQ+IH9XC0UkG7q7rDEGIabsRx98lVQncekdmCiHHdq77V6FnZ+0efbAgek6o
 Q/uO593GQXJJ8vr9nuxDfTlkc01y/cSwjMsZHhnRFVMp9SFiKhuUaa6dx/oixFbWSQ
 H2KlOr11OcRNQ==
Date: Fri, 15 Dec 2023 15:18:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <g4uqcavglw2md4ojiw7yxequy37ttozjazr3b4ypqzznlrsinv@zm6mvzaempwp>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q2ox3i5nkklmlozr"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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


--q2ox3i5nkklmlozr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 01:52:28PM +0000, Biju Das wrote:
> > > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc=
) {
> > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > +
> > > > > > > +	rcrtc->vblank_enable =3D true;
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *cr=
tc)
> > {
> > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > +
> > > > > > > +	rcrtc->vblank_enable =3D false; }
> > > > > >
> > > > > > You should enable / disable your interrupts here
> > > > >
> > > > > We don't have dedicated vblank IRQ for enabling/disabling vblank.
> > > > >
> > > > > vblank is handled by vspd.
> > > > >
> > > > > vspd is directly rendering images to display,
> > > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > > called in vspd's pageflip context.
> > > > >
> > > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > > >
> > > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > > reporting is going to work. Could you explain it a bit more?
> > >
> > > We just need to handle vertical blanking in the VSP frame end handler.
> > > See the code below.
> > >
> > > static void rzg2l_du_vsp_complete(void *private, unsigned int status,
> > > u32 crc) {
> > > 	struct rzg2l_du_crtc *crtc =3D private;
> > >
> > > 	if (crtc->vblank_enable)
> > > 		drm_crtc_handle_vblank(&crtc->crtc);
> > >
> > > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > > 		rzg2l_du_crtc_finish_page_flip(crtc);
> > >
> > > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
> >=20
> > Then we're back to the same question :)
> >=20
> > Why can't you mask the frame end interrupt?
>=20
> We are masking interrupts.
>=20
> [   70.639139] #######rzg2l_du_crtc_disable_vblank#######
> [   70.650243] #########rzg2l_du_vsp_disable ############
> [   70.652003] ########## vsp1_wpf_stop###
>=20
> Unmask is,
>=20
> [ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
> [  176.354922] #########rzg2l_du_vsp_atomic_flush ############
> [  176.355198] ########## wpf_configure_stream###

Sorry, my question was why aren't you unmasking and masking them in the
enable/disable_vblank hooks of the CRTC.

Maxime

--q2ox3i5nkklmlozr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXxgGgAKCRDj7w1vZxhR
xU6bAQDv5VINsnSYZLNhw6WhMQ0r1fAIj/EF0IPt1slCmDJIigD/WsafyWN+CAM3
WK9B/qZfJnpwaNCfXqlVrCvkl4arQgk=
=bcof
-----END PGP SIGNATURE-----

--q2ox3i5nkklmlozr--
