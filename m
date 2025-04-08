Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B1A8115E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 18:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594C310E6F5;
	Tue,  8 Apr 2025 16:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XWpGRy8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D524110E6F5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 16:07:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 17B57614FE;
 Tue,  8 Apr 2025 16:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5541C4CEE5;
 Tue,  8 Apr 2025 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744128426;
 bh=P3KYOFVSqw8KYRUi3AxCXPW5fp4/qJQZplXPESO6+nU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWpGRy8nb/qkWh0YsePXrVg2Nb8VZcJeFMku1uOf217lplx1A1qJzxHbjcKDK1AfP
 kHWfLO/WzfxF3jldFM0PE8+GZcO+GAdpmm7ZJExTjW3jYu63ZulGgcl7bI7mwczGLI
 4fNzWHDN1hgjH99AQBjJrUtTaNxFFb0GRP03Ca1GVxALHHE1h5Zj86MehMj4V0AAkF
 ki628LBqmWrL9vdYq/jQRW2QfV/TFJhkpnMkWf4IRX0eFMTk5EYBQazTBDDdTr8slw
 ccTPE4TYerZc1czlFOcLEmfglVqvLKhMmTqY8GzyBDz/z7rTG4MrbjTJZ1Z7ImaRH6
 1ppwBvEfOjByw==
Date: Tue, 8 Apr 2025 17:07:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: ili9881c: Add Saef SFTO340XC support
Message-ID: <20250408-diagnosis-turbofan-9fce2bb7ac4e@spud>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
 <20250408-feature_sfto340xc-v1-3-f303d1b9a996@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1DyjrGRVuDuOlKbn"
Content-Disposition: inline
In-Reply-To: <20250408-feature_sfto340xc-v1-3-f303d1b9a996@bootlin.com>
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


--1DyjrGRVuDuOlKbn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 05:27:02PM +0200, Kory Maincent wrote:
> Document the compatible value for Saef SFTO340XC panels.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili98=
81c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.=
yaml
> index e36550616f6aac86c79832a48132ce8c11ebcf7a..7e47564cf1f18a9ea9e64dede=
d7a7edbff133406 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -19,6 +19,7 @@ properties:
>            - ampire,am8001280g
>            - bananapi,lhr050h41
>            - feixin,k101-im2byl02
> +          - saef,sfto340xc
>            - startek,kd050hdfia020
>            - tdo,tl050hdv35
>            - wanchanglong,w552946aba
>=20
> --=20
> 2.34.1
>=20

--1DyjrGRVuDuOlKbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/VJpQAKCRB4tDGHoIJi
0hLTAPsEF3T8KKTW5hHdUeCV/ORaGFD4Q7LL31/d6Wwp0zeiwAEA0ZTsUUobPRaY
B5fIMPDzUYso83YRV5YNvXiXBsXm5AQ=
=IA/K
-----END PGP SIGNATURE-----

--1DyjrGRVuDuOlKbn--
