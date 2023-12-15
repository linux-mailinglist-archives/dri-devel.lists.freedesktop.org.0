Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9ED814A64
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B1310EA22;
	Fri, 15 Dec 2023 14:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9705910EA3C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:23:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A0C1CE1F43;
 Fri, 15 Dec 2023 14:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C77C433C7;
 Fri, 15 Dec 2023 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702650184;
 bh=BZFnYzW7YZTXtkTyTtLONk7MbUaXR0Vw+rIVriH8hSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDN+3h0sQL1BSRMAbpiHvfzBj7zg4/XJR8MxiYIYluyTpCodrr1dNmIiuu7/g8V5q
 1dtS8ewYCSHg8PB3d/XVIm8Nebh9hRmHicU6QDuo6QbOMUlGEVTIlWbpddCLYKbeQr
 N1k0QuJkxH6Xu+0hOOyNioxOClNwS1dTMMTM9PDD6n5flPUhQywWTpnHUxZqnkmhgW
 a33Msou9/jM+uhWCF8E3E4Fg8YiOvJ/PAGcPqjeavia998JxAvfH7EPOiijSiVZajg
 V8dxXHGW/6Xwpb8QF3oTVnIKA5QrsAZ01QlwUeQo6jYzWT3RR4mbUUvSn4JRm7ZRWu
 RTFwaxsmdX/pw==
Date: Fri, 15 Dec 2023 15:23:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <5xmkpbymmvsqdfjxgkrjf7r4b7sgxdd7gq7qmohg5id6ljjg7z@rznod4o464iy>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269A92241B3469FAC06AF398693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cuf2qri4iqampkgy"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269A92241B3469FAC06AF398693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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


--cuf2qri4iqampkgy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 02:19:25PM +0000, Biju Das wrote:
> Hi Maxime Ripard,
>=20
> > -----Original Message-----
> > From: Biju Das
> > Sent: Friday, December 15, 2023 1:52 PM
> > Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >=20
> > Hi Maxime Ripard,
> >=20
> > > -----Original Message-----
> > > From: Maxime Ripard <mripard@kernel.org>
> > > Sent: Friday, December 15, 2023 12:58 PM
> > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > >
> > > On Fri, Dec 15, 2023 at 11:37:07AM +0000, Biju Das wrote:
> > > > Hi Maxime Ripard,
> > > >
> > > > > -----Original Message-----
> > > > > From: Maxime Ripard <mripard@kernel.org>
> > > > > Sent: Friday, December 15, 2023 10:24 AM
> > > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > > > >
> > > > > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > > > > Hi Maxime Ripard,
> > > > > >
> > > > > > Thanks for the feedback.
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Maxime Ripard <mripard@kernel.org>
> > > > > > > Sent: Wednesday, December 13, 2023 3:47 PM
> > > > > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU
> > > > > > > Support
> > > > > > >
> > > > > > > > +	 */
> > > > > > > > +	rzg2l_du_crtc_get(rcrtc);
> > > > > > >
> > > > > > > That's a bit suspicious. Have you looked at
> > > > > > > drm_atomic_helper_commit_tail_rpm() ?
> > > > > >
> > > > > > Ok, I will drop this and start using
> > > > > > drm_atomic_helper_commit_tail_rpm()
> > > > > > instead of rzg2l_du_atomic_commit_tail().
> > > > >
> > > > > It was more of a suggestion, really. I'm not sure whether it works
> > > > > for you, but it usually addresses similar issues in drivers.
> > > >
> > > > I confirm, it is working in my case, even after removing
> > > > rzg2l_du_crtc_get() and using the helper function
> > > drm_atomic_helper_commit_tail_rpm().
> > > >
> > > > >
> > > > > > >
> > > > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *cr=
tc)
> > {
> > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > +
> > > > > > > > +	rcrtc->vblank_enable =3D true;
> > > > > > > > +
> > > > > > > > +	return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc
> > > > > > > > +*crtc)
> > > {
> > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > +
> > > > > > > > +	rcrtc->vblank_enable =3D false; }
> > > > > > >
> > > > > > > You should enable / disable your interrupts here
> > > > > >
> > > > > > We don't have dedicated vblank IRQ for enabling/disabling vblan=
k.
> > > > > >
> > > > > > vblank is handled by vspd.
> > > > > >
> > > > > > vspd is directly rendering images to display,
> > > > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > > > called in vspd's pageflip context.
> > > > > >
> > > > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > > > >
> > > > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > > > reporting is going to work. Could you explain it a bit more?
> > > >
> > > > We just need to handle vertical blanking in the VSP frame end handl=
er.
> > > > See the code below.
> > > >
> > > > static void rzg2l_du_vsp_complete(void *private, unsigned int
> > > > status,
> > > > u32 crc) {
> > > > 	struct rzg2l_du_crtc *crtc =3D private;
> > > >
> > > > 	if (crtc->vblank_enable)
> > > > 		drm_crtc_handle_vblank(&crtc->crtc);
> > > >
> > > > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > > > 		rzg2l_du_crtc_finish_page_flip(crtc);
> > > >
> > > > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
> > >
> > > Then we're back to the same question :)
> > >
> > > Why can't you mask the frame end interrupt?
> >=20
> > We are masking interrupts.
> >=20
> > [   70.639139] #######rzg2l_du_crtc_disable_vblank#######
> > [   70.650243] #########rzg2l_du_vsp_disable ############
> > [   70.652003] ########## vsp1_wpf_stop###
> >=20
> > Unmask is,
> >=20
> > [ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
> > [  176.354922] #########rzg2l_du_vsp_atomic_flush ############
> > [  176.355198] ########## wpf_configure_stream###
> >=20
>=20
> Shall I send V16 now as I am going for xmas vacation or
> Do you prefer to wait?

Waiting is fine, most of us are going to be in holidays too so you won't
get any reviews either :)

Maxime

--cuf2qri4iqampkgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXxhRgAKCRDj7w1vZxhR
xRTYAQCZ5+kRxw5upf2F2fYnch09iMY4aJ+1gIoketVUIpcbWAD/WTeR2Eg8C92x
dJ8TOIhhaezmP0YS++Gu2wiR54RqnQE=
=j+/Q
-----END PGP SIGNATURE-----

--cuf2qri4iqampkgy--
