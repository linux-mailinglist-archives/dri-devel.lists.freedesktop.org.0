Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFBF9D407E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 17:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8403310E795;
	Wed, 20 Nov 2024 16:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H+EndPRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7A410E795
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 16:48:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E0B22A4325D;
 Wed, 20 Nov 2024 16:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D785CC4CECD;
 Wed, 20 Nov 2024 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732121335;
 bh=Xj2XGnCnlH9Wd8nMgGB5FfrrL5fgMMi97SviUhy/am4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H+EndPRhTsi7i44TUXsfXGdxSfoianw4lY75huz+86XqeQ4qkm57bVUQXwpb8D9DH
 QHvkMPukfO6dKiNgga/fEogkNXLqo1AoMMRJJA1JzVAjbtxeV6jqiZ3TepgvE8qBa8
 jVQh9qf6wyP8ORXtvtOfOPSujcSHZjtKjz6sPiRwYf1TXN1iHN7/l2QJDfFC9Hu/dX
 gM99gtoUMBSo/8WkTn6YIEIAUHU4exWGwCsf6iFIOsLUTRYPlp9dvVuI4N7Iv8Fsbn
 JEB7Q75yIbqwJkfVAWTyqWGhlfb/cUJm3yNx5FqHmFKOKMotYMcQGpz7UBR3bOTrtx
 E6fo1XiBZgK3Q==
Date: Wed, 20 Nov 2024 16:48:47 +0000
From: Conor Dooley <conor@kernel.org>
To: keith zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com,
 kernel@esmil.dk, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, p.zabel@pengutronix.de,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] riscv: dts: Add display property
Message-ID: <20241120-ricotta-rescuer-90bad7c38e93@spud>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-3-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Etb5DlIYTN201Rze"
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-3-keith.zhao@starfivetech.com>
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


--Etb5DlIYTN201Rze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 02:18:41PM +0800, keith zhao wrote:
> Add the display DT nodes in Starfive JH7110 soc-specific DT file.
>=20
> Signed-off-by: keith zhao <keith.zhao@starfivetech.com>

$subject: "riscv: dts: Add display property"

a) this is jh7110 exclusive, not for all riscv devicetrees
b) you are adding more than a property

> ---
>  .../boot/dts/starfive/jh7110-common.dtsi      | 125 ++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  41 ++++++
>  2 files changed, 166 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 9d77713f5361..301b56f2ef0c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -30,6 +30,25 @@ memory@40000000 {
>  		reg =3D <0x0 0x40000000 0x1 0x0>;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		/* vout applies for space from this CMA

"vout" could be a voltage, please be more specific. Comments should be
wrapped at at least 80 chars. Linux coding style puts /* on a line of
its own.

> +		 * Without this CMA reservation,
> +		 * vout may not work properly.
> +		 */
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +			size =3D <0x0 0x20000000>;
> +			alignment =3D <0x0 0x1000>;
> +			alloc-ranges =3D <0x0 0x70000000 0x0 0x20000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
>  	gpio-restart {
>  		compatible =3D "gpio-restart";
>  		gpios =3D <&sysgpio 35 GPIO_ACTIVE_HIGH>;
> @@ -62,12 +81,55 @@ codec {
>  			};
>  		};
>  	};
> +
> +	hdmi_con: hdmi-con {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
>  };
> =20
>  &cpus {
>  	timebase-frequency =3D <4000000>;
>  };
> =20
> +&dc8200 {
> +	status =3D "okay";
> +	crtc_out: ports {

blank line between properties and child nodes please.

> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		dc_out0: port@0 {

Cheers,
Conor.

--Etb5DlIYTN201Rze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZz4S7wAKCRB4tDGHoIJi
0lFnAQC5Cen9HmRFPLpRfCMQUx1G5Jj1IRCOVFmH1cknmLUOAQD+NaQFuXCPLkQt
WA5fC3L7EGS8TK65udHTJdbrhlMQLQU=
=Zb+5
-----END PGP SIGNATURE-----

--Etb5DlIYTN201Rze--
