Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276CF72AC80
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 17:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFCE10E08D;
	Sat, 10 Jun 2023 15:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FEA10E08D
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 15:10:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF98360C55;
 Sat, 10 Jun 2023 15:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E19C433EF;
 Sat, 10 Jun 2023 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686409819;
 bh=Udl3gpTsbEFhzWm2UKL/yfURVDjduN41OaBF5GROL08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JKB91dYaT4t2C8zflPEtdoyH8GAJjJmvteJEDovThYih7rG8wCuOt5QwUgYwceg3l
 gIfpC/jmajAexLT8FUEnNCKUt8M/chF3/dRmAdJoara+nfY2ASrmv7ERFqHmhcw/Mn
 XuqegBRCyd6N8ugVrjtPj4dC5DNCReEEkhSkR5ldBGMe+ydFjMq9Kq8PBYGnphIErb
 R4QOOjrcay2nbJ+AAtLEG99IdcEzH9Wq17xQ9s8d7YK972THov9auqGxKlHA0z0Gho
 zeX/N3ULuS3nVKM2xtIVAvoUn35XPwidqk75YTxXJK329txbi4qEcbFn2lobUnMn53
 3Xe66yGU7YWFA==
Date: Sat, 10 Jun 2023 16:10:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Remove default
 width and height values
Message-ID: <20230610-opposite-quality-81d4a1561c88@spud>
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3cqXYw9khEbW+8jc"
Content-Disposition: inline
In-Reply-To: <20230609170941.1150941-3-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3cqXYw9khEbW+8jc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 07:09:37PM +0200, Javier Martinez Canillas wrote:
> A default resolution in the ssd130x driver isn't set to an arbitrary 96x16
> anymore. Instead is set to a width and height that's controller dependent.

Did that change to the driver not break backwards compatibility with
existing devicetrees that relied on the default values to get 96x16?

Cheers,
Conor.

>=20
> The datasheets for the chips describes the following display resolutions:
>=20
>  - SH1106:  132 x 64 Dot Matrix OLED/PLED
>  - SSD1305: 132 x 64 Dot Matrix OLED/PLED
>  - SSD1306: 128 x 64 Dot Matrix OLED/PLED
>  - SSD1307: 128 x 39 Dot Matrix OLED/PLED
>  - SSD1309: 128 x 64 Dot Matrix OLED/PLED
>=20
> Update DT schema to reflect what the driver does and make its users aware.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>=20
> Changes in v2:
> - List per controller default width/height values in DT schema (Maxime Ri=
pard).
>=20
>  .../bindings/display/solomon,ssd1307fb.yaml   | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.=
yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> index 94bb5ef567c6..20e2bd15d4d2 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -49,15 +49,15 @@ properties:
> =20
>    solomon,height:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    default: 16
>      description:
> -      Height in pixel of the screen driven by the controller
> +      Height in pixel of the screen driven by the controller.
> +      The default value is controller-dependent.
> =20
>    solomon,width:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    default: 96
>      description:
> -      Width in pixel of the screen driven by the controller
> +      Width in pixel of the screen driven by the controller.
> +      The default value is controller-dependent.
> =20
>    solomon,page-offset:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -157,6 +157,10 @@ allOf:
>              const: sinowealth,sh1106
>      then:
>        properties:
> +        width:
> +          default: 132
> +        height:
> +          default: 64
>          solomon,dclk-div:
>            default: 1
>          solomon,dclk-frq:
> @@ -171,6 +175,10 @@ allOf:
>                - solomon,ssd1305
>      then:
>        properties:
> +        width:
> +          default: 132
> +        height:
> +          default: 64
>          solomon,dclk-div:
>            default: 1
>          solomon,dclk-frq:
> @@ -185,6 +193,10 @@ allOf:
>                - solomon,ssd1306
>      then:
>        properties:
> +        width:
> +          default: 128
> +        height:
> +          default: 64
>          solomon,dclk-div:
>            default: 1
>          solomon,dclk-frq:
> @@ -199,6 +211,10 @@ allOf:
>                - solomon,ssd1307
>      then:
>        properties:
> +        width:
> +          default: 128
> +        height:
> +          default: 39
>          solomon,dclk-div:
>            default: 2
>          solomon,dclk-frq:
> @@ -215,6 +231,10 @@ allOf:
>                - solomon,ssd1309
>      then:
>        properties:
> +        width:
> +          default: 128
> +        height:
> +          default: 64
>          solomon,dclk-div:
>            default: 1
>          solomon,dclk-frq:
> --=20
> 2.40.1
>=20

--3cqXYw9khEbW+8jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZISSVgAKCRB4tDGHoIJi
0kHiAQCxzr20tUj6HolI6PerGWfwn14qZ8aiwPjBoCGR8H1eKgEA/9VvzM6t4Lxp
ck/8Ct5TBUcK6DlRBTm57sSc1tb96wM=
=ECGe
-----END PGP SIGNATURE-----

--3cqXYw9khEbW+8jc--
