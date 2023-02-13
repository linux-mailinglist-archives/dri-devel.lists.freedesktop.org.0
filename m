Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59D694455
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B810E4BD;
	Mon, 13 Feb 2023 11:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC4E10E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:23:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so11003972wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B5s73haLgCQe0oGyFxUQwRNC+nBVILY3pPaoktdMhe0=;
 b=nwNfc2hdmvasij0R00HLwp16SvZrLPDmnDnKHni8ifBORewNhFllZqfYkzt2Hyzpgj
 XsVoPoVlMVe0ib4sFQvbprXzLrhyNqlOghra1JGAsi+Lt0voIfWrpPTYEpYy3/8nVSyw
 8sYE8AfQSVIsit8Pw3v1mMQB/I6FFs/fgaRceaUIzN1gqprHmj6a5g4liBLQ82IWgwla
 O+tudN/VV389iOt2i5dBM/aPglQW9GBAiauiN4wQ12/Y0k8qLmBubFv9Ynt6TWrUaJKM
 /Cj4tKffz/QjBDKJ+gsChjdIKAb6SDO4upU1Ep5HooeRNKfDJNZejdB7jANqkeYDDuq9
 HcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B5s73haLgCQe0oGyFxUQwRNC+nBVILY3pPaoktdMhe0=;
 b=gv0o+OJLHJ1OLZyesB5uM0TYiiwChOWyLGD0Aypa3rFcqFs/R25F1C+5nr6w9naVG1
 GNAxmIPPD7EqIj3seXYrsRsQwWJlbtyWeeBDtOnunZjciVUlVIwysS09c1ap04UBruFX
 TzoDtN8w+c079gEHy1YO8mwY3qK+cdZJfAeMFsR19xo5MaKjy00rBR9s0JBZAvRfSyZF
 +e5TW6chvmyWshxfyI+A04a0+eRXtxm6awIc3MsNeFH456X+z170LYnYcekJSXREFBuo
 YNVq093xRpBKxTKVJuW1bGMFeJf1sN+SwxrTp42043rqJMIokoriecpDP/yJQCLrQbAV
 L8hA==
X-Gm-Message-State: AO0yUKXOEzPY8Mc9IXyoTkD/bm7m/GoeDVjodCScjoDPhs9bQMqcQtIg
 PVwwWp5L7EHiC7EDG4Id/ZEq8Q==
X-Google-Smtp-Source: AK7set/nHT0SISpzHCnF1bmBGGaoXtmCsQlkjzNQTuWz+SzowtVIgu2b83bExFK/910REwbuqV8vMQ==
X-Received: by 2002:a05:600c:2e94:b0:3da:fa71:a333 with SMTP id
 p20-20020a05600c2e9400b003dafa71a333mr20497597wmn.12.1676287387165; 
 Mon, 13 Feb 2023 03:23:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b003e1df9bc86csm7018278wmz.3.2023.02.13.03.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:23:06 -0800 (PST)
Message-ID: <4055b041-c012-3be6-0aef-085ec389aabd@linaro.org>
Date: Mon, 13 Feb 2023 12:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>
References: <20230210161925.32343-1-lujianhua000@gmail.com>
 <6cffa875-d8cc-a4fe-e18d-2e24c28a49d8@linaro.org> <Y+oZOXyE8/a+vreS@Gentoo>
 <ad5dd369-842f-7301-e57d-d0445f0a5268@linaro.org> <Y+oc+kEDoiMsebWF@Gentoo>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+oc+kEDoiMsebWF@Gentoo>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 12:20, Jianhua Lu wrote:
> On Mon, Feb 13, 2023 at 12:08:27PM +0100, Krzysztof Kozlowski wrote:
>> On 13/02/2023 12:04, Jianhua Lu wrote:
>>> On Mon, Feb 13, 2023 at 11:45:23AM +0100, Krzysztof Kozlowski wrote:
>>>> On 10/02/2023 17:19, Jianhua Lu wrote:
>>>>> Novatek NT36523 is a display driver IC that can drive DSI panel. It
>>>>> is also present in the csot and boe video mode panels. It is found
>>>>> in Xiaomi Mi Pad 5 series.
>>>>>
>>>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>>>>> ---
>>>>>  .../display/panel/novatek,nt36523.yaml        | 101 ++++++++++++++++++
>>>>>  1 file changed, 101 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..a7098d0ce7e1
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
>>>>> @@ -0,0 +1,101 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt36523.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Novatek NT36523 based DSI display Panels
>>>>> +
>>>>> +maintainers:
>>>>> +  - Jianhua Lu <lujianhua000@gmail.com>
>>>>> +
>>>>> +description: |
>>>>> +  The nt36523 IC from Novatek is a generic DSI Panel IC used to drive dsi
>>>>> +  panels.
>>>>> +  Right now, only support cost and boe LCD display panels with the
>>>>
>>>> boe? both?
>>> Boe Technology Group Co., Ltd
>>
>> Then what is "cost"? If both are names, then they start with capital
>> letters or how the company officially spells itself.
> both are company name, I will search offical name for it.

"cost" is company name? Then why do you call binding with different one?

>>
>>>>
>>>>> +  resolution of 1600x2560. It is a video mode DSI panel.
>>>>
>>>> The binding or hardware supports only 1600x2560? The how it can be
>>>> "right now"? It's defined, isn't it?
>>> Yes
>>
>> What yes? How it can be "right now"? It implies it will change, so how
>> hardware can change?
> sorry, my wrong. This binding only support 1600x2560.

How binding can support only 1600x2560? How does it exactly work for
binding?


Best regards,
Krzysztof

