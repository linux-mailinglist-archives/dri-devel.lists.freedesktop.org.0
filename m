Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57F6DF585
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB2210E7C6;
	Wed, 12 Apr 2023 12:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FBB10E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:38:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso11149644wmr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303088; x=1683895088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d6wXzbihncvcxRC0lYLMU3KUwnKB3HO+StuX3H8os6c=;
 b=arIcxUv7A0B1RO+picV/yuY6t7RmRY6+5qH4Ts1uJHrZCltOnQkN//6EEcVVeuNoyd
 s2CalZ62oQ0lhT9948PMDOTCc7VfANNrKnEXKDnmTt5Y8WaOXH/Ah6z2wZ3PkhSp4qSk
 u8QJa1Q2erqT0t5MG53kb3upBZo4BNlTsti79f/hqvJxTtvCa1c7Wr2Euuke/tkd7Iaa
 X+Y4HEKJNyc3uhbjzPEWxLz8tldOJH9QBiV8iYTbVucNWkiLRAwnslwDsF/02sdXIKxK
 XPGWP+a5BxkJknwCFV1EIZzBYi0/Xa2j3vbcbtz5mmSWyOKN0dBgmnn0SL89+cxzLM+R
 DiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303088; x=1683895088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d6wXzbihncvcxRC0lYLMU3KUwnKB3HO+StuX3H8os6c=;
 b=MKNH6Y6vkzWlb4o2X5Mt1r8tSK/ThpUcCPSQp+C3RbsryYTg36J2iwIzB1/QHtXCih
 +cWHaAoZ/43N9itLXWMAPXHSRWZb7/JVjuwpti+m/mRVl6vf/gmsMumUgJH32m0Cr6MQ
 ELK31vCdk+Ll/nKgk1ktmsycB1mdO3DxGZUXNoI5YZQiJl9pRwhNDTM3mElhOmUb5da+
 JXCncv5I/mGAwOgd+HszniyafMidXlxhO7UJEbo6a6B6VEHkTorkT/RiOt4s1WW3AnE3
 IBwQR+D6kfyOs4scWqsbaJrFD5dIDiCu4vYY/KE1t0CZLH+VE+VSyiZR7h8JNApKdyKt
 7GKA==
X-Gm-Message-State: AAQBX9cwbYTQ+3qboZwHgb534M8Qr/MBJAs5x7RqpjTErix+gffeh0wA
 /4c+ZDTH8m/MMbUWk8+01mQ=
X-Google-Smtp-Source: AKy350bhfRzY5aSzG4wwinpVBd7GLK8Egpwb3dH450L2hyjxKWMM4P3MVEj7kxheu5R0ei+xUrknrg==
X-Received: by 2002:a1c:f613:0:b0:3e2:201a:5bcc with SMTP id
 w19-20020a1cf613000000b003e2201a5bccmr1804437wmc.33.1681303088188; 
 Wed, 12 Apr 2023 05:38:08 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a05600c45c900b003f09d51a4edsm2333476wmo.48.2023.04.12.05.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:38:07 -0700 (PDT)
Message-ID: <32ed4eca-106e-8c05-31de-881f7119f954@gmail.com>
Date: Wed, 12 Apr 2023 14:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 13/27] dt-bindings: display: mediatek: ufoe: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's UFOE block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> index b8bb135fe96b..282925a73804 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> @@ -24,6 +24,9 @@ properties:
>       oneOf:
>         - items:
>             - const: mediatek,mt8173-disp-ufoe
> +      - items:
> +          - const: mediatek,mt6795-disp-ufoe
> +          - const: mediatek,mt8173-disp-ufoe

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   
>     reg:
>       maxItems: 1
