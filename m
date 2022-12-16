Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FE364EA30
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F370D89023;
	Fri, 16 Dec 2022 11:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B96489023
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:21:24 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m29so2775600lfo.11
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 03:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gWCOz09++vt7gSRrrVtRk3U9xHsMwJfb4psYolKcH30=;
 b=kRIMTH3NVuPxweks9ohzawd0D6G6PqOQ2Y5M5YKn63mQ1G9Nd+w3aeo/PSGkX81f/L
 bqm0BlA/W+uEIODniJu/t2H1H/51JOGPiG1FX5jj3RypSkxd2ulukn6ZOj/uxbkL73Xr
 a7s+iNLb0lWDHQN21j54wekHbY+6rj/f8A9/9hrJXAhad1dMqJfLwNBnSwZgp3buimHM
 39dRuPo8Be27u59rNWXwNXj7ulC/kzvHYIQVys/aw3z0efA5skeWvYCRCQ6mbJqpVe/l
 05Y5gOAkj5Rjlo1YcPtoERzuu3OF5jqOShIhDP/28SXOWawPMF1ozZTXdD8D18/zaKJ0
 AlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gWCOz09++vt7gSRrrVtRk3U9xHsMwJfb4psYolKcH30=;
 b=lSP6BmlXEfVFwDr88D6FVH3VmR63Nrb12k49R9IZ08FJtBlHT3dTfQz3/yvdh3ake5
 PDT/DbzLMGXe2o+xMZ84QjJnIuHuMMx9qrx9XxDCCYeQ7V1hZxG1DvV2zyITgwsiyVAM
 hJrGrPVLmW0mHZfoJOjtlwdoam/A2RUQ6+//Awo2bOcdIZhiy4AKm26MHdMjDoVE+uSz
 YG1MsOxsx6MeKbil1aI23x62Q1LMyloooiu43QVPbhEaZvgQBn5kIQqjjxNllJ7d1MJN
 MZt3jK1Bpvz8jjUCABeNYC9cUp6KaMfMZV1aZwGb6QjTN2jmEFvtCoMnX/G1+S+CmTKo
 j2KQ==
X-Gm-Message-State: ANoB5pnsf6ZKfssfz0/vEDAkdgbCp9Pte3nl1+Lu3vBkUTps88CreB02
 4IGyUmuCuYQUnSPhhGviIhX3iw==
X-Google-Smtp-Source: AA0mqf4AT1JDqt3ZxbzOYpPIlykdyBRhcC/2ieSzTZj6qxdmbP3PJAUglkgCv8x0PI+2zLhPY3tbSg==
X-Received: by 2002:a05:6512:3d8f:b0:4b6:ee14:3e98 with SMTP id
 k15-20020a0565123d8f00b004b6ee143e98mr12959406lfv.23.1671189682473; 
 Fri, 16 Dec 2022 03:21:22 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q27-20020ac25a1b000000b004b4b5da5f80sm192992lfn.219.2022.12.16.03.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 03:21:22 -0800 (PST)
Message-ID: <bb2b5b72-42b3-3a6c-d865-9e338e34aba0@linaro.org>
Date: Fri, 16 Dec 2022 12:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 01/10] dt-bindings: display: bridge: it66121: Add
 compatible string for IT6610
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, Robert Foss <robert.foss@linaro.org>
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-2-paul@crapouillou.net>
 <CAG3jFytgK0noWteGvXTdSm9as9Q=qfhf_ep3Z8Wv2ofmLzGb=A@mail.gmail.com>
 <c78e92ae3cbea037abdd31ecd64e997c8dd1def2.camel@crapouillou.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c78e92ae3cbea037abdd31ecd64e997c8dd1def2.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/12/2022 11:46, Paul Cercueil wrote:

>>>  properties:
>>>    compatible:
>>> -    const: ite,it66121
>>> +    enum:
>>> +      - ite,it66121
>>> +      - ite,it6610

These should be ordered alphabetically. What's with the tendency of
adding always to the end?

>>>
>>>    reg:
>>>      maxItems: 1
>>> --
>>> 2.35.1
>>>
>>
>> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> 
> Series applied to drm-misc-next.
> 
I wished you give DT maintainers a bit more time than two days.

Best regards,
Krzysztof

