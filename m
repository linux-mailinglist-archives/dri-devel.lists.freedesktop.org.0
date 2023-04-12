Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1616DF556
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4612710E7AE;
	Wed, 12 Apr 2023 12:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FE710E7AE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:34:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso17052627wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681302873; x=1683894873;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eY38QovBO9X6brYLqxxxjQBNRV1VBzhniRNPrjrGVZU=;
 b=fmZsiHj4rx9xq5FQgOmOXXcMbHU/E0WtOfVdbUc8+/vCn2M26CpV8Ek1O40/kkrWEi
 6zMJDO5HcE660BAUn/G/QDSuh2gBMfU2cw6cyqL8o2NhawqkxGwQ7pPopcs2lBY5HuYx
 V7B8DOHQWR+5JsQYup6pv5v7W29eqmYY+B3IrwanVAdzSY1wx6NTATHVfYFNfMDJC9X/
 0+GEUiksr0AZa+EI+SRN79aBlMgcgPNMLkTf+YnmKZ+q+T78X+fZKV1M6tPm2FSWQSrQ
 YloSPAcWSSJQkVX0MlpguqUpaYZxw51vAKtrGBbjWA7gFpMz/D2gsbFSSl5VU95KjoWE
 dO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681302873; x=1683894873;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eY38QovBO9X6brYLqxxxjQBNRV1VBzhniRNPrjrGVZU=;
 b=4H30hfFNqs3hwf8BSR4U/cvmnksinoji+VXhQtK40/PwB2bpeRE95KobxMyQJsV/AK
 9AnDq6N5iTtMCgcWcJVwSqZqR/mE/Wenk8ofo5ydbFEwcehy/CppWj8W+0yuAU85J0VK
 lliya0V9bcn+iOadEcLmdFLqd1pEW7/Yc7+Vf8yeHOAGa1YwpTtiiQ4c3e3lMaScB8QI
 XntKISoktgtwTvV1qPNBWo3AQwvq4yMov88sm/h/Jl0VdGwLAkZZSODqkCRK2C53mK3q
 4CmG//IN+eutO2PW6uCSYDEYv5cKniBt3b+mPsTnq3EhVuofTjNCXyB5JmNYvG/SiP4n
 vtlg==
X-Gm-Message-State: AAQBX9cA74+2mrKm1oRsRMZYUpiXLgY+5En2c3pyTadwZnpOWsy7MZc4
 SXiix191ly5OZO+QJ+hpmy8sDM0XT9PVmQ==
X-Google-Smtp-Source: AKy350bGRvf/Hjw+RYU3A7cGvEuMBp8eO5w3pbAUHmtpQjt3TNMecIwKpO6IParEHspcLI6mD84xZA==
X-Received: by 2002:a7b:c84c:0:b0:3ed:bc83:3745 with SMTP id
 c12-20020a7bc84c000000b003edbc833745mr1856609wml.25.1681302872837; 
 Wed, 12 Apr 2023 05:34:32 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a05600c218200b003ede06f3178sm2223361wme.31.2023.04.12.05.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:34:31 -0700 (PDT)
Message-ID: <7adda7a4-99e6-f3a9-22c2-6f4e1e2273de@gmail.com>
Date: Wed, 12 Apr 2023 14:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek, dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
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

I suppose you expect more SoCs to share the same fallback in the future, apart 
from keeping in sync with other comaptibles described here, so:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>



>         - items:
>             - enum:
>                 - mediatek,mt8365-mipi-tx
