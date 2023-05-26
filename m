Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C9712217
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 10:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C3B10E1B8;
	Fri, 26 May 2023 08:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB2210E1B8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:21:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f603ff9c02so3065695e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 01:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685089270; x=1687681270;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7i/lcle1xBraF8w9eo+4SpWIOMjnDNDMCKcDvZQyHZM=;
 b=qvLicbbFFgmav5ajzEA+heiCWFT/AryRYI1wconzkNif7M9qSlQ7imMoD2UGJAkQNa
 Hqtx+HhtsXqX46t89c06rDmn32wl+ZK+oV/sGgOTUqaJ3X0dO7/yGrAdCVw2csExBj47
 uOKFILUgdFMqk9rOhfkxpSJ5mZHydHhhRu2IzU6xCK51f8QWSI3v2AF1tAreOLUqeqr9
 thrGoy384OaHNvlDpVkwIb6rbiyOarnD+qb1LkSt1qphqFqjoVaIrkNMHeILB5+7/KLo
 AefOOjeKsGKQI4GdHnznjAh/ijx8CKY7SrHv7Hm9B99fXXQ/rhkNVBRq52DRxBMf8LFL
 NiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685089270; x=1687681270;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7i/lcle1xBraF8w9eo+4SpWIOMjnDNDMCKcDvZQyHZM=;
 b=SkYjiCpwoID1tcDBXR76aMoTF3js0tAoHyMIFQsF8JUPeGPrVlkxs4U6CkPVdVWHE3
 JBj0dbbrt5qDsEl/2277rSDCwsMYmxJx3uGtn/TpNIjsVAFlDRpktJITu+9oIZxMnipL
 Q3gHRJ2ESxuGRoTvVZ6qF9BmuKUWkIDssFa9WuXqpX7OW0khPj5Y4PRrY+VffGiA4cqi
 +1Q0llAh82bd4yrCZvdDXAevz2AKlN9OTZkRk/LSZ8TiE0i2uZoYGlKckDLS4om9Ipa4
 s30MpOK1Ye9StXNhWl0Ry8NqjPGHToBqSEZFvruB7Be2zWoKSUuD0DYQCv4SWUCG55Cx
 4o8Q==
X-Gm-Message-State: AC+VfDyWfg8GTKLM+OYXCSXaOoB3EQOOo4Tq69PK5scE4Jl2l+qS0Fz/
 Qu0bwXaHeARn/UYIEApPFnxKFA==
X-Google-Smtp-Source: ACHHUZ6xLeRPM1v2q/+ZmYwU051OEHTFMfO/ANY42iSCar0Ce226EYQxB0NTVN5Xm8J3N5T0wYmTKw==
X-Received: by 2002:a05:600c:2193:b0:3f4:fd67:6d7c with SMTP id
 e19-20020a05600c219300b003f4fd676d7cmr873084wme.40.1685089270424; 
 Fri, 26 May 2023 01:21:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0?
 ([2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f4248dcfcbsm8081540wmc.30.2023.05.26.01.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 01:21:09 -0700 (PDT)
Message-ID: <b8a3e7f0-d227-117f-443b-0f6b193e792b@linaro.org>
Date: Fri, 26 May 2023 10:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] Revert "dt-bindings: bridge: samsung-dsim: Make some
 flags optional"
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
References: <20230526-revert-bad-binding-v1-1-67329ad1bd80@linaro.org>
 <20230526-oppressor-cabbie-fd5332dbc2cc@wendy>
Organization: Linaro Developer Services
In-Reply-To: <20230526-oppressor-cabbie-fd5332dbc2cc@wendy>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2023 10:02, Conor Dooley wrote:
> On Fri, May 26, 2023 at 09:27:16AM +0200, Neil Armstrong wrote:
>> This reverts commit cfaf76d349837f695c8aa6d7077847fec4231fe5 which was applied
>> without review due to a bad tool manipulation.
> 
> Is it a dt-binding maintainer review that you are missing on that
> patch?

Exact

> 
> For this one:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, I'll apply this revert now and wait until the original
bindings patch gets properly reviewed.

Thanks,
Neil

> 
> Thanks,
> Conor.
> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml    | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>> index 360fea81f4b6..9f61ebdfefa8 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>> @@ -70,9 +70,7 @@ properties:
>>     samsung,burst-clock-frequency:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>> -      DSIM high speed burst mode frequency when connected to devices
>> -      that support burst mode. If absent, the driver will use the pixel
>> -      clock from the attached device or bridge.
>> +      DSIM high speed burst mode frequency.
>>   
>>     samsung,esc-clock-frequency:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>> @@ -82,8 +80,7 @@ properties:
>>     samsung,pll-clock-frequency:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>> -      DSIM oscillator clock frequency. If absent, the driver will
>> -      use the clock frequency of sclk_mipi.
>> +      DSIM oscillator clock frequency.
>>   
>>     phys:
>>       maxItems: 1
>> @@ -137,7 +134,9 @@ required:
>>     - compatible
>>     - interrupts
>>     - reg
>> +  - samsung,burst-clock-frequency
>>     - samsung,esc-clock-frequency
>> +  - samsung,pll-clock-frequency
>>   
>>   allOf:
>>     - $ref: ../dsi-controller.yaml#
>>
>> ---
>> base-commit: cfaf76d349837f695c8aa6d7077847fec4231fe5
>> change-id: 20230526-revert-bad-binding-f77a3ca96419
>>
>> Best regards,
>> -- 
>> Neil Armstrong <neil.armstrong@linaro.org>
>>

