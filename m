Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1652A55C
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 16:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED7C10E0F7;
	Tue, 17 May 2022 14:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159CF10E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 14:53:38 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id g16so22078512lja.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=98lrMyDx9nA58tX+jL8WsvjaXFJ5bPfTC4nB38BPHxA=;
 b=x9dx0SlO4F+EkMbBg+vshW88M1gEMckHm0L13WDfzZo5c4+BVCTmrbAdnJ98gufYJe
 Qmf4hd07LDsg6x1ZYTY8fQRD+qwnKQqEaqSHOxwf8CwwGwozgEkqQ5wn3k297ne+94Lu
 10/RKKdcjfqL7DzHy/z/Kh5cWmJ1mh2DFzqTnLTS5JSAlOcy6yTHk745eI1I16HuRLPi
 +BPF/07xb2jWxwr35+dsqwKrBN7oLLmgdIR1oo1SaIAIZDK5CTJXESaVi55t+rvO8Woh
 Cyh4OYqy/lTKbOr0y3+SFEmVPs6wxSz+h7W+MS30+uUq3kWSwySQimWQ04pqLHNAe3ij
 HKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=98lrMyDx9nA58tX+jL8WsvjaXFJ5bPfTC4nB38BPHxA=;
 b=mEQjCsF6FT/adfOrtSDcFAW7omvvsIu+gLB0qs8Az/Z14XvJGVBjLot+6V4A6nPbuH
 cu9gYLiac9pCFELOkJDxR2QJoQAgistp7lS617YACta3tXgGY0094QhAA7XM2P0c1v3M
 /YgV89cBNROOgyu4/jQBUAxO2fj0V/j2lFXx+kHMGj8BwckcjvLc85KCOOxEZEpgOWt7
 GVx4dkmSIFUNhR6fgTalNi59Sp17SQRv+kMhEyaGX1x9S/kPvAJV4FeUVu2qwkdETLqb
 GHLBK+TxR40EGn/HCbRJgIpdhinHQHvkEzF9xjBniQW3OnKMHjqawJNr4SxRAfAQPCcv
 fe3A==
X-Gm-Message-State: AOAM532YAE1wx7sc2GwrV7ehGu/CDz4NVA4zkxrvHHYzVpFjWBAupT17
 D5CIwzuR1T5qzqFY28bYGD6rXg==
X-Google-Smtp-Source: ABdhPJyWvHzwFXV4y4dwE1Mg+4vxEcyCuwAK4eajYXdjTegf080biutfjdxui5eX5IbFoPm6jzW9uQ==
X-Received: by 2002:a2e:9d08:0:b0:250:d483:d734 with SMTP id
 t8-20020a2e9d08000000b00250d483d734mr14679734lji.406.1652799215969; 
 Tue, 17 May 2022 07:53:35 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 w17-20020ac254b1000000b0047255d210f8sm1611527lfk.39.2022.05.17.07.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:53:35 -0700 (PDT)
Message-ID: <0bc5ba24-5bfb-593e-cbd0-828ef44aabc5@linaro.org>
Date: Tue, 17 May 2022 16:53:33 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 17/05/2022 16:50, Neal Liu wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Tuesday, May 17, 2022 8:00 PM
>> To: Neal Liu <neal_liu@aspeedtech.com>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Krzysztof
>> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>;
>> Andrew Jeffery <andrew@aj.id.au>; Felipe Balbi <balbi@kernel.org>; Sumit
>> Semwal <sumit.semwal@linaro.org>; Christian König
>> <christian.koenig@amd.com>; Geert Uytterhoeven <geert@linux-m68k.org>;
>> Li Yang <leoyang.li@nxp.com>
>> Cc: linux-aspeed@lists.ozlabs.org; linux-usb@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
>> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org
>> Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller
>> node
>>
>> On 17/05/2022 10:25, Neal Liu wrote:
>>> Add USB2.0 device controller(udc) node to device tree for AST2600.
>>>
>>> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
>>> ---
>>>  arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi
>>> b/arch/arm/boot/dts/aspeed-g6.dtsi
>>> index 3d5ce9da42c3..5517313eb2b5 100644
>>> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
>>> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
>>> @@ -298,6 +298,16 @@ vhub: usb-vhub@1e6a0000 {
>>>  			status = "disabled";
>>>  		};
>>>
>>> +		udc: udc@1e6a2000 {
>>
>> The same as DTS in bindings - generic node name, please.
>>
> 
> Is it possible to use "udc: usb-udc@1e6a2000" to distinguish it between "vhub: usb-vhub@1e6a0000"?

Possible yes :), but not recommended and not wanted. Nodes should be
generic and prefixes are added only if there is no unit address. You can
though use some more descriptive label.


Best regards,
Krzysztof
