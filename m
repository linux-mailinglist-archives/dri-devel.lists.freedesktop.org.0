Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB7714603
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 10:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEB410E222;
	Mon, 29 May 2023 08:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692C410E222
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 08:07:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34T1j4r8013586; Mon, 29 May 2023 10:07:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iJD4xsBkaQxyCxdKBwcnMTO5G+oQGyygLDr4AJFp+Ww=;
 b=G9yGL8x7zG5rQ5sKydCWpC0rxW/ClE+nCnbpp0Pllf1rqDFv/WFxRx5/QuGqBiW6FGny
 05fnCdun4yIb5razFWOaf/unAaVyblSw9VXw+xuxjK2LpDtsdvWcJAP07EzyaNcmU1aX
 i5Hp2rH0LTslp8v5L/rlq+2BFaIrWPPjB/epsp0k6R69PVN/Zrut0wc4b2T8s7ZB1Ra4
 5vParKUfLC9tbDR3qvWp/QtGODTc1dDdNJ8WVoHIQUFVy4rl5jUzZpr2We0vEJVilsRz
 nxOYFoyI8pnX/D0ZgAgB7rjeOc/4hwpiNrwXzx2AnMvtJC05E2bx0qgSQynOsae+48FX 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quakkrcay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 May 2023 10:07:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 659A910002A;
 Mon, 29 May 2023 10:07:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D9E4214D35;
 Mon, 29 May 2023 10:07:02 +0200 (CEST)
Received: from [10.252.27.228] (10.252.27.228) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 10:07:01 +0200
Message-ID: <cc6a1064-8b53-c63d-9592-92748b67639a@foss.st.com>
Date: Mon, 29 May 2023 10:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
 <32fafa74-8964-c9cf-f95b-f2cd084f46c6@foss.st.com>
 <b23ddf9e-6bba-68df-cf28-cc0e2c4218ac@denx.de>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <b23ddf9e-6bba-68df-cf28-cc0e2c4218ac@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.27.228]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_05,2023-05-25_03,2023-05-22_02
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


On 5/26/23 18:55, Marek Vasut wrote:
> On 5/25/23 10:14, Raphael Gallais-Pou wrote:
>
> Hi,
Hi Marek,
>
>>> I think if you retain the stm32mp151.dtsi &ltdc { port { #address-cells = <1>;
>>> #size-cells = <0>; }; }; part, then you wouldn't be getting any warnings
>>> regarding LTDC , and you wouldn't have to remove the unit-address from
>>> endpoint@0 .
>>>
>>> btw. I do use both endpoint@0/endpoint@1 in Avenger96 DTOs, but those are not
>>> submitted yet, I have to clean them up a bit more first.
>>>
>>>> One way to do it would be to make the endpoint@0 go down in the device-tree
>>>> with
>>>> its dependencies, so that both endpoints are the same level without generating
>>>> noise.
>>>
>>> I'm afraid I really don't quite understand which warning you're referring to.
>>> Can you please share that warning and ideally how to trigger it (the
>>> command-line incantation) ?
>>
>> Using '$ make dtbs W=1', you can observe several of the followings:
>>
>> arch/arm/boot/dts/stm32mp151.dtsi:1533.9-1536.6: Warning
>> (avoid_unnecessary_addr_size): /soc/display-controller@5a001000/port:
>> unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/stm32mp151.dtsi:1533.9-1536.6: Warning (graph_child_address):
>> /soc/display-controller@5a001000/port: graph node has single child node
>> 'endpoint@0', #address-cells/#size-cells are not necessary
>>
>> This &ltdc { port { #address-cells = <1>; #size-cells = <0>; }; }; part is
>> actually annoying. This is because there is several device-trees that only got
>> one endpoint, and some other that includes two.
>>
>> For instance: stm32mp15xx-dhcor-avenger96.dtsi vs stm32mp157c-dk2.dts.
>>
>> I would like to remove to root part of address/size field and let only the lower
>> device-trees with with multiple endpoints handle their own fields. I hope this
>> explains a bit better my process.
>
> After thinking about this some more, and digging through LTDC driver, and
> testing on EV1, I think dropping the LTDC node endpoint@N and reg=<N>
> altogether and just using port/endpoint (singular) is fine.
>
> You might want to split the DSI node specific changes and the LTDC node
> specific changes into separate patches (LTDC specific change like you did in
> 1/3).

Yes, I prepared a new serie with that split, to that it is better to read and
review.


Raphaël

