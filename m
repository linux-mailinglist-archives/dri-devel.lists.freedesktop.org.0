Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C974A7497D0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 10:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00B410E494;
	Thu,  6 Jul 2023 08:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC55B10E494
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 08:58:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-992ace062f3so54527166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688633894; x=1691225894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fayqxLh/vco+SYInwt83ea7CX6FUWQU2usKrCQ013+k=;
 b=SUHGYVGhzR4ydLLC3EczqM7/h6WyxuOP9FR5zKpzrxTsJrLh66qKsFCYMxex/QcrLA
 NL1nUlWdl/RfC8wWgtBQ8KNBsAo260fgTZiWgFlMcI87P2w/8QIco1+PtLz/axGfoTm+
 eBfGmx37NrrgCwr5DHiABlwgUon4P+36PgEuG0ZrDSjrWRh1XmZsU76R9A0bQKCd6jPK
 46+5Y2uagL6AOS32r/MpE47o2Yfr0kJF+UPbjFWGtQs9apRKiwsjRvRP8AoCuJirPihn
 5/FRjQH7uPix9qG760X2c+BNfCqk8NyGfgotPYQ3W++7bMUU3RnKKPHZzMHDkioQhZj4
 YL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688633894; x=1691225894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fayqxLh/vco+SYInwt83ea7CX6FUWQU2usKrCQ013+k=;
 b=SDwY+l5/abYATqLsN8I59gUQppookmEpZaGxFAKD8XpWN6nazZH8PbrvJUrRxa7lBh
 E7vKtsMEEkHo/sukmvSY2/fW+FQHWrKhRgioL1MiuQKch835/Sfkaud7UkwkZ2ZYqsy4
 tXUVi0NoX+XsAoiRmK7UvX7QRwtE63+5GU8yr4b0RUo2pGPHYD7YXss35fokB8JT04Di
 5Dtc3ya0gYv8IxF37DQqDYLOPSgFjcM07GbBF1qZtKjAxY1JWRjTOQgDoKiMqhKbHCQV
 z9jma13BE1TjhJ18JoVPx9/ISxPJjNPpI5o7pXva9zq1zLtVC5jCPEfZ0k8/DQXEgjpa
 07mA==
X-Gm-Message-State: ABy/qLZI/VMJxxHVS2XPwkrU2vyH1cyfVaK4pcClm2UsaoIwwbkHd9fL
 N8H/VrMu0ClvB8K4yCdQEXCGXg==
X-Google-Smtp-Source: APBJJlFNHTYQWRHtROnOOty5+ELFvyo8/ZudrjTKHz8SF9FuZHky+aDb2X3o5VvOCjMOU5wiKluKFg==
X-Received: by 2002:a17:906:7a5e:b0:992:b8b6:6bcd with SMTP id
 i30-20020a1709067a5e00b00992b8b66bcdmr979075ejo.16.1688633894307; 
 Thu, 06 Jul 2023 01:58:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a1709067e0900b0099236e3f270sm542442ejr.58.2023.07.06.01.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 01:58:13 -0700 (PDT)
Message-ID: <464fdef5-f43c-a7b2-66d2-bf558a6ee2c7@linaro.org>
Date: Thu, 6 Jul 2023 10:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2, 1/2] dt-bindings: display: mediatek: dp: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com
References: <20230706021425.31735-1-shuijing.li@mediatek.com>
 <20230706021425.31735-2-shuijing.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230706021425.31735-2-shuijing.li@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2023 04:14, Shuijing Li wrote:
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
> Changes in v2:
> add a mediatek,mt8188-edp-tx compatible per suggestion from the previous thread:
> https://lore.kernel.org/lkml/c4a4a900-c80d-b110-f10e-7fa2dae8b7b5@collabora.com/
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

