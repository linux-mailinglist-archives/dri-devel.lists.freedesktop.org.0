Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A0852A67F
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 17:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24696112FC6;
	Tue, 17 May 2022 15:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38C3112FC6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:26:00 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d15so31946727lfk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=V+X+LRsejpzXZH7tsox7umkRY7xo5WQxZtVa62UBNjU=;
 b=MAvqRFZMqTF2/qVoqgWL5T0C+ULSZS7SdHzVh6LuDRdT51k+tjmab0c7gpzsf0Ql7k
 ReP/eAAoQU51GsQD4Bz0ywyVLUNnZh/mE3GNKvawkR7gvPqBw5mXHXDDgdkNrpfTpAs1
 bAMk6xyeJ1g4mnjcaeSQMvlpPsF4rbwLd+zy7LuQWikYbxdBzh0GZpJaYHhJxcWDRPdr
 liBJ3i5eBbWp55RwkiZwR+iHlOp6uft4OXTRqqT9OHhoOaU24sAJ7WOwFhn0hed1CrBs
 PnWxpalasLu5anySlBVesTRozNRF6F1oQ8HwZT5nEhEcwxQOOhte+RNCH6dwDZuqzYvq
 U0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V+X+LRsejpzXZH7tsox7umkRY7xo5WQxZtVa62UBNjU=;
 b=itZgOxFTaxXQZHDzCHhT3YS2/YksQnI1zrD5VlA5ZzICmLfpKRWFY5gor0bgD1ewu7
 z6XC5wZEv1mtoLT+7uE+ltknCiO9oFpvJO3Y5S+J+pPtFpkusrnM5rqtF4mJs+o4w4sf
 PPS6RTy0X5+0TafsqB8fmzYqd7dsJXJE/cYFYMlWEDaaXIfsxFeBX1J8KVuWcD102+6+
 u8MlJvr0yV8Yv66MOa9u4KBC+lW7r2Ykigveo+sLPOEH0RpZ8z8F/1nCVpj8dYWX89So
 GbZruKu6CgXWYZbzqpSOobOyflCAT016J9vRCZySugKkErcgejiXfzVDvkALk41lSReU
 7z9w==
X-Gm-Message-State: AOAM530LjNJKKv06OpEKxovTe/Z17KCmGNGbx1jvSVFfqrEQFBs0J+XP
 VETFGfC1aEagWsJOLYWGVoArkQ==
X-Google-Smtp-Source: ABdhPJxmP1/fh87kksGIF64YeOa63xcO4AZZoPfdVcUnKNeeAX7gyD0GjdDyznBoSgv6nNdqeC5cBA==
X-Received: by 2002:a05:6512:280e:b0:473:a0c9:5bdf with SMTP id
 cf14-20020a056512280e00b00473a0c95bdfmr17199543lfb.337.1652801159066; 
 Tue, 17 May 2022 08:25:59 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056512348200b0047255d21124sm2221lfr.83.2022.05.17.08.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 08:25:57 -0700 (PDT)
Message-ID: <1327ec95-f6b4-838d-f3f2-a115c2ab632b@linaro.org>
Date: Tue, 17 May 2022 17:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller node
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
 <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
 <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <0bc5ba24-5bfb-593e-cbd0-828ef44aabc5@linaro.org>
 <HK0PR06MB320295DB0748CEFC68B73CCF80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB320295DB0748CEFC68B73CCF80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 17:21, Neal Liu wrote:
>>>>>
>>>>> +		udc: udc@1e6a2000 {
>>>>
>>>> The same as DTS in bindings - generic node name, please.
>>>>
>>>
>>> Is it possible to use "udc: usb-udc@1e6a2000" to distinguish it between "vhub:
>> usb-vhub@1e6a0000"?
>>
>> Possible yes :), but not recommended and not wanted. Nodes should be generic
>> and prefixes are added only if there is no unit address. You can though use
>> some more descriptive label.
>>
> "udc: usb@1e6a2000" is okay for you?

Yes, it's perfect.


Best regards,
Krzysztof
