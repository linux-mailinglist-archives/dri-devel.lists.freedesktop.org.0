Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102CC6E1E01
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CF710EC75;
	Fri, 14 Apr 2023 08:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B5510E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:22:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id j17so34051391ejs.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460561; x=1684052561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fw2soPX7gkqG1zLnlaxy4FPoDJm7h7PV5yPHWD0C8dE=;
 b=FrBtZn2JPfKSOizoc16x5zv6L6PMF/VKB3Zn5fwahF9n7Jh1kc0XqQRTqeKxD9x9MS
 3uUfhNpR4PY5Kx29WjjWcfkqmKDBR94YExPe0ZH82Vf5ApF1qG2Ln4aRvBFZysOhrsSz
 cp9lzWGm/qZIsDkxdC/6azitmGvqhEEhiGtu2Tp26b1y9oIoMgyuyekv6/h9SCepMtLG
 64hYxN8UllvZXSxqrgG4JOHoHVHRxyZY+HaYyquJuxGIltrOgiwix7JcE/jmYz1AbghW
 uEYXHqWhsbwiGhusGQgkORggwjpKOyE2AFwQp2bR6w3KIy7eWhE1jCL1KENx2B5S5BnO
 OTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460561; x=1684052561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fw2soPX7gkqG1zLnlaxy4FPoDJm7h7PV5yPHWD0C8dE=;
 b=Ioh5Y2DRUcosswv3tiwGDLvmEA/skbhM3IuhYPtYUzPn0DawgYT/H5QoGq2rR3E8Cz
 ks8wEXDgqIFFf54GMb7/gqk9CPfSKzH8UE7kF5z0/kmgGoy1nNAXvzQhZ7uQp9ZwpKga
 lgCuuenoBTeYIYbAu6GoFD6/gxkFnOm4riQTdTqdkQRlMO9cfddwLHnVxlqsf+c+HY8F
 DAWqeiyNKyXDYTTUOw3uwFzbRW68NFra6kTLrPCvvlo+ZgAmy+3MQQDUbmS196Qt/CRl
 6b1OL1JqYBd9DDNWLkcBki80aXIzOFypROMcHYTvt9DuBZZOBh4Kep+RpqT1xCySHwgu
 jRjw==
X-Gm-Message-State: AAQBX9fjIh1LtibJKVSM+h9NCZ/+ZsR++VVJVqNgvtKs1Y5Pwvd2C/Px
 uhRw6JS3FZjSYsCR+yUFndUvkw==
X-Google-Smtp-Source: AKy350ZR6VwGjvDTaRekH/cO9thuWBVNaSAvMXwGsd/aK6bK6v5XYCzSR5T9UaWUz/jtJ7hPHs8cFg==
X-Received: by 2002:a17:906:925a:b0:94a:a77b:363a with SMTP id
 c26-20020a170906925a00b0094aa77b363amr5558646ejx.3.1681460561618; 
 Fri, 14 Apr 2023 01:22:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 oz19-20020a1709077d9300b0094ebd376fadsm1486449ejc.144.2023.04.14.01.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:22:41 -0700 (PDT)
Message-ID: <223fcf60-25aa-e45d-159e-6290eeeb6a55@linaro.org>
Date: Fri, 14 Apr 2023 10:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek, dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
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
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

