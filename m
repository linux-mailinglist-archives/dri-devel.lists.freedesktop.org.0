Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776E72EAB3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3295010E3D7;
	Tue, 13 Jun 2023 18:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2832510E3D7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:18:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 467BB62E2B;
 Tue, 13 Jun 2023 18:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E74BC433D9;
 Tue, 13 Jun 2023 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686680312;
 bh=lN/ZqEmXoki934P40qYc//rkr2yO0dmQOJ7AK2ooq30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jgy4stFumTxUdZD3TISLjanSJ3rLeuCRdBjXcIzFmcMJ1vLDfpUmiVEpGuOdsAyPy
 cDGDV5HIown4NpxhUHUFErIA4N5Hc0wnb3w4Gh4IxHemp1dlja9ll4WGS+6zfSfyQH
 51Lm7f2heGaKgcFTJfsbUgMguKDgsrZQTBBSRyI9h731UTVJJdl9pyiWqMrvlZCcLU
 3xNDJxFDwpBY00edPwX4mmFJJ80kMHL/IThrWA/j/mvXdAyJv/2twyxHFI5X72Fbth
 WCIJ+mYScLjgBbcoX5tvdWSmjD8FX/by3gOjMvaGPRUXz+PE1kQoBrqAqLVCSJbzNh
 OM40TivsF7kuw==
Date: Tue, 13 Jun 2023 19:18:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Message-ID: <20230613-scouting-barricade-56cadb14657c@spud>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QP2yCaGkKPXhdEsL"
Content-Disposition: inline
In-Reply-To: <20230613070426.467389-2-manikandan.m@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 Hari.PrasathGE@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 Varshini.Rajendran@microchip.com, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, lee@kernel.org,
 Dharma.B@microchip.com, Nayabbasha.Sayed@microchip.com, conor+dt@kernel.org,
 robh+dt@kernel.org, Durai.ManickamKR@microchip.com,
 linux-arm-kernel@lists.infradead.org, Balakrishnan.S@microchip.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--QP2yCaGkKPXhdEsL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 12:34:18PM +0530, Manikandan Muralidharan wrote:
> Add new compatible string for the XLCD controller on SAM9X7 SoC.

You should probably indicate here why this is not compatible with the
existing SoCs that are supported. To hazard a guess, it is the HLCDC IP
(I forget the exact letters!)?
If so,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt b/Docu=
mentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> index 5f8880cc757e..7c77b6bf4adb 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> @@ -8,6 +8,7 @@ Required properties:
>     "atmel,sama5d3-hlcdc"
>     "atmel,sama5d4-hlcdc"
>     "microchip,sam9x60-hlcdc"
> +   "microchip,sam9x7-xlcdc"
>   - reg: base address and size of the HLCDC device registers.
>   - clock-names: the name of the 3 clocks requested by the HLCDC device.
>     Should contain "periph_clk", "sys_clk" and "slow_clk".
> --=20
> 2.25.1
>=20

--QP2yCaGkKPXhdEsL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIiy8QAKCRB4tDGHoIJi
0hGuAP94zGUWctEgLEspsssm28IRoOSAft6tLnIjHxmCnaTNsgEAgdQpLSpwU9NG
J6BI+l1yq7iXhBSLceaDwg6K2mtCUgE=
=0h02
-----END PGP SIGNATURE-----

--QP2yCaGkKPXhdEsL--
