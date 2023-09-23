Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9DD7AC3F7
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 19:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D924110E02A;
	Sat, 23 Sep 2023 17:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3495610E02A
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 17:34:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32172a50356so3778607f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 10:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695490450; x=1696095250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h8e4WOeV3uP0Avl4Q9o2tfB8fRCYhZPCMlDY4X+oryg=;
 b=dGtyMN91gfFWpKWMiYiioEh7sTt6MdglBgDxfev8GZt6O6SEW/ZS9wBe7HKjQY+3Bd
 jTD91ObwILoDizFIofCHS9Nrx09ItM3ijIzRJ4N2nmyrfRrX/xgaoP3DMWs5OpipH5mc
 pgqcLn9AqDdpptQ4P0afmgyg3PCuKTzyXSxGGY6OhKXAHdhcY4phdBK/zlzWunGRidG+
 2QGIkfAYnEqHsQus+WFugX7me6NrHgTRTlGPZQ26uwyXZ2PDdlM9hV49K+oXLuD35/V1
 XCyYF9HF2ajahmjlbU3IDysTImcEbJKjBVHUUv3Z5wv7hvRtBUqGENUxFdD0LZGsa/mb
 8Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695490450; x=1696095250;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h8e4WOeV3uP0Avl4Q9o2tfB8fRCYhZPCMlDY4X+oryg=;
 b=vjuog3ituwXdH94+2EpgFUw7mtlKSv4GoZmxvv7uQy6laolw/7wgT9hkuYP4ENuAyl
 8mb4CJlAiHhJPeEqyQEkOq6TlgSwSlMN/obwB/Pzk0aqzhKODwoOHA4SmpTrmRxy3jdN
 bAKWsxVi6jJ5qkO/SvCstkiL5SOuXACqAfKcuJjz207NVV1ClB4Edh/TNowK15aW8r4O
 0qMN6TPSjpZvCUpBkiU14W7fgabaFHNExwlc7ZVt96boU5zAnV5jfgpgbQVI/pwLcyGo
 kgM4Z3uT9un8z38p+d+K95WeuWlXIhtezxF47hW5UTn8PY69wYSiLeoBekZrbTbdEE/f
 wvpw==
X-Gm-Message-State: AOJu0YyBGdEYUrjlm1cCxySPTJ4cDTsfx4Y2R15OmDOhcA/jCc3rnxzj
 cgWl8rZmeFTvJMuD6LgFa7GZ5Q==
X-Google-Smtp-Source: AGHT+IGywFoLRHTpFCviFneYTV3hIVt1uqS6WEMAUjyo6HuW9R7DnOeXATYbyZiXoF0+vDPukj7PRg==
X-Received: by 2002:a5d:44ca:0:b0:31f:fdd8:7d56 with SMTP id
 z10-20020a5d44ca000000b0031ffdd87d56mr2347231wrr.12.1695490450364; 
 Sat, 23 Sep 2023 10:34:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a5d68cd000000b00321673de0d7sm7374280wrw.25.2023.09.23.10.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 10:34:09 -0700 (PDT)
Message-ID: <948a37c4-2237-8ec8-270d-8a704c8c4835@linaro.org>
Date: Sat, 23 Sep 2023 19:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 10/16] dt-bindings: media: mediatek: mdp3: add
 component TDSHP for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-11-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-11-moudy.ho@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2023 09:21, Moudy Ho wrote:
> Add the fundamental hardware configuration of component TDSHP,
> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> new file mode 100644
> index 000000000000..0ac904cbc2c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 TDSHP
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to improve image
> +  sharpness and contrast.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-tdshp
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

NAK. So you ignored all the review. Brilliant.

I am getting fed up with Mediatek's approach. It's not the first time.

Best regards,
Krzysztof

