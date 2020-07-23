Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8160522B2CB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 17:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAAE6E03A;
	Thu, 23 Jul 2020 15:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2796E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 15:42:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j18so5373122wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WmpEF3wAK9MyQIycfqRtOyPcqi5ldyWuyIoAHJsmiPk=;
 b=ocSI4ZH0PyYIM68bnC8T89tdDC4qku8Q6bns0IbSeRi1ZgVm3N/GxGxVS9OvbcFBTz
 oN7uSgt2lKmq43lzIsDXJYDBJAwxxzPHxYg2X68/7Y4M6QFcG5OpgmJQJcIwmCwq8Pbn
 X4yNeIg2evOKg9vwfUFM8w8zPvrBzqIsA/CLeb0RYbFvC5tedw0VnpZ+y5W8cdkQvVQB
 B4qW9aI40iuWv9mIQka7e5M7rF5xN9BydSf+BcZtfkZ1XkUzYMg7gRBGOk5N+mR+G7fn
 Tvq7pFmLlgjBzYZ7VZb3Jn4W762go9m09GdcVOeNhbmfyH3c/Bf1FddziFKl6cFlCC8U
 bv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WmpEF3wAK9MyQIycfqRtOyPcqi5ldyWuyIoAHJsmiPk=;
 b=sav4jilsxWw3RrbnzGMr7VbQ0jc4Pvm1+GsHG+PPTKJxdCWrpVDVgATv/H/ThDZMCA
 A4VeY2ciCjmFnpYdv9AVVfYuWzD1tcM2ElvOcgfsU7PGnh4/5wAfvQkyexAmZC8dO5KB
 puOp8iphulJSBCXUlSYYSp4xQ1GVgRWvB3DgfGV1pu/UFO/4V7OOCx4qqoC4s+oKZy2R
 tp5X3QuysUHCjEgqKqotLvEiQm5DkUBmQvFrBnFgeY2y7Cxps2MHw7/kqapnzbEkfPN+
 ISmVzqVnt6CzSd5BNqby1hTq+hB+OMh+TvORLxbgstJAdosS+Uc9dYD2j8lWerM/TrW8
 0PHw==
X-Gm-Message-State: AOAM532HHe4QSUtifj7Vu96J6RggVDqgHfG2dGbXK5momHc4mH/PzQHP
 R8DnF6YykDl+hDMRdtRAuzEF57d30qU=
X-Google-Smtp-Source: ABdhPJyX2JfGZsL+cpAXob0aVplIVs631ETGzU1KEWsj2v12UjMXeteDcjRnFvXcYr5gn4WVKyOiOQ==
X-Received: by 2002:a1c:49c6:: with SMTP id w189mr2301255wma.97.1595518946327; 
 Thu, 23 Jul 2020 08:42:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id d18sm4238353wrj.8.2020.07.23.08.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 08:42:25 -0700 (PDT)
Subject: Re: [v7, PATCH 5/7] arm64: dts: add display nodes for mt8183
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-6-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a8a7232c-6c2b-b606-2091-da540e5cb79e@gmail.com>
Date: Thu, 23 Jul 2020 17:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595469798-3824-6-git-send-email-yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/07/2020 04:03, Yongqiang Niu wrote:
> This patch add display nodes for mt8183
> 

In comparison, DTS patches should go last in a series as you will need the 
driver patches to make it work.

Regards,
Matthias

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 98 ++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 7b781eb..440cf22 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -31,6 +31,11 @@
>   		i2c9 = &i2c9;
>   		i2c10 = &i2c10;
>   		i2c11 = &i2c11;
> +		ovl0 = &ovl0;
> +		ovl_2l0 = &ovl_2l0;
> +		ovl_2l1 = &ovl_2l1;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
>   	};
>   
>   	cpus {
> @@ -707,9 +712,102 @@
>   		mmsys: syscon@14000000 {
>   			compatible = "mediatek,mt8183-mmsys", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>   			#clock-cells = <1>;
>   		};
>   
> +		ovl0: ovl@14008000 {
> +			compatible = "mediatek,mt8183-disp-ovl";
> +			reg = <0 0x14008000 0 0x1000>;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +		};
> +
> +		ovl_2l0: ovl@14009000 {
> +			compatible = "mediatek,mt8183-disp-ovl-2l";
> +			reg = <0 0x14009000 0 0x1000>;
> +			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +		};
> +
> +		ovl_2l1: ovl@1400a000 {
> +			compatible = "mediatek,mt8183-disp-ovl-2l";
> +			reg = <0 0x1400a000 0 0x1000>;
> +			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
> +		};
> +
> +		rdma0: rdma@1400b000 {
> +			compatible = "mediatek,mt8183-disp-rdma";
> +			reg = <0 0x1400b000 0 0x1000>;
> +			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +			mediatek,rdma_fifo_size = <5120>;
> +		};
> +
> +		rdma1: rdma@1400c000 {
> +			compatible = "mediatek,mt8183-disp-rdma";
> +			reg = <0 0x1400c000 0 0x1000>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +			mediatek,rdma_fifo_size = <2048>;
> +		};
> +
> +		color0: color@1400e000 {
> +			compatible = "mediatek,mt8183-disp-color",
> +				     "mediatek,mt8173-disp-color";
> +			reg = <0 0x1400e000 0 0x1000>;
> +			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +		};
> +
> +		ccorr0: ccorr@1400f000 {
> +			compatible = "mediatek,mt8183-disp-ccorr";
> +			reg = <0 0x1400f000 0 0x1000>;
> +			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +		};
> +
> +		aal0: aal@14010000 {
> +			compatible = "mediatek,mt8183-disp-aal",
> +				     "mediatek,mt8173-disp-aal";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +		};
> +
> +		gamma0: gamma@14011000 {
> +			compatible = "mediatek,mt8183-disp-gamma",
> +				     "mediatek,mt8173-disp-gamma";
> +			reg = <0 0x14011000 0 0x1000>;
> +			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +		};
> +
> +		dither0: dither@14012000 {
> +			compatible = "mediatek,mt8183-disp-dither";
> +			reg = <0 0x14012000 0 0x1000>;
> +			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +		};
> +
> +		mutex: mutex@14016000 {
> +			compatible = "mediatek,mt8183-disp-mutex";
> +			reg = <0 0x14016000 0 0x1000>;
> +			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +		};
> +
>   		smi_common: smi@14019000 {
>   			compatible = "mediatek,mt8183-smi-common", "syscon";
>   			reg = <0 0x14019000 0 0x1000>;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
