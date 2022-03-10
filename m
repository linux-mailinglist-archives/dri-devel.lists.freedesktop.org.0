Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03EE4D4514
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69C10EE1D;
	Thu, 10 Mar 2022 10:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C19610EE2C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:53:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 70CF21F454C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909587;
 bh=/gNWVadDfDGHqNyl7lJyNQZh6ChwEINYUFyIGatCL1M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AGV3VigDWxu0PfehGZ2acLaX+HM0VeKT3xlJoPRA6pxisHTKZUbrEmzSW9Jrzwfqk
 cVncWHKPaXKR/u9m9paG+QZxjyyCe67geLsp3EgoZ0dd06LCTfzKJC4d7yviicTnzE
 JthQlmrJNZBZjaXDV486nsWQeXnt20hA+EgwmbPEq2INHfNox7yS5uBDSR7XrfI028
 eWCBlBdYnyFZANqf8VzT+xBDf7lVW3TpUscXIDxEWSr/UI1CwFp5EjvPjxr/DWPizN
 VCLLsM4JmYf8XCMQucjmDVQbpHTpU6/N8wlClJEy33dotHvE10bnC2H9OwQ8EYjNL7
 ZXbABZYumsrxQ==
Message-ID: <b9404776-b5c7-7321-f352-1995dafa1565@collabora.com>
Date: Thu, 10 Mar 2022 11:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 22/22] arm64: dts: mt8195: add display node for vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-23-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-23-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add display node for vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223 +++++++++++++++++++++++
>   1 file changed, 223 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index dbca699bba05..e650ec759235 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi


..snip..

> +
> +		ethdr0: ethdr@1c114000 {
> +			compatible = "mediatek,mt8195-disp-ethdr";
> +			reg = <0 0x1c114000 0 0x1000>,
> +			      <0 0x1c115000 0 0x1000>,
> +			      <0 0x1c117000 0 0x1000>,
> +			      <0 0x1c119000 0 0x1000>,
> +			      <0 0x1c11A000 0 0x1000>,
> +			      <0 0x1c11B000 0 0x1000>,
> +			      <0 0x1c11C000 0 0x1000>;

Hello Nancy,
looks like you partially forgot to use lower-case hex here...

0x1c11a000 0x1c11b000 0x1c11c000

> +			reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
> +				    "vdo_be", "adl_ds";
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;

...and here too: 0xa000 0xb000 0xc000

Please fix that, after which, you can add my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> +				 <&vdosys1 CLK_VDO1_26M_SLOW>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> +				 <&topckgen CLK_TOP_ETHDR>;
> +			clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
> +				      "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
> +				      "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
> +				      "ethdr_top";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> +				 <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> +			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
> +		};
> +
>   	};
>   };

