Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C917FD06E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 09:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2488710E06D;
	Wed, 29 Nov 2023 08:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526E710E06D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 08:14:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a00c200782dso922456366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701245684; x=1701850484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=15rBzMWMbcNTsXkPW+OzoO0aYPOme+aI+6A4C5XO+to=;
 b=UnZviBOnB7zdNyIlcGiAzKhaU4hvG1b2lhXfa06dvAmQUzUsIK6j1aYAxi2WH9h87O
 SVuthf2pmMBUGWpi+/D3RBYvCt84s+vZb8WgAC0fabDc9uj8h/LQxs51+I6AuDNRFV3Y
 uvAro+HnVl4YdJyYEJqZAjm3xtwZMQ0QO4r7JSfX4ePUhm+H9KeZupPhnVGF9ywzZtgS
 6YPy6d/JCOrRjcRuHTv1RkUzuajNG0wewfvBgPK/wgCklaUuPEdu8eHxXo9A3r4jyo2h
 2WM856k2oDyvwxwLQb7wfZoJE/srpMdvZjpvFpo80wxxJTzOvOsg8HdfQm1v7BLu9bdG
 AbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701245684; x=1701850484;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=15rBzMWMbcNTsXkPW+OzoO0aYPOme+aI+6A4C5XO+to=;
 b=gY8RVc/BhhBJtyTL+QiV7Fn5a09PCqKSAv+XD35VoTXcO7T8UtsbQzgMx2Uz4sAZlL
 liU0+yyy6L6iXsOrOUKL3E7SaboYC0miwDUhiJBKBVZvJsBv+oR4/tgzRuoqbST+HGf5
 PM08lYv4Ei0mDdDfz7+alCrxaZQJcIqr/aIQ8xwYU4RKGqUFe8WWAsl3Q/Dw01VAmhK/
 qCMCMFRaGF5yMw7RSHG8MDhpTYHuIoBSJM6TdUY8pPpaNWap+wEtRj5uecd9bmS0ko17
 rsO0OpxLCl4Om/Oip8H9T+eys8R6es5zgh5W3MqDzVd7c2DoCO7tlT97xMt7ntIBO/6C
 8h9g==
X-Gm-Message-State: AOJu0Yw4nY3j6Y2515CIlNWKXBCZQYH7FXuucRaMXz+Y1thpFfNBKmJL
 X71D58ZUt2IPowraOuG+fL78Dg==
X-Google-Smtp-Source: AGHT+IHTVIeLCkDbRpmFWEF8VvCsbmcByfExaLNid6uMk5lNlfrT9gg5TMULBgjkmROlhQ2Mzw2usA==
X-Received: by 2002:a17:906:9c12:b0:9df:e39d:e0ed with SMTP id
 ff18-20020a1709069c1200b009dfe39de0edmr11142520ejc.24.1701245684618; 
 Wed, 29 Nov 2023 00:14:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a1709060a5600b009c3827134e5sm7547416ejf.117.2023.11.29.00.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 00:14:44 -0800 (PST)
Message-ID: <555a6820-3e28-4eae-93d8-5cd023326acb@linaro.org>
Date: Wed, 29 Nov 2023 09:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: display: Add yamls for JH7110 display
 system
Content-Language: en-US
To: Keith Zhao <keith.zhao@starfivetech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-2-keith.zhao@starfivetech.com>
 <cb7395a9-71e8-415e-90d5-866a2aeadf28@linaro.org>
 <20502c84-c3af-4a60-9f5f-d8cc05743866@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20502c84-c3af-4a60-9f5f-d8cc05743866@starfivetech.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2023 04:13, Keith Zhao wrote:
> 
> 
> On 2023/10/25 20:50, Krzysztof Kozlowski wrote:
>> On 25/10/2023 12:39, Keith Zhao wrote:
>>> StarFive SoCs JH7110 display system:
>>
>> A nit, subject: drop second/last, redundant "yamls for". The
>> "dt-bindings" prefix is already stating that these are bindings, so
>> format is fixed.
>>
>>> lcd-controller bases verisilicon dc8200 IP,
>>> and hdmi bases Innosilicon IP. Add bindings for them.
>>
>> Please make it a proper sentences, with proper wrapping.
>>
>>>
>>> also update MAINTAINERS for dt-bindings
>>
>> Not a sentence, but also not really needed.ok I see.
>>
>>>
>>> about this patch, I tested the dtbs_check and dt_binding_check
>>> with the result pass.
>>> Based on the feedback of the previous version, the corresponding arrangement is made
>>
>> Not relevant, so not really suitable for commit msg.
>>
>>>
>>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>>> ---
>>>  .../starfive/starfive,display-subsystem.yaml  |  41 +++++++
>>>  .../starfive/starfive,jh7110-dc8200.yaml      | 109 ++++++++++++++++++
>>>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |  85 ++++++++++++++
>>>  MAINTAINERS                                   |   7 ++
>>>  4 files changed, 242 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>>>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>>>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>>> new file mode 100644
>>> index 000000000..f45b97b08
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>>> @@ -0,0 +1,41 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/starfive/starfive,display-subsystem.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Starfive DRM master device
>>
>> What is DRM in hardware? I know Digital Rights Management, but then
>> subsystem seems wrong. If you mean Linux DRM, then Linux is not a
>> hardware, so drop all Linuxisms and describe hardware.
> ok , will only keep hardware describe in my next version
>>
>>
>>> +
>>> +maintainers:
>>> +  - Keith Zhao <keith.zhao@starfivetech.com>
>>> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
>>> +
>>> +description:
>>> +  The Starfive DRM master device is a virtual device needed to list all
>>
>> Virtual device? Then not suitable for bindings, sorry.
>>
>>> +  display controller or other display interface nodes that comprise the
>>> +  graphics subsystem.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: starfive,display-subsystem
>>> +
>>> +  ports:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> No, ports is not phandle-array. ports is object, always.
>>
>>> +    description:
>>> +      Should contain a list of phandles pointing to display interface ports
>>> +      of display controller devices. Display controller definitions as defined
>>> +      in Documentation/devicetree/bindings/display/starfive/
>>> +      starfive,jh7110-dc8200.yaml
>>
>> Use standard graph ports, not some own, custom property.
>>
>> Anyway, entire binding should be dropped. You do not need it even.
> Hi Krzysztof:
> Virtual device is not suitable for bindings, matbe I need associate it with the real hardware.
> such as the top clocks & reset , irq , etc.
> Currently I configure them in another yaml file. Logically speaking, this is more suitable.
> 
> Can adding the corresponding hardware description change its fate of being deleted?

I am not sure if I follow. Bindings and DTS describe the hardware, so if
you configure device A clocks in a device B node, then it is not
correct. If you add binding for something not being a real device, it is
not correct.

Feel free to bring proper hardware description, not Linux. This entire
binding was written to describe Linux driver, which is not correct.

Best regards,
Krzysztof

