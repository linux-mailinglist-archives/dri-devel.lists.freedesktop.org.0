Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D331B5E2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 09:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C189D77;
	Mon, 15 Feb 2021 08:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 810B889D77
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 08:31:20 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 8A4A680CE;
 Mon, 15 Feb 2021 08:31:40 +0000 (UTC)
Date: Mon, 15 Feb 2021 10:31:11 +0200
From: Tony Lindgren <tony@atomide.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 5/5] ARM: dts: dra7/omap5: add cec clock
Message-ID: <YCoxT62Sv7MvyQ3G@atomide.com>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
 <20210211103703.444625-6-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211103703.444625-6-hverkuil-cisco@xs4all.nl>
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
Cc: Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Hans Verkuil <hverkuil-cisco@xs4all.nl> [210211 12:37]:
> Add cec clock to the dra7 and omap5 device trees.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This should merge just fine with what I'm planning to merge for v5.13,
probably best to apply this together with the driver changes:

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  arch/arm/boot/dts/dra7.dtsi  | 5 +++--
>  arch/arm/boot/dts/omap5.dtsi | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index ce1194744f84..efe579ddb324 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -879,8 +879,9 @@ hdmi: encoder@0 {
>  						interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>  						status = "disabled";
>  						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
> -							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
> -						clock-names = "fck", "sys_clk";
> +							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>,
> +							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 11>;
> +						clock-names = "fck", "sys_clk", "cec";
>  						dmas = <&sdma_xbar 76>;
>  						dma-names = "audio_tx";
>  					};
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index 5f1a8bd13880..2bb1000aeae9 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -580,8 +580,9 @@ hdmi: encoder@0 {
>  						interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
>  						status = "disabled";
>  						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
> -							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
> -						clock-names = "fck", "sys_clk";
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 11>;
> +						clock-names = "fck", "sys_clk", "cec";
>  						dmas = <&sdma 76>;
>  						dma-names = "audio_tx";
>  					};
> -- 
> 2.30.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
