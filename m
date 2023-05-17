Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B05D707255
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82ED10E464;
	Wed, 17 May 2023 19:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C777A10E464
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 19:38:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso2195615a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684352298; x=1686944298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rYmCHe0UBx3C/dX8F6gPo606NtkPLb/fdOD1RWdJzkg=;
 b=bbeQg4UD9JQf6erRpGuPGkJefSXLT4EZPw4GEbdgBk0mXwtrOrR9bcUXhDi2lPmrN2
 SY7yGEyaW4rOcHsYnmhfbfOIS6WJ1P72cT7qjNOpW9e9rc3FGcQFKOsbTXyqHZrtQ899
 lqRpczEhCKHYqw4X4HXrLygrQOA/mDNmvSVqGhyLDEWHWAB/zQr8JeHGMe+cc++jTX3+
 eSn13zJdh+MYPqS1jaJc+8KRvKuuUOk4u1xn97NQgP9w5RgbAMncMp8edZUiMeKMhSn8
 2tX7xLkDwu4v49tQ/OTjPCt9qR94Xz6440yAu01sLictaBqTjYddsFD9G6rN0sIRFkMS
 RaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684352298; x=1686944298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rYmCHe0UBx3C/dX8F6gPo606NtkPLb/fdOD1RWdJzkg=;
 b=ZmCvQCNE4xB2E1Q6gLkC7pISbM+qIlnRNvLon0iEPzYQZkrLKxz/bFh37tiYNjGiR3
 91ngSge61QXordKxcut0AKOX5uZPThc0+bCv0qRgzppg2CEjIPShVaL2k8B+MTuZsefb
 ODHXpwbOlRvoP08Vv9IN5EKO6BA86npjwp18dfw3tJmBbpqaAm4J7Cu0phdHoJ9D/sZw
 dokQl0x0CDzdTsbiB9WpTAznJyOYF5flKwPUXxKA7qyEfLcFhUL6nhF+HQfHKrBGSjS+
 SK81RLtvj3cac/8WR3qxLaTiIDCFxsb901gjAbLySXmzmrcBx7R2fAbHE7XM2Khi0tXC
 yP7Q==
X-Gm-Message-State: AC+VfDz3zvBlAIfHJw7S6GeZ6vDcqrLLYIkq6+C4vZoh7DWFMg7lpuRH
 eVHbmOmZlQT0pGtp6IxGBWmCktr4A4M+Q9UgcyNejg==
X-Google-Smtp-Source: ACHHUZ6obEbka8NNsbD0h9cxmp9F7B27iNr6Z+hy4ts3KoIhfXd8UU80M7LYR8OdkLm5EMLFayAcTw==
X-Received: by 2002:a17:907:97d0:b0:96a:2210:add8 with SMTP id
 js16-20020a17090797d000b0096a2210add8mr25616124ejc.8.1684352297680; 
 Wed, 17 May 2023 12:38:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7a:e7cc:21b3:c435?
 ([2a02:810d:15c0:828:d7a:e7cc:21b3:c435])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a1709067ccf00b0094f23480619sm12833636ejp.172.2023.05.17.12.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 12:38:17 -0700 (PDT)
Message-ID: <f0469fcb-a1ef-77a2-a8ab-40ab8d91bff7@linaro.org>
Date: Wed, 17 May 2023 21:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517145237.295461-8-abailon@baylibre.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 16:52, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>

There are so many errors in this patch... that for sure it was not
tested. Reduced review, except what was already said:

> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> new file mode 100644
> index 000000000000..6f432d3ea478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AI Processor Unit DRM
> +
> +properties:
> +  compatible:
> +    const: mediatek,apu-drm

drm is not hardware. Drop everywhere or explain the acronym. If you
explain it like Linux explains, then: drm is not hardware.

> +
> +  remoteproc:
> +    maxItems: 2
> +    description:
> +      Handle to remoteproc devices controlling the APU

Missing type/ref. Does not look like generic property, so missing vendor
prefix.

> +
> +  iova:
> +    maxItems: 1
> +    description:
> +      Address and size of virtual memory that could used by the APU

So it is a reg?

> +
> +required:
> +  - compatible
> +  - remoteproc
> +  - iova
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apu@0 {

Where is reg? @0 says you have it...

> +      compatible = "mediatek,apu-drm";
> +      remoteproc = <&vpu0>, <&vpu1>;
> +      iova = <0 0x60000000 0 0x10000000>;

Why would you store virtual address, not real, in DT? Let's say you have
some randomization like KASLR. How is it going to work? Drop, it is not
hardware property.

Best regards,
Krzysztof

