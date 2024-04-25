Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA3B8B1B27
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCF010F250;
	Thu, 25 Apr 2024 06:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jJpymnEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D62E10F250
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 06:38:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-34b1e35155aso685370f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714027112; x=1714631912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lHjKbzlAg7ZCvrMat5Fqytbf+Mh+26KkLocKS948pTo=;
 b=jJpymnEsUuX+FEKFitTNHy5Vm8BSKBPW02HI4SGQ0p7dvm2HjtM27Vo9XSETiyiamS
 h0iPTeBFAHLzxjJBJZ8x4EvhOjLFO2tp7obM3FiN8IHm6TWTKVVqazJSczWDeqHUsepe
 Mcx+iTEHaHVkKHFOYPy6aOPSmI5Psr78kmz8x+CuW+i52MWX9FklZ9xg3pSFFpIVPH/T
 hhd7qJpivSZC3+y1TEJjyVnIwArUYCc6TzcRa51HO1zTRLWuaIXsxlT029iJwyfUhSqG
 vaH1RmUWjLtqpf290Vu/SMb842IZbrBAweOgQjyTP+HTdOUbnwFfmWW2vvvXSUAGQYiL
 Z/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714027112; x=1714631912;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lHjKbzlAg7ZCvrMat5Fqytbf+Mh+26KkLocKS948pTo=;
 b=EZlLL7AR8PKLgbcSF6r3lu9ccENV/jzfW9xp1TXvgmoOB82N6kFaogihKaaozj6q5a
 rB3O2vDDyelTdShD5Hz1wuaC4RpfhtiW5EkCOqVFbuVCbwV1Mtq5ejgAxkdvXOBc9bLZ
 7Ia/IAObU1NI1Ip0duEfnKO7N1DbPHozEoSlqEU80d0PlubK/IF2Rwy2IlEw3lkM3cKA
 tmvyRz5hByZcedv2LnnkjM23HC29O2vUPyHyCAC7yzOkn6NUHCmOUxtTj9pB9ejDfSyX
 +OdMJ41AKuAFZT0k4Fs6PirP5lxGPI5dmDmmrudPaFX60BAlppqO+kdZni5NOWp7pT/Y
 tC8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3e71S9Q+tuYeOw8tTbSe2OkV1iSefPJesU4PQIFtJA4mRJpT1fX7DBOb9NzpcbdZci5xK53Oe9y9byX2XIDjL1uJNxem9RKbIvbNI0a5i
X-Gm-Message-State: AOJu0YzZK5NT485UeLKB6kbfuwxJZqd7/p6iZmph/2G8+2fAXgr0nOnI
 2SeT3+6VkskA+K6GXJOiKv15OUuU36hRsMZ9gzGABiz7XN/F8yyF1+k/KFzxW2k=
X-Google-Smtp-Source: AGHT+IGAV0jSkFBvjQwGcfN5R6cF2rleJPcC0UdBWzMm/ZOSgnWSL6fQgwLcT8Eyq4spq4H/nIW2/w==
X-Received: by 2002:a05:6000:12c3:b0:34a:d130:611b with SMTP id
 l3-20020a05600012c300b0034ad130611bmr3858845wrx.17.1714027112250; 
 Wed, 24 Apr 2024 23:38:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a5d6442000000b003479bec98cesm18858772wrw.115.2024.04.24.23.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 23:38:31 -0700 (PDT)
Message-ID: <b48d5d30-61b0-4c11-8afd-1c07cbe05400@linaro.org>
Date: Thu, 25 Apr 2024 08:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/18] ASoC: dt-bindings: mt6357: Add audio codec
 document
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
 <20240226-audio-i350-v3-3-16bb2c974c55@baylibre.com>
 <481abafd-33af-44a6-8460-068b4a85d764@linaro.org>
 <a8730bb5-4f51-4c75-b049-6f00e3de5855@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <a8730bb5-4f51-4c75-b049-6f00e3de5855@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/04/2024 19:07, Alexandre Mergnat wrote:
> 
> 
> On 09/04/2024 17:55, Krzysztof Kozlowski wrote:
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    codec {
>>> +        mediatek,micbias0-microvolt = <1900000>;
>>> +        mediatek,micbias1-microvolt = <1700000>;
>>> +        mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
>> Sorry, this does not work. Change voltage to 1111111 and check the results.
> 
> Actually it's worst ! I've removed the required property (vaud28-supply) but the dt check pass.
> Same behavior for some other docs like mt6359.yaml

Yeah, the schema is not applied. There is nothing selecting it, so this
is no-op schema. I don't know what exactly you want to describe, but
usually either you miss compatible or this should be just part of parent
node.

> 
> The at24.yaml doc works as expected, then I tried compare an find the issue, without success...
> 
> I've replaced "codec" by "audio-codec", according to [1].
> I've tried multiple manner to implement the example code, without success. I'm wondering if what I 
> try to do is the correct way or parse-able by the dt_check.
> 
> If I drop this file and implement all these new properties into the MFD PMIC documentation directly, 
> I've the expected dt_check result (function to good or wrong parameters)

Yes.

Best regards,
Krzysztof

