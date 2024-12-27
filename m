Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971EE9FD6B5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 18:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D00810E2F6;
	Fri, 27 Dec 2024 17:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uerjnRn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF6A10E2F6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 17:42:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D9995C4CA7;
 Fri, 27 Dec 2024 17:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52404C4CED0;
 Fri, 27 Dec 2024 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735321342;
 bh=0bFdHqCzn5f2CvXlfqGybIGbQK8L/GTLyJ6yIAZPZGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uerjnRn9qAtLEzUGvZUSOs4DGdLkb3mptAl+BnZV7M2SiEq/UIHP/l0jB2/M0W039
 cJliRm9pTDW4UIfHiEjFo6x8zVtR9urPmcZNvivkXRGKgTaBmSVnVtlQZyurpnuZH7
 ENOWgO44kAx4z4xp0qAJtcVsJNdBm7N90JE935SHx/bA/ZVe2hKaF3LcOMU7Hh1MYg
 Ro8u/DqH21EFFVPzpb1bZmIkCLZ0fYL8S/r9GY7DpWgmluLOItuC9q2xLHgwIS4kkJ
 jJhuQMuzsppKHclV2BRo23cKrw+fR8CbGdTG3n90j3sMPl80w7iYFi70InS2zL3imK
 WJKmnYJPtwe3g==
Date: Fri, 27 Dec 2024 17:42:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 01/22] dt-bindings: iommu: sun50i: remove resets
 from required property
Message-ID: <20241227-backward-sandfish-3734dadba8a4@spud>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-1-abad35b3579c@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jmNM+Wy3mOmacT9A"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-1-abad35b3579c@linumiz.com>
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


--jmNM+Wy3mOmacT9A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 06:30:50PM +0530, Parthiban Nallathambi wrote:
> iommu in a133/a100 does not have reset control. remove it
> from required property to make it optional.

Merge this with patch 2, making the reset required for the existing
devices and not permitted (false) for your new devices please.

>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml |=
 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-=
iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-io=
mmu.yaml
> index a8409db4a3e3..03176f68485b 100644
> --- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> +++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> @@ -42,7 +42,6 @@ required:
>    - reg
>    - interrupts
>    - clocks
> -  - resets
> =20
>  additionalProperties: false
> =20
>=20
> --=20
> 2.39.5
>=20

--jmNM+Wy3mOmacT9A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27m9gAKCRB4tDGHoIJi
0gDTAQCkD8Xhuyviy0vhXeZ4H+KJGL4kLQQgH/BbJQrWmtEiKgEA0tU2Y5TQpef1
SQ6NyzqbRTQrGqT89fyibG21/6vErQs=
=VGkJ
-----END PGP SIGNATURE-----

--jmNM+Wy3mOmacT9A--
