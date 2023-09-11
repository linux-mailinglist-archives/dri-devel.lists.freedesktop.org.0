Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5B79A7B5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5739910E2D2;
	Mon, 11 Sep 2023 11:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C9410E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:49:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31fa666000dso913658f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 04:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694432981; x=1695037781; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7uTE277R9IUMWfpcxvhVYcRRY/+i4lXQdoTCf3ndW5s=;
 b=axDll73Y9Hzn4OQnOwu9GAJsWVyhL2AEHVR2wA4ScIMtxg0NvHc9i5qpjY1JXdoPxL
 2bP6G93rgoz+znyV4NWgNjVkpKy8h9DFj/CRd4Adm4T/Wr0UpHlOwxPN0jgRypNG/lMj
 HyRT29r0GDjpiKKEhdVcmVfEX4TI3cG9xoAJjjvLluCY1vmeTRyPlC58ePVKP4ScgVXx
 rQqsmtPbPYpYbulnOjR/2B8pF7n9C77Pq3vJI6QMdprEAAev5j9JZko2mvn7B+1rlCYd
 FVRkUHSdlipyurrE27+hLWqvQcLv00cR8Y2HWmAQp80OFumLFuErBZbninLJYMUw6sRv
 NXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694432981; x=1695037781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7uTE277R9IUMWfpcxvhVYcRRY/+i4lXQdoTCf3ndW5s=;
 b=ZLnlUzeiRMFiY4QJYKdDWB/kFIW/LXzdZcZsVv3I0ToABWx1ZBqdKQ9hP7aeUCm4zg
 nhtct+C4VTkeXbo1N19C4x3jqKMrcsnCJELD1ILNieff0eWeLglybcHT0gQGc5P28uNp
 GN7hwLM1Sn6Nvhgl7Ti+FaxR6iJ/g48js2ZoRQGkJdk9v6ZwvQLab3en+G/4pcKFh9O5
 8Dytm3W+PZyyi68HeyPA04mxsdpLCzpH87LoThA8DWau3TkmNiKYrUGkjTcJZHfGVKRs
 tDPxU2LCbq9MoIMnKt3D7brpVt29elO8fxIUgw4CiuCdlUeaZtexMFlj9BWLXkmM6hB8
 Gu3Q==
X-Gm-Message-State: AOJu0Yy++mIOj1wh+pm+4p3ueQoqwvPcjjR9F6sVWEVcjdrx+vHOp3rf
 qU2MpuF9jfpHkUq93w061VEBVg==
X-Google-Smtp-Source: AGHT+IHLnKxjUB/zLnPuoIMc1DDrZGTbUd7F4GSTdG7pPu1CvVlKzmeIQ604ecyru6GcFidOBOTjFA==
X-Received: by 2002:adf:ef8d:0:b0:319:6e6a:66e with SMTP id
 d13-20020adfef8d000000b003196e6a066emr8388505wro.14.1694432981598; 
 Mon, 11 Sep 2023 04:49:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 u24-20020adfa198000000b0031f8a59dbeasm6957022wru.62.2023.09.11.04.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 04:49:40 -0700 (PDT)
Message-ID: <c4d89d97-f8d4-da2e-dea9-6c054cf07eb3@linaro.org>
Date: Mon, 11 Sep 2023 13:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 8/8] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Content-Language: en-US
To: John Watts <contact@jookia.org>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-9-contact@jookia.org>
 <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org> <ZP7il27e9cExVWaL@titan>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZP7il27e9cExVWaL@titan>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2023 11:49, John Watts wrote:
> Hello again,
> 
> On Mon, Sep 11, 2023 at 11:41:12AM +0200, Krzysztof Kozlowski wrote:
>>> +maintainers:
>>> +  - John Watts <contact@jookia.org>
>>> +
>>> +allOf:
>>> +  - $ref: panel-common.yaml#
>>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: fascontek,fs035vg158
>>> +
>>> +  backlight: true
>>> +  port: true
>>> +  power-supply: true
>>> +  reg: true
>>> +  reset-gpios: true
>>
>> Why do you need all these 5? They are allowed by panel-common.
>>
>>> +
>>> +  spi-3wire: true
>>> +
>>> +required:
>>> +  - compatible
>>
>> Missing reg. Probably also port.
>>
>>
>>> +  - power-supply
>>> +  - reset-gpios
>>> +
> 
> I have just copy pasted the other panel's yaml, so these issues apply
> there too. Should I fix that panel's yaml up first then re-copy?

If the other panel has exactly the same case, then yes, you can do like
this. But it depends on the bindings - to which ones do you refer as
your tmeplate?

Best regards,
Krzysztof

