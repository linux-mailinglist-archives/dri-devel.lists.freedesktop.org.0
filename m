Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB5714B59
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE4810E2AD;
	Mon, 29 May 2023 14:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E0D10E2AD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:00:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30ac4e7f37bso1953575f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685368825; x=1687960825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=czUg0GEsA4/pXkVvDlCWQ/xq4KtcNj5P7Uchklz5mQ8=;
 b=j6QlqVGDsb5MBvK6xpO9PmsCQzkb4YXc9jTOoj10YSyM3wKNZ7U9/DJfUoZZ9y7iF3
 aVPBszW4LrX4/yBLrPONK9Hya6xe/RJOQfU9SBS7Ygiz1WYILg69U4iYndjLN8aSXQ9H
 kKTVf8maGXd/Fv/aePNTtlrSxhhPcgTncc/qlCZHwd9tVhJngCXRjGsUg0OukApB0KYC
 PyjA0zfJhv/CumecS1wyWxunseHmCn0rU5IePGNMLoS7MlEcpe94wp+v8yMzWZW2sCQz
 o4o6FMk3v+Q0z0gEuPojqAcUBrJvy8Rvndm1eMod030LPgiCRvW0A32+fS/XG6Qbau6Y
 aELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368825; x=1687960825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=czUg0GEsA4/pXkVvDlCWQ/xq4KtcNj5P7Uchklz5mQ8=;
 b=jmWn72E+QOdCHPywLwVp4G+v4x1RIZbc5nPMfKOL8ttDcA3D9RawruDzV/GeT7b+5o
 GffKp++T4i1RSART0M7zmDYxnWLROWoQ92cvmjHyB9oxxAz2C6ppIBDtt7xTZcKoyMNn
 EKW80elgqf4KciTd4IYQjPkevcTulTxalrllZG1cvvPjpRPnElqEnPpYPVPrWIaI02jO
 odRFV4ZPjCHNEaIn3jT7LTObNFcdYi7QxZkyMakdtWs18bb9v13lUSaMto54djGMzIqF
 63wkrQmMyKKd4wzwMSihp5a9IePMghEIBxQP3NtGWaGJ5rDHjaPlcOz8RVlCLTXRkJqf
 jCKg==
X-Gm-Message-State: AC+VfDzBb4GLXDLDG5Ou+r/qJqhmI3QVFe5x5OKDKBcQlmdC2hwRQy4X
 cMaIdNaoSzhevL8XJajDyHY=
X-Google-Smtp-Source: ACHHUZ5YY0F8kf9d0QDQxU1ifflONL13Hhhhoz7ubJbKMoUbd8atPVWeXbHNhdhapWASVn5XN1KjHQ==
X-Received: by 2002:adf:f512:0:b0:307:88ba:c999 with SMTP id
 q18-20020adff512000000b0030788bac999mr7756125wro.62.1685368825106; 
 Mon, 29 May 2023 07:00:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 e6-20020adffc46000000b0030631f199f9sm68502wrs.34.2023.05.29.07.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 07:00:24 -0700 (PDT)
Message-ID: <731fa0b6-5576-94fc-7cf5-0ec768db9c7d@gmail.com>
Date: Mon, 29 May 2023 16:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 24/27] arm64: dts: mediatek: mt6795-xperia-m5: Add MT6331
 Combo PMIC
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-25-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-25-angelogioacchino.delregno@collabora.com>
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
> This smartphone uses the Helio X10 standard MT6331+MT6332 combo PMICs:
> include the mt6331 devicetree and add the required interrupt.
> 
> Note that despite there being two interrupts, one for MT6331 and one
> for MT6332, in configurations using the companion PMIC, the interrupt
> of the latter fires for both events on MT6331 and for ones on MT6332,
> while the interrupt for the main PMIC fires only for events of the
> main PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index a0e01a756f03..debe0f2553d9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -7,6 +7,7 @@
>   /dts-v1/;
>   #include <dt-bindings/gpio/gpio.h>
>   #include "mt6795.dtsi"
> +#include "mt6331.dtsi"
>   
>   / {
>   	model = "Sony Xperia M5";
> @@ -219,6 +220,15 @@ pins-tx {
>   	};
>   };
>   
> +&pmic {
> +	/*
> +	 * Smartphones, including the Xperia M5, are equipped with a companion
> +	 * MT6332 PMIC: when this is present, the main MT6331 PMIC will fire
> +	 * an interrupt on the companion, so we use the MT6332 IRQ GPIO.
> +	 */
> +	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
>   &uart0 {
>   	status = "okay";
>   
