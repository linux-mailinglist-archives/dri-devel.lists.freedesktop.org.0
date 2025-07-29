Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9EB15006
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 17:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F8310E64F;
	Tue, 29 Jul 2025 15:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="PH9Y0+bJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E136F10E64F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 15:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753801866; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=I56SF7F8z0bftueuem2tXLE+H6F91SCaEV+NE9hW3wiT5EqdLzT/i/5fRw4EbdZhIBu8wVkuVNiGVfov48igPOySmhbUaeMcVKqnCEzhzz6+oTLt7SJfvj05p7f8INJMwbbbNlaiG22il07NqskLW3/GJy22Qg1PnAO/HH8pFgE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753801866;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1woUM6253HhOkGOXmV7WBVDROMJIvM70GbXNiLz7AlI=; 
 b=YbhPvWFI40ZiKciiAUcrc4LJf7aANyld2oVX/kSMcu/DO+ZBcnC1JFlpc5iF9owlEpNME1DTCB7TIvR6f62ZTYJdz6LaFHPdkG4GN72zu/WQbTbOjlZX3S0gawuIIT+VG01aZ1oU/17zvr4+2EZL7hKe5UHFQP+0l7T8bHeL8fY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753801866; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=1woUM6253HhOkGOXmV7WBVDROMJIvM70GbXNiLz7AlI=;
 b=PH9Y0+bJwXcLfbZFjBJfgzeJY/fpEAwyZETJV1X6XPkxdNg7c06qXhWekSfXCSBK
 BGSgiIL+038tdrFL0QLEMUxFfH83mTDMH77CAoJnEgkQ1xJFO2POlzZXKp7qQ2RFjOk
 wueHp8kwLhLWyYZ6cVqCa434bWsoeG2enepZ3Qxc=
Received: by mx.zohomail.com with SMTPS id 1753801864766949.2085212725262;
 Tue, 29 Jul 2025 08:11:04 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id 02441180F0B; Tue, 29 Jul 2025 17:10:59 +0200 (CEST)
Date: Tue, 29 Jul 2025 17:10:59 +0200
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
Subject: Re: [PATCH v6 08/10] arm64: dts: rockchip: Add DP1 for rk3588
Message-ID: <6jd6atu7q3ler2irnn5thut5thmpco6pnevkvus3rkhimebfo4@rrtqdk5xtxaw>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-9-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="skirinnxkmu7ofhk"
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-9-andyshrk@163.com>
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


--skirinnxkmu7ofhk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 08/10] arm64: dts: rockchip: Add DP1 for rk3588
MIME-Version: 1.0

Hi,

On Mon, Jul 28, 2025 at 04:28:33PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The DP1 is compliant with the DisplayPort Specification
> Version 1.4, and share the USBDP combo PHY1 with USB 3.1
> HOST1 controller.
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
>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index 90414486e466f..691fe941d53a1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -210,6 +210,36 @@ i2s10_8ch: i2s@fde00000 {
>  		status =3D "disabled";
>  	};
> =20
> +	dp1: dp@fde60000 {
> +		compatible =3D "rockchip,rk3588-dp";
> +		reg =3D <0x0 0xfde60000 0x0 0x4000>;
> +		interrupts =3D <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru PCLK_DP1>, <&cru CLK_AUX16M_1>,
> +			 <&cru CLK_DP1>, <&cru MCLK_I2S8_8CH_TX>,
> +			 <&cru MCLK_SPDIF5_DP1>;
> +		clock-names =3D "apb", "aux", "hdcp", "i2s", "spdif";
> +		assigned-clocks =3D <&cru CLK_AUX16M_1>;
> +		assigned-clock-rates =3D <16000000>;
> +		resets =3D <&cru SRST_DP1>;
> +		phys =3D <&usbdp_phy1 PHY_TYPE_DP>;
> +		power-domains =3D <&power RK3588_PD_VO0>;
> +		#sound-dai-cells =3D <0>;
> +		status =3D "disabled";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			dp1_in: port@0 {
> +				reg =3D <0>;
> +			};
> +
> +			dp1_out: port@1 {
> +				reg =3D <1>;
> +			};
> +		};
> +	};
> +
>  	hdmi1: hdmi@fdea0000 {
>  		compatible =3D "rockchip,rk3588-dw-hdmi-qp";
>  		reg =3D <0x0 0xfdea0000 0x0 0x20000>;
> --=20
> 2.43.0
>=20

--skirinnxkmu7ofhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmiI5IMACgkQ2O7X88g7
+pqoyRAAnJKXg8MAqWvb5Ci4nsCz0DWsb3MIFBHOuYG/A+M6maRcDmzCxJebVcNt
Wbp+X9x5iDrRdYG3wL2XY3QQEVhodMBQXuMSELlDaJxCjsW8T/b1gdEGQcl4+a3L
Iy5HHi9AOzfhPqFwpu1um4fTbjx9BYycvudTUhCuCg3PdQJ8hpuRV25VXBWlOUJA
SFpB+Z0xOvDMjAS7QIaCHWp6kRnJ2SJRo165xfMlolQJxbfSFXJpLVEA2RUE9t7A
YQC40TvANVAASWbzHvlO5aawsisuR3qrieZSJhJHo/dPKRD6dJ7wAGSzzTAr+f9s
N6ubB8SFzJa5e41SOykTnlBlt6dYdm5veoKzu+7SXmu9zDrtiupCP42TvvfvOShh
FobaNilhrFORFrUIrTDVLvEobFYWDboFPp8ER+ke//8Pp2Ys4QNFS0mfEKIlEjKn
0NNHM1SAMWdUSC8ySXLHW/lW6QQN/Uz2VycJurX/SiyGVgLjPY0oj+nrm8VXGhMx
EkI2PkxLNoNebHL3Dz4KbprFC63gSb2IwAqs4ROonXfWM60yn0egJOr5if21dAC8
EiP9BKuY4u6Jpb7oNeaRXikzZpVmfiV76JRBOFofTI7T3Wbyq+JM04JzlnrptY0X
wYhT8mNt+KmTQRdv1Mfz+lAzBj7TWfZhr7zUih2rjQV8OfjciP4=
=ZleG
-----END PGP SIGNATURE-----

--skirinnxkmu7ofhk--
