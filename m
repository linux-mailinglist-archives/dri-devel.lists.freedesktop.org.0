Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3C6DF5D2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67E10E7C9;
	Wed, 12 Apr 2023 12:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E5010E7C9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:43:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id m8so20154356wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303405; x=1683895405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cUF7LoitQw5OkHRbbbgY1vxHPcwK0X9aUiqFfbPiOwE=;
 b=Ex9hVrKzu4VnZn/KwKympLWVqnLG00mRzfW1qoaZcqweDNRIjvzttcA6d175fMltO+
 s+44KFje1bNbbW1gDNTtg3qY1PPlw3F6d9BWgDp5ictRbUsF4ftSM4bJjPQMO6OS7krV
 WDqO6hovL/h7RbDXLeZqyLjg5Qml1ZqBKnYXAfpbj0yw6PJpcjNMTmPNNP+LuJE0Ksx4
 f2a3OtOGJpRCwm0v1TC3plUl5VKW2RjLu5fJ8uFc1o42cl7iQU1v2I1Iyp5y54YckBNf
 D0U3zJQ3MW5AoxCy1/Sr1gNtfHVX1dSBBiIJ4aSoCN9fzRfjxTDzAT7ZaF+BegoXfL2F
 Eceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303405; x=1683895405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cUF7LoitQw5OkHRbbbgY1vxHPcwK0X9aUiqFfbPiOwE=;
 b=wYIF0I2SVs/10HNNDgJzKwb7PWWHNpYeKxZygYqE9M1qkz92FKUzUEa6fx8M5RxpY2
 Gs++LdF+qZoNuG8cO7Uj6N3DKRs/OWqWbvu8QqlYgAakYoXmszniL7TAxzp7IV1a7R9e
 ZObB8L62uQzn2TzgyBh1EG4sd03vstE43MJDN171xRFv5AAsBWPME44iprOU22A7kZ36
 03IGfYfkfXa1yClM7FltMhXDn6TonTE10qq8QebVT814IsPjPF3DLsDFwDUXuSDrAJV3
 9MuHSW21Rha1RE+OdNFTDRvgO91thuUOXXH42Z12U5fKSKdqV3ByIgjg/EyV+9xBKvMD
 fYBA==
X-Gm-Message-State: AAQBX9dQYZomvD5JVtIVfkI48JR88zfN6rmRZrVDyI/m5ZLiKPOn2SiA
 AxktMQRcbOYgfRjAY26RBUU=
X-Google-Smtp-Source: AKy350aAVnydjEmaeKZAWvOiy1vncejnZ4Satpe9Geuus5lfYY1lSqu4hz+nbW5+onECFdEVwDSGCQ==
X-Received: by 2002:a05:600c:c1:b0:3ed:9ce3:4a39 with SMTP id
 u1-20020a05600c00c100b003ed9ce34a39mr9980309wmm.26.1681303405450; 
 Wed, 12 Apr 2023 05:43:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c028600b003ee0d191539sm2269003wmk.10.2023.04.12.05.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:43:24 -0700 (PDT)
Message-ID: <95aec24f-b393-e36d-b4dd-4c0a228fc619@gmail.com>
Date: Wed, 12 Apr 2023 14:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 20/27] arm64: dts: mediatek: mt6795: Add tertiary PWM node
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-21-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-21-angelogioacchino.delregno@collabora.com>
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
> The PWM at 0x11006000 is the tertiary PWM; unlike PWM0, PWM1, this is
> not display specific and can be used as a generic PWM controller.
> 
> This node is left disabled as usage is board-specific.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index cf45cb4ad3d2..50d9276d18c6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -583,6 +583,25 @@ uart3: serial@11005000 {
>   			status = "disabled";
>   		};
>   
> +		pwm2: pwm@11006000 {
> +			compatible = "mediatek,mt6795-pwm";
> +			reg = <0 0x11006000 0 0x1000>;
> +			#pwm-cells = <2>;
> +			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&topckgen CLK_TOP_PWM_SEL>,
> +				 <&pericfg CLK_PERI_PWM>,
> +				 <&pericfg CLK_PERI_PWM1>,
> +				 <&pericfg CLK_PERI_PWM2>,
> +				 <&pericfg CLK_PERI_PWM3>,
> +				 <&pericfg CLK_PERI_PWM4>,
> +				 <&pericfg CLK_PERI_PWM5>,
> +				 <&pericfg CLK_PERI_PWM6>,
> +				 <&pericfg CLK_PERI_PWM7>;
> +			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
> +				      "pwm4", "pwm5", "pwm6", "pwm7";
> +			status = "disabled";
> +		};
> +
>   		i2c0: i2c@11007000 {
>   			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
>   			reg = <0 0x11007000 0 0x70>, <0 0x11000100 0 0x80>;
