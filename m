Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070899F55DA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 19:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EE610EA4A;
	Tue, 17 Dec 2024 18:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l6PKfh+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EB010EA4A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 18:17:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 03C4AA41F40;
 Tue, 17 Dec 2024 18:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985B6C4CED3;
 Tue, 17 Dec 2024 18:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734459451;
 bh=Y29ea42Kp25MVyYUZK6G0WLpbBrAnSqVCNYtDQ7vaaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l6PKfh+bM/d4y0SeF8oxPs6zR4k/+NKc52iaHoGFRb1PvHT/qfJuBFMwBVEQlb9OH
 NEU3NGLGwO3AXWaXmZUI3pX6Lkd/9K1fcKJEG+RbSEFrrg6ifsKDqlWt7k/5zG+aAE
 rvKCswAQwizznA3Iiwx8b4ZWEyjp0JEGN7KmT5igtCUs67MRiljYojUm8AXM9BbNmO
 h/pr3R+vkN8CcamC+4D7n39Q+9bccCTGnTvQzWLJmIZKuIbG492cwgDtO3n/n/zZpR
 0UVVdfxA7v3da3PP8UbwiuqBTm12tJfq/EQqF3bmIp487SWIvnOet50VQ3X53igpcf
 SEKuDdtjRivlA==
Date: Tue, 17 Dec 2024 18:17:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: samsung,mipi-dsim: Document
 fsl,imx7d-mipi-dsim
Message-ID: <20241217-uninstall-tingly-c1341dc4615b@spud>
References: <20241217131431.1464983-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j+gk1rq+qln5YYSY"
Content-Disposition: inline
In-Reply-To: <20241217131431.1464983-1-festevam@gmail.com>
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


--j+gk1rq+qln5YYSY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 10:14:31AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> The i.MX7D MIPI DSIM block is compatible with i.MX8MM.
>=20
> imx7s.dtsi uses the following compatible string:
>=20
> compatible =3D "fsl,imx7d-mipi-dsim", "fsl,imx8mm-mipi-dsim";
>=20
> Document "fsl,imx7d-mipi-dsim" to fix the following dt-schema warning:
>=20
> ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--j+gk1rq+qln5YYSY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HAIQAKCRB4tDGHoIJi
0k3MAQCt6jlstk4tiL4GQfRt0NMWT/uIMNSd5ArzTb3HL68aYQD/UK8vSZDHebjl
l3xTUJ+5CWOxKfdRrHiMnMiZjTK3cwY=
=/A6H
-----END PGP SIGNATURE-----

--j+gk1rq+qln5YYSY--
