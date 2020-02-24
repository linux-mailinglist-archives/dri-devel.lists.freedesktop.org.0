Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B86F16A04D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 09:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E7C6E196;
	Mon, 24 Feb 2020 08:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0765B6E196
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 08:46:28 +0000 (UTC)
X-UUID: ad29b07bf7aa4fe49e2a5091d670f26c-20200224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ucwhUjhwtXJ7fomoy+TbQYpZVLRcyud+cUdXEQuJ3Mw=; 
 b=iiH3PAIEkFzFwIci+IKErSH9RGG4s3HsUgyJ3C11MY4TDwR+IL482XiFT0x87OM742CNXyv0z9eyF6xYFm9moaLwe10IOxyqAauNKuJVjLqq9jxoHShr9PIOnTHWTDg7H1Cf06xQ6envjtcTDsyJpf4vHpLmYX2hq73y+GRAbqg=;
X-UUID: ad29b07bf7aa4fe49e2a5091d670f26c-20200224
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 131449361; Mon, 24 Feb 2020 16:46:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Feb 2020 16:45:34 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 24 Feb 2020 16:46:39 +0800
Message-ID: <1582533982.12922.5.camel@mtksdaap41>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: update dpi
 supported chips
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 24 Feb 2020 16:46:22 +0800
In-Reply-To: <20200221112828.55837-2-jitao.shi@mediatek.com>
References: <20200221112828.55837-1-jitao.shi@mediatek.com>
 <20200221112828.55837-2-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jitao:

On Fri, 2020-02-21 at 19:28 +0800, Jitao Shi wrote:
> Add decriptions about supported chips, including MT2701 & MT8173 &
> mt8183
> 
> 1. Add more chips support. ex. MT2701 & MT8173 & MT8183
> 2. Add property "dpi_pin_mode_swap" and "pinctrl-names" gpio mode dpi mode and
>    gpio oupput-low to avoid leakage current.
> 3. Add property "dpi_dual_edge" to config the dpi pin output mode dual edge or
>    single edge sample data.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.txt        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index b6a7e7397b8b..cd6a1469c8b7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -7,6 +7,7 @@ output bus.
>  
>  Required properties:
>  - compatible: "mediatek,<chip>-dpi"
> +  the supported chips are mt2701 , mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> @@ -16,6 +17,11 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be connected
>    to the input port of an attached HDMI or LVDS encoder chip.
>  
> +Optional properties:
> +- dpi_pin_mode_swap: Swap the pin mode between dpi mode and gpio mode.
> +- pinctrl-names: Contain "gpiomode" and "dpimode".
> +- dpi_dual_edge: Control the RGB 24bit data on 12 pins or 24 pins.

I've find that in [1], there are already a property of "pclk-sample"
which like this, but it only have rising (1) or falling (0) status. Does
that property describe the same thing with this property? If they are
the same, I think you should add new state, dual (2), for "pclk-sample".

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/video-interfaces.txt?h=v5.6-rc3

Regards,
CK

> +
>  Example:
>  
>  dpi0: dpi@1401d000 {
> @@ -26,6 +32,11 @@ dpi0: dpi@1401d000 {
>  		 <&mmsys CLK_MM_DPI_ENGINE>,
>  		 <&apmixedsys CLK_APMIXED_TVDPLL>;
>  	clock-names = "pixel", "engine", "pll";
> +	dpi_dual_edge;
> +	dpi_pin_mode_swap;
> +	pinctrl-names = "gpiomode", "dpimode";
> +	pinctrl-0 = <&dpi_pin_gpio>;
> +	pinctrl-1 = <&dpi_pin_func>;
>  
>  	port {
>  		dpi0_out: endpoint {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
