Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B299E17D1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABDD10E9B5;
	Tue,  3 Dec 2024 09:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YKuB4AXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EE910E9B5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 09:37:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C59994CE;
 Tue,  3 Dec 2024 10:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733218608;
 bh=jQXX/Tc40kph/7OBLJnEEHlRiFU1zhsnN3QXwzQG3EA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YKuB4AXbRMhscTWbDWfRTbNGPURysibT8ay+/BUsYsk5ruwPwvod/Z8ANtwVLPX+m
 4YUAPFw7VbQrfWN2PeXlVZ4elGmpGiXE/IkctEaJ3V6P5Bhn17BRaPHmPKJMeiipoL
 1eD1zdRGU6DB72E6rDe9aTcpZCkqD+QwOjko6uCk=
Date: Tue, 3 Dec 2024 11:37:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a779h0: Add display support
Message-ID: <20241203093703.GL10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:42AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add the device nodes for supporting DU and DSI.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 77 +++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> index 12d8be3fd579..82df6ee98afb 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -1828,6 +1828,54 @@ csi41isp1: endpoint {
>  			};
>  		};
>  
> +		fcpvd0: fcp@fea10000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea10000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 508>;
> +			power-domains = <&sysc R8A779H0_PD_C4>;
> +			resets = <&cpg 508>;
> +		};
> +
> +		vspd0: vsp@fea20000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea20000 0 0x8000>;
> +			interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;

The documentation lists this interrupt as being LevelSensitive and
Negative. I wouldn't expect the VSP to work at all with a wrong polarity
in DT, so the level may get inverted somewhere.

> +			clocks = <&cpg CPG_MOD 830>;
> +			power-domains = <&sysc R8A779H0_PD_C4>;
> +			resets = <&cpg 830>;
> +			renesas,fcp = <&fcpvd0>;
> +		};
> +
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a779h0";
> +			reg = <0 0xfeb00000 0 0x40000>;
> +			interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 411>;
> +			clock-names = "du.0";
> +			power-domains = <&sysc R8A779H0_PD_C4>;
> +			resets = <&cpg 411>;
> +			reset-names = "du.0";
> +			renesas,vsps = <&vspd0 0>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_dsi0: endpoint {
> +						remote-endpoint = <&dsi0_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};

On V4M the DU has a single channel, so there should be a single port.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +			};
> +		};
> +
>  		isp0: isp@fed00000 {
>  			compatible = "renesas,r8a779h0-isp",
>  				     "renesas,rcar-gen4-isp";
> @@ -1996,6 +2044,35 @@ isp1vin15: endpoint {
>  			};
>  		};
>  
> +		dsi0: dsi-encoder@fed80000 {
> +			compatible = "renesas,r8a779h0-dsi-csi2-tx";
> +			reg = <0 0xfed80000 0 0x10000>;
> +			clocks = <&cpg CPG_MOD 415>,
> +				 <&cpg CPG_CORE R8A779H0_CLK_DSIEXT>,
> +				 <&cpg CPG_CORE R8A779H0_CLK_DSIREF>;
> +			clock-names = "fck", "dsi", "pll";
> +			power-domains = <&sysc R8A779H0_PD_C4>;
> +			resets = <&cpg 415>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi0_in: endpoint {
> +						remote-endpoint = <&du_out_dsi0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>  		prr: chipid@fff00044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xfff00044 0 4>;

-- 
Regards,

Laurent Pinchart
