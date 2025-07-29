Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31765B15004
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 17:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17DD10E63B;
	Tue, 29 Jul 2025 15:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="ZQjgMv1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E76310E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 15:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753801834; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kQC7J9GanX8bXeG6wzmtZOl0/iZacsJi9WJmcmQUjXkRaC7zB7GNPP5qgqywT5fta6vpcd9zOx8NqV6oH8SN1bFWVPJ/IsKIY7Ld14jwVYFB9O37fvBzUk3ma8Zi7Eqok0rSyNSA5yZJLr9K9l6BUFb+DxnbfjfF5SYz1EKA45w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753801834;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=kylslLamo4bv/qyU/KRTsw98sD9Xqpc7zl8o58lklJo=; 
 b=l06appq1KmReXO+dI/RskkckkrOOkA7L+yNV4qA8gH4igou9qfX3+Xn7P5lXHBYhFp1SkXBE0hp6LWSQcfHLt39Q6tK2dkNpJvNUe0NtwiZzdgNuLER+rSSshSp+L4z9YffDEWDEE/92M9IBDDLGUUsDu2UTiY/49kC3TExHh78=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753801834; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=kylslLamo4bv/qyU/KRTsw98sD9Xqpc7zl8o58lklJo=;
 b=ZQjgMv1YElgegvAfb0lwHXidUeK2hfoAfNfuhKmRQz918pISIcmtUWLf1JCg2aS6
 H/QvpVjxGYJL6zWSGU4gy0CVQ6ZbynJiA5KC3b6GaGASQdc3dwJlO03FTCJfkgK+kfe
 8wuszfUpjHfh33diiZW8Vr1zqd+MnCTBB0fAWjEc=
Received: by mx.zohomail.com with SMTPS id 1753801832283975.8602234119677;
 Tue, 29 Jul 2025 08:10:32 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id 069A0180F0B; Tue, 29 Jul 2025 17:10:27 +0200 (CEST)
Date: Tue, 29 Jul 2025 17:10:26 +0200
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
Subject: Re: [PATCH v6 07/10] arm64: dts: rockchip: Add DP0 for rk3588
Message-ID: <dnc7coqlkgkukfg5awzrjmr7oi22lcrpucf7kdr4rfabkymbjn@ax6gjebpymkt>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-8-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="koxpk43i6ze3fl3a"
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-8-andyshrk@163.com>
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


--koxpk43i6ze3fl3a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 07/10] arm64: dts: rockchip: Add DP0 for rk3588
MIME-Version: 1.0

Hi,

On Mon, Jul 28, 2025 at 04:28:32PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The DP0 is compliant with the DisplayPort Specification
> Version 1.4, and share the USBDP combo PHY0 with USB 3.1
> HOST0 controller.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

The description matches the TRM:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>=20
> (no changes since v1)
>=20
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 51f11b9c414aa..4a54389c89d75 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1536,6 +1536,36 @@ dsi1_out: port@1 {
>  		};
>  	};
> =20
> +	dp0: dp@fde50000 {
> +		compatible =3D "rockchip,rk3588-dp";
> +		reg =3D <0x0 0xfde50000 0x0 0x4000>;
> +		interrupts =3D <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru PCLK_DP0>, <&cru CLK_AUX16M_0>,
> +			 <&cru CLK_DP0>, <&cru MCLK_I2S4_8CH_TX>,
> +			 <&cru MCLK_SPDIF2_DP0>;
> +		clock-names =3D "apb", "aux", "hdcp", "i2s", "spdif";
> +		assigned-clocks =3D <&cru CLK_AUX16M_0>;
> +		assigned-clock-rates =3D <16000000>;
> +		resets =3D <&cru SRST_DP0>;
> +		phys =3D <&usbdp_phy0 PHY_TYPE_DP>;
> +		power-domains =3D <&power RK3588_PD_VO0>;
> +		#sound-dai-cells =3D <0>;
> +		status =3D "disabled";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			dp0_in: port@0 {
> +				reg =3D <0>;
> +			};
> +
> +			dp0_out: port@1 {
> +				reg =3D <1>;
> +			};
> +		};
> +	};
> +
>  	hdmi0: hdmi@fde80000 {
>  		compatible =3D "rockchip,rk3588-dw-hdmi-qp";
>  		reg =3D <0x0 0xfde80000 0x0 0x20000>;
> --=20
> 2.43.0
>=20

--koxpk43i6ze3fl3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmiI5F8ACgkQ2O7X88g7
+prSdRAAg5kIsE9+nUZ/8nYgzYkMCOnRLL0//U80oop91T9hLmq/bCfIhgxycbFO
fd58Vzp/EZrvhSTHXAoR2OBg8nDDRJLlk84WxGi9kaQHzuCWFRssoflRu3vWIzMV
BqMZRW/pHHjOPeT7uO4fJKUl2KE8g/+02aMFod37ORkiTOyRGa1RpvagMMcsqzWZ
ejlXba1ByMIKTVsPO78SOQ+1qXHdP4sMS4zKhWV90rHYLtSNWC2ZadexoZhz3FF5
truZM1iakrpg4SnIF1ITQRMhX1n7robQ2AEbE4DOMETLjrohkYohNFgIEdS7X4tR
DAKchs05AtnYXRZc5j9248UczdcffYOMqh9An1VgyrFOnhEVeFfrCdSd2X5Cpuq8
ojtcrUeiBrQbljFCtefG01gGBWScR6w9SUW9jHA1h4QNHzEln/1n29+n//syePnb
VoENqcEnsoJ1Xypv9GKVt8qSwktzBiYYOiD3+CtWBBBOVyHfD+b/reSwDMX5N8Js
zTJaPqDdmD74h/xCClcuZczRFR+TlrYTB9XEGF6Sl7Dl7OY1prpqLzDLDKY4RRUd
X1BD7+FwH45YCW83gdt2D72xblR7v01p81dcKs7xB1UoA0/J4H4yLAuwssoltWPs
pVeWr2X5yluAh+8i/SbrfoxUufzzuXHDqI/VSvPFx2+/wBvh8Qo=
=9EXr
-----END PGP SIGNATURE-----

--koxpk43i6ze3fl3a--
