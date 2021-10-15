Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF542E557
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 02:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5656ECAB;
	Fri, 15 Oct 2021 00:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C58B6ECAB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 00:43:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t9so33677872lfd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 17:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mXlN19lUOdObPkezfYAL1BJvV5sdk9SnJ7WWJzToUFE=;
 b=iPhw22hb1ndCbJ6f3z6jDDU25OfgCtQvcMEMlYqE6RhSONXRPkBqjq2iIHzMJ9dE7v
 0EvnD8COMjP7f/9VaiVWB/uB7GhdewII9Pozl5ZYeg6blX0TjojG9oeJ9/kSqaNk9PqK
 CXPDSfcXnxrfHB2d/OZM5xOru20KWvBAvReWtsxrrn7FyBQdewSA+1Zjj8RSveTfNkDN
 2MLWkuU2tleNYdToYr12SJbVZ4+HSn/s++uIZcuPHbrRdvWn+0eL4gR832lDZ426zwE6
 ajzhVIWKtwCZckiYAlM/TLkYD0Wef3Y2fKV44UmpwLWNC0KFYBpa4oGQw7n0TIbursCh
 OXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mXlN19lUOdObPkezfYAL1BJvV5sdk9SnJ7WWJzToUFE=;
 b=Zr6nv7cuRsmB3ldzXiCKgmxAqKCUHp7qfWMIxj4xfp5tykSRpTJ0e8mdEoFbjJucY2
 6AhF8trvVcj8lPGbE3G+6O8qj8YGR7BgepRwv8ftqHOcQpbVw+jFB7m7dfX7zP3C3eD8
 Y9TTIok88epBjWf5RU3QvwOyMw+27+wYvSS0LWwrDrGRe+Kdt4V6h2WbaSkWjvPYp3WK
 M0SvQIIlCxN4U7Tp2FN3pveCC1VOvcu3O7SK/XB2rSFntZoxynHeS3zDTb5y95mxXNc7
 OSqSeX84JLoEo6POjfeeFUhpKzIwF6ZgMdmZLMuwPPK0zvinXpXo9ykqSRY5Q21XGwGQ
 pIOA==
X-Gm-Message-State: AOAM532JveIKwYM5JwW0NZths3QEK4VikjvLIbUf82s20npwQo6a8anN
 8sEX8hF5pA1MjCFTgK2wE4w=
X-Google-Smtp-Source: ABdhPJz+j3ZrhF+t+OqqMV5oruL99gBhJ85C+0YAA7Njrymq7zFv+r++lAR13NAeJJ0A+zRcVSzJ4w==
X-Received: by 2002:a05:651c:11c5:: with SMTP id
 z5mr9340948ljo.123.1634258630581; 
 Thu, 14 Oct 2021 17:43:50 -0700 (PDT)
Received: from [192.168.2.145] (79-139-176-16.dynamic.spd-mgts.ru.
 [79.139.176.16])
 by smtp.googlemail.com with ESMTPSA id u15sm401868lji.21.2021.10.14.17.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:43:50 -0700 (PDT)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4090acf8-c8af-d98c-2121-9fd105365e55@gmail.com>
Date: Fri, 15 Oct 2021 03:43:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163425700766.1688384.4481739110941660602@swboyd.mtv.corp.google.com>
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

15.10.2021 03:16, Stephen Boyd пишет:
> Quoting Dmitry Osipenko (2021-09-20 11:11:15)
>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>> index 459d2a525393..f832abb7f11a 100644
>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>> @@ -42,6 +42,36 @@ properties:
>>    "#reset-cells":
>>      const: 1
>>  
>> +patternProperties:
>> +  "^(sclk)|(pll-[cem])$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - nvidia,tegra20-sclk
>> +          - nvidia,tegra30-sclk
>> +          - nvidia,tegra30-pllc
>> +          - nvidia,tegra30-plle
>> +          - nvidia,tegra30-pllm
>> +
>> +      operating-points-v2: true
>> +
>> +      clocks:
>> +        items:
>> +          - description: node's clock
>> +
>> +      power-domains:
>> +        maxItems: 1
>> +        description: phandle to the core SoC power domain
> 
> Is this done to associate the power domain with a particular clk? And an
> OPP table with a particular clk?

Yes

