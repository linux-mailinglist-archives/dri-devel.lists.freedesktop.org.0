Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C39A861B79
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 19:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FF010E07C;
	Fri, 23 Feb 2024 18:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EElgjbta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BF810E07C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 18:22:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A0A161426;
 Fri, 23 Feb 2024 18:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F09CC433C7;
 Fri, 23 Feb 2024 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708712542;
 bh=Cqe8LWCCXqLI5nJcTymn6aKYDyIH6gIwWLFJZo8+z3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EElgjbtaShdUYdyHHnFLSRzMCcY/qTZuD/DGBY+Y5FOrU30PoSioGwAHJTe+P/7X2
 CVRwj9barJ2QL4JrjzdV+vfmfBGJBde3AtH7gH9Be86Cd/VA9OjOULGymAZpzvMyCT
 eJlKt2xf0+fD7oJMuwbUvGbqG31CQkUAt5CGa60z/0UFFjJea+8WkQAgIuxTCrtVx/
 i/uf1izem6KHVFLxNbn08EUJ4MGtvhunnOU9kzlg5xBOmLv22Sq/4sXGVo69NrFhcM
 TeDNJ8mtxQNXnNafq4moPHsbxLuWAZMazFEmAcfhT5pubkzWpWcqLX8NwoY/mORpdo
 bRnN86oYQOZBQ==
Date: Fri, 23 Feb 2024 18:22:16 +0000
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
Subject: Re: [PATCH 1/3] dt-bindings: Add Crystal Clear Technology vendor
 prefix
Message-ID: <20240223-prepay-stadium-f09044e3e123@spud>
References: <20240223134517.728568-1-jeremie.dautheribes@bootlin.com>
 <20240223134517.728568-2-jeremie.dautheribes@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tqbEmhW4lbBDVPaW"
Content-Disposition: inline
In-Reply-To: <20240223134517.728568-2-jeremie.dautheribes@bootlin.com>
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


--tqbEmhW4lbBDVPaW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 02:45:15PM +0100, J=E9r=E9mie Dautheribes wrote:
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> include "cct" as a vendor prefix for "Crystal Clear Technology". CCT is
> the vendor of the CMT430B19N00 TFT-LCD panel.
>=20

Acked-by: Conor Dooley <conor.dooley@microchip.com>

And add a
Link: http://www.cct.com.my/
as that actually explains why "cct" is the right choice.

Cheers,
Conor.

> Signed-off-by: J=E9r=E9mie Dautheribes <jeremie.dautheribes@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index fef2e12b504e..96e47742e250 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -248,6 +248,8 @@ patternProperties:
>      description: Catalyst Semiconductor, Inc.
>    "^cavium,.*":
>      description: Cavium, Inc.
> +  "^cct,.*":
> +    description: Crystal Clear Technology Sdn. Bhd.
>    "^cdns,.*":
>      description: Cadence Design Systems Inc.
>    "^cdtech,.*":
> --=20
> 2.34.1
>=20

--tqbEmhW4lbBDVPaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdjiWAAKCRB4tDGHoIJi
0teoAP4iP4DoqDwhJ9zjgyRVfThghCGI8b7Mrw0n/J2/EBLjRgEAmE3S4BaustQN
Vnu5lUdAAJ9L0D2ZLHvC+BoPqwMcTww=
=BaSE
-----END PGP SIGNATURE-----

--tqbEmhW4lbBDVPaW--
