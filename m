Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB262B716
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 11:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA7110E05A;
	Wed, 16 Nov 2022 09:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E02010E05A;
 Wed, 16 Nov 2022 09:59:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AG9c7wN021157; Wed, 16 Nov 2022 09:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SGCkg9WHx8cRwzVOhdfoyqf7nLEK13rKpP68ultRMDM=;
 b=U0wXknfMGSTNbsFbKneHByXilYE5Y0OwXu1ecaL4noYHp9SB0CXWmmfUtvDSH1pS4MAn
 IIWv3bxKP5VAK5O8VL/i2pffA9l9sCI63LoM/gWCco25WVVyIh9mh4np2agXTDZEa30u
 099IcyuNeY+GM55XCWWN4YF8/0Cg4eCjV7NxFeyHzOYJ/aEyeEy2UgBdoFveHzqwjF5U
 cy9bjzNDpf/fm72upoVpyQT1F6AehEZ0YW42gDpPAFP6bsO/M+uCbSqOIneKPGTEFXM6
 GzaPZRMrpzievEs174hAP8SJDr+yP9HUvPeO9fsfdPGgDnwDcj7vuIMDJ1mb8DEsxmQB Rg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvt8g8kq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 09:59:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AG9xeWZ019549
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 09:59:40 GMT
Received: from [10.216.25.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 16 Nov
 2022 01:59:34 -0800
Message-ID: <0a183ed0-e83e-ad9d-7313-892eab96532c@quicinc.com>
Date: Wed, 16 Nov 2022 01:59:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
 <e53520b4-65da-d183-c3bf-65dc16c59358@linaro.org>
 <c23b1bc2-6477-a125-7ad9-11dfec6fed55@quicinc.com>
 <65ab13cb-93ae-eb71-531a-79cf99c7fcdd@linaro.org>
 <3041e527-f955-3582-e41f-5f5dc4d04e26@quicinc.com>
 <5bfaae9f-2d71-a69a-59e6-c4adf5d929da@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5bfaae9f-2d71-a69a-59e6-c4adf5d929da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Slr8duni86GhHtJJufOsb5SnChCarFOh
X-Proofpoint-GUID: Slr8duni86GhHtJJufOsb5SnChCarFOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211160070
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2022 1:43 AM, Dmitry Baryshkov wrote:
> On 16/11/2022 12:29, Abhinav Kumar wrote:
>>
>>
>> On 11/16/2022 1:18 AM, Dmitry Baryshkov wrote:
>>> On 16/11/2022 11:30, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 11/16/2022 12:19 AM, Dmitry Baryshkov wrote:
>>>>> On 16/11/2022 10:50, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 11/4/2022 6:03 AM, Dmitry Baryshkov wrote:
>>>>>>> On sm8450 a register block was removed from MDP TOP. Accessing it 
>>>>>>> during
>>>>>>> snapshotting results in NoC errors / immediate reboot. Skip 
>>>>>>> accessing
>>>>>>> these registers during snapshot.
>>>>>>>
>>>>>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>>>>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>
>>>>>> I am confused with both the ordering and the split of this patch.
>>>>>>
>>>>>> You have defined DPU_MDP_PERIPH_0_REMOVED in the catalog header 
>>>>>> file in this patch but used it in the next.
>>>>>>
>>>>>> But you also have code in this patch which relies on setting of 
>>>>>> this bit.
>>>>>>
>>>>>> So if this patch is taken without the next, it will still crash.
>>>>>
>>>>> It will not crash if this patch is taken without the next one. 
>>>>> Without the next patch the DPU driver will not match and bind 
>>>>> against the qcom,sm8450-dpu device.
>>>>
>>>> Ah okay, I just now saw that you have the compatible change also in 
>>>> the next patch.
>>>>
>>>>>
>>>>> So, the ordering is quite logical from my point of view:
>>>>> - add support for all the features required for the device
>>>>> - add the device compat string & catalog entry
>>>>>
>>>>>>
>>>>>> Rather, you should combine the define part of this patch to the 
>>>>>> next patch in the series 
>>>>>> https://patchwork.freedesktop.org/patch/510114/?series=108883&rev=3 , 
>>>>>> then move that one in front of this patch.
>>>>>
>>>>> No. This way we'll have a state (after adding the next patch) when 
>>>>> the sm8450 support is enabled, but the top-hole is not handled, 
>>>>> leading to a crash.
>>>>>
>>>>
>>>> What if you split the compatible to a separate patch like what 
>>>> SM8350 did.
>>>>
>>>> https://patchwork.freedesktop.org/patch/511659/?series=110924&rev=1
>>>>
>>>> So, we have hw catalog changes ---> snapshot fix ---> add the 
>>>> compatible.
>>>
>>> I don't see any good reason to do this. Adding a define without 
>>> backing implementation is a bad idea in my opinion.
>>>
>>
>> The define is used in two places today. First in the catalog and 
>> second in the snapshot (which is your change).
>>
>> Even with the split i am suggesting the define and usage will be 
>> together.
>>
>> In fact, in my opinion thats more coherent because you defined the 
>> macro, used it to show that sm8450 has this TOP_HOLE.
>>
>> Then, you are using the hw->caps which will be set in the previous 
>> patch to avoid that region in the snapshot.
>>
>> The good reason to do it this way is that, with this current ordering 
>> of patch, this patch is essentially a dummy patch because technically 
>> no chipset has set this capability.
> 
> It's not dummy, because it clearly shows, what really is beyond this 
> capability. A feature without a backing implementation would be a dummy 
> patch (even if it's mentioned in the hw catalog entry).
> 
> Just a simple check. If we use a guillotine and cut the patch series in 
> the middle, which one will make more sense:
> 
> - #define DPU_MDP_TOP_UGLY
>    add DPU_MDP_TOP_UGLY to sdm999's features
> 
> - #define DPU_MDP_TOP_UGLY
>    add an implementation of DPU_MDP_TOP_UGLY describing what it does
> 
> With the first approach the MDP_TOP_UGLY is an ugly define without any 
> particular meaning. Mentioning it in the hw_catalog doesn't bring us any 
> additional information (in other words, what does it mean that sdm999 
> has MDP_TOP_UGLY feature?).

Okay, one last point about this.

Your response actually brought up another comment on this patch.

You have not documented what this macro does in this enum either in this 
patch or the next.

78  * MDP TOP BLOCK features
79  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done 
per pipe
80  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
81  * @DPU_MDP_BWC,           MDSS HW supports Bandwidth compression.
82  * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
83  *                         compression initial revision
84  * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
85  * @DPU_MDP_MAX            Maximum value
86
87  */
88 enum {
89 	DPU_MDP_PANIC_PER_PIPE = 0x1,
90 	DPU_MDP_10BIT_SUPPORT,
91 	DPU_MDP_BWC,
92 	DPU_MDP_UBWC_1_0,
93 	DPU_MDP_UBWC_1_5,
94 	DPU_MDP_AUDIO_SELECT,
95 	DPU_MDP_MAX
96 };

If that was done, that would certainly clear the doubts about what this 
does.

Snapshot is just one usage of this enum. We are advertizing this enum as 
a chipset level capability. So if we group it the way you mentioned as 
incorrect, lets view it another way.

- #define DPU_MDP_TOP_UGLY AND document what it means as we are supposed to

     add DPU_MDP_TOP_UGLY to sdm999's features

Now, we know what it means and also which chipset it applies to in the 
same change rather than looking at two changes to achieve this.

Lastly, we are using this capability to avoid access to the snapshot.

That may not be the only usage of that capability.

> 
> The second approach doesn't bind any chipset to use MDP_TOP_UGLY. But 
> knowing the implementation, one can check whether it applies to his 
> chipset or not.
> 
> Yes, I must admit, this case is a little bit odd. Regularly I'd have 
> added the sm8450's compat string and catalog entries, then I'd have 
> populated the catalog with new features one by one (using implementation 
> + define + hw_catalog patch), like we do e.g. for DSC, WB, 
> DSPP_sub_flush, etc. In this particular case, sm8450 will not work 
> without PERIPH_0_REMOVED, as the first DSI underrun, which can easily 
> happen while turning on the INTF, will reboot the board.

I am not going to hold off this patch for this reason but like I have 
said before, even if the order is maintained the way I mentioned by 
splitting the compatible similar to the SM8350 series, it will not cause 
reboot.

Yes, I do recall the first DSI underrun issue on the SM8450 board so i 
certainly realize we cannot let it boot without blocking access to the hole.

> 
>>
>> But if you follow the order i am suggesting, it actually has more 
>> meaning because we know sm8450 has set it in its caps before you use it.
>>
>>> Regarding splitting the hw_catalog and compat. I have always 
>>> considered the hw catalog entry as of_device_id.data. In other words, 
>>> a devices' match data, which makes a little sense without compat entry.
>>>
>>> With the current approach each patch is atomic, it changes single 
>>> point or adds a single feature, etc.
>>>
>>>>
>>>> That will make both of us happy?
>>>>
>>>>>>
>>>>>> So that its much more coherent that you defined 
>>>>>> DPU_MDP_PERIPH_0_REMOVED both in the catalog header and used it in 
>>>>>> the catalog.c file and the in the next change you used the caps to 
>>>>>> avoid touching that register.
>>>>>
>>>>> I'd say it's rather strange way. When I see a define/feature 
>>>>> addition, I'd prefer to seethe implementation too.
>>>>>
>>>>>> Regarding the TOP hole itself, I need one day to investigate this. 
>>>>>> I am waiting for permissions to the documentation.
>>>>>>
>>>>>> If i cannot get access by the time you have re-ordered this, I 
>>>>>> will ack this once the reorder is done within a day.
>>>>>
>>>>>
>>>>> For the reference: [1]
>>>>>
>>>>> [1] 
>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/commit/f9ff8af5b640147f3651c23551c60f81f62874b1 
>>>>>
>>>>>
>>>>>>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>>>>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> index 38aa38ab1568..4730f8268f2a 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> @@ -92,6 +92,7 @@ enum {
>>>>>>>       DPU_MDP_UBWC_1_0,
>>>>>>>       DPU_MDP_UBWC_1_5,
>>>>>>>       DPU_MDP_AUDIO_SELECT,
>>>>>>> +    DPU_MDP_PERIPH_0_REMOVED,
>>>>>>>       DPU_MDP_MAX
>>>>>>>   };
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> index f3660cd14f4f..95d8765c1c53 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>>>>>>> msm_disp_state *disp_state, struct msm_k
>>>>>>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>>>>>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>>>>>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>>>>>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>>>> +    if (dpu_kms->hw_mdp->caps->features & 
>>>>>>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>>>>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>>>>>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len 
>>>>>>> - 0x3a8,
>>>>>>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
>>>>>>> +    } else {
>>>>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>>>>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>>>> +    }
>>>>>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>>>>>   }
>>>>>
>>>
> 
