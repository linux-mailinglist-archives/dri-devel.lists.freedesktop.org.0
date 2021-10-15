Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59E42E5B1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 03:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2606ECBB;
	Fri, 15 Oct 2021 01:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987D76ECBB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 01:02:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u21so31375914lff.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mv5Z6Sdks/z0PRafNWu7V1r7LCkQQrDbmE+ZfMmHLqw=;
 b=H60RnvlX2azwNGf02ab1Oyj8wVvv7xw4MWUErTGrxY7uhb1rctVozCIO8sCS81VzVS
 hOZVQcmidgo6srorYYEKXtrCX+uka5RufIHO9FB8YjYtosAd1tV7yduYszwn7XqHY8T3
 P2XSvit2SOy5d04RRrtHtjjy0pTszcQ+avWKslDagv90QnM8kxz9GqKKNEWsuZkwk0oG
 RI0hyWIS7l6XKbWqVyVn0ypJq/EzThrBHBqQNDqP1p+HoYYDahsR4SOJzmb7tEtGttAs
 Wv2t95lbRv4BVqh+KbIj7b+IMF63pQ6o3e7MjI+Qa1vL14XEfbtvpEfBnM3DX3ZKeOzd
 j7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mv5Z6Sdks/z0PRafNWu7V1r7LCkQQrDbmE+ZfMmHLqw=;
 b=iTttYAmdcCEGtXwVnbrwvgJ4/ZzoaxNejG4v9UEdmfPxxKLycrmCgQ8TRXdNCIcnPX
 sOkQq/a1j6/2hrh8OWgzPzrqTBr1lOClHh0wIyAAaeSZ9PjCwhKpwV6yiBiK50BJhHcX
 aJmCIAZ5g97/6PPvwT/OU//64Y01TyU8YPxH9GNsFUCSto9uNp3Pf9c8bu8wsdmJ0TUU
 m9gJh9qeSfo29K5Tm0KnBQxVnHc3rjtuqn5qneSY8QrVKCGm9hqiDLwi8Uk0P+5dq2MG
 ok3OhwfkCPZVh4E33IahwhpKXDVB4tVV7hYYyC8d3jVc8Sd66+++tF8+9y7Tap1ea+/G
 vCBA==
X-Gm-Message-State: AOAM532i8hKonxcdFrf0Fqyc7pPuaQflufpd8s4Xh4azLiKlvMt+DaUX
 9cvBrXigEUGOjnSDDrl+kAc=
X-Google-Smtp-Source: ABdhPJwI0m+5o/4/ErJJ6urO1/gJpgb5iHK/zkQpI7uZEJJsVGNazonwuMOVf2cdk0laSZAgpG/4Tw==
X-Received: by 2002:ac2:443b:: with SMTP id w27mr8198374lfl.63.1634259732934; 
 Thu, 14 Oct 2021 18:02:12 -0700 (PDT)
Received: from [192.168.2.145] (79-139-176-16.dynamic.spd-mgts.ru.
 [79.139.176.16])
 by smtp.googlemail.com with ESMTPSA id x145sm357902lff.155.2021.10.14.18.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 18:02:12 -0700 (PDT)
Subject: Re: [PATCH v12 05/35] dt-bindings: clock: tegra-car: Document new
 clock sub-nodes
To: Stephen Boyd <sboyd@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Nishanth Menon <nm@ti.com>,
 Peter Chen <peter.chen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
References: <20210920181145.19543-1-digetx@gmail.com>
 <20210920181145.19543-6-digetx@gmail.com>
 <163425700766.1688384.4481739110941660602@swboyd.mtv.corp.google.com>
 <4090acf8-c8af-d98c-2121-9fd105365e55@gmail.com>
 <163425874534.1688384.5636050222516713710@swboyd.mtv.corp.google.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <97b2e36d-b380-8565-8409-3884ab4ca11e@gmail.com>
Date: Fri, 15 Oct 2021 04:02:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163425874534.1688384.5636050222516713710@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

15.10.2021 03:45, Stephen Boyd пишет:
> Quoting Dmitry Osipenko (2021-10-14 17:43:49)
>> 15.10.2021 03:16, Stephen Boyd пишет:
>>> Quoting Dmitry Osipenko (2021-09-20 11:11:15)
>>>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>>>> index 459d2a525393..f832abb7f11a 100644
>>>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>>>> @@ -42,6 +42,36 @@ properties:
>>>>    "#reset-cells":
>>>>      const: 1
>>>>  
>>>> +patternProperties:
>>>> +  "^(sclk)|(pll-[cem])$":
>>>> +    type: object
>>>> +    properties:
>>>> +      compatible:
>>>> +        enum:
>>>> +          - nvidia,tegra20-sclk
>>>> +          - nvidia,tegra30-sclk
>>>> +          - nvidia,tegra30-pllc
>>>> +          - nvidia,tegra30-plle
>>>> +          - nvidia,tegra30-pllm
>>>> +
>>>> +      operating-points-v2: true
>>>> +
>>>> +      clocks:
>>>> +        items:
>>>> +          - description: node's clock
>>>> +
>>>> +      power-domains:
>>>> +        maxItems: 1
>>>> +        description: phandle to the core SoC power domain
>>>
>>> Is this done to associate the power domain with a particular clk? And an
>>> OPP table with a particular clk?
>>
>> Yes
>>
> 
> Ok. Can Ulf/Viresh review this patch series?

They already did, please see v13 [1].

[1] https://lore.kernel.org/lkml/20210926224058.1252-1-digetx@gmail.com/
