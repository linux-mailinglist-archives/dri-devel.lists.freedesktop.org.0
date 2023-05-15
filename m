Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21017032CC
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 18:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC76510E11A;
	Mon, 15 May 2023 16:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21EF10E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:22:16 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so113197182a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684167735; x=1686759735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HqUKnr7IQo6kAfIcW46mPtLrFF4JcKeEB/JMB18Eu9o=;
 b=IFOu69xMjQDkgS9weEDled/TdBHMLC8yBGornivzVwLbLX77xvDFLzkoUqW7hi9p1t
 CKaI3h/mDs5Z3JBQ7MBKkh9y4mCkeCX/9i6zRH7s4LBA8ibeKmgux3dAFjRGbwEy+Z36
 ApdQ3qPRZq5UXS2EtTjNC8uyb85BQCuYuGUK0hXmgkcbX7bT17ABTP5SS1jxo54Q0Ujy
 sjdtshj3OT9BXTu3drUjNDncIEBpqNBRRZdoPTJ71PUWyi5VNtciC6D7wzTEJ4XUfXuC
 F3vVSQyZ0Awq5Df63fkIJlHVjiGg/Xx2nrna0EMvpaA52kV2CS0e9KDA0wpEYhJfaeYp
 7kNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684167735; x=1686759735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HqUKnr7IQo6kAfIcW46mPtLrFF4JcKeEB/JMB18Eu9o=;
 b=cvkROa2pmU8c7B46doh4pd+V/t+nlxH/naPfXLziAzSXlk0zpM1r20rqzi+a53Faga
 jAc84Ijz8jC1wRsxRpshAP91AlU2xxi/FvrHxGS2PIZEu6TiF6Om0KxxhMqfWSZyTRlB
 6wO8iU+xV3tM2DD+UjReA51LK81JEhBvp4K6GeEMIw778uTmx0wvZvrQnulA8W4gu0/t
 cTdjGEdTTDD8QPjj2wJiDrlhJpcAsOJkysDRKjeg4yR9qy45xvdciS+CNKQ98751RTH3
 Ptb72Gkd8cCc+736+h8lPpkSjlF6ZteqI78k9FyNdkm1e21gzMI4zjMjDbZ9wn1i2bVl
 bzUw==
X-Gm-Message-State: AC+VfDwFMxuUp402pj9SYn/Wex+kxPYouCplykAWOx10xcZ2mQ0dfCAh
 9+EMjSIYyo18ywcN5CpKhndfRQ==
X-Google-Smtp-Source: ACHHUZ4LIljnAHBUrSfA9rndvPnsXVWvxuzuNDX+pSF5zFw9AsRvRtnw68XknYeYz635GIn79GF7dw==
X-Received: by 2002:a17:907:3ea8:b0:953:37d9:282f with SMTP id
 hs40-20020a1709073ea800b0095337d9282fmr28963636ejc.38.1684167734983; 
 Mon, 15 May 2023 09:22:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992?
 ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
 by smtp.gmail.com with ESMTPSA id
 fy7-20020a1709069f0700b00965af4c7f07sm9645534ejc.20.2023.05.15.09.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 09:22:14 -0700 (PDT)
Message-ID: <80da6b9e-ba82-d2c9-2854-b444635150fd@linaro.org>
Date: Mon, 15 May 2023 18:22:12 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <eaa3ecd0-dcf0-01d8-b3ea-9dd900215839@linaro.org>
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

On 15/05/2023 18:15, Neil Armstrong wrote:
> On 13/05/2023 20:32, Krzysztof Kozlowski wrote:
>> On 12/05/2023 15:11, Neil Armstrong wrote:
>>> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
>>> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
>>> on the same Amlogic SoCs.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process (neither too early nor over the limit):
>> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586
> 
> This message may be automatic, but context is always important when reviewing,
> this commit message is a re-spin on v3 that was reviewed by rob but I decided to remove the review
> tags since I added a new clock and did some other cleanups.
> 
> While the process describes "how the patch itself *should* be formatted", it's a best effort
> and not a blocker.

Other issues are blockers.

> 
> I'll fix the wrapping since you pointed out, but referring to the submitting-patches.rst
> file (from a very old v5.18-rc4 version) is kind of childish.

It's just a link stored in automated responses, what's here childish?
It's still valid in current cycle! Look:

https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

What's the difference? Srsly, I can point you to submitting patches
without reference to specific line if you wish... Or you can check by
yourself.

I give the same reviews to so many people that have templates and Elixir
happens to be the only place allowing bookmarking specific line. Which
is helpful for beginners because the entire doc is huge.

I can make an exception for you and never paste direct links.

Best regards,
Krzysztof

