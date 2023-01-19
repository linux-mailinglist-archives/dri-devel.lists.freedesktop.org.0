Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12605673F0D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E1D10E9CC;
	Thu, 19 Jan 2023 16:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6419210E9D0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:39:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i4so1798127wrs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cFccX0iQGUkPDvHxdXm2Dg7nOAysUilW9CKtDUmJ0cw=;
 b=I81c7RERXKi+udhauEcEapckO0k8IyPli493C0u5Ry877Fr6qBEqIDv+107R/2YV0h
 RGBlf2WitbBBsk37ywG476iJ9O+F7Ci929YlrSK1e+hBMpiAkqTTdCsCi3XNsanqq2oj
 dFrpAaSLyXY4t7eeUzkB2MdTb7ye6RkvXeqiE6MZxsmjwrFoMK9i1cMdtBm73+bfB7Kf
 AzGl92rNdOnzGoGsfuf7R/ygb48lad37rsjD/i0oJJR1zzz3lwIsXOJ4Jt5eueFugZVK
 P161mwGSEDjTtvGcq9JeTcbSxHXW9D2U7+ke9NCbCNatoPaXSBtR7qhwgR+N6COXKvxP
 jgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cFccX0iQGUkPDvHxdXm2Dg7nOAysUilW9CKtDUmJ0cw=;
 b=IS4Pl7MWiny0B40FXSHYov3NHM8I3Cb1C8DVJ/XSh3lJp2fweLQek1tJaseskBbSsi
 CPzbjtmF3K9K1LPdxviJ/NWMeZYWpofH1wwn6jmooEt3qfVhg7CwSY1vKBYG+CN71ysU
 vbK0p3wtDfMyLB1dOHRnx9uP5ArN6Tl/SaD7/H8ALlPbSHKq11Txf+VzFB5xgUJzyUrx
 eFfSl9ic04AC/BSpaXXQh5obDfUectxTe4sENPtQ6iV+jZ5+HpcMHbpfDzwDIroskfo8
 AGJgyyixFvHItpXnFqetVU5duhnYOosEJ3fjxlLLx/RlGazG7Bby830/zpCt77SG89AV
 fsPQ==
X-Gm-Message-State: AFqh2kqD74RvE0QxE4Ai/Y5y7JBdTPGgrvU95w7VxugQWu3tntGJgxqA
 nX+TPQb2EnekLkABzH3N4sY=
X-Google-Smtp-Source: AMrXdXvnv3Mh0kiEG2JAGXOY0znP12LMrjnWY7tdftGlWSZFodg0/DJdtw6YlWjdWjtRZfMIz2R3Hw==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id
 y16-20020adfdf10000000b002bbe8911829mr10242278wrl.4.1674146341814; 
 Thu, 19 Jan 2023 08:39:01 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0027323b19ecesm33836836wrt.16.2023.01.19.08.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:39:01 -0800 (PST)
Message-ID: <572b472b-088b-4ebe-0b52-927736199f70@gmail.com>
Date: Thu, 19 Jan 2023 17:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 7/9] arm64: dts: mediatek: mt8186: Add DPI node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-8-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-8-allen-kh.cheng@mediatek.com>
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



On 18/01/2023 10:18, Allen-KH Cheng wrote:
> Add DPI node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c52f9be1e750..45b9d6777929 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1230,6 +1230,23 @@
>   			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>   		};
>   
> +		dpi: dpi@1400a000 {
> +			compatible = "mediatek,mt8186-dpi";
> +			reg = <0 0x1400a000 0 0x1000>;
> +			clocks = <&topckgen CLK_TOP_DPI>,
> +				 <&mmsys CLK_MM_DISP_DPI>,
> +				 <&apmixedsys CLK_APMIXED_TVDPLL>;
> +			clock-names = "pixel", "engine", "pll";
> +			assigned-clocks = <&topckgen CLK_TOP_DPI>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
> +			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
> +			status = "disabled";
> +
> +			port {
> +				dpi_out: endpoint { };
> +			};
> +		};
> +
>   		dsi0: dsi@14013000 {
>   			compatible = "mediatek,mt8186-dsi";
>   			reg = <0 0x14013000 0 0x1000>;
