Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B7B572019
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D799404E;
	Tue, 12 Jul 2022 15:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D9D93D17
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 15:59:28 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id r9so6680451lfp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j6+PXk8lV1TXVHUADsHXPNfDWOMk0hNuY2THqh6dtzw=;
 b=WCaWesZaI9ZooJ3Eti+u5meFenVeVAykhce3G/w/pyzUZuu3XyOH943ZxO27OBSzUN
 L7aEBgK/W8Alrcw+AuHvhvJBl/OC/H4k6kdNlZbo6jhkCaJqTK7hCmTzkHNzbvzYVtcn
 PN106bKvlQlzPhQaDqC7MtCmYYnBIOgtrXHj45OyCn88zBWfUzQQAAacAqajTCQ28ew4
 6fwJ2xPHLOFs4Di4yVIYOc9g5wL7+O6L/QiKIsT7ZeLmoKrbxkwuTxUMvsfpVAGyIMTa
 m6XQCiDHwOTuem6TGtmHq/lZwIMgrfUaLTR6wfTib7UNU9mNmTho1uTwhI+yBXQ628nu
 r64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j6+PXk8lV1TXVHUADsHXPNfDWOMk0hNuY2THqh6dtzw=;
 b=lH79PhlsRYAa28mJ+Rvg6t5L2h+ijvryQ7gha802FMJAg7WX5Bj98fl1K/1Ao7rri7
 PSEyevbMdfhQhyAxuBUJI6LrOhgh7o0xwK3Cb55bwKjX22gknuEoLvexxOcvlEnbcU/5
 5e3dGn8GUkY/GJlxEfArQgSlgfbLnGI/xpLYHTDYv5lMYhIeieoy/M/IX2K1e1jA7cGG
 n2RuVHb/ASf+PSeB6lnFg3RY1qifFqkYUdMtVq0Qn/lpO9sSeDP5iXEDzIHKyB71jyN8
 SmwL0wFcKWjAQJvqnf1NpdxHx+L6+oYVgW/iytf5if+ChbVUTUBfcr6jGZJa2oPGWNXa
 6mmg==
X-Gm-Message-State: AJIora+kXMOA2rnK4vA9uAfmcYNNavQ0DDgxyayQNA5MZV0vgnhMjiHg
 m9dguS6K1sxtaMFt9cs+lbW57Q==
X-Google-Smtp-Source: AGRyM1sXKSwY2kqCkXvSTvsJkmso8Nd0IefLuqwg19gmixZGRWhA3P4R74SYwesubgb1pAJocgzMAA==
X-Received: by 2002:ac2:4e03:0:b0:485:74c4:97ce with SMTP id
 e3-20020ac24e03000000b0048574c497cemr15199250lfr.13.1657641566787; 
 Tue, 12 Jul 2022 08:59:26 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a056512209500b0047f84ecae2esm2235047lfr.236.2022.07.12.08.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 08:59:26 -0700 (PDT)
Message-ID: <eeed43cf-7bd6-9d77-9e1f-e018a236a058@linaro.org>
Date: Tue, 12 Jul 2022 17:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Content-Language: en-US
To: Conor.Dooley@microchip.com, damien.lemoal@opensource.wdc.com
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
 <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
 <969567fa-77ec-48da-ef63-c5d18de4b213@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <969567fa-77ec-48da-ef63-c5d18de4b213@microchip.com>
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
Cc: niklas.cassel@wdc.com, airlied@linux.ie, palmer@rivosinc.com,
 thierry.reding@gmail.com, linux-riscv@lists.infradead.org, sam@ravnborg.org,
 masahiroy@kernel.org, daniel.lezcano@linaro.org, geert@linux-m68k.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, vkoul@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2022 17:54, Conor.Dooley@microchip.com wrote:
> On 11/07/2022 00:21, Damien Le Moal wrote:
>> On 7/11/22 04:39, Conor.Dooley@microchip.com wrote:
>>> Damien, Krzysztof,
>>>
>>> I know this particular version has not been posted for all that
>>> long, but this binding is (functionally) unchanged for a few
>>> versions now. Are you happy with this approach Damien?
>>> U-Boot only cares about the compatible & the clocks property,
>>> not the regs etc.
>>>
>>> I (lazily) tested it in U-Boot with the following diff:
>>
>> If both the kernel and u-boot still work as expected with this change, I
>> am OK with it.
> 
> It's all yours so Krzysztof :)

It's too late in the cycle for me to pick it up. If you have alternate
tree to take it through, go ahead with:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Otherwise, I'll take it after the merge window of v5.20, so in ~1 month
according to crystal ball.

Best regards,
Krzysztof
