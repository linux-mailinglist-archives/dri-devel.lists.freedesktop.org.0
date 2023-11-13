Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374627E9DBB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A21D10E373;
	Mon, 13 Nov 2023 13:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6176210E373
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:48:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A906BB80D59;
 Mon, 13 Nov 2023 13:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14389C433C7;
 Mon, 13 Nov 2023 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699883294;
 bh=S+BII0lE1mTZkmkOFjntV8LOWnLbudBzFyYaS2jB4XU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XR3IgvnnOYiqaaGsI0hcnNhaEOQ/IWRlGbgqV4v7ZUOZIgyGAYV+llMhsQenXOo5p
 LcsXh1qXDQXgJsjqS0jMw0t13TaFzEG5xhlRz9aV+1FqiCy6IsW3LV6on4Xlf2gvL+
 lelK22BMDOMa/z/ix/HF9jvOCaKv6UpFcp6u4yAqHQbWQJ2Q3O4q5Gk+mcx7UmY4S2
 ZAppf8cS7R+aO6kgk4z2VBTQBsA3f8xFA+GBAusgbm6oXUpdOhuck8QPle9jJimTUR
 fTb59lSeGTyVzBPwk9wPgHGYfXUaDvSEuFJrCvPHtvWD+DuKjhwl0CakdS6Ifsl6aw
 LjVUZCvKV07yw==
Date: Mon, 13 Nov 2023 13:48:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: gpu: samsung-rotator: drop redundant
 quotes
Message-ID: <20231113-overlying-blinker-55125b473d03@squawk>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r+qbcDb3ot55ZKTs"
Content-Disposition: inline
In-Reply-To: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
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


--r+qbcDb3ot55ZKTs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 07:43:59PM +0100, Krzysztof Kozlowski wrote:
> Compatibles should not use quotes in the bindings.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers=E2=80=A6
Conor.

> ---
>  .../devicetree/bindings/gpu/samsung-rotator.yaml         | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml b=
/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> index d60626ffb28e..18bf44e06e8f 100644
> --- a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> +++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> @@ -12,10 +12,11 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> -      - "samsung,s5pv210-rotator"
> -      - "samsung,exynos4210-rotator"
> -      - "samsung,exynos4212-rotator"
> -      - "samsung,exynos5250-rotator"
> +      - samsung,s5pv210-rotator
> +      - samsung,exynos4210-rotator
> +      - samsung,exynos4212-rotator
> +      - samsung,exynos5250-rotator
> +
>    reg:
>      maxItems: 1
> =20
> --=20
> 2.34.1
>=20

--r+qbcDb3ot55ZKTs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVIpGAAKCRB4tDGHoIJi
0pYSAPwObE5o/3/P32x9ua+T+1BFXrWkjWksiMViZJ+U1sEOHwEAnQHFAy7VIMEV
1wmGpuEzv/hkm8lvFkeliASQI7ttYgg=
=dAYP
-----END PGP SIGNATURE-----

--r+qbcDb3ot55ZKTs--
