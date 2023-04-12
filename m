Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B76DF5E2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00BA10E7CB;
	Wed, 12 Apr 2023 12:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BDB10E7CB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:44:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s12so2293060wrb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303489; x=1683895489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KSYib968TlNgbrZtfYcfjByTNtcgxfB28BPrF3X4daM=;
 b=MY99ceA8wW7QbNZeJ/UhL0jrqb2PDV0XkIO8PiE1B8pXUXYSBVMcBHlchVBx3ZlKSI
 Trcl3JgQqyu1U7HJ74gMZWDscs3HoXaHyMQ735SDo9Fn5itRQ8EvLCVif5RzSRLu5zQ2
 O/6M7+H/ztv7xPbiwep43pFqwS3TIdB4EEzdGvVvqiLYbT6MXYWNQnITM8CmTbtX/okK
 Apf2oxWNTsasGFbHib6t1eqVM72eAnh0mbZ7vd68+8/MGhhAeJdPTebocQUPaTZOuYVu
 fEb4EO7BCR4mny4FfkJKgcvkUyaRXqDHu0Kcc33XmjHrkPBTPJCA9MC4hEmmkp3RJydb
 gBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303489; x=1683895489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSYib968TlNgbrZtfYcfjByTNtcgxfB28BPrF3X4daM=;
 b=iUA3fDyLKmrjyAcWY5Cn051H6c78//R9lQvjHVny+31BybI4ATvTWD323HicuJSfPq
 CYtL8CAYA8PXp9GJeQmQ04fE+5oSN+8ZcUBNZXqlIqC/ZJXEOph4x4WZUWxC99loeCET
 Y94E+S3ARpXbI1bcHHw/n3kYm2aW/zl/gtJIBHVA3DJ538uKB13FIW16fRHuK7MjZ/BX
 EUyjO+nALXekAR1Z++1jGzpYAKhqV9w6kK/XijqsHpj0Imf5zjtW58E0NlGKZEek7i2A
 YW2xvId+jBAdxzwtxEo/J5smm7Fw0TFeu07uz37RQ8xp61gDB4sK7pCyivp5TmiHipin
 R2bw==
X-Gm-Message-State: AAQBX9feBoFvqx5M+HvzTKKMqf9r6pZ70Qef07FtzGqmXUmtZS8JeOvf
 XO4ehekNImCLn/5D1J0lFoc=
X-Google-Smtp-Source: AKy350bqiWDrholWxeMJXdmA/F5ClDwfMvEqM4y0TIzuUBHgXU6/D61FCV64IYa31nkjoJetKcYdxQ==
X-Received: by 2002:adf:dc07:0:b0:2e2:730a:c7de with SMTP id
 t7-20020adfdc07000000b002e2730ac7demr10112945wri.24.1681303488999; 
 Wed, 12 Apr 2023 05:44:48 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d50cd000000b002c71b4d476asm17054089wrt.106.2023.04.12.05.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:44:48 -0700 (PDT)
Message-ID: <17cd35c1-aaa2-26d1-e372-06774e78514f@gmail.com>
Date: Wed, 12 Apr 2023 14:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 27/27] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch
 BMM050 Magnetometer
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-28-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-28-angelogioacchino.delregno@collabora.com>
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
> This smartphone features a Bosch BMM050 Magnetometer on I2C3: enable
> it with the BMM150 binding, as that driver supports BMM050 as well.
> For this sensor, there is no interrupt pin;
> readings were validated in sysfs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied :)

> ---
>   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index 0b0519f6b2f1..b5746e6d0b15 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -75,6 +75,11 @@ accelerometer@10 {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&accel_pins>;
>   	};
> +
> +	magnetometer@12 {
> +		compatible = "bosch,bmm150";
> +		reg = <0x12>;
> +	};
>   };
>   
>   &i2c2 {
