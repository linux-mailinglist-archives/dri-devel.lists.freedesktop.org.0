Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD6632B5C6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 08:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB19F6E8CD;
	Wed,  3 Mar 2021 07:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EC56E8CD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 07:44:59 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8247CED;
 Wed,  3 Mar 2021 08:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614757498;
 bh=pgHJQLX6F904nkIj+cn7Uu3xGcm1E0oEGrQESFkz/DE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kPsp5/nlPDzmHvW04qUyNZLnyDW864u23vU7iZIB42BDutSOT/YRdY2nM77y6MC60
 /qEy5LIvxRazzcgxQUsZXzL8s7ACj9cHeM7dyQOkITDL4A6nE18Pm5NtORpizITZ+r
 RoeoV2CEpK54v9E4+VKDcaPnfWxPE3fbcbC1wY5k=
Subject: Re: [PATCHv2 5/6] dra7.dtsi/omap5.dtsi: add cec clock
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-6-hverkuil-cisco@xs4all.nl>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <700a6c8b-8448-051e-044c-0390b8a38ae4@ideasonboard.com>
Date: Wed, 3 Mar 2021 09:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302162403.983585-6-hverkuil-cisco@xs4all.nl>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2021 18:24, Hans Verkuil wrote:
> Add cec clock to the dra7 and omap5 device trees.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Acked-by: Tony Lindgren <tony@atomide.com>
> ---
>   arch/arm/boot/dts/dra7.dtsi  | 5 +++--
>   arch/arm/boot/dts/omap5.dtsi | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index ce1194744f84..efe579ddb324 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -879,8 +879,9 @@ hdmi: encoder@0 {
>   						interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>   						status = "disabled";
>   						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
> -							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
> -						clock-names = "fck", "sys_clk";
> +							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>,
> +							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 11>;
> +						clock-names = "fck", "sys_clk", "cec";
>   						dmas = <&sdma_xbar 76>;
>   						dma-names = "audio_tx";
>   					};
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index e025b7c9a357..6726e1f1b07c 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -586,8 +586,9 @@ hdmi: encoder@0 {
>   						interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
>   						status = "disabled";
>   						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
> -							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
> -						clock-names = "fck", "sys_clk";
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 11>;
> +						clock-names = "fck", "sys_clk", "cec";
>   						dmas = <&sdma 76>;
>   						dma-names = "audio_tx";
>   					};
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
