Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1481757AF7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88110E325;
	Tue, 18 Jul 2023 11:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A6D10E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:54:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e2a6a3768so8012823a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689681248; x=1692273248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZDvfCq2rYjVFo4n3JaAZGwBu1O0j5CMRvxTlhF+phBE=;
 b=leb66+CLlHF97LLt85yV4SxY9TCEqgEUzNiJkcQh+ihcyBQvwr6uX7ola/6Va4rWOS
 8x19UvwnxZS53+PVzqyopBZ+2h+GmV15aX5TZ3fAJfUgukyZFWlxcEKowxtAWMHGLNdZ
 Pl7lwbkHzCOHYnZdKuYEFQG5jwABP23ZlGaj3kJVuHPorvxvfOacGUhNtjVIAkhdBBFA
 sM+yAbQ00jBvR2OevMUW5XvG7asOhIjplWejK3gQS+dZM430ilhxncncBU5wmeMazpT3
 vSfyrM1hB5bAOZJ8KXr2KFU2+Fd2dlMLafQKSYG6HisYENb41zP31Tk/sTVJNB9j7PXn
 VX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689681248; x=1692273248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDvfCq2rYjVFo4n3JaAZGwBu1O0j5CMRvxTlhF+phBE=;
 b=TXnxzAPjMNPsBeSaTihxkikcOHejAUG9o07t3Qj4KwSJncPJ+yj7SvyNY82MCRLbmK
 KGlm1VZug4Y8emSv4n5Te9N4QxtOcyIV3oL+6uL/QnNsN6A7JEA4D3ap8Jan0nSmnFuH
 rPv71vGKbdiGtAA4gg8d4gl+dtxAWYxI+qXFJ9xri1y5KYvMuS2SuU44xcLlmjiRpadI
 zPOt2NeRYUGHF9Hn83/v9bENMuIETJEGPZsp+WJvpjIxbwvI1L/nISiSsKpLdfOECH4W
 GgBjSDnpPcZuyMklWCuUw41n6Zb31GhhF6+s+vrB16Z0O0DPEZUwXv4EguBkkxiWytZE
 5geg==
X-Gm-Message-State: ABy/qLbuINk8JTziQR3Wwhc32SLdF3eL73G4bcHqF/wmyv74N+e1C2TP
 zi8A9eOGFkYVQE8x6QDxQW9zTA==
X-Google-Smtp-Source: APBJJlGo95nQJFKL792SHJPaSiWKgXJBaPhwi4GdonpOb/yE6DAQNPoWUsd1OUyOwDJJoiXFMUddtg==
X-Received: by 2002:a05:6402:2048:b0:51e:234:cc51 with SMTP id
 bc8-20020a056402204800b0051e0234cc51mr13412054edb.17.1689681248020; 
 Tue, 18 Jul 2023 04:54:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7dcc5000000b005217a24addbsm1124462edu.20.2023.07.18.04.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 04:54:07 -0700 (PDT)
Message-ID: <c674cc0f-087d-3333-65cd-00394aa62d32@linaro.org>
Date: Tue, 18 Jul 2023 13:54:05 +0200
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
 <01f0cf88-4e85-0c92-9723-eb9198782d0d@linaro.org>
 <b6a83ff4ba6ac92af2ab573e200cbf0b5b2847f9.camel@imgtec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b6a83ff4ba6ac92af2ab573e200cbf0b5b2847f9.camel@imgtec.com>
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

On 18/07/2023 13:47, Frank Binns wrote:
> Hi Krzysztof,
> 
> On Tue, 2023-07-18 at 08:20 +0200, Krzysztof Kozlowski wrote:
>> On 14/07/2023 16:25, Sarah Walker wrote:
>>> Add the device tree binding documentation for the Series AXE GPU used in
>>> TI AM62 SoCs.
>>>
>>
>> ...
>>
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    gpu: gpu@fd00000 {
>>> +        compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
>>> +        reg = <0x0fd00000 0x20000>;
>>> +        power-domains = <&some_pds 187>;
>>> +        clocks = <&k3_clks 187 0>;
>>> +        clock-names = "core";
>>> +        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>>> +        interrupt-names = "gpu";
>>
>> Why does it differ from your DTS?
> 
> This is just an oversight on our part. We'll make sure they both match in the
> next version.
> 

Just test your DTS before sending. You would see errors and there is no
need to involve manual reviewing. It is always better to use tools than
reviewers time. Otherwise, please kindly donate your time by helping to
review other patches.

Best regards,
Krzysztof

