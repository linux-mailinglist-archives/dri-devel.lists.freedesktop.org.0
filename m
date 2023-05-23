Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F209970E2CB
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A3310E48D;
	Tue, 23 May 2023 17:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D14810E48D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:35:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EE0163548;
 Tue, 23 May 2023 17:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9C8C433D2;
 Tue, 23 May 2023 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684863349;
 bh=V6La7xHuyVytMAyfQCoW1fs5fxMyIO2p76AI2SCUOEA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GtPdzUJqCnuCdbrKHnn6ERa4f+5zTE+NOlHT2B2jd36yEoOXyZEbzZGuHV6/xr73A
 FXH4S5r69z3TpvH5ecaYAKiR9+zuR4vRRQy2LmCkz/cGZt3LNgpnQ+VdFufEwgc+aZ
 y+8dhTUguas7Ej+7mZ3fCjz+I4XOtDxm3kysvSLUl8bib7rwnOO961Gh14b5OslPA2
 jnZQTEnr176dhlZWml11cjIcPJ0CDW6KM203OioUtuzMuv3HkJ6qmMRtFYvHZ3s6/c
 CLRezJz/AoZ6jI9uEi9DTSItUODShygq9vv5BEwMW4JFGG+R9DEjOz79RWSUHSXO1i
 3Vn6LiKRGOa/A==
Date: Tue, 23 May 2023 18:35:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: backlight: pwm: Make power-supply not
 required
Message-ID: <20230523-outlying-repulsive-efc0f9e1435e@spud>
References: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nG5CKQOdzr5W/qlH"
Content-Disposition: inline
In-Reply-To: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nG5CKQOdzr5W/qlH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 05:38:37PM +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
>=20
>     arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dtb: backlight: 'power-su=
pply' is a required property
> 	    From schema: Documentation/devicetree/bindings/leds/backlight/pwm-ba=
cklight.yaml
>=20
> As that backlight device node already has an "enable-gpios" property to
> control the power supplied to the backlight, it sounds a bit silly to
> have to add a "power-supply" property just to silence this warning.  In
> addition, as of commit deaeeda2051fa280 ("backlight: pwm_bl: Don't rely
> on a disabled PWM emiting inactive state"), the Linux driver considers
> the power supply optional.
>=20
> Fix this by synchronizing the bindings with actual driver behavior by
> making the "power-supply" optional.

That seems to follow from reading the aforementioned commit.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Fixes: deaeeda2051fa280 ("backlight: pwm_bl: Don't rely on a disabled PWM=
 emiting inactive state")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> As commit deaeeda2051fa280 was only upstreamed in v6.3, I'm wondering if
> the backlight on the iWave Systems RainboW-G20D/G21D Qseven and
> RainboW-G22D-SODIMM boards worked before?  I don't have the hardware.
>=20
> Thanks!
> ---
>  .../devicetree/bindings/leds/backlight/pwm-backlight.yaml        | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlig=
ht.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.ya=
ml
> index 5ec47a8c6568b60e..53569028899020d6 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> @@ -68,7 +68,6 @@ dependencies:
>  required:
>    - compatible
>    - pwms
> -  - power-supply
> =20
>  additionalProperties: false
> =20
> --=20
> 2.34.1
>=20

--nG5CKQOdzr5W/qlH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGz5cAAKCRB4tDGHoIJi
0mDPAQDCdFT25r3FjLLlJyhgTRdLJpa3ifbcKQxOZ20+M4dpXQD/dsHStncq/F4X
8OY2cqOzQwlc8EIm4K1E801mM1/RQwA=
=HU1s
-----END PGP SIGNATURE-----

--nG5CKQOdzr5W/qlH--
