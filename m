Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063B466AC27
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 16:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC51E10E09C;
	Sat, 14 Jan 2023 15:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F22B10E09C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 15:37:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE7F8E68;
 Sat, 14 Jan 2023 16:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673710644;
 bh=pE4ABdxxn81iwj+Byed8sC66F5pDBBt+kKRIrDiVj/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NwXqibWo6DKnGHdc2ei3OdP4G+4dceSdja5tI7XZmiTG2RvatuSI3JQ+BU4qj36/I
 Bgdwq/YdRWf6eITqZ24gGYPA+6ZVgcA2IDw2mIYEozLgF6s+TCFKoahiRH3iEgu3P9
 ACh7gqr2WbrEiIFJtjhjiAQzJxngQqr7cS0gOeco=
Date: Sat, 14 Jan 2023 17:37:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v3 4/6] ARM: dts: omap: Use new media bus type macros
Message-ID: <Y8LMNDIoSZzFBLMB@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-5-laurent.pinchart@ideasonboard.com>
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
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tony, could you take this patch in your tree for v6.3 ? The two patches
that it depends on have both been merged in v6.2.

On Thu, Jun 16, 2022 at 01:14:08AM +0300, Laurent Pinchart wrote:
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/omap3-n900.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> index d40c3d2c4914..9cad9d6a83e2 100644
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -9,6 +9,7 @@
>  #include "omap34xx.dtsi"
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
>  
>  /*
>   * Default secure signed bootloader (Nokia X-Loader) does not enable L3 firewall
> @@ -194,7 +195,7 @@ port@1 {
>  
>  			csi_isp: endpoint {
>  				remote-endpoint = <&csi_cam1>;
> -				bus-type = <3>; /* CCP2 */
> +				bus-type = <MEDIA_BUS_TYPE_CCP2>;
>  				clock-lanes = <1>;
>  				data-lanes = <0>;
>  				lane-polarity = <0 0>;
> @@ -835,7 +836,7 @@ cam1: camera@3e {
>  
>  		port {
>  			csi_cam1: endpoint {
> -				bus-type = <3>; /* CCP2 */
> +				bus-type = <MEDIA_BUS_TYPE_CCP2>;
>  				strobe = <1>;
>  				clock-inv = <0>;
>  				crc = <1>;

-- 
Regards,

Laurent Pinchart
