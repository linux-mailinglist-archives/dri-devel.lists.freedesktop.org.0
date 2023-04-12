Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CF6DF5E0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8550E10E7CA;
	Wed, 12 Apr 2023 12:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6880210E7CA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:44:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id q5so6434369wmo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303479; x=1683895479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9NXku2pSRV2wSCRtuxBqdlKYT3KNs95Y1/l9wS3vzw=;
 b=OyUCjn9d2mWZw6/j9UH76T6MvVfV73nrX7flAEHmexvlXuDR1A3kUxIjr+44xDCrDR
 k//7Zw99Qqcchw/qWW0ytKHFb8rCDg0FSSOQiwNs2dwvTwNVjp8nk0Cu2NfAfjmw9Zc8
 5uzci64ZRXvrjB0zjvaimqizCRF1+OKTRXwW/zN3C0pT8ZwRwRaQ6Xx/6f+OROOMWKG6
 cMyn8GGHWv15mf6E752bYcMrKPUww+r3RV4+3atyPQuSPI9VETbjjn0N4Uxt2Pn/UyoH
 ccqI2akgk2fhK3+m1y6MYcSTCHHj84THPSfcHDOGBvGTZqhWb9Y2KoXB3FK5Oj3oqwwm
 pI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303479; x=1683895479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9NXku2pSRV2wSCRtuxBqdlKYT3KNs95Y1/l9wS3vzw=;
 b=XVvmcapNL3hm6JHVjpOwfEvvIVmV9apIpko2GP0UHMbyU09mIvOoPmiZK88f9xTx7+
 R7iWzCykVGndDY0+bPGyaNOgpJv8l1x5m74YJnlsKG0gXObrZH1UJ9n3QLqej83lPcR1
 L0Og7HcUgj7WPTJeeUVFsSLX4IAhdt3vALDv1e9zTAnp91E/dfZT/IsK8OZJwG7Atkba
 Yn4XuDs9abT5AuF0YZRWqZbHskxkNEknaDh2ol8UUeNkxw02n5Gb9OSszR2RNTWLgjml
 mUJS87IiSlryKiqbc9xxovxw9CPyHkND/Ps9ZZRT8wq93EKculI/HEyeoDPqwSfmz3Fm
 iMtg==
X-Gm-Message-State: AAQBX9cANZfP6NlKHIwExhgpYhlhSzql+kd48WOhNeXIUqCuV3lZdy2l
 8RjkQmjK4SmfCsTYvK80Vqw=
X-Google-Smtp-Source: AKy350Z9J6ofOu5x2SAuA+Yid54vROa2O2IpNFieU9+eQdR2LmXWIs2SlT696xFupy+hn+OrZ4Z+vg==
X-Received: by 2002:a1c:f20b:0:b0:3ed:418a:ec06 with SMTP id
 s11-20020a1cf20b000000b003ed418aec06mr11959758wmc.28.1681303479096; 
 Wed, 12 Apr 2023 05:44:39 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003f0824e8c92sm2294201wmc.7.2023.04.12.05.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:44:38 -0700 (PDT)
Message-ID: <d892f4d4-f311-4795-ded4-6b735739dd94@gmail.com>
Date: Wed, 12 Apr 2023 14:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 26/27] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch
 BMA255 Accelerometer
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-27-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-27-angelogioacchino.delregno@collabora.com>
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
> Add the BMA255 Accelerometer on I2C3 and its pin definitions.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts   | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index 155a573eac4c..0b0519f6b2f1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -68,6 +68,13 @@ &i2c1 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c1_pins>;
>   	status = "okay";
> +
> +	accelerometer@10 {
> +		compatible = "bosch,bma255";
> +		reg = <0x10>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&accel_pins>;
> +	};
>   };
>   
>   &i2c2 {
> @@ -247,6 +254,14 @@ pins-irq {
>   		};
>   	};
>   
> +	accel_pins: accelerometer-pins {
> +		pins-irq {
> +			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>;
> +			bias-pull-up;
> +			input-enable;
> +		};
> +	};
> +
>   	i2c0_pins: i2c0-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
