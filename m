Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105E82DB9C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 15:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6AB10E2D3;
	Mon, 15 Jan 2024 14:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E3910E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 14:46:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4FACCCE0E3B;
 Mon, 15 Jan 2024 14:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BE3C433C7;
 Mon, 15 Jan 2024 14:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705329940;
 bh=tRLQ0Z88RKbDDHqezEjN3omnxCVQLyn4MWvS8yuJ5G4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EQR/pEozoncS5C3Ol7jiA/QacLXasDr5SzqDhp7hsq0JpO3tPfLz3ZVokJj8586el
 CjNNdgORcvFgXTBZXeHRrTEEv8OGN+DaWt4iql928ZOSZScnA79uc0Dl+x8Emf6vGn
 TGoB/lSOBEhLgpOhOv8bZ53DIdeAoNzHi9+oPgYgPpmOqEOmF+faeFG0k/N8ribQXk
 u+mpY34z54kgqNf6cg87CqtOhN3eBJSt3tqm2/UfuLDWOpobBRhIORmGyK6bJRCfM4
 VO2BK8o28Uf6cfJjKB3GQymTLO0ISMdOEBNnXrcrXCH5A5DT+Qyv/uX/eTcsm87xdh
 etysZWABystcw==
Date: Mon, 15 Jan 2024 15:45:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Re: [PATCH RFC v2 04/11] ARM: dts: omap4: Add device tree entry
 for SGX GPU
Message-ID: <xagwa5cie5gjzidg5wa6ou3yd2qwta7ridci4jzkrpcccm24mz@aphgjsdytirz>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-5-afd@ti.com>
 <122DC5ED-2AA7-46A0-845F-083922458385@goldelico.com>
 <vpcgccul53oibwoqb3barj3rjxoyskoldjyfvjdzmytic3tonm@wq4aqsenk7rp>
 <7BC64F03-A4DF-411F-9B6F-6BCA436D9B50@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3xx7p3mwtk5a7dcv"
Content-Disposition: inline
In-Reply-To: <7BC64F03-A4DF-411F-9B6F-6BCA436D9B50@goldelico.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Matt Coster <matt.coster@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3xx7p3mwtk5a7dcv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 09:55:00AM +0100, H. Nikolaus Schaller wrote:
> Hi,
>=20
> > Am 15.01.2024 um 09:25 schrieb Maxime Ripard <mripard@kernel.org>:
> >=20
> > Hi,
> >=20
> > On Fri, Jan 12, 2024 at 06:33:58PM +0100, H. Nikolaus Schaller wrote:
> >>> Am 08.01.2024 um 19:32 schrieb Andrew Davis <afd@ti.com>:
> >>>=20
> >>> Add SGX GPU device entry to base OMAP4 dtsi file.
> >>>=20
> >>> Signed-off-by: Andrew Davis <afd@ti.com>
> >>> ---
> >>> arch/arm/boot/dts/ti/omap/omap4.dtsi | 9 +++++----
> >>> 1 file changed, 5 insertions(+), 4 deletions(-)
> >>>=20
> >>> diff --git a/arch/arm/boot/dts/ti/omap/omap4.dtsi b/arch/arm/boot/dts=
/ti/omap/omap4.dtsi
> >>> index 2bbff9032be3e..559b2bfe4ca7c 100644
> >>> --- a/arch/arm/boot/dts/ti/omap/omap4.dtsi
> >>> +++ b/arch/arm/boot/dts/ti/omap/omap4.dtsi
> >>> @@ -501,10 +501,11 @@ sgx_module: target-module@56000000 {
> >>> #size-cells =3D <1>;
> >>> ranges =3D <0 0x56000000 0x2000000>;
> >>>=20
> >>> - /*
> >>> - * Closed source PowerVR driver, no child device
> >>> - * binding or driver in mainline
> >>> - */
> >>> + gpu@0 {
> >>=20
> >> I wonder why we don't add a "gpu:" label here.
> >>=20
> >> Almost all other subsystem nodes have one (e.g. emif:, aes:, dss:, dsi=
:, hdmi:, etc.),
> >> obviously for convenience when using a .dtsi file.
> >>=20
> >> It would allow a board-specific DTS to easily add status =3D "disabled=
" to avoid driver
> >> probing or disabling the GPU (e.g. if there is no display).
> >=20
> > There's no reason to disable it in the DT: the hardware block would
> > still be there and it's rendering to memory so it still could be useful.
>=20
> Well, if you know that the board does not have a dm3730 but a dm3725 with=
out
> GPU it is better to disable the GPU completely instead of loading the dri=
ver
> and make it detect by some internal bits that it has no GPU on the SoC.

It shouldn't even be in the DTSI if it's not in the SoC.

> > If there's no display on the board and you really don't want the GPU
> > driver, then you can disable the driver or block the module loading, but
> > it should be a distro / package / user decision, not a DT / kernel one
> > still.
>=20
> The same holds for aes: dss: dsi: hdmi: etc. If they are not used by some
> board file, they don't change a single bit of the DTB [1] which IMHO would
> be of reasonable concern to question additional labels.

Not really, no. If there's no HDMI connector, the HDMI controller is
useless. A GPU without a display can still be useful, depending on the
workload.

Maxime

--3xx7p3mwtk5a7dcv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaVFEQAKCRDj7w1vZxhR
xYLAAQD7hjmkBsOxfyoIsGNpz7ekssiiDTWUKJBEn79S9qdkjQD/ZF6T4o4JwKg2
1Y0Gk2k+BhScqbkykr/ZplBD8LyDcgg=
=po+r
-----END PGP SIGNATURE-----

--3xx7p3mwtk5a7dcv--
