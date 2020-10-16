Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2583829068F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 15:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427956EE06;
	Fri, 16 Oct 2020 13:47:26 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EC26EE04
 for <dri-devel@freedesktop.org>; Fri, 16 Oct 2020 13:47:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602856044; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PWxCOSXg+R1xNtUK7BbBA+FBtzALbnyXn/iAEMYjb7I=;
 b=vED9veX29QTRWR3vmSG83hjOJMOoVekfUs66d19DP1rwMz2aZ510rMPhLS8eJ76RB92d4Fm4
 4822m+1yK1kSS+Iu5nQf4c5WmmHmwylligez+YVN8qCoKtaazzTdGEn0fu+ZVRgYWdr+gF7M
 Fu6jKBD2JC30V/k8yGKMhxuS4e0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f89a455ef891f1ee28f5e22 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 13:47:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C5896C433FF; Fri, 16 Oct 2020 13:47:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.9] (unknown [117.217.236.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9100CC433C9;
 Fri, 16 Oct 2020 13:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9100CC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add gpu cooling support
To: Matthias Kaehlcke <mka@chromium.org>, manafm@codeaurora.org
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
 <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
 <20201009165705.GA1292413@google.com>
 <fc490021-b046-68c5-7ceb-9c63d3ff5650@codeaurora.org>
 <a4be2cf9e51e4f40aae3f9a56989a42f@codeaurora.org>
 <20201015221920.GA1657396@google.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <4a068a17-220d-f94e-e8a2-c62d61763922@codeaurora.org>
Date: Fri, 16 Oct 2020 19:16:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201015221920.GA1657396@google.com>
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
 Amit Kucheria <amitk@kernel.org>, Doug Anderson <dianders@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Rajeshwari <rkambl@codeaurora.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16/2020 3:49 AM, Matthias Kaehlcke wrote:
> Hi,
> 
> On Thu, Oct 15, 2020 at 12:07:01AM +0530, manafm@codeaurora.org wrote:
>> On 2020-10-14 18:59, Akhil P Oommen wrote:
>>> On 10/9/2020 10:27 PM, Matthias Kaehlcke wrote:
>>>> On Fri, Oct 09, 2020 at 08:05:10AM -0700, Doug Anderson wrote:
>>>>> Hi,
>>>>>
>>>>> On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen
>>>>> <akhilpo@codeaurora.org> wrote:
>>>>>>
>>>>>> Add cooling-cells property and the cooling maps for the gpu tzones
>>>>>> to support GPU cooling.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/sc7180.dtsi | 29
>>>>>> ++++++++++++++++++++++-------
>>>>>>    1 file changed, 22 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>>>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>>>> index d46b383..40d6a28 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>>>> @@ -2,7 +2,7 @@
>>>>>>    /*
>>>>>>     * SC7180 SoC device tree source
>>>>>>     *
>>>>>> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>>>>> + * Copyright (c) 2019-20, The Linux Foundation. All rights
>>>>>> reserved.
>>>>>>     */
>>>>>>
>>>>>>    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>>>>>> @@ -1885,6 +1885,7 @@
>>>>>>                           iommus = <&adreno_smmu 0>;
>>>>>>                           operating-points-v2 = <&gpu_opp_table>;
>>>>>>                           qcom,gmu = <&gmu>;
>>>>>> +                       #cooling-cells = <2>;
>>>>>
>>>>> Presumably we should add this to the devicetree bindings, too?
>>> Yes, thanks for catching this. Will update in the next patch.
>>>
>>>>>
>>>>>
>>>>>>                           interconnects = <&gem_noc
>>>>>> MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>>>>>>                           interconnect-names = "gfx-mem";
>>>>>> @@ -3825,16 +3826,16 @@
>>>>>>                   };
>>>>>>
>>>>>>                   gpuss0-thermal {
>>>>>> -                       polling-delay-passive = <0>;
>>>>>> +                       polling-delay-passive = <100>;
>>>>>
>>>>> Why did you make this change?  I'm pretty sure that we _don't_ want
>>>>> this since we're using interrupts for the thermal sensor.  See commit
>>>>> 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
>>>>> Thermal-zones node").
>>>>
>>>> I was going to ask the same, this shouldn't be needed.
>> As per our understanding unlike "polling-delay",  this delay property is
>> intended to activate polling thread on post trip threshold violation and  it
>> is irrespective of sensor is capable for trip interrupt or not.
>> This polling is more of governor related. Below are the few references from
>> Documentation/code which tells polling-delay-passive is needed for IPA for
>> better IPA performance.
>>
>> As per Power allocator documentations
>>
>> 1. https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/driver-api/thermal/power_allocator.rst?h=v5.4.71#n264
>>
>> "The power allocator governor's PID controller works best if there is a
>> periodic tick.  If you have a driver that calls
>> `thermal_zone_device_update()` (or anything that ends up calling the
>> governor's `throttle()` function) repetitively, the governor response
>> won't be very good.  Note that this is not particular to this
>> governor, step-wise will also misbehave if you call its throttle()
>> faster than the normal thermal framework tick (due to interrupts for
>> example) as it will overreact"
>>
>> 2. In Power allocator code, when  switch_on/control trip temp violation, it
>> is enabling passive counter to activate passive polling @ https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/thermal/power_allocator.c?h=v5.4.71#n634
>>
>> 3. while calculating derivative term, it is using passive_delay @
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/thermal/power_allocator.c?h=v5.4.71#n243
>>
>> 4. Sensor interrupt will work if temperature is fluctuating between
>> trip_temp and hysteresis. But say a case where we are not enabling
>> polling-delay-passive. In this case if  current temperature > control_temp
>> trip(2nd passive trip) and
>>   temperature trend is still raising, then sensor high trip will be disabled
>> (OR configured for critical trip threshold). No more trip interrupt from
>> sensor until it reaches critical trip or falls below control_temp
>> hysteresis.
>>   How  the governor re-evaluate its next mitigation without passive polling
>> thread  here ?
>>
>> I think the same is required for CPU thermal zone as well.
> 
> Thanks for the explication and pointers!
> 
> I ran some tests to re-confirm. For that I lowered the trip point temperatures
> of CPU6 to 60/70, to make it easier to trigger throttling without necessarily
> affecting the other CPUs. Further I enabled tracing for the events 'thermal_temperature',
> 'thermal_zone_trip' and 'thermal_power_allocator'. With that I ran a CPU
> intensive task on CPU6.
> 
> Without polling-delay the trace log looks like this:
> 
>    irq/40-c263000.-157   [000] ....    48.035986: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=57800 temp=60000
>    irq/40-c263000.-157   [000] ....    48.036029: thermal_power_allocator_pid: thermal_zone_id=6 err=10000 err_integral=0 p=2402 i=0 d=0 output=1776
>    irq/40-c263000.-157   [000] ....    48.036036: thermal_power_allocator: thermal_zone_id=6 req_power={{0x96}} total_req_power=150 granted_power={{0x6f0}} total_granted_power=1776 power_range=1776 max_allocatable_power=1776 current_temperature=60000 delta_temperature=10000
>    irq/40-c263000.-157   [000] ....    52.480888: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=60000 temp=70000
>    irq/40-c263000.-157   [000] ....    52.480925: thermal_power_allocator_pid: thermal_zone_id=6 err=0 err_integral=0 p=0 i=0 d=0 output=1202
>    irq/40-c263000.-157   [000] ....    52.480931: thermal_power_allocator: thermal_zone_id=6 req_power={{0x45e}} total_req_power=1118 granted_power={{0x4b2}} total_granted_power=1202 power_range=1202 max_allocatable_power=1776 current_temperature=70000 delta_temperature=0
> 
> i.e. power_allocator only acts on the sensor interrupts at the trip points
> 
> It looks different with a non-zero value for 'polling-delay-passive':
> 
>    irq/40-c263000.-156   [000] ....   104.501777: thermal_power_allocator: thermal_zone_id=6 req_power={{0x331}} total_req_power=817 granted_power={{0x591}} total_granted_power=1425 power_range=1425 max_allocatable_power=1776 current_temperature=67800 delta_temperature=2200
>    irq/40-c263000.-156   [000] ....   104.523073: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=67800 temp=70000
>    irq/40-c263000.-156   [000] ....   104.523121: thermal_power_allocator_pid: thermal_zone_id=6 err=0 err_integral=-31200 p=0 i=-305 d=0 output=897
>    irq/40-c263000.-156   [000] ....   104.523148: thermal_power_allocator: thermal_zone_id=6 req_power={{0x406}} total_req_power=1030 granted_power={{0x381}} total_granted_power=897 power_range=897 max_allocatable_power=1776 current_temperature=70000 delta_temperature=0
>    irq/40-c263000.-156   [000] ....   104.608566: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=70000 temp=67800
>    irq/40-c263000.-156   [000] ....   104.608612: thermal_power_allocator_pid: thermal_zone_id=6 err=2200 err_integral=-31200 p=528 i=-305 d=0 output=1425
>    irq/40-c263000.-156   [000] ....   104.608642: thermal_power_allocator: thermal_zone_id=6 req_power={{0x331}} total_req_power=817 granted_power={{0x591}} total_granted_power=1425 power_range=1425 max_allocatable_power=1776 current_temperature=67800 delta_temperature=2200
>    irq/40-c263000.-156   [000] ....   104.630863: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=67800 temp=70000
>    irq/40-c263000.-156   [000] ....   104.630907: thermal_power_allocator_pid: thermal_zone_id=6 err=0 err_integral=-31200 p=0 i=-305 d=0 output=897
>    irq/40-c263000.-156   [000] ....   104.630932: thermal_power_allocator: thermal_zone_id=6 req_power={{0x3f4}} total_req_power=1012 granted_power={{0x381}} total_granted_power=897 power_range=897 max_allocatable_power=1776 current_temperature=70000 delta_temperature=0
>    irq/40-c263000.-156   [000] ....   104.687495: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=70000 temp=67800
>    irq/40-c263000.-156   [000] ....   104.687541: thermal_power_allocator_pid: thermal_zone_id=6 err=2200 err_integral=-31200 p=528 i=-305 d=0 output=1425
>    irq/40-c263000.-156   [000] ....   104.687567: thermal_power_allocator: thermal_zone_id=6 req_power={{0x338}} total_req_power=824 granted_power={{0x591}} total_granted_power=1425 power_range=1425 max_allocatable_power=1776 current_temperature=67800 delta_temperature=2200
>    irq/40-c263000.-156   [000] ....   104.711664: thermal_temperature: thermal_zone=cpu6-thermal id=6 temp_prev=67800 temp=70000
> 
> So it seems indeed the 'polling-delay-passive' is needed for better reactivity,
> and it should also be re-added to the other thermal zones.
> 
> On a different note I first tried something similar on the GPU, the trip points
> triggered, however there was no reaction from power_allocator, the reason is
> that there is no power information for the GPU (num power actors = 0). It seems
> it doesn' make sense to use IPA as long as there is no energy model (even if it
> worked by using the lowest frequency as 'estimated power' throttling would
> likely be overly aggressive). Since the trip point configuration for IPA and
> 'step_wise' (and probably others) is somewhat incompatible (IPA aims for a
> temperature around the 2nd trip point, 'step_wise' interprets the first trip
> point as limit) I think it makes sense to continue with a single trip point
> for now.
> 
> Thanks
> 
> Matthias
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
Looks like we have consensus here. I will spin another patchset.
Manaf will share a separate patch to fix the CPU tzones.

-Akhil.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
