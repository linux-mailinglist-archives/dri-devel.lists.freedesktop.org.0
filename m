Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87634735E5B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 22:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DB810E0BD;
	Mon, 19 Jun 2023 20:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4C510E0BD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 20:18:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C7C8260E99;
 Mon, 19 Jun 2023 20:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFB9C433C8;
 Mon, 19 Jun 2023 20:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687205911;
 bh=HhghJ0yctP0ql16cZYZqxzheR0DW80MolXe2adxh4PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFJ28e8C/9xbrFv+nFHoy99cXRAzDYp/c1J1kHsrsr0fK0UZGoFs1GeQTFLH5GFBe
 LGYTdHv/yg8aDWvwuBCREEXjxpv/EyT7i08ksdgAFpWcP+8l9Rjx++O88/5udK+kZJ
 Hknr4Rkn9Go5AsgmBzjjfpsqtuoKiT57cVyAxVeR/jJESFWk5NwbXME3/XHfa4JmV+
 TgcKts6kxfDCyi67QVuFaEJi8tD2hJ2EIiTYe6AyAyDLvpsB5BUcgVp3PX5VS4R0Ej
 6/oKCF9bnEFeuC2anUCBG7v60rG1tJuj+gGt39p8EDCWvnjMrQDoUW975N2KrNHxla
 o3kP7IsfJdEPw==
Date: Mon, 19 Jun 2023 21:18:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 4/6] dt-bindings: display: stm32-ltdc: add optional
 st,fb-bpp property
Message-ID: <20230619-ion-decree-c63d2eb11e83@spud>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
 <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wB3prgNFdxLAzRiP"
Content-Disposition: inline
In-Reply-To: <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wB3prgNFdxLAzRiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Jun 19, 2023 at 06:55:23PM +0200, Dario Binacchi wrote:
> Boards that use the STM32F{4,7} series have limited amounts of RAM. The
> added property allows to size, within certain limits, the memory footprint
> required by the framebuffer.

Hmm, this sounds quite a lot like "software policy", since the actual
display doesn't have these limitations. Rob, Krzysztof?

>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>=20
> (no changes since v1)

Really?
https://lore.kernel.org/all/?q=3Ddfn:st,stm32-ltdc.yaml%20

You sure this shouldn't be "new in v4"?

>  .../devicetree/bindings/display/st,stm32-ltdc.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml=
 b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> index d6ea4d62a2cf..1c3a3653579f 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> @@ -42,6 +42,12 @@ properties:
>        - for internal dpi input of the MIPI DSI host controller.
>        Note: These 2 endpoints cannot be activated simultaneously.
> =20
> +  st,fb-bpp:

Is there not a more understandable property name than this?
Maybe I just had to think about it because fbdev stuff aint something
I've worked with...

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      bit depth of framebuffer (8, 16 or 32)
> +    maxItems: 1

Why not make it an enum, since there are only 4 values?

Cheers,
Conor.

> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.32.0
>=20

--wB3prgNFdxLAzRiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJC4EQAKCRB4tDGHoIJi
0oPpAP92h4xspKGtI1yHs7XjwoYCJXDpWoGzANgb0IX7QDSxWQEA+mwt+9KLghOY
jMdSLkmbkdR8P3BWLJOmAnP6AsLtKQQ=
=IYJt
-----END PGP SIGNATURE-----

--wB3prgNFdxLAzRiP--
