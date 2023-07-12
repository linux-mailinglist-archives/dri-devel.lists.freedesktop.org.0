Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B617500A3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 10:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5D410E033;
	Wed, 12 Jul 2023 08:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF7310E033
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:02:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf15bso40769715e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689148921; x=1691740921; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YkIwyBsrrasbrw6SKcJzFKY+sZkplhIF1ednI0kruDo=;
 b=bDSyjqZU/kFai51bS4zMV7wkn6IN8baUYkKTFjyQ9VhethzeBGEkbszBcepIHQbhX/
 SR/g8PJirC6plcC2OT3jO68NN6EISfhUEmvt1ZcYlS/KOUSkMDDyzznSdhUpivM0iJrQ
 13i1l9cefjz5I67sRJQjmQxF2fa4P6dQ1xUf9knjRn5qTZv38166mojcNDNcHvXl6FfO
 ZPLuDOoK4MudT/YUB8wSHQ5pU5Z1S1Uo9G9e864mQVzsIieIc4ZhlEWbw2DVMhPKZv+y
 9pxVVcRTZpHSUgTEL4Ayjp11/BWLsAVT7lgVUza3wY3VczprtRt4N1StlWKYkVsvVF/d
 dVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689148921; x=1691740921;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YkIwyBsrrasbrw6SKcJzFKY+sZkplhIF1ednI0kruDo=;
 b=SQrhV/mW4IQbngW0UxNvRQ/uUn2KGANyQ/phTryg1TtFj6mywM/uCXYcEz/e8Zr1bk
 8gb8s3yLYoH81qh/SjG2HTwW5bEFMcTEQUUwRhwi0e82ZpGuktcC6NY2jYiviVPT6bAc
 sVhrTT4VFfnBdbB9gUjC8TSA2+beV1Yey7vghutgLoLhJ8r2I4bm524x8nCfPrPXE7hs
 Ed1NQAulxYPop5tGJliFF0OiwO5vA3Okn4R9t1H/DVuXpUduDpkQzB0lNvmh3rpckdYx
 5eSZCHaOrMMUfrqHDMPEhS3y95h2UBumzWzNrrJioaEfGVk2Rq1frqdWNvMkNU/656ts
 NpEQ==
X-Gm-Message-State: ABy/qLZzHCxdc0TjuvklfsRTlf3UTa+rSgEnHGbV1gkG3wW7nZIP9/6n
 LXACs1H9txCcZuHFhUdeiPePSQ==
X-Google-Smtp-Source: APBJJlFBDoZQA2YW3Bxt2cfhjxIimssHNv6+Ox3A25mufenbLcs3GAodp0BeuMoLjGNPDIVyI6916Q==
X-Received: by 2002:a1c:ed10:0:b0:3fb:b008:2002 with SMTP id
 l16-20020a1ced10000000b003fbb0082002mr18164102wmh.0.1689148920442; 
 Wed, 12 Jul 2023 01:02:00 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a7bc4d7000000b003fc02a410d0sm12536303wmk.48.2023.07.12.01.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 01:02:00 -0700 (PDT)
Message-ID: <a335efdc-2ecb-c25a-7507-5ef2e19c5ca1@baylibre.com>
Date: Wed, 12 Jul 2023 10:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: add startek
 kd070fhfid015 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
 <20230711-startek_display-v1-1-163917bed385@baylibre.com>
 <14bed951-22ae-4aa8-5fcb-b2cd92ebdbef@linaro.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <14bed951-22ae-4aa8-5fcb-b2cd92ebdbef@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Guillaume La Roque <glaroque@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thanks for your review

On 12/07/2023 07:32, Krzysztof Kozlowski wrote:
> On 11/07/2023 17:36, Alexandre Mergnat wrote:
>> The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution

snip

>> +
>> +  dcdc-gpios: true
> 
>  From where does this come? Which schema defines it?

It's a miss. I will fix it and reset-gpios too by adding a maxItems and 
a description.

>> +
>> +  height-mm:
>> +    const: 151
>> +
>> +  iovcc-supply:
>> +    description: Reference to the regulator powering the panel IO pins.
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: DSI virtual channel
>> +
>> +  reset-gpios: true
>> +
>> +  port: true
>> +
>> +  power-supply: true
>> +
>> +  width-mm:
>> +    const: 95
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - dcdc-gpios
>> +  - iovcc-supply
>> +  - reg
>> +  - reset-gpios
>> +  - port
>> +  - power-supply
> 
> Missing example.

I will add it.

-- 
Regards,
Alexandre
