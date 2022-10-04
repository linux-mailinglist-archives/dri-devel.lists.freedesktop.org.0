Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EB5F460C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 16:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BAF10E203;
	Tue,  4 Oct 2022 14:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D805E10E296
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 14:57:14 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y22so1636812ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1yXZ0CWIkY+Be5TJwvLWjyqsQMykcG2932nB5Fmia7c=;
 b=ae0FQRtj6b3RZ5fEgfrvbdBQsuvQkHIpByzRfAn3f7HQZlvHSX8Hr3nqho94miQOvL
 nh1baKq7HxXHcwQkavOp818eo3VfVBgP/zLc9vuVzbETe/98yZQeavRD6AFT6vzzYgdO
 cTZSagpwrj2wgV7N1wLxgd8fCma3Y9l6yVTI1oDwbcDly6626PQxTUSzP1MwPn27Yfo9
 vLXUHDvQVQr6/eh8TeTVHxXaaag42kkMsTIpeYU6xYoGAP/Puo0i8ppox8w7krfrVgVp
 sO6Dm1TQfWuMCcfNtgrZz1NS1E/BmmC1JYSaXZKWUCHkOixpSqQxTCsdizOINpvg/MEY
 Zklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1yXZ0CWIkY+Be5TJwvLWjyqsQMykcG2932nB5Fmia7c=;
 b=1OuYMBbnHLTQdz5dl5buBrgTGljvFEN7h/T2Ios0m2sJ+AdOTuFWKurv0xeveSMNaO
 Mmfsc6LzWdJgLlHCTiVPeMQcrw0YpaVZdPHaYhZVQBhK8GcM9Qk0llmTYTcGYLJsibGB
 MKs7bKH68ZkI9jkM7/C59ee6gIf+don6UB45TBiS82LYRI9L2l0RKJRhwsTIrOzyDmgw
 lugsa7Pf5Z1sv3JLAylmoVtqQ42eFVFsmoBT+0khEn1DYkJmX4fSSOalQFGPnx/SeNsD
 lBti5Dhn+RKcKlX67I2sMgTw8wisgDX5yYNb+IZvW72BvCSsIYOwyWEcEq8sE3/BunVO
 w+iA==
X-Gm-Message-State: ACrzQf0VkXoRNdcOWDRg8ZBu5XRfPGpPyJCXuLqylst+fhdNvyer+E1N
 obeTQW4dF9rlknYypv83O2Iobw==
X-Google-Smtp-Source: AMsMyM4M0ZuBIqfAgIooUuidg91Pc4bHu8QL/AB+nfSqAtrM1bWqhJoApIv7Xwy5rdRCSW2vB62/eQ==
X-Received: by 2002:a2e:bba2:0:b0:26b:e4ba:851d with SMTP id
 y34-20020a2ebba2000000b0026be4ba851dmr8725853lje.45.1664895433020; 
 Tue, 04 Oct 2022 07:57:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05651203b500b0049d0a98f73csm1120402lfp.154.2022.10.04.07.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 07:57:12 -0700 (PDT)
Message-ID: <1dcdc4e3-520c-3f6d-9994-9eedc2211c6d@linaro.org>
Date: Tue, 4 Oct 2022 16:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: display: panel: use spi-peripheral-props.yaml
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221004120907.72767-1-krzysztof.kozlowski@linaro.org>
 <YzwvDEKAzbqjSYjT@pendragon.ideasonboard.com>
 <64a355f2-e9a1-dcca-cb86-48805acae8d5@linaro.org>
 <YzwyT28hf7daYqa1@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YzwyT28hf7daYqa1@pendragon.ideasonboard.com>
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
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Mack <daniel@zonque.org>, Markuss Broks <markuss.broks@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/10/2022 15:17, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Tue, Oct 04, 2022 at 03:10:29PM +0200, Krzysztof Kozlowski wrote:
>> On 04/10/2022 15:03, Laurent Pinchart wrote:
>>> On Tue, Oct 04, 2022 at 02:09:07PM +0200, Krzysztof Kozlowski wrote:
>>>> For devices connectable by SPI bus (e.g. already using
>>>> "spi-max-frequency" property), reference the "spi-peripheral-props.yaml"
>>>> schema to allow using all SPI device properties, even these which device
>>>> bindings author did not tried yet.
>>>
>>> Isn't this done implicitly by spi-controller.yaml ? SPI devices that are
>>> children of an SPI controller should match the patternProperties
>>> "^.*@[0-9a-f]+$" in that file, which has a $ref: spi-peripheral-props.yaml.
>>> Is there something I'm missing ?
>>
>> You are correct about one side of this - SPI controller bindings.
>> However these schemas here have clear: additional/unevaluatedProperties:
>> false, thus when they find DTS like:
>> panel@xxx {
>>   compatible = "one of these spi panels";
>>   ...
>>   spi-cs-high;
>>   spi-rx-delay-us = <50>;
>>   ... and some more from specific controllers
>> }
>>
>> you will get errors, because the panel schema does not allow them.
>>
>> The bindings were done (some time ago) in such way, that they require
>> that both SPI controller and SPI device reference spi-props.
> 
> You're absolutely right that additionalProperties needs to be replaced
> by unevaluatedProperties. Can the additions of $ref be dropped, or is
> that needed too ?

I just wrote above  - you need to reference the spi-props. Otherwise all
the SPI-related properties will be unknown/unevaluated.

Best regards,
Krzysztof

