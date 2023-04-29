Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FAC6F266A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 22:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16DD10E1C4;
	Sat, 29 Apr 2023 20:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1518910E1BA;
 Sat, 29 Apr 2023 20:23:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33TKNJAm019696; Sat, 29 Apr 2023 20:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OvHvTCb6f8fEY/o5Z1A++rD5EgOPcB/35rzCB3hvXmo=;
 b=UfwEfJoqino68/5ER+v6jQfiBuEppWpKhGl2qyX4oo4WrIE+tro94kOTkuOeA3bBCpKG
 rlId7ogURbcZBCNYMx+LlL8Ar9FbCqclesPyAcc5EepsMQK7BsangiFSGTvJVwOkgBd3
 CxhKn8uLhaXjQNF00Q/U/oIt5hLzpLUntqGVPbtb2nIV87kkgUeKKUA2Yu6Ic4nx8yst
 HeJ4GYT4YHWe6U90i22awmkD9pXFEuAXXpf6Fsz/54oRXgGDntS8CAwfYDM3la7nKXdw
 6yquhrnBcr1eJyLfBC3W7H0sSjqeCcmMK9lw4G+uReEQH9FX7Ibi+L214GZ2S63JwSGT aA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8t71s5jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 20:23:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33TKNJRZ017170
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 20:23:19 GMT
Received: from [10.110.119.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Sat, 29 Apr
 2023 13:23:18 -0700
Message-ID: <1ff73e92-92a4-f686-a478-04f2727751ce@quicinc.com>
Date: Sat, 29 Apr 2023 13:23:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 5/7] drm/msm/dpu: add DPU_PINGPONG_DSC
 feature PP_BLK and PP_BLK_TE
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-6-git-send-email-quic_khsieh@quicinc.com>
 <ad672cff-3355-97af-24b4-3626efebc284@linaro.org>
 <e9f493fa-77f2-0a5b-5e09-bd1baae8a8d0@quicinc.com>
 <772a63ca-9b88-3c98-e769-7e614968c127@linaro.org>
 <09d34749-d571-ed04-9681-4abf48c7f053@quicinc.com>
 <CAA8EJpo-+UYv2Roctu=7U09V3u6kJ_q64M1i_R7DBGCGCK=U7A@mail.gmail.com>
 <7e40f51b-693e-d42f-b99e-695cb6478e2d@quicinc.com>
 <d42e39ed-4bbf-f197-1f31-04576dd639fd@linaro.org>
 <0a8e99cb-8635-aaa1-aaf4-842c86ffd6ff@quicinc.com>
 <CAA8EJpqsxrv18xH=GREm75EXD62bDS7d0diMtbNOHuEX-4hD6A@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqsxrv18xH=GREm75EXD62bDS7d0diMtbNOHuEX-4hD6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: edHE6IVcFhrClvLUsY505MzPttw7woxL
X-Proofpoint-ORIG-GUID: edHE6IVcFhrClvLUsY505MzPttw7woxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-29_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304290194
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
Cc: sean@poorly.run, quic_sbillaka@quicinc.com, andersson@kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/29/2023 12:45 PM, Dmitry Baryshkov wrote:
> On Sat, 29 Apr 2023 at 11:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/28/2023 9:35 PM, Dmitry Baryshkov wrote:
>>> On 29/04/2023 07:04, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 4/28/2023 8:21 PM, Dmitry Baryshkov wrote:
>>>>> On Sat, 29 Apr 2023 at 05:50, Abhinav Kumar
>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 4/28/2023 6:41 PM, Dmitry Baryshkov wrote:
>>>>>>> On 29/04/2023 04:08, Abhinav Kumar wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 4/28/2023 5:45 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>>>>>>>>>> Legacy DPU requires PP hardware block involved into setting up DSC
>>>>>>>>>
>>>>>>>>> Nit: to be envolved
>>>>>>>>>
>>>>>>>>>> data path. This patch add DDPU_PINGPONG_DSC feature bit to both
>>>>>>>>>
>>>>>>>>> adds
>>>>>>>>>
>>>>>>>>>> PP_BLK and PP_BLK_TE so that both dpu_hw_pp_setup_dsc() and
>>>>>>>>>> dpu_hw_pp_dsc_enable() will be executed during DSC path setup.
>>>>>>>>>
>>>>>>>>> Would it be easier to add PP_BLK_NO_DSC instead and make DSC enabled
>>>>>>>>> by default for PP_BLK / PP_BLK_TE?
>>>>>>>>>
>>>>>>>>
>>>>>>>> No because for some chipsets like qcm2290, it has a ping pong block
>>>>>>>> but no DSC.
>>>>>>>
>>>>>>> And so it will use PP_BLK_NO_DSC (like msm8998 for PP_2/_3). But this
>>>>>>
>>>>>> Ok so you meant adding another PP_BLK_* macro. I mistook it for a
>>>>>> feature flag.
>>>>>>
>>>>>> This is getting a bit confusing with many PP_BLK_* variations.
>>>>>
>>>>> Yes. As I wrote it might be not the optimal solution.
>>>>>
>>>>>>
>>>>>>> might be not the optimal solution. Let's check all possible cases:
>>>>>>>
>>>>>>> - PP (or PP_TE?) with no DSC support,
>>>>>>
>>>>>> Yes correct for chipsets like qcm2290.
>>>>>>
>>>>>>> - PP/PP_TE tightly bound to the particular DSC instance, should be
>>>>>>> allocated together,
>>>>>>
>>>>>> I need to check which exact chipset does this (I recall one does) but
>>>>>> perhaps msm8998 fits here.
>>>>>
>>>>> All targets earlier than sm8150. SDE driver sets SDE_DSC_OUTPUT_CTRL
>>>>> if for v1 CTL blocks (sm8150+).
>>>>>
>>>>>>
>>>>>>> - PP/PP_TE which can use any DSC block.
>>>>>>
>>>>>> This is what DPU_PINGPONG_DSC feature flag should mean today and should
>>>>>> cover most of the DSC 1.1 chipsets present in upstream today.
>>>>>
>>>>> Then it should probably be renamed to DPU_PINGPONG_ANY_DSC
>>>>>
>>>>
>>>> Actually that "any" is incorrect. As part of the DSC pairing logic
>>>> change it will become clear but not all ping-pongs can pair with all
>>>> DSCs. So any is not right.
>>>>
>>>> This is why I think we should go with this feature flag first. Lets
>>>> identify a pattern and then work on unifying or cleaning up the
>>>> PP_BLK_* masks.
>>>
>>> Then I'd like to see the series sent together so that we don't have to
>>> be wondering in the myst. At least the RM changes might better go into
>>> this series (together with the topology changes. I think RM will depend
>>> on 1 DSC topology support).
>>
>> Topology changes depend on which way the virtual planes series is going
>> to do and since we are going with fixed topology you preferred it to be
>> dropped right?
> 
> It was not about the topology changes (e.g. supporting 1:1:1), but
> about storying the topology in the encoder.
> 

So you are suggesting drop patch 6 of this series and keep 7 OR drop 6 
and 7 both?

It looks like if 6 is dropped, then 7 has to be as well because we need 
to store topology somewhere cannot keep passing locally.

Thats why I was okay to drop 6 and 7 together.

>>
>> Now that you have seen the DSC to PP mapping code downstream you know
>> that every DSC cannot goto every ping-pong. So which way do you want to
>> go with this patch. If we are going to post a next revision, need some
>> conclusion here and I do not think PP_BLK_* was agreed as a clean
>> solution anyway.
> 
> No, it was not agreed. That's why I tried listing all possible cases
> (in an attempt to understand the limitations and/or possible
> usecases).
> 
>>
>> Thats why I suggested:
>>
>> 1) Lets go with feature flag
>> 2) When DP lands, thats the one which uses 1-1-1 topology so we can hit
>> some corner cases of lets say DP uses one DSC and then DSI uses merge we
>> should go with the right DSC pair. With only DSI, this will not arise.
>> 3) With (1) and (2) done, we can take up PP_BLK_* cleanup if we feel its
>> necessary.
>>
>> I dont see any conclusion or plan suggested by you so far on which way
>> you want to go.
> 
> I'd propose the following plan:

Thanks for summarizing what you had in mind, that makes it clear.

> - Drop all the topology and PP changes from this series. Make it add
> just DSC 1.2 support.
> 
> Then for the DSI DSC 1.2 we should be able to continue using existing
> RM/PP code with known limitations.
> 


So just keep patches 1-3 right? The issue with that is 
_setup_pingpong_ops will still get called even for DSC 1.2 with those 
changes. This was actually noted by Marijn during the catalog cleanup we 
recently merged to -fixes. Thats why we included that in this so that we 
dont call DSC 1.1 related functions for 1.2

Any specific reason why you dont want to go with patches 1-5 now and 
drop 6,7 as that depends on storing topology.

> Next:
> - Split DPU_PINGPONG_DSC feature flag to a separate patch series. It
> looks like it should have some Fixes tag, as it prevents one from
> calling *dsc functions for PPs which do not support them

We can still add the fixes tag and keep it here and move it to the front?

> - Extend the series with the RM fix which skips non-DSC-enabled PPs
> when DSC is required.
> - As this series is touching RM, it is a good place to handle DSC
> allocation issues, which includes:
>    * tight coupling of PP/DSC blocks on sdm845 and msm8998
>    * limitations for 1:1:1 or co-allocation of DSC blocks for both DSI
> and DP DSC (might be split to a separate patchset, up to you)

I am a bit confused about this. This patch is not touching RM at all 
from what I can see. So the issue of DSC pair allocation is there even 
today with or without DSC 1.2 about which DSCs pair with which ones and 
which DSCs go with which PP.

I feel that once DSC 1.2, that is just patches 1-5 land, I agree this 
can be and should be a series on its own to prepare for DP DSC.

What use-case gets broken for DSI if we land 1-5?

We are trying to expand this series for a condition which wont hit till 
DP DSC lands due to the fixed topology and only one client for DSC which 
is DSI.

> 
> DP DSC depends either on this series or on a separate patchset
> 
>>
>>>
>>> I went on and checked the SDE. It has condition that pp % 2 == dsc % 2.
>>> Does this condition apply only to "newest" DSC/PP combo (DITHER + 1.2)
>>> or to the older ones too? Are there any other conditionals?
>>>
>>
>> It was there even for older DSCs and looks like wasnt implemented in the
>> current upstream code.
> 
> Thanks for the info.
> 
> 
>>
>>
>>>>
>>>>>>> - all PP_DITHER probably support any DSC?
>>>>>>>
>>>>>>
>>>>>> No, PP_DITHER means that there is no DSC in ping-pong block. Its
>>>>>> actually DSC 1.2. From our standpoint, this is same as PP_BLK_NO_DSC
>>>>>> then as the PP blk has no DSC. This is where the confusion will come.
>>>>>
>>>>> But we should still bind the DSC to the PP block, shouldn't we? So
>>>>> from the software point of view it is the same situation: PP_DITHER
>>>>> supports any DSC (1.2) and should be bound to it.
>>>>>
>>>>
>>>> Yes, the DSC ctl will need to be programmed correctly to tell which
>>>> ping-pong but like I said, any is not right. There are some conditions.
>>>>
>>>> Please refer to _sde_rm_reserve_dsc() in downstream.
>>>>
>>>>>>> Is this list correct? If so, we'd need to be able to specify the
>>>>>>> DSC id
>>>>>>> in the PP block description.
>>>>>>>
>>>>>>
>>>>>> Is this for the PP bound to a particular DSC case? If so, the goal of
>>>>>> this is then you want to not allocate DSCs from RM for this case or
>>>>>> what
>>>>>> would be the purpose of specifying the DSC id in the ping-pong?
>>>>>
>>>>> I think it would be better to still return PP from the RM. It's that
>>>>> the RM will have to return PP/DSC in pairs.
>>>>>
>>>>
>>>> Yes, I was trying to understand what would be the purpose of this DSC
>>>> id in the ping-pong block then.
>>>>
>>>>>>
>>>>>>    From this classification, it looks like this case shall fit
>>>>>> PP_BLK_NO_DSC but we have to then migrate PP_BLK_DITHER to this as well
>>>>>> and add dither to that.
>>>>>>
>>>>>> Seems like this can be a separate effort to cleanup the PP_BLK_* macros
>>>>>> first and go with this feature flag first instead of undertaking a
>>>>>> PP_BLK_* macro cleanup in this series.
>>>>>>
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Reported-by : Marijn Suijten <marijn.suijten@somainline.org>
>>>>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>     .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 12
>>>>>>>>>> +++++-----
>>>>>>>>>>     .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 +++----
>>>>>>>>>>     .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 26
>>>>>>>>>> ++++++++++------------
>>>>>>>>>>     .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24
>>>>>>>>>> ++++++++++----------
>>>>>>>>>>     .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 26
>>>>>>>>>> ++++++++++------------
>>>>>>>>>>     .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
>>>>>>>>>>     .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
>>>>>>>>>>     .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
>>>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  8 +++----
>>>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  2 ++
>>>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  9 +++++---
>>>>>>>>>>     11 files changed, 62 insertions(+), 61 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git
>>>>>>>>>> a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>>>>>>>> index 17f821c..b7cd746 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>>>>>>>> @@ -112,16 +112,16 @@ static const struct dpu_lm_cfg
>>>>>>>>>> msm8998_lm[] = {
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>>>>>>>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0,
>>>>>>>>>> sdm845_pp_sblk_te,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), 0,
>>>>>>>>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>>>>>>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0,
>>>>>>>>>> sdm845_pp_sblk_te,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), 0,
>>>>>>>>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>>>>>>>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>>>>>>>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, 0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>>>>>>>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>>>>>>>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, 0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>>>>>>>>     };
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>>>>>>>> index ceca741..8888bd9 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>>>>>>>> @@ -110,16 +110,16 @@ static const struct dpu_lm_cfg sdm845_lm[]
>>>>>>>>>> = {
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_pingpong_cfg sdm845_pp[] = {
>>>>>>>>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0,
>>>>>>>>>> sdm845_pp_sblk_te,
>>>>>>>>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>>>>>>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0,
>>>>>>>>>> sdm845_pp_sblk_te,
>>>>>>>>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>>>>>>>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>>>>>>>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk,
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>>>>>>>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>>>>>>>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk,
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>>>>>>>>     };
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>>>>>>>>> index 42b0e58..3a7dffa 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>>>>>>>>> @@ -128,24 +128,22 @@ static const struct dpu_dspp_cfg
>>>>>>>>>> sm8150_dspp[]
>>>>>>>>>> = {
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_pingpong_cfg sm8150_pp[] = {
>>>>>>>>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>>>>>>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>>>>>>>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>>>>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>>>>>>>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>>>>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>>>>>>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>>>>>>>>> -            -1),
>>>>>>>>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>>>>>>>>> -            -1),
>>>>>>>>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2,
>>>>>>>>>> 30), -1),
>>>>>>>>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2,
>>>>>>>>>> 31), -1),
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>>>>>>>>>> diff --git
>>>>>>>>>> a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>>>>>>>> index 5bb9882..e766a2d 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>>>>>>>> @@ -116,23 +116,23 @@ static const struct dpu_lm_cfg
>>>>>>>>>> sc8180x_lm[] = {
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_pingpong_cfg sc8180x_pp[] = {
>>>>>>>>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>>>>>>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>>>>>>>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>>>>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>>>>>>>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>>>>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>>>>>>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>>>>>>>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>>>>>>>>>                 -1),
>>>>>>>>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>>>>>>>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>>>>>>>>>                 -1),
>>>>>>>>>>     };
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>>>>>>>> index ed130582..137b151 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>>>>>>>> @@ -129,24 +129,22 @@ static const struct dpu_dspp_cfg
>>>>>>>>>> sm8250_dspp[]
>>>>>>>>>> = {
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_pingpong_cfg sm8250_pp[] = {
>>>>>>>>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>>>>>>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>>>>>>>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>>>>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>>>>>>>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>>>>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>>>>>>>>                 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>>>>>>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>>>>>>>>> -            -1),
>>>>>>>>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>>>>>>>>> -            -1),
>>>>>>>>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2,
>>>>>>>>>> 30), -1),
>>>>>>>>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800,
>>>>>>>>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
>>>>>>>>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2,
>>>>>>>>>> 31), -1),
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>>>>>>>> index a46b117..e5631a2 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>>>>>>>> @@ -80,8 +80,8 @@ static const struct dpu_dspp_cfg sc7180_dspp[]
>>>>>>>>>> = {
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_pingpong_cfg sc7180_pp[] = {
>>>>>>>>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>>>>>>>>> -1, -1),
>>>>>>>>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk,
>>>>>>>>>> -1, -1),
>>>>>>>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -1, -1),
>>>>>>>>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, 0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>> -1, -1),
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_intf_cfg sc7180_intf[] = {
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>>>>>>>>> index 988d820..7b4ad0f 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>>>>>>>>> @@ -60,7 +60,7 @@ static const struct dpu_dspp_cfg sm6115_dspp[]
>>>>>>>>>> = {
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_pingpong_cfg sm6115_pp[] = {
>>>>>>>>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>>>>>>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>>             DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>>             DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>>>>>>>>     };
>>>>>>>>>> diff --git
>>>>>>>>>> a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>>>>>>>> index c9003dc..20d4d14 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>>>>>>>> @@ -57,7 +57,7 @@ static const struct dpu_dspp_cfg
>>>>>>>>>> qcm2290_dspp[] = {
>>>>>>>>>>     };
>>>>>>>>>>     static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>>>>>>>>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>>>>>>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0,
>>>>>>>>>> sdm845_pp_sblk,
>>>>>>>>>>             DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>>>>>>>>             DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>>>>>>>>     };
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>> index 91bfc8a..83c0cd9 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>> @@ -501,21 +501,21 @@ static const struct dpu_pingpong_sub_blks
>>>>>>>>>> sc7280_pp_sblk = {
>>>>>>>>>>         .intr_done = _done, \
>>>>>>>>>>         .intr_rdptr = _rdptr, \
>>>>>>>>>>         }
>>>>>>>>>> -#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done,
>>>>>>>>>> _rdptr) \
>>>>>>>>>> +#define PP_BLK_TE(_name, _id, _base, _features, _merge_3d, _sblk,
>>>>>>>>>> _done, _rdptr) \
>>>>>>>>>>         {\
>>>>>>>>>>         .name = _name, .id = _id, \
>>>>>>>>>>         .base = _base, .len = 0xd4, \
>>>>>>>>>> -    .features = PINGPONG_SDM845_SPLIT_MASK, \
>>>>>>>>>> +    .features = PINGPONG_SDM845_SPLIT_MASK | _features, \
>>>>>>>>>>         .merge_3d = _merge_3d, \
>>>>>>>>>>         .sblk = &_sblk, \
>>>>>>>>>>         .intr_done = _done, \
>>>>>>>>>>         .intr_rdptr = _rdptr, \
>>>>>>>>>>         }
>>>>>>>>>> -#define PP_BLK(_name, _id, _base, _merge_3d, _sblk, _done,
>>>>>>>>>> _rdptr) \
>>>>>>>>>> +#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk,
>>>>>>>>>> _done, _rdptr) \
>>>>>>>>>>         {\
>>>>>>>>>>         .name = _name, .id = _id, \
>>>>>>>>>>         .base = _base, .len = 0xd4, \
>>>>>>>>>> -    .features = PINGPONG_SDM845_MASK, \
>>>>>>>>>> +    .features = PINGPONG_SDM845_MASK | _features, \
>>>>>>>>>>         .merge_3d = _merge_3d, \
>>>>>>>>>>         .sblk = &_sblk, \
>>>>>>>>>>         .intr_done = _done, \
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>>>>> index fc87db1..6b49171 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>>>>> @@ -144,6 +144,7 @@ enum {
>>>>>>>>>>      * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>>>>>>>>>>      * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for
>>>>>>>>>> split
>>>>>>>>>> fifo
>>>>>>>>>>      * @DPU_PINGPONG_DITHER,    Dither blocks
>>>>>>>>>> + * @DPU_PINGPONG_DSC,        PP block binding to DSC
>>>>>>>>>>      * @DPU_PINGPONG_MAX
>>>>>>>>>>      */
>>>>>>>>>>     enum {
>>>>>>>>>> @@ -152,6 +153,7 @@ enum {
>>>>>>>>>>         DPU_PINGPONG_SPLIT,
>>>>>>>>>>         DPU_PINGPONG_SLAVE,
>>>>>>>>>>         DPU_PINGPONG_DITHER,
>>>>>>>>>> +    DPU_PINGPONG_DSC,
>>>>>>>>>>         DPU_PINGPONG_MAX
>>>>>>>>>>     };
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>>>>>>>> index 3822e06..f255a04 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>>>>>>>> @@ -264,9 +264,12 @@ static void _setup_pingpong_ops(struct
>>>>>>>>>> dpu_hw_pingpong *c,
>>>>>>>>>>         c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>>>>>>>>>>         c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>>>>>>>>>>         c->ops.get_line_count = dpu_hw_pp_get_line_count;
>>>>>>>>>> -    c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>>>>>>>>>> -    c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>>>>>>>>>> -    c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>>>>>>>>> +
>>>>>>>>>> +    if (features & BIT(DPU_PINGPONG_DSC)) {
>>>>>>>>>> +        c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>>>>>>>>>> +        c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>>>>>>>>>> +        c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>>>>>>>>> +    }
>>>>>>>>>>         if (test_bit(DPU_PINGPONG_DITHER, &features))
>>>>>>>>>>             c->ops.setup_dither = dpu_hw_pp_setup_dither;
>>>>>>>>>
>>>>>>>
>>>>>
>>>>>
>>>>>
>>>
> 
> 
> 
> --
> With best wishes
> Dmitry
