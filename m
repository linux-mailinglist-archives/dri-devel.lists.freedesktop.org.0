Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63BC70330A
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 18:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F0A10E0FE;
	Mon, 15 May 2023 16:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019FA10E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:32:30 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-965ab8ed1fcso2404592166b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684168347; x=1686760347;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3v/Wb7rBhzrVb0azi8VEofeBQJDbLwQtTKKw6U3ZDgU=;
 b=IQsT47xSa6tWwtSS4bpFB6i7IlU4UCWjoB2VM6EVgVr5RwUXSq3USycHcD4tbK/vCl
 XKFNwbFQf/jruqOo/rvlMLjUuPCZycBQeUffWIkGgw5dBLDgAwgJsfn9sB2c1gpt/MWb
 ZimOxt+//pU5CUmXwdB6oaX701pD1/lBK9C8i44PPeQrgsn9OEHGJWH/NYbcHEPFyLA7
 Bsl/ZYBWcDioxjk2hHAzwoKjTcchrRCwPZ+4MkGwJt8hwBqHRsFf9J56AHJFmzCUvieH
 SSmmFu0lLW2Mx6PmN0R2RGRyKeGfRuZzS/ydIrOHo83gK/ShptAv3j5ZJAky00BooIMT
 CZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684168347; x=1686760347;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3v/Wb7rBhzrVb0azi8VEofeBQJDbLwQtTKKw6U3ZDgU=;
 b=VQk6P82gC+91bXlY8A6ARGNty+gBvakKMUQ/3unsnAicFFERsOY1j+Mc80h/IV04pu
 KGV1lKWgXVIYfwubsE0tTX0hN5db+QADHzHzymZDiW5OlsS8nqBncNv8rDLsQkgO/5B7
 18rXwfIDkr+NzO99O6pagG23QivQjbjm2f5nHqfazSrk0/zwV4hO3qSeAA+YD25ksNvr
 SIVlEf9TIgK9sTZcr1zc/qiq5eYatNnzpTnpGqvL8SOkvvxCJfQyKy4hD80QQ6GwfcwJ
 WDv8UFdPVs7HHl7QkNwgJanTG5HdsWdFevvTwgiIPpZUVhCbZ/52dwTqxIH9QxQZnYDT
 HnOQ==
X-Gm-Message-State: AC+VfDwkd95mY5W4HXpl1SFgJvXxBT6SZnodCU+eYNLQBQCujwUKcYMJ
 e1+0L3dodz2hNEkPQB+L9fHnXQ==
X-Google-Smtp-Source: ACHHUZ6gTLs+3cm2BhuQPDtT2O40r+PYINlcdVU5ENN0zj7TYzrHOXrFQdEsXBWgivvJve1UghmM7A==
X-Received: by 2002:a17:907:7fa8:b0:96a:9b5b:5d80 with SMTP id
 qk40-20020a1709077fa800b0096a9b5b5d80mr11887393ejc.13.1684168346707; 
 Mon, 15 May 2023 09:32:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992?
 ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a170906285900b0096a5d341b50sm6679818ejc.111.2023.05.15.09.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 09:32:26 -0700 (PDT)
Message-ID: <17bfc33b-029f-a0f1-564d-e8c8d0a8695c@linaro.org>
Date: Mon, 15 May 2023 18:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
To: neil.armstrong@linaro.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
 <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
 <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
 <d5c030f9-2f4d-25cc-b922-d00f5033ac37@linaro.org>
 <6228670c-3e06-3061-f304-a2c641962ffa@linaro.org>
 <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Nicolas Belin <nbelin@baylibre.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 18:22, neil.armstrong@linaro.org wrote:
>>> Meson is the only or almost the only platform making such changes. I
>>> don't get why, because the conflict could be easily avoided with using
>>> different names for defines in bindings and local clock. Approach of
>>> having bindings strictly tied with driver commit is never desired.
> 
> If we did it now, we would have make it differently and expose all the clock
> IDs on the bindings like on Qcom, be sure of that.

No, you just keep different names. The only problem here is that your
clock name is the same thus you cannot split bindings into separate patch.

> 
>>
>> Also one more argument maybe not relevant here but for other cases -
>> this makes literally impossible to include the clock ID in DTS in the
>> same kernel revision, because you must not merge driver branch to DTS
>> branch. SoC folks were complaining about this many times.
> 
> Actually we handle this very simply by having such patches merged in a immutable
> branch merged in the clock and DT pull-requests, it worked perfectly so far
> and neither Stephen or Arnd complained about that.

Arnd, Olof,

Any changes in the policies? Do you allow now driver branches (with
driver code) to be merged into DT branch?

Best regards,
Krzysztof

