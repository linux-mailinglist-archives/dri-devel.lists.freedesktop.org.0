Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87442646B35
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 09:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACCA10E47D;
	Thu,  8 Dec 2022 08:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C80510E47D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 08:57:29 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b13so1043786lfo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 00:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t+Wh+O8PRwTrRbk5kFdr3a/rSo7u8vOA5d9odhfiR14=;
 b=v1BSzoivO0PDOUQT0ugfbeIyn3ltnACrXweWeUA+dRemAuYcVd53KUcoqoV2McEcub
 IfYVTtelayxQaadlY3/x1LZHiBSoTV0lsY1GUYkDIFVB1DCuw+RNbFEZ+yTaUe/ENSdc
 fxSaDVJ5zzuJwqfP1qXHAzPOBOHk7qTaKzr7fZwzYAS128kkeJXBDj5prB4lhNzxgtL5
 IdvWodkx3BjVp1VZk8YC/0BvmoFHi25ioRN2If5ARSnBGks1Vfhjjl+BxWxUMSfoiG26
 HtI7KpSkvckM10TE74NfLcKzhACjrJxrL6azX6OEzG4BLfbvizZ+F2XOFFDqQu7U3Ct/
 mOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t+Wh+O8PRwTrRbk5kFdr3a/rSo7u8vOA5d9odhfiR14=;
 b=prONmxPC7p6dCTt0AEnmdJuyX3w2YsaJN8eSNPE2TiJLzALxbby0otriXN3n4lG4TP
 xUivWl13jdRo9oxr46o+ey5Qlwxv1790o5MLhf1ZEq+P/t4HM6OxlKsiSMcZ8s9kT8+0
 GIi1Fy8DOaPccp6ohhAIwi0R/Anh16Yoj9QBWTUlsTu/yrW4LXTnOqZgchA0yEJj1XOr
 a9pAS4p9qzSCDPH8TCazwA5GZGhIcaJoPEycdENUiJhUzh5hhah3ghf2sogvBvS41HC+
 qFWQRIfBW5xrWtlDlWj8Ny8KYMe2kq2ffnmd4ocar0s4BMqrOztUb0tOU74mJpgXfYlR
 KJWw==
X-Gm-Message-State: ANoB5pleQHyNjOO23cabgqH55Vq+IjU2Df7pSe8nI7Zp8po8odwt9lhN
 mguGv6Ztjvj9lcKeOuzb+QaKcA==
X-Google-Smtp-Source: AA0mqf5FwywbJZstRFly5MgLTHQOmnrNxgG1bb0++yQ1DsDDnUV6kjVmQp+5cJWWCy8cOwCS3g1TAw==
X-Received: by 2002:a05:6512:2005:b0:4b5:9043:2537 with SMTP id
 a5-20020a056512200500b004b590432537mr2133373lfb.48.1670489847665; 
 Thu, 08 Dec 2022 00:57:27 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a2ea226000000b0026dee5476d5sm2230773ljm.113.2022.12.08.00.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 00:57:27 -0800 (PST)
Message-ID: <d5e9f614-496c-b111-c9af-f180e16c40b5@linaro.org>
Date: Thu, 8 Dec 2022 09:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] dt-bindings: lcdif: Add optional power-domain
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Vasut <marex@denx.de>
References: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
 <1839665.tdWV9SEqCh@steina-w>
 <a033d9a3-4bee-d749-9bd9-24a419398d0b@linaro.org>
 <3212302.44csPzL39Z@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3212302.44csPzL39Z@steina-w>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2022 09:50, Alexander Stein wrote:
> Hello Krzysztof,
> 
> Am Donnerstag, 8. Dezember 2022, 09:25:31 CET schrieb Krzysztof Kozlowski:
>> On 08/12/2022 06:59, Alexander Stein wrote:
>>> Am Mittwoch, 7. Dezember 2022, 17:00:22 CET schrieb Marek Vasut:
>>>> On 12/7/22 16:14, Alexander Stein wrote:
>>>>> i.MX8MP requires a power-domain for this peripheral to use. Add it as
>>>>> an optional property.
>>>>>
>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>> ---
>>>>>
>>>>>   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 3 +++
>>>>>   1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>>>>> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
>>>>> 793e8eccf8b8b..9d9fb5ad587c2 100644
>>>>> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>>>>>
>>>>> @@ -52,6 +52,9 @@ properties:
>>>>>     interrupts:
>>>>>       maxItems: 1
>>>>>
>>>>> +  power-domains:
>>>>> +    maxItems: 1
>>>>> +
>>>>>
>>>>>     port:
>>>>>       $ref: /schemas/graph.yaml#/properties/port
>>>>>       description: The LCDIF output port
>>>>
>>>> Should this be required on mx8mp then ?
>>>
>>> I'm hesitating to add a required property later on. But I'm okay with
>>> both.
>>> Rob, Krzysztof: Any preference here? Shall power-domains be made required
>>> for fsl,imx8mp-lcdif only?
>>
>> I don't know. That's not the question to us, but to someone who knows
>> the hardware/datasheet.
> 
> I was not talking about the hardware, which needs the power-domain, but the DT 
> schema. Sorry to be not specific about this.
> Is it okay to add a required property for a compatible later on?

Yes, it is okay, assuming:
1. Linux implementation still works without it thus preserving ABI.
2. It is really required, e.g. device cannot operate without it (your
commit msg suggests that).
3. The property should be required since beginning, but we did not add
it due to mistake/forgot/lack of docs etc.

Best regards,
Krzysztof

