Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173FC814575
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 11:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117FD10E31C;
	Fri, 15 Dec 2023 10:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E75E10E31C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 10:23:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 814C062464;
 Fri, 15 Dec 2023 10:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52A8C433C8;
 Fri, 15 Dec 2023 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702635829;
 bh=tCAHS66eVgmZ57iqN7Mrr0Y2TmAFZVdVWNz4apn9D/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRltX7kYW7hLAHMkTv/XvtLnhKZHFOzBIsonzQT95l9YaTUeAf6WyY3iLkVzwWZ8J
 0+Uj3NTd1x0MBA0ke9/C7YggGnLyXLGehjyCHiqFzKuhI+eLwm48LS1K0bjYP8qEX8
 ZRZwKflTyaju8L2VQHD/WKTh7I30Rv/yqgWJuWLhzih/UY2GfUoJVjzGNpEPZwUtbu
 EqY5cLAQHX1SxWVAdhYA/LqjhYrl03pWg6iRQfenueOHvX5K2+6O1FnEHlD/RHpzNm
 sEaD1wq/5dyYO32fEHf1oletcXhwNmP8EVcAqs0NjVClYt5br17yuQ8XzYNhfh6w2R
 GB6ayJLNweHbg==
Date: Fri, 15 Dec 2023 11:23:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Message-ID: <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h75ngiwxrejsdylk"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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


--h75ngiwxrejsdylk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> Hi Maxime Ripard,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Wednesday, December 13, 2023 3:47 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >=20
> > On Tue, Nov 28, 2023 at 10:51:27AM +0000, Biju Das wrote:
> > > The LCD controller is composed of Frame Compression Processor (FCPVD),
> > > Video Signal Processor (VSPD), and Display Unit (DU).
> > >
> > > It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> > > along with 2 RPFs to support the blending of two picture layers and
> > > raster operations (ROPs).
> > >
> > > The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> > > alike SoCs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >=20
> > I'd still like a review from Geert or Laurent, I don't know the SoC.
>=20
> Since Laurent is super busy, maybe Kieran and Jacopo can provide feedback=
 if any.
>=20
> The display blocks is shown in [1] and the pipe line is as below
>=20
> Memory-> fcpvd -->VSPD --> DU --> DSI --> Display panel.
>=20
> Fcpvd: Frame Compression Processor
> VSPD: Video Signal Processor, Basically a blitter engine which directly r=
ender images to DU
> DU: Display Unit.
>=20
> On R-Car fpvcd, VSPD and (DU with planes) IPs are separate blocks
> whereas here it is integrated inside LCDC.
>=20
> fcpvd and VSPD are in media subsystem and we are reusing the code here.
> The vspd is based on display list, it downloads the register contents fro=
m linked list in memory
> and execute composite operation and generates interrupts for display star=
t and frame end.
>=20
> du_vsp registers the frame completion callback with vspd driver in media =
framework.
> and we call the drm_crtc_handle_vblank() in this context.
>=20
> [1]
> https://pasteboard.co/MDmbXdK3psSD.png
>=20
> =E2=97=8F FCPVD
> =E2=88=92 Support out-of-order for the whole outstanding transactions
> =E2=88=92 Read linear addressing image data
> =E2=88=92 Read display list data
> =E2=88=92 Write image data
> =E2=97=8F VSPD
> =E2=88=92 Supports various data formats and conversion
> =E2=88=92 Supports YCbCr444/422/420, RGB, =CE=B1 RGB, =CE=B1 plane
> =E2=88=92 Color space conversion and changes to the number of colors by d=
ithering
> =E2=88=92 Color keying
> =E2=88=92 Supports combination between pixel alpha and global alpha
> =E2=88=92 Supports generating pre multiplied alpha
> =E2=88=92 Video processing
> =E2=88=92 Blending of two picture layers and raster operations (ROPs)
> =E2=88=92 Clipping
> =E2=88=92 1D look up table
> =E2=88=92 Vertical flipping in case of output to memory
> =E2=88=92 Direct connection to display module
> =E2=88=92 Supporting 1920 pixels in horizontal direction
> =E2=88=92 Writing back image data which is transferred to Display Unit (D=
U) to memory
> =E2=97=8F DU
> =E2=88=92 Supporting Display Parallel Interface (DPI) and MIPI LINK Video=
 Interface
> =E2=88=92 Display timing master
> =E2=88=92 Generating video timings (Front porch, Back porch, Sync active,=
 Active video area)
> =E2=88=92 Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
> =E2=88=92 Supporting Progressive (Non-interlace)
> =E2=88=92 Not supports Interlace
> =E2=88=92 Input data format (from VSPD): RGB888, RGB666 (not supports dit=
hering of RGB565)
> =E2=88=92 Output data format: same as Input data format
> =E2=88=92 Supporting Full HD (1920 pixels =C3=97 1080 lines) for MIPI-DSI=
 Output
> =E2=88=92 Supporting WXGA (1280 pixels =C3=97 800 lines) for Parallel Out=
put

Thanks, that's super helpful. The architecture is thus similar to vc4

Some general questions related to bugs we had at some point with vc4:

  * Where is the display list stored? In RAM or in a dedicated SRAM?

  * Are the pointer to the current display list latched?

  * Is the display list itself latched? If it's not, what happens when
    the display list is changed while the frame is being generated?

> >=20
> > > +static int rzg2l_du_crtc_get(struct rzg2l_du_crtc *rcrtc) {
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * Guard against double-get, as the function is called from both the
> > > +	 * .atomic_enable() and .atomic_flush() handlers.
> > > +	 */
> > > +	if (rcrtc->initialized)
> > > +		return 0;
> > > +
> > > +	ret =3D clk_prepare_enable(rcrtc->rzg2l_clocks.aclk);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret =3D clk_prepare_enable(rcrtc->rzg2l_clocks.pclk);
> > > +	if (ret < 0)
> > > +		goto error_bus_clock;
> > > +
> > > +	ret =3D reset_control_deassert(rcrtc->rstc);
> > > +	if (ret < 0)
> > > +		goto error_peri_clock;
> > > +
> > > +	rzg2l_du_crtc_setup(rcrtc);
> > > +	rcrtc->initialized =3D true;
> > > +
> > > +	return 0;
> > > +
> > > +error_peri_clock:
> > > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
> > > +error_bus_clock:
> > > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> > > +	return ret;
> > > +}
> >=20
> > [...]
> >=20
> > > +static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > > +				       struct drm_atomic_state *state) {
> > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > +	struct drm_device *dev =3D rcrtc->crtc.dev;
> > > +	unsigned long flags;
> > > +
> > > +	WARN_ON(!crtc->state->enable);
> > > +
> > > +	/*
> > > +	 * If a mode set is in progress we can be called with the CRTC
> > disabled.
> > > +	 * We thus need to first get and setup the CRTC in order to
> > configure
> > > +	 * planes. We must *not* put the CRTC, as it must be kept awake
> > until
> > > +	 * the .atomic_enable() call that will follow. The get operation in
> > > +	 * .atomic_enable() will in that case be a no-op, and the CRTC will
> > be
> > > +	 * put later in .atomic_disable().
> > > +	 */
> > > +	rzg2l_du_crtc_get(rcrtc);
> >=20
> > That's a bit suspicious. Have you looked at
> > drm_atomic_helper_commit_tail_rpm() ?
>=20
> Ok, I will drop this and start using  drm_atomic_helper_commit_tail_rpm()
> instead of rzg2l_du_atomic_commit_tail().

It was more of a suggestion, really. I'm not sure whether it works for
you, but it usually addresses similar issues in drivers.

> >=20
> > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc) {
> > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > +
> > > +	rcrtc->vblank_enable =3D true;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc) {
> > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > +
> > > +	rcrtc->vblank_enable =3D false;
> > > +}
> >=20
> > You should enable / disable your interrupts here
>=20
> We don't have dedicated vblank IRQ for enabling/disabling vblank.
>=20
> vblank is handled by vspd.
>=20
> vspd is directly rendering images to display,
> rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> called in vspd's pageflip context.
>=20
> See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c

Sorry, I couldn't really get how the interrupt flow / vblank reporting
is going to work. Could you explain it a bit more?

Maxime

--h75ngiwxrejsdylk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXwpMgAKCRDj7w1vZxhR
xf9TAP4gKIDW41SXJZ8HXazfzRRo7CTDtG1gXhGJEYWKBexirwEA1nImmi++Jrx3
17S1SWTPsal00Aw7d5bewG3VqbWF3w0=
=dLne
-----END PGP SIGNATURE-----

--h75ngiwxrejsdylk--
