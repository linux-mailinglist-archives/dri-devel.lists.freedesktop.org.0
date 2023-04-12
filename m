Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A676DF55E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4509D10E2FA;
	Wed, 12 Apr 2023 12:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F198410E2FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:35:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v6so10719634wrv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681302920; x=1683894920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GYHSgufQGPfsF5vAg0opMnss76My6NDOcEfiI+dOR3E=;
 b=Gdoo7jQaku69ktNF9SD+vwJOUXaz8W5CG7Iec1zVbexwiq0FwZblgy3P9YHsS+/YMR
 kfmWq9T6J5UD6nBDAbUk5kEsPiGt77owQYxonu+e4/WKERVILLYVpXKE2QCckV8J6Nt5
 eTmKA/Nvl6SM70odZp51QoDMPAmqMLBTffQhdENQWztVd5qXYxkI1XXu1vqLzLOC+f9d
 zwzyifpaIzunPEAIFP34jMT1M02huYUbZzo5rmO8yooQXCGQ7OFZUwtf509ajbqbtmIU
 6OHNDcqpu3ZMn9elbph56P1JeVoZL8NJaNaUJ6TMHfyRt7GIavnWBZIhrhz4JYiptJ/e
 GcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681302920; x=1683894920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GYHSgufQGPfsF5vAg0opMnss76My6NDOcEfiI+dOR3E=;
 b=8O7lwXQ71+8IuKXqXjNz14S1TuHScdQCW4+MLa2FgjguBIxkEX4vFGveRfqIgP3KqO
 UaNcFYDe00m1qSxogTHExswjdKnRx7xDna3MDRNDQIKDkS1/ZxzcY2aKApY8RuZ1fLxV
 uEsrc/64raOICeq8eE4UIGFBsn24vKJmFJivxbLw8LT8mEW9UiEdPCuVL5T+1fzg28ba
 DFS3h+8zET9Su9mlWnjO3PxjRVJz7GJk80HxY8fb31oPXTr+E4OcFTRAnQ5LPc/sa8st
 /QZW6DMvNVyEzaOGt5yJPbBW5OIJlEM+nog2moL5XwQxSgVZ86EA+NkuGm0DRjCIVBTr
 JGQA==
X-Gm-Message-State: AAQBX9e3FhACNlk0xrpWXnpg4NkXEvymJK1nlKMWrYzD6Q1PUO2ruZU7
 AqE0msDGlr08i9/CsBSvCP0=
X-Google-Smtp-Source: AKy350YJDBIXDYs4pLFPPdXIwXv2xr+tmhcoVzQ/7lfEPyTz8FT7yOyyA6AmK41Lu0ewaS+izRE8PA==
X-Received: by 2002:adf:e0c1:0:b0:2ef:b4a9:202f with SMTP id
 m1-20020adfe0c1000000b002efb4a9202fmr11506835wri.69.1681302919583; 
 Wed, 12 Apr 2023 05:35:19 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adfdec3000000b002f24db41f50sm7013909wrn.69.2023.04.12.05.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:35:18 -0700 (PDT)
Message-ID: <0416a00e-b567-1ae4-c49c-ec21e024ab0f@gmail.com>
Date: Wed, 12 Apr 2023 14:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index d976380801e3..803c00f26206 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -17,15 +17,20 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt2701-dpi
> -      - mediatek,mt7623-dpi
> -      - mediatek,mt8173-dpi
> -      - mediatek,mt8183-dpi
> -      - mediatek,mt8186-dpi
> -      - mediatek,mt8188-dp-intf
> -      - mediatek,mt8192-dpi
> -      - mediatek,mt8195-dp-intf
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dpi
> +          - mediatek,mt7623-dpi
> +          - mediatek,mt8173-dpi
> +          - mediatek,mt8183-dpi
> +          - mediatek,mt8186-dpi
> +          - mediatek,mt8188-dp-intf
> +          - mediatek,mt8192-dpi
> +          - mediatek,mt8195-dp-intf
> +      - items:
> +          - enum:
> +              - mediatek,mt6795-dpi
> +          - const: mediatek,mt8183-dpi

Shouldn't we declare both const: ?
