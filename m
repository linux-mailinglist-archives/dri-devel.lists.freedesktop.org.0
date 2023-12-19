Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123F81891A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 14:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9339C10E186;
	Tue, 19 Dec 2023 13:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6766B10E186
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 13:57:11 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a2343c31c4bso349953966b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 05:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702994230; x=1703599030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/jV7qciVEN9etHxFKKypbaAqxfYKJxHXL5kiTpWoiKo=;
 b=I1CLOGzWtSZeZjz9PyRg/ke7uw9aCI/nUF9MH3lsphzTDsKEmTQWNgCHGbm798tzM5
 0T4NjndR6JMWkClcS0CgGgDEHCwMRBhi7dXfVlj8KtIRPpVV1L0LV2dHNSbgPOLyr+gp
 4HzJ+/brRscQNaSvgudBtGqCet89Bc5iS6amYME4dAGguAaRQgZilTb7NSiM7qcZ694K
 yCyAqwXPNAixxP08B3nutMxy0dv1vzsu/lxKINC/DvL1gKPArIcxgr2dhbmExU0EWETM
 MenHDzvonWZydss8pK5S72JGQP9aBPFkO3XBuNnGsU1zy5mrBBcee1lIXwzBIBcjIhjN
 cFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702994230; x=1703599030;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/jV7qciVEN9etHxFKKypbaAqxfYKJxHXL5kiTpWoiKo=;
 b=HzFG07aeeOv6v/xEAaEAjsmS2suKEvVj+9mhhGiXxXaqwwTJ6yomy4YoTT+rjMn/2n
 Sl5YtfUa/6ppg9JOlWKsRGi8drmERZQo+t19RS4Yjf2xbMHhmiQv2JZxAW1er1bpWOTq
 gpuPcLpKg67GKGOpJiiDYEyR9XUSd58ltcxhilprRtViX0mEm/c1X8x+7SKA44Bt6Sp3
 1IyMJ0vdSWmQrHKM/pOF9y99ubDzketSH1B1qebxpxC4ebevhLIOddKZK8Toz6HBTZvt
 mzK8PzOmBdjb7wxOcJm4vyiYIMzO6g4sbXg+XeoWywB9uoBMI13cJalJFo/wD2UYJdjt
 XYXw==
X-Gm-Message-State: AOJu0YzagEMlTTvmz4Z0B/OpX99Na8Qox1Boptw7mWmnWL8jmKo1SFD9
 eVRWLimQo/DE/a84S1A1cbDKCg==
X-Google-Smtp-Source: AGHT+IHE1xuPPHdj6pLVi5fb7Un6iEuZPwZu9xJp+hbdtBIW/owAYSZPCvoC1M3pOxx0L4+Gc7Qkew==
X-Received: by 2002:a17:906:2b5b:b0:a23:4576:377c with SMTP id
 b27-20020a1709062b5b00b00a234576377cmr1445190ejg.211.1702994229781; 
 Tue, 19 Dec 2023 05:57:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
 by smtp.gmail.com with ESMTPSA id
 ux4-20020a170907cf8400b00a230f3799a4sm6885154ejc.225.2023.12.19.05.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 05:57:09 -0800 (PST)
Message-ID: <1fa5f658-fef1-49e0-b1ca-21359a74e409@linaro.org>
Date: Tue, 19 Dec 2023 14:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add SSD133x OLED controllers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Conor Dooley <conor@kernel.org>
References: <20231218132045.2066576-1-javierm@redhat.com>
 <20231218132045.2066576-2-javierm@redhat.com>
 <20231218-example-envision-b41ca8efa251@spud>
 <87il4u5tgm.fsf@minerva.mail-host-address-is-not-set>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <87il4u5tgm.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Conor Dooley <conor+dt@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/12/2023 12:20, Javier Martinez Canillas wrote:
> Conor Dooley <conor@kernel.org> writes:
> 
> Hello Conor,
> 
>> On Mon, Dec 18, 2023 at 02:20:35PM +0100, Javier Martinez Canillas wrote:
> 
> [...]
> 
>>> +allOf:
>>> +  - $ref: solomon,ssd-common.yaml#
>>> +
>>> +  - properties:
>>> +      width:
>>> +        default: 96
>>> +      height:
>>> +        default: 64
>>
>> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
>> index 8feee9eef0fd..ffc939c782eb 100644
>> --- a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
>> +++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
>> @@ -9,24 +9,24 @@ title: Solomon SSD133x OLED Display Controllers
>>  maintainers:
>>    - Javier Martinez Canillas <javierm@redhat.com>
>>  
>> +allOf:
>> +  - $ref: solomon,ssd-common.yaml#
>> +
> 
> This part worked correctly...
> 
>>  properties:
>>    compatible:
>>      enum:
>>        - solomon,ssd1331
>>  
>> +  width:
>> +    default: 96
>> +
>> +  height:
>> +    default: 64

Which also looks wrong on its own. Where is the definition of these
properties? IOW, where do they come from?

>> +
> 
> ...but when trying move the default for the "solomon,width" and
> "solomon,height" to the properties section, make dt_binding_check
> complains as follows:

Worked for me.

...

>   DTC_CHK Documentation/devicetree/bindings/display/solomon,ssd133x.example.dtb
> 
> The warning goes away if I follow the hints and add a type and description
> to the properties, i.e:

Hm, I wonder what's different in your case. I assume you run the latest
dtschema.

> 
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> index 880c71fdec68..0f4d9ca7456b 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> @@ -17,6 +17,20 @@ properties:
>      enum:
>        - solomon,ssd1331
>  
> +  solomon,width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Width in pixel of the screen driven by the controller.
> +      The default value is controller-dependent.
> +    default: 96
> +
> +  solomon,height:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Height in pixel of the screen driven by the controller.
> +      The default value is controller-dependent.
> +    default: 64
> +
>  required:
>    - compatible
>    - reg
> 
> But that would duplicate information that is already present in the
> included solomon,ssd-common.yaml schema. Do you know what is the proper
> way to do this?

Works for me, so please paste somewhere proper diff so we can compare.

Best regards,
Krzysztof

