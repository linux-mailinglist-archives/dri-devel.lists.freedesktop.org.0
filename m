Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752A671C4B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 13:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6951E10E72D;
	Wed, 18 Jan 2023 12:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B03010E72E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 12:40:56 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A50DA6602E0B;
 Wed, 18 Jan 2023 12:40:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674045655;
 bh=+loW/XVzSr0xbOK3szJGLSNgt77x/7ltGgyJxfGL0Dg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lwg4co7MNW1JwE74DkaEE6ExU6hkaR3ExFGYuucN3sCUcKLmIp/UM73u3ickeVvn1
 5EXe6WN6+PtIsV+oWvqpMc905xTdpKfu3DLpuNhuXAXxwjrjWExk2OinrAUn6wYS4T
 fahWz4jcYoQUd8xgkSp2btTY/27JvHxMdd+sG3N6P/qbdtcqfChnCYSJaKLywzPlpl
 gVJ4aYoskD5qSK63XTQjd/+5N/U3tbVTc1YT7bL/mpxL7i1bVkso+nhG2PBqAfCy7F
 7SXMMlJRKd9bucWAWMvmfTiHdnlHm7TUmBjo3XRvqLGjAK2xbkCABWe5+3brWtOJBF
 R4nIxrtcU81DA==
Message-ID: <4da35cf7-5c8b-1086-36aa-760d20774c7c@collabora.com>
Date: Wed, 18 Jan 2023 13:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/9] arm64: dts: mediatek: mt8186: Add MTU3 nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/01/23 10:18, Allen-KH Cheng ha scritto:
> Add MTU3 nodes for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 75 ++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c0a3afd55eaf..3d88480913eb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -908,6 +908,43 @@
>   			status = "disabled";
>   		};
>   
> +		ssusb0: usb@11201000 {
> +			compatible = "mediatek,mt8186-mtu3",
> +				     "mediatek,mtu3";

78 columns; compatibles fit in one line.

> +			reg = <0 0x11201000 0 0x2dff>,
> +			      <0 0x11203e00 0 0x0100>;

80 cols; regs fit in one line.

> +			reg-names = "mac", "ippc";
> +			clocks = <&topckgen CLK_TOP_USB_TOP>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> +				 <&infracfg_ao CLK_INFRA_AO_ICUSB>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port0 PHY_TYPE_USB2>;
> +			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			usb_host0: usb@11200000 {
> +				compatible = "mediatek,mt8186-xhci",
> +					     "mediatek,mtk-xhci";

90 cols; fits in one line.

...same comments for ssusb1 :-)

> +				reg = <0 0x11200000 0 0x1000>;
> +				reg-names = "mac";
> +				clocks = <&topckgen CLK_TOP_USB_TOP>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> +					 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
> +				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
> +				interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
> +				mediatek,syscon-wakeup = <&pericfg 0x420 2>;
> +				wakeup-source;
> +				status = "disabled";
> +			};
> +		};
> +
>   		mmc0: mmc@11230000 {
>   			compatible = "mediatek,mt8186-mmc",
>   				     "mediatek,mt8183-mmc";
> @@ -939,6 +976,44 @@
>   			status = "disabled";
>   		};
>   
> +		ssusb1: usb@11281000 {
> +			compatible = "mediatek,mt8186-mtu3",
> +				     "mediatek,mtu3";
> +			reg = <0 0x11281000 0 0x2dff>,
> +			      <0 0x11283e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
> +				 <&clk26m>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port1 PHY_TYPE_USB2>,
> +			       <&u3port1 PHY_TYPE_USB3>;

phys fit in one line.

Regards,
Angelo
