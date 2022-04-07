Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439974F8090
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC6810EA16;
	Thu,  7 Apr 2022 13:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7748E10EA16
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:31:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CC82499;
 Thu,  7 Apr 2022 15:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649338293;
 bh=5g/7+0v7BXowhz/aR2zHtPdm5mwSl3JLP4Sz0oWHeUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RoIAchgI9ibXHuor2DiHMgmKdLP+UfCuL0NwoNArDDuomaMNI1Z+fiNHwJL6zi5U/
 qkQ/1+JtOZLBOzK4a3tz5KZsoPKx/i1BwTrRtpYX8cOaSk0kvGcBq4Hq/gGSreatR3
 wqSX0v7Gw2vYHCAo2Rw4P22oZlQxtaGWagD08d6I=
Date: Thu, 7 Apr 2022 16:31:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: Use new media bus type macros
Message-ID: <Yk7nsbQ7xoASlxVm@pendragon.ideasonboard.com>
References: <20220306173905.22990-1-laurent.pinchart@ideasonboard.com>
 <20220306173905.22990-4-laurent.pinchart@ideasonboard.com>
 <6824a158-9837-c61d-cbf9-c8a2ca46110e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6824a158-9837-c61d-cbf9-c8a2ca46110e@foss.st.com>
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
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandre,

On Thu, Apr 07, 2022 at 02:41:58PM +0200, Alexandre TORGUE wrote:
> On 3/6/22 18:39, Laurent Pinchart wrote:
> > Now that a header exists with macros for the media interface bus-type
> > values, replace hardcoding numerical constants with the corresponding
> > macros in the DT sources.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   arch/arm/boot/dts/imx6ul-14x14-evk.dtsi               |  4 +++-
> >   arch/arm/boot/dts/omap3-n900.dts                      |  5 +++--
> >   arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> >   .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> >   .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> >   arch/arm/boot/dts/stm32429i-eval.dts                  |  3 ++-
> >   arch/arm/boot/dts/stm32mp157c-ev1.dts                 |  3 ++-
> >   7 files changed, 23 insertions(+), 11 deletions(-)
> 
> sorry for this late answer. Is it possible to split ARM DT patches by 
> vendor ?

Sure. Is that only to ease backporting, or do you want the ST part to be
merged through a different tree ?

> > diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> > index a3fde3316c73..89234bbd02f4 100644
> > --- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> > +++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> > @@ -2,6 +2,8 @@
> >   //
> >   // Copyright (C) 2015 Freescale Semiconductor, Inc.
> >   
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> >   / {
> >   	chosen {
> >   		stdout-path = &uart1;
> > @@ -170,7 +172,7 @@ &csi {
> >   	port {
> >   		parallel_from_ov5640: endpoint {
> >   			remote-endpoint = <&ov5640_to_parallel>;
> > -			bus-type = <5>; /* Parallel bus */
> > +			bus-type = <MEDIA_BUS_TYPE_BT601>;
> >   		};
> >   	};
> >   };
> > diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> > index d40c3d2c4914..9cad9d6a83e2 100644
> > --- a/arch/arm/boot/dts/omap3-n900.dts
> > +++ b/arch/arm/boot/dts/omap3-n900.dts
> > @@ -9,6 +9,7 @@
> >   #include "omap34xx.dtsi"
> >   #include <dt-bindings/input/input.h>
> >   #include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> >   
> >   /*
> >    * Default secure signed bootloader (Nokia X-Loader) does not enable L3 firewall
> > @@ -194,7 +195,7 @@ port@1 {
> >   
> >   			csi_isp: endpoint {
> >   				remote-endpoint = <&csi_cam1>;
> > -				bus-type = <3>; /* CCP2 */
> > +				bus-type = <MEDIA_BUS_TYPE_CCP2>;
> >   				clock-lanes = <1>;
> >   				data-lanes = <0>;
> >   				lane-polarity = <0 0>;
> > @@ -835,7 +836,7 @@ cam1: camera@3e {
> >   
> >   		port {
> >   			csi_cam1: endpoint {
> > -				bus-type = <3>; /* CCP2 */
> > +				bus-type = <MEDIA_BUS_TYPE_CCP2>;
> >   				strobe = <1>;
> >   				clock-inv = <0>;
> >   				crc = <1>;
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > index 3c8a7c8b1fdd..1043603fc4a5 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > @@ -7,6 +7,9 @@
> >    */
> >   
> >   /dts-v1/;
> > +
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> >   #include "r8a7742-iwg21d-q7.dts"
> >   
> >   / {
> > @@ -242,7 +245,7 @@ port {
> >   		vin0ep: endpoint {
> >   			remote-endpoint = <&cam0ep>;
> >   			bus-width = <8>;
> > -			bus-type = <6>;
> > +			bus-type = <MEDIA_BUS_TYPE_BT656>;
> >   		};
> >   	};
> >   };
> > @@ -273,7 +276,7 @@ port {
> >   		vin1ep: endpoint {
> >   			remote-endpoint = <&cam1ep>;
> >   			bus-width = <8>;
> > -			bus-type = <6>;
> > +			bus-type = <MEDIA_BUS_TYPE_BT656>;
> >   		};
> >   	};
> >   };
> > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> >   			remote-endpoint = <&cam2ep>;
> >   			bus-width = <8>;
> >   			data-shift = <8>;
> > -			bus-type = <6>;
> > +			bus-type = <MEDIA_BUS_TYPE_BT656>;
> >   		};
> >   	};
> >   };
> > @@ -335,7 +338,7 @@ port {
> >   		vin3ep: endpoint {
> >   			remote-endpoint = <&cam3ep>;
> >   			bus-width = <8>;
> > -			bus-type = <6>;
> > +			bus-type = <MEDIA_BUS_TYPE_BT656>;
> >   		};
> >   	};
> >   };
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > index 40cef0b1d1e6..c73160df619d 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > @@ -7,6 +7,8 @@
> >    * Copyright (C) 2020 Renesas Electronics Corp.
> >    */
> >   
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> >   #define CAM_ENABLED	1
> >   
> >   &CAM_PARENT_I2C {
> > @@ -26,7 +28,7 @@ port {
> >   			CAM_EP: endpoint {
> >   				bus-width = <8>;
> >   				data-shift = <2>;
> > -				bus-type = <6>;
> > +				bus-type = <MEDIA_BUS_TYPE_BT656>;
> >   				pclk-sample = <1>;
> >   				remote-endpoint = <&VIN_EP>;
> >   			};
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > index f5e77f024251..a7f5cfec64b8 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > @@ -7,6 +7,8 @@
> >    * Copyright (C) 2020 Renesas Electronics Corp.
> >    */
> >   
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> >   #define CAM_ENABLED	1
> >   
> >   &CAM_PARENT_I2C {
> > @@ -21,7 +23,7 @@ ov7725@21 {
> >   		port {
> >   			CAM_EP: endpoint {
> >   				bus-width = <8>;
> > -				bus-type = <6>;
> > +				bus-type = <MEDIA_BUS_TYPE_BT656>;
> >   				remote-endpoint = <&VIN_EP>;
> >   			};
> >   		};
> > diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
> > index cb46326a8c75..ecb10613d962 100644
> > --- a/arch/arm/boot/dts/stm32429i-eval.dts
> > +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> > @@ -50,6 +50,7 @@
> >   #include "stm32f429-pinctrl.dtsi"
> >   #include <dt-bindings/input/input.h>
> >   #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> >   
> >   / {
> >   	model = "STMicroelectronics STM32429i-EVAL board";
> > @@ -186,7 +187,7 @@ &dcmi {
> >   	port {
> >   		dcmi_0: endpoint {
> >   			remote-endpoint = <&ov2640_0>;
> > -			bus-type = <5>;
> > +			bus-type = <MEDIA_BUS_TYPE_BT601>;
> >   			bus-width = <8>;
> >   			hsync-active = <0>;
> >   			vsync-active = <0>;
> > diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> > index e222d2d2cb44..24f59f3b15dc 100644
> > --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> > +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> > @@ -8,6 +8,7 @@
> >   #include "stm32mp157c-ed1.dts"
> >   #include <dt-bindings/gpio/gpio.h>
> >   #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> >   
> >   / {
> >   	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
> > @@ -90,7 +91,7 @@ &dcmi {
> >   	port {
> >   		dcmi_0: endpoint {
> >   			remote-endpoint = <&ov5640_0>;
> > -			bus-type = <5>;
> > +			bus-type = <MEDIA_BUS_TYPE_BT601>;
> >   			bus-width = <8>;
> >   			hsync-active = <0>;
> >   			vsync-active = <0>;

-- 
Regards,

Laurent Pinchart
