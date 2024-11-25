Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA39D8BF1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 19:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0DD10E6D4;
	Mon, 25 Nov 2024 18:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UwfhPBJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7869A10E6D4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 18:07:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 257525C5A97;
 Mon, 25 Nov 2024 18:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA40C4CECE;
 Mon, 25 Nov 2024 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732558078;
 bh=5Os1CtXeWVGndeC088niVFcHT0wfA4RjZ+xJ14vRQGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UwfhPBJJgvB7xS6b5s55iDllSNGt9l7+3hN0+bdX3KxJiYMGgh/D2GiH36H4AKU5J
 7wfMx95K6CpnOCVnayR5tzVi3+zwELaz70jWqVY2kogw6bx+nZoaBScvf41L/SDYV8
 zZr9YDmxtvMHwTw5sgb+fhRK4+w8gfHagRGm2JiRQ6cxl56o/ARjSMbRZmUdMjBqGd
 77dENqigKWTLDalxfaQbWbyR/uF5MZHQH9kGMNjXjonM+plmAuJOIDnk8zs+AvEfJT
 0GCCOkVB0J4CbBP8eU7e0PU+c0Q1H4yOsgL0U7Su95N+Jlxa1YhuOl2tS/+rlUZI0Q
 yxndvrNvpLhUA==
Date: Mon, 25 Nov 2024 18:07:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add reset control property
Message-ID: <20241125-dress-disliking-2bf22dd4450e@spud>
References: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
 <20241125-pvr-reset-v1-1-b437b8052948@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="htTo0QmNln1WJxdc"
Content-Disposition: inline
In-Reply-To: <20241125-pvr-reset-v1-1-b437b8052948@linumiz.com>
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


--htTo0QmNln1WJxdc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 10:07:03PM +0530, Parthiban Nallathambi wrote:
> GE8300 in Allwinner A133 have reset control from the ccu.
> Add the resets property as optional one to control it.

There's no specific compatible here for an a133, but the binding
requires one. Where is your dts patch?

>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 256e252f8087..bb607d4b1e07 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -37,6 +37,9 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.39.2
>=20

--htTo0QmNln1WJxdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0S8+QAKCRB4tDGHoIJi
0p+mAQDx5d12rMbMXydhrghbCQ4c30npjJldAlAKMg27Ax3QpQD/asjiM8qdq71W
MYJgRLx0hjp+ev0I3SYPVMVq6rO72ws=
=IZw0
-----END PGP SIGNATURE-----

--htTo0QmNln1WJxdc--
