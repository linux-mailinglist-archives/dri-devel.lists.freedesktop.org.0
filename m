Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC351BD4DA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552B16EC9C;
	Wed, 29 Apr 2020 06:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0491F6E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:11:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id EFC1A537;
 Tue, 28 Apr 2020 10:11:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Apr 2020 10:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0KxVBVYs0AHv0VR+aaPL51bJk2Z
 WuGKpm7rDGF8ENwE=; b=kkAfDby8QBaDdrJ1JRkLM/F29ZwOJzwSujk6jFkoXmK
 +JWMFoK9WBDj7xOwbZKgqb/Fju1dSU11CZhAq52yKoxalEb8KKoZQdcfmUISVt6X
 fx7s879sWd5J8bmToMA9NkZHJoZaZXwssls/Fbw5sKwBHqMMm54LcBJwPgLnoIGr
 OJtvYyOkVHO6EJATQvi5I7tGkqOY1Q44z6ITVeeaBYwOV+WsHeUT7WtA7+3vY+JJ
 iL6okA2iVaN2lzxwdote8eyfApTznZ4PjPsr/uDgr4+ZD+9rCleri0+m5B+rbAy0
 WCLSxOPxJOuvc3c41zBREU8Qd4acVN+j+Waf8qujdGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0KxVBV
 Ys0AHv0VR+aaPL51bJk2ZWuGKpm7rDGF8ENwE=; b=bBHd/JsDzd6U6Jj2pk7r7s
 9adptEPJ8bYklmwPx6yoQQ/ryib1GSykxnuaWNnExFhquvkshGFntpl6bHUJNvdt
 WgbH1K8p5Lua1RkzMUuavW2cYU6lLqnJA+lBnDvy//kvkflb8xac3R/YM/eK6RZ4
 Gxc/ONbNv2xZupjyAJS+WY7KPu/HFMUiIHITfbPKUw59g+J/aDrZ1zxJAPIvweBv
 YJwoWpQvvZiPbeXqCMYOAur3cmRVVKqF2Btgfz9yhrm5FWgfXgAZRla9QdSzg+CU
 8a7fZ7Qp7TUKZdnjPPOB8YI/naft2DZy70hhutGFGbVW6RzoIQ5eQ0VNKOXJZkDA
 ==
X-ME-Sender: <xms:qjmoXngQ8rthCZWjGsXrGgb9BU3wlMpYgnW19yBbuUdNu-Gp-hyAeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedugdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
 hordhtvggthh
X-ME-Proxy: <xmx:qjmoXia97xJ_LAD6HQ2iwwEZv8R9l0WbUjJHriZj3eb9E9axqhz_0w>
 <xmx:qjmoXjFmd0IAb6sxOvQHrwfq2RtQHVkpXeXPe6H_e2pKJX9zp9-iIw>
 <xmx:qjmoXnYfLgaSFWDw2vxpO7O7Vo87vq-osznzrGEZ8q58YO_BLeFzGA>
 <xmx:rTmoXgf2m6B-6uM1t3STX1ynXZnyhixiG59_yF8LDNvM0l47f7i3TUCQZ4U>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2CDE9328005A;
 Tue, 28 Apr 2020 10:11:54 -0400 (EDT)
Date: Tue, 28 Apr 2020 16:11:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 91/91] ARM: dts: bcm2711: Enable the display pipeline
Message-ID: <20200428141149.22n24halgw3p3qa6@gilmour.lan>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <7e7941611dad8106e5d9b03eeae06a6aefc0772c.1587742492.git-series.maxime@cerno.tech>
 <aba321ef-16fa-4f9b-a3a6-47b394daeac2@i2se.com>
MIME-Version: 1.0
In-Reply-To: <aba321ef-16fa-4f9b-a3a6-47b394daeac2@i2se.com>
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0511113669=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0511113669==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2uzyukowame55xt3"
Content-Disposition: inline


--2uzyukowame55xt3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Sat, Apr 25, 2020 at 10:54:22PM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 24.04.20 um 17:35 schrieb Maxime Ripard:
> > Now that all the drivers have been adjusted for it, let's bring in the
> > necessary device tree changes.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  arch/arm/boot/dts/bcm2711-rpi-4-b.dts |  46 +++++++++++-
> >  arch/arm/boot/dts/bcm2711.dtsi        | 115 ++++++++++++++++++++++++++-
> >  2 files changed, 160 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/=
bcm2711-rpi-4-b.dts
> > index 3205d2dfa898..0efbc4412dc9 100644
> > --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> > +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> > @@ -220,3 +220,49 @@
> >  &vchiq {
> >  	interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> >  };
> > +
> > +&vc4 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pixelvalve0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pixelvalve1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pixelvalve2 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pixelvalve3 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pixelvalve4 {
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi0 {
> > +	clocks =3D <&firmware_clocks 13>, <&dvp 0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&ddc0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi1 {
> > +	clocks =3D <&firmware_clocks 13>, <&dvp 1>;
> > +	status =3D "okay";
> > +};
> > +
> > +&ddc1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&hvs {
> > +	clocks =3D <&firmware_clocks 4>;
> > +};
> > diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711=
=2Edtsi
> > index 00bcaed1be32..a6549fa6e62b 100644
> > --- a/arch/arm/boot/dts/bcm2711.dtsi
> > +++ b/arch/arm/boot/dts/bcm2711.dtsi
> > @@ -12,6 +12,11 @@
> > =20
> >  	interrupt-parent =3D <&gicv2>;
> > =20
> ...
> > +
> > +		ddc0: i2c@7ef04500 {
> > +			compatible =3D "brcm,bcm2711-hdmi-i2c";
> > +			reg =3D <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
> > +			reg-names =3D "bsc", "auto-i2c";
> > +			clock-frequency =3D <390000>;
>=20
> according to a patch [1] from Dave Stevenson the i2c clock frequencies
> are too high.
>=20
> [1] -
> https://github.com/raspberrypi/linux/pull/3515/commits/c09f108de27e8bd199=
5e7713c6128fa79e69579a

Good catch, I'll merge it in my next round of changes

Maxime

--2uzyukowame55xt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqg5pQAKCRDj7w1vZxhR
xQ1LAP91xvr/EAIzvWK5E+bjOZazwPcp4DpONK5z9Xr2cRoGMgD/dGYehbr08g+i
YgQKRp6pnmAlE6W5yIlpR5WwrJ2vSwQ=
=6BJB
-----END PGP SIGNATURE-----

--2uzyukowame55xt3--

--===============0511113669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0511113669==--
