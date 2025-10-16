Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80DBE4998
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774AD10EA3F;
	Thu, 16 Oct 2025 16:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pFtCA44i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E27D10EA3F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:31:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F49743D73;
 Thu, 16 Oct 2025 16:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB2FC4CEF1;
 Thu, 16 Oct 2025 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760632303;
 bh=29W5nbATLg28IhUhpNbWJzH8SNHYX5AYEkj889sc9+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFtCA44i6uxF+9s4JNBqT9WeY/G9YYlQMIH20RphumNcs3qYiz9OzadSzPhPCqgdW
 rvjp16iCsQgrS3D33mowTrTFqqgs5UbnhZDZiqbn3KxMheWP4Cpv2J26+iiPlzko6F
 lcaAeaZ/+m2cniCZ3zj+2wu0RhyYouFsbwOVTykcxFWsr3HY0AH/Ayxv1wd+TrR4WM
 lB1a0Evjy4vWqH7iAs9bYte2IH7iXz5EzcQT74rQK9qDVdz6tcRX4LPEAYokTowTc+
 +J2afBV6FMYZL2CgcBwLmnw6pCD3p4rjk8MdyS5KIJK88afhucf56TPuJ6/lbJL7nF
 ff2X8UaZJCJUw==
Date: Thu, 16 Oct 2025 17:31:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: fsl,irqsteer: Add
 i.MX95 support
Message-ID: <20251016-anger-pretzel-87c1f84b8673@spud>
References: <20251014215801.51331-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T89yuDH1YCgqWT9Y"
Content-Disposition: inline
In-Reply-To: <20251014215801.51331-1-marek.vasut@mailbox.org>
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


--T89yuDH1YCgqWT9Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 11:57:15PM +0200, Marek Vasut wrote:
> Add compatible string "fsl,imx95-irqsteer" for the i.MX95 chip, which is
> backward compatible with "fsl,imx-irqsteer".
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T89yuDH1YCgqWT9Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEd6gAKCRB4tDGHoIJi
0vgtAQCsWApIMcAo4VKXn6RTQPNgNRFXtSQGMXFxXZFAmCE4WQEAnpcjtLoHMOEm
RAckTJ0NvNnAdqmW9zbbJNm50vefMAU=
=16D2
-----END PGP SIGNATURE-----

--T89yuDH1YCgqWT9Y--
