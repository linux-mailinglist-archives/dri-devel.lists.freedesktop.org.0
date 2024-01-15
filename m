Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127FB82DD26
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 17:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7855110E309;
	Mon, 15 Jan 2024 16:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51A410E309
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 16:14:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DB03CE17BF;
 Mon, 15 Jan 2024 16:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCC0C433F1;
 Mon, 15 Jan 2024 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705335282;
 bh=oFHDHrfraifWkAfPssyWtOw5eGjlMh4j/nlEhzflvwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dft+f3XU+5q3JQBtexvHhU6cEfGUjuSI603NmeD+e1JJjcj7UIoTng0azn869Hu2S
 TxWSE8ATbD1Wr6Vvr1w6QiQfDBLMaBmFaPuKyGzOlTkvlxEJ0lSXXvJfgQE4rnnIOI
 GjU/ezHf9cownn6Od5kCjxy5GTaJtOxtiFWixXEGxQVkcGGU1Jkrn0Vo2tyD3d6MpS
 XonskVhb0semD+wCq67qG5jJrMWxKW2T6tYfWE5pIlyM8TcRYlj/g+IfrmjysUFq6u
 0xs9H5ZRjvawhdeNG8PfdOddcpL+UNCnwDPgddIG5W5Tb3EPDO3ZVWHvNN8nv5TVWK
 fQwH0+wcBKIyw==
Date: Mon, 15 Jan 2024 16:14:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [DO NOT MERGE PATCH 2/2] arm64: dts: ti: Add common1 register
 space for AM62x and AM65x SoCs
Message-ID: <20240115-penpal-pluck-d156ccf21b2f@spud>
References: <20240115125716.560363-1-devarsht@ti.com>
 <20240115125716.560363-3-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EWEsO7gptdwlcP6E"
Content-Disposition: inline
In-Reply-To: <20240115125716.560363-3-devarsht@ti.com>
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
Cc: nm@ti.com, devicetree@vger.kernel.org, conor+dt@kernel.org, j-luthra@ti.com,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org, praneeth@ti.com,
 tomi.valkeinen@ideasonboard.com, jyri.sarha@iki.fi, mripard@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, a-bhatia1@ti.com, airlied@gmail.com,
 kristo@kernel.org, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EWEsO7gptdwlcP6E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 06:27:16PM +0530, Devarsh Thakkar wrote:
> This adds common1 register space for AM62x and AM65x SoC's which are using
> TI's Keystone display hardware and supporting it as described in
> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml.
>=20
> This region is documented in respective Technical Reference Manuals [1].
>=20
> [1]:
> AM62x TRM:
> https://www.ti.com/lit/pdf/spruiv7 (Section 14.8.9.1 DSS Registers)
>=20
> AM65x TRM:
> https://www.ti.com/lit/pdf/spruid7 (Section 12.6.5 DSS Registers)
>=20
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---

"[DO NOT MERGE PATCH 2/2]" but no rationale here as to why this cannot
be merged? What's the problem with it?

Cheers,
Conor.

>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 5 +++--
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/d=
ts/ti/k3-am62-main.dtsi
> index 464b7565d085..298bf8d5de8c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -779,9 +779,10 @@ dss: dss@30200000 {
>  		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
>  		      <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
>  		      <0x00 0x3020a000 0x00 0x1000>, /* vp1: Used for OLDI */
> -		      <0x00 0x3020b000 0x00 0x1000>; /* vp2: Used as DPI Out */
> +		      <0x00 0x3020b000 0x00 0x1000>, /* vp2: Used as DPI Out */
> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
>  		reg-names =3D "common", "vidl1", "vid",
> -			    "ovr1", "ovr2", "vp1", "vp2";
> +			    "ovr1", "ovr2", "vp1", "vp2", "common1";
>  		power-domains =3D <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
>  		clocks =3D <&k3_clks 186 6>,
>  			 <&dss_vp1_clk>,
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/d=
ts/ti/k3-am65-main.dtsi
> index fcea54465636..5b2d4365b911 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -1019,9 +1019,10 @@ dss: dss@4a00000 {
>  		      <0x0 0x04a07000 0x0 0x1000>, /* ovr1 */
>  		      <0x0 0x04a08000 0x0 0x1000>, /* ovr2 */
>  		      <0x0 0x04a0a000 0x0 0x1000>, /* vp1 */
> -		      <0x0 0x04a0b000 0x0 0x1000>; /* vp2 */
> +		      <0x0 0x04a0b000 0x0 0x1000>, /* vp2 */
> +		      <0x0 0x04a01000 0x0 0x1000>; /* common1 */
>  		reg-names =3D "common", "vidl1", "vid",
> -			"ovr1", "ovr2", "vp1", "vp2";
> +			"ovr1", "ovr2", "vp1", "vp2", "common1";
> =20
>  		ti,am65x-oldi-io-ctrl =3D <&dss_oldi_io_ctrl>;
> =20
> --=20
> 2.34.1
>=20

--EWEsO7gptdwlcP6E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaVZ7AAKCRB4tDGHoIJi
0gmVAQCycsV6IY+P0AFXj/AlMt4Agx6vSdMMVnVZ1KF6EhRZMwEA6d3M1RbFwm8/
6axXz/B9afZdx33i6/6CYSYqgin5QA4=
=N28P
-----END PGP SIGNATURE-----

--EWEsO7gptdwlcP6E--
