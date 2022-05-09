Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E513751FA7C
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48C210EAC8;
	Mon,  9 May 2022 10:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FDF10EAC8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:50:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 341A21F43B9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652093437;
 bh=MIuLmVe6TIzgT754hZGMYSoOyD19xD3PkF1IXcgoh98=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MaHkG/E3YW6LJ0G4SAtovaqL+jdNBJVE7a3iT0Iu++K4sfapfWhqcY5cd+EZQZ27y
 Ix+vNnxkEsWHplam96f531sR+hi1mAfSJmaWeZZwumwaL0LqXAEg01wFCvsX7V2UqP
 da0oJ+fb2xi8Ff8KGf3utMwi7s/1Wn8IbkI1R9eBH/aiJ2ReDRQm1dUgxi1FRIzA1+
 k7aOXbcYKAgy7KgwXBMme94SXNGKXIE3oH68474nZ+sw1kjQMLKkGxGLjksK+8eyk9
 kSvfIcy8xIdcRhbz4pWKX1dpug9cAiF7pnmLnnBMksfdu9TNixAiUJ1q0zX5U/V6KS
 tGBvfTnFh9vUw==
Message-ID: <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
Date: Mon, 9 May 2022 12:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
 <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/05/22 12:44, Krzysztof Kozlowski ha scritto:
> On 09/05/2022 10:54, Rex-BC Chen wrote:
>>>> +    soc {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +
>>>> +        disp_ethdr@1c114000 {
>>>
>>> No underscores in node name. Generic node names, so display-
>>> controller?
>>>
>>
>> OK, we will change the node name to ethdr like in dts
>> like this:
>> ethdr0: ethdr@1c114000 {
>> ...
>> }
> 
> Is "ethdr" a generic name? Is it an abbreviation of "EnergyTrace™ High
> Dynamic Range"? If yes, it also looks specific to Texas Instruments...
> 
> Best regards,
> Krzysztof


That's mediatek-drm, and this refers to the HDR block in the display IP...

Though, I have no idea of what "ET" stands for in "ETHDR", so, it would be
definitely nice if MediaTek can write the meaning in the description, like

description:
   ETHDR (E??? T??? High Dynamic Range) is designed for HDR video and ...blah

Cheers,
Angelo
