Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F328E149
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 15:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763FE6EAA2;
	Wed, 14 Oct 2020 13:29:46 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E2D6EAA2
 for <dri-devel@freedesktop.org>; Wed, 14 Oct 2020 13:29:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602682185; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rIC1SuV56SFchiZDRV34vNBmeGLmpoLkREQhbX7ZtSU=;
 b=OHfwn0T+lB84YC4UZv1EWHLwLZEhNoB7kAYdzC1nx0NjvJIedo4QEnVw9hsiD05fQfnfu2ZV
 d4CaGuIzJYO4Lt8uFYHUPu0Q6HG8TB3KvkrMC79rzRvx+C+46eItRS8tXCubOFQD6EF0O1xm
 hvAZYXYLicASncqMXCNK185Vt6E=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f86fd3def891f1ee2b07955 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 13:29:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 42B18C433FF; Wed, 14 Oct 2020 13:29:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.180.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F1AA7C433C9;
 Wed, 14 Oct 2020 13:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1AA7C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add gpu cooling support
To: Matthias Kaehlcke <mka@chromium.org>,
 Doug Anderson <dianders@chromium.org>, manafm@codeaurora.org
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
 <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
 <20201009165705.GA1292413@google.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <fc490021-b046-68c5-7ceb-9c63d3ff5650@codeaurora.org>
Date: Wed, 14 Oct 2020 18:59:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009165705.GA1292413@google.com>
Content-Language: en-US
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/2020 10:27 PM, Matthias Kaehlcke wrote:
> On Fri, Oct 09, 2020 at 08:05:10AM -0700, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>>
>>> Add cooling-cells property and the cooling maps for the gpu tzones
>>> to support GPU cooling.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 29 ++++++++++++++++++++++-------
>>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>> index d46b383..40d6a28 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>> @@ -2,7 +2,7 @@
>>>   /*
>>>    * SC7180 SoC device tree source
>>>    *
>>> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
>>>    */
>>>
>>>   #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>>> @@ -1885,6 +1885,7 @@
>>>                          iommus = <&adreno_smmu 0>;
>>>                          operating-points-v2 = <&gpu_opp_table>;
>>>                          qcom,gmu = <&gmu>;
>>> +                       #cooling-cells = <2>;
>>
>> Presumably we should add this to the devicetree bindings, too?
Yes, thanks for catching this. Will update in the next patch.

>>
>>
>>>                          interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>>>                          interconnect-names = "gfx-mem";
>>> @@ -3825,16 +3826,16 @@
>>>                  };
>>>
>>>                  gpuss0-thermal {
>>> -                       polling-delay-passive = <0>;
>>> +                       polling-delay-passive = <100>;
>>
>> Why did you make this change?  I'm pretty sure that we _don't_ want
>> this since we're using interrupts for the thermal sensor.  See commit
>> 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
>> Thermal-zones node").
> 
> I was going to ask the same, this shouldn't be needed.
> 
>>>                          polling-delay = <0>;
>>>
>>>                          thermal-sensors = <&tsens0 13>;
>>>
>>>                          trips {
>>>                                  gpuss0_alert0: trip-point0 {
>>> -                                       temperature = <90000>;
>>> +                                       temperature = <95000>;
>>>                                          hysteresis = <2000>;
>>> -                                       type = "hot";
>>> +                                       type = "passive";
>>
>> Matthias probably knows better, but I wonder if we should be making
>> two passive trip levels like we do with CPU.  IIRC this is important
>> if someone wants to be able to use this with IPA.
> 
> Yes, please introduce a second trip point and make both of them
> 'passive'.
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
Adding Manaf here.

-Akhil.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
