Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2133C707677
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE4810E2E7;
	Wed, 17 May 2023 23:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2523210E2E7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 23:34:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1170D860F1;
 Thu, 18 May 2023 01:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684366439;
 bh=7cQ8MHnnkw+u4jPFTbH2QZwg15cKSVff/yxwNCVRTfw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dMOrzvFm2psxlRz97auMZAlBgFKUPxr0qVAEAwL0I4CBChLUN3FZNjMd5xTXFGf9V
 407aBtxtJOSZYzjQdTsWcPV+3YoNk/Tq0R1G1NNqTpehT1S/3/GtcBwX88w8ajV6Ey
 bXGEm+RodWF1m32wYr1rOXSx7ExznKr+ZEWhGPp4JO2Fo3DBtPFGGHlH0m9C2knCea
 xbYa4t/i5Z5XukvYQy9MFc3Gp9EmHJk210wOuzVGgg5clYiiMtWdx/rhmqL8FtRc8N
 V2y5ll2MlozQCOJwg+o9qudMMXAWf2G8GU+rd1w0NIphJ3VZCvOtFKvpPShl+PPYTE
 vUcw9SuDwEKiQ==
Message-ID: <5f201903-17cb-5054-763c-f03b1066db1d@denx.de>
Date: Thu, 18 May 2023 01:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/3] ARM: dts: stm32: fix several DT warnings on
 stm32mp15
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
 <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
 <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/17/23 19:04, Raphael Gallais-Pou wrote:
> Hi Marek

Hi,

> On 5/17/23 17:41, Marek Vasut wrote:
>> On 5/17/23 16:35, Raphael Gallais-Pou wrote:
>>
>> Hi,
>>
>>> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>>> b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>>> index 0f1110e42c93..a6e2e20f12fa 100644
>>> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>>> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>>> @@ -457,8 +457,7 @@ &ltdc {
>>>        status = "okay";
>>>          port {
>>> -        ltdc_ep0_out: endpoint@0 {
>>> -            reg = <0>;
>>> +        ltdc_ep0_out: endpoint {
>>>                remote-endpoint = <&sii9022_in>;
>>>            };
>>>        };
>>
>> This LTDC port/endpoint stuff always scares me, because I always feel I get it
>> wrong.
>>
>> I believe the LTDC does have one "port" , correct.
>>
>> But I think (?) that the LTDC has two endpoints, endpoint@0 for DPI (parallel
>> output out of the SoC) and endpoint@1 for DSI (internal connection into the
>> DSI serializer) ?
> 
> You are correct indeed, I rushed the patch and did not thought about this. I
> agree that this can be confusing, as I also take some time to think through it.
> 
>>
>> Only one of the endpoints can be connected at a time, but there are actually
>> two endpoints in the LTDC port {} node, aren't there ?
> Yes, they are mutually exclusive.
>>
>> So the original description should be OK I think , maybe #address/#size-cells
>> are missing instead ?
> 
> Thing is: this file is only included in two device-trees : stm32mp157c-dk1.dts
> and stm32mp157c-dk2.dts.
> 
> Among those two files there is only one which adds a second endpoint. Thus if
> the fields are set higher in the hierarchy, a warning yields.

I do not understand this one part, which warning are you trying to fix ?
I just ran '$ make CHECK_DTBS=1 stm32mp157a-dk1.dtb stm32mp157c-dk2.dtb' 
in latest linux-next and there was no warning related to LTDC .

I think if you retain the stm32mp151.dtsi &ltdc { port { #address-cells 
= <1>; #size-cells = <0>; }; }; part, then you wouldn't be getting any 
warnings regarding LTDC , and you wouldn't have to remove the 
unit-address from endpoint@0 .

btw. I do use both endpoint@0/endpoint@1 in Avenger96 DTOs, but those 
are not submitted yet, I have to clean them up a bit more first.

> One way to do it would be to make the endpoint@0 go down in the device-tree with
> its dependencies, so that both endpoints are the same level without generating
> noise.

I'm afraid I really don't quite understand which warning you're 
referring to. Can you please share that warning and ideally how to 
trigger it (the command-line incantation) ?

-- 
Best regards,
Marek Vasut
