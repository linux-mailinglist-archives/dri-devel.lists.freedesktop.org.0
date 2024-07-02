Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649B92414D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 16:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BD810E614;
	Tue,  2 Jul 2024 14:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RX2OAH2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470DE10E614
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 14:50:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F72B61B9D;
 Tue,  2 Jul 2024 14:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCC6C116B1;
 Tue,  2 Jul 2024 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719931856;
 bh=8GrPOQF7l2Z/Xp7PSkYsxAUyYslALDELzdKgK4LRHng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RX2OAH2jOC1pBLdx4TgjQ4WdYGkOaqVhb5dftZ+HQsnCCpOagSiT4Xp4PbQXbVYCS
 XNNexN9pjXHEZgLTeNnuVs9QYPsS+nLUoims1bD7/NcDj4E0ULvLXSWPB2+0Wv1HGr
 7I/L/3bk92LgrDWac+5LtCxzFuH0jOV06slRy/qVxxy8o8yda4O5YpKdZ27ql+QUDC
 y+e3gR5RBqslS9oY6xPpGXb5Gz1Egeyj6+YUUCbUFB7aJqRr86Le5fY+xQq+trhEVo
 wGpQo5xbtwS6X0b9s1p3CIvTtu1dnBJuKW4DJT39XHbpj1uTtZtFd5Pz9Jd3Etzu+t
 62hZWtUo+uh0Q==
Date: Tue, 2 Jul 2024 15:50:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240702-choking-glitch-d97191325ac7@spud>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
 <20240702094630.41485-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6lv1T1DM0q9CXqoQ"
Content-Disposition: inline
In-Reply-To: <20240702094630.41485-4-biju.das.jz@bp.renesas.com>
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


--6lv1T1DM0q9CXqoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 10:46:13AM +0100, Biju Das wrote:
> Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> SoC, but has only DPI interface.
>=20
> While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> SoCs.

A new required property is an ABI break, it deserves more of an
explanation than "in passing..."

>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.y=
aml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 08e5b9478051..c0fec282fa45 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
>        - items:
>            - enum:
> @@ -60,9 +61,6 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          unevaluatedProperties: false
> =20
> -    required:
> -      - port@0
> -
>      unevaluatedProperties: false
> =20
>    renesas,vsps:
> @@ -88,6 +86,34 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043u-du
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0: false
> +            port@1:
> +              description: DPI
> +
> +          required:
> +            - port@1
> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: DPI
> +
> +          required:
> +            - port@0
> +            - port@1
>  examples:
>    # RZ/G2L DU
>    - |
> --=20
> 2.43.0
>=20

--6lv1T1DM0q9CXqoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQTywAKCRB4tDGHoIJi
0lOBAQCn6PdPFpKiaDN6FCYz31fxa5IjoRWeN/XXq3MNDAxJhgD/dIVSUf9g00XV
mUd+njn3lrmTYC6+QUKQ2SRpgGexgwU=
=hI46
-----END PGP SIGNATURE-----

--6lv1T1DM0q9CXqoQ--
