Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B09BD41E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429CE10E42A;
	Tue,  5 Nov 2024 18:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KH3nvH1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C61210E42A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:06:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E69925C48DB;
 Tue,  5 Nov 2024 18:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2976C4CECF;
 Tue,  5 Nov 2024 18:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730830010;
 bh=ocjrByOas5NhchIJiVvTx3nmU3SUFZrLi1qRmcnrqgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KH3nvH1wKtgOAdbmdI25MGBzoIlIZUU0DuJoNlsOeVJbdZaTVD/pW1K3FTVrB6Uf0
 FQnD2oWWlqeGpexF2tlqglZqcOcH0PB7QFh43/YKzrV5jbzi3liphlOSt343dBgHcZ
 Qw8qdPcknJdMN8rtEvlquuSLJnnf668tZfMgkK3MzlZvpByh+JmtXASIW6n3f08vmP
 fEu1+Y7fgreG8qwTvA9Coor9F2HXC7Irq258xMtSZKtHqGoR4/9Pbj0pLKmbaehTHW
 vG+rZB03i95oIS4gqIdT68miY3oA7HBvjIoyR3dIcH4CphIObSgiB/rg7QIBGh979K
 JqofCVlclV1Dw==
Date: Tue, 5 Nov 2024 18:06:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 04/21] dt-bindings: gpu: img: Allow dma-coherent
Message-ID: <20241105-linseed-steadfast-98cd8abe898c@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jZZZ0TtrazABMAIy"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com>
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


--jZZZ0TtrazABMAIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:10PM +0000, Matt Coster wrote:
> This attribute will be required for the BXS-4-64 MC1 and will be enabled =
in
> the DTS for the TI k3-j721s2 in a subsequent patch; add it now so
> dtbs_check doesn't complain later.

Sounds like the property should be made required for that integration.

>=20
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 55f422be1bc5b7564e3e81f24c4b93857f3e12fe..8a1861ca960c48853b2ceef41=
4f588cc343b49b2 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -60,6 +60,8 @@ properties:
>            - const: a
>            - const: b
> =20
> +  dma-coherent: true
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.47.0
>=20

--jZZZ0TtrazABMAIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypetAAKCRB4tDGHoIJi
0kjsAQCsk2h19nWNOK2QLV16dXvVjJGuABtG2kMsJv5im2dsSgD/VsBRyWBSA9aK
3hEs1FqMGnHBcwnC2OCwsSUNxcO2hQI=
=QtP+
-----END PGP SIGNATURE-----

--jZZZ0TtrazABMAIy--
