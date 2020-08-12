Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76309242D2B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 18:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5F46E91C;
	Wed, 12 Aug 2020 16:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360156E91C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 16:28:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 579329E7;
 Wed, 12 Aug 2020 18:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597249718;
 bh=uzFeii+3PI4OvTFWxc2HhIz9TI3kpJD/u8DiZLup8P4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vg3305EwVaNs9KQKwleqGTW/I+KSvMN4IfvXRuOsJGFtgabxLOoQmD+A9N56D/rEI
 WA1fxhiq2FzUkNAbHZqxsH6GdwYBAWn1lqjsvBd3QR4biNuEkdCIRx8FvODxqNErE3
 /SoNAwMDNORl6uo434n8Kr+yz3ls6UEdoG2vzU9w=
Date: Wed, 12 Aug 2020 19:28:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 6/9] arm64: dts: renesas: r8a774e1: Populate HDMI encoder
 node
Message-ID: <20200812162824.GQ6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

Thank you for the patch.

On Wed, Aug 12, 2020 at 03:02:14PM +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Populate HDMI node properties in R8A774E1 SoC dtsi.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> index 4b57c1ea762c..79efcd73cc46 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2601,22 +2601,32 @@
>  		};
>  
>  		hdmi0: hdmi@fead0000 {
> +			compatible = "renesas,r8a774e1-hdmi",
> +				     "renesas,rcar-gen3-hdmi";
>  			reg = <0 0xfead0000 0 0x10000>;
> +			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 729>,
> +				 <&cpg CPG_CORE R8A774E1_CLK_HDMI>;
> +			clock-names = "iahb", "isfr";
> +			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> +			resets = <&cpg 729>;
>  			status = "disabled";
>  
> -			/* placeholder */
> -
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
>  				port@0 {
>  					reg = <0>;
> +					dw_hdmi0_in: endpoint {
> +						remote-endpoint = <&du_out_hdmi0>;
> +					};
>  				};
>  				port@1 {
>  					reg = <1>;
>  				};
>  				port@2 {
> +					/* HDMI sound */
>  					reg = <2>;
>  				};
>  			};
> @@ -2650,6 +2660,7 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_hdmi0: endpoint {
> +						remote-endpoint = <&dw_hdmi0_in>;
>  					};
>  				};
>  				port@2 {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
