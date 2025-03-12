Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA54FA5DCCF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5530210E11B;
	Wed, 12 Mar 2025 12:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Df38IDxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE9F10E11B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 12:39:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CFDB65C4645;
 Wed, 12 Mar 2025 12:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498D8C4CEEC;
 Wed, 12 Mar 2025 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741783164;
 bh=qXP7e9cKm6PJkk8q6/yjyEe53myvFFMcXHURqJ4AGdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Df38IDxapPmYq0zj8nu7ZQSbnwY8pnZmSMx0hk57NPggET6m5SxqoxMxvXfCLiYbE
 7hSCkbEnTKrJYxlafMpI/CqdqAJG0QsoOrfR7kyQa6ClWUpNPrklWixAZ2P5LAYAO2
 f3O2VROq161I6dyFkTroLnTQIs5f2/G+PP6aH1JQ1WXw/b2t1QRqBT7pqoJtsAGakz
 VQxCAqC6tamSVx7P7/huVu/RjNohRfFOjijFn/TbbO8L9X2DikiCEGls1om9xW8zP3
 O2W7Y0MPNVHSxavqmiXHrAPqY9GFXEtQ8D/7/8bEpCjMkWaUEY0jDcBw0pwAl7Ixua
 6j18oVK5zQZiw==
Date: Wed, 12 Mar 2025 14:39:17 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, 
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 yubing.zhang@rock-chips.com, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
Message-ID: <q3y36jgswj4xa2g3hnptc6kgzphbqfg675r5paa2lwvdseytio@jysj4f2i6osu>
References: <20250312104214.525242-1-andyshrk@163.com>
 <20250312104214.525242-8-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312104214.525242-8-andyshrk@163.com>
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

On Wed, Mar 12, 2025 at 06:42:08PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The HDMI Port next to Headphone Jack is drived by
> DP1 on rk3588 via a dp2hdmi converter.
> 
> Add related dt nodes to enable it.
> 
> Note: ROCKCHIP_VOP2_EP_DP1 is defined as 11 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address
> error, expected "b"" if we use it directly after endpoint, so we
> use "b" instead here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
> (no changes since v1)
> 
>  .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> index 67b886329248..29f10ec9f0c1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> @@ -57,6 +57,18 @@ analog-sound {
>  			  "Headphone", "Headphones";
>  	};
>  
> +	dp-con {
> +		compatible = "dp-connector";

You've written that it is an HDMI connector. Could you possibly clarify,
why is it being registered as a DP connector? Is there any kind of
a bridge between the DP controller and the HDMI connector?

> +		label = "DP OUT";
> +		type = "full-size";
> +
> +		port {
> +			dp_con_in: endpoint {
> +				remote-endpoint = <&dp1_out_con>;
> +			};
> +		};
> +	};
> +
>  	gpio-leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";
> @@ -268,6 +280,24 @@ &cpu_l3 {
>  	cpu-supply = <&vdd_cpu_lit_s0>;
>  };
>  
> +&dp1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&dp1m0_pins>;
> +};
> +
> +&dp1_in {
> +	dp1_in_vp2: endpoint {
> +		remote-endpoint = <&vp2_out_dp1>;
> +	};
> +};
> +
> +&dp1_out {
> +	dp1_out_con: endpoint {
> +		remote-endpoint = <&dp_con_in>;
> +	};
> +};
> +
>  &gpu {
>  	mali-supply = <&vdd_gpu_s0>;
>  	status = "okay";
> @@ -1262,3 +1292,10 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
>  		remote-endpoint = <&hdmi1_in_vp1>;
>  	};
>  };
> +
> +&vp2 {
> +	vp2_out_dp1: endpoint@b {
> +		reg = <ROCKCHIP_VOP2_EP_DP1>;
> +		remote-endpoint = <&dp1_in_vp2>;
> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
