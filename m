Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94D718AF6
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 22:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A171510E0B0;
	Wed, 31 May 2023 20:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC71510E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 20:18:50 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af2ef0d0daso1011191fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 13:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685564328; x=1688156328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xfW0uzgTADsWhcSoswaGkp1tdAOqlTEb9s1G6Pboe/Y=;
 b=Knwpl11wAJpByir5y9Ihgahijnbhr5aV5DLBxtRiuInO9UBfTXRZYStISf3LvlCSOr
 gTh5N9TlcXO86fcFvg7p65LNMPagDHpvXL0AZT6nguxBxKn10N2oszYyl3/XKT9dedpl
 avo05kphEPJbry9s9AgWXP1g7eSkxULHiKyPVG1HU4FtLNegjBNBEj7ABWvDJwP2suAv
 otuId3S+Ti2KVdRZ6IE7fV2CDRTLzhWnW/CWHCv4UFXvXU9HfTAN8Wo9OBGlmPIdBmRM
 vRdgynkumPFVK0XZ7mMAF6zN1NUsVRAIVUbOeUC/LGZdv9OQrcWPiRKxwIHTtttoBcYf
 hISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685564328; x=1688156328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfW0uzgTADsWhcSoswaGkp1tdAOqlTEb9s1G6Pboe/Y=;
 b=KOzF9R9GtoeDZI8A+QyKa3QTjOyMzdhM63ZgSZIUndDXab3PaR95A2psa0wNWyCdQq
 BXqy01wdxY7/dBRGboKZYQj+g2d5sMlSSrCJA7VvTok9WRfC69cwV8DgMMgHlEAwqCUP
 5VfgJ2hDIS4RLX9q3rofvCSeZoGC9qRDnsX/K8rIRwWhnxHA1HdFOUvaMCSEkL8j1Vkf
 AbFZdNKyTqqhLsPZyX3XMhmy1YC778B0rdh+JQtkU7J5trGZN7k6+OEWKBxZb2/fUv2T
 2ND4LpuX1L4b8tpBYVIfmnbVQ43gVoP1xLNBvFcXYvcEggXeHeLFNr4AmBS9nU31PVms
 y5LQ==
X-Gm-Message-State: AC+VfDwah1t5+BZt/yfFr5avFCH4pZ0re8IDFaa/VstSvsVzcf9xB+oW
 wLAFURPMotmgVJrZRTvqfdMvwA==
X-Google-Smtp-Source: ACHHUZ7MnLxIs+OPsxwSz9SByrSFUAFokzZIXJoW5Mr6QI6WE1tX+SQJSsrIHUQ4EFkbIlqgaPoTzA==
X-Received: by 2002:a2e:3013:0:b0:2af:1120:3f6a with SMTP id
 w19-20020a2e3013000000b002af11203f6amr3410946ljw.11.1685564328477; 
 Wed, 31 May 2023 13:18:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a170906410b00b0096f689848desm9454874ejk.195.2023.05.31.13.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 13:18:48 -0700 (PDT)
Message-ID: <7b171f36-3a17-ac6a-6033-ef2d20e8538c@linaro.org>
Date: Wed, 31 May 2023 22:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: samsung,mipi-dsim: Use port-base reference
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
References: <20230531014315.1198880-1-festevam@gmail.com>
 <eb2b71df-6767-40f3-afc1-ef1552aeaee6@linaro.org>
 <095bb5c25f120536bf38bf87df5900cb@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <095bb5c25f120536bf38bf87df5900cb@denx.de>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2023 21:12, Fabio Estevam wrote:
> On 31/05/2023 15:56, Krzysztof Kozlowski wrote:
> 
>> This would have sense if you kept original intention, so
>> additionalProperties: false
>>
>> Without it - you just break bindings to hide warning.
> 
> I am not sure I understood your suggestion.
> 
> Is this what you mean?

No. I meant that port-base is for cases when you extend the list of
properties and it needs additional/unevaluatedProps: false.

You don't have it, thus your fix is like this case:
1. We have DTS with wrong property, not accepted by bindings. What to do?
2. Let's change bindings "additionalProperties: false" to "true".
Problem solved!

No, not solved :)

The graph bindings are a bit tricky, so the best to look for existing
examples.

Best regards,
Krzysztof

