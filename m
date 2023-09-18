Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003837A492E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 14:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC5510E004;
	Mon, 18 Sep 2023 12:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB5410E004
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 12:06:25 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52a5c0d949eso5342928a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695038784; x=1695643584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aumliCM8GUMBUS2SEdLGQ85Th+kHvEeQ+AEeZe5dib8=;
 b=MPWFfK9clCA/4ivewEM7CTmRW41V/02GdyRAzXx9QAELFnoJaGkRVrqiORygEvo6rA
 Xrjlc2G3/ilBjravGXZhlcPu88lGMRvsNHtww05x9GQCSNIukcffNwys9c+zi3RddRrH
 rK/LUWKZmNd64yoc6ax5aXsOq/QZGf1uI7+Zy+8o11lSm0c8fVD2FCKVzYscIKQXuZig
 tt1wHCxARCEj+rf6z0duX4Truk4t304IbjKGu/tWXCme+Q7mmlNgd+HDD9buVkDtSfpg
 W9EMhGcCKmD20dua+0klWf4E/F3IuEg+IfBxbMDAO1U6OHjMYjWgkklVdOG57PltCSJ7
 Qw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695038784; x=1695643584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aumliCM8GUMBUS2SEdLGQ85Th+kHvEeQ+AEeZe5dib8=;
 b=OTdfVg+K8vEQ06hL1/ejQdnTTdlV3gJxHbV5Pqg91oD3Mz+XoubOFi2Z+OpVNiI2aM
 zZOiJ+1xwxvG7ZttiJiiOHKGARUYdAozHN2/HOiSwuM4P8vCaiJQbVWOZ1j2/535Ed4A
 y6yR98PRMIerZAbG5GHaMeT7eBS41sbTz47IPD8M8ekQOn8WVaoDs4DaR3lLJ6pW+3zC
 Z5XkpilZV1aAobn0h7Nsjccws/mR/OKvRbept7TPlLL4g9GroGmTFg7p+DmSqAQ3G6qI
 xhyBDn7FrMr6ELZXvgsWNGkd6FoiknPDjpGTQPlnoiqB+rSOgYQ7fybtotnGVS+s1L/a
 y3nQ==
X-Gm-Message-State: AOJu0YziACVMC/KVzldu/F9NNXf9V89XLOiruWr5xNBwXcWLhG94vMuL
 uBfzGp4zNuDlXXsb8e5U2pqSdQ==
X-Google-Smtp-Source: AGHT+IF5uZI+RrO4UyOx4conpZwE0U5Px/QCIg8MSJ51Cyg3pLAceDda5BuKxe/6jm0PrW80qcEXBg==
X-Received: by 2002:a17:906:2255:b0:9a5:d972:af43 with SMTP id
 21-20020a170906225500b009a5d972af43mr7668013ejr.65.1695038784221; 
 Mon, 18 Sep 2023 05:06:24 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
 by smtp.gmail.com with ESMTPSA id
 sb4-20020a170906edc400b00992b8d56f3asm6357088ejb.105.2023.09.18.05.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 05:06:23 -0700 (PDT)
Message-ID: <837865e5-739e-72c2-140f-2299e9ae03ae@linaro.org>
Date: Mon, 18 Sep 2023 14:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 8/8] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Content-Language: en-US
To: John Watts <contact@jookia.org>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-9-contact@jookia.org>
 <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org> <ZQdgeA5tQA4xK5qL@titan>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZQdgeA5tQA4xK5qL@titan>
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

On 17/09/2023 22:24, John Watts wrote:
> On Mon, Sep 11, 2023 at 11:41:12AM +0200, Krzysztof Kozlowski wrote:
>> Missing reg. Probably also port.
> 
> Hello again,
> 
> I've been working on v2 of this series and done some initial cleanup.
> 
> Right now it looks a bit like this:
> 
>> allOf:
>>   - $ref: panel-common.yaml#
>>   - $ref: /schemas/spi/spi-peripheral-props.yaml#
>>
>> properties:
>>   compatible:
>>     const: fascontek,fs035vg158
>>
>>   spi-3wire: true
>>
>> required:
>>   - compatible
>>   - reg
>>   - port
>>   - power-supply
>>   - reset-gpios
> 
> Does this seem correct?
> - reg is required by spi-controller
> - port is listed in panel-common
> - power-supply is listed in panel-common
> 
> I'm guessing that the required section just lists the minimal
> properties needed for this specific device tree yaml?
> There's nothing implied by allOf?

Ah, then it is fine.

Best regards,
Krzysztof

