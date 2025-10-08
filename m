Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9D9BC6A76
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 23:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A5F10E157;
	Wed,  8 Oct 2025 21:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ceK10NHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3D810E157
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 21:14:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EFC0B61FAF;
 Wed,  8 Oct 2025 21:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB888C4CEE7;
 Wed,  8 Oct 2025 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759958057;
 bh=39B89TgYoeDAnrK783gKdzfBrJbIvzbmWAJjVVApfII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ceK10NHVXa+RL9euVgbkDmln/76dAQkUWMLVrZzSVR4yRoFxml0LPd0b4mCCn9Hrd
 zKC3bbZ+F7rkcwHxFziParI4mT+KR8gYkz+91Vfy3RzZk2h9WwPRn7TKzdSVWFiQrx
 vUng9HGSM1pRjHokzqiQ2ki+cwAJqhZaiB0tah6Chn2TS/gW5kQmXrpzlh40qcUM6W
 spzrctqKlw6BwBC/wdicJnBYJ6L15f+byMfYDNH2UJ3stAPBTO8lbIXZI1Qg67CZ3R
 76O4vGN0us3u1ExdoELSZRmBEADrzXST0kVQxc0ElzgIOUCCQdlNe+2ZSbZOWNCdtJ
 420Lt+6+Ba2uw==
Date: Wed, 8 Oct 2025 22:14:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132
 MIPI calibration device
Message-ID: <20251008-craving-composite-81aa70b6e882@spud>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-12-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jP+KgV2/KzUlrI8N"
Content-Disposition: inline
In-Reply-To: <20251008073046.23231-12-clamor95@gmail.com>
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


--jP+KgV2/KzUlrI8N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 10:30:33AM +0300, Svyatoslav Ryhel wrote:
> Document MIPI calibration device found in Tegra132.

Could you explain why a fallback is not suitable? The patchset is really
too big for me to trivially check that the change is correct.
With an explanation,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a114-mipi.yaml
> index 193ddb105283..9a500f52f01d 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mip=
i.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mip=
i.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - nvidia,tegra114-mipi
>        - nvidia,tegra124-mipi
> +      - nvidia,tegra132-mipi
>        - nvidia,tegra210-mipi
>        - nvidia,tegra186-mipi
> =20
> --=20
> 2.48.1
>=20

--jP+KgV2/KzUlrI8N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObUIQAKCRB4tDGHoIJi
0spgAQCOTfXrsyfS3CIGSc9JYyiUFNhWFHlpRP7VzN3DQa0r0gD+PG6VUqC7h62Y
pRPxQQG4kkheap2w4cYcE/VcpEiIOwk=
=EFMD
-----END PGP SIGNATURE-----

--jP+KgV2/KzUlrI8N--
