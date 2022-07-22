Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBD857E6A7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 20:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB37B8DC2F;
	Fri, 22 Jul 2022 18:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330148D640
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 18:37:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m12so7909188lfj.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 11:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pZNADembFWMrMyIeeoU2sLzijZgUqqEN6vVBxD7cEAs=;
 b=GsqhyOyvPqQLTvBum+zuJxJdCWumdKt28rH2mPmYbBK74XD17jt60KtD0pMHpo/hya
 vb9wzTzbNdeHuA/5g/kHobFtb0+H7CYDfb4AvZumRqW3JnejJKFeINvR34dlTLchYXjz
 j0UREVOivqXUfB4/IgLh/3GwMH3nmWpkN29OsnadwZiyJhvuC8Ke+A7q5rONII1LLIRN
 ur9/WC2nNosjE3LvdRSxF0kGBq3CGOT6wxtYRhP1t3tA3RPVu4/9VS+clhFLMjMPW09o
 1TD97bVIN/s+O48yV/5C3XwcnVszKfIepyHe6JQqce4HYChtqdx1Ean31k2MwSuBhPl2
 mZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pZNADembFWMrMyIeeoU2sLzijZgUqqEN6vVBxD7cEAs=;
 b=L+IoFc54BEjF089/i8pIDv17krH1DNzpRKaNXCvScjlUUvJI4VT50XqwX28Gl09snG
 0XVCXGArJJu2R4uCk/weHWUUZF04uD7lviNutSQgWXH8cMqz3heVs2Qp+G3jEvyLD9q6
 ZSnxZrDIuPbWaeplwo4rmNpPJiu3Q4Z85oE7+IEUnX0qurQ4yAZrWHDqBgJbJ7/iBdFi
 pk6QEzKqJTf9CPngP43pSkYffVD/mh5nnVbVZ6ny97vhQjD9TgJGWvd6WkZjUg/INe9x
 O2tg/xsxfrZzOd0iAiegqTZ7srreIojr8pkIL+RcKUKSCywLcB1o+iasCpTHG+r+1s3a
 MgSg==
X-Gm-Message-State: AJIora9Tt4vzQptAqrb7xNszdkcUKST9/5gXZ3O3vgKSLZVXF722Ggyp
 CdEKiHMXFGROHg1u/EtKTfywKw==
X-Google-Smtp-Source: AGRyM1t4tkeV7OyDpZcsS6qCtak/AfOICQG9L4dyANvy9yS4TYY7Ac7Z+0mbnuyWn6CiHaHsFou02A==
X-Received: by 2002:a05:6512:2622:b0:481:5b17:58e7 with SMTP id
 bt34-20020a056512262200b004815b1758e7mr478609lfb.600.1658515073264; 
 Fri, 22 Jul 2022 11:37:53 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net.
 [81.167.86.93]) by smtp.gmail.com with ESMTPSA id
 d15-20020a0565123d0f00b0048a7222eb8bsm1008194lfv.135.2022.07.22.11.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 11:37:52 -0700 (PDT)
Message-ID: <1a03d894-3f4c-fb57-5f05-ad7bf11f5488@linaro.org>
Date: Fri, 22 Jul 2022 20:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] dt-bindings: panel: explicitly list SPI CPHA and CPOL
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
 <20220721153155.245336-2-krzysztof.kozlowski@linaro.org>
 <20220721193004.GA1783390-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721193004.GA1783390-robh@kernel.org>
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
Cc: Tomislav Denis <tomislav.denis@avl.com>,
 Markuss Broks <markuss.broks@gmail.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Oskar Andero <oskar.andero@gmail.com>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Nuno Sa <nuno.sa@analog.com>, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sankar Velliangiri <navin@linumiz.com>, linux-spi@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Christian Eggers <ceggers@arri.de>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Stefan Popa <stefan.popa@analog.com>,
 Sean Nyekjaer <sean@geanix.com>, Jakub Kicinski <kuba@kernel.org>,
 Nishant Malpani <nish.malpani25@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Stefan Wahren <stefan.wahren@in-tech.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Dan Murphy <dmurphy@ti.com>,
 linux-fbdev@vger.kernel.org, Matheus Tavares <matheus.bernardino@usp.br>,
 Marek Belisko <marek@goldelico.com>,
 =?UTF-8?Q?M=c3=a5rten_Lindahl?= <martenli@axis.com>,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 Cristian Pop <cristian.pop@analog.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Mark Brown <broonie@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/07/2022 21:30, Rob Herring wrote:
> On Thu, Jul 21, 2022 at 05:31:50PM +0200, Krzysztof Kozlowski wrote:
>> The spi-cpha and spi-cpol properties are device specific and should be
>> accepted only if device really needs them.  Explicitly list them in
>> device bindings in preparation of their removal from generic
>> spi-peripheral-props.yaml schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/display/panel/lgphilips,lb035q02.yaml   | 10 ++++++++++
>>  .../bindings/display/panel/samsung,ld9040.yaml       | 10 ++++++++++
>>  .../bindings/display/panel/samsung,lms380kf01.yaml   | 12 +++++++++---
>>  .../bindings/display/panel/samsung,lms397kf04.yaml   | 12 +++++++++---
>>  .../bindings/display/panel/samsung,s6d27a1.yaml      | 12 +++++++++---
>>  .../bindings/display/panel/sitronix,st7789v.yaml     | 10 ++++++++++
>>  .../devicetree/bindings/display/panel/tpo,td.yaml    | 10 ++++++++++
>>  7 files changed, 67 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
>> index 5e4e0e552c2f..0bd7bbad5b94 100644
>> --- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
>> @@ -21,6 +21,16 @@ properties:
>>    enable-gpios: true
>>    port: true
>>  
>> +  spi-cpha:
>> +    type: boolean
>> +    description:
>> +      The device requires shifted clock phase (CPHA) mode.
>> +
>> +  spi-cpol:
>> +    type: boolean
>> +    description:
>> +      The device requires inverse clock polarity (CPOL) mode.
> 
> Not great duplicating the type and description everywhere.
> 
> We can move the definition back to spi-controller.yaml, so then that 
> does type checking of the property, but not presence/absence checks.

If I understand correctly, all client devices (which do no reference
spi-controller) will need to explicitly mention CPHA/CPOL. Good idea.

Best regards,
Krzysztof
