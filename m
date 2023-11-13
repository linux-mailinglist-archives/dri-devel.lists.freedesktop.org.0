Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375EF7E9DCC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF20610E378;
	Mon, 13 Nov 2023 13:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1427810E37B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:50:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6C5FD60F00;
 Mon, 13 Nov 2023 13:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB04C433C7;
 Mon, 13 Nov 2023 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699883450;
 bh=WwbCN114QiP0MlzJD2sfEH3eE1j43I2qgLo7i+dL0oM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pBcX2G4QpFuzkUw+JPFg6UnLmIlTopw4x8DNRWIOX1NLF6olH5z/k6PoX/+bJKR/F
 tV1xtPVI2+fXG7Pv1NzDzVt9fb/vbF8GfCXvgG6FRXK9OHjk8XBtFt7QuXpwqjuFaj
 J0qQ3sHlhc2jGPbGiUcLgsdxP+tLl04HRs173VPI3KCtUZrpIQbEk0FsxMRtQ/7uPd
 FZMHD3UdOUyauWqFoDtkHQyMAzwFXwEK8H2NrV47w3mJ9tl2tj12TFYZOg9NhMxLcl
 r6V7LC5Za/wHKjMKhp0N43PV090Va8UG5JcytghrWM8fF0sd42fY3jyNIJC5nXmLTr
 Jiq5SRm6kjp0A==
Date: Mon, 13 Nov 2023 13:50:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/5] dt-bindings: gpu: samsung: re-order entries to match
 coding convention
Message-ID: <20231113-tweet-batboy-c2867f2ceeee@squawk>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
 <20231112184403.3449-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YTvCgQf37/RkS4VO"
Content-Disposition: inline
In-Reply-To: <20231112184403.3449-2-krzysztof.kozlowski@linaro.org>
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
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--YTvCgQf37/RkS4VO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 07:44:00PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings coding convention, as used in most of the files
> and expressed in Documentation/devicetree/bindings/example-schema.yaml,
> expects "allOf:" block with if-statements after "required:" block.
>=20
> Re-order few schemas to match the convention to avoid repeating review
> comments for new patches using existing code as template.  No functional
> changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

thanks,
Conor,

> ---
>  .../devicetree/bindings/gpu/samsung-g2d.yaml  | 53 +++++++++--------
>  .../bindings/gpu/samsung-scaler.yaml          | 59 +++++++++----------
>  2 files changed, 56 insertions(+), 56 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml b/Doc=
umentation/devicetree/bindings/gpu/samsung-g2d.yaml
> index e7daae862578..b6951acc7643 100644
> --- a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
> @@ -27,32 +27,6 @@ properties:
>    iommus: {}
>    power-domains: {}
> =20
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: samsung,exynos5250-g2d
> -
> -then:
> -  properties:
> -    clocks:
> -      items:
> -        - description: fimg2d clock
> -    clock-names:
> -      items:
> -        - const: fimg2d
> -
> -else:
> -  properties:
> -    clocks:
> -      items:
> -        - description: sclk_fimg2d clock
> -        - description: fimg2d clock
> -    clock-names:
> -      items:
> -        - const: sclk_fimg2d
> -        - const: fimg2d
> -
>  required:
>    - compatible
>    - reg
> @@ -60,6 +34,33 @@ required:
>    - clocks
>    - clock-names
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos5250-g2d
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: fimg2d clock
> +        clock-names:
> +          items:
> +            - const: fimg2d
> +
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: sclk_fimg2d clock
> +            - description: fimg2d clock
> +        clock-names:
> +          items:
> +            - const: sclk_fimg2d
> +            - const: fimg2d
> +
>  additionalProperties: false
> =20
>  examples:
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/=
Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> index 5317ac64426a..97d86a002a90 100644
> --- a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> +++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> @@ -26,36 +26,6 @@ properties:
>    iommus: {}
>    power-domains: {}
> =20
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: samsung,exynos5420-scaler
> -
> -then:
> -  properties:
> -    clocks:
> -      items:
> -        - description: mscl clock
> -
> -    clock-names:
> -      items:
> -        - const: mscl
> -
> -else:
> -  properties:
> -    clocks:
> -      items:
> -        - description: pclk clock
> -        - description: aclk clock
> -        - description: aclk_xiu clock
> -
> -    clock-names:
> -      items:
> -        - const: pclk
> -        - const: aclk
> -        - const: aclk_xiu
> -
>  required:
>    - compatible
>    - reg
> @@ -63,6 +33,35 @@ required:
>    - clocks
>    - clock-names
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos5420-scaler
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: mscl clock
> +        clock-names:
> +          items:
> +            - const: mscl
> +
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: pclk clock
> +            - description: aclk clock
> +            - description: aclk_xiu clock
> +        clock-names:
> +          items:
> +            - const: pclk
> +            - const: aclk
> +            - const: aclk_xiu
> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.34.1
>=20

--YTvCgQf37/RkS4VO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVIpswAKCRB4tDGHoIJi
0hmMAP93B7Y0eOqTKSYR5l7ofAt+w3rJUe42+UR2t2Y79C3dBgD+OJWQvdiQaVVX
vWFPGy2vuZOGzCeK7ttAqRIvXZ+3WgM=
=VtkS
-----END PGP SIGNATURE-----

--YTvCgQf37/RkS4VO--
