Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B10D5B8FB9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 22:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8328E10EA0B;
	Wed, 14 Sep 2022 20:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748F910E9F1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 20:46:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id az6so12487722wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=m9bGoBe8wCBmkc6gud9Cy1Iqu9DMXje49H2FW2XThhI=;
 b=k/LW+8FU6dXTiCSildtV6+lus8xNFn/xqGPYUXzcghwZeYb6llePcT4d7wf0rZbEXX
 hyppBJay9AZGyBAsr8kHRkKFM0j9D6+yLwXVYrftrkWLHjzvaZbEH2dj2kRk5YGz+C4A
 jj6ktBTgFgGl0j5aqSOdDtqj3HMK43KfFdOk1FIneIRFyeNLS7YalGI5t3khH5lIgrId
 b5uD/UFf44ISwEcj9Q1OXjluUCNAYiu+0vT3jEZhqfyi4/i3zbLiurGcVdppBt3gDfvV
 GMUhEDVbNCshYWBKs85YZ4BsVeqk/duyZnAPsCHEwlQfcvOJxbEWW6kJDuxpHaqZ880s
 CWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=m9bGoBe8wCBmkc6gud9Cy1Iqu9DMXje49H2FW2XThhI=;
 b=4y6aRDyOjDLbFwScn4gPR8iBnGHvM2wmkCCzcWH55GJ39RWXzdDNHaof3JhC5nK3+6
 evyGIsj99IGD+ImknTjCHu3ulBS7q/pnRby+yJGW9dPexGi3mh97MrOi2zVKISJ6aPEN
 HFx+UtMtXcIcniMeiT2Vg3+kF/OxkgAzKQ8WOiH5sVmZOORg7VTLNHlGYBdIsg8P8RUU
 ScsWFF5L9QMZFSL3N39SviPPkEyAxAaVWROwCrnN6JrAyYDl0EEYAAcuKD8wawDlB5Gs
 pou/mN/U99m7DmvCJbkicjwf0IkFNaPyiAizLmP5wx2/k0CUnY52p11ynMgdF1jeU2bD
 jtig==
X-Gm-Message-State: ACgBeo3SKSv6Z6hesxhl4PF8x3ZDvaCVeYOWf6PHPN8EH/yM07JsrKAv
 7GsbpFEzFqZ9pWtoZ8leeec=
X-Google-Smtp-Source: AA6agR5j+dsaEcuIMXF56rsR2ctpU5gvF4j1nF5xUwvAX9FmtpqOU5JxXYVEgUIZukydfLNl1VMa5Q==
X-Received: by 2002:a05:600c:4a9a:b0:3b4:78ab:bae5 with SMTP id
 b26-20020a05600c4a9a00b003b478abbae5mr4551567wmp.114.1663188358968; 
 Wed, 14 Sep 2022 13:45:58 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adff2cd000000b00228dcf471e8sm215086wrp.56.2022.09.14.13.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 13:45:57 -0700 (PDT)
Message-ID: <1b3a880f-06a2-1865-3791-03021aa34175@gmail.com>
Date: Wed, 14 Sep 2022 22:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 5/5] dt-bindings: arm: mediatek: mmsys: remove the unused
 compatible for mt8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-6-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220914182331.20515-6-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/09/2022 20:23, Jason-JH.Lin wrote:
> The compatible properties of mt8195 have changed to mediatek,mt8195-vdosys0
> and mediatek,mt8195-vdosys1 from mediatek,mt895-mmsys, so remove the unused
> compatible.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index a53b32c0a608..bfbdd30d2092 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,7 +31,6 @@ properties:
>                 - mediatek,mt8183-mmsys
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
> -              - mediatek,mt8195-mmsys

Should be part of the first patch. As described in the review.

Regards,
Matthias

>                 - mediatek,mt8195-vdosys0
>                 - mediatek,mt8195-vdosys1
>                 - mediatek,mt8365-mmsys
