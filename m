Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA2B260A8C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 08:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAF96E598;
	Tue,  8 Sep 2020 06:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9BB6E598
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 06:04:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9F5E35;
 Tue,  8 Sep 2020 08:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599545061;
 bh=ca7O6RFFRSVQZqqqL9m9ZU0O5qL+e0TLreO9J8eIsQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ugtEGusrDDt1uwGWsO3xbJwMaj9Q5XSrz3taDRhJlivsqszwzK0zh4X7XB8R7redg
 qd+vYleIfP0NRZjVbK4yCFzwejIcGbLQiaQSfHvy9AClB8KuB/EkNPiqGt/NJjtS2w
 zATIxjw8cWBZlWtWJJbyJen332/mcBkJWbAoq6Ds=
Date: Tue, 8 Sep 2020 09:03:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r8a77961: Add HDMI device
 nodes
Message-ID: <20200908060357.GS6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87d02xrtux.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d02xrtux.wl-kuninori.morimoto.gx@renesas.com>
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Morimoto-san,

Thank you for the patch.

On Tue, Sep 08, 2020 at 09:35:15AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds HDMI device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index c7fabd9e875b..7f21491f6436 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2145,14 +2145,23 @@ port@1 {
>  		};
>  
>  		hdmi0: hdmi@fead0000 {
> +			compatible = "renesas,r8a77961-hdmi", "renesas,rcar-gen3-hdmi";
>  			reg = <0 0xfead0000 0 0x10000>;
> -			/* placeholder */
> +			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A77961_CLK_HDMI>;
> +			clock-names = "iahb", "isfr";
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 729>;
> +			status = "disabled";
>  
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				port@0 {
>  					reg = <0>;
> +					dw_hdmi0_in: endpoint {
> +						remote-endpoint = <&du_out_hdmi0>;
> +					};
>  				};
>  				port@1 {
>  					reg = <1>;
> @@ -2191,6 +2200,7 @@ du_out_rgb: endpoint {
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
