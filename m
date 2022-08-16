Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097525957CF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 12:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C46A113A8F;
	Tue, 16 Aug 2022 10:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAA614A80C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:15:47 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z25so14280601lfr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ufp4H7rgUv3piu8wKA37diRya3zA+ELaA177Z/OUKNY=;
 b=vjpTI1nUBtQAb8FiCq4ze9Hoy2vYeTM4xPEBh8quv1Ctigs0CRf8MA/1jOB3BIp1Qc
 3uQnNRkUD7q9LD1ckTaCFCRlRaxzGKvhG6W4pMfaObJSOYbaGvT1UBf43z/7b9wCACK0
 yBy8rk6WuxcRZm/6gvTNbHvqqnjjGgLJUdivr5qzmtNs/3bTkFek1c5Ca9oNdcz/nEoh
 h1cIzKnF4SjE5NYaxxaSeQlofLA01h6pmq8yBwyy2RiAwmEskYrWaDy2GeSMTKzVoqEs
 ITTyJX+rpfLls4czihvRnIidRffg5DZSv26qlNg4PuipLpVM6fXOdclTxZgTE/v4UkqN
 +APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ufp4H7rgUv3piu8wKA37diRya3zA+ELaA177Z/OUKNY=;
 b=0OOG5fVKT1aV2jd2a3FKgXJXGv36Xu1IoI5nstHUvkn9KUuDamQoHxS6DvHZXSiWoA
 qslASDgfAP629WI8lGp+qWbMSZqtSOaXqboApQrfrXLByLAUKAqKnNkhLC3pDg+EvTZC
 NNWd5dKM82KbCjHicrmmoQpArOdC8VDkeg9qXZt75araFpR8OdY4wpuHMrfLS6Wg1TVm
 SX2CnZizdpTa0d07uj4kOFtUxA4py3mnaqneC5EmnKYhAnTMmbqSebuoOtcNcCAkM/SS
 1qe77PZKfU98NR9v8mVXA5Zmnh5Jp0VHaEHbt4mWWh9682Awm00hAqe92uAK4SE8UKcF
 qPtw==
X-Gm-Message-State: ACgBeo2z/RvVF+DbB2YA8/naDIE+3IILB2wksLhXA42S3u06BMt8pmoL
 MDCLPxbLmCn4mZ08HhM75aIl8Q==
X-Google-Smtp-Source: AA6agR4z6ZC4xF9H6MLo6Peaz9OsbXIbllfdQX/DZN0wrJYHDr+xgVqS/gUjsuD7724os3Mc9vC0TQ==
X-Received: by 2002:ac2:5a4d:0:b0:492:a190:3825 with SMTP id
 r13-20020ac25a4d000000b00492a1903825mr89903lfn.153.1660644945826; 
 Tue, 16 Aug 2022 03:15:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4?
 (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05651c031700b0026008acb55asm1746480ljp.113.2022.08.16.03.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 03:15:45 -0700 (PDT)
Message-ID: <3cdc8b67-c088-808a-c141-c70c9b8a8a9c@linaro.org>
Date: Tue, 16 Aug 2022 13:15:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] dt-bindings: display: sun6i-dsi: Add the A100 variant
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20220812074257.58254-1-samuel@sholland.org>
 <20220812074257.58254-3-samuel@sholland.org>
 <13fcaa01-d2c0-e57f-bedc-b2e0536a55f9@linaro.org>
 <379eabe8-3f55-d69f-dd2d-120b8d13f1b3@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <379eabe8-3f55-d69f-dd2d-120b8d13f1b3@sholland.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/08/2022 01:58, Samuel Holland wrote:
> Hi Krzysztof,
> 
> On 8/12/22 5:49 AM, Krzysztof Kozlowski wrote:
>> On 12/08/2022 10:42, Samuel Holland wrote:
>>> The "40nm" MIPI DSI controller found in the A100 and D1 SoCs has the
>>> same register layout as previous SoC integrations. However, its module
>>> clock now comes from the TCON, which means it no longer runs at a fixed
>>> rate, so this needs to be distinguished in the driver.
>>>
>>> The controller also now uses pins on Port D instead of dedicated pins,
>>> so it drops the separate power domain.
>>>
>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>> ---
>>> Removal of the vcc-dsi-supply is maybe a bit questionable. Since there
>>> is no "VCC-DSI" pin anymore, it's not obvious which pin actually does
>>> power the DSI controller/PHY. Possibly power comes from VCC-PD or VCC-IO
>>> or VCC-LVDS. So far, all boards have all of these as always-on supplies,
>>> so it is hard to test.
>>>
>>>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 28 +++++++++++++++----
>>>  1 file changed, 23 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
>>> index ae55ef3fb1fe..c53c25b87bd4 100644
>>> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
>>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
>>> @@ -12,9 +12,14 @@ maintainers:
>>>  
>>>  properties:
>>>    compatible:
>>> -    enum:
>>> -      - allwinner,sun6i-a31-mipi-dsi
>>> -      - allwinner,sun50i-a64-mipi-dsi
>>> +    oneOf:
>>> +      - enum:
>>> +          - allwinner,sun6i-a31-mipi-dsi
>>> +          - allwinner,sun50i-a64-mipi-dsi
>>> +          - allwinner,sun50i-a100-mipi-dsi
>>
>> While you are moving code, how about bringing alphabetical order?
> 
> I have put the sun*i prefix in numeric order, which matches (almost) all of our

5 is before 6, so strictly numerical order would be:
allwinner,sun50i-a64-mipi-dsi
allwinner,sun50i-a100-mipi-dsi
allwinner,sun6i-a31-mipi-dsi

> other bindings. It roughly corresponds to chronological order as well. It
> doesn't make much sense to me to sort sun50i (ARM64 SoCs) between sun5i and
> sun6i (early ARMv7 SoCs).

However if you say you already implemented some order (obvious for
Allwinner folks), then of course it is fine with me. I just hope other
people will get figure out this order, so they can maintain it.

So assuming there is some order:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
