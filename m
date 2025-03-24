Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7708A6D485
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 08:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE4410E1A8;
	Mon, 24 Mar 2025 07:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="gluj+iAO";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ZPioefSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8E610E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1742799741; x=1774335741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jtdsIlvZFuNXS5m+ytZfrbj/VE0WKhdwUACbuDCbmXo=;
 b=gluj+iAOrFeP3C0hY9OsoMEZcQB2u+ohTBU78SNW9CvsB/+78Y4CfKWT
 qa2a75Y9hTIl3StWfh4znZfhziSm/irrKso2GP9/KGuPuK3QNVcYx6N7z
 VTqCE5P37vKPZ481PSGTd5MNccaOhk70+WHBfUXgcPRj+KoFwfGy6pXVK
 DdmIFPiHpSLoamsEpPuyRIFXVxzP8i7DwLd6x45YJKqm/4NMlzpglK/Kr
 DHY5iL2VIshWrl9XsKx6/ozBQJKf3rytvRB6rxgMTuJvtuGydBNYKgK/D
 2ZggYCKEWgM8mlRgr7f06R9K7wnfdMEyTJR2Efq+Q4ePCqo01sS38ING+ Q==;
X-CSE-ConnectionGUID: CV595JCOQeCMw8MqgTRvug==
X-CSE-MsgGUID: 6Kkbv+/QRrKJfXic6OHNtg==
X-IronPort-AV: E=Sophos;i="6.14,271,1736809200"; d="scan'208";a="43112009"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Mar 2025 08:02:15 +0100
X-CheckPoint: {67E10377-15-903EAEAC-E04C76C8}
X-MAIL-CPID: 1D890C64261B07AD8684C1FEF37BE9A0_5
X-Control-Analysis: str=0001.0A00639B.67E1036D.003C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C8771673F9; Mon, 24 Mar 2025 08:02:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1742799731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtdsIlvZFuNXS5m+ytZfrbj/VE0WKhdwUACbuDCbmXo=;
 b=ZPioefSLN+FlFThMWD0H5hkSLzq2+eFOFR5/Nr1DxIkttSAr16drmLBsreSRcMrylHrIJN
 TtRuu+Ea4B7HK+cGBVFKmRR03kXt7IZ/6limBz2iId/yblXkYZZhkMiHF8+kJANHgEX9bH
 XVEUrl7EOLukSw6jseg6QCeYM4aZGN68IlYSrdx3sJF2ZQbW9WbvY0GIZ7puYCCEb6dCIO
 Kzp3PEoHSNBdRZwFkhtV+fwvWH8LWZWyiIMqh/8MLxM/NFUgJXG5aRwyrZPRjY/lq3L4Ep
 alMs13rW53+XkfDpLEYMCCF4Wf6ZRAA0tqrMfLFleLulmUWb77oEmPg4Lw2wFw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Date: Mon, 24 Mar 2025 08:02:06 +0100
Message-ID: <6144881.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250321200625.132494-10-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-10-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Am Freitag, 21. M=E4rz 2025, 21:05:59 CET schrieb Marek Vasut:
> The instance of the GPU populated in i.MX95 is the G310,
> describe this GPU in the DT. Include description of the
> GPUMIX block controller, which can be operated as a simple
> reset. Include dummy GPU voltage regulator and OPP tables.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Drop regulator-{always,boot}-on from fixed-gpu-reg regulator
>     - Keep the GPU and GPUMIX always enabled
>     - Switch from fsl, to nxp, vendor prefix
>     - Fix opp_table to opp-table
>     - Describe IMX95_CLK_GPUAPB as coregroup clock
>     - Sort interrupts by their names to match bindings
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 58 ++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 9bb26b466a061..3acdbd7fd4eee 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -249,6 +249,35 @@ dummy: clock-dummy {
>  		clock-output-names =3D "dummy";
>  	};
> =20
> +	gpu_fixed_reg: fixed-gpu-reg {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <920000>;
> +		regulator-max-microvolt =3D <920000>;
> +		regulator-name =3D "vdd_gpu";
> +	};
> +
> +	gpu_opp_table: opp-table {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-500000000 {
> +			opp-hz =3D /bits/ 64 <500000000>;
> +			opp-hz-real =3D /bits/ 64 <500000000>;
> +			opp-microvolt =3D <920000>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz =3D /bits/ 64 <800000000>;
> +			opp-hz-real =3D /bits/ 64 <800000000>;
> +			opp-microvolt =3D <920000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz =3D /bits/ 64 <1000000000>;
> +			opp-hz-real =3D /bits/ 64 <1000000000>;
> +			opp-microvolt =3D <920000>;
> +		};
> +	};
> +
>  	clk_ext1: clock-ext1 {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
> @@ -1890,6 +1919,35 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
> =20
> +		gpu_blk_ctrl: reset-controller@4d810000 {
> +			compatible =3D "nxp,imx95-gpu-blk-ctrl";
> +			reg =3D <0x0 0x4d810000 0x0 0xc>;
> +			#reset-cells =3D <1>;
> +			clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clock-parents =3D <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> +			assigned-clock-rates =3D <133333333>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>;
> +		};

With the SM release lf-6.12.3-1.0.0 AP does not have any access to
this BLK_CTRL anymore. See [1]

Best regards,
Alexander

[1] https://github.com/nxp-imx/imx-sm/blob/master/sm/doc/rn_cl.md#sm-184-de=
assert-the-gpu-reset-when-the-gpumix-is-powered-up-rn_detail_sm_184

> +
> +		gpu: gpu@4d900000 {
> +			compatible =3D "nxp,imx95-mali", "arm,mali-valhall-csf";
> +			reg =3D <0 0x4d900000 0 0x480000>;
> +			clocks =3D <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
> +			clock-names =3D "core", "coregroup";
> +			interrupts =3D <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "job", "mmu", "gpu";
> +			mali-supply =3D <&gpu_fixed_reg>;
> +			operating-points-v2 =3D <&gpu_opp_table>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_=
GPU>;
> +			power-domain-names =3D "mix", "perf";
> +			resets =3D <&gpu_blk_ctrl 0>;
> +			#cooling-cells =3D <2>;
> +			dynamic-power-coefficient =3D <1013>;
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible =3D "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg =3D <0x0 0x4e090dc0 0x0 0x200>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


