Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18AA861B7D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 19:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C0210EC8D;
	Fri, 23 Feb 2024 18:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LAhr3N7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F7810EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 18:23:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A7EE1CE2C95;
 Fri, 23 Feb 2024 18:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6A9C433C7;
 Fri, 23 Feb 2024 18:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708712587;
 bh=zflOrMjr84iiFTYzOSKRygJktbHj5DYeYm14nmPtSkQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LAhr3N7RkdolUTTj6FCbnYjYKhg0eqbZvVZgx75EhAkHdW0lsqU6N41ctS0wM9w9R
 0fjQyPNGkWvHnvD7XhjfHNM+gmJBVsaiFmOXiuOzCakakvPpm9qHG8ApCBRnn14A7l
 KmaLtCr4kmkQJGf6dB/Cq9Y9PgZeVhqmbjOtzJAYDYDWpfgZaUQgPSYchOs2sW+Vr3
 6Y/defG6GXY54Mv4E3xg86OqvOCm2f/AVUR0DllJul2VnE4rcUloIs9Wb4gQdB460b
 R103jtzMJuqOdtS/i1Gjaf90KEnVGSvaoOHVQHnHOtLVMAuWxzAZbrKFdiqYmLV48l
 CO0Dh+qgygSTA==
Date: Fri, 23 Feb 2024 18:23:02 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: simple: add support for
 Crystal Clear CMT430B19N00
Message-ID: <20240223-subtotal-aground-268d135adeff@spud>
References: <20240223134517.728568-1-jeremie.dautheribes@bootlin.com>
 <20240223134517.728568-3-jeremie.dautheribes@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RwPwUHJtnNjDHJPE"
Content-Disposition: inline
In-Reply-To: <20240223134517.728568-3-jeremie.dautheribes@bootlin.com>
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


--RwPwUHJtnNjDHJPE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 02:45:16PM +0100, J=E9r=E9mie Dautheribes wrote:
> Add Crystal Clear Technology CMT430B19N00 4.3" 480x272 TFT-LCD panel
> compatible string.
>=20
> Signed-off-by: J=E9r=E9mie Dautheribes <jeremie.dautheribes@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index a95445f40870..c575f7c4b745 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -91,6 +91,8 @@ properties:
>        - boe,nv133fhm-n62
>          # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
>        - boe,nv140fhmn49
> +        # Crystal Clear Technology CMT430B19N00 4.3" 480x272 TFT-LCD pan=
el
> +      - cct,cmt430b19n00
>          # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD pa=
nel
>        - cdtech,s043wq26h-ct7
>          # CDTech(H.K.) Electronics Limited 7" WSVGA (1024x600) TFT LCD P=
anel
> --=20
> 2.34.1
>=20

--RwPwUHJtnNjDHJPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdjihgAKCRB4tDGHoIJi
0n4qAP4ulj6OYWiEyR3O16LTyKNW9tYtcKxS+ZG7C3yKzn3F5AEAxHrX9uf4A0/b
q70+laO4UvBG0basKVpZnR5fWl2z0w0=
=0rzq
-----END PGP SIGNATURE-----

--RwPwUHJtnNjDHJPE--
