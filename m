Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2B58F0A9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E5B112869;
	Wed, 10 Aug 2022 16:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAE011BAC7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:44:38 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id v10so13188711ljh.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=VOLDuPix/0lVR9yaNuPldPK7FBAubvn5P7aOtNnMozY=;
 b=PxOmy31FMgnLAPzakLjut5vLpoUvufDZnrYVP17Y48jyHAinJzMIaKywcuoaJwPKTg
 eQCMfxVEJA2L/CK8eGRqltCaWjIRMUQglFpEZvF+ERgJxnOwpG/cbVif0yKnx9z7Snow
 SIM9KFxcdIhwV7AXsMMc1Py8OH9T+iO7fMMrI0eSP2w2qB+CTnnXbjcQrYDo7TQY9vfA
 D51wlzvZ+klATs1G6HpGHcegPyR7hZCN7A4kOVmw6nEHCxN0XNAZIkPJshHFg9Qi1hsM
 T08q9GkKN8t7TvEF/iUm+ruwky/ZEt0E6lvjtiRTroHzQjvUXDeK9aj1XR2+5kgZORG3
 Tosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=VOLDuPix/0lVR9yaNuPldPK7FBAubvn5P7aOtNnMozY=;
 b=vF3aLDpDHhUdYEkxKlay69cPoUiDETdYo2FzZak4rWCulLvBO+AzwwTWcLHIPLdBCQ
 aZpArF1zcL8REEBRc2hFEqqVDng93LmUz11drU/ayvw9W0rPFjcUVwex8Kw8HqDdXM6h
 tZSLMRAwWZJFrytntpktBOBIfCr0eQYNVtJiKwSNpyK22tIdMOI28aOFTIRWpnFrb+d3
 F87xgtJVeCP1NZE9WOwxwqMToPEGI9bDSepd5cLM8KgwdqPi7ifLERVmNtae6lHU1Xpj
 QUCL12oKYJ7bcoU6jjf5CDBYXFRK4GO/fy5v9epOLEzxd+S7pCXPO1pIg9u+KCv9GTe1
 ekcQ==
X-Gm-Message-State: ACgBeo1AovNEkCurl6F1vu+BIKec1bD31YkOrBsG7WINqLg1AedIPpuB
 eHKp27lz9OcusXJ9mR7TMD386Q==
X-Google-Smtp-Source: AA6agR4eoACd1ljMRqSIXs9EqFqbtjFc5gnzr+PoO1i7OTkPo+HY2BZ5YR46FSliA7NymB0fqOuUTg==
X-Received: by 2002:a2e:81d2:0:b0:25e:68c3:f434 with SMTP id
 s18-20020a2e81d2000000b0025e68c3f434mr9196641ljg.526.1660149876935; 
 Wed, 10 Aug 2022 09:44:36 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05651c128d00b0025e0396786dsm466556ljc.93.2022.08.10.09.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 09:44:36 -0700 (PDT)
Message-ID: <4e096cc4-a012-8ef0-d5a2-1a32d1f6c83e@linaro.org>
Date: Wed, 10 Aug 2022 19:44:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] spi/panel: dt-bindings: drop 3-wire from common properties
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220810131311.428645-1-krzysztof.kozlowski@linaro.org>
 <YvPaaOgCUABREOcX@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YvPaaOgCUABREOcX@sirena.org.uk>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Pratyush Yadav <p.yadav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/08/2022 19:18, Mark Brown wrote:
> On Wed, Aug 10, 2022 at 04:13:11PM +0300, Krzysztof Kozlowski wrote:
>> The spi-3wire property is device specific and should be accepted only if
>> device really needs them.  Drop it from common spi-peripheral-props.yaml
>> schema, mention in few panel drivers which use it and include instead in
>> the SPI controller bindings.  The controller bindings will provide
>> spi-3wire type validation and one place for description.  Each device
>> schema must list the property if it is applicable.
> 
> What's the plan for getting this merged?  I can just apply it at -rc1 if
> that works for people?

Ah, I should mention it before, my bad. There are no dependencies, no
stoppers. I hope this will go via your SPI tree.

Best regards,
Krzysztof
