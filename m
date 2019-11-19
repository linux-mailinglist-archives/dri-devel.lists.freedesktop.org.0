Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5710303E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C08F6EA1A;
	Tue, 19 Nov 2019 23:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4296E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:23:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 2065928BD9C
Received: by earth.universe (Postfix, from userid 1000)
 id A7CFB3C0C78; Tue, 19 Nov 2019 22:23:08 +0100 (CET)
Date: Tue, 19 Nov 2019 22:23:08 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
Message-ID: <20191119212308.mvwq32zwno2gu5v6@earth.universe>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
 <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
 <20191118143332.nyyr6hb4b5c34xew@earth.universe>
 <7CBD93FA-60AB-4313-BF9C-230BDE2DAE7D@goldelico.com>
 <20191118150301.vvnsmztfxo76ghwe@earth.universe>
 <20191118225209.GF35479@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20191118225209.GF35479@atomide.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0197939994=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0197939994==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a73gbwfpczdi2bom"
Content-Disposition: inline


--a73gbwfpczdi2bom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Mon, Nov 18, 2019 at 02:52:09PM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sebastian.reichel@collabora.com> [191118 15:03]:
> > On Mon, Nov 18, 2019 at 03:37:12PM +0100, H. Nikolaus Schaller wrote:
> > > > Am 18.11.2019 um 15:33 schrieb Sebastian Reichel <sebastian.reichel=
@collabora.com>:
> > > > On Mon, Nov 18, 2019 at 03:05:07PM +0200, Tomi Valkeinen wrote:
> > > >> On 17/11/2019 04:39, Sebastian Reichel wrote:
> > > >>> The standard binding for DSI requires, that the channel number
> > > >>> of the panel is encoded in DT. This adds the channel number in
> > > >>> all OMAP3-5 boards, in preparation for using common infrastructur=
e.
> > > >>>=20
> > > >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > >>> ---
> > > >>>  .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 =
+++-
> > > >>>  arch/arm/boot/dts/omap3-n950.dts                            | 3 =
++-
> > > >>>  arch/arm/boot/dts/omap3.dtsi                                | 3 =
+++
> > > >>>  arch/arm/boot/dts/omap4-droid4-xt894.dts                    | 3 =
++-
> > > >>>  arch/arm/boot/dts/omap4-sdp.dts                             | 6 =
++++--
> > > >>>  arch/arm/boot/dts/omap4.dtsi                                | 6 =
++++++
> > > >>>  arch/arm/boot/dts/omap5.dtsi                                | 6 =
++++++
> > > >>>  7 files changed, 26 insertions(+), 5 deletions(-)
> > > >>=20
> > > >> Is this required only in the .txt, or also by the driver? This doe=
s break
> > > >> backward compatibility with the dtbs, and there's always someone w=
ho won't
> > > >> like it.
> > > >=20
> > > > I add a compatible string for the Droid 4 panel in addition to the
> > > > generic one, which is not really required and just a precaution in
> > > > case we need some quirks in the future.
> > > >=20
> > > > But I had to add the DSI channel to DT, which is required to follow
> > > > the standard DSI bindings. We cannot use the generic infrastructure
> > > > without this change. Technically it should have been there all the
> > > > time, it is only working because it is currently hardcoded to 0 in
> > > > the panel driver.
> > >=20
> > > Is it possible to change it to default to channel <0> if reg is not
> > > specified?
> >=20
> > Currently nodes without reg property are skipped by of_mipi_dsi_device_=
add()
> > and of_mipi_dsi_device_add() fails if reg node is missing. Technically
> > it should be possible to default to channel 0 there. That affects all
> > platforms, though. Considering the small amount of boards affected, I t=
hink
> > its better to just fix the DT. Also the fixed DT does not make problems
> > with older kernels and can be backported.
>=20
> You might be able to do a local fixup at driver probe time using
> of_add_property(). See for example pcs_quirk_missing_pinctrl_cells()
> I added earlier because of similar issues.

That sounds like a good plan. I suppose it could be added for some
kernel releases with a WARN() asking the user to update their DT.

-- Sebastian

--a73gbwfpczdi2bom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3UXTwACgkQ2O7X88g7
+ppfHA/+ID0DwttcEAqc3xElkKPmxfDc6ATcdfmkQhKhnMI7DcqifusgdtDr3eip
YmoDkIa4dmMDHIJESxONUmzS7ZB+U9fPcstbUfsApLaAVrZbJ9L++WNU8RPqxsX8
2JbVR/B1E9r/z0IS+hy1KEEZc66/WX4sgcLe7flQgMSFLBGate0tJdZn97/Ifnka
bwVptQvy1kl0wDtipwE5pbw0hgp4ctwqHFFutEAaIWFCUjfJo+psOpYjOcxjJGub
HcNZPdtPiY5HcpSbOy2v4h/PF07Hc85YrHOpCGirvQ6diFHCTCDR7JhwYlIJWsrs
8/Ob3GOJ9iQI4LON1kF0BjO3YAoTZlWctS/PcLSEQBhQ7cTW2vmROL/KTQ9U2I4L
gazKwbESYoyMrL4rnDb8EJmOKe1/EOhyz+NftUFxuz8aFSFXPVOW9oQRZ2FiKYZm
gpmXPdiN+rJAxPHVcRkZ2sZRH/r8F1tWYuuT18yBmS1ysdDeI9DuDqOoXpTUpSAz
gHubJ7N2+v49RoSHPqR4340z6yK7XKGijNFT5EVjOTKOdatPHMNKjwC3JYWHMBnV
GU4C724Nxh1Lp3ShsW5lIeD90CcaUKRiAtJcTDm+Xx0ckXylL43U4Mr4lnMzcKvq
8tZg0qhp44139GEdHZm1hIkZRbNoELLcmdU2K5zfG14IoAbYJzo=
=/D3e
-----END PGP SIGNATURE-----

--a73gbwfpczdi2bom--

--===============0197939994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0197939994==--
