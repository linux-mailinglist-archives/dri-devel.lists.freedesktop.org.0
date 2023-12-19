Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18704818DE9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3908A10E04F;
	Tue, 19 Dec 2023 17:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FE610E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:20:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BJHJpf6080548;
 Tue, 19 Dec 2023 11:19:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1703006391;
 bh=RyxcIRcgKyTS7yxgKgGm+UNtTlWuJwcj/PQBca9YhiU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=IW7wj7PoElrlicik/1xyNebkCcVKqsxJxxv9I7WlJmF60kW/gA8RKz+wVAN0gneHR
 0tqApPTF6SZOAIJCYW672Yuc3fgDKvi+dImw411U1MGCo5HxHu/p9rRbTbp5zU0Yua
 xATZ6Iv6CM5b+IOAaR3pl+21+jKrGWMN5/gV5QJE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BJHJpdY085233
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Dec 2023 11:19:51 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Dec 2023 11:19:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Dec 2023 11:19:51 -0600
Received: from [10.249.40.136] ([10.249.40.136])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BJHJnkW122199;
 Tue, 19 Dec 2023 11:19:49 -0600
Message-ID: <a3feaf42-17fb-46e5-bbb0-3ffc4ad40bfd@ti.com>
Date: Tue, 19 Dec 2023 11:19:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Maxime Ripard
 <mripard@kernel.org>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
 <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
 <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
 <oobcl2kfsuph27er7rflfqvt3lu6athufomxv5chf3uctx4emh@x6rzjtlskhbf>
 <F58855EC-D87D-4747-A363-0E7AA5DB1AEC@goldelico.com>
 <22cny5aumc5wafsrjd3j55zcjbjf2viip64kfbjiqis2grtd6t@wg5dxeuzil6l>
 <3E03E913-48E1-49EC-A6C9-EAC1612E65E7@goldelico.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <3E03E913-48E1-49EC-A6C9-EAC1612E65E7@goldelico.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Matt Coster <matt.coster@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/18/23 4:54 AM, H. Nikolaus Schaller wrote:
> 
> 
>> Am 18.12.2023 um 11:14 schrieb Maxime Ripard <mripard@kernel.org>:
>>
>> On Mon, Dec 18, 2023 at 10:28:09AM +0100, H. Nikolaus Schaller wrote:
>>> Hi Maxime,
>>>
>>>> Am 15.12.2023 um 14:33 schrieb Maxime Ripard <mripard@kernel.org>:
>>>>
>>>>>>
>>>>>> It's for a separate architecture, with a separate driver, maintained out
>>>>>> of tree by a separate community, with a separate set of requirements as
>>>>>> evidenced by the other thread. And that's all fine in itself, but
>>>>>> there's very little reason to put these two bindings in the same file.
>>>>>>
>>>>>> We could also turn this around, why is it important that it's in the
>>>>>> same file?
>>>>>
>>>>> Same vendor. And enough similarity in architectures, even a logical sequence
>>>>> of development of versions (SGX = Version 5, Rogue = Version 6+) behind.
>>>>> (SGX and Rogue seem to be just trade names for their architecture development).
>>>>
>>>> Again, none of that matters for *where* the binding is stored.
>>>
>>> So what then speaks against extending the existing bindings file as proposed
>>> here?
>>
>> I mean, apart from everything you quoted, then sure, nothing speaks
>> against it.
>>
>>>>> AFAIK bindings should describe hardware and not communities or drivers
>>>>> or who is currently maintaining it. The latter can change, the first not.
>>>>
>>>> Bindings are supposed to describe hardware indeed. Nothing was ever said
>>>> about where those bindings are supposed to be located.
>>>>
>>>> There's hundreds of other YAML bindings describing devices of the same
>>>> vendors and different devices from the same generation.
>>>
>>> Usually SoC seem to be split over multiple files by subsystem. Not by versions
>>> or generations. If the subsystems are similar enough they share the same bindings
>>> doc instead of having one for each generation duplicating a lot of code.
>>>
>>> Here is a comparable example that combines multiple vendors and generations:
>>>
>>> Documentation/devicetree/bindings/usb/generic-ehci.yaml
>>
>> EHCI is a single interface for USB2.0 controllers. It's a standard API,
>> and is made of a single driver that requires minor modifications to deal
>> with multiple devices.
>>
>> We're very far from the same situation here.
> 
> How far are we really? And, it is the purpose of the driver to handle different cases.
> 
> That there are currently two drivers is just a matter of history and not a necessity.
> 
>>
>>>> If anything it'll make it easier for you. I'm really not sure why it is
>>>> controversial and you're fighting this so hard.
>>>
>>> Well, you made it controversial by proposing to split what IMHO belongs together.
>>
>> No, reviews aren't controversial.
>> The controversy started when you chose
>> to oppose it while you could have just rolled with it.
> 
> Well, you asked
> 
> "I think it would be best to have a separate file for this, img,sgx.yaml
> maybe?"
> 
> and
> 
> "Because it's more convenient?"
> 
> I understood that as an invitation for discussing the pros and cons and working out the
> most convenient solution. And that involves playing the devil's advocate which of course
> is controversial by principle.
> 
> Now, IMHO all the pros and cons are on the table and the question is who makes a decision
> how to go.
> 

As much as I would land on the side of same file for both, the answer to this question
is simple: the maintainer makes the decision :) So I'll respin with separate binding files.

The hidden unaddressed issue here is that by making these bindings separate it implies
they are not on equal footing (i.e. pre-series6 GPUs are not true "powervr" and so do not
belong in img,powervr.yaml). So if no one objects I'd also like to do the rename of that
file as suggested before and have:

img,powervr-sgx.yaml
img,powervr-rogue.yaml

>>
>>> I feel that the original patch is good enough for its purpose and follows
>>> some design pattern that can be deduced from other binding docs.
>>
>> [citation needed]
> 
> Joke: Documentation/devicetree/bindings/* - I am not aware of a formal analysis of course.
> 
> But see my example for ehci. It follows the pattern I mean. If clocks, regs, interrupts,
> resets, and more properties are (almost) the same, then group them and just differentiate
> by different compatible strings. If necessary use some - if: clauses.
> 
> It is the task of drivers to handle the details.
> 
> As my other (maybe more important) comment to this patch did indicate we IMHO can easily
> live with something like
> 
> +      - items:
> +          - enum:
> +              - ti,am62-gpu # IMG AXE GPU model/revision is fully discoverable
> +              - ti,omap3430-gpu # sgx530 Rev 121
> +              - ti,omap3630-gpu # sgx530 Rev 125
> +              - ingenic,jz4780-gpu # sgx540 Rev 130
> +              - ti,omap4430-gpu # sgx540 Rev 120
> +              - allwinner,sun6i-a31-gpu # sgx544 MP2 Rev 115
> +              - ti,omap4470-gpu # sgx544 MP1 Rev 112
> +              - ti,omap5432-gpu # sgx544 MP2 Rev 105
> +              - ti,am5728-gpu # sgx544 MP2 Rev 116
> +              - ti,am6548-gpu # sgx544 MP1 Rev 117
> 

While we could live with this, the "compatible" groupings makes life just a bit
easier. This is true really for any DT compatible string and is not based on
any technical reasoning.

Andrew

> And leave it to drivers using a table to deduce the generation and
> revision or read it out from the chip. And there can even be different
> drivers handling only a subset of the potential compatibles.
> 
> Then the currently-out-of-tree driver for the sgx5 can be reworked in
> less than half an hour without loosing functionality.
> 
> BR,
> Nikolaus
> 
