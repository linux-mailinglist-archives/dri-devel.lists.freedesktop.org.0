Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A9AD0D75
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jun 2025 14:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9D910E4B2;
	Sat,  7 Jun 2025 12:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="vt3qx6Qr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC1110E4AB
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jun 2025 12:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=oLS1KFEltUOFGxNGj6XeO70K6kHeWgsxYD83o7TwBko=; b=vt3qx6Qr4XYNUfbW89rhyMhIHK
 RUsbuFW40hCFrw9qF7mmgY0m7xNo9YwcgAKicthWaEpFY9uhrdV1nQl5UckilstXJ9RkXaaqKVl0c
 dtsshpIjfiRZ8USENmNvKtqjOsR9M1CbJG/wGi1R+21+bnzuPx789C7DhxRN7nIrXe/ArMbEpysTd
 IZISLJXQsJwlhumSW8zTdRLDYqGP9PepWKUWFPnz3gbQu1asOKBKZvJPQJKUWq8/VOeQujsGMzfYl
 zLmm2V1p2WbbZwcTIWHSG5osyYRCJmRl9c8voR2hD1sEg7cN3sIEOnmKotN7APZKxIaFN+Gkt9CEa
 iOE4OwZQ==;
Received: from i53875b1f.versanet.de ([83.135.91.31] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uNsas-0001Lo-C8; Sat, 07 Jun 2025 14:24:14 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v7 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Date: Sat, 07 Jun 2025 14:24:12 +0200
Message-ID: <10540765.0AQdONaE2F@diego>
In-Reply-To: <6946302.MhkbZ0Pkbq@workhorse>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-10-dc16cfe6fe4e@tomeuvizoso.net>
 <6946302.MhkbZ0Pkbq@workhorse>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Freitag, 6. Juni 2025, 11:20:32 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Nicolas Frattaroli:
> Hi Tomeu,
>=20
> On Friday, 6 June 2025 08:28:30 Central European Summer Time Tomeu Vizoso=
 wrote:
> > From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >=20
> > The NPU on the ROCK5B uses the same regulator for both the sram-supply
> > and the npu's supply. Add this regulator, and enable all the NPU bits.
> > Also add the regulator as a domain-supply to the pd_npu power domain.
> >=20
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 56 +++++++++++++++++=
++++++++
> >  1 file changed, 56 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm=
64/boot/dts/rockchip/rk3588-rock-5b.dts
> > index d22068475c5dc6cb885f878f3f527a66edf1ba70..49500f7cbcb14af4919a6c1=
997e9e53a01d84973 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > @@ -316,6 +316,28 @@ regulator-state-mem {
> >  	};
> >  };
> > =20
> > +&i2c1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c1m2_xfer>;
> > +	status =3D "okay";
> > +
> > +	vdd_npu_s0: regulator@42 {
> > +		compatible =3D "rockchip,rk8602";
> > +		reg =3D <0x42>;
> > +		fcs,suspend-voltage-selector =3D <1>;
> > +		regulator-name =3D "vdd_npu_s0";
> > +		regulator-boot-on;
> > +		regulator-min-microvolt =3D <550000>;
> > +		regulator-max-microvolt =3D <950000>;
> > +		regulator-ramp-delay =3D <2300>;
> > +		vin-supply =3D <&vcc5v0_sys>;
> > +
> > +		regulator-state-mem {
> > +			regulator-off-in-suspend;
> > +		};
> > +	};
> > +};
> > +
> >  &i2c6 {
> >  	status =3D "okay";
> > =20
> > @@ -440,6 +462,10 @@ &pd_gpu {
> >  	domain-supply =3D <&vdd_gpu_s0>;
> >  };
> > =20
> > +&pd_npu {
> > +	domain-supply =3D <&vdd_npu_s0>;
> > +};
> > +
> >  &pinctrl {
> >  	hdmirx {
> >  		hdmirx_hpd: hdmirx-5v-detection {
> > @@ -500,6 +526,36 @@ &pwm1 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&rknn_core_top {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_core_1 {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_core_2 {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_top {
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_2 {
> > +	status =3D "okay";
> > +};
> > +
> >  &saradc {
> >  	vref-supply =3D <&avcc_1v8_s0>;
> >  	status =3D "okay";
> >=20
> >=20
>=20
> Feel free to replace this patch with the following, if your series is
> based on linux-next or v6.16. It moves the enablement into the new
> shared ROCK 5B/5B+ dtsi, and I've added a regulator-enable-ramp-delay
> while I was at it because I've run into hard-to-reproduce problems
> relating to it before that Heiko quickly identified and fixed in his
> recent series[1] for basically all already present regulators. Remains
> to be seen if the final patch lands in that form but this should make
> it easier for people to try out as it means a bad luck roll for the
> day won't make them run into as many weird issues.
>=20
> [1]: https://lore.kernel.org/all/20250605185001.377055-1-heiko@sntech.de/

Reading that just now reminds me to point to=20
https://lore.kernel.org/lkml/20250606190418.478633-1-heiko@sntech.de/

As Chen Yu pointed out in the reply to v2, this is more a property of the
regulator IC itself, so likely should go into the driver.

So with a bit of luck after 6.16-rc1 all the fan53555 clones should use
somewhat hardware-accurate enable-times.


> From ff1c370a158f4340aa5dfa4ed5034e815e5371be Mon Sep 17 00:00:00 2001
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Date: Tue, 3 Jun 2025 17:03:10 +0200
> Subject: [PATCH] arm64: dts: rockchip: enable NPU on ROCK 5B/+
>=20
> The NPU on the ROCK5B uses the same regulator for both the sram-supply
> and the npu's supply. Add this regulator, and enable all the NPU bits.
> Also add the regulator as a domain-supply to the pd_npu power domain.
>=20
> The 5B+'s regulator setup is identical to the 5B in this regard, so it
> goes in the shared .dtsi.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../boot/dts/rockchip/rk3588-rock-5b.dtsi     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3588-rock-5b.dtsi
> index 51e83f0ed809..5a20cc2555fb 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> @@ -332,6 +332,29 @@ regulator-state-mem {
>  	};
>  };
> =20
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1m2_xfer>;
> +	status =3D "okay";
> +
> +	vdd_npu_s0: regulator@42 {
> +		compatible =3D "rockchip,rk8602";
> +		reg =3D <0x42>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		regulator-name =3D "vdd_npu_s0";
> +		regulator-boot-on;
> +		regulator-enable-ramp-delay =3D <500>;
> +		regulator-min-microvolt =3D <550000>;
> +		regulator-max-microvolt =3D <950000>;
> +		regulator-ramp-delay =3D <2300>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};
> +
>  &i2c3 {

I think your patch here has some other dependency still?
Because in the rk3588-rock-5b.dtsi there is no i2c3 yet
In torvalds' branch from _just now_ ;-) .


Heiko

>  	status =3D "okay";
>  };
> @@ -521,6 +544,10 @@ &pd_gpu {
>  	domain-supply =3D <&vdd_gpu_s0>;
>  };
> =20
> +&pd_npu {
> +	domain-supply =3D <&vdd_npu_s0>;
> +};
> +
>  &pinctrl {
>  	hdmirx {
>  		hdmirx_hpd: hdmirx-5v-detection {
> @@ -585,6 +612,36 @@ &pwm1 {
>  	status =3D "okay";
>  };
> =20
> +&rknn_core_top {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_core_1 {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_core_2 {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_mmu_top {
> +	status =3D "okay";
> +};
> +
> +&rknn_mmu_1 {
> +	status =3D "okay";
> +};
> +
> +&rknn_mmu_2 {
> +	status =3D "okay";
> +};
> +
>  &saradc {
>  	vref-supply =3D <&avcc_1v8_s0>;
>  	status =3D "okay";
>=20




