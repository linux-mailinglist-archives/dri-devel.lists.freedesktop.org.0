Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54A7246D5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E785510E369;
	Tue,  6 Jun 2023 14:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6409010E369
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:51:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso9615095a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686063117; x=1688655117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i4S3AW+gFXKuDdWlgSWua88yfNMWkedVutQRVB4LIKo=;
 b=Y98+JxN755IlGpoQeg2qB/of3htIc3ArfR6aT/PWX76RQPzFfSHAHGfaSVEt1hEtY3
 EErrp/x3UxQRcvYpxUmrppeRwHcNWwVliKV4Fb8hhrt+XfqmeZfKz51I5EistX0GdwY9
 o0Wev4JLnhTiAeHTlOp/QyCGdl3v3M85mrU6bfLUC9Y+RLFpIhMIBg+heCjIdEaByDrI
 WfsYsL8bC3yAbRMetVa0RxDlas863ttyKv41cWPTd/6Iv+ng+qy3ZARy1snYXlBmocRV
 4DenrebO4diQrNkY3Xyl+IXant1CqEnYg8Q8yUs/POseI58oBZCCtCeAyIr4w7yvCch5
 5fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686063117; x=1688655117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4S3AW+gFXKuDdWlgSWua88yfNMWkedVutQRVB4LIKo=;
 b=c4LdcGANPgCcm76/wxVnO16x//gjRAPP9HjRU+MiNZWXbd06NTTnlaZOgv+uya9c4U
 kCcbrfYdawU3zmIdfnzcBOmWuD+W1ddD5YcpS+6DryaWStT+ZoPQRtOOEXORpQ3PI2xs
 aJbi3qw3mTQKP8vxrtQmEvM4iZcl856ISxs2RUb+XW2pdxQa6dYkanxV/b+CROQf0j+W
 DKll4rBIPfXBDIShKcj4iKOlT0MKyay1T+oqRc8kOn1QgLm9Iz32HBJ2VP31jnh/O6mU
 dG3sadL9qMqnB3WxIAGWk4sy4yzdP7MOTA2HxqJBs3tC1IP3MgCgD6MrVp15gBrJCkhj
 46Mg==
X-Gm-Message-State: AC+VfDzq+KaiozTck8YK1RVKEBQNHo/H5InClojCRxYK5syIafufsQ/4
 9LJxdJZkpQ2RBND8IxSenklkMg==
X-Google-Smtp-Source: ACHHUZ73e+Bc3N1y+FAd9d+Gs4xPMLeR5KGO1MBX6KedR38QOeqkK4RHhqrRzn/eJo9RJXBDTJtKzA==
X-Received: by 2002:a50:ee8f:0:b0:50b:caae:784 with SMTP id
 f15-20020a50ee8f000000b0050bcaae0784mr2046538edr.20.1686063117531; 
 Tue, 06 Jun 2023 07:51:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a1709060b1a00b00977d7bd9069sm2980319ejg.179.2023.06.06.07.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:51:57 -0700 (PDT)
Message-ID: <bb32d293-1834-0001-cc28-a6c51883f964@linaro.org>
Date: Tue, 6 Jun 2023 16:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add fannal,c3004
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>
References: <20230605153539.497602-1-pavacic.p@gmail.com>
 <20230605153539.497602-3-pavacic.p@gmail.com>
 <7255ff65-9dac-3cce-fb74-09a8984775f2@linaro.org>
 <CAO9szn2WbTqCmj=eSZ_GzYP9anBoBkv7ESD_Jga-EBEqr1rxoA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAO9szn2WbTqCmj=eSZ_GzYP9anBoBkv7ESD_Jga-EBEqr1rxoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 11:53, Paulo Pavacic wrote:
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    dsi {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        panel@0 {
>>> +            compatible = "fannal,c3004";
>>> +            reg = <0>;
>>> +            pinctrl-0 = <&pinctrl_mipi_dsi_rst>;
>>> +            pinctrl-names = "default";
>>> +            reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
>>> +            vdd-supply = <&reg1>;
>>> +            vddio-supply = <&reg2>;
>>> +            width-mm = <93>;
>>> +            height-mm = <56>;
>>> +            panel-timing {
>>> +                clock-frequency = <27000000>;
>>> +                hactive = <480>;
>>> +                vactive = <800>;
>>> +                hfront-porch = <30>;
>>> +                hback-porch = <30>;
>>> +                hsync-len = <8>;
>>> +                vback-porch = <30>;
>>> +                vfront-porch = <30>;
>>> +                vsync-len = <8>;
>>> +            };
>>> +        };
>>> +    };
>>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

So this you decided to ignore?

>>
>>> +...
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 5c22c828ab46..62374c8424b9 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -6427,6 +6427,12 @@ T:     git git://anongit.freedesktop.org/drm/drm-misc
>>>  F:   Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
>>>  F:   drivers/gpu/drm/panel/panel-ebbg-ft8719.c
>>>
>>> +DRM DRIVER FOR FANNAL C3004373132019A
>>> +M:   Paulo Pavacic <pavacic.p@gmail.com>
>>> +S:   Maintained
>>> +C:   matrix:r/mipi-dsi-bringup:matrix.org
>>
>> I don't think we have chat channels for individual, small drivers. Add a
>> channel for entire subsystem.
> Okay I will add matrix:r/linux-drm:matrix.org

I meant, we do not have entries for individual drivers in MAINTAINERS
with mailing lists or with chats. The entries covering entire subsystems
have such links. We are not going to sign up for 100 different channels,
each one per driver.

Best regards,
Krzysztof

