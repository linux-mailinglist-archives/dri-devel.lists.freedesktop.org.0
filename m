Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA23678404
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFC810E51F;
	Mon, 23 Jan 2023 18:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FF310E51F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 18:04:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11223642wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=anFXoyEP6MdeJv2aFnOn2djhLdOnRB3KkfZ+i/PHK1A=;
 b=sfPLtClwTP6+bjcDSHDKT76vf1By1orq3gYFqDpSbos1AlpD/W7qTQa1Sc9rXatkjm
 AKFhKnC4oaQrFH9+oSbGVjfMEQTE0+Mz+H9x6A1FVl4OAR3feyHtgC2jqq3ZZpqZ6avy
 J16KzgPnfoK23Lk7G+99caqnxtQzv8fJeUpH0R7SzWFPPHYqwxgwIe7eHtHLHqBCF2Ii
 KMb8r3n99i/YfADB44b89Cwb5nCVn2EyMW55iKSra8LSaQBHenAmCH7ezIlAhvm/a4Ed
 s+4g4Gu3Hx8kwpgY7E5JgfPS7LqmL7XJIMnyC2+avu7riM9hVaN7DMAohHOxju+gGpxp
 02Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=anFXoyEP6MdeJv2aFnOn2djhLdOnRB3KkfZ+i/PHK1A=;
 b=qDifldIsjcQjvr4gt9393sYohc1CSQR4uCdzJFVvkAYO5l82o2sWo+DzhMudiczyW1
 LkWFb8Ew2/uAa7tmBDXApnMKShcbd33Of6mDOs0Or/cpmrtkwapJIFG7tKDomN4W/GRD
 p/xhSV5cGBvGJPd/bL/1R8NW++1IvlLZfkb26L4UdDLH3kMqxIYcpHXmvtQeYwSkC5WH
 48d8KIlPyHR0F6uF/6vrGu0yxdkVjmuQF/UvVwEMgIwiqRVYf8sRWYIP9HN0w6touN1O
 3c16opX2ssPiNoiY/N3oR3LmW6THgNg01xRZV+TEVyYx6qx6m/UUWIY7xITOqrOH/w+j
 5WOQ==
X-Gm-Message-State: AFqh2kqMS49hh/VCv3sUdM6lAphR7pSkdwEImmUAVqKHgCMyfxEKvvZ/
 IULC8AYoquYXZawMiIotJH9eXygwXUmLk0FP
X-Google-Smtp-Source: AMrXdXsaWqphrHy2nyPW3MYeFGKYcrJ0wH2+cfeuYZdbrMrHnTDgKlWk4k21+0qNhS1zQfj2yHOagg==
X-Received: by 2002:a05:600c:3545:b0:3c6:e60f:3f4a with SMTP id
 i5-20020a05600c354500b003c6e60f3f4amr25070407wmq.1.1674497039690; 
 Mon, 23 Jan 2023 10:03:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a7bcd12000000b003db0659c454sm13214506wmj.32.2023.01.23.10.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 10:03:59 -0800 (PST)
Message-ID: <897387b7-e6fa-a49d-f24f-21c7d729f484@linaro.org>
Date: Mon, 23 Jan 2023 19:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/4] drm: panel: jadard-jd9365da-h3: Fix panel vendor and
 model
Content-Language: en-US
To: Jagan Teki <jagan@edgeble.ai>
References: <20230123164018.403037-1-jagan@edgeble.ai>
 <ae50541f-7456-6088-b310-c67f653176ee@linaro.org>
 <CA+VMnFyfK-eZhneJuf54EngcS8XmhnOPXXzdjzBsiChpJV-7rg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+VMnFyfK-eZhneJuf54EngcS8XmhnOPXXzdjzBsiChpJV-7rg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Tom Cubie <tom@radxa.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 18:45, Jagan Teki wrote:
> On Mon, 23 Jan 2023 at 22:52, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 23/01/2023 17:40, Jagan Teki wrote:
>>> The initial datasheet claimed that chouzhong designed this 10"
>>> DSI panel on top of JD9365DA IC, but later Radxa mentioned that
>>> chouzhong is the manufacturer.
>>>
>>> So the actual design of the panel, gsensor, and customized FPC
>>> is done by Radxa. The panel model named is Radxa Display 10HD
>>> with AD001 is the part number.
>>>
>>> Fix the binding and panel driver with the proper panel vendor
>>> and model.
>>>
>>> Fixes: <6b818c533dd8> ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
>>> Fixes: <bb3098eead99> ("dt-bindings: display: Document Jadard
>>
>> Does not look like correct syntax. Did you run checkpatch?
> 
> Yes. I did check with --strict as well.

Anyway, it's not correct. <> are not valid and commit msg should not be
wrapped.

> 
>>
>>> JD9365DA-H3 DSI panel")
>>> Reported-by: Tom Cubie <tom@radxa.com>
>>> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
>>> ---
>>>  .../bindings/display/panel/jadard,jd9365da-h3.yaml  |  4 ++--
>>>  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c    | 13 ++++++++-----
>>
>> Bindings are always separate.
> 
> Correct, but separation here triggers a warning for compatible not found.

Which should point you to the problem - you cannot remove compatibles...

> 
>>
>>>  2 files changed, 10 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
>>> index c06902e4fe70..10ba1b813304 100644
>>> --- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
>>> +++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
>>> @@ -16,7 +16,7 @@ properties:
>>>    compatible:
>>>      items:
>>>        - enum:
>>> -          - chongzhou,cz101b4001
>>> +          - radxa,display-10hd-ad001
>>>        - const: jadard,jd9365da-h3
>>>
>>>    reg: true
>>> @@ -52,7 +52,7 @@ examples:
>>>          #size-cells = <0>;
>>>
>>>          panel@0 {
>>> -            compatible = "chongzhou,cz101b4001", "jadard,jd9365da-h3";
>>> +            compatible = "radxa,display-10hd-ad001", "jadard,jd9365da-h3";
>>>              reg = <0>;
>>>              vdd-supply = <&lcd_3v3>;
>>>              vccio-supply = <&vcca_1v8>;
>>> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> index 48c1702a863b..ea89cecad0cf 100644
>>> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> @@ -167,7 +167,7 @@ static const struct drm_panel_funcs jadard_funcs = {
>>>       .get_modes = jadard_get_modes,
>>>  };
>>>
>>> -static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
>>> +static const struct jadard_init_cmd radxa_display_10hd_ad001_init_cmds[] = {
>>>       { .data = { 0xE0, 0x00 } },
>>>       { .data = { 0xE1, 0x93 } },
>>>       { .data = { 0xE2, 0x65 } },
>>> @@ -364,7 +364,7 @@ static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
>>>       { .data = { 0xE7, 0x0C } },
>>>  };
>>>
>>> -static const struct jadard_panel_desc cz101b4001_desc = {
>>> +static const struct jadard_panel_desc radxa_display_10hd_ad001_desc = {
>>>       .mode = {
>>>               .clock          = 70000,
>>>
>>> @@ -384,8 +384,8 @@ static const struct jadard_panel_desc cz101b4001_desc = {
>>>       },
>>>       .lanes = 4,
>>>       .format = MIPI_DSI_FMT_RGB888,
>>> -     .init_cmds = cz101b4001_init_cmds,
>>> -     .num_init_cmds = ARRAY_SIZE(cz101b4001_init_cmds),
>>> +     .init_cmds = radxa_display_10hd_ad001_init_cmds,
>>> +     .num_init_cmds = ARRAY_SIZE(radxa_display_10hd_ad001_init_cmds),
>>>  };
>>>
>>>  static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>>> @@ -452,7 +452,10 @@ static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
>>>  }
>>>
>>>  static const struct of_device_id jadard_of_match[] = {
>>> -     { .compatible = "chongzhou,cz101b4001", .data = &cz101b4001_desc },
>>
>> This breaks ABI. When was support for it merged?
> 
> It was merged last year, in September
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6b818c533dd8615a803a72733eace58fd06e5a3c

So you cannot remove it.

Best regards,
Krzysztof

