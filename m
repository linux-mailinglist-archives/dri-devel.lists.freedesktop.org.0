Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFFA8A446
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 18:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95110E7F7;
	Tue, 15 Apr 2025 16:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iTvZU0Bq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC57A10E7F7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:38:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9A1E8A4A111;
 Tue, 15 Apr 2025 16:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EF6C4CEEB;
 Tue, 15 Apr 2025 16:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744735119;
 bh=0o7WgPMPfYd1M0lo6UxGC5WgKFAvsFlwbf9fWHZjo9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iTvZU0BqP6qpK6DcIv2U+8b6I2t7T39DXhYrMioqJ8nk2ouDeGKjxoKAoa3s0FXgS
 UF3sQ4W+Bp1BVpeyeu9RO2uIh6VZoYHrEbag5zahGtqawWffwbyDR5Ud2Trv7akIja
 KRbOlLP1u4hBwnVTMD95sxZVXOtAuhR+7p5TepQySBKdYrQ3KtH2xQAt2+7ZlywKhD
 YkQm7b2lQemIo/RHlqtI5ZRPQ5WEtxAMt8YEmQJDFJ7I7/bU2R26KJC5FV9m2lTd15
 MfKSv66ipbJ1NebxdXDELJg/yD/1PYJkJiwUGk/kU9jDegydIU71qcrQgoQKLQTRzg
 QnwzLg9l0YvOQ==
Date: Tue, 15 Apr 2025 17:38:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
Message-ID: <20250415-tycoon-naming-20ba5a55c469@spud>
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <CGME20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FhDPjeA6XL6WHJ2b"
Content-Disposition: inline
In-Reply-To: <20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com>
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


--FhDPjeA6XL6WHJ2b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 08:52:56PM +0200, Michal Wilczynski wrote:
> Extend the TH1520 AON firmware bindings to describe the GPU clkgen reset
> line, required for proper GPU clock and reset sequencing.
>=20
> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> (core and sys) and two resets (GPU core reset and GPU clkgen
> reset).  Only the clkgen reset is exposed at the AON level, to support
> SoC-specific initialization handled through a generic PM domain. The GPU
> core reset remains described in the GPU device node, as from the GPU
> driver's perspective, there is only a single reset line [1].
>=20
> This follows upstream maintainers' recommendations [2] to abstract
> SoC specific details into the PM domain layer rather than exposing them
> to drivers directly.
>=20
> [1] - https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@im=
gtec.com/
> [2] - https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel=
=2Eorg/
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/firmware/thead,th1520-aon.yaml        | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.=
yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> index bbc183200400de7aadbb21fea21911f6f4227b09..6ea3029c222df9ba6ea7d423b=
92ba248cfb02cc0 100644
> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> @@ -32,6 +32,13 @@ properties:
>      items:
>        - const: aon
> =20
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: gpu-clkgen
> +
>    "#power-domain-cells":
>      const: 1
> =20
> @@ -39,6 +46,8 @@ required:
>    - compatible
>    - mboxes
>    - mbox-names
> +  - resets
> +  - reset-names

Given these are new required properties, have you made sure in the
driver that their absence will not cause problems with older
devicetrees? I took a brief look at the driver, and it _looked_ like you
were failing if they were not there? It was a brief look though, tbf.

>    - "#power-domain-cells"
> =20
>  additionalProperties: false
> @@ -49,5 +58,7 @@ examples:
>          compatible =3D "thead,th1520-aon";
>          mboxes =3D <&mbox_910t 1>;
>          mbox-names =3D "aon";
> +        resets =3D <&rst 0>;
> +        reset-names =3D "gpu-clkgen";
>          #power-domain-cells =3D <1>;
>      };
>=20
> --=20
> 2.34.1
>=20

--FhDPjeA6XL6WHJ2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/6LiAAKCRB4tDGHoIJi
0lZuAQCABS+eFSdx3kXhK23lYrr3kZQ87Y4bNEqSHSKXfVbSNwD+LpI2rl8eyDPG
+EnkNfmTOSNRo+kDYlSKMLijsV19qQI=
=yRlm
-----END PGP SIGNATURE-----

--FhDPjeA6XL6WHJ2b--
