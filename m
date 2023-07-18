Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9B575815D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ED310E374;
	Tue, 18 Jul 2023 15:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904CC10E374
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:52:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C937D61653;
 Tue, 18 Jul 2023 15:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1DDC433C8;
 Tue, 18 Jul 2023 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689695553;
 bh=XHpeFJn0biYE4gV7xczfk0L4JqX1SaDiayTdQtqcn00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rpuLNj10tvhOLFYPo0gAJSUCDA/pvSdt524z27elKPHaHPpMOfDiCkXzUJrs1l9lV
 qmXfVBcyGhu04vMxndgS8ZnsSevIcs0qC0Aj2xQY9mrvOisut+xndNT/P38pQ9PZhl
 UdKOV9vcwcLON5kvxo06oAv7/KPU3qbHbFlepSFgZbTqRdw4oXOrw4z97JuYpGkgjD
 VDgfv2zW3V9Qsp/wz4l7scZQwzngjGFhXr//IEmKvxuHuR6NjJ7Bw6uppRR6d4U98q
 PMu8IjKha4QlPq/NWm8JoinmbXkaK0bOKdfisCgvUDSn8o0nrZe4R+qg8xzp7tFaQ5
 LnfAtma7y35PA==
Date: Tue, 18 Jul 2023 16:52:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 2/2] dt-bindings: display: add rotation property to
 sitronix,st7789v
Message-ID: <20230718-trinity-moonshine-af526b1c8fcc@spud>
References: <20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net>
 <20230718-feature-st7789v-v1-2-76d6ca9b31d8@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LwCAvlGHnD6MaHlT"
Content-Disposition: inline
In-Reply-To: <20230718-feature-st7789v-v1-2-76d6ca9b31d8@wolfvision.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--LwCAvlGHnD6MaHlT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 05:12:46PM +0200, Michael Riesch wrote:
> The sitronix-st7789v driver now considers the rotation property.
> Add the property to the documentation.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml | =
2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7=
789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789=
v.yaml
> index fa6556363cca..694d7f771d0c 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.ya=
ml
> @@ -22,6 +22,7 @@ properties:
>    power-supply: true
>    backlight: true
>    port: true
> +  rotation: true
> =20
>    spi-cpha: true
>    spi-cpol: true
> @@ -52,6 +53,7 @@ examples:
>              reset-gpios =3D <&pio 6 11 GPIO_ACTIVE_LOW>;
>              backlight =3D <&pwm_bl>;
>              power-supply =3D <&power>;
> +            rotation =3D <180>;
>              spi-max-frequency =3D <100000>;
>              spi-cpol;
>              spi-cpha;
>=20
> --=20
> 2.30.2
>=20

--LwCAvlGHnD6MaHlT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLa1OwAKCRB4tDGHoIJi
0gMkAP960GmGAgRd4Yg6XS0aqkgycqSXLmPV0ki3Ai6wmaFPLAEAmx02q9lXoias
k/IIgb37pU++baZsXsTkqsap7kJlJgs=
=UStO
-----END PGP SIGNATURE-----

--LwCAvlGHnD6MaHlT--
