Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8030D6DF64C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CFC10E70A;
	Wed, 12 Apr 2023 12:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D7210E70A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:59:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso11563199wmo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681304366; x=1683896366; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=erBuPeVrzFlZV2m3GTCAkkOKGldewGoCCeiRWUfnelM=;
 b=F3QYxAcPMEMt/kGu/5NByv+dQTgXrV0wu04xUscbtGXnLbiLeFOS1KcmYiIJBCWHYW
 7oGqnSz3qQQfm6CBdfszFSm6BbyNqp4yyoHQrIYbFACnz6HblmyOWwRe0nwB4lKOZQwy
 ZNcW4VyrkPYzIE/V5G0yoBj+CM/K7MeTre4/QK9FfLVkLXnUxrldAv2p93KDUBDQGTow
 wADA+CIo+H3OZrgzIEdbuB70UnXPDpErMTq2+KNu9gDKflwBNcOw+bDrQCvyHO2P3y9D
 8mgBG+FsHdrPy2AdWof8uN9KSgtRKoG+7Hr0aTXvEiWax2WW1iLo9S2QVEKHCYz5XyuI
 0Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681304366; x=1683896366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=erBuPeVrzFlZV2m3GTCAkkOKGldewGoCCeiRWUfnelM=;
 b=D5r1S4gZUORdVJpF2OtFOsgrhFDzrM7U1uiYlDjDm5HKeZNAEWa6Js1G6AobUXkl4i
 37Ve2QG7+uSV9ADs40/3kqm6rgSEVt7LJ1KnSp7FuFWdmWt8cwy3wu3a16Qiy6uvNWAo
 5Ly7m1FSO2fUr5CHc3HZ/KJCXlJtc2Uh+zhEgApr3ek1OUChdM2i7XTGn1z7tqYei9Vj
 2OdvCL6im2ZJ9gfCzRkxnxQntWqL0kF23WeY48bTfOddfJGJ4t6HMhQ3iCtv9H0p11u+
 d6llakq0JMnDhdMXzV5MhKkX5LGdt9++K0acNHGcq9WeiWmmg7Z3RDkAXplgl7X7Lbij
 qjcQ==
X-Gm-Message-State: AAQBX9cMzavzUXJWJMnIKaNJcybegSEG3EZ5df8D5/CbZcAIH+DfTrrd
 9SwDK77Ti44zmQJldNb87hGALg==
X-Google-Smtp-Source: AKy350bzixhPofoYl7nQAhHg2btqGdbmFdg6kAkDkZeSl6i/hQ1NZTJGFcOxcJQxrOqLzKHQWAZ7Vg==
X-Received: by 2002:a05:600c:3ba8:b0:3f0:5ed7:f859 with SMTP id
 n40-20020a05600c3ba800b003f05ed7f859mr2135365wms.7.1681304366135; 
 Wed, 12 Apr 2023 05:59:26 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c0b5700b003eeb1d6a470sm2305203wmr.13.2023.04.12.05.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:59:25 -0700 (PDT)
Message-ID: <20684378-cf3e-0299-d390-287b7bafbda5@baylibre.com>
Date: Wed, 12 Apr 2023 14:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek, dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
> the same DSI PHY as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index 26f2b887cfc1..a9f78344efdb 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -24,6 +24,10 @@ properties:
>             - enum:
>                 - mediatek,mt7623-mipi-tx
>             - const: mediatek,mt2701-mipi-tx
> +      - items:
> +          - enum:
> +              - mediatek,mt6795-mipi-tx
> +          - const: mediatek,mt8173-mipi-tx

AFAIK, it should be:
       - items:
           - const: mediatek,mt6795-mipi-tx
           - const: mediatek,mt8173-mipi-tx

Since it isn't respected above for mt7623, it may be tolerated.
Please, take this comment as a suggestion, isn't a NAK from me.

>         - items:
>             - enum:
>                 - mediatek,mt8365-mipi-tx

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

