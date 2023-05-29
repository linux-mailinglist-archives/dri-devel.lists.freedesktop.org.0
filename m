Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F5714B44
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4722110E2AA;
	Mon, 29 May 2023 13:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0945310E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:58:03 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f611ccd06eso21814295e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685368682; x=1687960682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d8wXnB4iVuJZTN+eBti6PDoOXenSUwXL/Vym36+LG00=;
 b=sm2uEKOVz1LR9pGxAkNQfFiXAxvmi4hYDgkR9kD6JdRiHHy4EPhaw9sEP1fYAeoenp
 M2Cg67O83WRhdN4xlIqim6FNdFvn6VLlN41uZDSotHeVZy8a0B1aaDW6UTKXLqu3ersB
 i0dOnDDdExp33NKwxjKjpZYcVHODS3xliW13WGUCIUJqhKlYEKxx4cAV6m9n4WLsfFiZ
 RGjSa2sJp6Q7bfczan8yg+EU6miQRV1wf0+5J1c0+p+A8B4DA2EmmClbD6B6ajaFgoJW
 f5TMbprefeCG6ip5hcpgNMmsI5mCCzNOY1ZwJ5vDyJVDAka9y7JwRVGszwbKqMPQINhS
 VwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368682; x=1687960682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d8wXnB4iVuJZTN+eBti6PDoOXenSUwXL/Vym36+LG00=;
 b=GTX90PAiZrngWqSC4ejqIuW22zs1lAXm84fgriI94KMW+3LjgbKZ4awbBJJXN59cL6
 BYwrASZpS86fbWG+CtI6r0PvBShx0/yejZUwcOLK5scxaRw9LP6mzVRCvr9Dg86r5Eam
 xlO1/PbTzuwP/ehsBSctJEwuXlLDVdomULOCaTcIK2ubtmfBcXDgB/cCgYx0RWctorvk
 8v/QMVUCZ7D7GaWCbAvEZf+Qna+InMVSBmPX3tvpmcorRpqbrzIhXA/nM0wTqTInQ41S
 m+gjW0Dm4mdORsEO6uvetkEpUQ/x95sITtuc4+860wkqsJ7W3VgEKtoCDgBkTg2zpJDN
 5zmQ==
X-Gm-Message-State: AC+VfDz1WgDU81M0tBVP2dgBFWmzh3NVO81PlXGwd42mDcVntFVE6cBj
 HoMvUJzWt8l3w+1RUJIOMZw=
X-Google-Smtp-Source: ACHHUZ7H4VO6On4+LQ60ze6eygW9wgdySmljow50Ej5bjnq5xSK7lqfcpgSGf81iI1u261fmbaBI1Q==
X-Received: by 2002:a05:600c:2110:b0:3f6:f7c:b3fa with SMTP id
 u16-20020a05600c211000b003f60f7cb3famr8544858wml.31.1685368681822; 
 Mon, 29 May 2023 06:58:01 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b003f5ffba9ae1sm14431663wml.24.2023.05.29.06.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 06:58:00 -0700 (PDT)
Message-ID: <78d59502-313e-3b6b-d363-f6e105120abb@gmail.com>
Date: Mon, 29 May 2023 15:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 21/27] arm64: dts: mediatek: mt6795: Add PMIC Wrapper node
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-22-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-22-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add the pwrap node: this is used to communicate with the PMIC(s).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 50d9276d18c6..29ca9a7bf0b3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -391,6 +391,17 @@ timer: timer@10008000 {
>   			clocks = <&system_clk>, <&clk32k>;
>   		};
>   
> +		pwrap: pwrap@1000d000 {
> +			compatible = "mediatek,mt6795-pwrap";
> +			reg = <0 0x1000d000 0 0x1000>;
> +			reg-names = "pwrap";
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&infracfg MT6795_INFRA_RST0_PMIC_WRAP_RST>;
> +			reset-names = "pwrap";
> +			clocks = <&topckgen CLK_TOP_PMICSPI_SEL>, <&clk26m>;
> +			clock-names = "spi", "wrap";
> +		};
> +
>   		sysirq: intpol-controller@10200620 {
>   			compatible = "mediatek,mt6795-sysirq",
>   				     "mediatek,mt6577-sysirq";
