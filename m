Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26988710718
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF6C10E7F1;
	Thu, 25 May 2023 08:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76A610E7F1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 08:15:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34P6vCna010987; Thu, 25 May 2023 10:14:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6eqB/2RVN5f/EsmFhOLILkPDHswfNdCOdRhZtrk1duU=;
 b=K+tsvG6ECwhzWGvIrNzOwpjUqyOubAhwbi2QX4tUeFUYHRsm9Nb4JX0jBpFYvkxuBplF
 DxOwlBlN0UZpkNadjuB2e5Q++17yRrTayHjHprSnkQdNHsgJqVZyEYQ2RKgO6/R2sNIy
 DQ30QwWdeNvSW560OuPSk2VffPS7Cj/z2qEAuJou5eO5yRxVxMSjzbygIvlHhBMaA4yG
 oM5PMGD85Y7sKFbwhr9kvSyCjaJwVyLOOqFjyZfffrHFcQwbD8t7tkCDMUNFo0GtMHJv
 Y/XK385ajzTVd8EzcoimwS7aKwflkwBwF7Ml7EdMNanRpmOjdrulTBCwUzW98+hE/6kR Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt2uy8k3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 10:14:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6BE810002A;
 Thu, 25 May 2023 10:14:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5474212FDC;
 Thu, 25 May 2023 10:14:53 +0200 (CEST)
Received: from [10.252.18.243] (10.252.18.243) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 25 May
 2023 10:14:52 +0200
Message-ID: <32fafa74-8964-c9cf-f95b-f2cd084f46c6@foss.st.com>
Date: Thu, 25 May 2023 10:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: stm32: fix several DT warnings on
 stm32mp15
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
 <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
 <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
 <5f201903-17cb-5054-763c-f03b1066db1d@denx.de>
Content-Language: en-US
In-Reply-To: <5f201903-17cb-5054-763c-f03b1066db1d@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.18.243]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_04,2023-05-24_01,2023-05-22_02
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


On 5/18/23 01:33, Marek Vasut wrote:
> On 5/17/23 19:04, Raphael Gallais-Pou wrote:
>> Hi Marek
>
> Hi,
>
>> On 5/17/23 17:41, Marek Vasut wrote:
>>> On 5/17/23 16:35, Raphael Gallais-Pou wrote:
>>>
>>> Hi,
>>>
>>>> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>>>> b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>>>> index 0f1110e42c93..a6e2e20f12fa 100644
>>>> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>>>> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>>>> @@ -457,8 +457,7 @@ &ltdc {
>>>>        status = "okay";
>>>>          port {
>>>> -        ltdc_ep0_out: endpoint@0 {
>>>> -            reg = <0>;
>>>> +        ltdc_ep0_out: endpoint {
>>>>                remote-endpoint = <&sii9022_in>;
>>>>            };
>>>>        };
>>>
>>> This LTDC port/endpoint stuff always scares me, because I always feel I get it
>>> wrong.
>>>
>>> I believe the LTDC does have one "port" , correct.
>>>
>>> But I think (?) that the LTDC has two endpoints, endpoint@0 for DPI (parallel
>>> output out of the SoC) and endpoint@1 for DSI (internal connection into the
>>> DSI serializer) ?
>>
>> You are correct indeed, I rushed the patch and did not thought about this. I
>> agree that this can be confusing, as I also take some time to think through it.
>>
>>>
>>> Only one of the endpoints can be connected at a time, but there are actually
>>> two endpoints in the LTDC port {} node, aren't there ?
>> Yes, they are mutually exclusive.
>>>
>>> So the original description should be OK I think , maybe #address/#size-cells
>>> are missing instead ?
>>
>> Thing is: this file is only included in two device-trees : stm32mp157c-dk1.dts
>> and stm32mp157c-dk2.dts.
>>
>> Among those two files there is only one which adds a second endpoint. Thus if
>> the fields are set higher in the hierarchy, a warning yields.
>
> I do not understand this one part, which warning are you trying to fix ?
> I just ran '$ make CHECK_DTBS=1 stm32mp157a-dk1.dtb stm32mp157c-dk2.dtb' in
> latest linux-next and there was no warning related to LTDC .

I'm sorry, I looked back at it and my explanations are confusing.

I use Alex Torgue's tree, and I'm based on the next branch, but linux-next
should be the same I just checked it.

>
> I think if you retain the stm32mp151.dtsi &ltdc { port { #address-cells = <1>;
> #size-cells = <0>; }; }; part, then you wouldn't be getting any warnings
> regarding LTDC , and you wouldn't have to remove the unit-address from
> endpoint@0 .
>
> btw. I do use both endpoint@0/endpoint@1 in Avenger96 DTOs, but those are not
> submitted yet, I have to clean them up a bit more first.
>
>> One way to do it would be to make the endpoint@0 go down in the device-tree with
>> its dependencies, so that both endpoints are the same level without generating
>> noise.
>
> I'm afraid I really don't quite understand which warning you're referring to.
> Can you please share that warning and ideally how to trigger it (the
> command-line incantation) ?

Using '$ make dtbs W=1', you can observe several of the followings:

arch/arm/boot/dts/stm32mp151.dtsi:1533.9-1536.6: Warning
(avoid_unnecessary_addr_size): /soc/display-controller@5a001000/port:
unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
arch/arm/boot/dts/stm32mp151.dtsi:1533.9-1536.6: Warning (graph_child_address):
/soc/display-controller@5a001000/port: graph node has single child node
'endpoint@0', #address-cells/#size-cells are not necessary

This &ltdc { port { #address-cells = <1>; #size-cells = <0>; }; }; part is
actually annoying. This is because there is several device-trees that only got
one endpoint, and some other that includes two.

For instance: stm32mp15xx-dhcor-avenger96.dtsi vs stm32mp157c-dk2.dts.

I would like to remove to root part of address/size field and let only the lower
device-trees with with multiple endpoints handle their own fields. I hope this
explains a bit better my process.

Regards,
Raphaël Gallais-Pou

