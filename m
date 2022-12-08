Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BF9646A71
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 09:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416FC10E470;
	Thu,  8 Dec 2022 08:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F195C10E470
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 08:25:34 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id l8so745215ljh.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 00:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xE8jv3PkuMLfTb6vfE6WECcl1fHHkR+JJYoxxEnxTzI=;
 b=foAOdHOyJB5et6qqqHy/AtQNtZkvyrfaUB+dd5lD3qGnhyuZqNG93a1MdOHXY6MeXn
 BjQjFc4iQ8CFUP8n72odAFiCZJ+rDkzZfDvQ8CYxzuAj64g1YjavbIsMc48V89aHwgs6
 6Ei6e9Ft56HsGD5bc3Mdh0EZRzDHyH3RszhUt19ZdPhF0w0Sl7xnefd4jyKVijUlmdW5
 emGC0NqKWSfPuC2d1V8MFfDLuPF8cZilf4egSnq68olLbZYjwa7NK5mYfQ9xfCaUc4Il
 MqCkgnhTpkQVZbIemGoSTVThWGsrhcKzzK/3cu/ADvvlcghMky1RrYsesJkJHIeyGC4D
 GyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xE8jv3PkuMLfTb6vfE6WECcl1fHHkR+JJYoxxEnxTzI=;
 b=XPRg1IOisNODWrph3jOnwcqhAPwi9yK0b2gef0QPE1qTJ3DUDuSDmBO3xtIbXMNxv9
 YzUPQQxO1NBWOkhMVyIHxsJGrmH7DrUM5yu6hqvtWGxoXgwC7MJoaOTxDnbg4HVZ4L+4
 ZXiFJob8tDOMglCZTJsbOrH9fsCiPBdT6YroJIPEOE35XUMbLG3hIG4Kz/xKu65gIVmz
 MGDlY7e7JTLjhe9LhsldZx8v6La8mAA0IwXxcaQfu5KThJ760pQZTHPzm1EVDBhJRsTV
 UbDvCOZMX+V0kajAn7s/SREJle80ZtzLcPlANM/chMZmSolFRp0wFKsqg9Ih0t089HvA
 GLZw==
X-Gm-Message-State: ANoB5pktqL4nU8Fl7xSmo+orGahBL0CnNUCM1fvq8tANKtGGoTrcyDjz
 c5euZtWV5VkmFadQhzQYq85l5A==
X-Google-Smtp-Source: AA0mqf4/MQ847e6F5ifIS/SX54WEmvMn0heImNI0WYKc/4M90aEB/+yIg6YSjxOM1SOpgt0dmSBmQw==
X-Received: by 2002:a05:651c:c89:b0:26f:bd61:ac4f with SMTP id
 bz9-20020a05651c0c8900b0026fbd61ac4fmr25339083ljb.396.1670487933258; 
 Thu, 08 Dec 2022 00:25:33 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a2e9108000000b0026dffa29989sm1901074ljg.23.2022.12.08.00.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 00:25:32 -0800 (PST)
Message-ID: <a033d9a3-4bee-d749-9bd9-24a419398d0b@linaro.org>
Date: Thu, 8 Dec 2022 09:25:31 +0100
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
 <20221207151400.1572582-2-alexander.stein@ew.tq-group.com>
 <00789ae3-7fd7-e662-6348-8a31a72ee589@denx.de> <1839665.tdWV9SEqCh@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1839665.tdWV9SEqCh@steina-w>
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

On 08/12/2022 06:59, Alexander Stein wrote:
> Am Mittwoch, 7. Dezember 2022, 17:00:22 CET schrieb Marek Vasut:
>> On 12/7/22 16:14, Alexander Stein wrote:
>>> i.MX8MP requires a power-domain for this peripheral to use. Add it as
>>> an optional property.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>>
>>>   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>>> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
>>> 793e8eccf8b8b..9d9fb5ad587c2 100644
>>> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>>> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
>>>
>>> @@ -52,6 +52,9 @@ properties:
>>>     interrupts:
>>>       maxItems: 1
>>>
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>>
>>>     port:
>>>       $ref: /schemas/graph.yaml#/properties/port
>>>       description: The LCDIF output port
>>
>> Should this be required on mx8mp then ?
> 
> I'm hesitating to add a required property later on. But I'm okay with both.
> Rob, Krzysztof: Any preference here? Shall power-domains be made required for 
> fsl,imx8mp-lcdif only?

I don't know. That's not the question to us, but to someone who knows
the hardware/datasheet.

Best regards,
Krzysztof

