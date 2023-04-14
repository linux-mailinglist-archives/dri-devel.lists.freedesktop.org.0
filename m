Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E686E1E33
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC43410EC80;
	Fri, 14 Apr 2023 08:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC1710EC80
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:27:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id fy21so771870ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460832; x=1684052832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FfV+vHgOiOTb/T8PGJETWUjU9ShSgfKqGb/lRZ9bS+Q=;
 b=TXtg+5vSMswTh++PcVMw4FZVIJqiJXwtBF4esfUNcovAdf/NpcKSjcUBpatbisjxWJ
 1m3+T5xQIJMtC6itqvIY24p8+E3w3ulSHduTDMIz6GS7nU6oZ44ajbOjyIS8bdz7mJpy
 qxNUKmIeFOHGKpcVhauyQ/Ct94cEDQNwloMkJQzoPNWXy8VK7wgirOKomhYBd05xfbsm
 6nFmgoLKnZN10M2aIP00kyw3jXrKfO5vThqEULTFKVKu367PJgNidsKBUcg0i9HVQsUm
 VlrXmuInv8FGw66mhBXkZPMxcFgx1eqLzoDO+PsZE4esAJ1vYNVK6veTbl+F6t7oVHkl
 k20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460832; x=1684052832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FfV+vHgOiOTb/T8PGJETWUjU9ShSgfKqGb/lRZ9bS+Q=;
 b=h3CwJU3aBTs3c0hj/ptIRk7QCZGTu2JPzv6LTkO6BQ7M/PmZVhYGsVWCaDi1EBOxHj
 4pEOEc6I6D+kgEgxdppO1cm4VRYfzXoDWOI2FaCRac3F0m/Vg3p1xqGJqRvhG01wad/N
 g54iAoRmiau40/XJUBEfx539E6gBVzpNP+nySsKSrNu7C1EAm0GNxRGVvlmQq3hpNnuV
 lP6OrIXpvlMgxPXBNcBYzmXGSVozGLQvWmO5LKIta+i+EaHFRFFOLN0GjK1/5/xgoUU2
 VFShthLGsPS8KmMKhf5gC4Pz+PbqwgJAZsTEHAKKmEeYg4KkNb8Pm1tp1tj0nmIOTF95
 NyQQ==
X-Gm-Message-State: AAQBX9civaQICvMg+aHKpbLrKm8vPcDbKEAF97j5K7Jl11DCZqZkio6J
 1iJJsrXlBtUrbz7xWyxT1RkRCw==
X-Google-Smtp-Source: AKy350bROMqGwlhCVGwl5H8OJ+bgHbDFNGXpnOwYOw4FLgadYWAX0xpuhZWD9cFLA3D4vEUtaQZhkg==
X-Received: by 2002:a17:907:10ca:b0:94a:5a9e:9da0 with SMTP id
 rv10-20020a17090710ca00b0094a5a9e9da0mr5236919ejb.77.1681460832272; 
 Fri, 14 Apr 2023 01:27:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 ss23-20020a170907c01700b0094a611b21a8sm2072758ejc.223.2023.04.14.01.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:27:11 -0700 (PDT)
Message-ID: <ca69a9a0-5abb-e3b8-dbd7-0389da955bd1@linaro.org>
Date: Fri, 14 Apr 2023 10:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 10/27] dt-bindings: display: mediatek: gamma: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-11-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-11-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's GAMMA block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

