Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4669D9379
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317AB10E3E2;
	Tue, 26 Nov 2024 08:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LysdB1sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C506210E3E2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 08:43:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7AFC5C5D15;
 Tue, 26 Nov 2024 08:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADDDC4CECF;
 Tue, 26 Nov 2024 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732610599;
 bh=KO4QChkeXAG6Ye9voL0kF1b9b0iezByykeh0B91eWOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LysdB1sjC85kARHi4P1uA6mphsyY2WNeU6Uoxlf4hYuWmaSplc0EO98GwvqXyuGtj
 eC67M2vKoBHT0dpJxsNGcS0A87DyoJOWyZ1PUfXZhYL0J82fETMOmOlOT5+9iFh75F
 G43EGLPROxWeYcr2AXeve0GXF3zj4UdtjYPFQVkpd1yTceukMTw5xY91uef8jFiEua
 0u3ARhK5hIugNZ0UiPnvbhYm/ZxOMmZ7CQm3urOdgFDnaFK0cxWD9jyaM4S9gsTk4P
 Mm1fbOdhSW3QDg3zZcP8RpjamEowa7SlewSs+efHysJ/fvyV1o7iEVn1iGlgGTvP8L
 ZwuS+fw6CB1+g==
Date: Tue, 26 Nov 2024 09:43:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, frank.li@nxp.com, 
 dmitry.baryshkov@linaro.org
Subject: Re: [DO NOT MERGE PATCH v4 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
Message-ID: <20241126-overjoyed-futuristic-saluki-cb6cc7@houat>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-17-victor.liu@nxp.com>
 <Z0RXCYZ_7fBvpcvd@gaggiata.pivistrello.it>
 <d004dfe7-d019-4f53-8373-c8c4e031748c@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fgeuvrs34ws7krrf"
Content-Disposition: inline
In-Reply-To: <d004dfe7-d019-4f53-8373-c8c4e031748c@nxp.com>
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


--fgeuvrs34ws7krrf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [DO NOT MERGE PATCH v4 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 10:08:26AM +0800, Liu Ying wrote:
> On 11/25/2024, Francesco Dolcini wrote:
> > On Mon, Nov 25, 2024 at 05:33:13PM +0800, Liu Ying wrote:
> >> Add display controller subsystem in i.MX8qxp SoC.
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >=20
> > ...
> >=20
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8qxp.dtsi
> >> index 05138326f0a5..35cc82cbbcd1 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> >> @@ -20,6 +20,27 @@ / {
> >>  	#size-cells =3D <2>;
> >> =20
> >>  	aliases {
> >> +		dc0 =3D &dc0;
> >> +		dc0-constframe0 =3D &dc0_constframe0;
> >> +		dc0-constframe1 =3D &dc0_constframe1;
> >> +		dc0-constframe4 =3D &dc0_constframe4;
> >> +		dc0-constframe5 =3D &dc0_constframe5;
> >> +		dc0-display-engine0 =3D &dc0_display_engine0;
> >> +		dc0-display-engine1 =3D &dc0_display_engine1;
> >> +		dc0-extdst0 =3D &dc0_extdst0;
> >> +		dc0-extdst1 =3D &dc0_extdst1;
> >> +		dc0-extdst4 =3D &dc0_extdst4;
> >> +		dc0-extdst5 =3D &dc0_extdst5;
> >> +		dc0-fetchlayer0 =3D &dc0_fetchlayer0;
> >> +		dc0-fetchwarp2 =3D &dc0_fetchwarp2;
> >> +		dc0-framegen0 =3D &dc0_framegen0;
> >> +		dc0-framegen1 =3D &dc0_framegen1;
> >> +		dc0-layerblend0 =3D &dc0_layerblend0;
> >> +		dc0-layerblend1 =3D &dc0_layerblend1;
> >> +		dc0-layerblend2 =3D &dc0_layerblend2;
> >> +		dc0-layerblend3 =3D &dc0_layerblend3;
> >> +		dc0-tcon0 =3D &dc0_tcon0;
> >> +		dc0-tcon1 =3D &dc0_tcon1;
> >=20
> > what would you use those aliases for?
>=20
> They are used to get the instance numbers of display controller
> and display controller's internal processing units from display
> driver, e.g., patch 9 & 10 get instance numbers of some display
> controller's internal processing units.

AFAIK, it's not listed anywhere in your bindings. Did you get an
acked-by from a DT maintainer for those aliases as well?

Maxime

--fgeuvrs34ws7krrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0WKJAAKCRAnX84Zoj2+
dv4FAX967eYE5R0RWLQVTJQQ3qJdNEVy6ugNTjWr8xtIy2N8MIIRzNEYEwwM1k4I
4XQfvwoBgKYYryHo1ibtm7ah1MNmHl1h0R5wMhd+pMQv6UR7szQ8hWR4Bz3qc4SU
9QJkkLsfPQ==
=oNFh
-----END PGP SIGNATURE-----

--fgeuvrs34ws7krrf--
