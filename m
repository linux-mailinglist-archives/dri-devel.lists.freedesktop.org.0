Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A411803F44
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 21:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D1510E375;
	Mon,  4 Dec 2023 20:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F64410E3E0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 20:25:31 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9f099cf3aso34397561fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 12:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701721530; x=1702326330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O4zwTB/miMPtSWCRzH5LYRAkGFmdPgzBkW3R45x59/A=;
 b=N1Iybw1qtuM6oWIO+2BZKYrWB3zAnCPzY2UZsIsZUeMFhM1Ta7oo8nexlzvQe+f0Do
 A8b5f7Si1uD4vkFwlKNkGSKVhRxUOZS+RMTXL0iV0sefuprJV8yLHGZgQVctzmDCfmLY
 TasLIOBXf5oSeV3Co93h12XK6b6mmdpAbTwICqUPSbK/kkxaxVLCc/R1tdEKgva82lO7
 Ws/N46Xhka+FkW8Q4cBF89Arl/a7Zf05jHQ9JQ8Pxy1tch0XnQRigui625x4Gra9dNhD
 TrYu3LqK25SENOSFfXyYgTpMgcuvAj3M+k4jJvC1NJ8mgKHnQk7wZ0LBGo394DsZjmab
 pw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701721530; x=1702326330;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O4zwTB/miMPtSWCRzH5LYRAkGFmdPgzBkW3R45x59/A=;
 b=hDguWGjBFNr413nyHIodzwbL+vIoVcx7QqyGbjQ1i+wOjkFzBWmTgz11t1Ii01ap8w
 Y9vRIeliQc7ZHH3LmA7b0E0iNKuzklZS5CNCRlVXMI4WfnpDtKBChaB10nLsXnR+nSHg
 wYNgs0G3F22OAQQwGIL5FlMQc4QJeugZuxCHwN82gUixnw3fbNmHQcMAES8oWtLR6cuF
 iMr8ygUCNhCOdT9kdcv6/y3V23DCRERyxznbEkBfk8bd/etJ1KY/AAYWTo8tUrUQwRz4
 elJw2qz/SdVlZ079eO6YNyA72pZqKGWNVRuvm2PlIFIsJEaKhv3/Jn5YPfgKYMdJdofL
 Y3vA==
X-Gm-Message-State: AOJu0Yz1d/GZbdFTOWWPGU5oWfFcorQwu6kotD6WcxbdLRyNU/qFabtc
 M+ljJNTBiA9qcb5bwk+GVW8=
X-Google-Smtp-Source: AGHT+IHghfI/wepGC1I4yJLErrynLmDWoNAeInmFJJD7a8PBE9bsHDIMPexR8UEVinabv/Xruuf+Ew==
X-Received: by 2002:a05:6512:2343:b0:50b:fcd6:cb10 with SMTP id
 p3-20020a056512234300b0050bfcd6cb10mr904083lfu.130.1701721529711; 
 Mon, 04 Dec 2023 12:25:29 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056402150400b0054c9df4317dsm180568edw.7.2023.12.04.12.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 12:25:29 -0800 (PST)
Message-ID: <bdda61be-8e02-36f5-6261-37d4b75278ba@gmail.com>
Date: Mon, 4 Dec 2023 21:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 3/3] ARM: dts: rockchip: rk3036-kylin: add
 hdmi-connector node
Content-Language: en-US
To: Alex Bee <knaerzche@gmail.com>, heiko@sntech.de, hjc@rock-chips.com
References: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
 <f5bc182b-f9b6-26a8-8649-19ce33e3c0e1@gmail.com>
 <447b1bde-584f-4eb4-8bfb-9abd3aa8b6fa@gmail.com>
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <447b1bde-584f-4eb4-8bfb-9abd3aa8b6fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex, Heiko,

On 12/4/23 20:12, Alex Bee wrote:
> Hi Johan,
> Am 04.12.23 um 18:40 schrieb Johan Jonker:
>> Add hdmi-connector node to comply with the inno_hdmi binding.
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>   arch/arm/boot/dts/rockchip/rk3036-kylin.dts | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
>> index 67e1e04139e7..a213333be011 100644
>> --- a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
>> +++ b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
>> @@ -13,6 +13,17 @@ memory@60000000 {
>>           reg = <0x60000000 0x20000000>;
>>       };
>>
>> +    hdmi_con: hdmi-con {
>> +        compatible = "hdmi-connector";
>> +        type = "c";


> According to [0], kylin has an A-Type HDMI port - so this should be
>  +        type = "a";
> > [0] http://rockchip.wikidot.com/kylin

Not sure from the text or do I miss something...

I did look at that board picture before submitting.
Can be wrong, but to me it looks a smaller HDMI connector.

Does anyone have a Kylin picture from a different angle?
Or reference design?

Else apply and fix later? (Heiko ?)
Let me know.

Johan

> 
> Regards,
> Alex
>> +
>> +        port {
>> +            hdmi_con_in: endpoint {
>> +                remote-endpoint = <&hdmi_out_con>;
>> +            };
>> +        };
>> +    };
>> +
>>       leds: gpio-leds {
>>           compatible = "gpio-leds";
>>
>> @@ -110,6 +121,12 @@ &hdmi {
>>       status = "okay";
>>   };
>>
>> +&hdmi_out {
>> +    hdmi_out_con: endpoint {
>> +        remote-endpoint = <&hdmi_con_in>;
>> +    };
>> +};
>> +
>>   &i2c1 {
>>       clock-frequency = <400000>;
>>
>> -- 
>> 2.39.2
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 
