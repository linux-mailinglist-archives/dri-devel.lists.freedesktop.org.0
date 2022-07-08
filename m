Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFEF56C11F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFE410E1AC;
	Fri,  8 Jul 2022 19:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5FB10E0AD;
 Fri,  8 Jul 2022 19:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657309634; x=1688845634;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y8svXHFAGBhEoIgUxuvGzQVF++l56a0jj2PjO4kDLlU=;
 b=KEFHDKjXgTD6wtusei4l90dV2o6kNH8nQQmPIKu+WvyAp43D5PSNZqbp
 VnGJpMuRc9g8tnaMtS8Hp/aGL6PMN3ILeGb0iahxhuI7qW3H2JDNvMowx
 jciTGpXTYjI2uKQvFw50BPDBNbrUKD3BomvEU9SxwvGDWDmrYs+/wcjzY E=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 08 Jul 2022 12:47:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 12:47:13 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 12:47:12 -0700
Received: from [10.110.5.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 8 Jul 2022
 12:47:11 -0700
Message-ID: <a7f2e673-a732-d06c-e17e-746cedf42c7a@quicinc.com>
Date: Fri, 8 Jul 2022 12:47:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd
 <swboyd@chromium.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Clark <robdclark@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
 <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
 <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/8/2022 12:38 PM, Abhinav Kumar wrote:
> + kuogee
>
> On 7/8/2022 12:27 PM, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-07-07 20:46:43)
>>> On 08/07/2022 04:28, Stephen Boyd wrote:
>>>> Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
>>>>> The p1 region was probably added by mistake, none of the DTS files
>>>>> provides one (and the driver source code also doesn't use one). 
>>>>> Drop it
>>>>> now.
>>>>
>>>> Yes, looks like the driver doesn't use it.
>>>>
>>>>>
>>>>> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 
>>>>> 1 -
>>>>>    1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> index 94bc6e1b6451..d6bbe58ef9e8 100644
>>>>> --- 
>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> +++ 
>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> @@ -29,7 +29,6 @@ properties:
>>>>>          - description: aux register block
>>>>>          - description: link register block
>>>>>          - description: p0 register block
>>>>> -      - description: p1 register block
>>>>
>>>> The p1 registers exist on sc7180. They start where the example starts,
>>>> at 0xae91400.
>>>
>>> Do they exist on e.g. sc7280? In other words, should we add the region
>>> to the DTS? For now I'm going to mark it as optional.
>>>
>>
>> Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
>> can you confirm?
>
> P1 block does exist on sc7280 and yes its address is same as the 
> address mentioned in sc7180. So its not a typo.
>
> Yes, we are not programming this today but I would prefer to keep this 
> as optional.
>
> I did sync up with Kuogee on this change this morning, we will check a 
> few things internally on the P1 block's usage as to which use-cases we 
> need to program it for and update here.
>
P1 block is for dp MST application.  This allow two dp streams can be 
mux into same DP phy.

We should keep it since we may support MST later.

> The idea behind having this register space listed in the yaml is thats 
> how the software documents have the blocks listed so dropping P1 block 
> just because its unused seemed wrong to me. Optional seems more 
> appropriate.
>
> Thanks
>
> Abhinav
