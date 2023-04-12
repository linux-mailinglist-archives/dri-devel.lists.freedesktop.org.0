Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990866DF56E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E3D10E7BA;
	Wed, 12 Apr 2023 12:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3110510E7BA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:36:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v6so10721807wrv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681302963; x=1683894963;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wE7N70141Au9hlevZXAZoj6fncNpv5mG2/2AtTaaiCY=;
 b=NEcoZuzS8P4iLio4nXH/fPKA+WVpnLFtlrKOnIPIT3Hx2KjonjAQrokGpRwlwnOBGO
 bGLkPeH7icTnEBAVVxA2h5hVZ/1gQr30E7WY8UkQUX7V3g/i1ZR3jOpLBmCjnONzLIqC
 p+1OB+B2Y9WPOSeoN4GbT1ZuCIZaYDEw8spi4Z8ZyVEtkGNDLFEuM0hEDHsgjQZFOKN+
 3zjg0YwBt3OUh20M6jYtvdwRP69s7PEMPcGL2c0bvNnWZCQFOgyvdvYS6OVvygJMRzR7
 5RAtXlaNgLtQpZeh2eBC2qzZ3blTgUd8gC3wOngl0DnYAfrFQ3N3kRQ9qTWHHc79qnlr
 J2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681302963; x=1683894963;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wE7N70141Au9hlevZXAZoj6fncNpv5mG2/2AtTaaiCY=;
 b=cMLA3FZzZ5o12ujxOO0NuTuJN9lRvKnfNVyTPbI1YycXjo1AQ0sa6gvdALscXwIFuZ
 PEmyHT5/Brqyet7f0Un7ksPjjeke2RYG6eK4kF+a8gck9vUtN4uic5zpqwyy2ENQgjfV
 qiDK+coVj5MmA6G346+T9HEIcfF5zkI/PTCe5rkjXAyDRrlVzw3JWswB9m3GJbz8AXQ0
 QNeOqIgpB/QRs0mp7nmo0CLuVlz2zZvvWoHfP0rmbFo2on+xAOksSOZ/6dNwVSNEoag4
 LqwxyBZ52jLELgWSFeqs6edl97SvovkWLuZR2t82SG5DAY/4kguEAO8DORJJQgcvysvu
 C7vA==
X-Gm-Message-State: AAQBX9f4MlzaC0pN0pmNiloa/1+Il9mYRnu6cwfJsifwwPzXDvdR8lHR
 +As3+HT3grrL4dzlBFODy5k=
X-Google-Smtp-Source: AKy350aeuLyAiDRCHx8WCMaCn9uP+PuosubsGjcr6o2UO9HCVUKys6W1CjIDSWkAVTjaxq4gQgUTDw==
X-Received: by 2002:adf:e441:0:b0:2f1:d17f:cf95 with SMTP id
 t1-20020adfe441000000b002f1d17fcf95mr7353387wrm.12.1681302963216; 
 Wed, 12 Apr 2023 05:36:03 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a0560001b0500b002cfe3f842c8sm17040059wrz.56.2023.04.12.05.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:36:02 -0700 (PDT)
Message-ID: <b9424113-f812-2f2d-5068-b04bb789e0de@gmail.com>
Date: Wed, 12 Apr 2023 14:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/27] dt-bindings: display: mediatek: dsi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795, using the same
> DSI block as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../display/mediatek/mediatek,dsi.yaml        | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 4707b60238b0..12441b937684 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -22,13 +22,18 @@ allOf:
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt2701-dsi
> -      - mediatek,mt7623-dsi
> -      - mediatek,mt8167-dsi
> -      - mediatek,mt8173-dsi
> -      - mediatek,mt8183-dsi
> -      - mediatek,mt8186-dsi
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dsi
> +          - mediatek,mt7623-dsi
> +          - mediatek,mt8167-dsi
> +          - mediatek,mt8173-dsi
> +          - mediatek,mt8183-dsi
> +          - mediatek,mt8186-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt6795-dsi
> +          - const: mediatek,mt8173-dsi

Same here, why not const?

>   
>     reg:
>       maxItems: 1
