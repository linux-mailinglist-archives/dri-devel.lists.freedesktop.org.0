Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427D66AC19
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 16:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D3210E0B8;
	Sat, 14 Jan 2023 15:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBFF10E097
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 15:30:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78530E68;
 Sat, 14 Jan 2023 16:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673710207;
 bh=tP6Hjycs1/g7PJIhsmoUXKIXkZCkiWBCs2PF9z9Q8+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G/KAig60CfDCNjhAFp2mk//uX8j7Uy25ScKBwyxRRzt6O+Q4rmYT3rTpxACIDyRGD
 OxbWGVLZZqpWRb/YuTpvaxMghcUaQIckbQYKTX0b2U+1IcJvjycw531PghWgwYyxOI
 mblGwqd9ZDNEFv1Qj0nltVRnAqfUnOiwUOz7kKDM=
Date: Sat, 14 Jan 2023 17:30:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 3/6] ARM: dts: freescale: Use new media bus type macros
Message-ID: <Y8LKf0ez1vM+a2YB@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Shawn, could you please take this in your tree for v6.3 ? The two
patches that the DT changes depend on have been merged in v6.2.

On Thu, Jun 16, 2022 at 01:14:07AM +0300, Laurent Pinchart wrote:
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/imx6ul-14x14-evk.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> index 1a18c41ce385..d98111f2100f 100644
> --- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> +++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> @@ -2,6 +2,8 @@
>  //
>  // Copyright (C) 2015 Freescale Semiconductor, Inc.
>  
> +#include <dt-bindings/media/video-interfaces.h>
> +
>  / {
>  	chosen {
>  		stdout-path = &uart1;
> @@ -170,7 +172,7 @@ &csi {
>  	port {
>  		parallel_from_ov5640: endpoint {
>  			remote-endpoint = <&ov5640_to_parallel>;
> -			bus-type = <5>; /* Parallel bus */
> +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>  		};
>  	};
>  };

-- 
Regards,

Laurent Pinchart
