Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8F7033DA
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 18:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7095210E250;
	Mon, 15 May 2023 16:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84AB10E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:42:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-96b0235c10bso372388966b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684168929; x=1686760929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pGn8HAuIocxoHajMCSRRfoguprnK9ZSWlAhG7ClLNxU=;
 b=ntSUivjlQsSveCo7qvqN4hvYLt8/4YSecdN3T8kf9zGq+Yc6ZGkxC3iSAbw7l0ol/J
 p8Y3Fv1b/fXPs8S6bWHfgdBVHc+6f8dC3qXxlEjweK0Dr+BbPMgnTtPsoWsd+7sigaz6
 P2tI2n8ChAvwCCsm8Ih3MzBzbdX8dufLrMLfasxGZCKS6GwB8edWSB3kMyPnEZvffz38
 yZuSueXFekNmMyd606fbEUpjGYy/eIEPkIZQfBquwUJNOhU+qXiTycmEaIVG6xV0A25g
 UhM09eopARPRGIzugkU1Rh6GCT6oy2f+VufN3WG0Ln7+XJHuZ5hlikXTl0kYRaS864d1
 tuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684168929; x=1686760929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pGn8HAuIocxoHajMCSRRfoguprnK9ZSWlAhG7ClLNxU=;
 b=ZMw6gLakgy+a0wbnb9mSbGLOe4icOS8Tth2vW5axAzLukSJDU5GkByYhl8VZ3xoov+
 dZqMmWHLuM6MiTW4i64h8c1pGZD/Q48QKE5Eij2w8rzFdrUWkmkQR6BsHnk9uTsevm2f
 QqCI2IXompOypZSKkIRL+6pcn3mUG50LO5Bd3QqqtgIv1vsgQDLZbXHHPgw0AkUb7S1l
 5ozuBRCpvsTwfnzQF5q0UCRDAl90i0mvur2vLjGOuDK1euCByZu9y4N72jnFEv40ibxx
 TDyZnavJdCqIf2oD05AL8qxSp0Igkhhpjbi696KiyTTJIQillcASAhBhxZDmM9V0v6Ew
 GMGg==
X-Gm-Message-State: AC+VfDxIYHL05Bi9/c5a92lUFrsALwwg+aEWQ0FZn2TiY9y29VuRLR8H
 cXZJvEvnhpWN9Pm3YjXDsal+wg==
X-Google-Smtp-Source: ACHHUZ7QficGch3Sl9q7M8rHIXIEkBIuRgf/Sni/Jw1SxXmU9/+Vxw6610XGNRBN7zoz6cqyNfYj6A==
X-Received: by 2002:a17:907:d86:b0:94a:9c4e:d2e9 with SMTP id
 go6-20020a1709070d8600b0094a9c4ed2e9mr31118316ejc.0.1684168928739; 
 Mon, 15 May 2023 09:42:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992?
 ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a056402514800b0050d8aac0a1esm7408463edd.19.2023.05.15.09.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 09:42:08 -0700 (PDT)
Message-ID: <5f41d497-8b3c-42b4-22ba-b24772abb3a5@linaro.org>
Date: Mon, 15 May 2023 18:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 04/13] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Content-Language: en-US
To: neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-4-2592c29ea263@linaro.org>
 <fe2f22c7-8c39-faf3-bc65-a7c089200134@linaro.org>
 <eaa3ecd0-dcf0-01d8-b3ea-9dd900215839@linaro.org>
 <80da6b9e-ba82-d2c9-2854-b444635150fd@linaro.org>
 <14405799-9b56-6767-4a35-51ab8ae636a9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <14405799-9b56-6767-4a35-51ab8ae636a9@linaro.org>
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
 dri-devel@lists.freedesktop.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 18:28, neil.armstrong@linaro.org wrote:
>> It's just a link stored in automated responses, what's here childish?
>> It's still valid in current cycle! Look:
>>
>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>
>> What's the difference? Srsly, I can point you to submitting patches
>> without reference to specific line if you wish... Or you can check by
>> yourself.
>>
>> I give the same reviews to so many people that have templates and Elixir
>> happens to be the only place allowing bookmarking specific line. Which
>> is helpful for beginners because the entire doc is huge.
>>
>> I can make an exception for you and never paste direct links.
> 
> I value those kind of links for beginners and newcomers, really, it's a good
> thing to do and we should all do the same.

Hm, if I understand correctly, you felt being patronized by my link? I
apologize for that. It was not my intention and there is really no need
to feel like that. Look, I have many, many templates so I can speed up
review. This one I gave to many:

https://lore.kernel.org/all/?q=f%3Akrzysztof+%22Please+wrap+commit+message+according+to+Linux+coding+style%22

Writing same review every damn time is a boring, absolutely huge waste
of time. People just make too many same mistakes. Better to hit key
shortcut.

Over the time most of my templates grew a bit, because when I wrote
"Please wrap to 75" submitter did not know what to wrap or why. To save
myself work I extend the template to something more. The entire text and
link is for the beginner, not for you.

Best regards,
Krzysztof

