Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0616B62D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 01:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546096E9BF;
	Tue, 25 Feb 2020 00:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36286E9BF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:01:21 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5F5A2072D;
 Tue, 25 Feb 2020 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582588881;
 bh=jluxUBv9+cjF3wCqUPvR1vimx2eoMtB9rmGJYI2AvPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JZbTebstxDYehh/J0ZxVs38nEQ7caIX7JcBoZYxeTaQM5E/AyfapG+f/oynD4xhIt
 t41naCOncZWFKIKF79Bz4Ps6LH83tsHo0gWcDTBO6/s1B2usr8NJNwYXG2ZCHQJZe1
 AJ4oyKT945w3JskqKmwNM7o7zqdQHppCPRxPh+NQ=
Received: by earth.universe (Postfix, from userid 1000)
 id 3046B3C0C82; Tue, 25 Feb 2020 01:01:19 +0100 (CET)
Date: Tue, 25 Feb 2020 01:01:19 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2 01/56] ARM: dts: omap: add channel to DSI panels
Message-ID: <20200225000119.ppcd2nflzgcyql7q@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-2-sebastian.reichel@collabora.com>
 <20200224233821.GH16163@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200224233821.GH16163@pendragon.ideasonboard.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1839036666=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1839036666==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tz6dm6ay5nxvlsju"
Content-Disposition: inline


--tz6dm6ay5nxvlsju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Feb 25, 2020 at 01:38:21AM +0200, Laurent Pinchart wrote:
> Hi Sebastian,
>=20
> Thank you for the patch.
>=20
> On Tue, Feb 25, 2020 at 12:20:31AM +0100, Sebastian Reichel wrote:
> > The standard binding for DSI requires, that the channel number
> > of the panel is encoded in DT. This adds the channel number in
> > all OMAP3-5 boards, in preparation for using common infrastructure.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 +++-
> >  arch/arm/boot/dts/motorola-mapphone-common.dtsi             | 3 ++-
> >  arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
> >  arch/arm/boot/dts/omap3.dtsi                                | 3 +++
> >  arch/arm/boot/dts/omap4-sdp.dts                             | 6 ++++--
> >  arch/arm/boot/dts/omap4.dtsi                                | 6 ++++++
> >  arch/arm/boot/dts/omap5.dtsi                                | 6 ++++++
> >  7 files changed, 26 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-=
cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> > index dce48eb9db57..f92d5c9adfc5 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> > @@ -3,6 +3,7 @@ Generic MIPI DSI Command Mode Panel
> > =20
> >  Required properties:
> >  - compatible: "panel-dsi-cm"
> > +- reg: DSI channel number
> > =20
> >  Optional properties:
> >  - label: a symbolic name for the panel
> > @@ -15,9 +16,10 @@ Required nodes:
> >  Example
> >  -------
> > =20
> > -lcd0: display {
> > +lcd0: panel@0 {
> >  	compatible =3D "tpo,taal", "panel-dsi-cm";
> >  	label =3D "lcd0";
> > +	reg =3D <0>;
> > =20
> >  	reset-gpios =3D <&gpio4 6 GPIO_ACTIVE_HIGH>;
> > =20
>=20
> While at it, how about converting this to yaml ?

Ack. I was waiting for the dsi-controller YAML bindings to land,
which has happened in the meantime. I think it's better to do
this in a separate patch though, so that this one can easily be
backported.

-- Sebastian

> > diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm=
/boot/dts/motorola-mapphone-common.dtsi
> > index 85665506f4f8..a5e4ba7c8dab 100644
> > --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> > +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> > @@ -199,8 +199,9 @@ dsi1_out_ep: endpoint {
> >  		};
> >  	};
> > =20
> > -	lcd0: display {
> > +	lcd0: panel@0 {
> >  		compatible =3D "panel-dsi-cm";
> > +		reg =3D <0>;
> >  		label =3D "lcd0";
> >  		vddi-supply =3D <&lcd_regulator>;
> >  		reset-gpios =3D <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
> > diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3=
-n950.dts
> > index 31d47a1fad84..80cf4e1177da 100644
> > --- a/arch/arm/boot/dts/omap3-n950.dts
> > +++ b/arch/arm/boot/dts/omap3-n950.dts
> > @@ -225,8 +225,9 @@ dsi_out_ep: endpoint {
> >  		};
> >  	};
> > =20
> > -	lcd0: display {
> > +	lcd0: panel@0 {
> >  		compatible =3D "nokia,himalaya", "panel-dsi-cm";
> > +		reg =3D <0>;
> >  		label =3D "lcd0";
> > =20
> >  		pinctrl-names =3D "default";
> > diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
> > index 634ea16a711e..409d434a9b18 100644
> > --- a/arch/arm/boot/dts/omap3.dtsi
> > +++ b/arch/arm/boot/dts/omap3.dtsi
> > @@ -820,6 +820,9 @@ dsi: encoder@4804fc00 {
> >  				ti,hwmods =3D "dss_dsi1";
> >  				clocks =3D <&dss1_alwon_fck>, <&dss2_alwon_fck>;
> >  				clock-names =3D "fck", "sys_clk";
> > +
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> >  			};
> > =20
> >  			rfbi: encoder@48050800 {
> > diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-=
sdp.dts
> > index 91480ac1f328..8a8307517dab 100644
> > --- a/arch/arm/boot/dts/omap4-sdp.dts
> > +++ b/arch/arm/boot/dts/omap4-sdp.dts
> > @@ -662,8 +662,9 @@ dsi1_out_ep: endpoint {
> >  		};
> >  	};
> > =20
> > -	lcd0: display {
> > +	lcd0: panel@0 {
> >  		compatible =3D "tpo,taal", "panel-dsi-cm";
> > +		reg =3D <0>;
> >  		label =3D "lcd0";
> > =20
> >  		reset-gpios =3D <&gpio4 6 GPIO_ACTIVE_HIGH>;	/* 102 */
> > @@ -687,8 +688,9 @@ dsi2_out_ep: endpoint {
> >  		};
> >  	};
> > =20
> > -	lcd1: display {
> > +	lcd1: panel@0 {
> >  		compatible =3D "tpo,taal", "panel-dsi-cm";
> > +		reg =3D <0>;
> >  		label =3D "lcd1";
> > =20
> >  		reset-gpios =3D <&gpio4 8 GPIO_ACTIVE_HIGH>;	/* 104 */
> > diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
> > index 9a87440d0b9d..a75734065cac 100644
> > --- a/arch/arm/boot/dts/omap4.dtsi
> > +++ b/arch/arm/boot/dts/omap4.dtsi
> > @@ -465,6 +465,9 @@ dsi1: encoder@58004000 {
> >  				clocks =3D <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
> >  					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
> >  				clock-names =3D "fck", "sys_clk";
> > +
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> >  			};
> > =20
> >  			dsi2: encoder@58005000 {
> > @@ -479,6 +482,9 @@ dsi2: encoder@58005000 {
> >  				clocks =3D <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
> >  					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
> >  				clock-names =3D "fck", "sys_clk";
> > +
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> >  			};
> > =20
> >  			hdmi: encoder@58006000 {
> > diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> > index d0ecf54d5a23..5c7462e04716 100644
> > --- a/arch/arm/boot/dts/omap5.dtsi
> > +++ b/arch/arm/boot/dts/omap5.dtsi
> > @@ -333,6 +333,9 @@ dsi1: encoder@58004000 {
> >  				clocks =3D <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
> >  					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
> >  				clock-names =3D "fck", "sys_clk";
> > +
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> >  			};
> > =20
> >  			dsi2: encoder@58005000 {
> > @@ -347,6 +350,9 @@ dsi2: encoder@58005000 {
> >  				clocks =3D <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
> >  					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
> >  				clock-names =3D "fck", "sys_clk";
> > +
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> >  			};
> > =20
> >  			hdmi: encoder@58060000 {
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--tz6dm6ay5nxvlsju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5UY88ACgkQ2O7X88g7
+pooSw//bHHvPnTNOJbPV6c5mY/sTD2UQo1wTM9ODddh6j5brkJ7C0A2LmCzXDRo
VLr7CeO3Keo6LRIisno2OAhYRZldph/YdrdOn3obdw/8XuDdXJ9sqUVj0CMlMbZF
pJWETB3gi5b/XeeRewOG+AQR+0YxsxFoVNwEEc8LukG1ZeukRrsUiDqrovI/ah1R
fnfc8bUQXAxbXi+F3YdT5poaN0v/yBHTOyYXgazqoi4be/csMnwtSHdi0c+TbEhf
g6QfBdbX27V2Kc/RZZCcfN1HtK1zH0tE15hDXXeFDluAq+/CWl0sgfGpknandxoY
qCACc4deg8CRphmDn5PVXp47Glm31JmqBcKPp1Zqgs7Usizk7H6n8PUMzXJKxSty
cwrXaaOnrJYQs0WBbf5X/cbF8Te1tUdJxIyMzPBKcFjiHj6fj9Rjq1bGY/z9s6rA
BZLyjWD4jdx2RHmNNzzhkI8H0LJR8eJNIW070qLIJaawrtisfexC1NNYhW8wg7Od
j9MHEQRCPJ5rTR6Nnou7NbkDaccxEA2Q5zsqTf/GZlScgjJNzFjmmCp61vinMctg
XydGg+T+M8Ag+9bd4yJrS/7AISBGyl84rNVQo2fGacyds5DcsYtONy6nRxcAnzk8
B2352jK93n8rbPb/0YalqYVAoClKxzKwVRx6KY5enarMgwmQCUo=
=Oz7S
-----END PGP SIGNATURE-----

--tz6dm6ay5nxvlsju--

--===============1839036666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1839036666==--
