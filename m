Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAD226130F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 16:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083858937C;
	Tue,  8 Sep 2020 14:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8358937C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 14:56:51 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A5F53B;
 Tue,  8 Sep 2020 16:56:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599577010;
 bh=NGdIGQYHgvOnBu350R3owi+GaFcb1QuAKzhjqhy8r+A=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=trUskd4tAYZHuRs76pPaud1uOe7aXS4bBD0DEF39D91utJ1YNaxtoogdOFpex29XZ
 dWrBLUO7niI6EsuApWegVcEocPI/DN+Ej3N/V5D8Aq+9+DBc6u7h1g+wd2qkwiAAL/
 pF/hchx6QQhdiiJkiUxRr5l/4K2xzMxiCqPQ5EGg=
Subject: Re: [PATCH v2 06/10] arm64: dts: renesas: r8a77961: Add VSP device
 nodes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Laurent
 <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87ft7trtvd.wl-kuninori.morimoto.gx@renesas.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <1ca68a4d-3974-71ce-9f42-93aa3ac99c19@ideasonboard.com>
Date: Tue, 8 Sep 2020 15:56:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87ft7trtvd.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Morimoto-san,

On 08/09/2020 01:34, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks, I think this is better now you've sorted the nodes.
It's nicer having the paired FCP/VSP nodes adjacent I think.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 55 +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index fe0db11b9cb9..423808b6cd58 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2012,6 +2012,17 @@ fcpf0: fcp@fe950000 {
>  			resets = <&cpg 615>;
>  		};
>  
> +		vspb: vsp@fe960000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfe960000 0 0x8000>;
> +			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 626>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 626>;
> +
> +			renesas,fcp = <&fcpvb0>;
> +		};
> +
>  		fcpvb0: fcp@fe96f000 {
>  			compatible = "renesas,fcpv";
>  			reg = <0 0xfe96f000 0 0x200>;
> @@ -2020,6 +2031,17 @@ fcpvb0: fcp@fe96f000 {
>  			resets = <&cpg 607>;
>  		};
>  
> +		vspi0: vsp@fe9a0000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfe9a0000 0 0x8000>;
> +			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 631>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 631>;
> +
> +			renesas,fcp = <&fcpvi0>;
> +		};
> +
>  		fcpvi0: fcp@fe9af000 {
>  			compatible = "renesas,fcpv";
>  			reg = <0 0xfe9af000 0 0x200>;
> @@ -2029,6 +2051,17 @@ fcpvi0: fcp@fe9af000 {
>  			iommus = <&ipmmu_vc0 19>;
>  		};
>  
> +		vspd0: vsp@fea20000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea20000 0 0x5000>;
> +			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 623>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 623>;
> +
> +			renesas,fcp = <&fcpvd0>;
> +		};
> +
>  		fcpvd0: fcp@fea27000 {
>  			compatible = "renesas,fcpv";
>  			reg = <0 0xfea27000 0 0x200>;
> @@ -2038,6 +2071,17 @@ fcpvd0: fcp@fea27000 {
>  			iommus = <&ipmmu_vi0 8>;
>  		};
>  
> +		vspd1: vsp@fea28000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea28000 0 0x5000>;
> +			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 622>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 622>;
> +
> +			renesas,fcp = <&fcpvd1>;
> +		};
> +
>  		fcpvd1: fcp@fea2f000 {
>  			compatible = "renesas,fcpv";
>  			reg = <0 0xfea2f000 0 0x200>;
> @@ -2047,6 +2091,17 @@ fcpvd1: fcp@fea2f000 {
>  			iommus = <&ipmmu_vi0 9>;
>  		};
>  
> +		vspd2: vsp@fea30000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea30000 0 0x5000>;
> +			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 621>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 621>;
> +
> +			renesas,fcp = <&fcpvd2>;
> +		};
> +
>  		fcpvd2: fcp@fea37000 {
>  			compatible = "renesas,fcpv";
>  			reg = <0 0xfea37000 0 0x200>;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
