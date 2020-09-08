Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576C260A7A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 07:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB236E591;
	Tue,  8 Sep 2020 05:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4B56E591
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 05:58:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B81F135;
 Tue,  8 Sep 2020 07:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599544719;
 bh=O82Jh0e5gWwrfblmpjH+WrgR6oiPWxOYRxjEEd+30HY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FT149f64/bvaf+uHK+BOFKtkBIBiuE+26AxV7Zbvr4KnibQzjCF9OQpZ4jfjUy6Du
 /6fcnn/uw7v1HbqK/fn4bGibtfakT12JdDUtY89X1g4/3pBBaZW5NUNEV94BVEFCOo
 bl2yrsJXMqvBjzXLoV+lA0meYKwb+h2Y4qWufe7c=
Date: Tue, 8 Sep 2020 08:58:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: renesas: r8a77961: Add FCP device
 nodes
Message-ID: <20200908055814.GP6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87h7s9rtvl.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7s9rtvl.wl-kuninori.morimoto.gx@renesas.com>
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

On Tue, Sep 08, 2020 at 09:34:50AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds FCP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 52 +++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 0abfea0b27be..fe0db11b9cb9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2004,6 +2004,58 @@ pciec1: pcie@ee800000 {
>  			status = "disabled";
>  		};
>  
> +		fcpf0: fcp@fe950000 {
> +			compatible = "renesas,fcpf";
> +			reg = <0 0xfe950000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 615>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 615>;
> +		};
> +
> +		fcpvb0: fcp@fe96f000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfe96f000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 607>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 607>;
> +		};
> +
> +		fcpvi0: fcp@fe9af000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfe9af000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 611>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 611>;
> +			iommus = <&ipmmu_vc0 19>;
> +		};
> +
> +		fcpvd0: fcp@fea27000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea27000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 603>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 603>;
> +			iommus = <&ipmmu_vi0 8>;
> +		};
> +
> +		fcpvd1: fcp@fea2f000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea2f000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 602>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 602>;
> +			iommus = <&ipmmu_vi0 9>;
> +		};
> +
> +		fcpvd2: fcp@fea37000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea37000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 601>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 601>;
> +			iommus = <&ipmmu_vi0 10>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			reg = <0 0xfea80000 0 0x10000>;
>  			/* placeholder */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
