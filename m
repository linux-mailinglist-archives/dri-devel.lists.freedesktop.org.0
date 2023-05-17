Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC7D706EFD
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 19:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A7C10E1F5;
	Wed, 17 May 2023 17:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5AB10E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 17:05:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HDSQc4015581; Wed, 17 May 2023 19:04:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9W/aSpUxJmkATSMYBkvf8JxR9pYleKOzKrYpx1aWW3s=;
 b=sF/xOCzBWtzRIa9NfQykUhAYW9bdpi4BfqVd+u0QM+zVm8BwtMKvt5RKwyLBIisrS0oR
 5gGnY7Tk3ad0uxOVO9gOGzmHbktlfijDg8n+xakYesyoDHksavafdBUG4gbZJqBvJ82W
 DFd7LXEkP+nJvqLj/AXc66wMlkIZ6uuXTfL4aNGT6+Nu7nQa6gzjVnNyBZzTPiAlc40t
 ESmdzGMpWoagJ8rmGzqP9CtRdN4NTq6zU5h2ZwLs3UmatRMz82aMZT2nvXJbUIUAtNUJ
 2smMikZsEJeBeTn9xzDO8cd7MnSbfV49yjoZkle6SriTjs45hAmzw6RAlJ904FVa7xbz mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qm7tfj1m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 19:04:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 932B310002A;
 Wed, 17 May 2023 19:04:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8202924F270;
 Wed, 17 May 2023 19:04:39 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 17 May
 2023 19:04:39 +0200
Message-ID: <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
Date: Wed, 17 May 2023 19:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/3] ARM: dts: stm32: fix several DT warnings on
 stm32mp15
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
 <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
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

Hi Marek

On 5/17/23 17:41, Marek Vasut wrote:
> On 5/17/23 16:35, Raphael Gallais-Pou wrote:
>
> Hi,
>
>> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>> b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>> index 0f1110e42c93..a6e2e20f12fa 100644
>> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
>> @@ -457,8 +457,7 @@ &ltdc {
>>       status = "okay";
>>         port {
>> -        ltdc_ep0_out: endpoint@0 {
>> -            reg = <0>;
>> +        ltdc_ep0_out: endpoint {
>>               remote-endpoint = <&sii9022_in>;
>>           };
>>       };
>
> This LTDC port/endpoint stuff always scares me, because I always feel I get it
> wrong.
>
> I believe the LTDC does have one "port" , correct.
>
> But I think (?) that the LTDC has two endpoints, endpoint@0 for DPI (parallel
> output out of the SoC) and endpoint@1 for DSI (internal connection into the
> DSI serializer) ?

You are correct indeed, I rushed the patch and did not thought about this. I
agree that this can be confusing, as I also take some time to think through it.

>
> Only one of the endpoints can be connected at a time, but there are actually
> two endpoints in the LTDC port {} node, aren't there ?
Yes, they are mutually exclusive.
>
> So the original description should be OK I think , maybe #address/#size-cells
> are missing instead ?

Thing is: this file is only included in two device-trees : stm32mp157c-dk1.dts
and stm32mp157c-dk2.dts.

Among those two files there is only one which adds a second endpoint. Thus if
the fields are set higher in the hierarchy, a warning yields.

One way to do it would be to make the endpoint@0 go down in the device-tree with
its dependencies, so that both endpoints are the same level without generating
noise.


Raphaël




