Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5376B3A0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F297C10E3D4;
	Tue,  1 Aug 2023 11:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A3D10E3D4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:45:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3CDD61561;
 Tue,  1 Aug 2023 11:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC05AC433C8;
 Tue,  1 Aug 2023 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690890332;
 bh=7tDiTd4TDuNKvPRSv3/p+m31RyZXbyg7abTCZkKLnF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SxV77xpJBISvKsn/J3Rd0xWFdhym10nJYIZsOUjlscvbz/fhlS9zj1uzWuvlefFau
 Rts0JJPLs1/vreoerPbofHR+M5eyKjowFHDTVaBHYVEljiLbd5pfAPYxhzNO/IhgyE
 XoRrPgH/ltc0U6+Qn+f7P0Jg8R/FHU+2AkgsWyQsFd86IZpVIDs3Ga8u/K0MrShK+W
 PmsVlqBQ0mGnq02wT/oSOngWRw31gCAHKnwalM0LRM9RyylzRzJAiOr18Jzqr+/4CM
 +rWkUGZF6DlFP0+gFM4SBIrvcp1GgrNdCFDDPsfTATYGjgR/wyqGEhuW50TcFsE5Po
 R06wPzbRkOP5w==
Date: Tue, 1 Aug 2023 13:45:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH v1 v1 3/7] riscv: dts: starfive: jh7110: add dc
 controller and hdmi  node
Message-ID: <fin3n5qq2jcejmksjrhi2s4xzfy3jvi264htwzvabzdrdc47wg@6binn7jn2pdv>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-4-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="skfe2pxrx4sbzczu"
Content-Disposition: inline
In-Reply-To: <20230801101030.2040-4-keith.zhao@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--skfe2pxrx4sbzczu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 06:10:26PM +0800, Keith Zhao wrote:
> Add the dc controller and hdmi node for the Starfive JH7110 SoC.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 43 +++++++++
>  2 files changed, 130 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index de0f40a8b..32e5cc96c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -31,6 +31,21 @@ memory@40000000 {
>  		reg =3D <0x0 0x40000000 0x1 0x0>;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +			size =3D <0x0 0x20000000>;
> +			alignment =3D <0x0 0x1000>;
> +			alloc-ranges =3D <0x0 0x80000000 0x0 0x20000000>;
> +			linux,cma-default;
> +		};
> +	};
> +

You should explain why you need this, either in a comment or in the
commit log.
>

--skfe2pxrx4sbzczu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMjwWQAKCRDj7w1vZxhR
xfLPAQCg7oQJf+fuhklc8W+YG708G6AdwC21jBHjwoV/gdctOQEA1NuI8i4v+QQh
6uqlf1/mgX7XSembyehbCmGpksTxhQw=
=dBWR
-----END PGP SIGNATURE-----

--skfe2pxrx4sbzczu--
