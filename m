Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9077A23F8FF
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 23:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4136E279;
	Sat,  8 Aug 2020 21:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54106E279
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 21:15:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi
 [85.76.78.184])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7738EF9;
 Sat,  8 Aug 2020 23:15:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596921319;
 bh=gP1x91RB3kKPu6RAsnMxKRWAVEXmSF8Ya/Nk5KxpoS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hTMGclAhq9aNVblQoZg5nUyNjfDR/HzA7mYscGl0E+dJZw8J8qAIS4GosPTycCcn6
 YWsxMq4tpwb+f7f59cGmGYBPgFaIsTTZiawy/94smWZpNZstUc8/Yon+n8oGrrJMET
 mbIwwQRF83Vm/IZhE0askrO/V4yfbRlHd0DXpAug=
Date: Sun, 9 Aug 2020 00:15:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/7] ARM: dts: r8a7742: Add DU support
Message-ID: <20200808211503.GS6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
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

On Fri, Aug 07, 2020 at 06:49:52PM +0100, Lad Prabhakar wrote:
> Add du node to r8a7742 SoC DT. Boards that want to enable the DU
> need to specify the output topology.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/r8a7742.dtsi | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
> index 4a8d27dff9f7..a979a4b3de61 100644
> --- a/arch/arm/boot/dts/r8a7742.dtsi
> +++ b/arch/arm/boot/dts/r8a7742.dtsi
> @@ -1509,6 +1509,41 @@
>  			resets = <&cpg 408>;
>  		};
>  
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a7742";
> +			reg = <0 0xfeb00000 0 0x70000>;
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> +				 <&cpg CPG_MOD 722>;
> +			clock-names = "du.0", "du.1", "du.2";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_rgb: endpoint {
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					du_out_lvds0: endpoint {
> +					};
> +				};
> +				port@2 {
> +					reg = <2>;
> +					du_out_lvds1: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		prr: chipid@ff000044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xff000044 0 4>;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
