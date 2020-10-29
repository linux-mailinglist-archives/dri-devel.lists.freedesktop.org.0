Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1929E574
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 08:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD856E854;
	Thu, 29 Oct 2020 07:59:04 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D886E854
 for <dri-devel@freedesktop.org>; Thu, 29 Oct 2020 07:58:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603958342; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TlU0fDOuXAQSqUNYC4Vl1Hk+7AlQn1pnRJi/r7LKsoc=;
 b=VVmXAgGfHR2KUPbzpck3C5QFw0dlHM1vPhHOkNvVr6a2jj3Y/GMe+0t8g7sx9B0Dq0UxELlW
 kOkTeZadugOkomIlgNrjxZiApHkVDb3lYqyo2EP13YCxMVS6Vkg1c6bzEWCRVqu4HWGfTukj
 M9Ehew7hnYvCJr4Vm4kPlQrV7cc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f9a762f3500ab29c8ba3dc4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Oct 2020 07:58:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 49166C433C9; Thu, 29 Oct 2020 07:58:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.9] (unknown [61.3.76.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 63B9BC433FE;
 Thu, 29 Oct 2020 07:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 63B9BC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [v3,2/3] arm64: dts: qcom: sc7180: Add gpu cooling support
To: mka@chromium.org
References: <1603892395-3570-2-git-send-email-akhilpo@codeaurora.org>
 <20201029003931.GA1855806@google.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <2919f377-4824-dc85-aa2c-c3ce252d437c@codeaurora.org>
Date: Thu, 29 Oct 2020 13:28:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201029003931.GA1855806@google.com>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/29/2020 6:09 AM, mka@chromium.org wrote:
> Hi Akhil,
> 
> On Wed, Oct 28, 2020 at 07:09:53PM +0530, Akhil P Oommen wrote:
>> Add cooling-cells property and the cooling maps for the gpu tzones
>> to support GPU cooling.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 30 +++++++++++++++++++++++-------
>>   1 file changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index d46b383..a7ea029 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -2,7 +2,7 @@
>>   /*
>>    * SC7180 SoC device tree source
>>    *
>> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
>>    */
>>   
>>   #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>> @@ -1886,6 +1886,8 @@
>>   			operating-points-v2 = <&gpu_opp_table>;
>>   			qcom,gmu = <&gmu>;
>>   
>> +			#cooling-cells = <2>;
>> +
>>   			interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>>   			interconnect-names = "gfx-mem";
>>   
>> @@ -3825,16 +3827,16 @@
>>   		};
>>   
>>   		gpuss0-thermal {
>> -			polling-delay-passive = <0>;
>> +			polling-delay-passive = <100>;
>>   			polling-delay = <0>;
>>   
>>   			thermal-sensors = <&tsens0 13>;
>>   
>>   			trips {
>>   				gpuss0_alert0: trip-point0 {
>> -					temperature = <90000>;
>> +					temperature = <95000>;
>>   					hysteresis = <2000>;
>> -					type = "hot";
>> +					type = "passive";
>>   				};
>>   
>>   				gpuss0_crit: gpuss0_crit {
>> @@ -3843,19 +3845,26 @@
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&gpuss0_alert0>;
>> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>>   		gpuss1-thermal {
>> -			polling-delay-passive = <0>;
>> +			polling-delay-passive = <100>;
>>   			polling-delay = <0>;
>>   
>>   			thermal-sensors = <&tsens0 14>;
>>   
>>   			trips {
>>   				gpuss1_alert0: trip-point0 {
>> -					temperature = <90000>;
>> +					temperature = <95000>;
>>   					hysteresis = <2000>;
>> -					type = "hot";
>> +					type = "passive";
>>   				};
>>   
>>   				gpuss1_crit: gpuss1_crit {
>> @@ -3864,6 +3873,13 @@
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&gpuss0_alert0>;
> 
> Copy & paste error, this should be 'gpuss1_alert0'.
aah! you are correct.

--Akhil
> 
>> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>>   		aoss1-thermal {
> 
> 
> Other than the C&P error:
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
