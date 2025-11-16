Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD11C61497
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 13:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405C310E2B9;
	Sun, 16 Nov 2025 12:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="R5MLfLFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B336710E2B9
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=kNW9yPvfa/OhtLEXuIIfofqtoj6rCxgnTJJKlGU6kjg=;
 b=R5MLfLFNkagzbrOgQ/NYPkwh/zPPi+ubMxzJRVvX1yodJ1sL4JADl7W+HZ0GLJ
 TEOFiOBFgSX/FsUiIrUGTd6BZZfK6c1BZU67zka7J3TcoeMBtNQFVEO9/z3RPJUt
 qp92xrqBT0erQuFQn6s5qd5RkZYGSBKYu4nF9f5cT6y2A=
Received: from dragon (unknown [])
 by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXXyeqwRlpCI87AQ--.8095S3;
 Sun, 16 Nov 2025 20:21:01 +0800 (CST)
Date: Sun, 16 Nov 2025 20:20:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 "Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aRnBqgzeotfrdNmy@dragon>
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102160927.45157-2-marek.vasut@mailbox.org>
X-CM-TRANSID: Mc8vCgAXXyeqwRlpCI87AQ--.8095S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1UGFW8KF43Ww1xZF1rCrg_yoWrJryDpr
 WDCw45Cr4kXr1Ik3WagFW0ka4fuw4kCFyUur1DG3yjyry2qryIqFnIkrnaga4UXF1UGa1U
 trnFqryI9wnxu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9iSdUUUUU=
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNw48oWkZwa5RngAA30
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

On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310, describe this
> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.

The commit log seems need an update for the regulator part?

Shawn

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
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
> Cc: Xianzhong Li <xianzhong.li@nxp.com>
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
> V3: - Drop perf power domain
>     - Drop reset block controller
> V4: - Add RB from Frank
>     - Drop the now optional GPU regulator
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index a91e1724ab1a4..e45014d50abef 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -250,6 +250,28 @@ dummy: clock-dummy {
>  		clock-output-names = "dummy";
>  	};
>  
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-hz-real = /bits/ 64 <500000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-hz-real = /bits/ 64 <800000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-hz-real = /bits/ 64 <1000000000>;
> +			opp-microvolt = <920000>;
> +		};
> +	};
> +
>  	clk_ext1: clock-ext1 {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> @@ -2139,6 +2161,21 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
>  
> +		gpu: gpu@4d900000 {
> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
> +			reg = <0 0x4d900000 0 0x480000>;
> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
> +			clock-names = "core", "coregroup";
> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "job", "mmu", "gpu";
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <1013>;
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
> -- 
> 2.51.0
> 

