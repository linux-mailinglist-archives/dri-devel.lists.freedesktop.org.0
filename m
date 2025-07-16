Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E311B078D2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 16:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFFA10E689;
	Wed, 16 Jul 2025 14:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="mHv5BEaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9588710E689
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=vU3zIFgy3U7gHHh/kUTJxPxNHd0D81vJde+B7Dlosp4=; b=mHv5BEaQ1qNRqFW3ov30nAEfsD
 Yp0QdrdwqyYz6IDNOKfF8ChyVx8o13MT8Bko12XUwdEdyBVxGcxeFrH/rU4Aqe+JRHDnJcpW4Kzjz
 /ExkCohirnTAW1cB0Picxvlz3xNfIRiiV1EsGSLVOsJyp0LBX+poDwX0TEyfzzi8luXE3b8Rp5t2n
 0sqUnl0A480vSoFgI6Skze2qGvxni/Y5BqVikQgVFAiCLTZtg/CrcRQibBYeFxjEqleyQduCEMFM2
 o3rs3miSHlKuG/GchQMR5/xBUwfpos9B2Tru/VaPCr8hS+crZwM9RijobVAp9ALGRVpaTGdQTNCr/
 sS+cVQSQ==;
Received: from i53875a74.versanet.de ([83.135.90.116] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uc3ae-0002tO-SX; Wed, 16 Jul 2025 16:58:36 +0200
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v8 08/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588-base
Date: Wed, 16 Jul 2025 16:58:38 +0200
Message-ID: <4525998.iIbC2pHGDl@diego>
In-Reply-To: <20250713-6-10-rocket-v8-8-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-8-64fa3115e910@tomeuvizoso.net>
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

Am Sonntag, 13. Juli 2025, 10:38:58 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Tomeu Vizoso:
> See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).
>=20
> The IP is divided in three cores, programmed independently. The first
> core though is special, being able to delegate work to the other cores.
>=20
> The IOMMU of the first core is also special in that it has two subunits
> (read/write?) that need to be programmed in sync.
>=20
> v2:
> - Have one device for each NPU core (Sebastian Reichel)
> - Have one device for each IOMMU (Sebastian Reichel)
> - Correctly sort nodes (Diederik de Haas)
> - Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)
>=20
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>   Frattaroli)
>=20
> v4:
> - Adapt to changes in bindings
>=20
> v6:
> - pclk and npu clocks are needed by all clocks (Rob Herring)
>=20
> v8:
> - Remove notion of top core (Robin Murphy)
>=20
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 91 +++++++++++++++++++++=
++++++
>  1 file changed, 91 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 1eddc69fd9c9ed95cdc810ba48d9683e3f82489a..dbd472feaa8b3f8c14597a48a=
4f5afbe3cb45b6a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1140,6 +1140,97 @@ power-domain@RK3588_PD_SDMMC {
>  		};
>  	};
> =20
> +	rknn_core_0: npu@fdab0000 {
> +		compatible =3D "rockchip,rk3588-rknn-core";
> +		reg =3D <0x0 0xfdab0000 0x0 0x1000>,
> +		      <0x0 0xfdab1000 0x0 0x1000>,
> +		      <0x0 0xfdab3000 0x0 0x1000>;
> +		reg-names =3D "pc", "cna", "core";
> +		interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
> +			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
> +		clock-names =3D "aclk", "hclk", "npu", "pclk";
> +		assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>;
> +		assigned-clock-rates =3D <200000000>;
> +		resets =3D <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
> +		reset-names =3D "srst_a", "srst_h";
> +		power-domains =3D <&power RK3588_PD_NPUTOP>;
> +		iommus =3D <&rknn_mmu_top>;
> +		status =3D "disabled";
> +	};
> +
> +	rknn_mmu_top: iommu@fdab9000 {

nit: phandle for the mmu should probably also follow the naming change?
I.e. become rknn_mmu_0 ?

> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdab9000 0x0 0x100>,
> +		      <0x0 0xfdaba000 0x0 0x100>;
> +		interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_NPU0>, <&cru HCLK_NPU0>;
> +		clock-names =3D "aclk", "iface";
> +		#iommu-cells =3D <0>;
> +		power-domains =3D <&power RK3588_PD_NPUTOP>;
> +		status =3D "disabled";
> +	};



