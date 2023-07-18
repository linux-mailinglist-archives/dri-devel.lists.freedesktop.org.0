Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A527D757CC0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3F410E340;
	Tue, 18 Jul 2023 13:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96E810E341
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 13:06:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5216f44d881so5768175a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689685568; x=1692277568;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6sUHst+qMfvqGd6D4drEgX+385kdv+PYqXOtITReCXQ=;
 b=FfNEH+WfJctNkYn82YYreYDRI+kPAiyGGv+jM94jGbleg8FgOTkXMCnC+DDEx9cN2M
 SrmmY1IZCmKQgjgCEsYk9GhoBqidgt7UvwqJkx3aJy8bHmAPFDDrZLmJlXXS7tMmoTDY
 6h9kMru9B3+o9/8CZdwy/YfELuF2uWeTWqgjo5/yP7q8YP/SLpdqHcgao76c1+yFY78H
 W6PgaeeuPAkNxk8XVMsOeahh8mpAWz2NzE0FTwYvJnV8ANPvUgAJdHM8Q31NycJTMrPF
 AAEAQMt5WKsxNyOUcyBNO4EU5bUXwQJnfsAF9iBXaicSXwlSfaP07uea+wbZF1KcDRiA
 6uRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689685568; x=1692277568;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6sUHst+qMfvqGd6D4drEgX+385kdv+PYqXOtITReCXQ=;
 b=QHXq/0TUEhOVDe1UaxwFLsS+lHDhZ3wMr/oLnJQ6cjs3NFscmcEJD+rtnQeUSWLaFJ
 5qdFMM0BYvRWPebnNQfmYJrc1PIIfL7RKTjXbKB9wF9g8pFlz0M2wtItOQSoeG5F6JKh
 00sJJgxChXwqGBWxNuNdT6YGktoaNRaYiOkbvSmkSH5g+99vxaqTsqw/48Me8JA27cO4
 m3nK5ywvAV7qfhfCmea02KiuESw/TS23it8THlUCu9yfBSjnu4dUeVWizbwzSukkSX8X
 foR+xphN9SBv8rpKexOzpsHVa0bOd9ez9us9oWVJZ+va68LDvRRw1NE2tlmkF2DqplUP
 PjOg==
X-Gm-Message-State: ABy/qLbVGUITovm2cW+mzJCw+I/kHjCjIZ9t0LuW88xq2sOzrTFTn59/
 UBmwbnK15LdZX1ufNIVtNH6OVg==
X-Google-Smtp-Source: APBJJlHN/ABo/31dZHX/zuzp/ACj1KfAoQbuVnqa49boqYOwScwX4fNTzdd4k6SkhYEzB4GeDz/18g==
X-Received: by 2002:a17:907:3d5:b0:982:8de1:aad9 with SMTP id
 su21-20020a17090703d500b009828de1aad9mr12232196ejb.64.1689685568703; 
 Tue, 18 Jul 2023 06:06:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1709061b4100b00982a92a849asm1014398ejg.91.2023.07.18.06.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 06:06:08 -0700 (PDT)
Message-ID: <8c4a488e-8990-8ad2-e82b-8759c9b85447@linaro.org>
Date: Tue, 18 Jul 2023 15:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Content-Language: en-US
To: Frank Binns <Frank.Binns@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sarah Walker <Sarah.Walker@imgtec.com>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
 <19a7dae4-a9bd-187f-49f8-fe9c47f44eff@linaro.org>
 <6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com>
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 13:32, Frank Binns wrote:
> Hi Krzysztof,
> 
> On Mon, 2023-07-17 at 09:29 +0200, Krzysztof Kozlowski wrote:
>> On 14/07/2023 16:25, Sarah Walker wrote:
>>> Add the device tree binding documentation for the Series AXE GPU used in
>>> TI AM62 SoCs.
>>>
>>
>> ...
>>
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: core
>>> +      - const: mem
>>> +      - const: sys
>>> +    minItems: 1
>>
>> Why clocks for this device vary? That's really unusual to have a SoC IP
>> block which can have a clock physically disconnected, depending on the
>> board (not SoC!).
> 
> By default, this GPU IP (Series AXE) operates on a single clock (the core
> clock), but the SoC vendor can choose at IP integration time to run the memory
> and SoC interfaces on separate clocks (mem and sys clocks respectively). We also
> have IP, such as the Series 6XT, that requires all 3 clocks.

Currently you have only one SoC vendor with only one SoC, so the clocks
do not vary. Describing the clocks for all possible variants is a good
idea, but then this should be clear that this implementation uses subset.

> 
> So the situation here is that Series AXE may have 1 or 3 clocks, but the TI
> implementation being added only has 1.
> 
> I guess we need to add something like:
> 
>   allOf:
>     - if:
>         properties:
>           compatible:
>             contains:
>               const: ti,am62-gpu
>       then:
>         properties:
>           clocks:
>             maxItems: 1
> 
> Or should we be doing something else?

Yes. clock-names as well..


Best regards,
Krzysztof

