Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD17952A379
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 15:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD4110F48E;
	Tue, 17 May 2022 13:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19B710F48E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 13:33:52 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j4so31345371lfh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jujkXXpL/kb/c7aZAyCjUl23gmXI2y9oErwqfBwIlr0=;
 b=OZEJ/Msp7XM8K+1vhwmBAlOo1ZNIN7ylNxEvoXh+uoCyiSwx/wEqHk0fKd2sW7xOZp
 bNbcNseXOWJ/lELXwKYbllrd9tJwDVpc1OQwUqRbGMSsx9kTxKn9SmLTr0TN+F6y/haw
 dkYskTaivYdRG8MnydOcW1QVMmZHuOZ360Llc6D7qcW9pFQrv4ziIqQ+mwU2xV8cOrIz
 C+THD4t+tyLo22Udr7I9Ff0q9X/7L3pr0AHtQ0BavcH065say7bldIrfJ0isYuWaF/EN
 o4UiyutD0Sp26Bz0HosBnNHEDrdE4KzAaJjRMyGlGi5YNovDdmhBJg2GyScU3Z5D58g7
 oHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jujkXXpL/kb/c7aZAyCjUl23gmXI2y9oErwqfBwIlr0=;
 b=nu31wdCFexgePLCeIa3LMMg/LBvoTDgZjl82bNfGIdX01+xUjZ6ideHPFHJCsTBliM
 N5D91UOhF1QAlX8eQ8Whv06RoH+C9NLzkgQE16u3LZ/F8Ik0/NaBZ81T5NHZc2VSdzYW
 L4KWSzbANf8ArU1EJwMPz2hPA2A5rrjZEM07LyU3jbKNZ6gvwuCxw+aCa0KOTY5fLr9V
 QTE2Th+42mslhXldPZNvJLbhZrzB9O2QFizIcYPxkhMU6kzCGWhcd0935AljOckY9A9h
 IRfCtijwB55s96T/6+txyfiJ7Dg0ynIhbcUWPwc0WfOO0vFLn/inF1zqQHFgRWWsEUnm
 8vPg==
X-Gm-Message-State: AOAM530QlRstekdovmlje9t7ejO2jri8qND2dg/DHpgLVWFlUHjL9hdr
 vPQc5I1Iti1+qB9lziVfywQ3+w==
X-Google-Smtp-Source: ABdhPJwvty/7HIe4QthtrDFz9rwI5bwb99VvY5FFuB5Si25wkdLQ00AWYk839j19WtxQgf14jzNdGw==
X-Received: by 2002:a05:6512:b83:b0:44a:9fb7:784b with SMTP id
 b3-20020a0565120b8300b0044a9fb7784bmr16713124lfv.547.1652794430970; 
 Tue, 17 May 2022 06:33:50 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c9-20020ac24149000000b0047255d21108sm1589584lfi.55.2022.05.17.06.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 06:33:49 -0700 (PDT)
Message-ID: <364d25ee-e7e3-96d3-a2ff-9befcce3f0ff@linaro.org>
Date: Tue, 17 May 2022 15:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 03/13] arm64: tegra: Add Host1x and VIC on Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 digetx@gmail.com
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-4-cyndis@kapsi.fi>
 <424b02f3-eb53-68d0-bfee-5488dbcefa71@linaro.org>
 <1fccdfe8-d44c-2d56-e572-628998efc985@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1fccdfe8-d44c-2d56-e572-628998efc985@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 10:38, Mikko Perttunen wrote:
>>>   
>>> +		host1x@13e00000 {
>>
>> Generic node names, if that possible. Since the bindings do not exist in
>> the next, I actually cannot figure out what's host1x...
> 
> Host1x is a hardware block that provides programmable DMA channels, HW 
> synchronization primitives, and virtualization support for IP blocks 
> connected to its "host1x bus". So far I haven't found a one or two word 
> way to describe it despite efforts. In any case, considering all the 
> existing documentation and device trees that use this name, I'd prefer 
> not changing it (especially as I don't know what else it could be called).

OK


Best regards,
Krzysztof
