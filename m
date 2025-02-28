Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C2A4978D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7C610EC5C;
	Fri, 28 Feb 2025 10:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="qaI92DJ5";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ReJ1IdXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A6510EC5C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1740739017; x=1772275017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bxFcBF0XtJdF3mmKEpWa55fZ5mN9n6znZ7Fl8Z8Rh0=;
 b=qaI92DJ5Igoc3C4BthBWgr7/dZ4vrqLhN0HvOCafbMItats/6ZQxnooz
 kCe8m47uzyyVuKA4f/E1LQVD/+D5aC5IvefVJ9SFlO6htPJJXB9w3j0Fn
 5BKlMJdr80wYTCKd7vMCcpo3ZuM6EWDx2MpjEmIBkNvfRasdaOYAqoBWu
 CfXBAGKjbDSY88+ydllUpAKpksceB9LSOsadUp2ifH2AruZm8p5ewkvM1
 i5wkcr9DYV34w8Du+9TJX+EJeKtzic6qQs6XAj0zwDdwhR4ahSHl0XKU2
 +liQXjlMOumawwpbDTIkCJBjMjOjmrVTF+RZhzY1CaxwrVNVXRgfqSLbh A==;
X-CSE-ConnectionGUID: kT0dpwDzStuJfz3Prmzn0A==
X-CSE-MsgGUID: FTZjkLIRRhmFufIh1X86Mw==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; d="scan'208";a="42171938"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:36:54 +0100
X-CheckPoint: {67C191C6-12-FDFF3AB5-CA03ADD1}
X-MAIL-CPID: 48BE83E6EAF2BDBFDA4A0D1D3FAED6CF_2
X-Control-Analysis: str=0001.0A002112.67C191C6.010C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23EA016994C; Fri, 28 Feb 2025 11:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1740739010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bxFcBF0XtJdF3mmKEpWa55fZ5mN9n6znZ7Fl8Z8Rh0=;
 b=ReJ1IdXKdRVBZGodmegLEoU61ogdxEs+Wnljz/8CFMR/Q4U6x95VJ6rRHJwuDby+U6OVFK
 vdzAs8HWwjj8zCPmzVlN2hRJ5Q0IO3xzTABlO1ldQUgMePyw4DWhVmTzRWvDYSoijMqnCK
 p+AC3CmG1O8I35tXTUC9Q56FC3HbHorLJKaaXqWqFWzIwmCTbTd2c3SoTx8i3cpqFLNROs
 7gi0CVMJxGNeLKNGvMv97Ikvy6rhvFE2y1BqPiO5Ax+ZQRVg53/CCQpbZJX8IA53utxoMs
 GHOOGXhv1eJgnyBXQVa1ZajKEVxSkcWTi+jKROWvPKFOxbaQ1384JHG158jK8A==
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
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Date: Fri, 28 Feb 2025 11:36:47 +0100
Message-ID: <2153305.bB369e8A3T@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-10-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de>
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

Hi Marek,

Am Donnerstag, 27. Februar 2025, 17:58:09 CET schrieb Marek Vasut:
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
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 62 ++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 3af13173de4bd..36bad211e5558 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -249,6 +249,37 @@ dummy: clock-dummy {
>  		clock-output-names =3D "dummy";
>  	};
> =20
> +	gpu_fixed_reg: fixed-gpu-reg {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <920000>;
> +		regulator-max-microvolt =3D <920000>;
> +		regulator-name =3D "vdd_gpu";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

Is this an internal voltage?

> +
> +	gpu_opp_table: opp_table {

Node-Names use dash instead of underscore.

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
> @@ -1846,6 +1877,37 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
> =20
> +		gpu_blk_ctrl: reset-controller@4d810000 {
> +			compatible =3D "fsl,imx95-gpu-blk-ctrl";
> +			reg =3D <0x0 0x4d810000 0x0 0xc>;

Mh, GPU_BLK_CTRL is /just a bit) more than the GPU reset. Does it make sense
to make this an gpu-reset-only node, located at 0x4d810008?

> +			#reset-cells =3D <1>;
> +			clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clock-parents =3D <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> +			assigned-clock-rates =3D <133333333>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>;
> +			status =3D "disabled";
> +		};
> +
> +		gpu: gpu@4d900000 {
> +			compatible =3D "fsl,imx95-mali", "arm,mali-valhall-csf";
> +			reg =3D <0 0x4d900000 0 0x480000>;
> +			clocks =3D <&scmi_clk IMX95_CLK_GPU>;

There is also IMX95_CLK_GPUAPB. Is this only required for the rese control =
above?

> +			clock-names =3D "core";
> +			interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "gpu", "job", "mmu";

DT bindings say this order: job, mmu, gpu

Best regards
Alexander

> +			mali-supply =3D <&gpu_fixed_reg>;
> +			operating-points-v2 =3D <&gpu_opp_table>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_=
GPU>;
> +			power-domain-names =3D "mix", "perf";
> +			resets =3D <&gpu_blk_ctrl 0>;
> +			#cooling-cells =3D <2>;
> +			dynamic-power-coefficient =3D <1013>;
> +			status =3D "disabled";
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


