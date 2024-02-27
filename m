Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3155C868BA6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7039E10EED2;
	Tue, 27 Feb 2024 09:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XejHdFd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C026210EED2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:06:46 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so754331766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709024805; x=1709629605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aWMOyAMGj4BPUfVQH/f9CThvYEhtc8ZUIoj4aNclbDw=;
 b=XejHdFd8sZUtHvyF8MFTqUATJTbEOf2CBqMU2hHEYbiAywgzCozXUA4+a3QCepvfLk
 Vs3LQWoN8zvTP8hn7g1+3BYidcUXLIvW8Kv3sGgUGLac2tnz5m3VdlAh6Ok6JpGUxedK
 Qqqq21dSnOVGSPFcwLzOQQ+WXfK+kb70CRaA0m4qcgvDrc8dlsRhYgLsH0DENSThzugW
 XnpqvuIG1zd0EdrfKVlfmc/9YxqkdlSE0vLhhvUKuMmbtpmtrUacv5ckdGLCAsu/Zk1x
 tFfESRyVuGNaiSWIrDTYffe3k5Hh7AkLIcru5tTEJECfP7Mni6mHn+fM5aMbtYNF+NOO
 iAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709024805; x=1709629605;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aWMOyAMGj4BPUfVQH/f9CThvYEhtc8ZUIoj4aNclbDw=;
 b=JC6EPh8VrWYzrGQizLf0d8Kkkj6r23VfbiFZMrqFxpQrFIBz56ZJhRKmKh/kmBoZRI
 fDEuP4OKVazjHMz7ST2FKQ5wKiibUR7C10g8b8EVjvcunEG2ZVJ4Z1qM6Q2r9rsdvI3C
 nqPXfFdYx1Z9igIPRaa0KtpLaZ9KMz5wn9rUgk1yAfQq+8ZcePvv23H4ajA3Wvoa/tEw
 t1h4Sx4gkS6JBLrbbyeeKqOjoDuh+VQDvqiUuo7fIjR3Oz9W9geojVo4kJtqg93B19A8
 ft7qjM76snJFiZhJY5vyqRgvCG0eljq1azwAUQwsmP54vt6+hJpYSG7yoUcauAg470ju
 3L6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuh34xA5+d3gLenRwBT6yKDZhmO/F1ZR4xk21ashxcdVqFJzko2VlSB+695rDDhiHrHMSgJzkwWKIluHeSvtZ4Ng6A3o9W6COejixGNXqq
X-Gm-Message-State: AOJu0Yz1opux3BQVHcwfXmAzAzara1wz1c+VlwvxPEspcH0VhoeYLSrD
 r6B9mypv9HXEa5A5Tjq8wVQ2h8547Q+RmsW6Yzhy/iPYHSAV1WMU6pwSRBvXe+4=
X-Google-Smtp-Source: AGHT+IEovXgAKdcS8TSAMgvRMulbwgj3LkU/1bchkBdxalI2nz+zFL8jWTP4iUK9IOgaIRhW10dMuA==
X-Received: by 2002:a17:906:4a4a:b0:a43:a1b5:66f with SMTP id
 a10-20020a1709064a4a00b00a43a1b5066fmr1249287ejv.10.1709024804807; 
 Tue, 27 Feb 2024 01:06:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170906719300b00a3e92467f22sm547354ejk.163.2024.02.27.01.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 01:06:44 -0800 (PST)
Message-ID: <16739065-4187-4e51-b7f0-4a55de101744@linaro.org>
Date: Tue, 27 Feb 2024 10:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
Content-Language: en-US
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-2-4fa1cea1667f@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240226-audio-i350-v1-2-4fa1cea1667f@baylibre.com>
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

On 26/02/2024 15:01, Alexandre Mergnat wrote:
> Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
> new file mode 100644
> index 000000000000..f469611ec6b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8365 sound card with MT6357 sound codec.

Drop full stop. This is title.

> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description:
> +  This binding describes the MT8365 sound card.

Say something useful. There is no need to say that binding is a binding
describing something. Or just drop it if this is obvious.


> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-mt6357
> +
> +  mediatek,hp-pull-down:
> +    description:
> +      Earphone driver positive output stage short to the
> +      audio reference ground.
> +      Default value is false.

That's obvious, isn't it? Drop.

> +    type: boolean
> +
> +  mediatek,micbias0-microvolt:
> +    description: |
> +      Selects MIC Bias 0 output voltage.
> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]

0 is 0V, not 1.7! That's total mess. You use here microvolts. Look at
property name.

> +
> +  mediatek,micbias1-microvolt:
> +    description: |
> +      Selects MIC Bias 1 output voltage.
> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8365 ASoC platform.
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: aud_default

Drop redundant parts. aud looks like block name.

> +      - const: aud_dmic
> +      - const: aud_miso_off
> +      - const: aud_miso_on
> +      - const: aud_mosi_off
> +      - const: aud_mosi_on
> +
> +  vaud28-supply:
> +    description:
> +      2.8 volt supply for the audio codec
> +
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    type: object
> +    description:
> +      Container for dai-link level properties and CODEC sub-nodes.
> +
> +    properties:
> +      codec:
> +        type: object
> +        description: Holds subnode which indicates codec dai.
> +
> +        properties:
> +          sound-dai:
> +            maxItems: 1
> +            description: phandle of the codec DAI
> +
> +        additionalProperties: false
> +
> +      link-name:
> +        description:
> +          This property corresponds to the name of the BE dai-link to which
> +          we are going to update parameters in this node.
> +        items:
> +          const: 2ND I2S BE
> +
> +      sound-dai:
> +        maxItems: 1
> +        description: phandle of the CPU DAI
> +
> +    additionalProperties: false
> +
> +    required:
> +      - link-name
> +      - sound-dai
> +
> +additionalProperties: false

This goes after required: block. See example schema.

> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +  - pinctrl-names
> +  - vaud28-supply
> +


Best regards,
Krzysztof

