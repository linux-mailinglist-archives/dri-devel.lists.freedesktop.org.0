Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4437489DFC3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479D110E859;
	Tue,  9 Apr 2024 15:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LgWme/eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9499410E859
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:55:47 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a51a1c8d931so529262166b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712678145; x=1713282945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4zDFe+SJOHdCWHBOFhw/wvJPaYDwCUjUbFRmrHFT7xI=;
 b=LgWme/egTDr/YziF25vlDMJ6hXqGIjLiEPXrpDcvFSM1BB+tARU84/j1DsfjhN1TvQ
 fg2YQETbhDH9lnLjMK1gl/mna4wPtlIwJ+zj19zNHDVPVuxOPVnDjJJHIi8ShdNyaw9T
 7KixsWBN7AGcCgNiVWCeXpSKYIJHRwkIByjTc8AC8FDufHwERuOVpURrNSldyEbL2N3m
 fqFeHr2nkXpnwZM/LPSUv6Dr0VIJmNLg3azSjAuB+AsqmdgH/+6Z2FO8kk7/RsnNu3Bh
 83b3ilrJZQ4/I+kKxE9ulTl3vnmoSWl/MnIeK0Q9960WbqxrW12yhJb9WbTeq+cM9DOr
 yAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712678145; x=1713282945;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zDFe+SJOHdCWHBOFhw/wvJPaYDwCUjUbFRmrHFT7xI=;
 b=NnMj0fWFPMDo+bCN5IQPaqQ8m+d+x8d+qMenMT234UPlJ9h8tSu4x53mekgZHoLFmP
 TLxt1HRV4itBqTeTU2eMrGSv/fDAHtJ8JYe61NiKdYldDVAaif+a0QGa3/7yeedJsRMt
 /uDeJQ0YwnodNxUROdOt+yil6kM20o+F07AuKyr6Gv1kGsYMTa79z6bG17AKtys+vTkN
 WRHZOgcHguZTs09FVZ+xe+YMKIR+0VJd79LdLBJNoLQjwoklnUJ/vtxRIX39y9SGjQig
 Tetk8D+G2CSjTHq7Go4gTN2/YqtMXSGUSnya+Ioh4GmspSuc5ChWWanhsDvajRIixZPB
 D0DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmeOE8datP3JshOSCuPcZ1NNhmQteLvCp6UkiPPLsmXTEdRT610KXJCZ7AnYUIZKxj36TSOUqBBBule0tNdhKUNKNIleB25D5CB+T7ZTRj
X-Gm-Message-State: AOJu0YzEfVFmZnKfFA4TqZ3W1FHPCWDhoQrA1d1r0/PjxgYBZurbNDHc
 +WxwzAnklmUAnp9UUY+Aj1gXBtkTm1orLVwn0jphayqLyy1F1EKm392piw6hJ4s=
X-Google-Smtp-Source: AGHT+IENY+948bK5WfWlPqf5keCbB+LeNzCM68n0PMclNi34psfNLCR/L4zknT/HYkHYWQfMeiEAQw==
X-Received: by 2002:a17:907:72c2:b0:a4e:2570:ff56 with SMTP id
 du2-20020a17090772c200b00a4e2570ff56mr10325798ejc.0.1712678145523; 
 Tue, 09 Apr 2024 08:55:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a170906255400b00a51cd604c4bsm3476656ejb.149.2024.04.09.08.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 08:55:45 -0700 (PDT)
Message-ID: <481abafd-33af-44a6-8460-068b4a85d764@linaro.org>
Date: Tue, 9 Apr 2024 17:55:42 +0200
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240226-audio-i350-v3-3-16bb2c974c55@baylibre.com>
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

On 09/04/2024 15:42, Alexandre Mergnat wrote:
> Add MT8365 audio codec bindings to set required
> and optional voltage properties between the codec and the board.
> The properties are:
> - phandle of the requiered power supply.

typo

> - Setup of microphone bias voltage.
> - Setup of the speaker pin pull-down.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/sound/mt6357.yaml          | 54 ++++++++++++++++++++++

Filename using compatible syntax, so missing vendor prefix.

>  1 file changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt6357.yaml b/Documentation/devicetree/bindings/sound/mt6357.yaml
> new file mode 100644
> index 000000000000..381cb71b959f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt6357.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt6357.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6357 Codec
> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  This is the required and optional voltage properties for this subdevice.
> +  The communication between MT6357 and SoC is through Mediatek PMIC wrapper.
> +  For more detail, please visit Mediatek PMIC wrapper documentation.
> +  Must be a child node of PMIC wrapper.

Why?

> +
> +properties:
> +

Drop blank line

> +  mediatek,hp-pull-down:
> +    description:
> +      Earphone driver positive output stage short to
> +      the audio reference ground.
> +    type: boolean
> +
> +  mediatek,micbias0-microvolt:
> +    description: Selects MIC Bias 0 output voltage.
> +    enum: [1700000, 1800000, 1900000, 2000000,
> +           2100000, 2500000, 2600000, 2700000]
> +    default: 1700000
> +
> +  mediatek,micbias1-microvolt:
> +    description: Selects MIC Bias 1 output voltage.
> +    enum: [1700000, 1800000, 1900000, 2000000,
> +           2100000, 2500000, 2600000, 2700000]
> +    default: 1700000
> +
> +  mediatek,vaud28-supply:
> +    description: 2.8 volt supply phandle for the audio codec

Supplies go without vendor prefixes.

> +
> +required:
> +  - mediatek,vaud28-supply

That's basically no-op schema. I do not understand what you are trying
to achieve here.


> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    codec {
> +        mediatek,micbias0-microvolt = <1900000>;
> +        mediatek,micbias1-microvolt = <1700000>;
> +        mediatek,vaud28-supply = <&mt6357_vaud28_reg>;

Sorry, this does not work. Change voltage to 1111111 and check the results.

Best regards,
Krzysztof

