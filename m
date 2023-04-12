Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C24ED6DF574
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC58910E7D7;
	Wed, 12 Apr 2023 12:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058E710E7DE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:37:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q29so10591991wrc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303028; x=1683895028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QebsCGR48dQEN2uFXsUDxTq2kX2uFhujVCCTxx6X6sY=;
 b=MqljV6uGnNg0RpDoTvPQA1io/EHrpJzhs7XUBX2amgvCE5Mzgp0AJmVxhKaRDXenLJ
 WJ43jNPRyGo4GWUp6O7mhRMQfxFhfcDiYlJCPa0iyf8WNWWv2tEgky4QWGIwxGO4CBC8
 9GEalqJsu/HUaZew2t7MzNMvYL5oKgKBI2+a6QwvXGiWrKKedhxzil1CDMCSjdZxCXm+
 kWY6LayVxs7VmFTs5zTc6pNhAX3Q73bD0WEU55BNrpbvoAbhJC+Q37dC3HpfGO8zNmOf
 2hulNe2wp74teE0V74njHy1PitX9XXI0EQ1Dyq7+WnkPBXHWkoB3w3n0CGJlpkR5G+xS
 l+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303028; x=1683895028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QebsCGR48dQEN2uFXsUDxTq2kX2uFhujVCCTxx6X6sY=;
 b=ex8y3cZ/c3qCui74j7n1fNsuP+h3yw4aSeUPfx7ZpkrASchhOvRIuqgOdBC3o/a3/k
 vjMMrCoIyol7bGzfwtNXXPG6X4s8g1q5eMuFcd0AZXTmgz7Q4ZiZYfvMR2YNM3RmQsea
 31+/T6EWKw/rbKAoQ6dZcRD11UBX1+U0syDAYfMHz2cD535cqDxRMvs+PS9d2/vVRcu0
 j8PFFElWOUAaOWqSJd5RVNzFbUsusnVn+pIjM/I1oxNgWg3fQEn/47BpJo3AHvygekNa
 Walz0VNP/i6XDZUWBrtdzzGiETIVVsKJIwOOjXB0tt4RUviVI7hjWklqnC9r31I0EH+8
 fMKg==
X-Gm-Message-State: AAQBX9cFlgGi2exJGg2uMOcjf4iTuHrdpO/iowjTHu2VxmkaLMPIAEYp
 AKkvz2cTvpJjBejLKl3ZvOk=
X-Google-Smtp-Source: AKy350bWhA2Bil03ULejXNLxks5rc0fhv1cWCYAwy/T1bRJDjG13T7QQBhah4FiuPHT0Czkz7Wlp4A==
X-Received: by 2002:a5d:4a86:0:b0:2f4:adca:6f42 with SMTP id
 o6-20020a5d4a86000000b002f4adca6f42mr1182963wrq.21.1681303028356; 
 Wed, 12 Apr 2023 05:37:08 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4082000000b002f0e1181a20sm8625307wrp.34.2023.04.12.05.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:37:07 -0700 (PDT)
Message-ID: <801c8013-23f9-a031-5432-32dc2ee222cb@gmail.com>
Date: Wed, 12 Apr 2023 14:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 09/27] dt-bindings: display: mediatek: color: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's COLOR block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index 62306c88f485..449b37c7560f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -35,6 +35,7 @@ properties:
>             - const: mediatek,mt2701-disp-color
>         - items:
>             - enum:
> +              - mediatek,mt6795-disp-color
>                 - mediatek,mt8183-disp-color
>                 - mediatek,mt8186-disp-color
>                 - mediatek,mt8188-disp-color
