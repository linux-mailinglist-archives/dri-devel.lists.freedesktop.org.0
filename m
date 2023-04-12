Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF4D6DF573
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6053F10E7B5;
	Wed, 12 Apr 2023 12:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBC810E7B5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:36:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v27so1521118wra.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303008; x=1683895008;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5+yJqelcjnVJsBvuc5XbMPT6WJPDQKryMhB4y470pSo=;
 b=LLjqDK8tdTHUH7mzFIFmfQT8xQyuLtVYbmR7OQrKeNzsqHXLj5BBQMhtKqzkyUOumi
 Sn/FVrn77yRrZUvVN/HJuEHXk/hHx7wn1bvjgdWUlsHOf/xX2c58NYs7Pb4IjjyABuXJ
 w3agsCkggYVx3P+20Poa/ChhqMclxJlCHVv6UQRDUKXEyh2AO/A2pJg8bMu868T2DGa+
 hhoq5XcdPPbLdXlR/sjZKqdDnicTwRtks9MloCIznQD29X6PMwXA0qlZEltcag2yqo0k
 qPm6j05xWOMfFQ7zE8JislSdbLHAMo8LpDUZSfG5aZy/z2WIvaDc7lTllYO7QMVQsCju
 InTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303008; x=1683895008;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5+yJqelcjnVJsBvuc5XbMPT6WJPDQKryMhB4y470pSo=;
 b=eweZcis3QmuqS++ASJkk634yflkASTeHZyTrHjF2DDll7sLP1JM7W/AXPExKNb81p4
 yE58J6bCoRgj12Ky6w6L2am2cieKAoY3xn2zQIMCKJseG/u/CqMbKhQuq0V+qgc+lJUF
 2PZw+iH7L0s6XwcY4k3dk3NSbCuETpd88KNqBqGz2yCtedWLHS5EJ9E31pdzSUOD9gyi
 Dq65936nDilphn9Kri/y3Gfm0Op9pVEEvnwy6Tv8JcN9wbc61nUChj+z2gpEVbiGbj2z
 ZBupbEIMxQqhOW3m7bFM2lJOFk9K2PlPa8e9Q+sooA29zkHAqZfndB5/mrXuBF90XDa2
 YPDQ==
X-Gm-Message-State: AAQBX9dFtxluhXMfpAiVebjbXM/q+y+bH41fEJ29EGR+EpVQsepXzCQn
 CRXLlaVEIvwYbT68IsIq31s=
X-Google-Smtp-Source: AKy350YfaWPBQRxXe37/4nw4RvtdvOSXPdUuUJj6f7mSjFILGvCzsrsicMkzLrBGLQ3m32F6fCsuGw==
X-Received: by 2002:adf:ec82:0:b0:2d7:67bc:344a with SMTP id
 z2-20020adfec82000000b002d767bc344amr13517948wrn.37.1681303007626; 
 Wed, 12 Apr 2023 05:36:47 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m8-20020adffe48000000b002c55521903bsm17181465wrs.51.2023.04.12.05.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:36:46 -0700 (PDT)
Message-ID: <3e8c6b55-5b5e-5141-8f63-d7f0fc7d1699@gmail.com>
Date: Wed, 12 Apr 2023 14:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 08/27] dt-bindings: display: mediatek: wdma: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-9-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-9-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's WDMA block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml    | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> index 7d7cc1ab526b..1a19b3ef036f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> @@ -23,6 +23,9 @@ properties:
>       oneOf:
>         - items:
>             - const: mediatek,mt8173-disp-wdma
> +      - items:
> +          - const: mediatek,mt6795-disp-wdma
> +          - const: mediatek,mt8173-disp-wdma

:D

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   
>     reg:
>       maxItems: 1
