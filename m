Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB401604C87
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF2710E655;
	Wed, 19 Oct 2022 15:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AF710E655
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 15:59:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B1B35A4;
 Wed, 19 Oct 2022 17:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1666195180;
 bh=f6TZdjBsSQ2qwq7mKE2z+jQGGPQK5tMyCSea52sbMiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NiPHLsOFifU6YsXMkvgPnetyjEd975JWWdFksM7pJZtrmRjEIEgbgU50zuZmea+eU
 3XvqnGlu9tKY9ujCAzUHdyMEVsYXTnRCQqs6rdTHWbXs8513JgsoEWKoG3iNCLqppq
 ZQydana0uiVzpi9IJCi/8Pd+992uuHbZ1ybDOVTo=
Date: Wed, 19 Oct 2022 18:59:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 36/37] arm64: dts: zynqmp: Add ports for the
 DisplayPort subsystem
Message-ID: <Y1Ae1NlyVGNL/BVs@pendragon.ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
 <20220928224719.3291-37-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220928224719.3291-37-laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jianqiang Chen <jianqian@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michal,

I plan to send a pull request for the series soon. Patches 01/37 to
35/37 will go through the DRM tree. How would you like to handle this
patch and the next ? They depend on the DT binding changes in 01/37.

On Thu, Sep 29, 2022 at 01:47:18AM +0300, Laurent Pinchart wrote:
> The DPSUB DT bindings now specify ports to model the connections with
> the programmable logic and the DisplayPort output. Add them to the
> device tree.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index a549265e55f6..307c76cd8544 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -930,6 +930,30 @@ zynqmp_dpsub: display@fd4a0000 {
>  			       <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO1>,
>  			       <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO2>,
>  			       <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +				port@1 {
> +					reg = <1>;
> +				};
> +				port@2 {
> +					reg = <2>;
> +				};
> +				port@3 {
> +					reg = <3>;
> +				};
> +				port@4 {
> +					reg = <4>;
> +				};
> +				port@5 {
> +					reg = <5>;
> +				};
> +			};
>  		};
>  	};
>  };

-- 
Regards,

Laurent Pinchart
