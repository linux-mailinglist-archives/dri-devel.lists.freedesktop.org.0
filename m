Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A323B151D6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 19:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922F510E12A;
	Tue, 29 Jul 2025 17:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="flWQIz7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BA210E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 17:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753808989; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SfxG9oyq7Xh8cTqP4vj/WMBsAVKKyJGE+kgbDuj9GfiznmFzbYCU1RFKYuJ1+PkM/MHnJiWt4bUh+cZ2fl7/Vzrszw8deKQciSfQL+emFjSlk4R2wePdVXx+SvXdQqh6KibmQVXeJDS0iZE0ib3d/Ih697a0bi1Fvx8rFrqYn/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753808989;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TxY+JKrWeGH0H6xo56T1MRsEGuU0255fEPWJ+EHkpqA=; 
 b=jGKxLA38fK+Wa5kjzUZSZGRREuV//fN3TzV9QTPyK7DUAWUQgT6VVXQKS9RxRi1xfGvQ2nPhPkcOM1ujZdFRb3zSbmPCczj4CAWDz/5rbOyx00C8vaoSWqdio5MCz0mWu3WiC07ESQL7lgfcxqfgKmTNbSPCKhmfH7mUX6sDhOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753808989; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=TxY+JKrWeGH0H6xo56T1MRsEGuU0255fEPWJ+EHkpqA=;
 b=flWQIz7djxGg2eW+E94jqszUeQMWJ/YoZmfNOdOHpqLbst6uitu0W/kUVagoSK7D
 ySTx3VwmZNGjMoVB7EmCXZZoBMqq3MB7PrJQ1vJ6JqZpBhPGWG9FF3zgSI7BX4aBwul
 jr7++GN4QedV8dLVHczmIrWPdqIhoF3uLhSdL610=
Received: by mx.zohomail.com with SMTPS id 1753808986669159.71490156758534;
 Tue, 29 Jul 2025 10:09:46 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id 669AE180F0B; Tue, 29 Jul 2025 19:09:41 +0200 (CEST)
Date: Tue, 29 Jul 2025 19:09:41 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de, hjc@rock-chips.com, 
 mripard@kernel.org, naoki@radxa.com, stephen@radxa.com, 
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, 
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: rockchip: Enable DisplayPort for
 rk3588s Cool Pi 4B
Message-ID: <hbvwlucm5mnjpve6hb6h7dusgrokvdxzbpq5zrwib4yesrdakp@v77ofq7u2vv2>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-10-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iihpr7ffgjlj4iks"
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-10-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/253.35.66
X-ZohoMailClient: External
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


--iihpr7ffgjlj4iks
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 09/10] arm64: dts: rockchip: Enable DisplayPort for
 rk3588s Cool Pi 4B
MIME-Version: 1.0

Hi,

On Mon, Jul 28, 2025 at 04:28:34PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Enable the Mini DisplayPort on this board.
> Note that ROCKCHIP_VOP2_EP_DP0 is defined as 10 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address error,
> expected "a"" if we use it directly after endpoint, so we use "a"
> instead here.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

The graph currently looks like this:

VOP <-> DP controller <-> DP Connector

IIUIC this does not work for USB-C and needs to look like this,
because the USBDP PHY handles the lane muxing and thus must be
the thing connected to the USB-C controller/connector:

VOP <-> DP controller <-> USBDP PHY <-> USB-C Connector

I wonder if the simple case not involving USB-C should also have
the USBDP PHY described in the graph as a transparent bridge?
Note, that the USBDP PHY DT binding is currently not ready for
this (this also affects the next patch, but should be enough to
discuss this once :)).

Greetings,

-- Sebastian

>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Sort in alphabetical order
>=20
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/ar=
m64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> index 8b717c4017a46..5393c6cc493c3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> @@ -39,6 +39,18 @@ chosen {
>  		stdout-path =3D "serial2:1500000n8";
>  	};
> =20
> +	dp-con {
> +		compatible =3D "dp-connector";
> +		label =3D "DP OUT";
> +		type =3D "mini";
> +
> +		port {
> +			dp_con_in: endpoint {
> +				remote-endpoint =3D <&dp0_out_con>;
> +			};
> +		};
> +	};
> +
>  	hdmi-con {
>  		compatible =3D "hdmi-connector";
>  		type =3D "d";
> @@ -215,6 +227,24 @@ &cpu_b2 {
>  	cpu-supply =3D <&vdd_cpu_big1_s0>;
>  };
> =20
> +&dp0 {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&dp0m0_pins>;
> +	pinctrl-names =3D "default";
> +};
> +
> +&dp0_in {
> +	dp0_in_vp2: endpoint {
> +		remote-endpoint =3D <&vp2_out_dp0>;
> +	};
> +};
> +
> +&dp0_out {
> +	dp0_out_con: endpoint {
> +		remote-endpoint =3D <&dp_con_in>;
> +	};
> +};
> +
>  &gpu {
>  	mali-supply =3D <&vdd_gpu_s0>;
>  	status =3D "okay";
> @@ -889,3 +919,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>  		remote-endpoint =3D <&hdmi0_in_vp0>;
>  	};
>  };
> +
> +&vp2 {
> +	vp2_out_dp0: endpoint@a {
> +		reg =3D <ROCKCHIP_VOP2_EP_DP0>;
> +		remote-endpoint =3D <&dp0_in_vp2>;
> +	};
> +};
> --=20
> 2.43.0
>=20

--iihpr7ffgjlj4iks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmiJAEsACgkQ2O7X88g7
+prNtg//bsKKMAA8eaI9O6lXTAxHpG5/NO6poWY5y1hlAapvyZeYfdlPRJFAPnV4
vu3UUT2mwRQOeAE6SzjKI2DOvtKU3vDQJgf8a9OrHM3OuS3+ioutmpyhX2YyeANt
GjC0tX7gfv7dOTzp9L3j2pEGN7bQNQLZh9doIjM1f+wdCBvgKB7pMbwDeoPoHzf0
UwhUQ2eB4EgVZn7XNd5NnF5eL7/JosLDNrYkek0M/rfrgkV7Hfq6HmvPSTnd0w57
sAl/zZ66VAAnEukJ2PDyZOR5vCM1qlEn4Bux919MB0ltGyHuHXBB8MLosIFVNRBA
aesK52/wn7w4EhE4Jg+iEggmk6kqMu67wOEdWyfPZ8gL/xrFi7j7u1CYAWpaTI5R
dBxq55fS9o/pcTQ41HDEyX4TfV+11c5TnxPGo+0NQlucZqDEO7UcddXl76IuVIUO
pgqREMW9l9Y8+vozkUXmgTQrqk6wde/3R2i7kBSFnj1FAGsHWkO1rY9ESy+uyghZ
PMu8pPQuNKTdX8vMI1ejrbPbbNawsMvpLhHVN1S72qK3sSy4U9BUnEjrHR5bjJor
fmYq+pk3URBT3tsaubEmvV1TGNZnrs+8E6U8Ls6ewDEZ8OG1IezkiR2DHnj/oi4x
I+c7X3YmyfDiEUX11MpjNVy3ROss+0q83O5mc6tmJAR7CaongWs=
=0LrM
-----END PGP SIGNATURE-----

--iihpr7ffgjlj4iks--
